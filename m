Return-Path: <David.Kaplan@amd.com>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 228E61C78DE
 for <svsm-devel@coconut-svsm.dev>; Mon,  3 Jun 2024 20:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qh8XqgMlULkkgq294e7ZCBGyweKISuDICxmZwkqwuAI=;
 b=4sb2HiWEcBCu8kFWry5l3vFn8Jk7UwQfBHp82DPPICyC99AHwmbQgAwVmo2xrYdMFdV+/6wz2tBP0Ksq8mYzBUqbo0xF7z4X/+QSW1vHMBJIIRmGNwJnoBmLJjYnlR7wBzGXt+OLGyn2rGpRQUuL94EcJd6X0VKhPGOictUuOPI=
From: "Kaplan, David" <David.Kaplan@amd.com>
Date: Mon, 3 Jun 2024 18:46:18 +0000
Message-ID: <DS7PR12MB5766A185764744C3DF6ADBA794FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
References: <DS7PR21MB352462BA31B209F93F296A17CAEE2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR12MB57668C5D8AE281740909574B94F42@DS7PR12MB5766.namprd12.prod.outlook.com>
 <DS7PR21MB3524D4C48D6A51302783F0C3CAF42@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR21MB35248BAAD184D55EB2D057B9CAFC2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR21MB352490005169B16909763C76CAFF2@DS7PR21MB3524.namprd21.prod.outlook.com>
In-Reply-To: <DS7PR21MB352490005169B16909763C76CAFF2@DS7PR21MB3524.namprd21.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DS7PR12MB5766A185764744C3DF6ADBA794FF2DS7PR12MB5766namp_"
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

--_000_DS7PR12MB5766A185764744C3DF6ADBA794FF2DS7PR12MB5766namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Thanks Jon, I had no issues opening this version.

I did have some questions though on the new registration protocol.  The des=
cription on p.4-5 makes sense but makes it sounds like there are only 2 typ=
es of calls here ('register' and 'unregister'), yet the detailed SVSM_APIC_=
CONFIGURE_EMULATION on p.8 has 3 different inputs.

I can't quite figure out the 0b00 call...it sounded like AlternateInjection=
 would be automatically disabled via the 01 call if the registration count =
drops to 0.  So when would the 00 call be used?

Separately, on p. 10, call 5 (Configure Alternate Injection) seems to be mi=
ssing some text.  I'm guessing maybe that call is redundant with call 1 and=
 intended to be removed but it's unclear.

Thanks -David Kaplan

From: Jon Lange <jlange@microsoft.com>
Sent: Monday, June 3, 2024 12:47 PM
To: Kaplan, David <David.Kaplan@amd.com>; amd-sev-snp@lists.suse.com; svsm-=
devel@coconut-svsm.dev
Subject: RE: RFC: Alternate Injection SVSM support


[AMD Official Use Only - AMD Internal Distribution Only]

Caution: This message originated from an External Source. Use proper cautio=
n when opening attachments, clicking links, or responding.

Apparently the last version of the PDF I sent had some rights restrictions.=
  Here is a newer version which should be unrestricted.

-Jon

From: Jon Lange
Sent: Thursday, May 30, 2024 9:32 PM
To: Kaplan, David <David.Kaplan@amd.com<mailto:David.Kaplan@amd.com>>; amd-=
sev-snp@lists.suse.com<mailto:amd-sev-snp@lists.suse.com>; svsm-devel@cocon=
ut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>
Subject: RE: RFC: Alternate Injection SVSM support

Attached is a newer draft (dated May 24) of the Alternate Injection proposa=
l that incorporates the concepts in the discussion referenced below.  The m=
ost significant design change is the change to a registration count to dete=
rmine if and when Alternate Injection should be disabled as the result of a=
 hand-off from firmware to the OS.

There is an open PR in the COCONUT-SVSM project that includes the SVSM impl=
ementation of this proposal.

-Jon

From: Jon Lange
Sent: Thursday, May 23, 2024 3:05 PM
To: Kaplan, David <David.Kaplan@amd.com<mailto:David.Kaplan@amd.com>>; amd-=
sev-snp@lists.suse.com<mailto:amd-sev-snp@lists.suse.com>; svsm-devel@cocon=
ut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>
Subject: RE: RFC: Alternate Injection SVSM support

David, thanks for your feedback!


  *   Additionally, the term "becomes deliverable" here may not be clear.  =
I believe your intention is that when the HV decides to deliver a guest OS =
interrupt, it must cause the SVSM to run.

Yes, this is what I meant by deliverable, and I now see why this caused con=
fusion because the CPU defines "deliverable" to mean when the IDT dispatch =
can occur, which is different.  I can clarify this.


  *   p.2: "The hypervisor is expected to cause the SVSM to run any time de=
livery of an interrupt would result in injection of #HV to the SVSM."
  *   This is just basic Restricted Injection behavior I believe...in order=
 to send an interrupt to the SVSM the HV must inject a #HV into the SVSM an=
d then run it.  I don't think any of that changes with this Alternate Injec=
tion spec (right?)

This is made more complex by the presence of multiple VMPLs, where I don't =
think we have any clear specification (including in Restricted Injection do=
cumentation) about scheduling considerations.  The point here is that whene=
ver the process of delivering an interrupt to a lower VMPL makes the hyperv=
isor conclude that a notification is due to the SVSM, then the SVSM (i.e. V=
MPL 0) must be selected to run next on that vCPU.  I'm encouraged that you =
think this should be implicit from existing language, but that was less obv=
ious to me.


  *   Shouldn't this be bits 8, 9, or 10?

This is an editing error from a previous draft.  Thanks for pointing it out=
.


  *   I would suggest considering defining names for each of these fields, =
and including a table showing the overall layout.

I agree that this should happen once this behavior is incorporated into the=
 GHCB/SVSM specifications owned by AMD.  My aim here was to describe the be=
havior and the standards changes required, not to create authoritative docu=
mentation.


  *   The statement about the SVSM having to know if the first component su=
pports Alternate Injection is for security, correct?  That is, if the guest=
 wants interrupt security then it'll want Alternate Injection enabled from =
the beginning.  If that's the case, then the SVSM *must* enable Alternate I=
njection prior to the first guest entry (not "may") true?

I think this is another leftover from previous revisions.  I agree that thi=
s must be stated more clearly.


  *   Another idea to consider: What if you had a counter that increments w=
hen someone requested Alternate Injection and decremented when they asked t=
o disable it.  And the feature is enabled when the counter is > 0.  I think=
 that would also solve your problem of guest FW not knowing if the guest OS=
 will want the feature or not.

This is a great idea and eliminates all of the Enabled/Disabled/Locked conf=
usion that you were concerned about.  I will plan to make this change, whic=
h I think will make your feedback about the Enabled/Disabled/Locked state m=
achine moot.


  *   This probably a bit unrelated to the spec itself as this is really ab=
out the internal implementation of the SVSM.  But I think the important poi=
nt is that the SVSM may be running (for whatever reason), the HV can send i=
t a #HV, and then when the SVSM requests a VMPL change the HV should assume=
 that the SVSM has processed the information from the #HV.

Yes, but this fact is not necessarily obvious to someone who implements the=
 SVSM protocol.  I thought it would be helpful to point out, but it need no=
t be part of the text that is incorporated into the SVSM specification.  It=
's also helpful to underscore it here because the protocol could alternatel=
y have been designed to state that it was the hypervisor's responsibility t=
o prevent the VMPL switch if the #HV NoFurtherSignal bit was still set (mea=
ning the pending interrupt had not yet been processed) - so stating the SVS=
M's responsibility here in the document emphasizes the fact that the tradeo=
ff has been considered and the responsibility lies with the SVSM and not th=
e hypervisor.


  *   I am concerned about the fact that once Disabled, Alternate Injection=
 can't be re-enabled.  Is that really required?  For instance, what if we'r=
e running a guest OS that doesn't understand alternate injection and then w=
e kexec into a kernel that does.

Reenabling Alternate Injection would require transferring all of the APIC s=
tate from the hypervisor to the SVSM - not just the IRR, but the ISR and TM=
R - so the future uses of the protocol can correctly apply to any interrupt=
s that are already in service.  This introduces complexity that strikes me =
as unnecessary - or at least not compelling enough to be worth it - given t=
hat once Alternate Injection is disabled, the security state of the guest h=
as regressed and the absolute promise of "no host interference" no longer a=
pplies.  Once that promise is gone - i.e., once the guest accepts that it c=
an be placed into a vulnerable posture - it's not clear to me why it's comp=
elling to return to a more roust posture.  I would suggest proceeding witho=
ut this capability, and if it becomes important, then it can be added in a =
future version of the specification.


  *   Minor clarification but I would say that this simply disables Alterna=
te Injection but doesn't necessarily require the HV to deliver events to th=
e guest using direct event injection.  There are other interrupt delivery m=
echanisms too (including Secure AVIC as described in APM vol2).

This spec was drafted before Secure AVIC was documented in the APM.  I take=
 your point, though it may be more effective to accomplish the clarity in t=
he language that is ultimately incorporated into the SVSM specficiation.

-Jon

From: Kaplan, David <David.Kaplan@amd.com<mailto:David.Kaplan@amd.com>>
Sent: Thursday, May 23, 2024 10:06 AM
To: Jon Lange <jlange@microsoft.com<mailto:jlange@microsoft.com>>; amd-sev-=
snp@lists.suse.com<mailto:amd-sev-snp@lists.suse.com>; svsm-devel@coconut-s=
vsm.dev<mailto:svsm-devel@coconut-svsm.dev>
Subject: [EXTERNAL] RE: RFC: Alternate Injection SVSM support


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
m<mailto:amd-sev-snp-bounces+david.kaplan=3Damd.com@lists.suse.com>> On Beh=
alf Of Jon Lange
Sent: Thursday, May 16, 2024 11:40 PM
To: amd-sev-snp@lists.suse.com<mailto:amd-sev-snp@lists.suse.com>; svsm-dev=
el@coconut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>
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



--_000_DS7PR12MB5766A185764744C3DF6ADBA794FF2DS7PR12MB5766namp_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
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
/* List Definitions */
@list l0
	{mso-list-id:148206641;
	mso-list-type:hybrid;
	mso-list-template-ids:-1511983720 -860045930 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;
	mso-fareast-font-family:Aptos;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks Jon, I had n=
o issues opening this version.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I did have some que=
stions though on the new registration protocol.&nbsp; The description on p.=
4-5 makes sense but makes it sounds like there are only 2 types of calls he=
re (&#8216;register&#8217; and &#8216;unregister&#8217;), yet the
 detailed SVSM_APIC_CONFIGURE_EMULATION on p.8 has 3 different inputs.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I can&#8217;t quite=
 figure out the 0b00 call&#8230;it sounded like AlternateInjection would be=
 automatically disabled via the 01 call if the registration count drops to =
0.&nbsp; So when would the 00 call be used?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Separately, on p. 1=
0, call 5 (Configure Alternate Injection) seems to be missing some text.&nb=
sp; I&#8217;m guessing maybe that call is redundant with call 1 and intende=
d to be removed but it&#8217;s unclear.<o:p></o:p></span></p>
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
font-family:&quot;Calibri&quot;,sans-serif"> Jon Lange &lt;jlange@microsoft=
.com&gt;
<br>
<b>Sent:</b> Monday, June 3, 2024 12:47 PM<br>
<b>To:</b> Kaplan, David &lt;David.Kaplan@amd.com&gt;; amd-sev-snp@lists.su=
se.com; svsm-devel@coconut-svsm.dev<br>
<b>Subject:</b> RE: RFC: Alternate Injection SVSM support<o:p></o:p></span>=
</p>
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
orgia&quot;,serif;color:blue">Apparently the last version of the PDF I sent=
 had some rights restrictions.&nbsp; Here is a newer version which should b=
e unrestricted.<o:p></o:p></span></p>
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
font-family:&quot;Calibri&quot;,sans-serif"> Jon Lange
<br>
<b>Sent:</b> Thursday, May 30, 2024 9:32 PM<br>
<b>To:</b> Kaplan, David &lt;</span><a href=3D"mailto:David.Kaplan@amd.com"=
><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif=
">David.Kaplan@amd.com</span></a><span style=3D"font-size:11.0pt;font-famil=
y:&quot;Calibri&quot;,sans-serif">&gt;;
</span><a href=3D"mailto:amd-sev-snp@lists.suse.com"><span style=3D"font-si=
ze:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">amd-sev-snp@lists.sus=
e.com</span></a><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&q=
uot;,sans-serif">;
</span><a href=3D"mailto:svsm-devel@coconut-svsm.dev"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">svsm-devel@coconut-s=
vsm.dev</span></a><span style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif"><br>
<b>Subject:</b> RE: RFC: Alternate Injection SVSM support<o:p></o:p></span>=
</p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">Attached is a newer draft (dated May 24) of t=
he Alternate Injection proposal that incorporates the concepts in the discu=
ssion referenced below.&nbsp; The most significant
 design change is the change to a registration count to determine if and wh=
en Alternate Injection should be disabled as the result of a hand-off from =
firmware to the OS.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">There is an open PR in the COCONUT-SVSM proje=
ct that includes the SVSM implementation of this proposal.<o:p></o:p></span=
></p>
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
font-family:&quot;Calibri&quot;,sans-serif"> Jon Lange
<br>
<b>Sent:</b> Thursday, May 23, 2024 3:05 PM<br>
<b>To:</b> Kaplan, David &lt;</span><a href=3D"mailto:David.Kaplan@amd.com"=
><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif=
">David.Kaplan@amd.com</span></a><span style=3D"font-size:11.0pt;font-famil=
y:&quot;Calibri&quot;,sans-serif">&gt;;
</span><a href=3D"mailto:amd-sev-snp@lists.suse.com"><span style=3D"font-si=
ze:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">amd-sev-snp@lists.sus=
e.com</span></a><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&q=
uot;,sans-serif">;
</span><a href=3D"mailto:svsm-devel@coconut-svsm.dev"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">svsm-devel@coconut-s=
vsm.dev</span></a><span style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif"><br>
<b>Subject:</b> RE: RFC: Alternate Injection SVSM support<o:p></o:p></span>=
</p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">David, thanks for your feedback!<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"color:blue;margin-left:0in;mso-list=
:l0 level1 lfo1">
<span style=3D"font-size:11.0pt;color:windowtext">Additionally, the term &#=
8220;becomes deliverable&#8221; here may not be clear.&nbsp; I believe your=
 intention is that when the HV decides to deliver a guest OS interrupt, it =
must cause the SVSM to run.</span><span style=3D"font-size:10.0pt;font-fami=
ly:&quot;Georgia&quot;,serif"><o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">Yes, this is what I meant by deliverable, and=
 I now see why this caused confusion because the CPU defines &#8220;deliver=
able&#8221; to mean when the IDT dispatch can occur, which
 is different.&nbsp; I can clarify this.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1;text-autospace:none">
<i><span style=3D"font-size:11.0pt">p.2: &#8220;The hypervisor is expected =
to cause the SVSM to run any time delivery of an interrupt would result in =
injection of #HV to the SVSM.&#8221;<o:p></o:p></span></i></li><li class=3D=
"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo1"><span =
style=3D"font-size:11.0pt">This is just basic Restricted Injection behavior=
 I believe&#8230;in order to send an interrupt to the SVSM the HV must inje=
ct a #HV into the SVSM and then
 run it.&nbsp; I don&#8217;t think any of that changes with this Alternate =
Injection spec (right?)<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">This is made more complex by the presence of =
multiple VMPLs, where I don&#8217;t think we have any clear specification (=
including in Restricted Injection documentation) about
 scheduling considerations.&nbsp; The point here is that whenever the proce=
ss of delivering an interrupt to a lower VMPL makes the hypervisor conclude=
 that a notification is due to the SVSM, then the SVSM (i.e. VMPL 0) must b=
e selected to run next on that vCPU.&nbsp;
 I&#8217;m encouraged that you think this should be implicit from existing =
language, but that was less obvious to me.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><span style=3D"font-size:11.0pt">Shouldn&#8217;t this be bits 8, 9, o=
r 10?<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">This is an editing error from a previous draf=
t.&nbsp; Thanks for pointing it out.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"color:blue;margin-left:0in;mso-list=
:l0 level1 lfo1">
<span style=3D"font-size:11.0pt;color:windowtext">I would suggest consideri=
ng defining names for each of these fields, and including a table showing t=
he overall layout.&nbsp;</span><span style=3D"font-size:10.0pt;font-family:=
&quot;Georgia&quot;,serif"><o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">I agree that this should happen once this beh=
avior is incorporated into the GHCB/SVSM specifications owned by AMD.&nbsp;=
 My aim here was to describe the behavior and the standards
 changes required, not to create authoritative documentation.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><span style=3D"font-size:11.0pt">The statement about the SVSM having =
to know if the first component supports Alternate Injection is for security=
, correct?&nbsp; That is, if the guest wants
 interrupt security then it&#8217;ll want Alternate Injection enabled from =
the beginning.&nbsp; If that&#8217;s the case, then the SVSM *<b>must</b>* =
enable Alternate Injection prior to the first guest entry (not &#8220;may&#=
8221;) true?<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">I think this is another leftover from previou=
s revisions.&nbsp; I agree that this must be stated more clearly.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"color:blue;margin-left:0in;mso-list=
:l0 level1 lfo1">
<span style=3D"font-size:11.0pt;color:windowtext">Another idea to consider:=
 What if you had a counter that increments when someone requested Alternate=
 Injection and decremented when they asked to disable it.&nbsp; And the fea=
ture is enabled when the counter is &gt; 0.&nbsp;
 I think that would also solve your problem of guest FW not knowing if the =
guest OS will want the feature or not.</span><span style=3D"font-size:10.0p=
t;font-family:&quot;Georgia&quot;,serif"><o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">This is a great idea and eliminates all of th=
e Enabled/Disabled/Locked confusion that you were concerned about.&nbsp; I =
will plan to make this change, which I think will make
 your feedback about the Enabled/Disabled/Locked state machine moot.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><span style=3D"font-size:11.0pt">This probably a bit unrelated to the=
 spec itself as this is really about the internal implementation of the SVS=
M.&nbsp; But I think the important point is
 that the SVSM may be running (for whatever reason), the HV can send it a #=
HV, and then when the SVSM requests a VMPL change the HV should assume that=
 the SVSM has processed the information from the #HV.<o:p></o:p></span></li=
></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">Yes, but this fact is not necessarily obvious=
 to someone who implements the SVSM protocol.&nbsp; I thought it would be h=
elpful to point out, but it need not be part of the
 text that is incorporated into the SVSM specification.&nbsp; It&#8217;s al=
so helpful to underscore it here because the protocol could alternately hav=
e been designed to state that it was the hypervisor&#8217;s responsibility =
to prevent the VMPL switch if the #HV NoFurtherSignal
 bit was still set (meaning the pending interrupt had not yet been processe=
d) &#8211; so stating the SVSM&#8217;s responsibility here in the document =
emphasizes the fact that the tradeoff has been considered and the responsib=
ility lies with the SVSM and not the hypervisor.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"color:blue;margin-left:0in;mso-list=
:l0 level1 lfo1">
<span style=3D"font-size:11.0pt;color:windowtext">I am concerned about the =
fact that once Disabled, Alternate Injection can&#8217;t be re-enabled.&nbs=
p; Is that really required?&nbsp; For instance, what if we&#8217;re running=
 a guest OS that doesn&#8217;t understand alternate injection
 and then we kexec into a kernel that does.</span><span style=3D"font-size:=
10.0pt;font-family:&quot;Georgia&quot;,serif"><o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">Reenabling Alternate Injection would require =
transferring all of the APIC state from the hypervisor to the SVSM &#8211; =
not just the IRR, but the ISR and TMR &#8211; so the future
 uses of the protocol can correctly apply to any interrupts that are alread=
y in service.&nbsp; This introduces complexity that strikes me as unnecessa=
ry &#8211; or at least not compelling enough to be worth it &#8211; given t=
hat once Alternate Injection is disabled, the security
 state of the guest has regressed and the absolute promise of &#8220;no hos=
t interference&#8221; no longer applies.&nbsp; Once that promise is gone &#=
8211; i.e., once the guest accepts that it can be placed into a vulnerable =
posture &#8211; it&#8217;s not clear to me why it&#8217;s compelling to ret=
urn
 to a more roust posture.&nbsp; I would suggest proceeding without this cap=
ability, and if it becomes important, then it can be added in a future vers=
ion of the specification.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"color:blue;margin-left:0in;mso-list=
:l0 level1 lfo1">
<span style=3D"font-size:11.0pt;color:windowtext">Minor clarification but I=
 would say that this simply disables Alternate Injection but doesn&#8217;t =
necessarily require the HV to deliver events to the guest using direct even=
t injection.&nbsp; There are other interrupt
 delivery mechanisms too (including Secure AVIC as described in APM vol2).<=
/span><span style=3D"font-size:10.0pt;font-family:&quot;Georgia&quot;,serif=
"><o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">This spec was drafted before Secure AVIC was =
documented in the APM.&nbsp; I take your point, though it may be more effec=
tive to accomplish the clarity in the language that
 is ultimately incorporated into the SVSM specficiation.<o:p></o:p></span><=
/p>
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
font-family:&quot;Calibri&quot;,sans-serif"> Kaplan, David &lt;</span><a hr=
ef=3D"mailto:David.Kaplan@amd.com"><span style=3D"font-size:11.0pt;font-fam=
ily:&quot;Calibri&quot;,sans-serif">David.Kaplan@amd.com</span></a><span st=
yle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&gt;
<br>
<b>Sent:</b> Thursday, May 23, 2024 10:06 AM<br>
<b>To:</b> Jon Lange &lt;</span><a href=3D"mailto:jlange@microsoft.com"><sp=
an style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">jl=
ange@microsoft.com</span></a><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif">&gt;;
</span><a href=3D"mailto:amd-sev-snp@lists.suse.com"><span style=3D"font-si=
ze:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">amd-sev-snp@lists.sus=
e.com</span></a><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&q=
uot;,sans-serif">;
</span><a href=3D"mailto:svsm-devel@coconut-svsm.dev"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">svsm-devel@coconut-s=
vsm.dev</span></a><span style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif"><br>
<b>Subject:</b> [EXTERNAL] RE: RFC: Alternate Injection SVSM support<o:p></=
o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:blue">[AMD Official Use Only - AMD Internal=
 Distribution Only]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks Jon for writ=
ing and sharing this!&nbsp; I have a few questions/comments on the spec:<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">p.1: &#8220;SVSM involvement is required to present interrupt=
s to the guest OS, so when a guest OS interrupt<o:p></o:p></span></i></p>
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
-size:11.0pt">p.4: If the SVSM does know that the first component to execut=
e will support the SVSM APIC Protocol, then<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt">it may enable Al=
ternate Injection prior to the first guest entry;<o:p></o:p></span></i></p>
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
-size:11.0pt">p. 5: &#8220;Consequently, the SVSM must be designed so that =
once it passes the point where<o:p></o:p></span></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">it commits to entering the lower VMPL, any delivery of #HV th=
at indicates interrupt delivery to the<o:p></o:p></span></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><span style=3D"font=
-size:11.0pt">lower VMPL will cause it to cancel the VMGEXIT that would cau=
se a return to the lower VMPL, so<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt">that it can proc=
ess the interrupt that has been signaled.&#8221;<o:p></o:p></span></i></p>
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
font-family:&quot;Calibri&quot;,sans-serif"> AMD-SEV-SNP &lt;</span><a href=
=3D"mailto:amd-sev-snp-bounces+david.kaplan=3Damd.com@lists.suse.com"><span=
 style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">amd-=
sev-snp-bounces+david.kaplan=3Damd.com@lists.suse.com</span></a><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&gt;
<b>On Behalf Of </b>Jon Lange<br>
<b>Sent:</b> Thursday, May 16, 2024 11:40 PM<br>
<b>To:</b> </span><a href=3D"mailto:amd-sev-snp@lists.suse.com"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">amd-sev-sn=
p@lists.suse.com</span></a><span style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,sans-serif">;
</span><a href=3D"mailto:svsm-devel@coconut-svsm.dev"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">svsm-devel@coconut-s=
vsm.dev</span></a><span style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif"><br>
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
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DS7PR12MB5766A185764744C3DF6ADBA794FF2DS7PR12MB5766namp_--
