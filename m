Return-Path: <jlange@microsoft.com>
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10e::])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 136D41C27E2
 for <svsm-devel@coconut-svsm.dev>; Mon,  3 Jun 2024 19:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s64TbCaGoES5Zi4B6gCEK7oj6g0TcMIiMV0ujcYNzzo=;
 b=ByR3jlCQwfr77bdxmgfW0P5tnrvo3BBXJekMyultiUhvDGcoi5xhM9/cTyxzw6Oky0s4upY+lO9d3KpSjon3GLv+MokO2rP9o2UlRPJ4bO0YBn24hMAYixu0RGIYaLe9I/EvS7U7PR2bLHZbyS2mn63d286IAJLQ4J51h/BjPfM=
From: Jon Lange <jlange@microsoft.com>
Date: Mon, 3 Jun 2024 17:46:47 +0000
Message-ID: <DS7PR21MB352490005169B16909763C76CAFF2@DS7PR21MB3524.namprd21.prod.outlook.com>
References: <DS7PR21MB352462BA31B209F93F296A17CAEE2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR12MB57668C5D8AE281740909574B94F42@DS7PR12MB5766.namprd12.prod.outlook.com>
 <DS7PR21MB3524D4C48D6A51302783F0C3CAF42@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR21MB35248BAAD184D55EB2D057B9CAFC2@DS7PR21MB3524.namprd21.prod.outlook.com>
In-Reply-To: <DS7PR21MB35248BAAD184D55EB2D057B9CAFC2@DS7PR21MB3524.namprd21.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_004_DS7PR21MB352490005169B16909763C76CAFF2DS7PR21MB3524namp_"
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

--_004_DS7PR21MB352490005169B16909763C76CAFF2DS7PR21MB3524namp_
Content-Type: multipart/alternative;
	boundary="_000_DS7PR21MB352490005169B16909763C76CAFF2DS7PR21MB3524namp_"

--_000_DS7PR21MB352490005169B16909763C76CAFF2DS7PR21MB3524namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Apparently the last version of the PDF I sent had some rights restrictions.=
  Here is a newer version which should be unrestricted.

-Jon

From: Jon Lange
Sent: Thursday, May 30, 2024 9:32 PM
To: Kaplan, David <David.Kaplan@amd.com>; amd-sev-snp@lists.suse.com; svsm-=
devel@coconut-svsm.dev
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
To: Kaplan, David <David.Kaplan@amd.com>; amd-sev-snp@lists.suse.com; svsm-=
devel@coconut-svsm.dev
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



--_000_DS7PR21MB352490005169B16909763C76CAFF2DS7PR21MB3524namp_
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
<b>To:</b> Kaplan, David &lt;David.Kaplan@amd.com&gt;; amd-sev-snp@lists.su=
se.com; svsm-devel@coconut-svsm.dev<br>
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
<b>To:</b> Kaplan, David &lt;David.Kaplan@amd.com&gt;; amd-sev-snp@lists.su=
se.com; svsm-devel@coconut-svsm.dev<br>
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
font-family:&quot;Calibri&quot;,sans-serif"> Kaplan, David &lt;<a href=3D"m=
ailto:David.Kaplan@amd.com">David.Kaplan@amd.com</a>&gt;
<br>
<b>Sent:</b> Thursday, May 23, 2024 10:06 AM<br>
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
font-family:&quot;Calibri&quot;,sans-serif"> AMD-SEV-SNP &lt;<a href=3D"mai=
lto:amd-sev-snp-bounces+david.kaplan=3Damd.com@lists.suse.com">amd-sev-snp-=
bounces+david.kaplan=3Damd.com@lists.suse.com</a>&gt;
<b>On Behalf Of </b>Jon Lange<br>
<b>Sent:</b> Thursday, May 16, 2024 11:40 PM<br>
<b>To:</b> <a href=3D"mailto:amd-sev-snp@lists.suse.com">amd-sev-snp@lists.=
suse.com</a>;
<a href=3D"mailto:svsm-devel@coconut-svsm.dev">svsm-devel@coconut-svsm.dev<=
/a><br>
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

--_000_DS7PR21MB352490005169B16909763C76CAFF2DS7PR21MB3524namp_--

--_004_DS7PR21MB352490005169B16909763C76CAFF2DS7PR21MB3524namp_
Content-Type: application/pdf;
	name="Alternate Injection Support for SEV-SNP 20240603.pdf"
Content-Description: Alternate Injection Support for SEV-SNP 20240603.pdf
Content-Disposition: attachment;
	filename="Alternate Injection Support for SEV-SNP 20240603.pdf"; size=115252;
	creation-date="Mon, 03 Jun 2024 17:46:22 GMT";
	modification-date="Mon, 03 Jun 2024 17:46:46 GMT"
Content-Transfer-Encoding: base64

JVBERi0xLjcNCiW1tbW1DQoxIDAgb2JqDQo8PC9UeXBlL0NhdGFsb2cvUGFnZXMgMiAwIFIvTGFu
ZyhlbikgL01ldGFkYXRhIDU2IDAgUi9WaWV3ZXJQcmVmZXJlbmNlcyA1NyAwIFI+Pg0KZW5kb2Jq
DQoyIDAgb2JqDQo8PC9UeXBlL1BhZ2VzL0NvdW50IDExL0tpZHNbIDQgMCBSIDE1IDAgUiAyNCAw
IFIgMjYgMCBSIDI4IDAgUiAzMCAwIFIgMzIgMCBSIDM0IDAgUiAzNyAwIFIgMzkgMCBSIDQzIDAg
Ul0gPj4NCmVuZG9iag0KMyAwIG9iag0KPDwvTVNJUF9MYWJlbF84Nzg2NzE5NS1mMmI4LTRhYzIt
YjBiNi02YmI3M2NiMzNhZmNfU2l0ZUlkKDcyZjk4OGJmLTg2ZjEtNDFhZi05MWFiLTJkN2NkMDEx
ZGI0NykgL01TSVBfTGFiZWxfODc4NjcxOTUtZjJiOC00YWMyLWIwYjYtNmJiNzNjYjMzYWZjX01l
dGhvZChQcml2aWxlZ2VkKSAvTVNJUF9MYWJlbF84Nzg2NzE5NS1mMmI4LTRhYzItYjBiNi02YmI3
M2NiMzNhZmNfRW5hYmxlZChUcnVlKSAvQXV0aG9yKEpvbiBMYW5nZSkgL0NyZWF0b3Io/v8ATQBp
AGMAcgBvAHMAbwBmAHQArgAgAFcAbwByAGQAIABmAG8AcgAgAE0AaQBjAHIAbwBzAG8AZgB0ACAA
MwA2ADUpIC9DcmVhdGlvbkRhdGUoRDoyMDI0MDYwMzEwNDUxNi0wNycwMCcpIC9Nb2REYXRlKEQ6
MjAyNDA2MDMxMDQ1MTYtMDcnMDAnKSAvUHJvZHVjZXIo/v8ATQBpAGMAcgBvAHMAbwBmAHQArgAg
AFcAbwByAGQAIABmAG8AcgAgAE0AaQBjAHIAbwBzAG8AZgB0ACAAMwA2ADUpID4+DQplbmRvYmoN
CjQgMCBvYmoNCjw8L1R5cGUvUGFnZS9QYXJlbnQgMiAwIFIvUmVzb3VyY2VzPDwvRm9udDw8L0Yx
IDYgMCBSL0YyIDEwIDAgUi9GMyAxMyAwIFI+Pi9FeHRHU3RhdGU8PC9HUzggOCAwIFIvR1M5IDkg
MCBSPj4vUHJvY1NldFsvUERGL1RleHQvSW1hZ2VCL0ltYWdlQy9JbWFnZUldID4+L0Fubm90c1sg
MTIgMCBSXSAvTWVkaWFCb3hbIDAgMCA2MTIgNzkyXSAvQ29udGVudHMgNSAwIFIvR3JvdXA8PC9U
eXBlL0dyb3VwL1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQj4+L1RhYnMvUz4+DQplbmRvYmoN
CjUgMCBvYmoNCjw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5ndGggNDEwNj4+DQpzdHJlYW0NCnic
xVxLc9tGEr6rSv8BVXshUhYWgzdqLxtns7ZSceJEjvYQ7wGmKIoJRdIg6UT59dvd8wZmKJkaelMV
mgIHmJ6efnz9GHw8P0uTFP9rWRalUQWfdZtF/ez87D9fRavzs5fvzs/+/m8WMZakRfTu9vyMwbg0
YlGZF0mWRWWWFBX8cg/jXl010XwLz4zm9Fcr/np1fvbrhMX/jd59d372LTzxp/Ozj8+ZukgTZs5M
E4p5os+d55nE1FmSZkWUt1+UkizKqiElLUvaooiqtkyqjFOTpDncDNxiBX42TdTPnZd/Joq/ji/a
yTK+aCY7/JjFF/Wkx48V/tDZP0R47RL/pF9/iy9Yyn+ZqoELurhWj6B7ruKLarKPL8rJhn7e6EE0
Gd1JI29xpP5B3/0tflwfJ1Eu1hVVnpTPYt1FQGJApNrn0EIs+gGZ9ZZY+9mC6KctY1XC6qgCfrXF
UcRdE0lcMPR275WALdXuv8FvdA0Eqpjc4TV+H8kSido23NJyYHhbPmdpR/OZFSM+p0VS5lFV5Elx
nBB8B5wqUXlYhfxiBTI1Syffw3diNVzh1+fwmSM7WSPGvJ8EXEnVJvlgJVldAq1FDWOSMivFQoZX
+Tp+I4qW9Omj+p8kFfc0ZkGfU1plTyM5D7YGP26F3MHAhB7Ah5OluQ+39CLNYVHP2cT3cUhq6qRs
n0PNQL7d+6j2O0vyImI5aVOa5BUReftVcEfoErkmaYHvoONZ9Qzl2RviZqpHHm5T8hTsUPkcUl+E
JKZN6mfxLaAFzFn2LGLgawae6t3010kGAC0gYaBAaf5FucRHNBkpUl2htjGaooZvDeAWVid5A8Ah
RQ8GH1WaMqVvP33WknPHkgXGLRtchVxyCetBE4CfuVrx4Cpf8MsuzsHGFpPf4f95D3+s9zFqVj65
OW5jXFQyMDntM6g8UngPBAUlYIm8GQUG7+5mAecC2I9xkGeurwNOVFN84ZlouYtrtJIleF0KCbJJ
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
M9GjJ2uQC59ChpEZlm481FjqCM6gWy6Avr/0AR+7Z27QdonJ/m46k5ZqJdXdPnO9ntKjVa3dMMim
fMvDPH3AWnQB2lc3vsX/Q3Bb1/rNqDq4bpV1Ms4L2hy6cB2o09aBH10rB/kyR9uiPoOlmxdWZte+
23LfyQ0UOZ6A2KomD+hkQUjVaxjpuHOeg5qH39QpYQdmoFGdzh9okyzeqyA7SpVhv5UspgGK87zW
jC/526o8PLeaVq+pe4PMs5UnkFBwWZUDJw7SlBIo6mzsdgASZflvFi22Uv5WfEzAcKjAvgEfzdi/
RkX+hUpeOnpr7YSynRTfKGyvkp2ijA/fEKbttSaOMqIRekR+2Fsdpa4MZt1yZsF99OoOLTUhj7IV
aZLlPg6dQHzwVZmO9+KYPWcrcm7A0/VSZk9nplFTGRydRtRNZoNj5mAxufs6RQULc9CIgN1r0u0h
j3Wfe9OhjuSU/5zwgW5UnYNnShvNJC/aKPWkVehcVo4v8jjEpHGsYjQwOJr2VAeDOos9eBdKczL/
nNLLSTyr0L403OvFsBfXO686OTBXR/S9xmYhQZo7zA2Yt26xrOuhmDNJGXzlzuTrqZSSK/928CUF
g7SSFOxhm5flNbldlS8hG/VyudRqbMfDqUdZYN7Fwy7jqI7b4tV8+bqWq1R/K4Os/kFCllMcahOK
0ZRJXoxDWEI7rurykMd22lfnlIJ2G4CH89DZU7zp6syqRRPA1vYrQwxOBZgH/SaUgAnOGmsAHroJ
J5DaiKhAo4cBKrFKbxxfzuBHutHx6jD5Ng+lnPab6qiaeS8atxZe72u+5MVTXzQkxF2t/R9xrhrE
DQplbmRzdHJlYW0NCmVuZG9iag0KNiAwIG9iag0KPDwvVHlwZS9Gb250L1N1YnR5cGUvVHJ1ZVR5
cGUvTmFtZS9GMS9CYXNlRm9udC9CQ0RFRUUrQXB0b3MvRW5jb2RpbmcvV2luQW5zaUVuY29kaW5n
L0ZvbnREZXNjcmlwdG9yIDcgMCBSL0ZpcnN0Q2hhciAzMi9MYXN0Q2hhciAxMjIvV2lkdGhzIDQ4
IDAgUj4+DQplbmRvYmoNCjcgMCBvYmoNCjw8L1R5cGUvRm9udERlc2NyaXB0b3IvRm9udE5hbWUv
QkNERUVFK0FwdG9zL0ZsYWdzIDMyL0l0YWxpY0FuZ2xlIDAvQXNjZW50IDkzOS9EZXNjZW50IC0y
ODIvQ2FwSGVpZ2h0IDkzOS9BdmdXaWR0aCA1NjEvTWF4V2lkdGggMTY4Mi9Gb250V2VpZ2h0IDQw
MC9YSGVpZ2h0IDI1MC9TdGVtViA1Ni9Gb250QkJveFsgLTUwMCAtMjgyIDExODIgOTM5XSAvRm9u
dEZpbGUyIDQ2IDAgUj4+DQplbmRvYmoNCjggMCBvYmoNCjw8L1R5cGUvRXh0R1N0YXRlL0JNL05v
cm1hbC9jYSAxPj4NCmVuZG9iag0KOSAwIG9iag0KPDwvVHlwZS9FeHRHU3RhdGUvQk0vTm9ybWFs
L0NBIDE+Pg0KZW5kb2JqDQoxMCAwIG9iag0KPDwvVHlwZS9Gb250L1N1YnR5cGUvVHJ1ZVR5cGUv
TmFtZS9GMi9CYXNlRm9udC9CQ0RGRUUrQXB0b3MjMjBEaXNwbGF5L0VuY29kaW5nL1dpbkFuc2lF
bmNvZGluZy9Gb250RGVzY3JpcHRvciAxMSAwIFIvRmlyc3RDaGFyIDMyL0xhc3RDaGFyIDExNy9X
aWR0aHMgNDkgMCBSPj4NCmVuZG9iag0KMTEgMCBvYmoNCjw8L1R5cGUvRm9udERlc2NyaXB0b3Iv
Rm9udE5hbWUvQkNERkVFK0FwdG9zIzIwRGlzcGxheS9GbGFncyAzMi9JdGFsaWNBbmdsZSAwL0Fz
Y2VudCA5MzkvRGVzY2VudCAtMjgyL0NhcEhlaWdodCA5MzkvQXZnV2lkdGggNTQwL01heFdpZHRo
IDE2NzIvRm9udFdlaWdodCA0MDAvWEhlaWdodCAyNTAvU3RlbVYgNTQvRm9udEJCb3hbIC01MDMg
LTI4MiAxMTY5IDkzOV0gL0ZvbnRGaWxlMiA1MCAwIFI+Pg0KZW5kb2JqDQoxMiAwIG9iag0KPDwv
U3VidHlwZS9MaW5rL1JlY3RbIDI2Ny4wNCA2MzkuNDMgNDA1LjM1IDY1Ni41Ml0gL0JTPDwvVyAw
Pj4vRiA0L0E8PC9UeXBlL0FjdGlvbi9TL1VSSS9VUkkobWFpbHRvOmpsYW5nZUBtaWNyb3NvZnQu
Y29tKSA+Pj4+DQplbmRvYmoNCjEzIDAgb2JqDQo8PC9UeXBlL0ZvbnQvU3VidHlwZS9UcnVlVHlw
ZS9OYW1lL0YzL0Jhc2VGb250L0JDREdFRStBcHRvcyMyMERpc3BsYXksQm9sZC9FbmNvZGluZy9X
aW5BbnNpRW5jb2RpbmcvRm9udERlc2NyaXB0b3IgMTQgMCBSL0ZpcnN0Q2hhciAzMi9MYXN0Q2hh
ciAxMjEvV2lkdGhzIDUxIDAgUj4+DQplbmRvYmoNCjE0IDAgb2JqDQo8PC9UeXBlL0ZvbnREZXNj
cmlwdG9yL0ZvbnROYW1lL0JDREdFRStBcHRvcyMyMERpc3BsYXksQm9sZC9GbGFncyAzMi9JdGFs
aWNBbmdsZSAwL0FzY2VudCA5MzkvRGVzY2VudCAtMjgyL0NhcEhlaWdodCA5MzkvQXZnV2lkdGgg
NTY3L01heFdpZHRoIDE4ODAvRm9udFdlaWdodCA3MDAvWEhlaWdodCAyNTAvU3RlbVYgNTYvRm9u
dEJCb3hbIC01NTIgLTI4MiAxMzI4IDkzOV0gL0ZvbnRGaWxlMiA1MiAwIFI+Pg0KZW5kb2JqDQox
NSAwIG9iag0KPDwvVHlwZS9QYWdlL1BhcmVudCAyIDAgUi9SZXNvdXJjZXM8PC9Gb250PDwvRjEg
NiAwIFIvRjMgMTMgMCBSL0Y0IDE3IDAgUi9GNSAyMiAwIFI+Pi9FeHRHU3RhdGU8PC9HUzggOCAw
IFIvR1M5IDkgMCBSPj4vUHJvY1NldFsvUERGL1RleHQvSW1hZ2VCL0ltYWdlQy9JbWFnZUldID4+
L01lZGlhQm94WyAwIDAgNjEyIDc5Ml0gL0NvbnRlbnRzIDE2IDAgUi9Hcm91cDw8L1R5cGUvR3Jv
dXAvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCPj4vVGFicy9TPj4NCmVuZG9iag0KMTYgMCBv
YmoNCjw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5ndGggNDI3Mj4+DQpzdHJlYW0NCniczR3ZbttI
8t2A/4HAvliLiMvuZvMYGAZi55gsZnazkyDzkMyDYsu2dmTLoeRMMl+/VdUnxW75SDOzC8QjUSSr
urruo/fT/l6RF/i/lvGsyCr4W7c86+b7e7/+Pbve3zt+u7/3jxcsYywvyuzt+f4eg/uKjGVSlDnn
meR5WcEvV3DfyzdNdrGGd2YX9K3V317u770/4JPfsrf/3N97Dm/8z/7ep28BXRY58yETQA0neyic
b0Sm5nnBy0y0/y+Y1EWbV9UAm81kyg8uJ83BfDKVgNtUHLx592bCioOf8ZdsUqtbVpP24ZjHkWKC
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
RSdwtFDWPy7EO/hntNM2GWswdAqGKwuP8bxxvhHiFTo8LYJK0rl8gQIdAXTnIRouBanSPOdDkem7
QKo4sETr4g4pFJwq+QTNK8vJXtYofGJOwtp3k3MWIwSZxAvT0dfzpVTqxbilV6a5prOn2lp3dkYK
ALubEuYbRM7a78AnJa9wbDPKJ7Wfh9w6h7efoQ+myT723YhxpvH1iUyjhUJ+Z5oJb/49KdV7KVnn
zhB9SGkrcqzx2uRLF7aWMKyddDNjdGzWWYlcwm5ZUbJcyBh5U5qgUmLrdgQQl3JiTpLRKXcbztlm
iX6VhHLe8/XcbNKwDDigrTFY6zt250l6/m2anBUB339ulqviqpC/HUgbZ2DMTd+/f1zP1M4H6Lmf
qTCDP3Y2YFAEO7NzTBtLIX06Gfy63GL5YANgZc4zS+i1irJGzgwSLsNArWkpUMtSGhJJA0uRzXrd
0f+PgtyK1RzVxtB/ZVFir3cEJVdnsu01hAkpIbfr93KndzRZ0xZvLep/eNJzSQ0KZW5kc3RyZWFt
DQplbmRvYmoNCjE3IDAgb2JqDQo8PC9UeXBlL0ZvbnQvU3VidHlwZS9UeXBlMC9CYXNlRm9udC9C
Q0RIRUUrQXB0b3MvRW5jb2RpbmcvSWRlbnRpdHktSC9EZXNjZW5kYW50Rm9udHMgMTggMCBSL1Rv
VW5pY29kZSA0NSAwIFI+Pg0KZW5kb2JqDQoxOCAwIG9iag0KWyAxOSAwIFJdIA0KZW5kb2JqDQox
OSAwIG9iag0KPDwvQmFzZUZvbnQvQkNESEVFK0FwdG9zL1N1YnR5cGUvQ0lERm9udFR5cGUyL1R5
cGUvRm9udC9DSURUb0dJRE1hcC9JZGVudGl0eS9EVyAxMDAwL0NJRFN5c3RlbUluZm8gMjAgMCBS
L0ZvbnREZXNjcmlwdG9yIDIxIDAgUi9XIDQ3IDAgUj4+DQplbmRvYmoNCjIwIDAgb2JqDQo8PC9P
cmRlcmluZyhJZGVudGl0eSkgL1JlZ2lzdHJ5KEFkb2JlKSAvU3VwcGxlbWVudCAwPj4NCmVuZG9i
ag0KMjEgMCBvYmoNCjw8L1R5cGUvRm9udERlc2NyaXB0b3IvRm9udE5hbWUvQkNESEVFK0FwdG9z
L0ZsYWdzIDMyL0l0YWxpY0FuZ2xlIDAvQXNjZW50IDkzOS9EZXNjZW50IC0yODIvQ2FwSGVpZ2h0
IDkzOS9BdmdXaWR0aCA1NjEvTWF4V2lkdGggMTY4Mi9Gb250V2VpZ2h0IDQwMC9YSGVpZ2h0IDI1
MC9TdGVtViA1Ni9Gb250QkJveFsgLTUwMCAtMjgyIDExODIgOTM5XSAvRm9udEZpbGUyIDQ2IDAg
Uj4+DQplbmRvYmoNCjIyIDAgb2JqDQo8PC9UeXBlL0ZvbnQvU3VidHlwZS9UcnVlVHlwZS9OYW1l
L0Y1L0Jhc2VGb250L0FyaWFsTVQvRW5jb2RpbmcvV2luQW5zaUVuY29kaW5nL0ZvbnREZXNjcmlw
dG9yIDIzIDAgUi9GaXJzdENoYXIgMzIvTGFzdENoYXIgMzIvV2lkdGhzIDUzIDAgUj4+DQplbmRv
YmoNCjIzIDAgb2JqDQo8PC9UeXBlL0ZvbnREZXNjcmlwdG9yL0ZvbnROYW1lL0FyaWFsTVQvRmxh
Z3MgMzIvSXRhbGljQW5nbGUgMC9Bc2NlbnQgOTA1L0Rlc2NlbnQgLTIxMC9DYXBIZWlnaHQgNzI4
L0F2Z1dpZHRoIDQ0MS9NYXhXaWR0aCAyNjY1L0ZvbnRXZWlnaHQgNDAwL1hIZWlnaHQgMjUwL0xl
YWRpbmcgMzMvU3RlbVYgNDQvRm9udEJCb3hbIC02NjUgLTIxMCAyMDAwIDcyOF0gPj4NCmVuZG9i
ag0KMjQgMCBvYmoNCjw8L1R5cGUvUGFnZS9QYXJlbnQgMiAwIFIvUmVzb3VyY2VzPDwvRm9udDw8
L0YxIDYgMCBSL0Y1IDIyIDAgUj4+L0V4dEdTdGF0ZTw8L0dTOCA4IDAgUi9HUzkgOSAwIFI+Pi9Q
cm9jU2V0Wy9QREYvVGV4dC9JbWFnZUIvSW1hZ2VDL0ltYWdlSV0gPj4vTWVkaWFCb3hbIDAgMCA2
MTIgNzkyXSAvQ29udGVudHMgMjUgMCBSL0dyb3VwPDwvVHlwZS9Hcm91cC9TL1RyYW5zcGFyZW5j
eS9DUy9EZXZpY2VSR0I+Pi9UYWJzL1M+Pg0KZW5kb2JqDQoyNSAwIG9iag0KPDwvRmlsdGVyL0Zs
YXRlRGVjb2RlL0xlbmd0aCAzODI1Pj4NCnN0cmVhbQ0KeJzNXd1v28gRfzfg/4FAX8zCZrnkLj/u
nnrF9ZCi12uR4O7hkAfFtmzhFMmR7CS+v747+zG7JHdk5TJUGyCCRFGc2d35+M3Hrj+cn5VFCf96
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
QEMbmLDYIcAOW7SYEYhQ5pBbgt9vkwhkyPdXOY0pUljdxIgmysy9kDnCxjr3hyViSNF6bw9OJoSp
pMvn3SSqqNll3iOqkUSS0GzpaAmb5xpqdA4s+eUP/n5A/78Kvq3ODQplbmRzdHJlYW0NCmVuZG9i
ag0KMjYgMCBvYmoNCjw8L1R5cGUvUGFnZS9QYXJlbnQgMiAwIFIvUmVzb3VyY2VzPDwvRm9udDw8
L0YxIDYgMCBSL0YzIDEzIDAgUj4+L0V4dEdTdGF0ZTw8L0dTOCA4IDAgUi9HUzkgOSAwIFI+Pi9Q
cm9jU2V0Wy9QREYvVGV4dC9JbWFnZUIvSW1hZ2VDL0ltYWdlSV0gPj4vTWVkaWFCb3hbIDAgMCA2
MTIgNzkyXSAvQ29udGVudHMgMjcgMCBSL0dyb3VwPDwvVHlwZS9Hcm91cC9TL1RyYW5zcGFyZW5j
eS9DUy9EZXZpY2VSR0I+Pi9UYWJzL1M+Pg0KZW5kb2JqDQoyNyAwIG9iag0KPDwvRmlsdGVyL0Zs
YXRlRGVjb2RlL0xlbmd0aCA0NDI2Pj4NCnN0cmVhbQ0KeJzNXVtz2zYWfveM/wNn9sXaibi8X7pP
TsZJ3Glab+y6O9Pug6yLzVqmFEpO4v31i3MAHAAEIcsJ1Nk+ZGhK4gHO9TsXsJ+Oj6Iwgv/qOAmi
oGD/lnUSdPPjo9/+HrTHR6+vjo/+8TYO4jiMsuBqcXwUs+9FQRzkaRYmSZAnYVawTx7Y995dVsHt
hj0zuMW/avHXu+Oj30+y0X+Cqx+Pj87YE/91fPTpe0hnURjrlJGgoBO8lM53LqZMwijJgrT+f1lJ
GdVhUViruby+/DAq2aLG6clqVJ/cwMVmVJ3MR+P8pGMXn0fjjP2Vs7vjhH9xy27fwV8T9ost3Ya/
8GI5H2XsdwV/yNKfiOO6DqPYtZexP0JJlIRl6iJE/GnZBbKlQS40ozhW+0ZW4K0WPtwSUzv493EU
Fydrzk3JQPyyYHPJP+zkrwya+JNXo1T8DB4dSMGhYFaPy1GcnMzgJn4yHXH54lKQBC7ggclVLLY8
+cKkxsW6BZnDrWYrV7PADbbsaiYpceKtVJ8b2sKWE6lerus7rDtJwyxxSaT8gW0k8kgtrUKn+D3u
ShhnUWdhXFmEJi3IYSYZjGwFhZhM70EkkwA+ZoKOuAwPYnFZzRjhWJ9Hg4uZ365ddFBfwQUp7VV6
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
wilXXxkgtZV6rG6WMJ7jYJDXMmoNb8ZwEPrjZCN1e8f8B9gSuvAHmrDAphIO9J29hffenPe6TjwV
xNkNjMEKQaqZDcgY5wH4T8V1/woPk10Dr60fGhwS6rRayxZGR4n47jmQsXyJg+hX/jHyeWgrhzHX
wW1gfSUFuU5/P3nl0355bc3BOzsgvsjGes6dOIspU28cTEcD7vK8Xap2ZRZ2N4/cDyxbzRGZ7wZf
+VXNjKWYWeFi78z0gwO422slLXKq1+999OXbNqsorCObKiVAA9Moeq7df6PCntVUr1ZSxK5deDXH
BFqTO9jlOmWh/jcDopOycYLJwUrjHkn8Vj7nvgESdE5j9Vl3o4FKJLnpwVjVeqI3NRWOU5HYmKvu
TeRJ791j9P8AylaIbA0KZW5kc3RyZWFtDQplbmRvYmoNCjI4IDAgb2JqDQo8PC9UeXBlL1BhZ2Uv
UGFyZW50IDIgMCBSL1Jlc291cmNlczw8L0ZvbnQ8PC9GMSA2IDAgUi9GNSAyMiAwIFIvRjMgMTMg
MCBSPj4vRXh0R1N0YXRlPDwvR1M4IDggMCBSL0dTOSA5IDAgUj4+L1Byb2NTZXRbL1BERi9UZXh0
L0ltYWdlQi9JbWFnZUMvSW1hZ2VJXSA+Pi9NZWRpYUJveFsgMCAwIDYxMiA3OTJdIC9Db250ZW50
cyAyOSAwIFIvR3JvdXA8PC9UeXBlL0dyb3VwL1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQj4+
L1RhYnMvUz4+DQplbmRvYmoNCjI5IDAgb2JqDQo8PC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3Ro
IDM5MzQ+Pg0Kc3RyZWFtDQp4nM1cW3PbNhZ+94z/Ax/FnYgr3slHJ3W73mm63jhxdqbd2WEsyWYj
i44uSdNfvzgHwAFAALZjQ5n2IZUpUjg41+9cwE/HR7NkBv+1aRbNoor9W7dZtFkcH73/W7Q+Pnr5
9vjo7z+mUZomsyJ6uzw+Stl9syiNyrxIsiwqs6So2De37L6fLproest+M7rGv1rx10/HR79Oyvi/
0dt/Hh+dsl/89/HRp+csXcySVF8ZFxTrRN+6zjOJqbNklhVR3v5VKKlnbVJVFjX7uJxs42k2WcTT
ktFWT4ZlDB+m+eRktYtb/sVmzS52u7iS97Gvz+J0NlnDs7/Hacq/uIrzyQ4u9UPc8C+TOC34A/jP
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
1Gy4HjiUO5ATirbu/B/HgSqjDQplbmRzdHJlYW0NCmVuZG9iag0KMzAgMCBvYmoNCjw8L1R5cGUv
UGFnZS9QYXJlbnQgMiAwIFIvUmVzb3VyY2VzPDwvRm9udDw8L0YxIDYgMCBSL0YzIDEzIDAgUi9G
NSAyMiAwIFIvRjQgMTcgMCBSPj4vRXh0R1N0YXRlPDwvR1M4IDggMCBSL0dTOSA5IDAgUj4+L1By
b2NTZXRbL1BERi9UZXh0L0ltYWdlQi9JbWFnZUMvSW1hZ2VJXSA+Pi9NZWRpYUJveFsgMCAwIDYx
MiA3OTJdIC9Db250ZW50cyAzMSAwIFIvR3JvdXA8PC9UeXBlL0dyb3VwL1MvVHJhbnNwYXJlbmN5
L0NTL0RldmljZVJHQj4+L1RhYnMvUz4+DQplbmRvYmoNCjMxIDAgb2JqDQo8PC9GaWx0ZXIvRmxh
dGVEZWNvZGUvTGVuZ3RoIDM5MTc+Pg0Kc3RyZWFtDQp4nO1ca28bxxX9LkD/YYF+4RbidGdnn21R
QHEdR0GcuJKqFIiNgJZIemOaKy8py86v79w7790dSqaHSRHUgCnuc2bu3Me5Z+7w/fFRQhL4V9M0
SqKCf5Z1GnXz46Mf/xytj4++ujw++svXNKKUJFl0uTg+ovy+JKJRzjKSplGekqzgV97x+55dVNFy
w98ZLfGolkfPjo9+mhTxq+jy2+Ojp/yN/zo+ev8lTWcJoXbL2KBsJ/rcdr6wM2VKkjSLWP2/0pMy
qUlRDHqzjafppI3iaT6ZxTXv3JRNVi2cvI9pNpnDhS6uxIUrfsdzuPbiOxJn/Fwpzj+Bj5ZfXMPF
Db99HueT9/zyHf+L78Ar2NgqpsnkUzzNJifh5j5NM1JR3yA/W+S7GipIXe6U5hscPx8zyuYipunk
6uJ5XIjjd3DlLqYFl5MSCQjyNf8PUsObbvCA34j3NDGlkyVIbC1FewM34Z0gbD59uWqaf8A8ytcG
Gzarc1J65duuoa/XWmGwZ80W1aac3MLRbBPLEUP/N2rUfYHJu9uGn5IqI3XvniucvrEzTwQborST
os4IrQZDbKREeU+uY6Hs7/hAcDZxpBt9fSumJFjHKCtI6euXNK5KSBJk2zXwDU6hyvSknHtMPOLi
vXoOD7z47iSmQSWb5gXJat8IZmuuGZ9UV7Xmr5oP6Dt43/jFAi+2C61df+L9/eZKeSwQudD9rbKz
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
zAOi7zRJSJb7pBeSW+Mhj5a+hkbzNOUXH5OsDddbdDIvbcdasbvTazTuZgO7YnLAfeoEQSZ2Zifu
y5iExAaUQUGDR1BBG8qheMzT0A9xJsbeE8oIWyJpadievYGbBR+9diq1LC46uOWnGajwjl9okT0I
VzPJYWKxo+GdC2d+FmvjIPMxgFdKd6V/peIwfDsTpjo+vMCLr1Xta0jx7aOZha5a0AxGr55F7W0Y
UjVi35jzmyg+zXYhm1Rv6QOYwon8PiIbu9znN2yC20NSAfU2tngklu9nBv/2fkNkasG3WQ+fuIxG
L/yfXcCxWLXQOzhmzi7KhYbeczu8Cmy07c9g0XvvNFfzE559ZxTJCI/cwk8QrRgZyfr+X9//x6/v
p0XF//4O9f2ehg8wwiyFbOiPtNGzn4cPWYxNSG/EvUOd++QYcMLqREwYLQkdur09w3w+1hAjZeZt
KOSSZoJK7mnI0gSpBT9RriQ1rPXR4tX+THo2Bm04uGbM05W/J+xr9o+AG1YToBEPL980TaFYztNQ
j+4y8X53Kq32auTws04S0GlWzyyYPmarhlmL1tFwV4kYLN+qzfvIcQxXi0OWLVf5DuU8gF0nlJRD
B3IAux5v6AB2Pd6Qx65zsOvqVUibTmrIU8a7EdqmaUZY+RvINqUFKXyDmlw1nfqFOCBNZitE4pcv
wHAEKne3Rw3DtcglOrt8VufBHMnlYbdIQdFi8VuITRpZVRCW/BbB09NQeCPzNOQxsn3Na5z+zKAS
KaxIxxuqgN84vEgluepp6Owx61cbp4ZAbHy4t+r4JQ1qb27ctUMr4A/z1bAhxjM0dzlsav/0pMjb
Qpp8XcOPYD1uNv8Ls2iHgg0KZW5kc3RyZWFtDQplbmRvYmoNCjMyIDAgb2JqDQo8PC9UeXBlL1Bh
Z2UvUGFyZW50IDIgMCBSL1Jlc291cmNlczw8L0ZvbnQ8PC9GMSA2IDAgUi9GNSAyMiAwIFIvRjMg
MTMgMCBSL0Y0IDE3IDAgUj4+L0V4dEdTdGF0ZTw8L0dTOCA4IDAgUi9HUzkgOSAwIFI+Pi9Qcm9j
U2V0Wy9QREYvVGV4dC9JbWFnZUIvSW1hZ2VDL0ltYWdlSV0gPj4vTWVkaWFCb3hbIDAgMCA2MTIg
NzkyXSAvQ29udGVudHMgMzMgMCBSL0dyb3VwPDwvVHlwZS9Hcm91cC9TL1RyYW5zcGFyZW5jeS9D
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
Izvc+bMMFENENLKyBxVLOI6tTKKbC5k3dcavWziPk0/O0DOfvI0nv/3iPpPeoZV8R/01fVdl29Jh
nHujWheREY76FTUNXagAYDyYG/K0qqkp5XeTe8TX/wH6ok0bDQplbmRzdHJlYW0NCmVuZG9iag0K
MzQgMCBvYmoNCjw8L1R5cGUvUGFnZS9QYXJlbnQgMiAwIFIvUmVzb3VyY2VzPDwvRm9udDw8L0Yx
IDYgMCBSL0YzIDEzIDAgUi9GNSAyMiAwIFIvRjQgMTcgMCBSPj4vRXh0R1N0YXRlPDwvR1M4IDgg
MCBSL0dTOSA5IDAgUj4+L1Byb2NTZXRbL1BERi9UZXh0L0ltYWdlQi9JbWFnZUMvSW1hZ2VJXSA+
Pi9Bbm5vdHNbIDM2IDAgUl0gL01lZGlhQm94WyAwIDAgNjEyIDc5Ml0gL0NvbnRlbnRzIDM1IDAg
Ui9Hcm91cDw8L1R5cGUvR3JvdXAvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCPj4vVGFicy9T
Pj4NCmVuZG9iag0KMzUgMCBvYmoNCjw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5ndGggMzk5Mj4+
DQpzdHJlYW0NCnic1Rxrb9tG8rsB/wcC90U8RCyXbxY9A45jpzqkqWs7uR6aQyHbks0rLaaUlDv3
19/MLPdBcldx3FWACxDrQS5ndt6v1e+HB2EQ4r+SRV7oZfA3LyOvXRwe/OOv3urw4OXV4cE3Z8xj
LAgT72p5eMDgvtBjXhonQRR5aRQkGVx5gPteXxbe3Rqe6d3Rp7L79Prw4JdJ4f/Lu/r74cEpPPGn
w4Pf/wzoJAyYDpkAdnC8L4XzJ5HJoyCMEi8uvyomsceioMxMmORhHuQdXYKwgG/CIM4z+Jsyr70z
fXtB+F6+v/zBn0ZfjrcdJQa4pH8CpePz2YmHOJ23/jSbNJvGTyY3/pSFk6Z2iGaRBqx4PprPpNgO
ccpKFiTRSKTO28afxpONX0yam6b2/HSyQvJsfZZNHvxpOrn288kC37QekCr2qjXc4+GiW7qSTpa4
oPIZ40vxq1u8TjfN/XKy5kKQAxh4cw+w6IF0HRjis3hyIhec+yyaAFYZvxuxCtxRI2ZhUKQ2auyB
7FkalMUI0NX9wkNRBFLwTbdApgY2nMCGkQAgjEQzuEaUlSRcc+6kk4/wAf83La7aCKIiU2hZA08k
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
WyAyNiAwIFIvWFlaIDY5IDM3MyAwXSA+Pg0KZW5kb2JqDQozNyAwIG9iag0KPDwvVHlwZS9QYWdl
L1BhcmVudCAyIDAgUi9SZXNvdXJjZXM8PC9Gb250PDwvRjEgNiAwIFIvRjMgMTMgMCBSL0Y1IDIy
IDAgUj4+L0V4dEdTdGF0ZTw8L0dTOCA4IDAgUi9HUzkgOSAwIFI+Pi9Qcm9jU2V0Wy9QREYvVGV4
dC9JbWFnZUIvSW1hZ2VDL0ltYWdlSV0gPj4vTWVkaWFCb3hbIDAgMCA2MTIgNzkyXSAvQ29udGVu
dHMgMzggMCBSL0dyb3VwPDwvVHlwZS9Hcm91cC9TL1RyYW5zcGFyZW5jeS9DUy9EZXZpY2VSR0I+
Pi9UYWJzL1M+Pg0KZW5kb2JqDQozOCAwIG9iag0KPDwvRmlsdGVyL0ZsYXRlRGVjb2RlL0xlbmd0
aCAzOTgwPj4NCnN0cmVhbQ0KeJztXFtz27gVfveM/wMfxY6FEryB7EwfXFvJuLNJvLKSeGa941F8
ZStLDiU7m/31xTm4i4TiC5T2ofvgjUQKODj38+EAX3d3EpLAfzVNoyQq+V9Wp1F7tbvz+S/RfHfn
H5Pdnb++oRGlJMmjyfXuDuXvJRGNiiwnaRoVKclL/uSOv/f2pIpulnzM6AY/1fLT292d3wZ1/Hs0
+efuzoiP+OvuztfXTJ0nhNoz44Rynui587ySGJaSJM2jrP6vU0KTipMSsaQmZdmhZjpr42E+uIqL
wfSS//kOn6J4mA3+jCl8PywGbVwNFnvRij++jYfpoFnyL/Cdb3E+aGazZy/JT23KySyYj9prmH7a
zHB+JqZfwXdIF3ylCW4XsJJWUXoRZ4NFXA8u4QOsFr9N/qiSJBzxWVqRgvqIDzkRtzKuWp6JzkNO
VJM8801EA06UF4R6VhQN+bC04D+44FwMycaiJHXxlEkDari0x7LOCa06LD0bnHw6eQe6ec41dhTT
bDAegybDx/3jI/jiQD3Gf+y/fx/TdPCB28LknP8Zj94enUxG47OYBDTLuiI18xEdkDvSb5ZlRVjX
i++Dr+GWvhC+qJLmHsHfkWbNaUwTYd9f4E8TUzpAL7FUXmLaxqX4Lb7W4kiFeA7/aB/jTDy/5G/j
O9M5/wl6DxjgDp494E8qMTZ8+8VxLn/G4oPwRCQWv8RHE5DYrZrNcVA4sqF7jh5vxeduFnPttr5Q
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
avvkNL7XFDqX3iweVvq6i05urzLDRgHoemuucb36YiuekNYlybq3eGx04EPnTg1Z2J4EvcyEZni5
SC91W2sXzTOS+RgyAZlaN0dUlnqJduueTT2l1ybnUoiB6s9ubZ9uAfisv+86MKhFC0j9PSsOyNk6
EbrGkp57Jl7oeoq+eTKuNL55wt8P1D+Put6l/v3vXGUokVglSnhy25iioaNHAtL8+uCExl7gx06F
0bkZEEr60KF9GwZOocdwNhJ0Qjr9gl7JugaD0ycremcX1E4xVVuHPX1vtrmMVXo5tK7fMQ1A/ss4
9E5i0P3DgqdcdeWRYPDOcKkuRQHtCT59qYS+7MV9fQG6ZLCcx0ZWu4HRZbsuG3wMV2WL3a6jJNXZ
bmeDU6Adjoz1hW17I1FccSLqQaOlFoZiLMOB/fm7jtIKvVkKrbWhCWvPObj0sprUXS+ppMfkZU7Q
4dteRRjcTd2Kgrm6JJEKIHhLVgUbxMO8Bx3wXYKEKbJgvtnitm/KYqZAXNqjPnYhPt9lWTJfXd9z
HHauGwy53VikpCp9PN5CJEpzUnRPtG8hFPVPtAX17J/IDUZJ2GCEyA5+0hkxWHODLqK50LHDi0DY
oPcTopINNbjYo/IFnXe3oKN9jN7alnjBIGT4hGv6ncD/5OB/witWUpMuNtF/9DBgKp4TmnvmXoac
p0b+9s4Tkpe8JmaeabqNqn37C7Ky9ByxDH1HYJqXsM/dT7B93nUtdaF9p9xD3/WV8dyN+Yjr4Ope
5xOOHsagb6Wfnk1NPCYPc7OYNVCUv6BP3Da93Y5u/hXaA/BQVqY/ggiCX+iWUYBGnzT3zxEzrSg4
YQ9Fm+TsCVGmvFGBUqWG+uLQxTqymVuXDFh3hmrody0xj/TeldU5ttTTbyMzlDepBjw2gfeUeti+
Jt//APMctFANCmVuZHN0cmVhbQ0KZW5kb2JqDQozOSAwIG9iag0KPDwvVHlwZS9QYWdlL1BhcmVu
dCAyIDAgUi9SZXNvdXJjZXM8PC9Gb250PDwvRjEgNiAwIFIvRjMgMTMgMCBSL0Y0IDE3IDAgUi9G
NiA0MSAwIFI+Pi9FeHRHU3RhdGU8PC9HUzggOCAwIFIvR1M5IDkgMCBSPj4vUHJvY1NldFsvUERG
L1RleHQvSW1hZ2VCL0ltYWdlQy9JbWFnZUldID4+L01lZGlhQm94WyAwIDAgNjEyIDc5Ml0gL0Nv
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
3DilbHvXfLsLEZxGaoN48ZmVc5HB4TuG7H6DnP/uezz16HNRXCpigeBwR1oZRjHGURZkHcsgjr+1
DIYgflYGHA7xG2K8MWTMFcMZaHtkw8wxw8GpfGOGD0G8QAMi1faKFPhmwPqQ253id7DeBE9/PhFG
CHyB/HmHorsG6ClZKHAr8Mpix1CnJ6OiwLYKCzE7biz0/AGka8wKhNSRHOOCHN9KecwdU6m+y4Pg
LrNBd6yGYbpdDefLtSPJgRpmsQWic7LEN6TfcnUNQdzRpVzjSFSta/32Rvp66kkHTUPtq6i0vqRQ
jrzQjj8U1dM/zrAUaaHI1RLjKdYKLEDWROka+bBB+sSPMiAPSiS/2qh1BzHRWAZFj8gXiCD3T/W8
1raILBUxr0bDNnfkMxKgI7OR4VipWf6tlXoIoopVkZW0nXDvKUZvrhXfPQpLZ6KxyglKPE8CyFgt
KDnSSl7wIIpsQDYrtTAX2mmKpKlUuiX8JY6T2SnqsCeyJIrr0QDMKyoEKB+7QP7919GyyhLsEbcQ
4FYf5Y/J9YAgOY0DrUBH4hG/82YBLGztJfG6VKkS1tMH48Z0xF2FjWEU5ImVHW55zv4ung8DvsSA
7/aeGIvsd7riIStnqQ2yqxWfFkGS24CoFT9WS55oHPJDeHlH3n2tE3R6XJNbUro5XFF5R7YAR99M
8akjxYzRChRWnXGqmDn/mxTTAlikNVc6JLjxRIVkPJjTqJTGpEE4fIqXy2XDbKMkZej1EBofRVmQ
RjaSXEVecYSfG1qAdJMbujRa32AgGVaj8q50NqGfCrKpUxvI/wCauIWLDQplbmRzdHJlYW0NCmVu
ZG9iag0KNDEgMCBvYmoNCjw8L1R5cGUvRm9udC9TdWJ0eXBlL1RydWVUeXBlL05hbWUvRjYvQmFz
ZUZvbnQvQkNESUVFK0x1Y2lkYUNvbnNvbGUvRW5jb2RpbmcvV2luQW5zaUVuY29kaW5nL0ZvbnRE
ZXNjcmlwdG9yIDQyIDAgUi9GaXJzdENoYXIgMzIvTGFzdENoYXIgMTIzL1dpZHRocyA1NCAwIFI+
Pg0KZW5kb2JqDQo0MiAwIG9iag0KPDwvVHlwZS9Gb250RGVzY3JpcHRvci9Gb250TmFtZS9CQ0RJ
RUUrTHVjaWRhQ29uc29sZS9GbGFncyAzMi9JdGFsaWNBbmdsZSAwL0FzY2VudCA3ODkvRGVzY2Vu
dCAtMjA1L0NhcEhlaWdodCA3ODMvQXZnV2lkdGggNjAzL01heFdpZHRoIDYzMC9Gb250V2VpZ2h0
IDQwMC9YSGVpZ2h0IDI1MC9TdGVtViA2MC9Gb250QkJveFsgMCAtMjA1IDYzMCA3ODNdIC9Gb250
RmlsZTIgNTUgMCBSPj4NCmVuZG9iag0KNDMgMCBvYmoNCjw8L1R5cGUvUGFnZS9QYXJlbnQgMiAw
IFIvUmVzb3VyY2VzPDwvRm9udDw8L0YxIDYgMCBSL0Y2IDQxIDAgUi9GMyAxMyAwIFI+Pi9FeHRH
U3RhdGU8PC9HUzggOCAwIFIvR1M5IDkgMCBSPj4vUHJvY1NldFsvUERGL1RleHQvSW1hZ2VCL0lt
YWdlQy9JbWFnZUldID4+L01lZGlhQm94WyAwIDAgNjEyIDc5Ml0gL0NvbnRlbnRzIDQ0IDAgUi9H
cm91cDw8L1R5cGUvR3JvdXAvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCPj4vVGFicy9TPj4N
CmVuZG9iag0KNDQgMCBvYmoNCjw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5ndGggMTcyOD4+DQpz
dHJlYW0NCniczVpLc9s2EL5rRv8BuUmdCCX4pju5tNNm0mlmWtuTHmQfZElWNJElh5LtPv5891sG
siIv3NZZ0fEBJkSQ3+63DywAfux2Ihvhr3KxiUxObVHFpp52O79/Y5bdzven3c63PznjnI1Sc3rZ
7TgaFxlnsri0SUr/bJrTnSsa9/qkNLM1vdPMuFd96r3udsyAgFxGA8fDnnP9c3P6c7fzI739t27n
45eIkUbW7UrB4Iw57Jn/i/OFwhSxjeLUJFWrkuSmkqQoXGz3BWEzxAVbwdDf0+ywD1glNg8ADnvT
ZT/vTfqDqje/1IFzcWTLPACnpJLnMEoe5XC6nGhpVVXWpTKitlZ5lQoYkxUZalVTczGlZgGTLSxd
XS6oGaE7W9PV0FETvewP8p6p6PKlwSU/aEpqzg01Rxj+ClcOzQW6Izw9nWDcCo8scWczwmU9w60N
br2j5i2G//oLXX2no3iSp7YsAoork1tmAgZ5CekG3VeguYaCDc0g16Lb0Awi1kNw4qItudXLhjR6
EJyVGM40340wHF1zjbt44+2c7XGDOwtc/omRf+FWvVKiM02sywKqKtNZ5O1mMQlw2FvPib4ZiF6C
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
5+sRNi0zwVibVppWAu42dQM+ajoK+EemRxFvOml6HNojpjeh/bbpbWi/Z/oz4PNmM81lnt63RuSp
aFRMf8v5UdPzphdMv4D84qHfUwiZfmp6FplNL4GMDJKDpp+Ynvsf6qKd5g0KZW5kc3RyZWFtDQpl
bmRvYmoNCjQ3IDAgb2JqDQpbIDBbIDQ3MV0gIDFbIDU4OV0gIDI2WyA2MDRdICAyOFsgNjkyXSAg
MzRbIDY4Nl0gIDQwWyA1NTZdICA2MlsgNTI0XSAgNjRbIDcwOF0gIDcwWyA3MDddICA3M1sgMjYw
XSAgOTFbIDUwMF0gIDk3WyA3OTAgNzA2XSAgMTA1WyA3MzJdICAxMzJbIDU3N10gIDEzNFsgNzMy
IDYwNl0gIDEzOVsgNTY2XSAgMTQ3WyA0NzldICAxNTJbIDY4MV0gIDE3MVsgNTg1XSAgMTc0WyA4
OTJdICAxNzlbIDU1MyA1NDBdICAyMDVbIDUzMV0gIDIzMFsgNTYxXSAgMjMyWyA1MjVdICAyMzhb
IDU2MV0gIDI0NFsgNTI3XSAgMjY3WyAzMDEgNDg0XSAgMjc1WyA1NTFdICAyNzhbIDIzOV0gIDI5
MlsgMjM5XSAgMjk1WyA0ODddICAyOTlbIDI2MF0gIDMwNVsgODUzIDU1MV0gIDMxNFsgNTUyXSAg
MzQxWyA1NjFdICAzNDNbIDU2MSAzMzRdICAzNDhbIDQ4Nl0gIDM1N1sgMzIzXSAgMzYyWyA1NTld
ICAzODFbIDQ1Ml0gIDM4M1sgNzIxXSAgMzg4WyA0NDIgNDUyXSAgMzk5WyA0MzhdICA4NDdbIDUz
NCA1MzQgNTM0IDUzNCA1MzQgNTM0IDUzNCA1MzQgNTM0IDUzNF0gIDk4NVsgMjAzXSAgOTkxWyAy
ODYgMjg2IDI4NiAyODZdICAxMDA1WyA1MzddICAxMDA3WyAzMzldICAxMDA5WyAzNDBdICAxMDEx
WyA0NjBdICAxMDE0WyA0NjBdICAxMDIwWyAyOTMgMjkzXSAgMTAyNFsgMjk0IDI5NF0gIDEwMzRb
IDQ1MiA0NTNdICAxMDM3WyAyNzBdICAxMTM3WyA1MzRdIF0gDQplbmRvYmoNCjQ4IDAgb2JqDQpb
IDIwMyAwIDAgNTM3IDAgMCAwIDAgMjkzIDI5MyAwIDAgMjg2IDM0MCAyODYgMzM5IDUzNCA1MzQg
NTM0IDUzNCA1MzQgNTM0IDUzNCA1MzQgNTM0IDUzNCAyODYgMjg2IDAgNTM0IDAgMCAwIDU4OSA2
MDQgNjkyIDY4NiA1NTYgNTI0IDcwOCA3MDcgMjYwIDAgMCA1MDAgNzkwIDcwNiA3MzIgNTc3IDcz
MiA2MDYgNTY2IDQ3OSA2ODEgNTg1IDg5MiA1NTMgNTQwIDAgMjk0IDAgMjk0IDAgNDYwIDAgNTMx
IDU2MSA1MjUgNTYxIDUyNyAzMDEgNDg0IDU1MSAyMzkgMjM5IDQ4NyAyNjAgODUzIDU1MSA1NTIg
NTYxIDU2MSAzMzQgNDg2IDMyMyA1NTkgNDUyIDcyMSA0NDIgNDUyIDQzOF0gDQplbmRvYmoNCjQ5
IDAgb2JqDQpbIDE5MyAwIDAgMCAwIDAgMCAwIDI5NCAyOTQgMCAwIDI0NiAzNDkgMjQ2IDAgNTIz
IDAgNTIzIDUyMyA1MjMgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDg3OCA1ODAgMCAwIDAgNTQxIDAg
MCAwIDIzNSAzMTcgMCA0ODQgNzY1IDY4MSAwIDU1NiAwIDAgNTQ2IDAgMCA1NzQgMCAwIDAgMCAw
IDAgMCAwIDAgMCA0ODkgMCA0OTMgMCA0OTQgMjgzIDQzOSA1MDYgMjEwIDIxMCAwIDI0NCA4MDAg
NTA2IDUxMyA1MTkgMCAzMTAgNDYzIDMwNCA1MDZdIA0KZW5kb2JqDQo1MCAwIG9iag0KPDwvRmls
dGVyL0ZsYXRlRGVjb2RlL0xlbmd0aCAxMTcyMy9MZW5ndGgxIDI2Mjg4Pj4NCnN0cmVhbQ0KeJzs
fAl8VNXV+L3vvdknyWQPSci84SUTyGQhCVllGbIvELLCTAgwk8kkGbIymYRdIhCCI+CCkijgAhpA
/eoEFMG2bnXp1wrVr1pb/VtF+/Wr/v61VftZK2Tmf+57b8KAaLWtbX+/v++8N+/ec88999xzzj33
3GcQYYRQCPwwyLisISOr6i8TbyKENwDW0tC4uLFe9nIUQrbjUN9i67H2HwpZ/zpCkbuBptY25GJ1
xyJfRGh2N7Q/3d7f0bPiphANQlG/BKY7Oro3tu82dWUhNCcVobj7O+3WtkRqZibQXoIntxMQ6jcl
LuA1D+qJnT2uDeW2hOehDv3DPd19NuvPHn59D0IlLyOk1PRYN/TL12lyoN0E9GyP3WXd/5e8vyDU
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
+CB2qRP6eyvkR8RH6V7kB7712M7ODuakUPIu+TWs0AemnmXPK5oTPo8tHgszP6eDos7Rp2bpLiP+
6DPDEnVF90hXUWtSPCDoXuWD6CdSfE58Cfi4oDuc3xDfB14RPwU+J94AviluAt+CvlLuhxxJT3MD
zslDwI/LdeBZ2QMG8ovAx+SXgV+RV4BPyavQ7Zq8hvGz8jrwefk88AX5G/p8gfwd8CX5e+Af5cvA
1+XrwBvyBvBvdDdY3pSQLt+SbwP/K3eEVJbaD7xLvRc4R98Nog6oDwE/rD4GbCkXuKyOA0+oTwDX
1MPAs+oscEOdB15Qm8CL6rPAzyv4SPnqUWCsYmCqUuBIPQ58Qj0B/Kr6OvCb6jvA76ofAJ9SPwI+
rZ4GPqOeAV5XsEv9XL0AfFHBLvWS+gPwZfUn4CvqFeBr6jXgX9RfgTcUbFR/V/8G/ke9CbypYKl6
W/0P+I56R0gLpgL3W/C5NWfNAe+27gYesA4A77HuAd5r3Qu8z7oPeL81D2xbbeCD1kngmrUmpP2A
jVjbp+xTwEfsR4BP2k8Cf2hfFZb9Y/snGF+z/4zxq/arGP/D/ifwjX37OJctvi8u+Cmsi/x9KFft
X9kv2r9Gflk47roQ9s/sX4h99m/B432Ug/Zz9i//D3QqBdANCmVuZHN0cmVhbQ0KZW5kb2JqDQo1
MSAwIG9iag0KWyAxOTMgMCAwIDU2MSAwIDAgMCAwIDMzNyAzMzcgMCAwIDAgMzY1IDAgMCA1NDAg
NTQwIDU0MCA1NDAgNTQwIDU0MCA1NDAgMCA1NDAgNTQwIDAgMCAwIDAgMCAwIDAgNjEwIDU5OSA2
NzUgNjc4IDU0OSA1MTcgNjg2IDY4MyAyNjcgMCAwIDAgNzk0IDY5NiA3MDUgNTg1IDcwNSA2MTAg
NTc0IDQ5OSAwIDYwMSA5MjEgMCAwIDAgMCAwIDAgMCA0NjAgMCA1MDcgNTQyIDUwOCA1NDIgNTE1
IDMxOCA0NzIgNTMzIDI0MCAyNDAgNTAwIDI3OSA4NDAgNTMzIDUzMCA1NDIgNTQyIDM0MyA0ODQg
MzMzIDUzNCA0NzUgMCA0ODkgNDc1XSANCmVuZG9iag0KNTIgMCBvYmoNCjw8L0ZpbHRlci9GbGF0
ZURlY29kZS9MZW5ndGggMTQ0MDkvTGVuZ3RoMSAzMDI0OD4+DQpzdHJlYW0NCnic7Dx5fBPXme/N
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
NS+Pblg+eGToouaXFzv6W7rabeftpeXlrTU7T9QVHR1x3h4dfu+2TScaYH91IJPZEj1kj/5w5lfT
SiXA9ffzYxQqJyMhfjkoMznTYtEIESVNn4b1GggmofCiBicfo2qx7MSJyYO490+X6aUTj771J/wy
xZBdKwLNYSQxcFo0WDXhAZpICfxQWDADmamXcXJiDspM9aZIeh/jkJYYgvWhevqa/KnZN7+1Gfut
a2kaGLSXNEZ9nkldmXwnfOam+v7Tqzb+Ksj21K6GjqFNQz2Jeuri+9zFmXPq/u2Oe19uI7SUAi1k
HxIILdGsHhlVRhUKlEvg9D6dFvH8Sj7q8T5MPMB7T/ACaXFE5UWq8m/9aOvWjw4881YUNxloyxtc
l7dyQXNDTbnzwTmKhJW3tPQ90b385aCd2Pi73+HE2557orjww89y9z1UONra2LOi4rksR2bT09vH
zq6CU0o+UOkPVEYDnfORzhooD0tMNJnQ3ECJM+YaneSznjcBgRPkNHPnNYMYopBgyky8xwkO82q0
kG7Obnxsd/X+VY396872D7ywbqR6cG/lrseb57VnZ7XNT+/I2VyXWjO3vySldq6lJiih5WDv6N06
9uDA6B0FS46ODhyN0t092nuwJeH12fb8nFozxrNrF3Z2UhU4vjyzriK2KHPe0nivBiiBnyQi9TBt
pE4CP6SOk1ynARqv1E1xekHM1zwW/2U/HOLqNbdGPrRKKXrLs31qTPs3la3etqB7YZujoaJ0qGkm
Y3DsbHU+3dt3/va9l7du+zSo4f6+vPL/erff9WDR+pam3jnVltPJjryWZ7ZuOjtwM/fO777gLuwF
2dd6Pqc50c+ZUaQ1IH6WeTaDYhQ0ODy/6/O+b/F5sjgcTs0aOrFm/vw1J4YG3Wuys9e4B+eVJgUH
J5XOmwf+LySh5ObDVMCub3N+9zYS5zevhl7fQ2JTGUiSkqRIpfRS/oQ2G1zzKt4jQhYFHhErfN8l
U6/3h41RVUNLK9c1x16d5g8BagZ/ckxhpHTlVwRLIXirEL5dJSFtC4znSPSAtTqEtIl+IkkMjNdM
kHYdtMP5+bV+pF0PbR3frteQdhW0BXg2PxJLBgD+Uv6MpIVYEvZ3z0i+DyBUy+5LW7de2r3n8rZt
l/cMwTXodE47G118cGT44YeHRx4k0skHZLfSF4SvoRC9sJ8vxxSlA95clM762QfWVo22GK9Sd6bW
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
TrbuW7Mp8/uB5x740t96w/yd/hajEFbiUU5fH40nB+Gd/vJAo2HRpylNb5iWq2ocbs9DgeDMQKhV
TA2oDQNmC9wGN8wK1LeKkVTDdakWcUagKTAzQH+PsaFVHIwPazGjWwm3iE2B+kBTq5gwqKo45dQH
ZgVmzGql907socCgQp98bFbozTXIN9fPlCKhYLdkJmvEBcN6vEb8ji7Lm2rEzUqtxQ0P1loXDJ0T
qU2M+EaDICsYjWHfyFTGcAgRVTOux60IDcF9GnYgPAS3atiJiAL3Zpj+2uMYNBn2tdnW70XiaegK
+sxz4n1bz507x377EeEScgwhEofXMZZ5gggei6KMFhiNON9tFYUsA3oD+xZzzP5fEYZ5Rp/FtsDc
w2gOos9B58H6gtE16HuAv4/uBEy/1RxD5X4G+Bn0KeA/oDOAPwd/MXaBHUy/6RywG1cCrsa9gJfi
CGAZ3wh4K74V8G34AOCD+Anw7Qg+AvTT+Cjg4/g44GfxrwD/M34Z8Cv4NcBv4DcBv4ffA3wKnwJ8
Gv8O8BkM1vHn+E+A/wufQ5gIxAV4LCkC7Ka/yUl85DLAU0kV4BoSANxImgHPJlcBXkB6AC8lSwH3
keWAV5J+wKvJGsAbCOSIRMlGwAmSAKwRDfAQ+T7gm8nNgLeTHYB3kocB7yb7AR8kjwP+Kfkp4KfI
U4CPEoiL/Jw8C/gFAnGRV8jrgN8k/wr4bfI24HfJu4D/jZwEfIpAjOR98gngz8gfAJ8hECn5E/kC
cJqkERYgVMAuAXIuuAU3YI/gAewTfIAvES4BPEGYAHiKMAVwuVALuF6oBzxPaAO8QFiAsGOOA2rt
6HB0AL7WcS3gXY5dgB9zPIEEx5OOw0AfcbwF9DuOd4D+0PF7wJ86nayXBfb8HUEP0W/7p79D+oTj
eccLjhehvwQYdxQhxzHHc8jpeAl0lNAedDzjOPG/7GMvyA0KZW5kc3RyZWFtDQplbmRvYmoNCjUz
IDAgb2JqDQpbIDI3OF0gDQplbmRvYmoNCjU0IDAgb2JqDQpbIDYwMyA2MDMgMCAwIDAgMCAwIDAg
NjAzIDYwMyAwIDAgNjAzIDYwMyA2MDMgMCA2MDMgNjAzIDYwMyA2MDMgNjAzIDYwMyA2MDMgNjAz
IDYwMyA2MDMgNjAzIDYwMyAwIDYwMyAwIDAgMCAwIDAgMCAwIDYwMyAwIDAgMCA2MDMgMCAwIDYw
MyA2MDMgMCA2MDMgNjAzIDAgNjAzIDYwMyA2MDMgMCA2MDMgMCAwIDAgMCA2MDMgMCA2MDMgMCAw
IDAgNjAzIDYwMyA2MDMgNjAzIDYwMyA2MDMgNjAzIDYwMyA2MDMgMCA2MDMgNjAzIDYwMyA2MDMg
NjAzIDYwMyAwIDYwMyA2MDMgNjAzIDYwMyA2MDMgNjAzIDYwMyA2MDMgNjAzIDYwM10gDQplbmRv
YmoNCjU1IDAgb2JqDQo8PC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3RoIDE1Mzg5L0xlbmd0aDEg
MjU5OTY+Pg0Kc3RyZWFtDQp4nOx7CXgUVbbwuXVr6e7qpbqT7k5CQncSAkiABEJYAykhAdkRBQ3Y
DiHpQENIQjZI8ElcQIwLLo3MMKPGDWUQVHAUdEajJi6Io4PgMGMG44jLoBmXGcWRdPHOraosIG++
9973vf/7/u+zTm7VvbfuvWe955xbSYAAgII3HtTCqQWXh1L+sR0gHzstGwunzpn2w00nZgBMsgDQ
7+dfljX6xqKXPgMgW3DA4pI1xVUv/+qLbQDScezbV1JfG5x2dG4zgO1xfP/PsqoVa0ZeeogCWG/F
dsqK8oayjtK/LAeQWwCCzpXh4tK/prxShXPt+H7sSuyQr6azsV2A7UEr19SuH2zLvBnbnQDCd+WV
JcX+KYGnADKfxPb4NcXrq/gEMh3fr8TxwTXh2uKkR+66FGBGE7YvqSheE35h665BANlIsw2qKmtq
z46FFQATP2Pjq6rDVb5js7BtZfRqwGQhcFvv3rlv489ced+CjGzjtcvdmMKeR0/E0nHYAkEWF2DT
ro9nFz7FBRr28e8CnH1NkHvf9FzLWA/3S8gGqrc5UMAH92DtXcSrr8EfIXegFizCDiEH2w8ZT3IM
yrhpFisni1Ze4DmObwJuK0BC79JTB18SBBWCsEEs0K6CR8UFBKUDgT/+kb3FVbFAv0K68HkaLnDh
uyJ8F+3XPobtI+xptKESy0Esj2E5ZbSJE58PYnkDSwuWbca83jmLL4SrDwccP6+9p1/9BJarzfoU
LCfN+gEsD2NJNNvOC/Dy2/PXM9tbWB+Wh7BsxHIb4xnLBizP9IzH5zFzXMjsj2DZb649BuvPY7ke
y5MmbXZz7CITx6l/x/dP10/XT9dP1//hxZlRKB5jDtZIEhYR+oIWx7Ex5174kvKCXpUxJrsUN8TF
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
sL6JSYojnwci/5DD9zTzP3vkLyj6M+x5GoE7qJk9fEB3Cm3ri48oBY56G9TkHEa4vidzX3W8nWv4
wnrIHXdkZRD+gZ4GX8A5zV6jgk/VpV9uHzqn4DYeQZDudD2gf9UottvzDDU498hWzgLF1yfshUUa
y4S5yvpNHPd7Iv4PrI418g0KZW5kc3RyZWFtDQplbmRvYmoNCjU2IDAgb2JqDQo8PC9UeXBlL01l
dGFkYXRhL1N1YnR5cGUvWE1ML0xlbmd0aCAzNjAyPj4NCnN0cmVhbQ0KPD94cGFja2V0IGJlZ2lu
PSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz48eDp4bXBtZXRhIHhtbG5zOng9
ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSIzLjEtNzAxIj4KPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgIHhtbG5zOnBkZj0iaHR0cDovL25zLmFkb2JlLmNvbS9wZGYvMS4z
LyI+CjxwZGY6UHJvZHVjZXI+TWljcm9zb2Z0wq4gV29yZCBmb3IgTWljcm9zb2Z0IDM2NTwvcGRm
OlByb2R1Y2VyPjwvcmRmOkRlc2NyaXB0aW9uPgo8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0i
IiB4bWxuczpwZGZ4PSJodHRwOi8vbnMuYWRvYmUuY29tL3BkZngvMS4zLyI+CjxwZGZ4Ok1TSVBf
TGFiZWxfODc4NjcxOTUtZjJiOC00YWMyLWIwYjYtNmJiNzNjYjMzYWZjX1NpdGVJZD43MmY5ODhi
Zi04NmYxLTQxYWYtOTFhYi0yZDdjZDAxMWRiNDc8L3BkZng6TVNJUF9MYWJlbF84Nzg2NzE5NS1m
MmI4LTRhYzItYjBiNi02YmI3M2NiMzNhZmNfU2l0ZUlkPgo8cGRmeDpNU0lQX0xhYmVsXzg3ODY3
MTk1LWYyYjgtNGFjMi1iMGI2LTZiYjczY2IzM2FmY19NZXRob2Q+UHJpdmlsZWdlZDwvcGRmeDpN
U0lQX0xhYmVsXzg3ODY3MTk1LWYyYjgtNGFjMi1iMGI2LTZiYjczY2IzM2FmY19NZXRob2Q+Cjxw
ZGZ4Ok1TSVBfTGFiZWxfODc4NjcxOTUtZjJiOC00YWMyLWIwYjYtNmJiNzNjYjMzYWZjX0VuYWJs
ZWQ+VHJ1ZTwvcGRmeDpNU0lQX0xhYmVsXzg3ODY3MTk1LWYyYjgtNGFjMi1iMGI2LTZiYjczY2Iz
M2FmY19FbmFibGVkPgo8L3JkZjpEZXNjcmlwdGlvbj4KPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJv
dXQ9IiIgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyI+CjxkYzpj
cmVhdG9yPjxyZGY6U2VxPjxyZGY6bGk+Sm9uIExhbmdlPC9yZGY6bGk+PC9yZGY6U2VxPjwvZGM6
Y3JlYXRvcj48L3JkZjpEZXNjcmlwdGlvbj4KPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIg
IHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyI+Cjx4bXA6Q3JlYXRvclRv
b2w+TWljcm9zb2Z0wq4gV29yZCBmb3IgTWljcm9zb2Z0IDM2NTwveG1wOkNyZWF0b3JUb29sPjx4
bXA6Q3JlYXRlRGF0ZT4yMDI0LTA2LTAzVDEwOjQ1OjE2LTA3OjAwPC94bXA6Q3JlYXRlRGF0ZT48
eG1wOk1vZGlmeURhdGU+MjAyNC0wNi0wM1QxMDo0NToxNi0wNzowMDwveG1wOk1vZGlmeURhdGU+
PC9yZGY6RGVzY3JpcHRpb24+CjxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiICB4bWxuczp4
bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyI+Cjx4bXBNTTpEb2N1bWVudElE
PnV1aWQ6MTdDQkNENUUtNzFBQi00MUQ3LTlBMTYtQjY3QUU5OUIxOTgzPC94bXBNTTpEb2N1bWVu
dElEPjx4bXBNTTpJbnN0YW5jZUlEPnV1aWQ6MTdDQkNENUUtNzFBQi00MUQ3LTlBMTYtQjY3QUU5
OUIxOTgzPC94bXBNTTpJbnN0YW5jZUlEPjwvcmRmOkRlc2NyaXB0aW9uPgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAg
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
ICAgICAgICAgICAKPC9yZGY6UkRGPjwveDp4bXBtZXRhPjw/eHBhY2tldCBlbmQ9InciPz4NCmVu
ZHN0cmVhbQ0KZW5kb2JqDQo1NyAwIG9iag0KPDwvRGlzcGxheURvY1RpdGxlIHRydWU+Pg0KZW5k
b2JqDQo1OCAwIG9iag0KPDwvVHlwZS9YUmVmL1NpemUgNTgvV1sgMSA0IDJdIC9Sb290IDEgMCBS
L0luZm8gMyAwIFIvSURbPDVFQ0RDQjE3QUI3MUQ3NDE5QTE2QjY3QUU5OUIxOTgzPjw1RUNEQ0Ix
N0FCNzFENzQxOUExNkI2N0FFOTlCMTk4Mz5dIC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3RoIDIx
Mz4+DQpzdHJlYW0NCnicJc+9S0JxGMXx383KOciu6eIWonUVdBECXxDcHLqCDklQW5AEujXqH+Dg
29SmCA6OdTfJKYJoM5yEsMHRycXr9fs8w/nAmc6jlHO2rTl5otSeqrCGgyUcuuC0KGzBs4KzgFAA
3S3Y4G3CeQ58WfDfQrgkzIUNXHaEBVx9g/EMEROiMiLZglQPbgwwr+H+Hx5kRLULtTHU09B4hFZe
+ID2D/SHMJjAW1D4hfdPsGYw+YPpxR5N8YPm+oKjEBwnIHYH8Vd4yghlqEg50sF6UWoHaZQx9g0K
ZW5kc3RyZWFtDQplbmRvYmoNCnhyZWYNCjAgNTkNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAw
MDAxNyAwMDAwMCBuDQowMDAwMDAwMTE2IDAwMDAwIG4NCjAwMDAwMDAyNDMgMDAwMDAgbg0KMDAw
MDAwMDc0MiAwMDAwMCBuDQowMDAwMDAxMDI3IDAwMDAwIG4NCjAwMDAwMDUyMDggMDAwMDAgbg0K
MDAwMDAwNTM3NCAwMDAwMCBuDQowMDAwMDA1NjExIDAwMDAwIG4NCjAwMDAwMDU2NjQgMDAwMDAg
bg0KMDAwMDAwNTcxNyAwMDAwMCBuDQowMDAwMDA1ODk1IDAwMDAwIG4NCjAwMDAwMDYxNDMgMDAw
MDAgbg0KMDAwMDAwNjI4OSAwMDAwMCBuDQowMDAwMDA2NDcyIDAwMDAwIG4NCjAwMDAwMDY3MjUg
MDAwMDAgbg0KMDAwMDAwNzAwNSAwMDAwMCBuDQowMDAwMDExMzUzIDAwMDAwIG4NCjAwMDAwMTE0
ODMgMDAwMDAgbg0KMDAwMDAxMTUxMyAwMDAwMCBuDQowMDAwMDExNjcxIDAwMDAwIG4NCjAwMDAw
MTE3NDUgMDAwMDAgbg0KMDAwMDAxMTk4MyAwMDAwMCBuDQowMDAwMDEyMTQ1IDAwMDAwIG4NCjAw
MDAwMTIzNzIgMDAwMDAgbg0KMDAwMDAxMjYzMiAwMDAwMCBuDQowMDAwMDE2NTMzIDAwMDAwIG4N
CjAwMDAwMTY3OTMgMDAwMDAgbg0KMDAwMDAyMTI5NSAwMDAwMCBuDQowMDAwMDIxNTY1IDAwMDAw
IG4NCjAwMDAwMjU1NzUgMDAwMDAgbg0KMDAwMDAyNTg1NSAwMDAwMCBuDQowMDAwMDI5ODQ4IDAw
MDAwIG4NCjAwMDAwMzAxMjggMDAwMDAgbg0KMDAwMDAzMzg1OCAwMDAwMCBuDQowMDAwMDM0MTU1
IDAwMDAwIG4NCjAwMDAwMzgyMjMgMDAwMDAgbg0KMDAwMDAzODMzOSAwMDAwMCBuDQowMDAwMDM4
NjA5IDAwMDAwIG4NCjAwMDAwNDI2NjUgMDAwMDAgbg0KMDAwMDA0Mjk0NSAwMDAwMCBuDQowMDAw
MDQ3MTQ1IDAwMDAwIG4NCjAwMDAwNDczMjEgMDAwMDAgbg0KMDAwMDA0NzU2MiAwMDAwMCBuDQow
MDAwMDQ3ODMyIDAwMDAwIG4NCjAwMDAwNDk2MzYgMDAwMDAgbg0KMDAwMDA1MDIxNSAwMDAwMCBu
DQowMDAwMDY1Nzg1IDAwMDAwIG4NCjAwMDAwNjY1MDggMDAwMDAgbg0KMDAwMDA2Njg1OSAwMDAw
MCBuDQowMDAwMDY3MTMwIDAwMDAwIG4NCjAwMDAwNzg5NDQgMDAwMDAgbg0KMDAwMDA3OTI2MyAw
MDAwMCBuDQowMDAwMDkzNzYzIDAwMDAwIG4NCjAwMDAwOTM3OTAgMDAwMDAgbg0KMDAwMDA5NDEx
MSAwMDAwMCBuDQowMDAwMTA5NTkxIDAwMDAwIG4NCjAwMDAxMTMyNzYgMDAwMDAgbg0KMDAwMDEx
MzMyMSAwMDAwMCBuDQp0cmFpbGVyDQo8PC9TaXplIDU5L1Jvb3QgMSAwIFIvSW5mbyAzIDAgUi9J
RFs8NUVDRENCMTdBQjcxRDc0MTlBMTZCNjdBRTk5QjE5ODM+PDVFQ0RDQjE3QUI3MUQ3NDE5QTE2
QjY3QUU5OUIxOTgzPl0gPj4NCnN0YXJ0eHJlZg0KMTEzNzM0DQolJUVPRg0KeHJlZg0KMCAwDQp0
cmFpbGVyDQo8PC9TaXplIDU5L1Jvb3QgMSAwIFIvSW5mbyAzIDAgUi9JRFs8NUVDRENCMTdBQjcx
RDc0MTlBMTZCNjdBRTk5QjE5ODM+PDVFQ0RDQjE3QUI3MUQ3NDE5QTE2QjY3QUU5OUIxOTgzPl0g
L1ByZXYgMTEzNzM0L1hSZWZTdG0gMTEzMzIxPj4NCnN0YXJ0eHJlZg0KMTE1MDcxDQolJUVPRg==

--_004_DS7PR21MB352490005169B16909763C76CAFF2DS7PR21MB3524namp_--
