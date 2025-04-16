Return-Path: <jlange@microsoft.com>
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c004::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id EA912480FD
 for <svsm-devel@coconut-svsm.dev>; Wed, 16 Apr 2025 06:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItwS8LIHXiGTZp7bkybsc3MfSzzkFBMPBa1Apxiz5AU=;
 b=KFFIq5Ar3W/bNqe24c5fXamkLYmGeitWISdkDx3YvYjzBFtUtFN/rh2nsTXdNYN2Q91wwGRXaMxu3Oqa3oUUh8j8K9Vpswe8wi7KsZifju6vQWRA19KUsCB3KecPBK33nu6Kp8dE40/UkfLVbx/BsqHpUU7+57Wda6JCM1dKUBk=
From: Jon Lange <jlange@microsoft.com>
Date: Wed, 16 Apr 2025 04:14:19 +0000
Message-ID: <SA6PR21MB430370D59ECA9A4E9E459FCBCABD2@SA6PR21MB4303.namprd21.prod.outlook.com>
References: <IA1PR12MB8285E6DDDE56B6BFDE7D2EA495B22@IA1PR12MB8285.namprd12.prod.outlook.com>
 <SA6PR21MB4303DC6B9D9DDA2592D40D8ECAB22@SA6PR21MB4303.namprd21.prod.outlook.com>
 <LV3PR12MB92659F350EA9CF5061305DAA94B22@LV3PR12MB9265.namprd12.prod.outlook.com>
 <LV3PR12MB926568796749DEC214B674D994BD2@LV3PR12MB9265.namprd12.prod.outlook.com>
In-Reply-To: <LV3PR12MB926568796749DEC214B674D994BD2@LV3PR12MB9265.namprd12.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_SA6PR21MB430370D59ECA9A4E9E459FCBCABD2SA6PR21MB4303namp_"
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
To: "Kaplan, David" <David.Kaplan@amd.com>, "Wang, Huibo" <Huibo.Wang@amd.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

--_000_SA6PR21MB430370D59ECA9A4E9E459FCBCABD2SA6PR21MB4303namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

David, thanks for clearing up the architectural behavior.  I agree with wha=
t you say below about how to decide when VMPL 0 should be invoked.

-Jon

From: Kaplan, David <David.Kaplan@amd.com>
Sent: Tuesday, April 15, 2025 5:49 PM
To: Jon Lange <jlange@microsoft.com>; Wang, Huibo <Huibo.Wang@amd.com>; svs=
m-devel@coconut-svsm.dev
Cc: Lendacky, Thomas <Thomas.Lendacky@amd.com>
Subject: [EXTERNAL] RE: Clear the guest busy bit when Alternated Injection =
is enabled


[AMD Official Use Only - AMD Internal Distribution Only]

What I said below is wrong, please ignore it.  If the HV attempts to run a =
busy (or invalid) VMSA, it will update the exit code info in the *VMCB* but=
 not the *VMSA*.  So the error information in the VMSA does not get lost.  =
It looks like I mis-interpreted some logs, apologies for the confusion.

That said, it will still be more efficient if the HV looks at EXITINTINFO.V=
 to know to invoke VMPL0 rather than waiting for VMEXIT_BUSY.

--David Kaplan

From: Kaplan, David
Sent: Tuesday, April 15, 2025 10:59 AM
To: Jon Lange <jlange@microsoft.com<mailto:jlange@microsoft.com>>; Wang, Hu=
ibo <Huibo.Wang@amd.com<mailto:Huibo.Wang@amd.com>>; svsm-devel@coconut-svs=
m.dev<mailto:svsm-devel@coconut-svsm.dev>
Cc: Lendacky, Thomas <Thomas.Lendacky@amd.com<mailto:Thomas.Lendacky@amd.co=
m>>
Subject: RE: Clear the guest busy bit when Alternated Injection is enabled

The HV cannot wait until it sees a VMEXIT_BUSY because then the error infor=
mation about what caused the busy bit to get set becomes lost (the original=
 error gets overwritten in the guest VMSA).  I think Melody's point is that=
 if the HV sees EXITINTINFO.V=3D1 then it should know that the busy bit got=
 set and invoke VMPL0 which may need to re-inject the event that caused the=
 exit.

I don't think the HV necessarily needs to tell the SVSM to clear the guest =
busy bit, that seems like something the SVSM itself should check.

--David Kaplan

From: Jon Lange <jlange@microsoft.com<mailto:jlange@microsoft.com>>
Sent: Tuesday, April 15, 2025 10:36 AM
To: Wang, Huibo <Huibo.Wang@amd.com<mailto:Huibo.Wang@amd.com>>; svsm-devel=
@coconut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>
Cc: Lendacky, Thomas <Thomas.Lendacky@amd.com<mailto:Thomas.Lendacky@amd.co=
m>>; Kaplan, David <David.Kaplan@amd.com<mailto:David.Kaplan@amd.com>>
Subject: RE: Clear the guest busy bit when Alternated Injection is enabled


[AMD Official Use Only - AMD Internal Distribution Only]

Caution: This message originated from an External Source. Use proper cautio=
n when opening attachments, clicking links, or responding.

The SVSM should always be clearing the busy bit when it decides that it is =
safe to reenter the guest.  There should be no hypervisor control of when a=
nd how this happens.  If the hypervisor encounters a busy bit error, it sho=
uld invoke the SVSM, which should take the correct action to return the gue=
st to a runnable state (or should panic if it detects that a fatal error pr=
events the guest from being runnable again).

-Jon

From: Wang, Huibo <Huibo.Wang@amd.com<mailto:Huibo.Wang@amd.com>>
Sent: Tuesday, April 15, 2025 8:17 AM
To: svsm-devel@coconut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>
Cc: Jon Lange <jlange@microsoft.com<mailto:jlange@microsoft.com>>; Lendacky=
, Thomas <Thomas.Lendacky@amd.com<mailto:Thomas.Lendacky@amd.com>>; Kaplan,=
 David <David.Kaplan@amd.com<mailto:David.Kaplan@amd.com>>
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


--_000_SA6PR21MB430370D59ECA9A4E9E459FCBCABD2SA6PR21MB4303namp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle21
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
orgia&quot;,serif;color:blue">David, thanks for clearing up the architectur=
al behavior.&nbsp; I agree with what you say below about how to decide when=
 VMPL 0 should be invoked.<o:p></o:p></span></p>
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
font-family:&quot;Calibri&quot;,sans-serif"> Kaplan, David &lt;David.Kaplan=
@amd.com&gt;
<br>
<b>Sent:</b> Tuesday, April 15, 2025 5:49 PM<br>
<b>To:</b> Jon Lange &lt;jlange@microsoft.com&gt;; Wang, Huibo &lt;Huibo.Wa=
ng@amd.com&gt;; svsm-devel@coconut-svsm.dev<br>
<b>Cc:</b> Lendacky, Thomas &lt;Thomas.Lendacky@amd.com&gt;<br>
<b>Subject:</b> [EXTERNAL] RE: Clear the guest busy bit when Alternated Inj=
ection is enabled<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:blue">[AMD Official Use Only - AMD Internal=
 Distribution Only]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">What I said below is wrong, please ignore it.&nbsp; I=
f the HV attempts to run a busy (or invalid) VMSA, it will update the exit =
code info in the *<b>VMCB</b>* but not the *<b>VMSA</b>*.&nbsp;
 So the error information in the VMSA does not get lost.&nbsp; It looks lik=
e I mis-interpreted some logs, apologies for the confusion.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">That said, it will still be more efficient if the HV =
looks at EXITINTINFO.V to know to invoke VMPL0 rather than waiting for VMEX=
IT_BUSY.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">--David Kaplan<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Kaplan, David
<br>
<b>Sent:</b> Tuesday, April 15, 2025 10:59 AM<br>
<b>To:</b> Jon Lange &lt;<a href=3D"mailto:jlange@microsoft.com">jlange@mic=
rosoft.com</a>&gt;; Wang, Huibo &lt;<a href=3D"mailto:Huibo.Wang@amd.com">H=
uibo.Wang@amd.com</a>&gt;;
<a href=3D"mailto:svsm-devel@coconut-svsm.dev">svsm-devel@coconut-svsm.dev<=
/a><br>
<b>Cc:</b> Lendacky, Thomas &lt;<a href=3D"mailto:Thomas.Lendacky@amd.com">=
Thomas.Lendacky@amd.com</a>&gt;<br>
<b>Subject:</b> RE: Clear the guest busy bit when Alternated Injection is e=
nabled<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">The HV cannot wait until it sees a VMEXIT_BUSY becaus=
e then the error information about what caused the busy bit to get set beco=
mes lost (the original error gets overwritten
 in the guest VMSA).&nbsp; I think Melody&#8217;s point is that if the HV s=
ees EXITINTINFO.V=3D1 then it should know that the busy bit got set and inv=
oke VMPL0 which may need to re-inject the event that caused the exit.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">I don&#8217;t think the HV necessarily needs to tell =
the SVSM to clear the guest busy bit, that seems like something the SVSM it=
self should check.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">--David Kaplan<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Jon Lange &lt;<a href=3D"mailt=
o:jlange@microsoft.com">jlange@microsoft.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, April 15, 2025 10:36 AM<br>
<b>To:</b> Wang, Huibo &lt;<a href=3D"mailto:Huibo.Wang@amd.com">Huibo.Wang=
@amd.com</a>&gt;;
<a href=3D"mailto:svsm-devel@coconut-svsm.dev">svsm-devel@coconut-svsm.dev<=
/a><br>
<b>Cc:</b> Lendacky, Thomas &lt;<a href=3D"mailto:Thomas.Lendacky@amd.com">=
Thomas.Lendacky@amd.com</a>&gt;; Kaplan, David &lt;<a href=3D"mailto:David.=
Kaplan@amd.com">David.Kaplan@amd.com</a>&gt;<br>
<b>Subject:</b> RE: Clear the guest busy bit when Alternated Injection is e=
nabled<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:blue">[AMD Official Use Only - AMD Internal=
 Distribution Only]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"left" width=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"background:#FFB900;padding:5.0pt 2.0pt 5.0pt 2.0pt"></td>
<td width=3D"100%" style=3D"width:100.0%;background:#FFF8E5;padding:5.0pt 4=
.0pt 5.0pt 12.0pt">
<div>
<p class=3D"MsoNormal" style=3D"mso-element:frame;mso-element-frame-hspace:=
2.25pt;mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-el=
ement-anchor-horizontal:column;mso-height-rule:exactly">
<b><span style=3D"color:#222222">Caution:</span></b><span style=3D"color:#2=
22222"> This message originated from an External Source. Use proper caution=
 when opening attachments, clicking links, or responding.
<o:p></o:p></span></p>
</div>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
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
font-family:&quot;Calibri&quot;,sans-serif"> Wang, Huibo &lt;<a href=3D"mai=
lto:Huibo.Wang@amd.com">Huibo.Wang@amd.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, April 15, 2025 8:17 AM<br>
<b>To:</b> <a href=3D"mailto:svsm-devel@coconut-svsm.dev">svsm-devel@coconu=
t-svsm.dev</a><br>
<b>Cc:</b> Jon Lange &lt;<a href=3D"mailto:jlange@microsoft.com">jlange@mic=
rosoft.com</a>&gt;; Lendacky, Thomas &lt;<a href=3D"mailto:Thomas.Lendacky@=
amd.com">Thomas.Lendacky@amd.com</a>&gt;; Kaplan, David &lt;<a href=3D"mail=
to:David.Kaplan@amd.com">David.Kaplan@amd.com</a>&gt;<br>
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
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_SA6PR21MB430370D59ECA9A4E9E459FCBCABD2SA6PR21MB4303namp_--
