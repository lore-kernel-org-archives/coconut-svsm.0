Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 6B9301C2BD0
 for <svsm-devel@coconut-svsm.dev>; Wed, 15 May 2024 14:14:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715775297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTxzMr0zQE3hoCWB2x/WiqIeGB5Ksok1gaCJysunHMg=;
 b=uzFVlOXcwGuJjCXcGP53OnW7ZpE6NP9vI7zRWuSXcXYwSnqHM11MBYExm0rGjq0ABQ4O8F
 bKz1NQd1+av0bd4E4+RwO71LeGJlcoao0GmXNa6MLRyyVKxt29i2EZcucfJKmHazniewuG
 GG5w0q92inft/yjLtmY4DXy+gsk6w4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715775297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTxzMr0zQE3hoCWB2x/WiqIeGB5Ksok1gaCJysunHMg=;
 b=LWP+K8WGUJAUBBvVYcTllblsf3CiN58eh0Bb+aThVtoGZFz0kb8Vm71ncTUiC8Y3/3TmE0
 qWhl13FMdtJGV8AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715775296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTxzMr0zQE3hoCWB2x/WiqIeGB5Ksok1gaCJysunHMg=;
 b=y0Zqk+4V2rVBXgqtYpkTztBgZM16ghWgAlkF82Bs2mrAkL0GYwymOUtkGgYSOnZdu9977w
 keptw8Jzns3yaC/pgbzhnxD2y6SbpMSWwdQBU4iAXGV6kxLg5HbhDkFj86GXzr/e1YYyfo
 qGOitqDuiEAlvCAKu20MuYHj85CQIro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715775296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTxzMr0zQE3hoCWB2x/WiqIeGB5Ksok1gaCJysunHMg=;
 b=bIACKjO5yMcaHanmWUQ7Lg6OiqW4Xwg3hiMD3OTCXGYvT8iqu+tJpUCfDFKMeu7xZ8+jUZ
 nGIFUvNXZrfaqtAg==
Date: Wed, 15 May 2024 14:14:55 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZkSnP5-FbaApB1Av@suse.de>
References: <Zj30Nqq3OS58DwpP@8bytes.org> <ZkMpkfepqUWfq1RY@8bytes.org>
 <DM8PR11MB57503B95AFE00B2BC99B3F88E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM8PR11MB57503B95AFE00B2BC99B3F88E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
Subject: Re: [svsm-devel] Development Plan Document
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>

Hi Elena,

Thanks for reviewing the document and your feedback. Please see my
comments below.

On Wed, May 15, 2024 at 10:20:15AM +0000, Reshetova, Elena wrote:
> 1. I was surprised to see a Service VM mode (page 4), because I haven’t
> realized this is being considered for Coconut-svsm. Is there more information
> on the use cases behind this? I can image these usecases myself, but would
> be great to know the ones you are targeting.

For the Service VM Mode there are no specific use-cases yet, but I think
this will change in the coming months. The mode is listed for
completeness, the main purpose is to not rule out scenarios where
COCONUT runs on hardware without support for partitioning/privilege
levels and isolation needs to be achieved through VM boundaries.

It of course adds more complexity because in those scenarios there needs
to be stronger attestation and encrypted communication between the guest
OSes and the COCONUT service VM.

> 2. Section 9. Cryptography support. The requirement on the isolation
> is somewhat confusing. It reads like the keys or cryptographic assets would
> never leave the border of the cryptographic module (even in the 
> encrypted form?), which I am not sure the requirement applicable for all
> usecases. I think it would be better for the start to define the *purpose*
> of the cryptographic layer in coconut-svsm: is it just a set of securely implemented
> algorithms to be exposed for user-space or/and kernel processes to perform needed
> cryptographic functions (like we have crypto API in Linux) or a real cryptographic
> service is envisioned that would be managing the keys and exposing
> crypto services based on these keys? If latter, such service scope needs to be
> defined/specified.

The question targeted with the above point is the one about the
execution context of crypto code. There are two options on the table:

	1) Execute it in the same address space like the calling
	   context.

	2) Implement address space separation to make sure the calling
	   context and the crypto context can not interfer with each other.

I think there are good points for both solutions and I am not bound to
any yet. Also it is probably too early to make a decision. As you
also wrote it would be helpful to have a better understanding of the
crypto requirements across services offered by the SVSM. With the
learnings from that a better decision can be made.

> 3. "Implement or port a cryptography library to Coconut-SVSM... ". 
> This is going to be tricky to get right, especially given the future aim for FIPS
> certification. Implementing crypto functions from scratch correctly
> is pretty difficult, so typically we tend to rely on existing libraries that have
> been verified to provide adequate implementation. I would suggest here to
> build a list of crypto algorithms that is envisioned to be needed (smaller list
> is better and preferably taking post-quantum requirements in account) and based
> on this (and other requirements) make a selection. Even well-known rust
> libraries like ring last time we checked didn’t do things like proper key zerozation, etc. 
> Also, any crypto solution would need a secure cryptographic RNG which is
> going to be a separate problem of its own unless everyone agrees that we can
> directly use x86 platform provided RNGs or use their input to seed a
> cryptographic CPRNG (Linux uses ChaCha but with FIPS certification in mind
> the methods defined in NIST SP 800-90A/B/C should be considered instead).

tl;dr: When a FIPS-certifiable Rust-based crypto lib is available I
       happily make use of that in the COCONUT-SVSM code base. Until
       that happens I am also fine with a C-based one.

Longer answer:

This point targets a FIPS-certifiable crypto library in Rust, which is
something I like to see happening so that COCONUT-SVSM can use it. I
know it is likely a very long way to get there, but in my view that
should be the goal. I also do not necessarily see that as an effort that
needs to happen in the COCONUT project itself. Maybe us expressing the
desire for a FIPS-certifiable Rust crypto library motivates one of the
existing project to work towards that goal.

Having crypto implemented in Rust is also no blocker for other work, as
for the time being a proven C-based implementation can be used.

(Btw, it is not explicitly listed in the document, but I have the same
 opinion about the TPM implementation).

> 4. Section 12.1. User-mode security FW. I guess the aim here is to create 
> a Mandatory Access Control FW, right (based on the comment about SELinux)? 
> This seems to go together with section 10.4 for filesystem permission model
> unless there an additional Discretionary Access control is envisioned for that.

The user-mode security framework is an addition to the file-system
permission attributes. The reference to SELinux is probably wrong, I
envision it more like something comparable to seccomp.

The aim is to limit the syscall interface for services. The TPM service
for example has not need to modify guest OS state or memory.

> 5. Section 12.2: by double-validation you mean the case when a private page
> is added twice to the CVM (reaccept in TDX terms)?

Yes, the section is about mitigating attacks based on double validation
of pages. This is specific to AMD SEV-SNP, I think Intel TDX is not
affected by these attacks, but I have to double check. On AMD it is
possible that double validation gives the host multiple pages for the
same GPA which it can exchange at will without the guest noticing. The
only mitigation is to track the validation state of every page in the
SVSM.

> 6. section 8.1. Syscall interface. For TDX we had to be very careful
> on things like syscall entry and other critical places in Linux to make sure
> we cannot get a #VE event (probably the same for #VC for AMD?) in the
> middle of switching between the userspace and kernel state. TDX provides some
> controls to enable to protect from unwanted #VE which probably will be
> useful for coconut-svsm also as a security measure.

Yes, I like to learn more about these controls. Currently it is less
problematic because the COCONUT kernel only offers Int80 syscall entry,
but if we decide to switch to SYSCALL this becomes very relevant.

> 7. Section 8.2. The instruction decoder needs to be explicitly stress-tested/
> fuzzed. We are starting to look into this problem for Linux now since we
> might need to allow userspace MMIO decoding in the TDX code, so maybe
> we can reuse some of that work for this one here.

That would be great! Help on instruction decoder fuzzing and re-using
existing funzzing code is certainly appreciated.

> 8. One item I would add is that it would be good to document and check 
> that all relevant (non-dynamic and with potential security implication) inputs 
> from the host/VMM are measured by the Coconut-SVSM correctly
> into platform specific attestation registers. This closely relates to 10.1, but
> it is not about the higher level attestation service but about how coconut-svsm
> measures itself and its own assets. Ideally this should work with both vTPM
> service available and without.

I am not sure I fully understand the purpose, can you elaborate a bit on
what inputs we should taken into account for early attestation? Are you
thinking about ACPI tables and the memory map here?

> 9. I remember in past we discussed about ACPI tables passthrough via coconut
> -SVSM and generation in the Coconut-svsm. Should this also be listed for debate
> purpose as it has its own benefits and challenges?

Yes, that is missing, thanks. I will add a point for that to the
document.

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany
https://www.suse.com/

Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG Nürnberg)
