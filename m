Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02264307491
	for <coconut-svsm@lists.linux.dev>; Tue, 14 Oct 2025 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760475371; cv=none; b=r+uxRCErpB9+qx1v4HJgVPlMyAk6zIWpDH4fRcaNdBNO/OxddP4mrS2To/zPO5Ocm91FqAIug8cWl34f3gaWFtv22CGTP5PTvGoahQMgvHTN2m5j0I+vAop+F3HQkF2nJ6NOaQUnfcAabmw4NMHsL64DcWgRIIOG12EYnpt2Xus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760475371; c=relaxed/simple;
	bh=nVZfVI97rTGwDX3i+Q+pQf+3OrodOBTqjpYk5ushBxA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NdJXxg7GdddOUcpQYSvtu4ITkJfNoo+L2KeCp6L5WWuuD5oN2+4BsbRT4ESYTtZEUrDRP9+nKPKUt/CoNpytRiMAGDyjys7DaSkmTpjp1nrhOaKvii4weeETWDua0oBb1a/eftluhR5ASuym2IkgbaT9Nk2VWq1E1DF66OYqHK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s0KXPLQw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s9UnIxMs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pndh1uIP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=007ofu3j; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s0KXPLQw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s9UnIxMs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pndh1uIP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="007ofu3j"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0A3B61FB88;
	Tue, 14 Oct 2025 20:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760475365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gv68YyYEPDcIAsNdMbkIuC7E+WVZQoDRApqGZ3KT4d4=;
	b=s0KXPLQweO/HsSHWnbKT5VjMSmiHqE0jo7ccj1xgjDKKo0kgRRc+k8SjoyTCzyZT6xDWgd
	dUYq+POsK6d5E8rX9fOuzLz2EPbZagON6pHaoD00Hp/AkWXVCNfO0+WXCg7/tRrnn16m0F
	pSGTOEHytwx+Fk3ExrrPUtRhGJ8/rjg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760475365;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gv68YyYEPDcIAsNdMbkIuC7E+WVZQoDRApqGZ3KT4d4=;
	b=s9UnIxMsIquzYZHTrBvHP0V1rxWbnF0r7ydHYduNJS/JJNC4GiZOFLZgA+eRc/C8ZwOPKX
	eUoZMPZeUgISF9Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760475364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gv68YyYEPDcIAsNdMbkIuC7E+WVZQoDRApqGZ3KT4d4=;
	b=pndh1uIPtJGZr6vxC6hSDTdLZ/vzhX9CDHterdZ6CLy99abfQssDh3H4vlWKuvRO9xp9xD
	ntZ/YxLMfJyun+kq6MnTQI5ynRZhES60c1FISTBdZwpAnkLZixOapUWW0/sAnOu42EXEdj
	YTkhgkk416EXKlo2dlblBfAyWaPP6zI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760475364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gv68YyYEPDcIAsNdMbkIuC7E+WVZQoDRApqGZ3KT4d4=;
	b=007ofu3jtdBGXSkm25tLvgsEqdA1KsR6ngJCiXxzIAkOpIhzaccPkW7yK5lyDN4bY5TI5T
	Qzt5mMngZGiKoGCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA90F13A44;
	Tue, 14 Oct 2025 20:56:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 38TZL+O47mhibgAAD6G6ig
	(envelope-from <nstange@suse.de>); Tue, 14 Oct 2025 20:56:03 +0000
From: Nicolai Stange <nstange@suse.de>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Nicolai Stange <nstange@suse.de>,  Tyler Fanelli <tfanelli@redhat.com>,
  Oliver Steffen <osteffen@redhat.com>,  Stefano Garzarella
 <sgarzare@redhat.com>,  coconut-svsm@lists.linux.dev
Subject: Re: [DISCUSSION] svsm: attestation: if and how to authenticate the
 provided secret
In-Reply-To: <a6188e4c2eb11ac6fef4eab605666d15c3f604c4.camel@HansenPartnership.com>
	(James Bottomley's message of "Tue, 14 Oct 2025 15:23:51 -0400")
References: <a6188e4c2eb11ac6fef4eab605666d15c3f604c4.camel@HansenPartnership.com>
Date: Tue, 14 Oct 2025 22:56:03 +0200
Message-ID: <87o6q96w4c.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	INVALID_MSGID(1.70)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.10
X-Spam-Level: 

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> On Tue, 2025-10-14 at 10:45 +0200, Nicolai Stange wrote:
>>
>> as I don't want to hijack Tyler's recent attestation PR, I'd like to
>> continue a discussion started there and best summarized in the
>> comment at [1] here.
>>=20
>> The question is whether or not to have the KBS authenticate the
>> secret returned to the SVSM upon a successful attestation.
>>=20
>> The current state is that authenticated encryption is being used in
>> the protocol (AES-KW + AES-GCM), but that's only bound to an
>> ephemeral ECDH key, hence doesn't link to any root of trust.
>
> Could we wind back a bit?  This discussion seems to be starting in the
> middle.  Where does the encrypted state actually come from?

Sorry for being unclear -- this is one of the open questions, see below.


> The threat being that if an attacker can supply the TPM state to your
> confidential VM, they know all the TPM parameters, including the
> private keys, and can fake any attestation.   In the non-CVM world, the
> state is usually part of the VM image (encrypted), but this happens
> because the TPM is running outside the VM envelope and suspend or
> shutdown can pull the encrypted state as part of the device state of
> the VM image.  In the CVM world the state is stored inside CVM in the
> SVSM and has to be inaccessible to the guest.  It is possible for the
> SVSM to encrypt the TPM state and pass it to the guest which then saves
> it in the VM image.  In that case, proof of correctness can simply be
> supplying a key capable of decrypting the image.

The current plan is to not involve the guest at all. Instead
- a (small) block device will get attached to the SVSM, via virtio
  currently,
- there will be a filesystem on that block device, which is encrypted +
  authenticated with a (symmetric) "filesystem root key" known only to
  the SVSM and
- that filesystem root key will get revealed by the KBS to the SVSM upon
  successful attestation.

The TPM state will be stored in a file on that filesystem. UEFI data in
another and so on.

For more context, there's a SVSM-PR from myself pending to use the
"CocoonFs" format specifically designed for this purpose, c.f. [1], or
[2] on the format itself. More FS formats may get introduced to the SVSM
in the future in case there's a demand.

Where the filesystem gets formatted and the TPM (, UEFI, ...) state
stored thereon manufactured respectively is subject of the discussion
here, I think. That is, AFAICS it depends on whether and how the
filesystem root key obtained from the KBS can get authenticated.

FTR, I'm trying to make a point for formatting and manufacturing
everything from within the SVSM upon first use, and to bind the received
filesystem root key to an ECDSA key associated with the KBS, via:
- KBS signs its ephemeral ECDH public key with that ECDSA key,
- the shared key from ECDH is used for authenticated encryption of
  the secret, which includes the filesystem root key.

That on its own is quite useless of course (unless the expected KBS
ECDSA key would somehow get embedded into e.g. the IGVM), but the SVSM
could then subsequently present the KBS ECDSA key to relying parties, as
a confirmation that it's using a filesystem root key supplied by that
particular KBS.

Thanks!

Nicolai

[1] https://github.com/coconut-svsm/svsm/pull/806
[2] https://coconut-svsm.github.io/cocoon-tpm/cocoonfs/cocoonfs-format.html

>
> However, in a container (or immutable VM) world, there's no image
> update to save and the TPM state has to be saved somewhere separately
> (and at a location under the control of untrusted entities) so there
> has to be a strong binding between the encrypted TPM state and the CVM
> to prevent a state substitution attack (i.e. the CVM has to validate
> it's pulling the correct TPM state before using it).
>
> Regards,
>
> James
>

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)
