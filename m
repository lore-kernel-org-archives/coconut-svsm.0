Return-Path: <jlange@microsoft.com>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::726])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 1CB5543205
 for <svsm-devel@coconut-svsm.dev>; Mon, 17 Mar 2025 17:40:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZH4Bskbh/4YvUWVP/j9cNzKl/ZhBYRcf5tkPL5ZfJHM=;
 b=VlZMBoSFlShwDr8rsYbLpsjl4HkyZV1BX1vj3hfnb4E/cyVZqDGn5lzxW6hIjIcXpebKtYDmmcQeFmrUf+Z3IpdDhmbMi008Hz11zrAPE2QxZz3tB9zUNKcbipvTtVjzqs9RHa1/b9pHMtNOl6DUrxrbhSl+E32FYe9DS/D6wSg=
From: Jon Lange <jlange@microsoft.com>
Date: Mon, 17 Mar 2025 16:40:32 +0000
Message-ID: <SA6PR21MB4303571237C97EDEE882C8E9CADF2@SA6PR21MB4303.namprd21.prod.outlook.com>
References: <IA1PR12MB8285CF6764F2D64ADD18890695DD2@IA1PR12MB8285.namprd12.prod.outlook.com>
In-Reply-To: <IA1PR12MB8285CF6764F2D64ADD18890695DD2@IA1PR12MB8285.namprd12.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_SA6PR21MB4303571237C97EDEE882C8E9CADF2SA6PR21MB4303namp_"
MIME-Version: 1.0
Subject: Re: [svsm-devel] Missing X2APIC registers handling in SVSM APIC
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Wang, Huibo" <Huibo.Wang@amd.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

--_000_SA6PR21MB4303571237C97EDEE882C8E9CADF2SA6PR21MB4303namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The Alternate Injection protocol is not designed to be a complete APIC emul=
ation protocol, but provides only those services required for Alternate Inj=
ection.  Guests that understand how to use the Alternate Injection protocol=
 are expected to understand which APIC registers are associated with that p=
rotocol and which are managed elsewhere (like host AIPC MSR emulation).  If=
 you think the spec is not clear enough on which APIC registers these are, =
I can add additional information.

I believe the spec is clear that timer emulation is not an inherent part of=
 the Alternate Injection protocol (this is optional, and the protocol inclu=
des a feature query mechanism where this support could be discovered if it =
is ever implemented).  This means that none of the timer registers, includi=
ng the two that you identify below, are supported over the protocol.  A gue=
st using the Alternate Injection protocol should rout timer MSR accesses to=
 the host.

The Spurious Vector register is largely irrelevant in any virtualized APIC =
(because the hardware race conditions that can lead to spurious delivery si=
mply do not exist in a virtualized environment), and the only reason it is =
ever accessed is because the hardware specification defines it.  Interestin=
gly, KVM requires a VM to configure the Spurious Vector register exactly as=
 the specification requires, while Hyper-V ignores it, and this difference =
just appeared as a COCONUT-SVSM bug last week.  It's reasonable for the SVS=
M to implement the Spurious Vector Register just to provide better support =
for OVMF, so I can prepare a PR to fix this, but it would also be reasonabl=
e for OVMF to route accesses to this MSR directly to the host, since its co=
ntents don't really matter anyway.

-Jon

From: Wang, Huibo <Huibo.Wang@amd.com>
Sent: Saturday, March 15, 2025 4:40 PM
To: svsm-devel@coconut-svsm.dev
Cc: Jon Lange <jlange@microsoft.com>; Lendacky, Thomas <Thomas.Lendacky@amd=
.com>; Joerg Roedel <jroedel@suse.de>
Subject: [EXTERNAL] Missing X2APIC registers handling in SVSM APIC


[AMD Official Use Only - AMD Internal Distribution Only]

Hi,

When I am testing SVSM with Alternate Injection enabled, there are three X2=
APIC registers not implemented in SVSM which is within 0x800-0x8FF (Spuriou=
s Interrupt Vector Register-0x80F, Timer Local Vector Table Entry-0x832 and=
 Timer Initial Count Register-0x838).
But they are accessed from OVMF, what should we do about them?


Thanks,
Melody

--_000_SA6PR21MB4303571237C97EDEE882C8E9CADF2SA6PR21MB4303namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:Georgia;
	panose-1:2 4 5 2 5 4 5 2 3 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Georgia",serif;
	color:blue;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">The Alternate Injection protocol is not desig=
ned to be a complete APIC emulation protocol, but provides only those servi=
ces required for Alternate Injection.&nbsp; Guests
 that understand how to use the Alternate Injection protocol are expected t=
o understand which APIC registers are associated with that protocol and whi=
ch are managed elsewhere (like host AIPC MSR emulation).&nbsp; If you think=
 the spec is not clear enough on which
 APIC registers these are, I can add additional information.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">I believe the spec is clear that timer emulat=
ion is not an inherent part of the Alternate Injection protocol (this is op=
tional, and the protocol includes a feature query
 mechanism where this support could be discovered if it is ever implemented=
).&nbsp; This means that none of the timer registers, including the two tha=
t you identify below, are supported over the protocol.&nbsp; A guest using =
the Alternate Injection protocol should rout
 timer MSR accesses to the host.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">The Spurious Vector register is largely irrel=
evant in any virtualized APIC (because the hardware race conditions that ca=
n lead to spurious delivery simply do not exist
 in a virtualized environment), and the only reason it is ever accessed is =
because the hardware specification defines it.&nbsp; Interestingly, KVM req=
uires a VM to configure the Spurious Vector register exactly as the specifi=
cation requires, while Hyper-V ignores
 it, and this difference just appeared as a COCONUT-SVSM bug last week.&nbs=
p; It&#8217;s reasonable for the SVSM to implement the Spurious Vector Regi=
ster just to provide better support for OVMF, so I can prepare a PR to fix =
this, but it would also be reasonable for OVMF
 to route accesses to this MSR directly to the host, since its contents don=
&#8217;t really matter anyway.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">-Jon<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Wang, Huibo &lt;Huibo.Wang@amd=
.com&gt;
<br>
<b>Sent:</b> Saturday, March 15, 2025 4:40 PM<br>
<b>To:</b> svsm-devel@coconut-svsm.dev<br>
<b>Cc:</b> Jon Lange &lt;jlange@microsoft.com&gt;; Lendacky, Thomas &lt;Tho=
mas.Lendacky@amd.com&gt;; Joerg Roedel &lt;jroedel@suse.de&gt;<br>
<b>Subject:</b> [EXTERNAL] Missing X2APIC registers handling in SVSM APIC <=
o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:blue">[AMD Official Use Only - AMD Internal=
 Distribution Only]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Hi,<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">When I am testing SVSM w=
ith Alternate Injection enabled, there are three X2APIC registers not imple=
mented in SVSM which is within 0x800-0x8FF (Spurious Interrupt Vector Regis=
ter-0x80F, Timer Local Vector Table
 Entry-0x832 and Timer Initial Count Register-0x838).&nbsp;<o:p></o:p></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">But they are accessed fr=
om OVMF, what should we do about them?&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Thanks,<o:p></o:p></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Melody<o:p></o:p></span>=
</p>
</div>
</div>
</div>
</body>
</html>

--_000_SA6PR21MB4303571237C97EDEE882C8E9CADF2SA6PR21MB4303namp_--
