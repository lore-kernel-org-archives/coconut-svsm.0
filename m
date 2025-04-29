Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D582B211C
	for <coconut-svsm@lists.linux.dev>; Tue, 29 Apr 2025 22:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966767; cv=none; b=KGP2DFNC7yo16d3FY/8aYMp04+IdqQrEYH0kOgWW/f90RO3SIesuQ0BvChpgrXMCjrFoXXgcdxjR4P0FukocJh3wuzRACuWqOdBDUL3ojnbKf74P9JX0XA0aAdiN/hjWGVBcaGoBFpIaicf3YiI8Gba592ssDL+h7RoFAr/LwBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966767; c=relaxed/simple;
	bh=yzTzkxUd9S7MXV/eaDWFOVSGMJ117IR4F2XYdTMCSiI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UKy6Nmpz/snpCfOqLmhFmUuCbwBRHJ+krWmc8gtU+1/1NBu5VO3uuM1Nnfq+5WoeOM1y/WIRERuEoPZRHK0vs+w77bciOJ5suyUUCsfe8Onc6tlcy6Cwpi4vIp28qGdpsa62HVSaSwamkxBQ0/9hJ3/9COF1u8LkYP8/EazcVfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Eg49uFKv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CWBd0X/+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Eg49uFKv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CWBd0X/+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Eg49uFKv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CWBd0X/+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Eg49uFKv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CWBd0X/+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 951191F453;
	Tue, 29 Apr 2025 22:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745966762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VkCyknv2Npjst/mNhVRGNlvmLpk2wfPMOveT0cm7Nbg=;
	b=Eg49uFKvUkZ7YE43z6RGYfGbImjGod5fn7nMWnq3CZeig4eFF+i5WaWAR/9xPd2hHxK3q4
	aiIpgWCJmgFcUSizrjy6/OVUh30cx0XKaNCY7qxoZPsx5vKXwWeYn1dVKd7MwEfH9ciwKp
	2VRB2NLaHZ6Z7qm6+e2Cig8x52bYzRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745966762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VkCyknv2Npjst/mNhVRGNlvmLpk2wfPMOveT0cm7Nbg=;
	b=CWBd0X/+4T12EySegBGgI68Ve7fH0netGWC0We+CEdEy23FGwHWGAwJHMGrpZ8yO0sZiEh
	5SBMdJMSR014FbBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745966762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VkCyknv2Npjst/mNhVRGNlvmLpk2wfPMOveT0cm7Nbg=;
	b=Eg49uFKvUkZ7YE43z6RGYfGbImjGod5fn7nMWnq3CZeig4eFF+i5WaWAR/9xPd2hHxK3q4
	aiIpgWCJmgFcUSizrjy6/OVUh30cx0XKaNCY7qxoZPsx5vKXwWeYn1dVKd7MwEfH9ciwKp
	2VRB2NLaHZ6Z7qm6+e2Cig8x52bYzRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745966762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VkCyknv2Npjst/mNhVRGNlvmLpk2wfPMOveT0cm7Nbg=;
	b=CWBd0X/+4T12EySegBGgI68Ve7fH0netGWC0We+CEdEy23FGwHWGAwJHMGrpZ8yO0sZiEh
	5SBMdJMSR014FbBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CC6B13931;
	Tue, 29 Apr 2025 22:46:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 58IqGapWEWiqdwAAD6G6ig
	(envelope-from <nstange@suse.de>); Tue, 29 Apr 2025 22:46:02 +0000
From: Nicolai Stange <nstange@suse.de>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Nicolai Stange <nstange@suse.de>,  coconut-svsm@lists.linux.dev,  Tyler
 Fanelli <tfanelli@redhat.com>
Subject: Re: ECC keygen for PR #528 ("Attestation driver and proxy")
In-Reply-To: <CAGxU2F5aM_GXbcbOocrwpsGS4H+1i7O9xM4MhKrx8ycGOgah=w@mail.gmail.com>
	(Stefano Garzarella's message of "Thu, 17 Apr 2025 16:27:00 +0200")
References: <25558.125041610080302253@us-mta-166.us.mimecast.lan>
	<CAGxU2F5aM_GXbcbOocrwpsGS4H+1i7O9xM4MhKrx8ycGOgah=w@mail.gmail.com>
Date: Wed, 30 Apr 2025 00:46:01 +0200
Message-ID: <87msbylh7a.fsf@>
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
X-Spamd-Result: default: False [-2.10 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	INVALID_MSGID(1.70)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -2.10
X-Spam-Flag: NO

Hi Stefano,

Stefano Garzarella <sgarzare@redhat.com> writes:

> On Wed, 16 Apr 2025 at 16:08, Nicolai Stange <nstange@suse.de> wrote:
>>
>> I managed to carve out and cleanup the first batch ([1]) from my work on
>> an encrypted FS by now. The FS cleanup itself is still WIP, but the
>> crypto parts should be in a usable state.
>>
>> As mentioned on last week's svsm-devel call, it might help with
>> addressing those stack size related issues with ECC keygen in the
>> context of PR #528 ([2]).
>>
>> I prepared some example code for generating an ECC key with NIST P-521,
>> to be found at [3].
>>
>> From some lax experiments in userspace, peak stack usage is at about 2.3=
kB.
>> (Which is still way above what I would have expected, given that no
>>  buffers are stored on the stack. I'm currently investigating that).
>>
>> I'm not sure whether merely generating the key is all you need -- FWIW
>> there's also support for ecdh, ecdsa and ecschnorr, in case you're
>> wondering. I'd be happy to come up with some example code for these as
>> well.
>>
>> Please let me know if you have any questions, either here or in today's
>> call.
>
> Cool, thanks for the example code, I guess this can unlock for now
> Tyler's PR and FS support, but as we discussed yesterday in the
> community call, the long term plan is to use OpenSSL/BoringSSL. I'll
> open an issue ASAP to track that work, and I'll start to investigate
> it.

I've implemented a BoringSSL FFI backend as a configurable alternative
to the cocoon-tpm-crypto now (example code is updated accodingly), and
did a POC integration into SVSM, c.f. [4]. Good news is it still boots :)

Thanks,

Nicolai

[4] https://github.com/nicstange/svsm/tree/cocoon-tpm-crypto-integration-poc

>>
>> [1] https://github.com/nicstange/cocoon-tpm
>> [2] https://github.com/coconut-svsm/svsm/pull/528
>> [3] https://github.com/nicstange/cocoon-tpm-crypto-ec-key-gen-demo
>>

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)
