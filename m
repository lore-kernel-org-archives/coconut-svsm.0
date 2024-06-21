Return-Path: <clopez@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 148031C862C
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Jun 2024 15:43:52 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9E4E21AF4
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Jun 2024 13:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718977432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmjILWJGeaQlKeOmku8KBT6FP5OnKanHpSoO7yzYRDI=;
 b=DfsiPPJ6ZvHnfqtWjmZxPH+6mmmzQN/Sb1batu0heMDQsp3X0qE0jlhIlPmy6f8PjLVt1v
 1eTGjdkXvbZT2lQD2VhgrGAEk4E8dgfrY+4WEDkGC+Gsn0twoZGFmbkv/0W8kzNALzDlwn
 bBGgVA/az/7juXtKFXQKE/6oyr7kAkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718977432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmjILWJGeaQlKeOmku8KBT6FP5OnKanHpSoO7yzYRDI=;
 b=Gvsy/9cDb6kvUYNWLfi/FABFnXSSZ5PhmGFJ/ZR9DmSRjOKyDtE5cOvCMO5ODQjtDhFkSE
 FnBSVqKu77aWQTDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718977431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmjILWJGeaQlKeOmku8KBT6FP5OnKanHpSoO7yzYRDI=;
 b=GlwygFkbWge8GO+FYW1LkOivpMESE5F/gwlB/e2BuVPVRy20epgrnQiR6rnBJzsxlkyzfq
 yunWRDf/15+ysQrHH/5ZLVbzFFLaBrfOC9158c8ag5sQdLik6y9er5de8XrxPAD1wHwI7F
 VJX2MVYfsOnWIbNyYoPCkGj/vdv6dew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718977431;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmjILWJGeaQlKeOmku8KBT6FP5OnKanHpSoO7yzYRDI=;
 b=YSHlGecrZSr1ksbNxJUTWomeO8LYa9I42juhIvpRoCzeK18NJImT0/ZROB3oi2ZMYZPGox
 irRKbRLkNKvWteCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C385213AAA
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Jun 2024 13:43:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tk84LZeDdWb0GQAAD6G6ig
 (envelope-from <clopez@suse.de>)
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Jun 2024 13:43:51 +0000
Message-ID: <03989464-ec0f-474e-aa21-53a7503a73bb@suse.de>
Date: Fri, 21 Jun 2024 15:43:51 +0200
MIME-Version: 1.0
References: <DS7PR21MB352462BA31B209F93F296A17CAEE2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR12MB57668C5D8AE281740909574B94F42@DS7PR12MB5766.namprd12.prod.outlook.com>
 <DS7PR21MB3524D4C48D6A51302783F0C3CAF42@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR21MB35248BAAD184D55EB2D057B9CAFC2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR21MB352490005169B16909763C76CAFF2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR12MB5766A185764744C3DF6ADBA794FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
 <DS7PR21MB3524EA15795F4C668B826A88CAFF2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <DS7PR21MB352407F5564A9B1E0D137412CAC92@DS7PR21MB3524.namprd21.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <DS7PR21MB352407F5564A9B1E0D137412CAC92@DS7PR21MB3524.namprd21.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] RFC: Alternate Injection SVSM support
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"; format="flowed"

Hi, just a small comment on error handling (again).

 > - ECX[1:0] = 0b10. This will cause Alternate injection to be 
registered for the guest. No
 > change will be made to Alternate injection on the calling vCPU. If 
the registration count is
 > already zero, this will fail with error code 0x8000_1000
 > (SVSM_ERR_APIC_CANNOT_REGISTER).
 > ..
 > Once Alternate Injection is disabled on the calling vCPU, further 
calls to the SVSM APIC Protocol
 > will return SVSM_ERR_UNSUPPORTED_PROTOCOL.

Wouldn't it be more consistent to also return
`SVSM_ERR_UNSUPPORTED_PROTOCOL` in the first case? Otherwise, if I
understand correctly, we need to track this edge case where the
registration count has dropped to zero but Alternate Injection is not
disabled for a vCPU because it did not make the call with ECX
[1:0]=0b00. In my mind this is also a strange state because the guest
requested deregistration via ECX[1:0]=0b01 but it's still active in
other vCPUs, but perhaps I'm not understanding the
registration/activation model.

On 21/6/24 6:44, Jon Lange wrote:
> Attached is the most recent (and hopefully final) draft of the 
> proposed Alternate Injection specification.  This document addresses 
> the feedback received from David Kaplan and also cleans up some other 
> inconsistencies with error codes returned from the APIC Emulation 
> Protocol calls.
> 
> -Jon
> 
> *From:*Jon Lange
> *Sent:* Monday, June 3, 2024 11:55 AM
> *To:* Kaplan, David <David.Kaplan@amd.com>; 
> amd-sev-snp@lists.suse.com; svsm-devel@coconut-svsm.dev
> *Subject:* RE: RFC: Alternate Injection SVSM support
> 
> The registration status of Alternate Injection applies to the entire 
> guest, but the Alternate Injection SEV feature is per-VCPU.  There has 
> to be something to tie the two together.  Consider an example where 
> OVMF elects to deregister Alternate Injection during ExitBootServices 
> because it does not know (and cannot know) what the loaded OS is going 
> to do, and additionally suppose that the loaded OS in this case has 
> not registered Alternate Injection.  That means when OVMF deregisters 
> as part of ExitBootServices (presumably on the BSP), it will make the 
> 0b01 call, which will deregister Alternate Injection at a VM level 
> (meaning it cannot be re-registered), but only the BSP’s VMSA will 
> have the SEV feature bit clear.  Once OVMF deregisters Alternate 
> Injection, it must ensure that any AP that is already running issues 
> the 0b00 form of the call to refresh its own SEV feature to bring it 
> into sync with the VM-wide registration state.  In this example, each 
> AP that issues the call will cause Alternate Injection to be removed 
> from its VMSA.  On the other hand, if Alternate Injection were to 
> remain registered because the loaded OS chose to register it, then the 
> 0b00 call would have no effect on each AP because Alternate Injection 
> remains registered at the VM level.  Thus this call is both safe and 
> necessary on every AP to align each AP with the VM-wide status.  I can 
> try to make this more clear in the next revision.
> 
> Call 5 is erroneous and should be removed – the intended text was 
> included in Call 1 as you suspected.  I’ll clean that up in the next 
> revision.
> 
> -Jon
> 
> *From:*Kaplan, David <David.Kaplan@amd.com <mailto:David.Kaplan@amd.com>>
> *Sent:* Monday, June 3, 2024 11:46 AM
> *To:* Jon Lange <jlange@microsoft.com <mailto:jlange@microsoft.com>>; 
> amd-sev-snp@lists.suse.com <mailto:amd-sev-snp@lists.suse.com>; 
> svsm-devel@coconut-svsm.dev <mailto:svsm-devel@coconut-svsm.dev>
> *Subject:* [EXTERNAL] RE: RFC: Alternate Injection SVSM support
> 
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Thanks Jon, I had no issues opening this version.
> 
> I did have some questions though on the new registration protocol.  
> The description on p.4-5 makes sense but makes it sounds like there 
> are only 2 types of calls here (‘register’ and ‘unregister’), yet the 
> detailed SVSM_APIC_CONFIGURE_EMULATION on p.8 has 3 different inputs.
> 
> I can’t quite figure out the 0b00 call…it sounded like 
> AlternateInjection would be automatically disabled via the 01 call if 
> the registration count drops to 0.  So when would the 00 call be used?
> 
> Separately, on p. 10, call 5 (Configure Alternate Injection) seems to 
> be missing some text.  I’m guessing maybe that call is redundant with 
> call 1 and intended to be removed but it’s unclear.
> 
> Thanks –David Kaplan
> 
> *From:*Jon Lange <jlange@microsoft.com <mailto:jlange@microsoft.com>>
> *Sent:* Monday, June 3, 2024 12:47 PM
> *To:* Kaplan, David <David.Kaplan@amd.com 
> <mailto:David.Kaplan@amd.com>>; amd-sev-snp@lists.suse.com 
> <mailto:amd-sev-snp@lists.suse.com>; svsm-devel@coconut-svsm.dev 
> <mailto:svsm-devel@coconut-svsm.dev>
> *Subject:* RE: RFC: Alternate Injection SVSM support
> 
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> 	
> 
> *Caution:*This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> Apparently the last version of the PDF I sent had some rights 
> restrictions.  Here is a newer version which should be unrestricted.
> 
> -Jon
> 
> *From:*Jon Lange
> *Sent:* Thursday, May 30, 2024 9:32 PM
> *To:* Kaplan, David <David.Kaplan@amd.com 
> <mailto:David.Kaplan@amd.com>>; amd-sev-snp@lists.suse.com 
> <mailto:amd-sev-snp@lists.suse.com>; svsm-devel@coconut-svsm.dev 
> <mailto:svsm-devel@coconut-svsm.dev>
> *Subject:* RE: RFC: Alternate Injection SVSM support
> 
> Attached is a newer draft (dated May 24) of the Alternate Injection 
> proposal that incorporates the concepts in the discussion referenced 
> below.  The most significant design change is the change to a 
> registration count to determine if and when Alternate Injection should 
> be disabled as the result of a hand-off from firmware to the OS.
> 
> There is an open PR in the COCONUT-SVSM project that includes the SVSM 
> implementation of this proposal.
> 
> -Jon
> 
> *From:*Jon Lange
> *Sent:* Thursday, May 23, 2024 3:05 PM
> *To:* Kaplan, David <David.Kaplan@amd.com 
> <mailto:David.Kaplan@amd.com>>; amd-sev-snp@lists.suse.com 
> <mailto:amd-sev-snp@lists.suse.com>; svsm-devel@coconut-svsm.dev 
> <mailto:svsm-devel@coconut-svsm.dev>
> *Subject:* RE: RFC: Alternate Injection SVSM support
> 
> David, thanks for your feedback!
> 
>   * Additionally, the term “becomes deliverable” here may not be
>     clear.  I believe your intention is that when the HV decides to
>     deliver a guest OS interrupt, it must cause the SVSM to run.
> 
> Yes, this is what I meant by deliverable, and I now see why this 
> caused confusion because the CPU defines “deliverable” to mean when 
> the IDT dispatch can occur, which is different.  I can clarify this.
> 
>   * /p.2: “The hypervisor is expected to cause the SVSM to run any
>     time delivery of an interrupt would result in injection of #HV to
>     the SVSM.”/
>   * This is just basic Restricted Injection behavior I believe…in
>     order to send an interrupt to the SVSM the HV must inject a #HV
>     into the SVSM and then run it.  I don’t think any of that changes
>     with this Alternate Injection spec (right?)
> 
> This is made more complex by the presence of multiple VMPLs, where I 
> don’t think we have any clear specification (including in Restricted 
> Injection documentation) about scheduling considerations.  The point 
> here is that whenever the process of delivering an interrupt to a 
> lower VMPL makes the hypervisor conclude that a notification is due to 
> the SVSM, then the SVSM (i.e. VMPL 0) must be selected to run next on 
> that vCPU. I’m encouraged that you think this should be implicit from 
> existing language, but that was less obvious to me.
> 
>   * Shouldn’t this be bits 8, 9, or 10?
> 
> This is an editing error from a previous draft.  Thanks for pointing 
> it out.
> 
>   * I would suggest considering defining names for each of these
>     fields, and including a table showing the overall layout. 
> 
> I agree that this should happen once this behavior is incorporated 
> into the GHCB/SVSM specifications owned by AMD.  My aim here was to 
> describe the behavior and the standards changes required, not to 
> create authoritative documentation.
> 
>   * The statement about the SVSM having to know if the first component
>     supports Alternate Injection is for security, correct?  That is,
>     if the guest wants interrupt security then it’ll want Alternate
>     Injection enabled from the beginning.  If that’s the case, then
>     the SVSM **must** enable Alternate Injection prior to the first
>     guest entry (not “may”) true?
> 
> I think this is another leftover from previous revisions.  I agree 
> that this must be stated more clearly.
> 
>   * Another idea to consider: What if you had a counter that
>     increments when someone requested Alternate Injection and
>     decremented when they asked to disable it.  And the feature is
>     enabled when the counter is > 0. I think that would also solve
>     your problem of guest FW not knowing if the guest OS will want the
>     feature or not.
> 
> This is a great idea and eliminates all of the Enabled/Disabled/Locked 
> confusion that you were concerned about.  I will plan to make this 
> change, which I think will make your feedback about the 
> Enabled/Disabled/Locked state machine moot.
> 
>   * This probably a bit unrelated to the spec itself as this is really
>     about the internal implementation of the SVSM.  But I think the
>     important point is that the SVSM may be running (for whatever
>     reason), the HV can send it a #HV, and then when the SVSM requests
>     a VMPL change the HV should assume that the SVSM has processed the
>     information from the #HV.
> 
> Yes, but this fact is not necessarily obvious to someone who 
> implements the SVSM protocol.  I thought it would be helpful to point 
> out, but it need not be part of the text that is incorporated into the 
> SVSM specification.  It’s also helpful to underscore it here because 
> the protocol could alternately have been designed to state that it was 
> the hypervisor’s responsibility to prevent the VMPL switch if the #HV 
> NoFurtherSignal bit was still set (meaning the pending interrupt had 
> not yet been processed) – so stating the SVSM’s responsibility here in 
> the document emphasizes the fact that the tradeoff has been considered 
> and the responsibility lies with the SVSM and not the hypervisor.
> 
>   * I am concerned about the fact that once Disabled, Alternate
>     Injection can’t be re-enabled.  Is that really required?  For
>     instance, what if we’re running a guest OS that doesn’t understand
>     alternate injection and then we kexec into a kernel that does.
> 
> Reenabling Alternate Injection would require transferring all of the 
> APIC state from the hypervisor to the SVSM – not just the IRR, but the 
> ISR and TMR – so the future uses of the protocol can correctly apply 
> to any interrupts that are already in service.  This introduces 
> complexity that strikes me as unnecessary – or at least not compelling 
> enough to be worth it – given that once Alternate Injection is 
> disabled, the security state of the guest has regressed and the 
> absolute promise of “no host interference” no longer applies.  Once 
> that promise is gone – i.e., once the guest accepts that it can be 
> placed into a vulnerable posture – it’s not clear to me why it’s 
> compelling to return to a more roust posture.  I would suggest 
> proceeding without this capability, and if it becomes important, then 
> it can be added in a future version of the specification.
> 
>   * Minor clarification but I would say that this simply disables
>     Alternate Injection but doesn’t necessarily require the HV to
>     deliver events to the guest using direct event injection.  There
>     are other interrupt delivery mechanisms too (including Secure AVIC
>     as described in APM vol2).
> 
> This spec was drafted before Secure AVIC was documented in the APM.  I 
> take your point, though it may be more effective to accomplish the 
> clarity in the language that is ultimately incorporated into the SVSM 
> specficiation.
> 
> -Jon
> 
> *From:*Kaplan, David <David.Kaplan@amd.com <mailto:David.Kaplan@amd.com>>
> *Sent:* Thursday, May 23, 2024 10:06 AM
> *To:* Jon Lange <jlange@microsoft.com <mailto:jlange@microsoft.com>>; 
> amd-sev-snp@lists.suse.com <mailto:amd-sev-snp@lists.suse.com>; 
> svsm-devel@coconut-svsm.dev <mailto:svsm-devel@coconut-svsm.dev>
> *Subject:* [EXTERNAL] RE: RFC: Alternate Injection SVSM support
> 
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Thanks Jon for writing and sharing this!  I have a few 
> questions/comments on the spec:
> 
> /p.1: “SVSM involvement is required to present interrupts to the guest 
> OS, so when a guest OS interrupt/
> 
> /becomes deliverable, it is necessary to cause the SVSM to run”/
> 
> I was a bit confused by this wording (and worry others may be too).  
> With the Alternate Injection feature, the SVSM may “queue” interrupts 
> for the guest OS, but the HW is actually what “delivers” the interrupt 
> (meaning vectoring to the handler through the IDT).  Additionally, the 
> term “becomes deliverable” here may not be clear.  I believe your 
> intention is that when the HV decides to deliver a guest OS interrupt, 
> it must cause the SVSM to run.  However when a previously sent 
> interrupt that was pending (say because RFLAGS.IF=0 in the guest) 
> becomes deliverable because the guest did STI, that does **not** cause 
> the SVSM to run.  So I’d suggest perhaps rephrasing this to clarify 
> this a bit more.
> 
> /p.2: “The hypervisor is expected to cause the SVSM to run any time 
> delivery of an/
> 
> /interrupt would result in injection of #HV to the SVSM.”/
> 
> This is just basic Restricted Injection behavior I believe…in order to 
> send an interrupt to the SVSM the HV must inject a #HV into the SVSM 
> and then run it.  I don’t think any of that changes with this 
> Alternate Injection spec (right?)
> 
> /p.2: “Whenever the hypervisor delivers an interrupt for a lower VMPL 
> (or an event, such as a request to/
> 
> /revert to host-managed APIC emulation), it will set the appropriate 
> interrupt bit(s) in the extended/
> 
> /interrupt descriptor corresponding to the lower VMPL, and it will 
> also set bit 1, 2, or 3 in the second/
> 
> /16-bit word of the SVSM’s extended interrupt descriptor to indicate 
> which VMPL has pending/
> 
> /interrupt evaluation work.”/
> 
> Shouldn’t this be bits 8, 9, or 10?
> 
> p.3 extended interrupt descriptor
> 
> I would suggest considering defining names for each of these fields, 
> and including a table showing the overall layout.  The spec currently 
> refers to fields exclusively by bit position, which I personally found 
> a bit hard to parse.  For instance, if bits 7:0 were named 
> “SINGLE_VEC” (or whatever you’d like), then later in the section you 
> could refer to that instead of referring to bits 7:0.
> 
> /p.4: If the SVSM does know that the first component to execute will 
> support the SVSM APIC Protocol, then/
> 
> /it may enable Alternate Injection prior to the first guest entry;/
> 
> The statement about the SVSM having to know if the first component 
> supports Alternate Injection is for security, correct?  That is, if 
> the guest wants interrupt security then it’ll want Alternate Injection 
> enabled from the beginning.  If that’s the case, then the SVSM 
> **must** enable Alternate Injection prior to the first guest entry 
> (not “may”) true?
> 
> p.5 (Enabled/Locked/Disabled) state machine
> 
> I found this a bit confusing (at a minimum I’d politely request a 
> diagram showing state transitions).  Usually “Locked” means you can’t 
> change, but in this case, the Disabled state seems to be more locked 
> than the Locked state.
> 
> I had to read the part about the flows several times to understand 
> it.  I think I get it now, but I am concerned about the fact that once 
> Disabled, Alternate Injection can’t be re-enabled.  Is that really 
> required?  For instance, what if we’re running a guest OS that doesn’t 
> understand alternate injection and then we kexec into a kernel that does.
> 
> Another idea to consider: What if you had a counter that increments 
> when someone requested Alternate Injection and decremented when they 
> asked to disable it.  And the feature is enabled when the counter is > 
> 0.  I think that would also solve your problem of guest FW not knowing 
> if the guest OS will want the feature or not.
> 
> For example: SVSM knows guest FW supports AlternateInjection so it 
> starts the counter at 1.  The guest OS also supports it so it asks for 
> it to be enabled raising the counter to 2.  Then guest FW disables 
> Alternate Injection in ExitBootServices, decrementing the counter back 
> to 1 so it stays enabled.
> 
> /p. 5: “Consequently, the SVSM must be designed so that once it passes 
> the point where/
> 
> /it commits to entering the lower VMPL, any delivery of #HV that 
> indicates interrupt delivery to the/
> 
> /lower VMPL will cause it to cancel the VMGEXIT that would cause a 
> return to the lower VMPL, so/
> 
> /that it can process the interrupt that has been signaled.”/
> 
> This probably a bit unrelated to the spec itself as this is really 
> about the internal implementation of the SVSM.  But I think the 
> important point is that the SVSM may be running (for whatever reason), 
> the HV can send it a #HV, and then when the SVSM requests a VMPL 
> change the HV should assume that the SVSM has processed the 
> information from the #HV.
> 
> p.6 Disable Alternate Injection
> 
> Minor clarification but I would say that this simply disables 
> Alternate Injection but doesn’t necessarily require the HV to deliver 
> events to the guest using direct event injection.  There are other 
> interrupt delivery mechanisms too (including Secure AVIC as described 
> in APM vol2).  So I’d perhaps suggest just saying that the HV has to 
> deliver any events through other means, not necessarily direct event 
> injection.
> 
> I think that’s all I saw for now, the actual protocol itself seemed to 
> make sense, but I’m guessing others may have feedback there.  And 
> again, really appreciate the work on putting this together!
> 
> Thanks –David Kaplan
> 
> *From:*AMD-SEV-SNP 
> <amd-sev-snp-bounces+david.kaplan=amd.com@lists.suse.com 
> <mailto:amd-sev-snp-bounces+david.kaplan=amd.com@lists.suse.com>> *On 
> Behalf Of *Jon Lange
> *Sent:* Thursday, May 16, 2024 11:40 PM
> *To:* amd-sev-snp@lists.suse.com <mailto:amd-sev-snp@lists.suse.com>; 
> svsm-devel@coconut-svsm.dev <mailto:svsm-devel@coconut-svsm.dev>
> *Subject:* RFC: Alternate Injection SVSM support
> 
> 	
> 
> *Caution:*This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> Attached is a specification I am proposing to handle support for 
> Alternate Injection in SNP guests through the use of an SVSM.  This 
> document proposes changes to the AMD GHCB specification and to the AMD 
> SVSM specification to enable the negotiation required to make 
> Alternate Injection work correctly.
> 
> Support for this protocol will not be possible in KVM until KVM is 
> able to include native support for multiple VMPLs with separate 
> interrupt sources for each.  That work is underway elsewhere, and my 
> expectation is that this proposed specification will align with the 
> capabilities that KVM will be introducing as part of the multi-VMPL 
> support.
> 
> I will be submitting changes to COCONUT-SVSM to implement this 
> protocol.  I welcome all feedback to the spec, and will update the 
> code to match whatever spec changes are agreed upon.
> 
> -Jon
> 
> 

-- 
Carlos López
Security Engineer
SUSE Software Solutions
