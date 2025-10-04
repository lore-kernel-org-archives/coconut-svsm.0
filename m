Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D431E2834
	for <coconut-svsm@lists.linux.dev>; Sat,  4 Oct 2025 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759576781; cv=none; b=g6BsFRQqC0LuhDLNGEmf6kiUMals6afdPbfjOHPGTrA5WXKBJQMxzLCMb+ft5Z7dFcoSrrv6K4Tz9R02YKDSfG5EVH8pchqlWzKq4s2/9f4/M8yiYBMecib6FxUnCgaMdrZC5YU+nSyD98lN/K9IBNVZq12JrHMOss5GtGVDXwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759576781; c=relaxed/simple;
	bh=Hkj+kHrByMjgvX24xgSn41xHW2ARhQn1MGNjIACeu2c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZWm25wL6bnb7KEq27dpdPxj4m8hcIs49Uqx5UPIQ7mGzzra4autIcs1gMRxx5U7N/DMiJJQ5q5IbvVXiReek6qhaw1bRAR6ZAODKg8npyhzWZ7vgDYP8/OjtizQyJm+mb+K4BB4CDZC0hClvUuAstT3ICRaIyCymdU5lPRX959Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XiK8Gt+f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WytkRI06; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XiK8Gt+f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WytkRI06; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XiK8Gt+f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WytkRI06";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XiK8Gt+f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WytkRI06"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 711A821DD1;
	Sat,  4 Oct 2025 11:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759576770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSejlmI7K9PSgpBuff6QeP1uc0AzIKYXYCxedt+UTJ8=;
	b=XiK8Gt+fqN2G8gDnx4r7gPjqnHaaKZR6bt6fJBhz8f9BseF389Pi5xY9gZkwKOBWwxIRtp
	mwVN/EJ9YQdgSHblry9K2Z9GIvleXCqjgW5ITygievH0A1XYVJLdOU/0BAca7sGV/uIfGg
	+xiAF82c2S+9wcS005c+bgMOkuMHsxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759576770;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSejlmI7K9PSgpBuff6QeP1uc0AzIKYXYCxedt+UTJ8=;
	b=WytkRI064UyIxgrpTZ8d2kz2EOHVp7CSdGtqPQXMj+pPlesMown+uT6vh7cxlneELpSsZO
	QwEiJ0IVydCHRaAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XiK8Gt+f;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WytkRI06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759576770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSejlmI7K9PSgpBuff6QeP1uc0AzIKYXYCxedt+UTJ8=;
	b=XiK8Gt+fqN2G8gDnx4r7gPjqnHaaKZR6bt6fJBhz8f9BseF389Pi5xY9gZkwKOBWwxIRtp
	mwVN/EJ9YQdgSHblry9K2Z9GIvleXCqjgW5ITygievH0A1XYVJLdOU/0BAca7sGV/uIfGg
	+xiAF82c2S+9wcS005c+bgMOkuMHsxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759576770;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSejlmI7K9PSgpBuff6QeP1uc0AzIKYXYCxedt+UTJ8=;
	b=WytkRI064UyIxgrpTZ8d2kz2EOHVp7CSdGtqPQXMj+pPlesMown+uT6vh7cxlneELpSsZO
	QwEiJ0IVydCHRaAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 185FC1366F;
	Sat,  4 Oct 2025 11:19:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CuvVA8IC4WjqEQAAD6G6ig
	(envelope-from <nstange@suse.de>); Sat, 04 Oct 2025 11:19:30 +0000
From: Nicolai Stange <nstange@suse.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: coconut-svsm@lists.linux.dev,  "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>,  Jon Lange <jlange@microsoft.com>,
  "kraxel@redhat.com" <kraxel@redhat.com>,  "Relph, Richard"
 <Richard.Relph@amd.com>,  "Rodel, Jorg" <Joerg.Roedel@amd.com>,  Melody
 Wang <huibo.wang@amd.com>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, Nicolai Stange <nstange@suse.de>
Subject: Re: SVSM draft specification (v1.01 draft #3)
In-Reply-To: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com> (Tom Lendacky's
	message of "Fri, 3 Oct 2025 11:01:38 -0500")
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com>
Date: Sat, 04 Oct 2025 13:19:29 +0200
Message-ID: <87bjmmj4n2.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 711A821DD1
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	INVALID_MSGID(1.70)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.31

Hi Tom,

Tom Lendacky <thomas.lendacky@amd.com> writes:

> Attached is the next version of the draft SVSM specification with the
> following changes since the previous version:
>
>   - APIC emulation protocol added
>     - Coconut-SVSM will need to be audited, as the current APIC emulation
>       code does not completely match the "Alternate Injection Support"
>       specification on which this protocol is based.
>   - Reboot protocol added

there's an ongoing discussion at GH ([1]) on how a reboot should
interact with the _TPM_Init (think an emulated TPM power cycle) and that
should probably get resolved before making the spec update effective.

I'm trying my best to summarize the problem in what follows, James
(CCed) might have some additional input.

So, naively, a cold reset of the firmware, which qualifies as a reset of
what's called the "Root of Trust for Measurement" (RTM) in TCG
terminology, would require a reset of the TPM, i.e. to make it enter the
_TPM_Init state, c.f. the TCG TPM 2.0 Library v184, part 1
("Architecture"), sec. 10.2.2 ("Initialization State"). Quote: "It
should not be possible to reset the TPM without resetting the RTM. It
should not be possible to reset the RTM without resetting the TPM."

In particular, a reset of the TPM causes a reinitialization of all PCRs
to their respective default values as defined in the platform profile
(constant all-zeroes or all-ones in most cases).

At the current stage of the SVSM development, that's fine and could
easily get implemented.

However, James remarked in the course of the linked GH discussion that
establishing such semantics now would prohibit us from letting the SVSM
measure dynamic parts + configuration of itself into the TPM PCRs in the
future. IIUC, the idea is to record standard TCG events capturing the
dynamic aspects of the SVSM into the firmware's PCR-measured eventlog
(for the firmware event log c.f. [2], EFI_TCG2_PROTOCOL.GetEventLog),
which is quite appealing, because it would integrate transparently with
existing workflows and tools like `tpm2_eventlog` etc..

So assuming we do not want to preclude the implementation of something
like that in the future, the question is how to define interactions with
the new `SVSM_REBOOT_EXECUTE` protocol command.

From a high-level, AFAICT, we probably would have to
a.) Convey all or a subsequence of the eventlog to the relaunched
    firmware. If a subsequence, then that would have to contain all TCG
    event records relevant to the SVSM's self-measurements.
b.) Either do a "partial" TPM reset, making it to re-enter _TPM_Init,
    but keep some subset of PCRs (*) at their current values in case the
    full event log is conveyed, or do a full TPM reset and issue initial
    PCR extends from the SVSM corresponding to the to be conveyed log in
    case of a proper subsequence.

The "relevant log subsequence" option is technically feasible in theory,
but would require the SVSM to keep a log of its own events for the
replay at firmware relaunch. James, who entered the GH discussion with a
suggestion to hand the full log over with some mechanism resembling the
one from Linux kexec warm reboots, later on mentioned some drawbacks
with the approach of having the SVSM replay an internally stored log at
firmware relaunch, please refer to [1] for details.

I myself don't have an opinion on the topic, but as a hand-over
mechanism for the TCG event log would likely require support from the
newly proposed `SVSM_REBOOT_EXECUTE` command, I wanted to make you aware
of the pending discussion.

Thanks!

Nicolai

[1] https://github.com/coconut-svsm/svsm/pull/808#issuecomment-3361113788
[2] https://trustedcomputinggroup.org/resource/tcg-efi-protocol-specificati=
on/

(*) Which one is not clear to me yet -- the obvious candidate is PCR[0]
    and possibly some more, but there might be interactions with the
    H-CRTM semantics, which require to initialize the PCR[0] differently
    depending on whether the firmware issued a H-CRTM measurement
    sequence before invoking TPM2_Startup() or not, c.f. TCG TPM 2.0
    Library v184, part 1, ("Architecture"), sec. 32.3 ("H-CRTM before
    TPM2_Startup() and TPM2_Startup() without H-CRTM").

> Please review. If there are no or only minor comments, this draft will
> become the next version of the specification.

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)
