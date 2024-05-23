Return-Path: <David.Kaplan@amd.com>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 214A51C529B
 for <svsm-devel@coconut-svsm.dev>; Thu, 23 May 2024 19:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TscSDBR4efSzqnJs113VkQGZZpUPYdNrEddo5qtstFc=;
 b=aY6mMqmu6sFy8O2NhWttYtUB0bp2copqAr35fimRP2QfJCx3Z15x+3XX8Go/Q7LP0Pnjfyc3M8pLUctiiguqoCcB4pSNX85WThdBYIZBWGkwpiHGGg2Yx3fhj/UtJoOWHCG7YUyHdrKWY4CM1rn/Qj/OizPMxMrxMM/8LUmhjZ0=
From: "Kaplan, David" <David.Kaplan@amd.com>
Date: Thu, 23 May 2024 17:06:05 +0000
Message-ID: <DS7PR12MB57668C5D8AE281740909574B94F42@DS7PR12MB5766.namprd12.prod.outlook.com>
References: <DS7PR21MB352462BA31B209F93F296A17CAEE2@DS7PR21MB3524.namprd21.prod.outlook.com>
In-Reply-To: <DS7PR21MB352462BA31B209F93F296A17CAEE2@DS7PR21MB3524.namprd21.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DS7PR12MB57668C5D8AE281740909574B94F42DS7PR12MB5766namp_"
MIME-Version: 1.0
Subject: Re: [svsm-devel] RFC: Alternate Injection SVSM support
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Jon Lange <jlange@microsoft.com>, "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

--_000_DS7PR12MB57668C5D8AE281740909574B94F42DS7PR12MB5766namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Thanks Jon for writing and sharing this!  I have a few questions/comments o=
n the spec:

p.1: "SVSM involvement is required to present interrupts to the guest OS, s=
o when a guest OS interrupt
becomes deliverable, it is necessary to cause the SVSM to run"

I was a bit confused by this wording (and worry others may be too).  With t=
he Alternate Injection feature, the SVSM may "queue" interrupts for the gue=
st OS, but the HW is actually what "delivers" the interrupt (meaning vector=
ing to the handler through the IDT).  Additionally, the term "becomes deliv=
erable" here may not be clear.  I believe your intention is that when the H=
V decides to deliver a guest OS interrupt, it must cause the SVSM to run.  =
However when a previously sent interrupt that was pending (say because RFLA=
GS.IF=3D0 in the guest) becomes deliverable because the guest did STI, that=
 does *not* cause the SVSM to run.  So I'd suggest perhaps rephrasing this =
to clarify this a bit more.

p.2: "The hypervisor is expected to cause the SVSM to run any time delivery=
 of an
interrupt would result in injection of #HV to the SVSM."

This is just basic Restricted Injection behavior I believe...in order to se=
nd an interrupt to the SVSM the HV must inject a #HV into the SVSM and then=
 run it.  I don't think any of that changes with this Alternate Injection s=
pec (right?)

p.2: "Whenever the hypervisor delivers an interrupt for a lower VMPL (or an=
 event, such as a request to
revert to host-managed APIC emulation), it will set the appropriate interru=
pt bit(s) in the extended
interrupt descriptor corresponding to the lower VMPL, and it will also set =
bit 1, 2, or 3 in the second
16-bit word of the SVSM's extended interrupt descriptor to indicate which V=
MPL has pending
interrupt evaluation work."

Shouldn't this be bits 8, 9, or 10?

p.3 extended interrupt descriptor

I would suggest considering defining names for each of these fields, and in=
cluding a table showing the overall layout.  The spec currently refers to f=
ields exclusively by bit position, which I personally found a bit hard to p=
arse.  For instance, if bits 7:0 were named "SINGLE_VEC" (or whatever you'd=
 like), then later in the section you could refer to that instead of referr=
ing to bits 7:0.

p.4: If the SVSM does know that the first component to execute will support=
 the SVSM APIC Protocol, then
it may enable Alternate Injection prior to the first guest entry;

The statement about the SVSM having to know if the first component supports=
 Alternate Injection is for security, correct?  That is, if the guest wants=
 interrupt security then it'll want Alternate Injection enabled from the be=
ginning.  If that's the case, then the SVSM *must* enable Alternate Injecti=
on prior to the first guest entry (not "may") true?

p.5 (Enabled/Locked/Disabled) state machine
I found this a bit confusing (at a minimum I'd politely request a diagram s=
howing state transitions).  Usually "Locked" means you can't change, but in=
 this case, the Disabled state seems to be more locked than the Locked stat=
e.

I had to read the part about the flows several times to understand it.  I t=
hink I get it now, but I am concerned about the fact that once Disabled, Al=
ternate Injection can't be re-enabled.  Is that really required?  For insta=
nce, what if we're running a guest OS that doesn't understand alternate inj=
ection and then we kexec into a kernel that does.

Another idea to consider: What if you had a counter that increments when so=
meone requested Alternate Injection and decremented when they asked to disa=
ble it.  And the feature is enabled when the counter is > 0.  I think that =
would also solve your problem of guest FW not knowing if the guest OS will =
want the feature or not.

For example: SVSM knows guest FW supports AlternateInjection so it starts t=
he counter at 1.  The guest OS also supports it so it asks for it to be ena=
bled raising the counter to 2.  Then guest FW disables Alternate Injection =
in ExitBootServices, decrementing the counter back to 1 so it stays enabled=
.

p. 5: "Consequently, the SVSM must be designed so that once it passes the p=
oint where
it commits to entering the lower VMPL, any delivery of #HV that indicates i=
nterrupt delivery to the
lower VMPL will cause it to cancel the VMGEXIT that would cause a return to=
 the lower VMPL, so
that it can process the interrupt that has been signaled."

This probably a bit unrelated to the spec itself as this is really about th=
e internal implementation of the SVSM.  But I think the important point is =
that the SVSM may be running (for whatever reason), the HV can send it a #H=
V, and then when the SVSM requests a VMPL change the HV should assume that =
the SVSM has processed the information from the #HV.

p.6 Disable Alternate Injection

Minor clarification but I would say that this simply disables Alternate Inj=
ection but doesn't necessarily require the HV to deliver events to the gues=
t using direct event injection.  There are other interrupt delivery mechani=
sms too (including Secure AVIC as described in APM vol2).  So I'd perhaps s=
uggest just saying that the HV has to deliver any events through other mean=
s, not necessarily direct event injection.

I think that's all I saw for now, the actual protocol itself seemed to make=
 sense, but I'm guessing others may have feedback there.  And again, really=
 appreciate the work on putting this together!

Thanks -David Kaplan

From: AMD-SEV-SNP <amd-sev-snp-bounces+david.kaplan=3Damd.com@lists.suse.co=
m> On Behalf Of Jon Lange
Sent: Thursday, May 16, 2024 11:40 PM
To: amd-sev-snp@lists.suse.com; svsm-devel@coconut-svsm.dev
Subject: RFC: Alternate Injection SVSM support

Caution: This message originated from an External Source. Use proper cautio=
n when opening attachments, clicking links, or responding.

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



--_000_DS7PR12MB57668C5D8AE281740909574B94F42DS7PR12MB5766namp_
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
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
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
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks Jon for writ=
ing and sharing this!&nbsp; I have a few questions/comments on the spec:<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">p.1: &#8220;</span></i><i><span style=3D"font-size:11.0pt">SV=
SM involvement is required to present interrupts to the guest OS, so when a=
 guest OS interrupt<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt">becomes delivera=
ble, it is necessary to cause the SVSM to run&#8221;<o:p></o:p></span></i><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I was a bit confuse=
d by this wording (and worry others may be too).&nbsp; With the Alternate I=
njection feature, the SVSM may &#8220;queue&#8221; interrupts for the guest=
 OS, but the HW is actually what &#8220;delivers&#8221; the interrupt
 (meaning vectoring to the handler through the IDT).&nbsp; Additionally, th=
e term &#8220;becomes deliverable&#8221; here may not be clear.&nbsp; I bel=
ieve your intention is that when the HV decides to deliver a guest OS inter=
rupt, it must cause the SVSM to run.&nbsp; However when a previously
 sent interrupt that was pending (say because RFLAGS.IF=3D0 in the guest) b=
ecomes deliverable because the guest did STI, that does *<b>not</b>* cause =
the SVSM to run.&nbsp; So I&#8217;d suggest perhaps rephrasing this to clar=
ify this a bit more.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">p.2: &#8220;The hypervisor is expected to cause the SVSM to r=
un any time delivery of an<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt">interrupt would =
result in injection of #HV to the SVSM.&#8221;<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This is just basic =
Restricted Injection behavior I believe&#8230;in order to send an interrupt=
 to the SVSM the HV must inject a #HV into the SVSM and then run it.&nbsp; =
I don&#8217;t think any of that changes with this Alternate
 Injection spec (right?)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">p.2: &#8220;Whenever the hypervisor delivers an interrupt for=
 a lower VMPL (or an event, such as a request to<o:p></o:p></span></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">revert to host-managed APIC emulation), it will set the appro=
priate interrupt bit(s) in the extended<o:p></o:p></span></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">interrupt descriptor corresponding to the lower VMPL, and it =
will also set bit 1, 2, or 3 in the second<o:p></o:p></span></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">16-bit word of the SVSM&#8217;s extended interrupt descriptor=
 to indicate which VMPL has pending<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt">interrupt evalua=
tion work.&#8221;<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Shouldn&#8217;t thi=
s be bits 8, 9, or 10?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">p.3 extended interr=
upt descriptor<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I would suggest con=
sidering defining names for each of these fields, and including a table sho=
wing the overall layout.&nbsp; The spec currently refers to fields exclusiv=
ely by bit position, which I personally found
 a bit hard to parse.&nbsp; For instance, if bits 7:0 were named &#8220;SIN=
GLE_VEC&#8221; (or whatever you&#8217;d like), then later in the section yo=
u could refer to that instead of referring to bits 7:0.<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">p.4:
</span></i><i><span style=3D"font-size:11.0pt">If the SVSM does know that t=
he first component to execute will support the SVSM APIC Protocol, then<o:p=
></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt">it may enable Al=
ternate Injection prior to the first guest entry;</span></i><i><span style=
=3D"font-size:11.0pt"><o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The statement about=
 the SVSM having to know if the first component supports Alternate Injectio=
n is for security, correct?&nbsp; That is, if the guest wants interrupt sec=
urity then it&#8217;ll want Alternate Injection
 enabled from the beginning.&nbsp; If that&#8217;s the case, then the SVSM =
*<b>must</b>* enable Alternate Injection prior to the first guest entry (no=
t &#8220;may&#8221;) true?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">p.5 (Enabled/Locked=
/Disabled) state machine<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I found this a bit =
confusing (at a minimum I&#8217;d politely request a diagram showing state =
transitions).&nbsp; Usually &#8220;Locked&#8221; means you can&#8217;t chan=
ge, but in this case, the Disabled state seems to be more locked
 than the Locked state.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I had to read the p=
art about the flows several times to understand it.&nbsp; I think I get it =
now, but I am concerned about the fact that once Disabled, Alternate Inject=
ion can&#8217;t be re-enabled.&nbsp; Is that really
 required?&nbsp; For instance, what if we&#8217;re running a guest OS that =
doesn&#8217;t understand alternate injection and then we kexec into a kerne=
l that does.&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Another idea to con=
sider: What if you had a counter that increments when someone requested Alt=
ernate Injection and decremented when they asked to disable it.&nbsp; And t=
he feature is enabled when the counter is
 &gt; 0.&nbsp; I think that would also solve your problem of guest FW not k=
nowing if the guest OS will want the feature or not.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">For example: SVSM k=
nows guest FW supports AlternateInjection so it starts the counter at 1.&nb=
sp; The guest OS also supports it so it asks for it to be enabled raising t=
he counter to 2.&nbsp; Then guest FW disables
 Alternate Injection in ExitBootServices, decrementing the counter back to =
1 so it stays enabled.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">p. 5: &#8220;</span></i><i><span style=3D"font-size:11.0pt">C=
onsequently, the SVSM must be designed so that once it passes the point whe=
re<o:p></o:p></span></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">it commits to entering the lower VMPL, any delivery of #HV th=
at indicates interrupt delivery to the<o:p></o:p></span></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">lower VMPL will cause it to cancel the VMGEXIT that would cau=
se a return to the lower VMPL, so<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt">that it can proc=
ess the interrupt that has been signaled.&#8221;</span></i><i><span style=
=3D"font-size:11.0pt"><o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This probably a bit=
 unrelated to the spec itself as this is really about the internal implemen=
tation of the SVSM.&nbsp; But I think the important point is that the SVSM =
may be running (for whatever reason), the
 HV can send it a #HV, and then when the SVSM requests a VMPL change the HV=
 should assume that the SVSM has processed the information from the #HV.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">p.6 Disable Alterna=
te Injection<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Minor clarification=
 but I would say that this simply disables Alternate Injection but doesn&#8=
217;t necessarily require the HV to deliver events to the guest using direc=
t event injection.&nbsp; There are other interrupt
 delivery mechanisms too (including Secure AVIC as described in APM vol2).&=
nbsp; So I&#8217;d perhaps suggest just saying that the HV has to deliver a=
ny events through other means, not necessarily direct event injection.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I think that&#8217;=
s all I saw for now, the actual protocol itself seemed to make sense, but I=
&#8217;m guessing others may have feedback there.&nbsp; And again, really a=
ppreciate the work on putting this together!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks &#8211;David=
 Kaplan<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> AMD-SEV-SNP &lt;amd-sev-snp-bo=
unces+david.kaplan=3Damd.com@lists.suse.com&gt;
<b>On Behalf Of </b>Jon Lange<br>
<b>Sent:</b> Thursday, May 16, 2024 11:40 PM<br>
<b>To:</b> amd-sev-snp@lists.suse.com; svsm-devel@coconut-svsm.dev<br>
<b>Subject:</b> RFC: Alternate Injection SVSM support<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif">Attached is a specification I am proposing to handle sup=
port for Alternate Injection in SNP guests through the use of an SVSM.&nbsp=
; This document proposes changes to the AMD GHCB specification
 and to the AMD SVSM specification to enable the negotiation required to ma=
ke Alternate Injection work correctly.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif">Support for this protocol will not be possible in KVM un=
til KVM is able to include native support for multiple VMPLs with separate =
interrupt sources for each.&nbsp; That work is underway
 elsewhere, and my expectation is that this proposed specification will ali=
gn with the capabilities that KVM will be introducing as part of the multi-=
VMPL support.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif">I will be submitting changes to COCONUT-SVSM to implemen=
t this protocol.&nbsp; I welcome all feedback to the spec, and will update =
the code to match whatever spec changes are agreed
 upon.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif">-Jon<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><span =
style=3D"font-size:10.0pt;font-family:&quot;Georgia&quot;,serif"><o:p></o:p=
></span></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DS7PR12MB57668C5D8AE281740909574B94F42DS7PR12MB5766namp_--
