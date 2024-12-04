Return-Path: <Huibo.Wang@amd.com>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::60f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 53CC72C2080
 for <svsm-devel@coconut-svsm.dev>; Wed,  4 Dec 2024 07:20:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFZCBwlIDxJSl7dShtghdzzkE6qR1I+z4KqJ7l2LHv4=;
 b=xnGAoBtP9b2UoGWoI3l8+19r3CHare3xqIcr3Vfo+sQojIWiNeb/GxtCuT8Qdh83i4HLGOJq6HmFOxEtyq3bcMbxxViFb4zKQ/Wav+741/BsOfaV1dcFpysxaJG+/fqgmY8kBvI4qiFhpzYoEeCgiZRCB7KgPLNpxkOwxsxaYkU=
From: "Wang, Huibo" <Huibo.Wang@amd.com>
Date: Wed, 4 Dec 2024 06:20:28 +0000
Message-ID: <IA1PR12MB8285EE6EB27BD5E778D0094995372@IA1PR12MB8285.namprd12.prod.outlook.com>
References: <mailman.137.1715929719.1000.svsm-devel@coconut-svsm.dev>
 <IA1PR12MB8285AF49FE3789017C84BF89955A2@IA1PR12MB8285.namprd12.prod.outlook.com>
 <PH7PR21MB309362C313A66A5B72D172BBCA5B2@PH7PR21MB3093.namprd21.prod.outlook.com>
 <IA1PR12MB82851FC1C60C25A2CA7BBC93955B2@IA1PR12MB8285.namprd12.prod.outlook.com>
In-Reply-To: <IA1PR12MB82851FC1C60C25A2CA7BBC93955B2@IA1PR12MB8285.namprd12.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_IA1PR12MB8285EE6EB27BD5E778D0094995372IA1PR12MB8285namp_"
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

--_000_IA1PR12MB8285EE6EB27BD5E778D0094995372IA1PR12MB8285namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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
To: Jon Lange <jlange@microsoft.com>
Cc: svsm-devel@coconut-svsm.dev <svsm-devel@coconut-svsm.dev>; Joerg Roedel=
 <jroedel@suse.de>; Lendacky, Thomas <Thomas.Lendacky@amd.com>
Subject: Alternate Injection spec question

Hi Jon,

Yeah, the one I have is version of May, thank you for the update.

Thanks
Melody

-----Original Message-----
From: Jon Lange <jlange@microsoft.com>
Sent: Wednesday, November 13, 2024 5:23 PM
To: Wang, Huibo <Huibo.Wang@amd.com>
Cc: svsm-devel@coconut-svsm.dev; Joerg Roedel <jroedel@suse.de>; Lendacky, =
Thomas <Thomas.Lendacky@amd.com>
Subject: RE: Svsm-devel Digest, Vol 10, Issue 19

[AMD Official Use Only - AMD Internal Distribution Only]

I think you have an old version of the spec.  The latest version (attached)=
 has all five calls.

-Jon

-----Original Message-----
From: Wang, Huibo <Huibo.Wang@amd.com>
Sent: Wednesday, November 13, 2024 12:32 PM
To: Jon Lange <jlange@microsoft.com>
Cc: svsm-devel@coconut-svsm.dev; Joerg Roedel <jroedel@suse.de>; Lendacky, =
Thomas <Thomas.Lendacky@amd.com>
Subject: [EXTERNAL] RE: Svsm-devel Digest, Vol 10, Issue 19

[You don't often get email from huibo.wang@amd.com. Learn why this is impor=
tant at https://aka.ms/LearnAboutSenderIdentification ]

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
From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of svsm-de=
vel-request@coconut-svsm.dev
Sent: Friday, May 17, 2024 12:09 AM
To: svsm-devel@coconut-svsm.dev
Subject: Svsm-devel Digest, Vol 10, Issue 19

Send Svsm-devel mailing list submissions to
        svsm-devel@coconut-svsm.dev

To subscribe or unsubscribe via the World Wide Web, visit
        https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
or, via email, send a message with subject or body 'help' to
        svsm-devel-request@coconut-svsm.dev

You can reach the person managing the list at
        svsm-devel-owner@coconut-svsm.dev

When replying, please edit your Subject line so it is more specific than "R=
e: Contents of Svsm-devel digest..."


Today's Topics:

   1. RFC: Alternate Injection SVSM support (Jon Lange)


----------------------------------------------------------------------

Message: 1
Date: Fri, 17 May 2024 04:40:24 +0000
From: Jon Lange <jlange@microsoft.com>
To: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Subject: [svsm-devel] RFC: Alternate Injection SVSM support
Message-ID:
        <DS7PR21MB352462BA31B209F93F296A17CAEE2@DS7PR21MB3524.namprd21.prod=
.outlook.com>

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
Svsm-devel@coconut-svsm.dev
https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel


------------------------------

End of Svsm-devel Digest, Vol 10, Issue 19
******************************************

--_000_IA1PR12MB8285EE6EB27BD5E778D0094995372IA1PR12MB8285namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
Hi Jon,&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
I have a couple questions about&nbsp;the spec.&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
1. &nbsp;For the mechanism transferring control from guest firmware to gues=
t OS,&nbsp;<br>
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
f &quot;may use&quot;?</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<pre><div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color=
: rgb(0, 0, 0);">Thanks,</div><div class=3D"elementToProof" style=3D"direct=
ion: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cali=
bri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Melody</=
div></pre>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div id=3D"x_appendonsend"></div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri=
, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Wang=
, Huibo<br>
<b>Sent:</b>&nbsp;Wednesday, November 13, 2024 5:42 PM<br>
<b>To:</b>&nbsp;Jon Lange &lt;jlange@microsoft.com&gt;<br>
<b>Cc:</b>&nbsp;svsm-devel@coconut-svsm.dev &lt;svsm-devel@coconut-svsm.dev=
&gt;; Joerg Roedel &lt;jroedel@suse.de&gt;; Lendacky, Thomas &lt;Thomas.Len=
dacky@amd.com&gt;<br>
<b>Subject:</b>&nbsp;Alternate Injection spec question</span>
<div>&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">Hi Jon,<br>
<br>
Yeah, the one I have is version of May, thank you for the update.<br>
<br>
Thanks<br>
Melody<br>
<br>
-----Original Message-----<br>
From: Jon Lange &lt;jlange@microsoft.com&gt;<br>
Sent: Wednesday, November 13, 2024 5:23 PM<br>
To: Wang, Huibo &lt;Huibo.Wang@amd.com&gt;<br>
Cc: svsm-devel@coconut-svsm.dev; Joerg Roedel &lt;jroedel@suse.de&gt;; Lend=
acky, Thomas &lt;Thomas.Lendacky@amd.com&gt;<br>
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
From: Wang, Huibo &lt;Huibo.Wang@amd.com&gt;<br>
Sent: Wednesday, November 13, 2024 12:32 PM<br>
To: Jon Lange &lt;jlange@microsoft.com&gt;<br>
Cc: svsm-devel@coconut-svsm.dev; Joerg Roedel &lt;jroedel@suse.de&gt;; Lend=
acky, Thomas &lt;Thomas.Lendacky@amd.com&gt;<br>
Subject: [EXTERNAL] RE: Svsm-devel Digest, Vol 10, Issue 19<br>
<br>
[You don't often get email from huibo.wang@amd.com. Learn why this is impor=
tant at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification" id=3D"OWAe53054d3=
-6336-1058-5d49-b60a5cba3aa5" class=3D"OWAAutoLink" data-auth=3D"NotApplica=
ble">
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
From: Svsm-devel &lt;svsm-devel-bounces@coconut-svsm.dev&gt; On Behalf Of s=
vsm-devel-request@coconut-svsm.dev<br>
Sent: Friday, May 17, 2024 12:09 AM<br>
To: svsm-devel@coconut-svsm.dev<br>
Subject: Svsm-devel Digest, Vol 10, Issue 19<br>
<br>
Send Svsm-devel mailing list submissions to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svsm-devel@coconut-svsm.dev<br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://mail.8bytes.o=
rg/cgi-bin/mailman/listinfo/svsm-devel" id=3D"OWAf61df829-e385-2082-235d-22=
ac6ecfb3e6" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel</a><br>
or, via email, send a message with subject or body 'help' to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svsm-devel-request@coconut-svsm.=
dev<br>
<br>
You can reach the person managing the list at<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svsm-devel-owner@coconut-svsm.de=
v<br>
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
From: Jon Lange &lt;jlange@microsoft.com&gt;<br>
To: &quot;amd-sev-snp@lists.suse.com&quot; &lt;amd-sev-snp@lists.suse.com&g=
t;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;svsm-devel@coconut-svsm.de=
v&quot; &lt;svsm-devel@coconut-svsm.dev&gt;<br>
Subject: [svsm-devel] RFC: Alternate Injection SVSM support<br>
Message-ID:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;DS7PR21MB352462BA31B209F93F2=
96A17CAEE2@DS7PR21MB3524.namprd21.prod.outlook.com&gt;<br>
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
/20240517/e74aeb2f/attachment.htm" id=3D"OWAf299dddf-089a-4811-d4f4-8ac4d1d=
cdc29" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">http://mail.8bytes=
.org/pipermail/svsm-devel/attachments/20240517/e74aeb2f/attachment.htm</a>&=
gt;<br>
-------------- next part --------------<br>
A non-text attachment was scrubbed...<br>
Name: Alternate Injection Support for SEV-SNP 20240513.pdf<br>
Type: application/pdf<br>
Size: 114718 bytes<br>
Desc: Alternate Injection Support for SEV-SNP 20240513.pdf<br>
URL: &lt;<a href=3D"http://mail.8bytes.org/pipermail/svsm-devel/attachments=
/20240517/e74aeb2f/attachment.pdf" id=3D"OWAab43b177-580c-1b14-d9d6-f8c5a59=
66538" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">http://mail.8bytes=
.org/pipermail/svsm-devel/attachments/20240517/e74aeb2f/attachment.pdf</a>&=
gt;<br>
<br>
------------------------------<br>
<br>
Subject: Digest Footer<br>
<br>
Svsm-devel mailing list<br>
Svsm-devel@coconut-svsm.dev<br>
<a href=3D"https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel" id=
=3D"OWA5d8fc156-5211-f9cb-12f6-3c3d4ef919ae" class=3D"OWAAutoLink" data-aut=
h=3D"NotApplicable">https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-d=
evel</a><br>
<br>
<br>
------------------------------<br>
<br>
End of Svsm-devel Digest, Vol 10, Issue 19<br>
******************************************</div>
</div>
</body>
</html>

--_000_IA1PR12MB8285EE6EB27BD5E778D0094995372IA1PR12MB8285namp_--
