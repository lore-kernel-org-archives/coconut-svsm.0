Return-Path: <jlange@microsoft.com>
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c004::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 86048481CC
 for <svsm-devel@coconut-svsm.dev>; Tue, 15 Apr 2025 17:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHiqnDxQQa7N9fbMTaiOitwH6TvvBuNQGxIfJ+PHAiw=;
 b=hm9h8dAf71FV3n/HdxnkQWJnHb3X0q8amGWqlBYq9gwHXgRSocworc1ynP/ijQLSZUDa+MEHRYpf5R9wg64+8diMIWGeImmSSPJ1udqU4HNvkTZ/iNHPRiFM2anthyQtMMeOTlIhfhDhSrMBVjjYSnLlbvkJo/G4DcJoH8rWugY=
From: Jon Lange <jlange@microsoft.com>
Date: Tue, 15 Apr 2025 15:36:05 +0000
Message-ID: <SA6PR21MB4303DC6B9D9DDA2592D40D8ECAB22@SA6PR21MB4303.namprd21.prod.outlook.com>
References: <IA1PR12MB8285E6DDDE56B6BFDE7D2EA495B22@IA1PR12MB8285.namprd12.prod.outlook.com>
In-Reply-To: <IA1PR12MB8285E6DDDE56B6BFDE7D2EA495B22@IA1PR12MB8285.namprd12.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_SA6PR21MB4303DC6B9D9DDA2592D40D8ECAB22SA6PR21MB4303namp_"
MIME-Version: 1.0
Subject: Re: [svsm-devel] Clear the guest busy bit when Alternated Injection
 is enabled
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Wang, Huibo" <Huibo.Wang@amd.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

--_000_SA6PR21MB4303DC6B9D9DDA2592D40D8ECAB22SA6PR21MB4303namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The SVSM should always be clearing the busy bit when it decides that it is =
safe to reenter the guest.  There should be no hypervisor control of when a=
nd how this happens.  If the hypervisor encounters a busy bit error, it sho=
uld invoke the SVSM, which should take the correct action to return the gue=
st to a runnable state (or should panic if it detects that a fatal error pr=
events the guest from being runnable again).

-Jon

From: Wang, Huibo <Huibo.Wang@amd.com>
Sent: Tuesday, April 15, 2025 8:17 AM
To: svsm-devel@coconut-svsm.dev
Cc: Jon Lange <jlange@microsoft.com>; Lendacky, Thomas <Thomas.Lendacky@amd=
.com>; Kaplan, David <David.Kaplan@amd.com>
Subject: [EXTERNAL] Clear the guest busy bit when Alternated Injection is e=
nabled


[AMD Official Use Only - AMD Internal Distribution Only]

Hi,

I am currently working towards enabling Alternate Injection in Linux and Co=
conut SVSM.

When I start a guest, I hit a KVM internal error - VMEXIT_BUSY.  In guests =
that run with Alternate Injection, bit 63 of the encrypted VIntrCtrl field =
is defined as a BUSY bit. On VMRUN, if VIntrCtrl[BUSY] is set to 1, then th=
e VMRUN fails with a VMEXIT_BUSY error code. The BUSY bit enables a VMSA to=
 be temporarily marked non-runnable while software modifications are in pro=
gress.

When KVM is trying to deliver an interrupt or exception into the guest whil=
e a VMEXIT happens, then the busy bit gets set in the guest's VMSA. So VMPL=
0 needs to come in a re-inject the event to the guest.

To solve this problem, the HV should not wait for VMEXIT_BUSY.  If it sees =
that EXITINTINFO.V=3D1 on an exit and Alternate Injection is enabled, it sh=
ould invoke VMPL0 to clear the busy bit and then ask to switch to run the g=
uest which will keep running the interrupted interrupt/exception.

The question is how would we like the communication between HV and SVSM to =
look like when it comes to the HV letting the SVSM know that the guest's bu=
sy bit needs to get cleared before it runs again?

For example, should the HV explicitly set something in the HVDB page indica=
ting that the SVSM should clear its guest's busy bit or should the SVSM its=
elf always check the busy bit before running the guest and clear it if set?

Or any other, better idea?

Thanks,
Melody


--_000_SA6PR21MB4303DC6B9D9DDA2592D40D8ECAB22SA6PR21MB4303namp_
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
orgia&quot;,serif;color:blue">The SVSM should always be clearing the busy b=
it when it decides that it is safe to reenter the guest.&nbsp; There should=
 be no hypervisor control of when and how this happens.&nbsp;
 If the hypervisor encounters a busy bit error, it should invoke the SVSM, =
which should take the correct action to return the guest to a runnable stat=
e (or should panic if it detects that a fatal error prevents the guest from=
 being runnable again).<o:p></o:p></span></p>
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
<b>Sent:</b> Tuesday, April 15, 2025 8:17 AM<br>
<b>To:</b> svsm-devel@coconut-svsm.dev<br>
<b>Cc:</b> Jon Lange &lt;jlange@microsoft.com&gt;; Lendacky, Thomas &lt;Tho=
mas.Lendacky@amd.com&gt;; Kaplan, David &lt;David.Kaplan@amd.com&gt;<br>
<b>Subject:</b> [EXTERNAL] Clear the guest busy bit when Alternated Injecti=
on is enabled<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:blue">[AMD Official Use Only - AMD Internal=
 Distribution Only]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Hi,<br>
<br>
I am currently working towards enabling Alternate Injection in Linux and Co=
conut SVSM.<br>
<br>
When I start a guest, I hit a KVM internal error - VMEXIT_BUSY.&nbsp; In gu=
ests that run with Alternate Injection, bit 63 of the encrypted VIntrCtrl f=
ield is defined as a BUSY bit. On VMRUN, if VIntrCtrl[BUSY] is set to 1, th=
en the VMRUN fails with a VMEXIT_BUSY
 error code. The BUSY bit enables a VMSA to be temporarily marked non-runna=
ble while software modifications are in progress.<br>
<br>
When KVM is trying to deliver an interrupt or exception into the guest whil=
e a VMEXIT happens, then the busy bit gets set in the guest's VMSA. So VMPL=
0 needs to come in a re-inject the event to the guest.<br>
<br>
To solve this problem, the HV should not wait for VMEXIT_BUSY.&nbsp; If it =
sees that EXITINTINFO.V=3D1 on an exit and Alternate Injection is enabled, =
it should invoke VMPL0 to clear the busy bit and then ask to switch to run =
the guest which will keep running the interrupted
 interrupt/exception.<br>
<br>
The question is how would we like the communication between HV and SVSM to =
look like when it comes to the HV letting the SVSM know that the guest's bu=
sy bit needs to get cleared before it runs again?&nbsp;<br>
<br>
For example, should the HV explicitly set something in the HVDB page indica=
ting that the SVSM should clear its guest's busy bit or should the SVSM its=
elf always check the busy bit before running the guest and clear it if set?=
<br>
<br>
Or any other, better idea?<o:p></o:p></span></p>
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
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
</div>
</div>
</body>
</html>

--_000_SA6PR21MB4303DC6B9D9DDA2592D40D8ECAB22SA6PR21MB4303namp_--
