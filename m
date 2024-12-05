Return-Path: <Huibo.Wang@amd.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::627])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 7358C2C2A19
 for <svsm-devel@coconut-svsm.dev>; Thu,  5 Dec 2024 22:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgKzKX6nIKtPK3zOpGFL1KuXmumkxyo0YfS5ZKBg86A=;
 b=KBmUp3dzdA/Qd/2UyEpzrjM/A1gNwY7bfTztT2ISVah/B3ddgABUc0p/3XiN7K9Jg7LgR/fjCjsM5YUUcVvPD7YT3X81tyP3g2Fij/qi0xpmuQaUg4br8XkverB9YnGxspz9O0pDrderAGtbR+sBHk0Dm/ER1Z/ogynjJM0CHyg=
From: "Wang, Huibo" <Huibo.Wang@amd.com>
Date: Thu, 5 Dec 2024 21:20:17 +0000
Message-ID: <IA1PR12MB8285AD865E4EFAE962C7A3FB95302@IA1PR12MB8285.namprd12.prod.outlook.com>
References: <mailman.137.1715929719.1000.svsm-devel@coconut-svsm.dev>
 <IA1PR12MB8285AF49FE3789017C84BF89955A2@IA1PR12MB8285.namprd12.prod.outlook.com>
 <PH7PR21MB309362C313A66A5B72D172BBCA5B2@PH7PR21MB3093.namprd21.prod.outlook.com>
 <IA1PR12MB82851FC1C60C25A2CA7BBC93955B2@IA1PR12MB8285.namprd12.prod.outlook.com>
 <IA1PR12MB8285EE6EB27BD5E778D0094995372@IA1PR12MB8285.namprd12.prod.outlook.com>
 <SJ1PR21MB3760CC4277B44AC098BA6D14CA302@SJ1PR21MB3760.namprd21.prod.outlook.com>
In-Reply-To: <SJ1PR21MB3760CC4277B44AC098BA6D14CA302@SJ1PR21MB3760.namprd21.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_IA1PR12MB8285AD865E4EFAE962C7A3FB95302IA1PR12MB8285namp_"
MIME-Version: 1.0
Subject: Re: [svsm-devel] Alternate Injection spec question
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Jon Lange <jlange@microsoft.com>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, Joerg Roedel <jroedel@suse.de>, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>

--_000_IA1PR12MB8285AD865E4EFAE962C7A3FB95302IA1PR12MB8285namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Thanks a lot, perhaps the spec should be extended with that info as it is n=
ot obvious at the moment.

Thanks,
Melody

________________________________
From: Jon Lange <jlange@microsoft.com>
Sent: Wednesday, December 4, 2024 9:01 PM
To: Wang, Huibo <Huibo.Wang@amd.com>
Cc: svsm-devel@coconut-svsm.dev <svsm-devel@coconut-svsm.dev>; Joerg Roedel=
 <jroedel@suse.de>; Lendacky, Thomas <Thomas.Lendacky@amd.com>
Subject: RE: Alternate Injection spec question


[AMD Official Use Only - AMD Internal Distribution Only]


Melody,



As stated in the spec, Alternate Injection can only provide strong security=
 guarantees if it is active from the first instruction of the guest firmwar=
e.  This means that the firmware cannot negotiate the use of Alternate Inje=
ction =96 it must already be active by the time firmware starts executing. =
 The expectation is that there is a strong coupling between the SVSM image =
and the firmware image =96 after all, the initial launch measurements alway=
s include both, so it is reasonable to assume that the SVSM has knowledge o=
f how the embedded firmware is going to operate.  Therefore, the SVSM must =
be configured to configure Alternate Injection based on the design of the f=
irmware.  If the firmware is capable of using Alternate Injection, then the=
 SVSM should configure the initial guest VMSA to enable Alternate Injection=
.  Any firmware image that is capable of using Alternate Injection should b=
e smart enough to read SEV_FEATURES to detect whether it is enabled and to =
call the SVSM to disable Alternate Injection if it doesn=92t want the featu=
re enabled.  On the other hand, if the firmware is not capable of using Alt=
ernate Injection, then the SVSM should create the initial guest VMSA withou=
t enabling Alternate Injection.



To put it another way, more closely related to the spec language, the SVSM =
is supposed to know what the =93first component=94 is, and what that first =
component expects, and the SVSM is supposed to be built with that configura=
tion in mind.



Regarding INIT/SIPI =96 I think you are correct; the spec is missing the wo=
rd =93not=94.  INIT/SIPI should only be used by the guest if it knows that =
the SVSM APIC supports INIT/SIPI.



-Jon



From: Wang, Huibo <Huibo.Wang@amd.com>
Sent: Tuesday, December 3, 2024 10:20 PM
To: Jon Lange <jlange@microsoft.com>
Cc: svsm-devel@coconut-svsm.dev; Joerg Roedel <jroedel@suse.de>; Lendacky, =
Thomas <Thomas.Lendacky@amd.com>
Subject: [EXTERNAL] Re: Alternate Injection spec question



You don't often get email from huibo.wang@amd.com<mailto:huibo.wang@amd.com=
>. Learn why this is important<https://aka.ms/LearnAboutSenderIdentificatio=
n>

[AMD Official Use Only - AMD Internal Distribution Only]



Hi Jon,



I have a couple questions about the spec.



1.  For the mechanism transferring control from guest firmware to guest OS,
   from the flow I read, I wonder how the firmware (first component) can
   register the use of Alternate Injection.

   I see there are 3 forms of the SVSM_APIC_CONFIGURE_EMULATION call:

    1. ECX[1:0] =3D 0b00, disable Alternate Injection if reg count =3D=3D 0
    2. ECX[1:0] =3D 0b01, deregister the guest, if reg_count =3D=3D 0, disa=
ble AI
    3. ECX[1:0] =3D 0b10, register the guest, no change to AI setting

So how does the firmware (first component) register? Or, could you help me
understand how do you envision this process to happen?

There's text related to that in the beginning of the spec:

"The SVSM is required to have knowledge of whether the first component that
executes can support the Alternate Injection protocol. If the SVSM does not
know that the first component to execute will support the SVSM APIC Protoco=
l,
then it must not enable Alternate Injection in the guest VMSA. If the SVSM
does know that the first component to execute will support the SVSM APIC
Protocol, then it will enable Alternate Injection prior to the first guest
entry; the first guest component must either make use of the protocol or it
must request that the protocol be disabled."

I *think* this "make use of the protocol" is how you want the SVSM to detec=
t
that the first component is going to use AI and I think that "make use" is =
by
doing SVSM_APIC_CONFIGURE_EMULATION but as far as I'm reading it, I can't f=
ind
an ECX[1:0] setting which says, "I'm the first component, I'm going to use
AI"?

Or do you mean the first component should use some other SVSM APIC protocol
call like SVSM_APIC_QUERY_FEATURES, for example?

2. In SVSM APIC Protocol - Query Features section,

   "Bit 1 indicates support for INIT and SIPI delivery. If INIT and SIPI
   delivery are not supported, the guest may use INIT and SIPI signals to
   start additional vCPUs within the invoking VMPL.  Note that even if INIT
   and SIPI are supported, the guest must still use the VMSA creation calls=
 of
   the SVSM Core Protocol to start additional vCPUs so that the Calling Are=
a
   address for each vCPU can be configured correctly."

Is it possible that the marked here means "may not use" instead of "may use=
"?



Thanks,

Melody





________________________________

From: Wang, Huibo
Sent: Wednesday, November 13, 2024 5:42 PM
To: Jon Lange <jlange@microsoft.com<mailto:jlange@microsoft.com>>
Cc: svsm-devel@coconut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev> <svsm-d=
evel@coconut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>>; Joerg Roedel <j=
roedel@suse.de<mailto:jroedel@suse.de>>; Lendacky, Thomas <Thomas.Lendacky@=
amd.com<mailto:Thomas.Lendacky@amd.com>>
Subject: Alternate Injection spec question



Hi Jon,

Yeah, the one I have is version of May, thank you for the update.

Thanks
Melody

-----Original Message-----
From: Jon Lange <jlange@microsoft.com<mailto:jlange@microsoft.com>>
Sent: Wednesday, November 13, 2024 5:23 PM
To: Wang, Huibo <Huibo.Wang@amd.com<mailto:Huibo.Wang@amd.com>>
Cc: svsm-devel@coconut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>; Joerg =
Roedel <jroedel@suse.de<mailto:jroedel@suse.de>>; Lendacky, Thomas <Thomas.=
Lendacky@amd.com<mailto:Thomas.Lendacky@amd.com>>
Subject: RE: Svsm-devel Digest, Vol 10, Issue 19

[AMD Official Use Only - AMD Internal Distribution Only]

I think you have an old version of the spec.  The latest version (attached)=
 has all five calls.

-Jon

-----Original Message-----
From: Wang, Huibo <Huibo.Wang@amd.com<mailto:Huibo.Wang@amd.com>>
Sent: Wednesday, November 13, 2024 12:32 PM
To: Jon Lange <jlange@microsoft.com<mailto:jlange@microsoft.com>>
Cc: svsm-devel@coconut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>; Joerg =
Roedel <jroedel@suse.de<mailto:jroedel@suse.de>>; Lendacky, Thomas <Thomas.=
Lendacky@amd.com<mailto:Thomas.Lendacky@amd.com>>
Subject: [EXTERNAL] RE: Svsm-devel Digest, Vol 10, Issue 19

[You don't often get email from huibo.wang@amd.com<mailto:huibo.wang@amd.co=
m>. Learn why this is important at https://aka.ms/LearnAboutSenderIdentific=
ation ]

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Jon,

For SVSM APIC Protocol changes, there are 4 listed in the spec, SVSM_APIC_Q=
UERY_FEATURES, SVSM_APIC_READ_REGISTER, SVSM_APIC_WRITE_REGISTER, SVSM_APIC=
_CONFIGURE_VECTOR. In the coconut svsm github, there is one more "const SVS=
M_REQ_APIC_CONFIGURE: u32 =3D 1", should this one also be included in the s=
pec?

Thanks
Melody

-----Original Message-----
From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev<mailto:svsm-devel-bou=
nces@coconut-svsm.dev>> On Behalf Of svsm-devel-request@coconut-svsm.dev<ma=
ilto:svsm-devel-request@coconut-svsm.dev>
Sent: Friday, May 17, 2024 12:09 AM
To: svsm-devel@coconut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>
Subject: Svsm-devel Digest, Vol 10, Issue 19

Send Svsm-devel mailing list submissions to
        svsm-devel@coconut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>

To subscribe or unsubscribe via the World Wide Web, visit
        https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
or, via email, send a message with subject or body 'help' to
        svsm-devel-request@coconut-svsm.dev<mailto:svsm-devel-request@cocon=
ut-svsm.dev>

You can reach the person managing the list at
        svsm-devel-owner@coconut-svsm.dev<mailto:svsm-devel-owner@coconut-s=
vsm.dev>

When replying, please edit your Subject line so it is more specific than "R=
e: Contents of Svsm-devel digest..."


Today's Topics:

   1. RFC: Alternate Injection SVSM support (Jon Lange)


----------------------------------------------------------------------

Message: 1
Date: Fri, 17 May 2024 04:40:24 +0000
From: Jon Lange <jlange@microsoft.com<mailto:jlange@microsoft.com>>
To: "amd-sev-snp@lists.suse.com<mailto:amd-sev-snp@lists.suse.com>" <amd-se=
v-snp@lists.suse.com<mailto:amd-sev-snp@lists.suse.com>>,
        "svsm-devel@coconut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>" <=
svsm-devel@coconut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>>
Subject: [svsm-devel] RFC: Alternate Injection SVSM support
Message-ID:
        <DS7PR21MB352462BA31B209F93F296A17CAEE2@DS7PR21MB3524.namprd21.prod=
.outlook.com<mailto:DS7PR21MB352462BA31B209F93F296A17CAEE2@DS7PR21MB3524.na=
mprd21.prod.outlook.com>>

Content-Type: text/plain; charset=3D"us-ascii"

Attached is a specification I am proposing to handle support for Alternate =
Injection in SNP guests through the use of an SVSM.  This document proposes=
 changes to the AMD GHCB specification and to the AMD SVSM specification to=
 enable the negotiation required to make Alternate Injection work correctly=
.

Support for this protocol will not be possible in KVM until KVM is able to =
include native support for multiple VMPLs with separate interrupt sources f=
or each.  That work is underway elsewhere, and my expectation is that this =
proposed specification will align with the capabilities that KVM will be in=
troducing as part of the multi-VMPL support.

I will be submitting changes to COCONUT-SVSM to implement this protocol.  I=
 welcome all feedback to the spec, and will update the code to match whatev=
er spec changes are agreed upon.

-Jon



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://mail.8bytes.org/pipermail/svsm-devel/attachments/20240517/e74a=
eb2f/attachment.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Alternate Injection Support for SEV-SNP 20240513.pdf
Type: application/pdf
Size: 114718 bytes
Desc: Alternate Injection Support for SEV-SNP 20240513.pdf
URL: <http://mail.8bytes.org/pipermail/svsm-devel/attachments/20240517/e74a=
eb2f/attachment.pdf>

------------------------------

Subject: Digest Footer

Svsm-devel mailing list
Svsm-devel@coconut-svsm.dev<mailto:Svsm-devel@coconut-svsm.dev>
https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel


------------------------------

End of Svsm-devel Digest, Vol 10, Issue 19
******************************************

--_000_IA1PR12MB8285AD865E4EFAE962C7A3FB95302IA1PR12MB8285namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Jon,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks a lot, perhaps the spec should be extended with that info as it is n=
ot obvious at the moment.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Melody</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Jon Lange &lt;jlange@=
microsoft.com&gt;<br>
<b>Sent:</b> Wednesday, December 4, 2024 9:01 PM<br>
<b>To:</b> Wang, Huibo &lt;Huibo.Wang@amd.com&gt;<br>
<b>Cc:</b> svsm-devel@coconut-svsm.dev &lt;svsm-devel@coconut-svsm.dev&gt;;=
 Joerg Roedel &lt;jroedel@suse.de&gt;; Lendacky, Thomas &lt;Thomas.Lendacky=
@amd.com&gt;<br>
<b>Subject:</b> RE: Alternate Injection spec question</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
@font-face
	{font-family:Aptos}
@font-face
	{font-family:Georgia}
@font-face
	{font-family:Consolas}
@font-face
	{font-family:"Segoe UI"}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif}
a:link, span.x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
pre
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New"}
span.x_HTMLPreformattedChar
	{font-family:Consolas}
span.x_EmailStyle22
	{font-family:"Georgia",serif;
	color:blue}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
-->
</style>
<div lang=3D"EN-US" style=3D"word-wrap:break-word">
<p align=3D"Left" style=3D"font-family:Calibri; font-size:10pt; color:#0000=
FF; margin:5pt; font-style:normal; font-weight:normal; text-decoration:none=
">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal"><span style=3D"font-size:10.0pt; font-family:&quot=
;Georgia&quot;,serif; color:blue">Melody,</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:10.0pt; font-family:&quot=
;Georgia&quot;,serif; color:blue">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:10.0pt; font-family:&quot=
;Georgia&quot;,serif; color:blue">As stated in the spec, Alternate Injectio=
n can only provide strong security guarantees if it is active from the firs=
t instruction of the guest firmware.&nbsp; This means
 that the firmware cannot negotiate the use of Alternate Injection =96 it m=
ust already be active by the time firmware starts executing.&nbsp; The expe=
ctation is that there is a strong coupling between the SVSM image and the f=
irmware image =96 after all, the initial
 launch measurements always include both, so it is reasonable to assume tha=
t the SVSM has knowledge of how the embedded firmware is going to operate.&=
nbsp; Therefore, the SVSM must be configured to configure Alternate Injecti=
on based on the design of the firmware.&nbsp;
 If the firmware is capable of using Alternate Injection, then the SVSM sho=
uld configure the initial guest VMSA to enable Alternate Injection.&nbsp; A=
ny firmware image that is capable of using Alternate Injection should be sm=
art enough to read SEV_FEATURES to detect
 whether it is enabled and to call the SVSM to disable Alternate Injection =
if it doesn=92t want the feature enabled.&nbsp; On the other hand, if the f=
irmware is not capable of using Alternate Injection, then the SVSM should c=
reate the initial guest VMSA without enabling
 Alternate Injection.</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:10.0pt; font-family:&quot=
;Georgia&quot;,serif; color:blue">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:10.0pt; font-family:&quot=
;Georgia&quot;,serif; color:blue">To put it another way, more closely relat=
ed to the spec language, the SVSM is supposed to know what the =93first com=
ponent=94 is, and what that first component expects,
 and the SVSM is supposed to be built with that configuration in mind.</spa=
n></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:10.0pt; font-family:&quot=
;Georgia&quot;,serif; color:blue">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:10.0pt; font-family:&quot=
;Georgia&quot;,serif; color:blue">Regarding INIT/SIPI =96 I think you are c=
orrect; the spec is missing the word =93not=94.&nbsp; INIT/SIPI should only=
 be used by the guest if it knows that the SVSM APIC supports
 INIT/SIPI.</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:10.0pt; font-family:&quot=
;Georgia&quot;,serif; color:blue">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:10.0pt; font-family:&quot=
;Georgia&quot;,serif; color:blue">-Jon</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:10.0pt; font-family:&quot=
;Georgia&quot;,serif; color:blue">&nbsp;</span></p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b><span style=3D"font-size:11.0pt; font-family:&q=
uot;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0=
pt; font-family:&quot;Calibri&quot;,sans-serif"> Wang, Huibo &lt;Huibo.Wang=
@amd.com&gt;
<br>
<b>Sent:</b> Tuesday, December 3, 2024 10:20 PM<br>
<b>To:</b> Jon Lange &lt;jlange@microsoft.com&gt;<br>
<b>Cc:</b> svsm-devel@coconut-svsm.dev; Joerg Roedel &lt;jroedel@suse.de&gt=
;; Lendacky, Thomas &lt;Thomas.Lendacky@amd.com&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: Alternate Injection spec question</span></p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<table class=3D"x_MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" align=3D"left" width=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td width=3D"0" style=3D"width:.3pt; background:#A6A6A6; padding:5.25pt 1.5=
pt 5.25pt 1.5pt">
</td>
<td width=3D"100%" style=3D"width:100.0%; background:#EAEAEA; padding:5.25p=
t 3.75pt 5.25pt 11.25pt; background:revert!important; border:revert!importa=
nt; bottom:revert!important; color:revert!important; direction:revert!impor=
tant; display:revert!important; font-size:revert!important; height:revert!i=
mportant; letter-spacing:revert!important; line-height:revert!important; ma=
rgin:revert!important; opacity:revert!important; order:revert!important; ou=
tline:revert!important; overflow:revert!important; padding:revert!important=
; position:revert!important; tab-size:revert!important; table-layout:revert=
!important; text-align:revert!important; text-indent:revert!important; text=
-orientation:revert!important; text-overflow:revert!important; text-transfo=
rm:revert!important; top:revert!important; vertical-align:revert!important;=
 visibility:revert!important; white-space:revert!important; width:revert!im=
portant; word-break:revert!important; word-spacing:revert!important; writin=
g-mode:revert!important; zoom:revert!important">
<div>
<p class=3D"x_MsoNormal" style=3D""><span style=3D"font-size:9.0pt; font-fa=
mily:&quot;Segoe UI&quot;,sans-serif; color:#212121">You don't often get em=
ail from
<a href=3D"mailto:huibo.wang@amd.com">huibo.wang@amd.com</a>. <a href=3D"ht=
tps://aka.ms/LearnAboutSenderIdentification" data-auth=3D"NotApplicable">
Learn why this is important</a> </span></p>
</div>
</td>
<td width=3D"75" style=3D"width:56.25pt; background:#EAEAEA; padding:5.25pt=
 3.75pt 5.25pt 3.75pt; background:revert!important; border:revert!important=
; bottom:revert!important; color:revert!important; direction:revert!importa=
nt; display:revert!important; font-size:revert!important; height:revert!imp=
ortant; letter-spacing:revert!important; line-height:revert!important; marg=
in:revert!important; opacity:revert!important; order:revert!important; outl=
ine:revert!important; overflow:revert!important; padding:revert!important; =
position:revert!important; tab-size:revert!important; table-layout:revert!i=
mportant; text-align:revert!important; text-indent:revert!important; text-o=
rientation:revert!important; text-overflow:revert!important; text-transform=
:revert!important; top:revert!important; vertical-align:revert!important; v=
isibility:revert!important; white-space:revert!important; width:revert!impo=
rtant; word-break:revert!important; word-spacing:revert!important; writing-=
mode:revert!important; zoom:revert!important">
</td>
</tr>
</tbody>
</table>
<div>
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt; font-family:&quo=
t;Calibri&quot;,sans-serif; color:blue">[AMD Official Use Only - AMD Intern=
al Distribution Only]</span></p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"color:black">Hi Jon,&nbsp;</span></=
p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"color:black">I have a couple questi=
ons about&nbsp;the spec.&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"color:black">1. &nbsp;For the mecha=
nism transferring control from guest firmware to guest OS,&nbsp;<br>
&nbsp; &nbsp;from the flow I read, I wonder how the firmware (first compone=
nt) can<br>
&nbsp; &nbsp;register the use of Alternate Injection.<br>
<br>
&nbsp; &nbsp;I see there are 3 forms of the SVSM_APIC_CONFIGURE_EMULATION c=
all:<br>
<br>
&nbsp; &nbsp; 1. ECX[1:0] =3D 0b00, disable Alternate Injection if reg coun=
t =3D=3D 0<br>
&nbsp; &nbsp; 2. ECX[1:0] =3D 0b01, deregister the guest, if reg_count =3D=
=3D 0, disable AI<br>
&nbsp; &nbsp; 3. ECX[1:0] =3D 0b10, register the guest, no change to AI set=
ting<br>
<br>
So how does the firmware (first component) register? Or, could you help me<=
br>
understand how do you envision this process to happen?<br>
<br>
There's text related to that in the beginning of the spec:<br>
<br>
&quot;The SVSM is required to have knowledge of whether the first component=
 that<br>
executes can support the Alternate Injection protocol. If the SVSM does not=
<br>
know that the first component to execute will support the SVSM APIC Protoco=
l,<br>
then it must not enable Alternate Injection in the guest VMSA. If the SVSM<=
br>
does know that the first component to execute will support the SVSM APIC<br=
>
Protocol, then it will enable Alternate Injection prior to the first guest<=
br>
entry; the first guest component must either make use of the protocol or it=
<br>
must request that the protocol be disabled.&quot;<br>
<br>
I *think* this &quot;make use of the protocol&quot; is how you want the SVS=
M to detect<br>
that the first component is going to use AI and I think that &quot;make use=
&quot; is by<br>
doing SVSM_APIC_CONFIGURE_EMULATION but as far as I'm reading it, I can't f=
ind<br>
an ECX[1:0] setting which says, &quot;I'm the first component, I'm going to=
 use<br>
AI&quot;?<br>
<br>
Or do you mean the first component should use some other SVSM APIC protocol=
<br>
call like SVSM_APIC_QUERY_FEATURES, for example?<br>
<br>
2. In SVSM APIC Protocol - Query Features section,&nbsp;<br>
<br>
&nbsp; &nbsp;&quot;Bit 1 indicates support for INIT and SIPI delivery. If I=
NIT and SIPI<br>
&nbsp; &nbsp;delivery are not supported, the guest&nbsp;may use&nbsp;INIT a=
nd SIPI signals to<br>
&nbsp; &nbsp;start additional vCPUs within the invoking VMPL.&nbsp; Note th=
at even if INIT<br>
&nbsp; &nbsp;and SIPI are supported, the guest must still use the VMSA crea=
tion calls of<br>
&nbsp; &nbsp;the SVSM Core Protocol to start additional vCPUs so that the C=
alling Area<br>
&nbsp; &nbsp;address for each vCPU can be configured correctly.&quot;<br>
<br>
Is it possible that the marked here means &quot;may not use&quot; instead o=
f &quot;may use&quot;?</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"color:black">&nbsp;</span></p>
</div>
<div>
<pre><span style=3D"font-size:12.0pt; font-family:&quot;Aptos&quot;,sans-se=
rif; color:black">Thanks,</span></pre>
</div>
<div>
<pre><span style=3D"font-size:12.0pt; font-family:&quot;Aptos&quot;,sans-se=
rif; color:black">Melody</span></pre>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"color:black">&nbsp;</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"font-size:11.0pt; font-family:&q=
uot;Calibri&quot;,sans-serif; color:black">From:</span></b><span style=3D"f=
ont-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:black">&=
nbsp;Wang, Huibo<br>
<b>Sent:</b>&nbsp;Wednesday, November 13, 2024 5:42 PM<br>
<b>To:</b>&nbsp;Jon Lange &lt;<a href=3D"mailto:jlange@microsoft.com">jlang=
e@microsoft.com</a>&gt;<br>
<b>Cc:</b>&nbsp;<a href=3D"mailto:svsm-devel@coconut-svsm.dev">svsm-devel@c=
oconut-svsm.dev</a> &lt;<a href=3D"mailto:svsm-devel@coconut-svsm.dev">svsm=
-devel@coconut-svsm.dev</a>&gt;; Joerg Roedel &lt;<a href=3D"mailto:jroedel=
@suse.de">jroedel@suse.de</a>&gt;; Lendacky, Thomas &lt;<a href=3D"mailto:T=
homas.Lendacky@amd.com">Thomas.Lendacky@amd.com</a>&gt;<br>
<b>Subject:</b>&nbsp;Alternate Injection spec question</span> </p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt">Hi Jon,<br>
<br>
Yeah, the one I have is version of May, thank you for the update.<br>
<br>
Thanks<br>
Melody<br>
<br>
-----Original Message-----<br>
From: Jon Lange &lt;<a href=3D"mailto:jlange@microsoft.com">jlange@microsof=
t.com</a>&gt;<br>
Sent: Wednesday, November 13, 2024 5:23 PM<br>
To: Wang, Huibo &lt;<a href=3D"mailto:Huibo.Wang@amd.com">Huibo.Wang@amd.co=
m</a>&gt;<br>
Cc: <a href=3D"mailto:svsm-devel@coconut-svsm.dev">svsm-devel@coconut-svsm.=
dev</a>; Joerg Roedel &lt;<a href=3D"mailto:jroedel@suse.de">jroedel@suse.d=
e</a>&gt;; Lendacky, Thomas &lt;<a href=3D"mailto:Thomas.Lendacky@amd.com">=
Thomas.Lendacky@amd.com</a>&gt;<br>
Subject: RE: Svsm-devel Digest, Vol 10, Issue 19<br>
<br>
[AMD Official Use Only - AMD Internal Distribution Only]<br>
<br>
I think you have an old version of the spec.&nbsp; The latest version (atta=
ched) has all five calls.<br>
<br>
-Jon<br>
<br>
-----Original Message-----<br>
From: Wang, Huibo &lt;<a href=3D"mailto:Huibo.Wang@amd.com">Huibo.Wang@amd.=
com</a>&gt;<br>
Sent: Wednesday, November 13, 2024 12:32 PM<br>
To: Jon Lange &lt;<a href=3D"mailto:jlange@microsoft.com">jlange@microsoft.=
com</a>&gt;<br>
Cc: <a href=3D"mailto:svsm-devel@coconut-svsm.dev">svsm-devel@coconut-svsm.=
dev</a>; Joerg Roedel &lt;<a href=3D"mailto:jroedel@suse.de">jroedel@suse.d=
e</a>&gt;; Lendacky, Thomas &lt;<a href=3D"mailto:Thomas.Lendacky@amd.com">=
Thomas.Lendacky@amd.com</a>&gt;<br>
Subject: [EXTERNAL] RE: Svsm-devel Digest, Vol 10, Issue 19<br>
<br>
[You don't often get email from <a href=3D"mailto:huibo.wang@amd.com">huibo=
.wang@amd.com</a>. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification" data-auth=3D"NotA=
pplicable">
https://aka.ms/LearnAboutSenderIdentification</a>&nbsp;]<br>
<br>
[AMD Official Use Only - AMD Internal Distribution Only]<br>
<br>
Hi Jon,<br>
<br>
For SVSM APIC Protocol changes, there are 4 listed in the spec, SVSM_APIC_Q=
UERY_FEATURES, SVSM_APIC_READ_REGISTER, SVSM_APIC_WRITE_REGISTER, SVSM_APIC=
_CONFIGURE_VECTOR. In the coconut svsm github, there is one more &quot;cons=
t SVSM_REQ_APIC_CONFIGURE: u32 =3D 1&quot;,
 should this one also be included in the spec?<br>
<br>
Thanks<br>
Melody<br>
<br>
-----Original Message-----<br>
From: Svsm-devel &lt;<a href=3D"mailto:svsm-devel-bounces@coconut-svsm.dev"=
>svsm-devel-bounces@coconut-svsm.dev</a>&gt; On Behalf Of
<a href=3D"mailto:svsm-devel-request@coconut-svsm.dev">svsm-devel-request@c=
oconut-svsm.dev</a><br>
Sent: Friday, May 17, 2024 12:09 AM<br>
To: <a href=3D"mailto:svsm-devel@coconut-svsm.dev">svsm-devel@coconut-svsm.=
dev</a><br>
Subject: Svsm-devel Digest, Vol 10, Issue 19<br>
<br>
Send Svsm-devel mailing list submissions to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"mailto:svsm-devel@coc=
onut-svsm.dev">svsm-devel@coconut-svsm.dev</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://mail.8bytes.o=
rg/cgi-bin/mailman/listinfo/svsm-devel" data-auth=3D"NotApplicable">
https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel</a><br>
or, via email, send a message with subject or body 'help' to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"mailto:svsm-devel-req=
uest@coconut-svsm.dev">svsm-devel-request@coconut-svsm.dev</a><br>
<br>
You can reach the person managing the list at<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"mailto:svsm-devel-own=
er@coconut-svsm.dev">svsm-devel-owner@coconut-svsm.dev</a><br>
<br>
When replying, please edit your Subject line so it is more specific than &q=
uot;Re: Contents of Svsm-devel digest...&quot;<br>
<br>
<br>
Today's Topics:<br>
<br>
&nbsp;&nbsp; 1. RFC: Alternate Injection SVSM support (Jon Lange)<br>
<br>
<br>
----------------------------------------------------------------------<br>
<br>
Message: 1<br>
Date: Fri, 17 May 2024 04:40:24 +0000<br>
From: Jon Lange &lt;<a href=3D"mailto:jlange@microsoft.com">jlange@microsof=
t.com</a>&gt;<br>
To: &quot;<a href=3D"mailto:amd-sev-snp@lists.suse.com">amd-sev-snp@lists.s=
use.com</a>&quot; &lt;<a href=3D"mailto:amd-sev-snp@lists.suse.com">amd-sev=
-snp@lists.suse.com</a>&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<a href=3D"mailto:svsm-dev=
el@coconut-svsm.dev">svsm-devel@coconut-svsm.dev</a>&quot; &lt;<a href=3D"m=
ailto:svsm-devel@coconut-svsm.dev">svsm-devel@coconut-svsm.dev</a>&gt;<br>
Subject: [svsm-devel] RFC: Alternate Injection SVSM support<br>
Message-ID:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:DS7PR21MB3=
52462BA31B209F93F296A17CAEE2@DS7PR21MB3524.namprd21.prod.outlook.com">DS7PR=
21MB352462BA31B209F93F296A17CAEE2@DS7PR21MB3524.namprd21.prod.outlook.com</=
a>&gt;<br>
<br>
Content-Type: text/plain; charset=3D&quot;us-ascii&quot;<br>
<br>
Attached is a specification I am proposing to handle support for Alternate =
Injection in SNP guests through the use of an SVSM.&nbsp; This document pro=
poses changes to the AMD GHCB specification and to the AMD SVSM specificati=
on to enable the negotiation required
 to make Alternate Injection work correctly.<br>
<br>
Support for this protocol will not be possible in KVM until KVM is able to =
include native support for multiple VMPLs with separate interrupt sources f=
or each.&nbsp; That work is underway elsewhere, and my expectation is that =
this proposed specification will align
 with the capabilities that KVM will be introducing as part of the multi-VM=
PL support.<br>
<br>
I will be submitting changes to COCONUT-SVSM to implement this protocol.&nb=
sp; I welcome all feedback to the spec, and will update the code to match w=
hatever spec changes are agreed upon.<br>
<br>
-Jon<br>
<br>
<br>
<br>
-------------- next part --------------<br>
An HTML attachment was scrubbed...<br>
URL: &lt;<a href=3D"http://mail.8bytes.org/pipermail/svsm-devel/attachments=
/20240517/e74aeb2f/attachment.htm" data-auth=3D"NotApplicable">http://mail.=
8bytes.org/pipermail/svsm-devel/attachments/20240517/e74aeb2f/attachment.ht=
m</a>&gt;<br>
-------------- next part --------------<br>
A non-text attachment was scrubbed...<br>
Name: Alternate Injection Support for SEV-SNP 20240513.pdf<br>
Type: application/pdf<br>
Size: 114718 bytes<br>
Desc: Alternate Injection Support for SEV-SNP 20240513.pdf<br>
URL: &lt;<a href=3D"http://mail.8bytes.org/pipermail/svsm-devel/attachments=
/20240517/e74aeb2f/attachment.pdf" data-auth=3D"NotApplicable">http://mail.=
8bytes.org/pipermail/svsm-devel/attachments/20240517/e74aeb2f/attachment.pd=
f</a>&gt;<br>
<br>
------------------------------<br>
<br>
Subject: Digest Footer<br>
<br>
Svsm-devel mailing list<br>
<a href=3D"mailto:Svsm-devel@coconut-svsm.dev">Svsm-devel@coconut-svsm.dev<=
/a><br>
<a href=3D"https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel" dat=
a-auth=3D"NotApplicable">https://mail.8bytes.org/cgi-bin/mailman/listinfo/s=
vsm-devel</a><br>
<br>
<br>
------------------------------<br>
<br>
End of Svsm-devel Digest, Vol 10, Issue 19<br>
******************************************</span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_IA1PR12MB8285AD865E4EFAE962C7A3FB95302IA1PR12MB8285namp_--
