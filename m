Return-Path: <jlange@microsoft.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::716])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id B80341C27E1
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Jun 2024 06:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Svr4bjlbk8KrLx8QCDeHdo9/6ORm/cP6LAdNqjGoVo=;
 b=f0uXtuZQfiAf/oNc91XEx6IsIe1H+sWa49hIj6z9X1G9hPaJXcLzAr1iqqp9AW8Y6oDpnhwDNnJYdwjrvqbDy36AirQCWbIRlSB2bqK16b0IMqbE+4KJp3u1wpmFcjo6U7iXCqut+pPmfBI5EKHbEnr89EaJWynC2VyCvOjdNQY=
From: Jon Lange <jlange@microsoft.com>
Date: Fri, 21 Jun 2024 04:44:15 +0000
Message-ID: <DS7PR21MB352407F5564A9B1E0D137412CAC92@DS7PR21MB3524.namprd21.prod.outlook.com>
References: <DS7PR21MB352462BA31B209F93F296A17CAEE2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR12MB57668C5D8AE281740909574B94F42@DS7PR12MB5766.namprd12.prod.outlook.com>
 <DS7PR21MB3524D4C48D6A51302783F0C3CAF42@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR21MB35248BAAD184D55EB2D057B9CAFC2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR21MB352490005169B16909763C76CAFF2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR12MB5766A185764744C3DF6ADBA794FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
 <DS7PR21MB3524EA15795F4C668B826A88CAFF2@DS7PR21MB3524.namprd21.prod.outlook.com>
In-Reply-To: <DS7PR21MB3524EA15795F4C668B826A88CAFF2@DS7PR21MB3524.namprd21.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_004_DS7PR21MB352407F5564A9B1E0D137412CAC92DS7PR21MB3524namp_"
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
To: "Kaplan, David" <David.Kaplan@amd.com>, "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

--_004_DS7PR21MB352407F5564A9B1E0D137412CAC92DS7PR21MB3524namp_
Content-Type: multipart/alternative;
	boundary="_000_DS7PR21MB352407F5564A9B1E0D137412CAC92DS7PR21MB3524namp_"

--_000_DS7PR21MB352407F5564A9B1E0D137412CAC92DS7PR21MB3524namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Attached is the most recent (and hopefully final) draft of the proposed Alt=
ernate Injection specification.  This document addresses the feedback recei=
ved from David Kaplan and also cleans up some other inconsistencies with er=
ror codes returned from the APIC Emulation Protocol calls.

-Jon

From: Jon Lange
Sent: Monday, June 3, 2024 11:55 AM
To: Kaplan, David <David.Kaplan@amd.com>; amd-sev-snp@lists.suse.com; svsm-=
devel@coconut-svsm.dev
Subject: RE: RFC: Alternate Injection SVSM support

The registration status of Alternate Injection applies to the entire guest,=
 but the Alternate Injection SEV feature is per-VCPU.  There has to be some=
thing to tie the two together.  Consider an example where OVMF elects to de=
register Alternate Injection during ExitBootServices because it does not kn=
ow (and cannot know) what the loaded OS is going to do, and additionally su=
ppose that the loaded OS in this case has not registered Alternate Injectio=
n.  That means when OVMF deregisters as part of ExitBootServices (presumabl=
y on the BSP), it will make the 0b01 call, which will deregister Alternate =
Injection at a VM level (meaning it cannot be re-registered), but only the =
BSP's VMSA will have the SEV feature bit clear.  Once OVMF deregisters Alte=
rnate Injection, it must ensure that any AP that is already running issues =
the 0b00 form of the call to refresh its own SEV feature to bring it into s=
ync with the VM-wide registration state.  In this example, each AP that iss=
ues the call will cause Alternate Injection to be removed from its VMSA.  O=
n the other hand, if Alternate Injection were to remain registered because =
the loaded OS chose to register it, then the 0b00 call would have no effect=
 on each AP because Alternate Injection remains registered at the VM level.=
  Thus this call is both safe and necessary on every AP to align each AP wi=
th the VM-wide status.  I can try to make this more clear in the next revis=
ion.

Call 5 is erroneous and should be removed - the intended text was included =
in Call 1 as you suspected.  I'll clean that up in the next revision.

-Jon

From: Kaplan, David <David.Kaplan@amd.com<mailto:David.Kaplan@amd.com>>
Sent: Monday, June 3, 2024 11:46 AM
To: Jon Lange <jlange@microsoft.com<mailto:jlange@microsoft.com>>; amd-sev-=
snp@lists.suse.com<mailto:amd-sev-snp@lists.suse.com>; svsm-devel@coconut-s=
vsm.dev<mailto:svsm-devel@coconut-svsm.dev>
Subject: [EXTERNAL] RE: RFC: Alternate Injection SVSM support


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

From: Jon Lange <jlange@microsoft.com<mailto:jlange@microsoft.com>>
Sent: Monday, June 3, 2024 12:47 PM
To: Kaplan, David <David.Kaplan@amd.com<mailto:David.Kaplan@amd.com>>; amd-=
sev-snp@lists.suse.com<mailto:amd-sev-snp@lists.suse.com>; svsm-devel@cocon=
ut-svsm.dev<mailto:svsm-devel@coconut-svsm.dev>
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



--_000_DS7PR21MB352407F5564A9B1E0D137412CAC92DS7PR21MB3524namp_
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
span.EmailStyle22
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
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">Attached is the most recent (and hopefully fi=
nal) draft of the proposed Alternate Injection specification.&nbsp; This do=
cument addresses the feedback received from David Kaplan
 and also cleans up some other inconsistencies with error codes returned fr=
om the APIC Emulation Protocol calls.<o:p></o:p></span></p>
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
<b>Sent:</b> Monday, June 3, 2024 11:55 AM<br>
<b>To:</b> Kaplan, David &lt;David.Kaplan@amd.com&gt;; amd-sev-snp@lists.su=
se.com; svsm-devel@coconut-svsm.dev<br>
<b>Subject:</b> RE: RFC: Alternate Injection SVSM support<o:p></o:p></span>=
</p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">The registration status of Alternate Injectio=
n applies to the entire guest, but the Alternate Injection SEV feature is p=
er-VCPU.&nbsp; There has to be something to tie the
 two together.&nbsp; Consider an example where OVMF elects to deregister Al=
ternate Injection during ExitBootServices because it does not know (and can=
not know) what the loaded OS is going to do, and additionally suppose that =
the loaded OS in this case has not registered
 Alternate Injection.&nbsp; That means when OVMF deregisters as part of Exi=
tBootServices (presumably on the BSP), it will make the 0b01 call, which wi=
ll deregister Alternate Injection at a VM level (meaning it cannot be re-re=
gistered), but only the BSP&#8217;s VMSA will
 have the SEV feature bit clear.&nbsp; Once OVMF deregisters Alternate Inje=
ction, it must ensure that any AP that is already running issues the 0b00 f=
orm of the call to refresh its own SEV feature to bring it into sync with t=
he VM-wide registration state.&nbsp; In this
 example, each AP that issues the call will cause Alternate Injection to be=
 removed from its VMSA.&nbsp; On the other hand, if Alternate Injection wer=
e to remain registered because the loaded OS chose to register it, then the=
 0b00 call would have no effect on each
 AP because Alternate Injection remains registered at the VM level.&nbsp; T=
hus this call is both safe and necessary on every AP to align each AP with =
the VM-wide status.&nbsp; I can try to make this more clear in the next rev=
ision.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ge=
orgia&quot;,serif;color:blue">Call 5 is erroneous and should be removed &#8=
211; the intended text was included in Call 1 as you suspected.&nbsp; I&#82=
17;ll clean that up in the next revision.<o:p></o:p></span></p>
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
font-family:&quot;Calibri&quot;,sans-serif"> Kaplan, David &lt;<a href=3D"m=
ailto:David.Kaplan@amd.com">David.Kaplan@amd.com</a>&gt;
<br>
<b>Sent:</b> Monday, June 3, 2024 11:46 AM<br>
<b>To:</b> Jon Lange &lt;<a href=3D"mailto:jlange@microsoft.com">jlange@mic=
rosoft.com</a>&gt;;
<a href=3D"mailto:amd-sev-snp@lists.suse.com">amd-sev-snp@lists.suse.com</a=
>; <a href=3D"mailto:svsm-devel@coconut-svsm.dev">
svsm-devel@coconut-svsm.dev</a><br>
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
font-family:&quot;Calibri&quot;,sans-serif"> Jon Lange &lt;<a href=3D"mailt=
o:jlange@microsoft.com">jlange@microsoft.com</a>&gt;
<br>
<b>Sent:</b> Monday, June 3, 2024 12:47 PM<br>
<b>To:</b> Kaplan, David &lt;<a href=3D"mailto:David.Kaplan@amd.com">David.=
Kaplan@amd.com</a>&gt;;
<a href=3D"mailto:amd-sev-snp@lists.suse.com">amd-sev-snp@lists.suse.com</a=
>; <a href=3D"mailto:svsm-devel@coconut-svsm.dev">
svsm-devel@coconut-svsm.dev</a><br>
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

--_000_DS7PR21MB352407F5564A9B1E0D137412CAC92DS7PR21MB3524namp_--

--_004_DS7PR21MB352407F5564A9B1E0D137412CAC92DS7PR21MB3524namp_
Content-Type: application/pdf;
	name="Alternate Injection Support for SEV-SNP 20240619.pdf"
Content-Description: Alternate Injection Support for SEV-SNP 20240619.pdf
Content-Disposition: attachment;
	filename="Alternate Injection Support for SEV-SNP 20240619.pdf"; size=115756;
	creation-date="Fri, 21 Jun 2024 04:40:15 GMT";
	modification-date="Fri, 21 Jun 2024 04:44:14 GMT"
Content-Transfer-Encoding: base64

JVBERi0xLjcNCiW1tbW1DQoxIDAgb2JqDQo8PC9UeXBlL0NhdGFsb2cvUGFnZXMgMiAwIFIvTGFu
ZyhlbikgL01ldGFkYXRhIDU2IDAgUi9WaWV3ZXJQcmVmZXJlbmNlcyA1NyAwIFI+Pg0KZW5kb2Jq
DQoyIDAgb2JqDQo8PC9UeXBlL1BhZ2VzL0NvdW50IDExL0tpZHNbIDQgMCBSIDE1IDAgUiAyNCAw
IFIgMjYgMCBSIDI4IDAgUiAzMCAwIFIgMzIgMCBSIDM0IDAgUiAzNiAwIFIgMzkgMCBSIDQzIDAg
Ul0gPj4NCmVuZG9iag0KMyAwIG9iag0KPDwvTVNJUF9MYWJlbF84Nzg2NzE5NS1mMmI4LTRhYzIt
YjBiNi02YmI3M2NiMzNhZmNfU2l0ZUlkKDcyZjk4OGJmLTg2ZjEtNDFhZi05MWFiLTJkN2NkMDEx
ZGI0NykgL01TSVBfTGFiZWxfODc4NjcxOTUtZjJiOC00YWMyLWIwYjYtNmJiNzNjYjMzYWZjX01l
dGhvZChQcml2aWxlZ2VkKSAvTVNJUF9MYWJlbF84Nzg2NzE5NS1mMmI4LTRhYzItYjBiNi02YmI3
M2NiMzNhZmNfRW5hYmxlZChUcnVlKSAvQXV0aG9yKEpvbiBMYW5nZSkgL0NyZWF0b3Io/v8ATQBp
AGMAcgBvAHMAbwBmAHQArgAgAFcAbwByAGQAIABmAG8AcgAgAE0AaQBjAHIAbwBzAG8AZgB0ACAA
MwA2ADUpIC9DcmVhdGlvbkRhdGUoRDoyMDI0MDYyMDIxNDAxMi0wNycwMCcpIC9Nb2REYXRlKEQ6
MjAyNDA2MjAyMTQwMTItMDcnMDAnKSAvUHJvZHVjZXIo/v8ATQBpAGMAcgBvAHMAbwBmAHQArgAg
AFcAbwByAGQAIABmAG8AcgAgAE0AaQBjAHIAbwBzAG8AZgB0ACAAMwA2ADUpID4+DQplbmRvYmoN
CjQgMCBvYmoNCjw8L1R5cGUvUGFnZS9QYXJlbnQgMiAwIFIvUmVzb3VyY2VzPDwvRm9udDw8L0Yx
IDYgMCBSL0YyIDEwIDAgUi9GMyAxMyAwIFI+Pi9FeHRHU3RhdGU8PC9HUzggOCAwIFIvR1M5IDkg
MCBSPj4vUHJvY1NldFsvUERGL1RleHQvSW1hZ2VCL0ltYWdlQy9JbWFnZUldID4+L0Fubm90c1sg
MTIgMCBSXSAvTWVkaWFCb3hbIDAgMCA2MTIgNzkyXSAvQ29udGVudHMgNSAwIFIvR3JvdXA8PC9U
eXBlL0dyb3VwL1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQj4+L1RhYnMvUz4+DQplbmRvYmoN
CjUgMCBvYmoNCjw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5ndGggNDEyMj4+DQpzdHJlYW0NCnic
xVxLc9tGEr6rSv8BVXshUhYWgzdqLxtns7ZSceJEjvaw3gNMURQTiqRBUon21293zxuYoWRqmE1V
aAocYHp6+vH1Y/D5/CxNUvyvZVmURhV81m0W9bPzs399Fa3Oz15/OD/76z9ZxFiSFtGH2/MzBuPS
iEVlXiRZFpVZUlTwyz2Me3PVRPMtPDOa01+t+OvN+dm/Jyz+T/Thu/Ozb+GJP52ffX7J1EWaMHNm
mlDME33pPC8kps6SNCuivP1TKcmirBpS0rKkLYqoasukyjg1SZrDzcAtVuBn00T93Hn5Z6L46/ii
nSzji2ayw49ZfFFPevxY4Q+d/UOE1y7xT/r11/iCpfyXqRq4oItr9Qi65yq+qCb7+KKcbOjnjR5E
k9GdNPIWR+of9N3f4sf1cRLlYl1R5Un5ItZdBCQGRKp9CS3Eoh+QWe+JtV8siH7aMlYlrI4q4Fdb
HEXcNZHEBUNv914J2FLt/jv8RtdAoIrJHV7j95Eskahtwy0tB4a35UuWdjSfWTHic1okZR5VRZ4U
xwnBd8CpEpWHVcgvViBTs3TyPXwnVsMVfn0OnzmykzVizMdJwJVUbZIPVpLVJdBa1DAmKbNSLGR4
la/jV6JoSZ8+qv9OUnFPYxb0OaVV9jSS82Br8ONWyB0MTOgBfDhZmvtwSy/SHBb1kk38GIekpk7K
9iXUDOTbvY9qv7MkLyKWkzalSV4RkbdfBXeELpErE6CmAh3Pqhcoz94QN6ke4fSiLZK6Pp5I+JqB
Jf4wBWjVhiMrT9ukaV/Cu1cBiWF5UrGXEBNww3JwfS8hxtiwDBBjQMKKKmleIElHcImPaDLS7LpC
9Wc0RQ3fGgBSrE7yBpBMii4VPqo0ZcoA/PRFS84dSxagu2xwFXLJJawHbRJ+5mrFg6t8wa+7OAej
X0x+g//nPfyx3seo6vnk5riNcVHJwAa2L6DySOE9EKWUAG7yZhSpfLibBZwL4hAMzDxzfR1wopoC
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
mc7yHFOWniWGfE1AXmNXsmeiJ0/WIBceQoaRGZZuPNRY6gjOoFsugL7/6gM+ds/coO0Sk/3ddCYt
1Uqqu33mej2lR6tau2GQTfmWh3n6gLXoArSvbnyL/5vgtq71m1F1cN0q62ScF7Q5dOE6UKetAz+6
Vg7yZY62RX0GSzcvrMyufbflvpMbKHI8AbFVTR7QyYKQqtcw0nHnPAc1D7+pU8IOzECjOp0/0CZZ
vFdBdpQqw34rWUwDFOd5rRnfOrhVeXhuNa1eU/cGmWcrTyCh4LIqB04cpCklUNTZ2O0AJMry3yxa
bKX8rfiYgOFQgX0DPpqxf42K/AuVvHT01toJZTspvlHYXiU7RRkfviFM22tNHGVEI/SI/LC3Okpd
Gcy65cyC++jVHVpqQh5lK9Iky30cOoH44Ls7He/FMXvOVuTcgKfrpcyezkyjpjI4Oo2om8wGx8zB
YnL3dYoKFuagEQG716TbQ57qPvemQx3JKf854QPdqDoHz5Q2mkletFHqSavQuawcX+RxiEnjWMVo
YHA07akOBnUWe/AulOZk/jmll5N4VqF9abjXi2EvrndedXJgro7oe43NQoI0d5gbMG/dYlnXQzFn
kjL4yp3J11MpJVf+7eBLCgZpJSnYwzYvy2tyuypfQjbq5XKp1diOh1OPssC8i4ddxlEdt8Wr+fJ1
LVep/lYGWf2jhCynONQmFKMpk7wYh7CEdlzV5SGP7bSvzikF7TYAD+ehs6d409WZVYsmgK3tV4YY
nAowj/pNKAETnDXWADx0E04gtRFRgUYPA1Rild44vpzBj3Sj49Vh8m0eSjntN9VRNfNeNG4tvN7X
fMmLp75oSIi7Wvs/OcM2Nw0KZW5kc3RyZWFtDQplbmRvYmoNCjYgMCBvYmoNCjw8L1R5cGUvRm9u
dC9TdWJ0eXBlL1RydWVUeXBlL05hbWUvRjEvQmFzZUZvbnQvQkNERUVFK0FwdG9zL0VuY29kaW5n
L1dpbkFuc2lFbmNvZGluZy9Gb250RGVzY3JpcHRvciA3IDAgUi9GaXJzdENoYXIgMzIvTGFzdENo
YXIgMTIyL1dpZHRocyA0OCAwIFI+Pg0KZW5kb2JqDQo3IDAgb2JqDQo8PC9UeXBlL0ZvbnREZXNj
cmlwdG9yL0ZvbnROYW1lL0JDREVFRStBcHRvcy9GbGFncyAzMi9JdGFsaWNBbmdsZSAwL0FzY2Vu
dCA5MzkvRGVzY2VudCAtMjgyL0NhcEhlaWdodCA5MzkvQXZnV2lkdGggNTYxL01heFdpZHRoIDE2
ODIvRm9udFdlaWdodCA0MDAvWEhlaWdodCAyNTAvU3RlbVYgNTYvRm9udEJCb3hbIC01MDAgLTI4
MiAxMTgyIDkzOV0gL0ZvbnRGaWxlMiA0NiAwIFI+Pg0KZW5kb2JqDQo4IDAgb2JqDQo8PC9UeXBl
L0V4dEdTdGF0ZS9CTS9Ob3JtYWwvY2EgMT4+DQplbmRvYmoNCjkgMCBvYmoNCjw8L1R5cGUvRXh0
R1N0YXRlL0JNL05vcm1hbC9DQSAxPj4NCmVuZG9iag0KMTAgMCBvYmoNCjw8L1R5cGUvRm9udC9T
dWJ0eXBlL1RydWVUeXBlL05hbWUvRjIvQmFzZUZvbnQvQkNERkVFK0FwdG9zIzIwRGlzcGxheS9F
bmNvZGluZy9XaW5BbnNpRW5jb2RpbmcvRm9udERlc2NyaXB0b3IgMTEgMCBSL0ZpcnN0Q2hhciAz
Mi9MYXN0Q2hhciAxMTcvV2lkdGhzIDQ5IDAgUj4+DQplbmRvYmoNCjExIDAgb2JqDQo8PC9UeXBl
L0ZvbnREZXNjcmlwdG9yL0ZvbnROYW1lL0JDREZFRStBcHRvcyMyMERpc3BsYXkvRmxhZ3MgMzIv
SXRhbGljQW5nbGUgMC9Bc2NlbnQgOTM5L0Rlc2NlbnQgLTI4Mi9DYXBIZWlnaHQgOTM5L0F2Z1dp
ZHRoIDU0MC9NYXhXaWR0aCAxNjcyL0ZvbnRXZWlnaHQgNDAwL1hIZWlnaHQgMjUwL1N0ZW1WIDU0
L0ZvbnRCQm94WyAtNTAzIC0yODIgMTE2OSA5MzldIC9Gb250RmlsZTIgNTAgMCBSPj4NCmVuZG9i
ag0KMTIgMCBvYmoNCjw8L1N1YnR5cGUvTGluay9SZWN0WyAyNjcuMDQgNjM5LjQzIDQwNS4zNSA2
NTYuNTJdIC9CUzw8L1cgMD4+L0YgNC9BPDwvVHlwZS9BY3Rpb24vUy9VUkkvVVJJKG1haWx0bzpq
bGFuZ2VAbWljcm9zb2Z0LmNvbSkgPj4+Pg0KZW5kb2JqDQoxMyAwIG9iag0KPDwvVHlwZS9Gb250
L1N1YnR5cGUvVHJ1ZVR5cGUvTmFtZS9GMy9CYXNlRm9udC9CQ0RHRUUrQXB0b3MjMjBEaXNwbGF5
LEJvbGQvRW5jb2RpbmcvV2luQW5zaUVuY29kaW5nL0ZvbnREZXNjcmlwdG9yIDE0IDAgUi9GaXJz
dENoYXIgMzIvTGFzdENoYXIgMTIxL1dpZHRocyA1MSAwIFI+Pg0KZW5kb2JqDQoxNCAwIG9iag0K
PDwvVHlwZS9Gb250RGVzY3JpcHRvci9Gb250TmFtZS9CQ0RHRUUrQXB0b3MjMjBEaXNwbGF5LEJv
bGQvRmxhZ3MgMzIvSXRhbGljQW5nbGUgMC9Bc2NlbnQgOTM5L0Rlc2NlbnQgLTI4Mi9DYXBIZWln
aHQgOTM5L0F2Z1dpZHRoIDU2Ny9NYXhXaWR0aCAxODgwL0ZvbnRXZWlnaHQgNzAwL1hIZWlnaHQg
MjUwL1N0ZW1WIDU2L0ZvbnRCQm94WyAtNTUyIC0yODIgMTMyOCA5MzldIC9Gb250RmlsZTIgNTIg
MCBSPj4NCmVuZG9iag0KMTUgMCBvYmoNCjw8L1R5cGUvUGFnZS9QYXJlbnQgMiAwIFIvUmVzb3Vy
Y2VzPDwvRm9udDw8L0YxIDYgMCBSL0YzIDEzIDAgUi9GNCAxNyAwIFIvRjUgMjIgMCBSPj4vRXh0
R1N0YXRlPDwvR1M4IDggMCBSL0dTOSA5IDAgUj4+L1Byb2NTZXRbL1BERi9UZXh0L0ltYWdlQi9J
bWFnZUMvSW1hZ2VJXSA+Pi9NZWRpYUJveFsgMCAwIDYxMiA3OTJdIC9Db250ZW50cyAxNiAwIFIv
R3JvdXA8PC9UeXBlL0dyb3VwL1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQj4+L1RhYnMvUz4+
DQplbmRvYmoNCjE2IDAgb2JqDQo8PC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3RoIDQyOTQ+Pg0K
c3RyZWFtDQp4nM0da2/cxvG7AP0HAv2iK3wsd5fLR2AIsORHXCStGxvOBzsfztJJuuakk3knx86v
78zsk+SuJMtLpwWs3PFIzuzsvHdm+nF/r8gL/F/LeFZkFfytW551y/29X/+eXe3vHb3Z3/vHc5Yx
lhdl9uZsf4/BfUXGMinKnPNM8rys4JdLuO/F6yY738I7s3P61upvL/b33h3w2W/Zm3/u7z2DN/5n
f+/jt4Aui5z5kAmghpN9LZxvRKbmecHLTLT/L5jURZtX1Qib3WzODy5mzcFyNpeA21wcvH77esaK
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
VojG0CbseRNS5LKN0SvlEYOkGoQIoD/txBFn9wYZMFcVZPfqrC86galMWX/SijczabJBpYw1GDoF
w5WVx3heJ+QE8QrNnYugknSkgUCBjgC6c/6IS0GqNM/ZWGT6LpA6HFijdXHzHQWnIgiC5h3LyV7W
KDxsKGHZQJNzFiMEmcRzUwzZ86VU6sW4pZemLqmzA4GtO7sgBYCFYQnzDSJn7Xfgk5JX2PEa5ZPa
z0MORhj3M/TBNNmHvhsxzSADPcxqslDIL+oz4c2/Z6V6LyXr3PjVrznaikyE3pp86cqeJYzPTrqF
MTo266xELmGhsSgZlo1EyJvSBJUSq94jgLiUMzOER6fcbThniyX6pySU815ul2aTxseAI9oag7W9
Y3cepeffpslZEfD9l2a5Kq4K+duBtHEGxty0TPiTjua2tUK3TM2F6ZmybRWjQ7BT2wK2sxTSg93g
1/WA5YO1k5UZBZfQaxVljZwZJFyGgVrTUqCWpTQkknq9Ipv1qqP/Cwo5iNUc1abQf2VRYpl8BCV3
zmTLawgTUkJu1+/lTt9Sn05bPFjU/wArCayjDQplbmRzdHJlYW0NCmVuZG9iag0KMTcgMCBvYmoN
Cjw8L1R5cGUvRm9udC9TdWJ0eXBlL1R5cGUwL0Jhc2VGb250L0JDREhFRStBcHRvcy9FbmNvZGlu
Zy9JZGVudGl0eS1IL0Rlc2NlbmRhbnRGb250cyAxOCAwIFIvVG9Vbmljb2RlIDQ1IDAgUj4+DQpl
bmRvYmoNCjE4IDAgb2JqDQpbIDE5IDAgUl0gDQplbmRvYmoNCjE5IDAgb2JqDQo8PC9CYXNlRm9u
dC9CQ0RIRUUrQXB0b3MvU3VidHlwZS9DSURGb250VHlwZTIvVHlwZS9Gb250L0NJRFRvR0lETWFw
L0lkZW50aXR5L0RXIDEwMDAvQ0lEU3lzdGVtSW5mbyAyMCAwIFIvRm9udERlc2NyaXB0b3IgMjEg
MCBSL1cgNDcgMCBSPj4NCmVuZG9iag0KMjAgMCBvYmoNCjw8L09yZGVyaW5nKElkZW50aXR5KSAv
UmVnaXN0cnkoQWRvYmUpIC9TdXBwbGVtZW50IDA+Pg0KZW5kb2JqDQoyMSAwIG9iag0KPDwvVHlw
ZS9Gb250RGVzY3JpcHRvci9Gb250TmFtZS9CQ0RIRUUrQXB0b3MvRmxhZ3MgMzIvSXRhbGljQW5n
bGUgMC9Bc2NlbnQgOTM5L0Rlc2NlbnQgLTI4Mi9DYXBIZWlnaHQgOTM5L0F2Z1dpZHRoIDU2MS9N
YXhXaWR0aCAxNjgyL0ZvbnRXZWlnaHQgNDAwL1hIZWlnaHQgMjUwL1N0ZW1WIDU2L0ZvbnRCQm94
WyAtNTAwIC0yODIgMTE4MiA5MzldIC9Gb250RmlsZTIgNDYgMCBSPj4NCmVuZG9iag0KMjIgMCBv
YmoNCjw8L1R5cGUvRm9udC9TdWJ0eXBlL1RydWVUeXBlL05hbWUvRjUvQmFzZUZvbnQvQXJpYWxN
VC9FbmNvZGluZy9XaW5BbnNpRW5jb2RpbmcvRm9udERlc2NyaXB0b3IgMjMgMCBSL0ZpcnN0Q2hh
ciAzMi9MYXN0Q2hhciAzMi9XaWR0aHMgNTMgMCBSPj4NCmVuZG9iag0KMjMgMCBvYmoNCjw8L1R5
cGUvRm9udERlc2NyaXB0b3IvRm9udE5hbWUvQXJpYWxNVC9GbGFncyAzMi9JdGFsaWNBbmdsZSAw
L0FzY2VudCA5MDUvRGVzY2VudCAtMjEwL0NhcEhlaWdodCA3MjgvQXZnV2lkdGggNDQxL01heFdp
ZHRoIDI2NjUvRm9udFdlaWdodCA0MDAvWEhlaWdodCAyNTAvTGVhZGluZyAzMy9TdGVtViA0NC9G
b250QkJveFsgLTY2NSAtMjEwIDIwMDAgNzI4XSA+Pg0KZW5kb2JqDQoyNCAwIG9iag0KPDwvVHlw
ZS9QYWdlL1BhcmVudCAyIDAgUi9SZXNvdXJjZXM8PC9Gb250PDwvRjEgNiAwIFIvRjUgMjIgMCBS
Pj4vRXh0R1N0YXRlPDwvR1M4IDggMCBSL0dTOSA5IDAgUj4+L1Byb2NTZXRbL1BERi9UZXh0L0lt
YWdlQi9JbWFnZUMvSW1hZ2VJXSA+Pi9NZWRpYUJveFsgMCAwIDYxMiA3OTJdIC9Db250ZW50cyAy
NSAwIFIvR3JvdXA8PC9UeXBlL0dyb3VwL1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQj4+L1Rh
YnMvUz4+DQplbmRvYmoNCjI1IDAgb2JqDQo8PC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3RoIDM4
MjU+Pg0Kc3RyZWFtDQp4nM1d3W/byBF/N+D/gUBfzMJmueQuP+6eesX1kKLXa5Hg7uGQB8W2bOEU
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
5Ur0jhYfxSoLZ3Ks1z47HVAbGDqH2EYzxK3VXV+Uib88Enqxtj5AQxuYsNghwA5btJgRiFDmkFuC
32+TCGTI91c5jSlSWN3EiCbKzL2QOcLGOveHJWJI0XpvD04mhKmky+fdJKqo2WXeI6qRRJLQbOlo
CZvnGmp0Diz55Q/+fkD/vwq+rc4NCmVuZHN0cmVhbQ0KZW5kb2JqDQoyNiAwIG9iag0KPDwvVHlw
ZS9QYWdlL1BhcmVudCAyIDAgUi9SZXNvdXJjZXM8PC9Gb250PDwvRjEgNiAwIFIvRjMgMTMgMCBS
Pj4vRXh0R1N0YXRlPDwvR1M4IDggMCBSL0dTOSA5IDAgUj4+L1Byb2NTZXRbL1BERi9UZXh0L0lt
YWdlQi9JbWFnZUMvSW1hZ2VJXSA+Pi9NZWRpYUJveFsgMCAwIDYxMiA3OTJdIC9Db250ZW50cyAy
NyAwIFIvR3JvdXA8PC9UeXBlL0dyb3VwL1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQj4+L1Rh
YnMvUz4+DQplbmRvYmoNCjI3IDAgb2JqDQo8PC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3RoIDQ0
MzQ+Pg0Kc3RyZWFtDQp4nM1dW3PbNhZ+94z/A2f2RdqJuLxfuk9OxkncaVpv5Lo70+6DrIvNWqYU
ik7i/fWLcwAcACQhywnU2T5kaEriAc71Oxewn05PAj+A/8ow8gIvY//mZeQ1y9OT3/7u1acnr69O
T/7xNvTC0A8S72p1ehKy7wVe6KVx4keRl0Z+krFPHtj33k0L73bHnund4l+l+Ovd6cnvo2T8H+/q
x9OTc/bEf52efPoe0knghzplJCjoeC+l852LySM/iBIvLv9fVpIHpZ9lvdVMr6cfxjlb1CQebcbl
6AYuduNitBxP0lHDLj6PJwn7K2V3JxH/Ystu38FfM/aLlm7DX3ixXo4T9ruMP2TtTsRhWfpBaNvL
xB2hKIj8PLYRIv7U7ALZUiEXqnEYqn0jK/BWDR+2xNQG/n0ch9loy7kpGYhfFmzO+YeN/JVBE3/y
ahyLn8GjPSk4FMzmcT0Oo9ECbuIn8zGXLy4FSeACHphcxWLz0RcmNS7WFmQOt6pWrmaFG6zZ1UJS
4sRrqT43tIWWEylerut7rDuK/SSySST/gW0kcEgtLnyr+B3uShhnViZ+WPQIzWqQw0IyGNkKCjGb
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
iXwxiUbot7tl7dTPATUbsQ5y6MumO98w6TZtMTKsjAo3mvGDhy/2rPWY+qK6I6/OchuRUVhbqcMS
ag4zQBYGOa3VlvD6DQuhP0Y7qdt7hkzAljBOPNAYB3aucGrw/C28XOei09ri+SYOiGCgVzBVDYZA
Wrr0wEkrrrtXeBgfG3g3/tB0klCnzVb2SRrK9vcPm0zkmyJEU/SPscuTYSnM0g5uA4s4Mch1/vvo
lUv75QU8C+/6UfdFNtZx7sRZzMs6M2c65LD3APr1cFv60m8ZkvuBZathJfMF5Bu3qpmwPDbJbOxd
mH5wANw7LdcFVvX6vQvxXNtmEfhl0KdKWdbAyIue0Hdf23BgydaplWShbRdOzTGC/ucedtmOcqj/
l4Fo1+ysiHWwnHlApaCVz7mvgAQdBtl81t2op7JVbnowu7Wd6Z1TheNUJDaGtztjf9J7dxj9P7Xc
mtkNCmVuZHN0cmVhbQ0KZW5kb2JqDQoyOCAwIG9iag0KPDwvVHlwZS9QYWdlL1BhcmVudCAyIDAg
Ui9SZXNvdXJjZXM8PC9Gb250PDwvRjEgNiAwIFIvRjUgMjIgMCBSL0YzIDEzIDAgUj4+L0V4dEdT
dGF0ZTw8L0dTOCA4IDAgUi9HUzkgOSAwIFI+Pi9Qcm9jU2V0Wy9QREYvVGV4dC9JbWFnZUIvSW1h
Z2VDL0ltYWdlSV0gPj4vTWVkaWFCb3hbIDAgMCA2MTIgNzkyXSAvQ29udGVudHMgMjkgMCBSL0dy
b3VwPDwvVHlwZS9Hcm91cC9TL1RyYW5zcGFyZW5jeS9DUy9EZXZpY2VSR0I+Pi9UYWJzL1M+Pg0K
ZW5kb2JqDQoyOSAwIG9iag0KPDwvRmlsdGVyL0ZsYXRlRGVjb2RlL0xlbmd0aCAzODk1Pj4NCnN0
cmVhbQ0KeJzNXFmT27gRfp+q+Q98FFMWw/t4tB2v16k4mWS8zlat8yCPpDHXGnFMST721wfdABoA
AWgOQ671w1iiKKHRd3/d4KfzszRJ4V+X5VEa1exv0+XRuDo/++9fou352bM352d//SmLsixJy+jN
+vwsY/elURZVRZnkeVTlSVmzT27YfS8v2+h6x34zusZ3nXj38vzst1kV/y968/fzsxfsF/99fvbp
e5Yu0yTTV8YFxTrRQ9f5TmKaPEnzMiq6PwslTdoldW1Rc4ir2S6e57NVPK8Ybc1sWMfwYl7Mnm72
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
NZIFRQglA+iYDtcf/GmMmU4ZQv0/rPlamw0KZW5kc3RyZWFtDQplbmRvYmoNCjMwIDAgb2JqDQo8
PC9UeXBlL1BhZ2UvUGFyZW50IDIgMCBSL1Jlc291cmNlczw8L0ZvbnQ8PC9GMSA2IDAgUi9GMyAx
MyAwIFI+Pi9FeHRHU3RhdGU8PC9HUzggOCAwIFIvR1M5IDkgMCBSPj4vUHJvY1NldFsvUERGL1Rl
eHQvSW1hZ2VCL0ltYWdlQy9JbWFnZUldID4+L01lZGlhQm94WyAwIDAgNjEyIDc5Ml0gL0NvbnRl
bnRzIDMxIDAgUi9Hcm91cDw8L1R5cGUvR3JvdXAvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdC
Pj4vVGFicy9TPj4NCmVuZG9iag0KMzEgMCBvYmoNCjw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5n
dGggNDEyND4+DQpzdHJlYW0NCnic3Vzrbxs3Ev9uwP/DAvdFOkR7y33v3Sc3TVMXTS5nu84BTVEo
lqxsK2sdSXbq/vXHGXKG3AdlW6FwhwsQQ/skOe/5zXA/Hx9FYQT/KhEHUZDLv0UVB+v58dH7vwar
46NvLo6P/vadCIQIozS4uD4+EvK+KBBBlqRhHAdZHKa5vHIj73t9XgaLjXxnsMCjSh+9Pj76eZSP
fwkufjg+eiXf+K/jo89fM3QahcIeGQfU4wTPHecrJ1PEYRSnQVL9r8ykiKowz3uzeTmeJKNmPc5H
8/Ekk5OTh+/GIh6tG3luO57Eo+aqWYZwCi8+e/rumYk0C7PSNbP3MOQnmMB8nI1W8AMncDVORutx
iWencoLpqF6Ni9ECfgXyxzSAXyu8Q67oy1idvoezL+WPdz8F8hQe1tNxpV66lbfzWB6XmERlmGZf
SfwXTHw89UkvHs9s4MydPLqVS7uFM8t6LCL1wpk8h3ddynW+gTvPTwK4egNX4Sl8HBavX6aJxmdq
+LVRtPdGFC2ReZWGouwR5fzVZQADXtNkgElbWuZ6vgFuKtoE8sQNiwEIxieauEUpouzJEui4JS6v
V62XM0VPQZp+w8fgjUCAulkZepfqfjlmbh5qrunXwMBXY5GOpsslXJHMEUqYWWDv5YtQEt79FAY0
/9Nr4p2U59y+p7dCtXp4E0owrEhzrFCTWNHpjygfSjxAOvyZXmn1CxdDDyA5RRmWcW+gk+V2DsbB
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
L0YxIDYgMCBSL0Y1IDIyIDAgUi9GNCAxNyAwIFIvRjMgMTMgMCBSPj4vRXh0R1N0YXRlPDwvR1M4
IDggMCBSL0dTOSA5IDAgUj4+L1Byb2NTZXRbL1BERi9UZXh0L0ltYWdlQi9JbWFnZUMvSW1hZ2VJ
XSA+Pi9NZWRpYUJveFsgMCAwIDYxMiA3OTJdIC9Db250ZW50cyAzMyAwIFIvR3JvdXA8PC9UeXBl
L0dyb3VwL1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQj4+L1RhYnMvUz4+DQplbmRvYmoNCjMz
IDAgb2JqDQo8PC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3RoIDM0OTY+Pg0Kc3RyZWFtDQp4nN0c
aW/byPW7Af8HAvtFLKIph+TwSIsC2cJOXWyOrlVvgSQIGFuyuStLjiTb8f76vjcXh5wZ2/EOjaIB
ItC83pt3X8Ov+3sJSfBfTdMoiQr4Les02sz39375U7Ta3/txtr/350MaUUqSPJot9vco3JdENGJZ
TtI0YinJC7hyCfe9Pq6i8y28Mzrnf9Xyr9f7ex8mZfwpmv1zf+8A3viv/b2vfwR0nhBqQuYAJZzo
e+H8QWTKlCRpHmX1/womZVKTorCwaVfxNJ2cxdNs0p7G2aSJ68kOT8GFcnIeT3NAGC7exjSfXPAL
eNtFXInz85jB0/LOeThm0jInVeHDehoSUEVY5QO0g3VuWlz2eVyoRbLJZn4W4XEbUzrhFMQb5/EU
LuET11c7uGuLFyIgTrOBh/lVTrNmiffMm5hKyt/BZX5FcAMf2Zrvu+GwkO4InN/5ESCWgiH6HDLl
Dm+9gkuDh/F9641mJ0dc4jcVXF9u1FPNGbzxTtxbAqJfr9sN3i94Dbd/twg/KJ1FnRNaOcgPGK4j
gPvbXK7+SiAAP5w3DaKJlPkNlsBPrxeKHrdxJ7JKevmFZUwTsdQbxZhluCWlSUJy5ltSQNFNE4BQ
+gBpCVrBAWd1KxQbWXnTE0iXGG/w9zqmhaA4f3SrtF4KtHwcyX8dq2fwtHwX/HBS3/XlzhByKb4b
ENJCsomD/xiTgEKW04ykmY9QQQExwqgP0DuQx5WDKF+AFG2fwEjSNRJ5M9/izZwH65VSwI6M59x0
BFdHMIpV6lVHYNCjREYuRgsbrmqnDZFeLHc1kZayC/5CJowP12+UYG17+Y0ZDahGmVAj95pD6mtW
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
CHnFJ45T1ycxvuiRkW0/ne0Ke1KFMdnkIWetI85G1bPMD91g4iw/cjMMN+UH8sqJ+g6PUYVU0OzR
Wnyy7dD5vTenuyYRFwXeLwREc7Q1fLOI3N+URiqptkuesvYmQ/Km7eqZwfmSMtdHNH5X3wLCiYWw
H+9ghOVeuIMF/heAM3j8DQplbmRzdHJlYW0NCmVuZG9iag0KMzQgMCBvYmoNCjw8L1R5cGUvUGFn
ZS9QYXJlbnQgMiAwIFIvUmVzb3VyY2VzPDwvRm9udDw8L0YxIDYgMCBSL0YzIDEzIDAgUi9GNSAy
MiAwIFI+Pi9FeHRHU3RhdGU8PC9HUzggOCAwIFIvR1M5IDkgMCBSPj4vUHJvY1NldFsvUERGL1Rl
eHQvSW1hZ2VCL0ltYWdlQy9JbWFnZUldID4+L01lZGlhQm94WyAwIDAgNjEyIDc5Ml0gL0NvbnRl
bnRzIDM1IDAgUi9Hcm91cDw8L1R5cGUvR3JvdXAvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdC
Pj4vVGFicy9TPj4NCmVuZG9iag0KMzUgMCBvYmoNCjw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5n
dGggMzkxNz4+DQpzdHJlYW0NCnicvVxtc9s2Ev7uGf8HztwX8cZi+f5y39zEaXWTpI7tuL1pbjqy
LVm8MqJDUUn97w+7IBYgSCitArYzdWyK5C4W+/rsQp9OT3zPh/+KIHR8J2U/syJ0mtXpyc//dLan
J9/fnJ589ypwgsDzY+dmfXoSsPt8J3CSKPbC0ElCL07ZJx/ZfT9c587jjr3TecS/iu6vH05Pfp3l
7n+dm3+fnlywN747Pfn0LaRj3wtUykiwo+P8VTrfyEwWen4YO1Hxt3ISOUFs4CTzUy/LOTeen+S5
43thBj+j3Gkex65eMX6dObsesFXc/zq7vj1us8a4ynPcpiO5OkKKZlYCP2cSOp6V6zeOm8wu3Xk8
a+q2vmd/1JWbMhbn0ezFZsl+3brR7HHlxrOdPbbDKPHS4G+X4AFlT/PCK/KBwv+8WW0tEgv80AuM
xM4rNwhnrTsPZyu2Ec2W/Vi2bAtW7jzhW7JwA5/tCLvjf3jx3g1i/kRZuzn/BG8s3SBgOyb+XN63
pVvMPouXnbFNxQ9qdhWfquDNz6AIeL1lb9sITvDK9e013PKG3om0l+J5x81mH+HVyy0jsnxkCiPZ
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
oS+Ahg+PaGwGGfSged2o9TqifXAbCVOAHmqALPsqcghB+Mrxg3lEO7ZSsmVjMP4HI/fjrQhvN2Pe
5YcfCfP53twNshil4gKPDRt2wH6UChi9bHhExH6UMhCyr7wGQlqUCiaJUou3ixuoNTWI4noBqnW5
4GhaZztV+VkNPl1lpPb3ERhak27jn0hgPnba9HpxiWTwj69jdv1B3P7ph0Or1tyq9d3LCm+YYhx0
3fOekxbfp8DkI72ndAt23WWRQkI0zjPogvAtA31Qtmr0eIhyqEIeIxFnzRQN7DThQSiWTM/LLp46
4vAT79ECuPZewGaygU9FFnZgZAzvyVw5Ffa7AtOqg423Aji8fG3xa34iH774Y1zME0z9CVVMI5gk
0wm+rYcxjGpvUsL+OemtEHZJKRKqh1UYkVU1BpZt4nk+9ssNhBSvNLc7ixMWaGnjZMGeyBaalbMT
Nm8sP9F/BZZPTAcwK2pgUbEmU7NUd2HaGTWLY7wxAB8GRokPHOqxl9fA1xkZFRTFsOthu0OB3b5h
v+Fozrlz3wACpddZE/iAGL61avz8NYfeKFUwTxRlw28BeiFawjIb5fP45iYoZdSyUOkDw8sHSmjk
SN2hAGCx7ZXj5o4Ly+pomg/HCQyE+ke7KKThfK+hg/BCeI2qwjPG1DY8hyosleAXfdfHgzrWZl3d
onDsK660LBO4X95v6ES/trESn1C/IqAPXoiCMu8OlTzq6NuD8qbOfRIsQHW7rFEtnxyJMpMoJqiA
gsyz1uI7VACN0plAh0bpvNoLx8QnYwBioB6SOtcjoqhpmFXpoFN6Y/GIRxj6GOinFhb0QuPAQEdP
YzLlmyY0a1IKujXlz6NTHb0uDM47gPXse4cZ+2ciAbpAq6eKhp7tzWbW+y0N0YpxKrmb8kABHSDo
ncSfQAP59/UNpNqInsOGQNC+P8E0oPtWG21AxPgNeKCRsDBU6/sV/2oNu52DMEm9MDEtS5Pf/wH9
NzybDQplbmRzdHJlYW0NCmVuZG9iag0KMzYgMCBvYmoNCjw8L1R5cGUvUGFnZS9QYXJlbnQgMiAw
IFIvUmVzb3VyY2VzPDwvRm9udDw8L0YxIDYgMCBSL0YzIDEzIDAgUi9GNCAxNyAwIFIvRjUgMjIg
MCBSPj4vRXh0R1N0YXRlPDwvR1M4IDggMCBSL0dTOSA5IDAgUj4+L1Byb2NTZXRbL1BERi9UZXh0
L0ltYWdlQi9JbWFnZUMvSW1hZ2VJXSA+Pi9Bbm5vdHNbIDM4IDAgUl0gL01lZGlhQm94WyAwIDAg
NjEyIDc5Ml0gL0NvbnRlbnRzIDM3IDAgUi9Hcm91cDw8L1R5cGUvR3JvdXAvUy9UcmFuc3BhcmVu
Y3kvQ1MvRGV2aWNlUkdCPj4vVGFicy9TPj4NCmVuZG9iag0KMzcgMCBvYmoNCjw8L0ZpbHRlci9G
bGF0ZURlY29kZS9MZW5ndGggMzg5OD4+DQpzdHJlYW0NCnic7VxZb9tIEn434P/AR3ERcdk8muRi
1oBiy4EXieOVFCfAeGAo8TGalSWNjhzz67eq+mDzaNmWW9mXDRBZ4lXV1XV+Xc0/Dw/CIMR/BYu8
0OPwmRWRt7w9PPj4N292ePB6dHjw91PmMRaEiTe6OzxgcF3oMS+NkyCKvDQKEg5nHuC6N8Pcu1/B
M717+lXIX28OD37tFP5v3uhfhwd9eOK/Dw/+fAnpJAyYSZkISjrec+m8kJksCsIo8eLip3IS2znJ
wiLgXHAThDkcCYM44/CZMm9533Z0QPz2Ls78btI59vyi08dvD37c2Uzh19jvxp01fkx8FnXms2cP
zc41S7IgewHXx4Kju8m9zzubpZ8Bt5lk1imjEYuDNN6d0auOz1jneDz1k84U2fP8vMP8btS58h1y
CeIsst253FFgWyyDF0nA8oZ1jH6frPwU6IEkvoCijadTlIUHk3fVGV4OfRZ23uGRazgJqnl87bMY
Zhsufw8SPD89e/NhgL/61+5YjpIoyJmN5T5yQDx9AC7f9kZn70Hnzt2Rj0M4ZCV/5UthsQQU3u+m
oOV5ZzlHU52iuFZCgHDNN5DQ73DyVl2lfyw9OLXGC/UhFPk9PmQD83EL/+k5eFc5OTM8jxc+4B1j
8An/gf/ydrhoQ7cZD5zfqW91Ys71K8uDPGpIC1ToHVAn7lB9gF36fgEC44Kp+RfyHaR3gR+L8/Rx
huK80+LsTfFCukcIEUYzw18oCHlYCuJshp9/oKnTpSg9umKCh2Da5HWTlSlfFN9ySeKHe2Zwiu6Z
/lBix+cLip/h2/QWJvFGcJsZD62LWmmLtC1igZ5yr577lTw+yQWH+AG/vVKiEIpjjk6qCeOCwkox
WioKCGQmjjifZx4HcTPeT4gc0l7ePpCkTAmSfJZqtDfqPF2u5PQg1X4m1F7e1Ry8voGkQMJc6Vvw
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
WkEBFe4Wem1pKdoIKpsNdJw0EIFmjHSJCSjNTHEvyy49XL0TFJosySfU2jSVHW9ZiyttNsvo4RtL
DZnChZwi7QmzjROTnacGljLpsyM4rSmNDjDU7KX7tea3K09tXJ6v9wJgsJi6Oeqj1us2plJyY1eA
dNgKg9a7L2pvxNKYkbpPtiU9AdRx6WyKICxsQ3X5TrwsQRDLQuiih+Yw6OG71vqjvk8LBw6b4mnT
oIV2bSN+ZWvP8na9wdmcyWrHNUSFvZYFs3HmHqJikBzvUqAfi1djZvhqTHI+WEFIeGpm4FFQeFBx
uJCtF6Dwl7e0xJmLn7haSY6eUBp65WBWvscywYc7BSZiAiZ2HbZ7n1LEUJw0Z9rlaywh8l326dTo
vc/SDjbiyGeZBT4+oNpk/4LmGL3zrWwVx9S3ZfuyegdkpSTdshikF7Z4bUMcrQ94auud601Y6i24
eRC1vB3YlOMKgZJJrWm4+sLAyQNFi0Z/kljrz1vu7m55aYB8PMXEH/RqHPVg3AQhCi4pnMTYyqmn
aDpBQl9VDS7XkMsVpTGuC2yTt9k9XX8/4ERMu9pIV0nSyncKWmWhlEcIhC6R732pzOx/AVPmIloN
CmVuZHN0cmVhbQ0KZW5kb2JqDQozOCAwIG9iag0KPDwvU3VidHlwZS9MaW5rL1JlY3RbIDExMi4x
OSA2MzIuNzkgMjg4LjM1IDY1OC4yM10gL0JTPDwvVyAwPj4vRiA0L0Rlc3RbIDI2IDAgUi9YWVog
NjkgMzczIDBdID4+DQplbmRvYmoNCjM5IDAgb2JqDQo8PC9UeXBlL1BhZ2UvUGFyZW50IDIgMCBS
L1Jlc291cmNlczw8L0ZvbnQ8PC9GMSA2IDAgUi9GNSAyMiAwIFIvRjMgMTMgMCBSL0Y0IDE3IDAg
Ui9GNiA0MSAwIFI+Pi9FeHRHU3RhdGU8PC9HUzggOCAwIFIvR1M5IDkgMCBSPj4vUHJvY1NldFsv
UERGL1RleHQvSW1hZ2VCL0ltYWdlQy9JbWFnZUldID4+L01lZGlhQm94WyAwIDAgNjEyIDc5Ml0g
L0NvbnRlbnRzIDQwIDAgUi9Hcm91cDw8L1R5cGUvR3JvdXAvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2
aWNlUkdCPj4vVGFicy9TPj4NCmVuZG9iag0KNDAgMCBvYmoNCjw8L0ZpbHRlci9GbGF0ZURlY29k
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
OaFZL/0HLHTcfBV257p2kdInrIrqrnOkeRWBwT1/0cjQD7vi6wj94f9bWRex/5oGrt/o0pxqqetT
2rP+k3jKa0Fw6E+zaqodORhEf2xgwyeneE3v8X+nYjJfSR83oa72MNUFJD3Z1xrEKnh9lO48ukgs
z2p6V6M4xWZB3wmkOSdw5XZkaoO91bOoHWvSXwvxJ+0YXFfposOnwYqrKMldgHSirrePUROnqrfp
vvQQqT7nrXehFQuVPBSy6rGykuKKUbYdlZAHD3tqVvLEoJiFndBz620lPN/6yKqq78y4KsYajO2O
9Ti9JqWgj+oD2b51aHSBVIG4fdreEYNML332NOsUy0oOLj19mi9ziSPLo1JOwuVVBcFgUuJnWslJ
uNZdPgn3FsnninNLJ12ywfICPy6pWOgNTcSvfjqa/scfGSvxbOXjZwd/uRM6jh7xG3bg1kusogfH
C/xrgBv+w+r2hq6C03AIWtbMFjyxa/hApMdRyJTM6pPJeSJni6Du5SoY3bprdMFDIS9QwaZ81L8e
XKC/am54TbQWLcLn8PFTgJyb/gg5M4vBAivyUyrLX/IAsR6sL7DV1fDRBLDZNLSAAK6W+Ap93Uzo
K3U/yHi/g4/X+PjbX/1QneZ1lOYuqv/tCUiR4XkTBxC/8qszgNEFAsEysA95vJhyL0gHnUlABf4Z
SrDVaD5uiM0Nsn1NYyNafg0/JuEFWYwYs9yFrF+OVHkPEBonTEqRaj812W5DBJdRuCB+uGfnfCjh
43mM7P6EnH/+E34N6MQMbhW+QfBxT1qJ+WBZupD1K4Oy+Ltl0AvxXhkw+Mg+EeO1IYt9MTyGPDx1
YdYi/3/ZPUP+DQplbmRzdHJlYW0NCmVuZG9iag0KNDEgMCBvYmoNCjw8L1R5cGUvRm9udC9TdWJ0
eXBlL1RydWVUeXBlL05hbWUvRjYvQmFzZUZvbnQvQkNESUVFK0x1Y2lkYUNvbnNvbGUvRW5jb2Rp
bmcvV2luQW5zaUVuY29kaW5nL0ZvbnREZXNjcmlwdG9yIDQyIDAgUi9GaXJzdENoYXIgMzIvTGFz
dENoYXIgMTIzL1dpZHRocyA1NCAwIFI+Pg0KZW5kb2JqDQo0MiAwIG9iag0KPDwvVHlwZS9Gb250
RGVzY3JpcHRvci9Gb250TmFtZS9CQ0RJRUUrTHVjaWRhQ29uc29sZS9GbGFncyAzMi9JdGFsaWNB
bmdsZSAwL0FzY2VudCA3ODkvRGVzY2VudCAtMjA1L0NhcEhlaWdodCA3ODMvQXZnV2lkdGggNjAz
L01heFdpZHRoIDYzMC9Gb250V2VpZ2h0IDQwMC9YSGVpZ2h0IDI1MC9TdGVtViA2MC9Gb250QkJv
eFsgMCAtMjA1IDYzMCA3ODNdIC9Gb250RmlsZTIgNTUgMCBSPj4NCmVuZG9iag0KNDMgMCBvYmoN
Cjw8L1R5cGUvUGFnZS9QYXJlbnQgMiAwIFIvUmVzb3VyY2VzPDwvRm9udDw8L0YxIDYgMCBSL0Y2
IDQxIDAgUi9GMyAxMyAwIFI+Pi9FeHRHU3RhdGU8PC9HUzggOCAwIFIvR1M5IDkgMCBSPj4vUHJv
Y1NldFsvUERGL1RleHQvSW1hZ2VCL0ltYWdlQy9JbWFnZUldID4+L01lZGlhQm94WyAwIDAgNjEy
IDc5Ml0gL0NvbnRlbnRzIDQ0IDAgUi9Hcm91cDw8L1R5cGUvR3JvdXAvUy9UcmFuc3BhcmVuY3kv
Q1MvRGV2aWNlUkdCPj4vVGFicy9TPj4NCmVuZG9iag0KNDQgMCBvYmoNCjw8L0ZpbHRlci9GbGF0
ZURlY29kZS9MZW5ndGggMjIwOD4+DQpzdHJlYW0NCniczVtLc9s2EL5rRv8BuUmdCAX4AEl3cmkn
zaTTTFvHkx4UHxS9rIkejiQ7Tfrni28pUIwMKFNnRcUHmhAhfdj3Lhb80G4pqfBX6EgoYew1KyKx
Hrdbf/8glu3Wz1ft1o+/aqG1VIm4mrRb2s5TQos0ymWc2H8yMfbJws578ToX0439TTGlUbEbvWi3
RM8C6dROHPY7WnevxdVv7dZz++t/tVsfvmUZiZK6vgoCJ8x+R/xfnG9cTBZJFSUiLhpdiRGFbxWZ
juThQkgMUUZSEPbvcXI4BCxiaQKA/c7tuGs6626v6ExWuFvYi8BwtrR3W3q67PZMZzDHk+e4/eMl
bmf2MhH2co/p4yGmr9yP0dMNno5H+Mp0zENLVBTSFAFaejwYsUqlCmFsQd0a1E2noG6NCz4bMYGn
iVRZAJxJIZwGqvioBo7nGyapWQ3MEj8gN1GmSJo1Kx9gvzOC4WygF0NoyOwW1oHhCsN+Zi8XCoZx
DRu5eIZbcYOZ0Kqb6ttbPCYbXZKSQfGWmCLm+Mr4Huo3Z1I9raTRAYK4bEsbG2gCGBuicwMubEHd
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
hQs8JZ61oh4qEOr61UCBsEqVpN4CYas836C6ffONE5rKGpFe2vhGnWgEyPtkyBvonBQvQpwS1rbh
KoT64DoJmxDug0slbEacDJdIeDF5ogXlwSKxmP5VCg6Te2cIpU+9i/zCDTRMaPhmEE0ej32S6uAo
n5e2edpGjJ5pDADXSv73Gv0rDpj+zz0M04jcZ6yEqYXRUgDyhP8GwN9B5N7idnQL4CH0A8DH0U8B
/wydA/wh+gjwx2AvximgB5O/8IDIS2bmAr4cNwFuwR7AEv4XwNfjPYD34uOAH8GPgW3DeBjaT+Kn
AP8C/wLwL/EL5EkBcu8Vv4xfA/wHfBLwH/EfAZ/CpwD/J/4r4I8waMcf408A/wOPIMzxXArgVC4d
cCZ5HpBzcJcAns7NA1zAuQCXcBWAF3NLANdx6wC3cC2A27h2wB1cJ+AN3JWAN3MQI87L9QAOckHA
YS4MuI/bDniQGwS8n7sV8J3cvYDv434I+BHux4B/wv0E8BPcE4Cf4sAv7t+4XwJ+ngO/uJe53wM+
yb0O+E3uTcBvc28D/hP3DuBTHPjI/Rf3PuAPuA8Bf8SBp9wn3OeAo1wUYR5cBZzCQ8z5TD4TsI23
AXbwDsA5fA7gKfwUwNP4aYDz+fmAF/ALAFfzNYDr+DqETUtNMNamFaYVgLtMXYCPmI4A/pHpMcSb
Tpgeh/aw6Q1ov2V6C9rvmt4DfM5sprnM03vUiDwBjYro321+zPSc6XnTryG/eOj3FEKmn5ueQWbT
iyAjg+Sg6WemZ/8HX7SX6w0KZW5kc3RyZWFtDQplbmRvYmoNCjQ3IDAgb2JqDQpbIDBbIDQ3MV0g
IDFbIDU4OV0gIDI2WyA2MDRdICAyOFsgNjkyXSAgMzRbIDY4Nl0gIDQwWyA1NTZdICA2MlsgNTI0
XSAgNjRbIDcwOF0gIDcwWyA3MDddICA3M1sgMjYwXSAgOTFbIDUwMF0gIDk3WyA3OTAgNzA2XSAg
MTA1WyA3MzJdICAxMzJbIDU3N10gIDEzNFsgNzMyIDYwNl0gIDEzOVsgNTY2XSAgMTQ3WyA0Nzld
ICAxNTJbIDY4MV0gIDE3MVsgNTg1XSAgMTc0WyA4OTJdICAxNzlbIDU1MyA1NDBdICAyMDVbIDUz
MV0gIDIzMFsgNTYxXSAgMjMyWyA1MjVdICAyMzhbIDU2MV0gIDI0NFsgNTI3XSAgMjY3WyAzMDEg
NDg0XSAgMjc1WyA1NTFdICAyNzhbIDIzOV0gIDI5MlsgMjM5XSAgMjk1WyA0ODddICAyOTlbIDI2
MF0gIDMwNVsgODUzIDU1MV0gIDMxNFsgNTUyXSAgMzQxWyA1NjFdICAzNDNbIDU2MSAzMzRdICAz
NDhbIDQ4Nl0gIDM1N1sgMzIzXSAgMzYyWyA1NTldICAzODFbIDQ1Ml0gIDM4M1sgNzIxXSAgMzg4
WyA0NDIgNDUyXSAgMzk5WyA0MzhdICA4NDdbIDUzNCA1MzQgNTM0IDUzNCA1MzQgNTM0IDUzNCA1
MzQgNTM0IDUzNF0gIDk4NVsgMjAzXSAgOTkxWyAyODYgMjg2IDI4NiAyODZdICAxMDA1WyA1Mzdd
ICAxMDA3WyAzMzldICAxMDA5WyAzNDBdICAxMDExWyA0NjBdICAxMDE0WyA0NjBdICAxMDIwWyAy
OTMgMjkzXSAgMTAyNFsgMjk0IDI5NF0gIDEwMzRbIDQ1MiA0NTNdICAxMDM3WyAyNzBdICAxMTM3
WyA1MzRdIF0gDQplbmRvYmoNCjQ4IDAgb2JqDQpbIDIwMyAwIDAgNTM3IDAgMCAwIDAgMjkzIDI5
MyAwIDAgMjg2IDM0MCAyODYgMzM5IDUzNCA1MzQgNTM0IDUzNCA1MzQgNTM0IDUzNCA1MzQgNTM0
IDUzNCAyODYgMjg2IDAgNTM0IDAgMCAwIDU4OSA2MDQgNjkyIDY4NiA1NTYgNTI0IDcwOCA3MDcg
MjYwIDAgMCA1MDAgNzkwIDcwNiA3MzIgNTc3IDczMiA2MDYgNTY2IDQ3OSA2ODEgNTg1IDg5MiA1
NTMgNTQwIDAgMjk0IDAgMjk0IDAgNDYwIDAgNTMxIDU2MSA1MjUgNTYxIDUyNyAzMDEgNDg0IDU1
MSAyMzkgMjM5IDQ4NyAyNjAgODUzIDU1MSA1NTIgNTYxIDU2MSAzMzQgNDg2IDMyMyA1NTkgNDUy
IDcyMSA0NDIgNDUyIDQzOF0gDQplbmRvYmoNCjQ5IDAgb2JqDQpbIDE5MyAwIDAgMCAwIDAgMCAw
IDI5NCAyOTQgMCAwIDI0NiAzNDkgMjQ2IDAgNTIzIDUyMyA1MjMgMCA1MjMgMCAwIDAgMCA1MjMg
MCAwIDAgMCAwIDAgODc4IDU4MCAwIDAgMCA1NDEgMCAwIDAgMjM1IDMxNyAwIDQ4NCA3NjUgNjgx
IDAgNTU2IDAgMCA1NDYgMCAwIDU3NCAwIDAgMCAwIDAgMCAwIDAgMCAwIDQ4OSAwIDQ5MyAwIDQ5
NCAyODMgNDM5IDUwNiAyMTAgMjEwIDAgMjQ0IDgwMCA1MDYgNTEzIDUxOSAwIDMxMCA0NjMgMzA0
IDUwNl0gDQplbmRvYmoNCjUwIDAgb2JqDQo8PC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3RoIDEy
MDIxL0xlbmd0aDEgMjY4OTI+Pg0Kc3RyZWFtDQp4nOx8CXxU1dX4ve+92SfJTHYygXnDJBPIZIGE
rGxD9gWyB2aykJlMJguELJOFXSIQAiOLipIoIAqKoK1OQBFs61bRfipU/9Xa2q9VtF+/yr+1VbtY
JDP/c997MySIW1vb/n5/35n33r3nnnvuueeec+65zyDCCKEgeDDIVF6dnFLyt+O/QAivA6y1umZJ
TZXk1XCEWhmob7KvsfVs0P7fUITC/gQ0nfbBflZ3OOwFhGZBHT3T2tO2ZsUtQSqEIqzAdFtb5/rW
zsdCjyE0+zGEprvaHbaWmJv//DLQXoU7vR0Qyl8EnARe86Ae076mf137mP4vUP8ZQqHRnd12W7dx
bRVChSaE5Ko1tnU90l5VOrSbgZ5d4+i3pR9bV42QA6qY6rKtcTz94E9uQaiyAqGQW3u6+/q9R1AK
Qi3vEPoep6OnZ9gbgpDh1whRQYjMnaL2PU2PVzYFLfgzUkgRuX55/8AV8n63PaX10ysTF2T1Upgz
EiMK8Rf0k2ybeBoh2YefXvnkI2hHUy+RhNDAsxJ6JYNuKaRCyZgIuTRoG6KhlWEq8a1IhKSiVOYC
dLmbf1MXUCsFK0ApEEORi2ERNQLttI/3smqWRc+ggImrvAzSUCqVRfgIaaMvinLITBFNn4clvd/r
ITf6D7yYajT675YBX/r6MlAu0O51F/3OjfmItWhU5Pz3z5NczBfIwaxEGf9KWT4z/qj36jfFm3oB
xX1VWvoyqv2m5PjMWB/eeCzGcGM8/advTjYqDwXS25Hu89oZJdruK+NHUQ/c26+nIfgvGgM/6v0R
uW/Y9jHadCO8uBVtnzz2DWWL+tetGayNXxZq41S56MfQsi/rT3XBLnA9T+WN5/6fdDEx34yOP48v
Mwb2+Cf+ZjJRIMHR3aia3o+qvwk5vr2+vb69vr2+vb69yMUkIyvc5+AuF+qzbkBTDnfzP33sJNRE
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
ZedJ4FPOZeh2xbmC9rPOVeDzzvPAF5zf0HcRnN8BX3J+D/yj8zLwded14DXnGvBvdOfXue5AuvOW
8zbwv84N4cievAt4t3wvcDv97ozcIT8E/LD8GHAgPeCKPAg8JD8JXJcPAk/Kk8ANeRp4Rp4FnpOf
BX5ewkcylOeBqUyBhSyAU/kY8HH5OPAr8mvAb8rvAL8rfwB8Sv4I+LR8GviMfAZ4VcIu+XP5AvBF
CbvkS/IPwJfln4CvyFeAr8nXgH+RfwVek7BR/l3+G/gf+SbwuoSl8m35P+A78h3h9GAq8K4efN7b
3tsOvKd3D3BHbwfw3t69wPt69wHv790P3NlbAi73loGf6h0BrvfWhdM/3Ees+0f7R4GP9B8BPtF/
AvjD/mXR6/+4/xO0r/T/jPar/VfR/kf/n8A3tm3jXO7xPXDBT/jdy7+1c7n/q/6L/V8jv3qYd1WI
/s/6vxDb+r8Fj/dRDvaf6//y/yiUbnwNCmVuZHN0cmVhbQ0KZW5kb2JqDQo1MSAwIG9iag0KWyAx
OTMgMCAwIDU2MSAwIDAgMCAwIDMzNyAzMzcgMCAwIDAgMzY1IDAgMCA1NDAgNTQwIDU0MCA1NDAg
NTQwIDAgNTQwIDAgNTQwIDU0MCAwIDAgMCAwIDAgMCAwIDYxMCA1OTkgNjc1IDY3OCA1NDkgNTE3
IDY4NiA2ODMgMjY3IDAgMCAwIDc5NCA2OTYgNzA1IDU4NSA3MDUgNjEwIDU3NCA0OTkgMCA2MDEg
OTIxIDAgMCAwIDAgMCAwIDAgNDYwIDAgNTA3IDU0MiA1MDggNTQyIDUxNSAzMTggNDcyIDUzMyAy
NDAgMjQwIDUwMCAyNzkgODQwIDUzMyA1MzAgNTQyIDU0MiAzNDMgNDg0IDMzMyA1MzQgNDc1IDAg
NDg5IDQ3NV0gDQplbmRvYmoNCjUyIDAgb2JqDQo8PC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3Ro
IDE0MTMwL0xlbmd0aDEgMjk4NjA+Pg0Kc3RyZWFtDQp4nOw8eXwT15nvzYwOS7It+cSWbY0Qkg3y
hYUvMEa2sfF9H5Jv+QIDjo0MtgFDDJgA4ggJ4UpzkKQhBwFk0iSQbrNhG7bZTUgobZYkzQG52hxN
jzTZFuzRfm9mZGxC0uy2+e0/Gc2beed3ve968/PPCCOE/OHBIGtZVUJSsfHolwjhIehtrarOqq5J
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
HfiUhNGl30t/AP5v6QyRqEyrgSfSWmAf+z1IGqCXALfSmcAdNAjcS/uBr6RfBh6kw8Ar6UrgEboa
eC1dB7yeXgu8iSJGNEY3A6doCtikJnCW3gJ8K70V+E66A/g++iDwLvoj4Mfo48A/pj8Gfpo+DXyA
wi/6M/os8AsUftFX6KvAr9N/Bf41/TXwm/RN4N/QY8DHKXykJ+n7wB/Sj4BPUXhK/0A/Bs7TPJFk
uApcLSPmsk/2ATfKjcABOQB8gXwB8GR5MnCL3ALcJncCd8vdwPPk+cCD8iCRPHM9yLVnkWcR8A2e
G4B3enYC/53nCSJ7nvQ8BXq/5w3QRz1HQb/jeRf4A6+X17LM77UT1BDBrGe/gfmE53nPC56fo75k
9DtAiOeg5zni9bwIHfWsBj3PeA7/L7dGRJcNCmVuZHN0cmVhbQ0KZW5kb2JqDQo1MyAwIG9iag0K
WyAyNzhdIA0KZW5kb2JqDQo1NCAwIG9iag0KWyA2MDMgNjAzIDAgMCAwIDAgMCAwIDYwMyA2MDMg
MCAwIDYwMyA2MDMgNjAzIDAgNjAzIDYwMyA2MDMgNjAzIDYwMyA2MDMgNjAzIDYwMyA2MDMgNjAz
IDYwMyA2MDMgMCA2MDMgMCAwIDAgMCAwIDAgMCA2MDMgMCAwIDAgNjAzIDAgMCA2MDMgNjAzIDAg
NjAzIDYwMyAwIDYwMyA2MDMgNjAzIDAgNjAzIDAgMCAwIDAgNjAzIDAgNjAzIDAgMCAwIDYwMyA2
MDMgNjAzIDYwMyA2MDMgNjAzIDYwMyA2MDMgNjAzIDAgNjAzIDYwMyA2MDMgNjAzIDYwMyA2MDMg
MCA2MDMgNjAzIDYwMyA2MDMgNjAzIDYwMyA2MDMgNjAzIDYwMyA2MDNdIA0KZW5kb2JqDQo1NSAw
IG9iag0KPDwvRmlsdGVyL0ZsYXRlRGVjb2RlL0xlbmd0aCAxNTM4OS9MZW5ndGgxIDI1OTk2Pj4N
CnN0cmVhbQ0KeJzsewl4FFW28Ll1a+nu6qW6k+5OQkJ3EgJIgARCWAMpIQHZEQUN2A4h6UBDSEI2
SPBJXECMCy6NzDCjxg1lEFRwFHRGoyYuiKOD4DBjBuOIy6AZlxnFkXTxzq2qLCBvvvfe973/+/7v
s05u1b237r1nveecW0mAAICCNx7UwqkFl4dS/rEdIB87LRsLp86Z9sNNJ2YATLIA0O/nX5Y1+sai
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
GO0TFRSv/ktsxtCQiLN7nPzcalXCnlzK1+ryHH/0UKaiJkwpRKfCtg7j9U076Y4UbiX2Xc5YqjrS
9P3jAE+tlFGR+kCH3YZtjzvTjob1i7HnXkhNkr772eqTDo9EyEQie8JZffHvLfqCKsn1RjfOmt76
qndoRcbAKw27opp9jdbTu94E+TdOB8xx7rvuezbzm5hAw65bN88/bFEtjfEvx8zNLuuysAbMs3V2
1ukcfOfzqOj2pRt3QgzwP0xK4ms0MML3n1ecRg6s2/OlSW+nb7+XjN8mS+UrKVlW4as99N8LJBLv
daeN9XvmxFdfNn7xCaD7R63abVUd99OUT1olHvDL+SNy4tDx6HKO0FDHtZ3HpO3di2koBXB7IrNo
IxyJhhIAVctgNNP/sbuzv3/ytoTJzYDQUiS5Fp8gIsHGF65gSXzgrlEb0AA0SLqAjqb2hn8jMs/z
wnbKoSNhkfJfD4WP4vIylDa9/+U+GsSKZtfyUUD/xDn2e48+Ndg3XegzPOm83m5f0xPcTDJZB/P6
efixkmczeiW+D2T+cGDXXtOZfp5NT8/lsIRzw7nK2JyVX9y0lLN4v/hXcTfyvdvx3cKs12iw4UZh
c96uIn3xlSnYr9H8f5T1uNpIahLG4rcEyG6YVuW8tTlw8FbL6nvvm9crldAN1PsTk7C+iUmKI58H
Iv+Qw/c08z975C8o+jPseRqBO6iZPXxAdwpt64uPKAWOehvU5BxGuL4nc191vJ1r+MJ6yB13ZGUQ
/oGeBl/AOc1eo4JP1aVfbh86p+A2HkGQ7nQ9oH/VKLbb8ww1OPfIVs4Cxdcn7IVFGsuEucr6TRz3
eyL+D6yONfINCmVuZHN0cmVhbQ0KZW5kb2JqDQo1NiAwIG9iag0KPDwvVHlwZS9NZXRhZGF0YS9T
dWJ0eXBlL1hNTC9MZW5ndGggMzYwMj4+DQpzdHJlYW0NCjw/eHBhY2tldCBiZWdpbj0i77u/IiBp
ZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+PHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpu
czptZXRhLyIgeDp4bXB0az0iMy4xLTcwMSI+CjxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3
dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+CjxyZGY6RGVzY3JpcHRpb24gcmRm
OmFib3V0PSIiICB4bWxuczpwZGY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGRmLzEuMy8iPgo8cGRm
OlByb2R1Y2VyPk1pY3Jvc29mdMKuIFdvcmQgZm9yIE1pY3Jvc29mdCAzNjU8L3BkZjpQcm9kdWNl
cj48L3JkZjpEZXNjcmlwdGlvbj4KPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6
cGRmeD0iaHR0cDovL25zLmFkb2JlLmNvbS9wZGZ4LzEuMy8iPgo8cGRmeDpNU0lQX0xhYmVsXzg3
ODY3MTk1LWYyYjgtNGFjMi1iMGI2LTZiYjczY2IzM2FmY19TaXRlSWQ+NzJmOTg4YmYtODZmMS00
MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3PC9wZGZ4Ok1TSVBfTGFiZWxfODc4NjcxOTUtZjJiOC00YWMy
LWIwYjYtNmJiNzNjYjMzYWZjX1NpdGVJZD4KPHBkZng6TVNJUF9MYWJlbF84Nzg2NzE5NS1mMmI4
LTRhYzItYjBiNi02YmI3M2NiMzNhZmNfTWV0aG9kPlByaXZpbGVnZWQ8L3BkZng6TVNJUF9MYWJl
bF84Nzg2NzE5NS1mMmI4LTRhYzItYjBiNi02YmI3M2NiMzNhZmNfTWV0aG9kPgo8cGRmeDpNU0lQ
X0xhYmVsXzg3ODY3MTk1LWYyYjgtNGFjMi1iMGI2LTZiYjczY2IzM2FmY19FbmFibGVkPlRydWU8
L3BkZng6TVNJUF9MYWJlbF84Nzg2NzE5NS1mMmI4LTRhYzItYjBiNi02YmI3M2NiMzNhZmNfRW5h
YmxlZD4KPC9yZGY6RGVzY3JpcHRpb24+CjxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiICB4
bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iPgo8ZGM6Y3JlYXRvcj48
cmRmOlNlcT48cmRmOmxpPkpvbiBMYW5nZTwvcmRmOmxpPjwvcmRmOlNlcT48L2RjOmNyZWF0b3I+
PC9yZGY6RGVzY3JpcHRpb24+CjxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiICB4bWxuczp4
bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iPgo8eG1wOkNyZWF0b3JUb29sPk1pY3Jv
c29mdMKuIFdvcmQgZm9yIE1pY3Jvc29mdCAzNjU8L3htcDpDcmVhdG9yVG9vbD48eG1wOkNyZWF0
ZURhdGU+MjAyNC0wNi0yMFQyMTo0MDoxMi0wNzowMDwveG1wOkNyZWF0ZURhdGU+PHhtcDpNb2Rp
ZnlEYXRlPjIwMjQtMDYtMjBUMjE6NDA6MTItMDc6MDA8L3htcDpNb2RpZnlEYXRlPjwvcmRmOkRl
c2NyaXB0aW9uPgo8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiAgeG1sbnM6eG1wTU09Imh0
dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iPgo8eG1wTU06RG9jdW1lbnRJRD51dWlkOkE1
ODdCRUY0LTE1QTMtNDFFNy1COEU5LUExQTQyNjRGQUI4MTwveG1wTU06RG9jdW1lbnRJRD48eG1w
TU06SW5zdGFuY2VJRD51dWlkOkE1ODdCRUY0LTE1QTMtNDFFNy1COEU5LUExQTQyNjRGQUI4MTwv
eG1wTU06SW5zdGFuY2VJRD48L3JkZjpEZXNjcmlwdGlvbj4KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgCjwvcmRmOlJERj48L3g6eG1wbWV0YT48P3hwYWNrZXQgZW5kPSJ3Ij8+DQplbmRzdHJlYW0N
CmVuZG9iag0KNTcgMCBvYmoNCjw8L0Rpc3BsYXlEb2NUaXRsZSB0cnVlPj4NCmVuZG9iag0KNTgg
MCBvYmoNCjw8L1R5cGUvWFJlZi9TaXplIDU4L1dbIDEgNCAyXSAvUm9vdCAxIDAgUi9JbmZvIDMg
MCBSL0lEWzxGNEJFODdBNUEzMTVFNzQxQjhFOUExQTQyNjRGQUI4MT48RjRCRTg3QTVBMzE1RTc0
MUI4RTlBMUE0MjY0RkFCODE+XSAvRmlsdGVyL0ZsYXRlRGVjb2RlL0xlbmd0aCAyMTI+Pg0Kc3Ry
ZWFtDQp4nCXQPUuCYRTG8fu2RJfKQPNtEJwzdVGHBv0KvqAITZkEIWj0ODTUoh+hdHUwN4UmtSca
BD+FIDg0RiZODb78zxnOb7zOdZTazWajd/tUqT0Pwgos33B4AM5bcB0L/3AWEW7A7QbPidABbwF8
OfBX4PwZQloICJ9wYRPWEG5B5BGiT5D8gNQXZK4gewfXP1D6A6MI9XtolKEpNV+O4DUGXRPepFEv
DcOUsITRAsa/MJnBlOO1ZQ7Wd7DxT20PQpx0nRhA9VLIQ60NfQeYhlJbWeAtnw0KZW5kc3RyZWFt
DQplbmRvYmoNCnhyZWYNCjAgNTkNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAxNyAwMDAw
MCBuDQowMDAwMDAwMTE2IDAwMDAwIG4NCjAwMDAwMDAyNDMgMDAwMDAgbg0KMDAwMDAwMDc0MiAw
MDAwMCBuDQowMDAwMDAxMDI3IDAwMDAwIG4NCjAwMDAwMDUyMjQgMDAwMDAgbg0KMDAwMDAwNTM5
MCAwMDAwMCBuDQowMDAwMDA1NjI3IDAwMDAwIG4NCjAwMDAwMDU2ODAgMDAwMDAgbg0KMDAwMDAw
NTczMyAwMDAwMCBuDQowMDAwMDA1OTExIDAwMDAwIG4NCjAwMDAwMDYxNTkgMDAwMDAgbg0KMDAw
MDAwNjMwNSAwMDAwMCBuDQowMDAwMDA2NDg4IDAwMDAwIG4NCjAwMDAwMDY3NDEgMDAwMDAgbg0K
MDAwMDAwNzAyMSAwMDAwMCBuDQowMDAwMDExMzkxIDAwMDAwIG4NCjAwMDAwMTE1MjEgMDAwMDAg
bg0KMDAwMDAxMTU1MSAwMDAwMCBuDQowMDAwMDExNzA5IDAwMDAwIG4NCjAwMDAwMTE3ODMgMDAw
MDAgbg0KMDAwMDAxMjAyMSAwMDAwMCBuDQowMDAwMDEyMTgzIDAwMDAwIG4NCjAwMDAwMTI0MTAg
MDAwMDAgbg0KMDAwMDAxMjY3MCAwMDAwMCBuDQowMDAwMDE2NTcxIDAwMDAwIG4NCjAwMDAwMTY4
MzEgMDAwMDAgbg0KMDAwMDAyMTM0MSAwMDAwMCBuDQowMDAwMDIxNjExIDAwMDAwIG4NCjAwMDAw
MjU1ODIgMDAwMDAgbg0KMDAwMDAyNTg0MiAwMDAwMCBuDQowMDAwMDMwMDQyIDAwMDAwIG4NCjAw
MDAwMzAzMjIgMDAwMDAgbg0KMDAwMDAzMzg5NCAwMDAwMCBuDQowMDAwMDM0MTY0IDAwMDAwIG4N
CjAwMDAwMzgxNTcgMDAwMDAgbg0KMDAwMDAzODQ1NCAwMDAwMCBuDQowMDAwMDQyNDI4IDAwMDAw
IG4NCjAwMDAwNDI1NDQgMDAwMDAgbg0KMDAwMDA0MjgzNCAwMDAwMCBuDQowMDAwMDQ3MTY5IDAw
MDAwIG4NCjAwMDAwNDczNDUgMDAwMDAgbg0KMDAwMDA0NzU4NiAwMDAwMCBuDQowMDAwMDQ3ODU2
IDAwMDAwIG4NCjAwMDAwNTAxNDAgMDAwMDAgbg0KMDAwMDA1MDcxOSAwMDAwMCBuDQowMDAwMDY2
MjcxIDAwMDAwIG4NCjAwMDAwNjY5OTQgMDAwMDAgbg0KMDAwMDA2NzM0NSAwMDAwMCBuDQowMDAw
MDY3NjE4IDAwMDAwIG4NCjAwMDAwNzk3MzAgMDAwMDAgbg0KMDAwMDA4MDA0NyAwMDAwMCBuDQow
MDAwMDk0MjY4IDAwMDAwIG4NCjAwMDAwOTQyOTUgMDAwMDAgbg0KMDAwMDA5NDYxNiAwMDAwMCBu
DQowMDAwMTEwMDk2IDAwMDAwIG4NCjAwMDAxMTM3ODEgMDAwMDAgbg0KMDAwMDExMzgyNiAwMDAw
MCBuDQp0cmFpbGVyDQo8PC9TaXplIDU5L1Jvb3QgMSAwIFIvSW5mbyAzIDAgUi9JRFs8RjRCRTg3
QTVBMzE1RTc0MUI4RTlBMUE0MjY0RkFCODE+PEY0QkU4N0E1QTMxNUU3NDFCOEU5QTFBNDI2NEZB
QjgxPl0gPj4NCnN0YXJ0eHJlZg0KMTE0MjM4DQolJUVPRg0KeHJlZg0KMCAwDQp0cmFpbGVyDQo8
PC9TaXplIDU5L1Jvb3QgMSAwIFIvSW5mbyAzIDAgUi9JRFs8RjRCRTg3QTVBMzE1RTc0MUI4RTlB
MUE0MjY0RkFCODE+PEY0QkU4N0E1QTMxNUU3NDFCOEU5QTFBNDI2NEZBQjgxPl0gL1ByZXYgMTE0
MjM4L1hSZWZTdG0gMTEzODI2Pj4NCnN0YXJ0eHJlZg0KMTE1NTc1DQolJUVPRg==

--_004_DS7PR21MB352407F5564A9B1E0D137412CAC92DS7PR21MB3524namp_--
