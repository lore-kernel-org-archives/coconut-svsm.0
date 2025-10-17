Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C5332EC2
	for <coconut-svsm@lists.linux.dev>; Fri, 17 Oct 2025 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760704225; cv=none; b=tPNhw75Szrbyn3jJXB+Qyn0kJ5VFvfF5rnf0wrXtBWbJwwejx8EFfe4nZ3OWwCbwRNdYqMGUN9+WtTL9twWN1hfrp+Z2xtPk9aFju4DLR/yH2RseeJjaByvaWCgBd8ptDr6KYFN4FKCXnown/Of4g94sdH4VIQfumgnNRMyJDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760704225; c=relaxed/simple;
	bh=O7z5q33q2LL0kYr/xuQY23Dn8hWG0fxJc2ToXAyZ7+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mFSfUPHABZu++o4ArkfYREzLlkecq8SbZg5666JTNcyf+1ERTjVmHwEvcjXW/7m1ajJhKcuT3ukotbROxK3+km2evYxLcFKHn5p+H6af/WgkcUz5Uk/WXngSInJd9qCvx544IQCRFe5Zj8tcmuX2NQB0j+S/zaqozRR6n4Jc5SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BGMv0kuL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+8x9y5uk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BGMv0kuL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+8x9y5uk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BGMv0kuL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+8x9y5uk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BGMv0kuL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+8x9y5uk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 494791FE4F;
	Fri, 17 Oct 2025 12:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760704221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YPHpzm83M6BV26Hi1KBv6R8QakIov0mDL8oq5xXTU4=;
	b=BGMv0kuLvcveFGxLez+lTNj/FkYQD6V5TF9Hn5SCrN4F6o4MOBc5Yw2z0AzwsMdIPAc2x9
	lvyOjAtenQR/8DpPNTU7IJwYCWDHuJzUSXNwFRgW10gFF0DkM3heCRYYvK6FZcjM3d5yDt
	BBxMwCv136b2vsl/tqdXFQqIADIvYao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760704221;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YPHpzm83M6BV26Hi1KBv6R8QakIov0mDL8oq5xXTU4=;
	b=+8x9y5ukCTjZT1nu1ZWMqhdcyUWgUMJ/VbYSUtAVR2VrxOjumOJIXSoazXQZC0m015J+Qu
	dhwgxVxO+NQwEeBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760704221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YPHpzm83M6BV26Hi1KBv6R8QakIov0mDL8oq5xXTU4=;
	b=BGMv0kuLvcveFGxLez+lTNj/FkYQD6V5TF9Hn5SCrN4F6o4MOBc5Yw2z0AzwsMdIPAc2x9
	lvyOjAtenQR/8DpPNTU7IJwYCWDHuJzUSXNwFRgW10gFF0DkM3heCRYYvK6FZcjM3d5yDt
	BBxMwCv136b2vsl/tqdXFQqIADIvYao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760704221;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YPHpzm83M6BV26Hi1KBv6R8QakIov0mDL8oq5xXTU4=;
	b=+8x9y5ukCTjZT1nu1ZWMqhdcyUWgUMJ/VbYSUtAVR2VrxOjumOJIXSoazXQZC0m015J+Qu
	dhwgxVxO+NQwEeBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 183F813A71;
	Fri, 17 Oct 2025 12:30:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7JCFBN028minYgAAD6G6ig
	(envelope-from <nstange@suse.de>); Fri, 17 Oct 2025 12:30:21 +0000
From: Nicolai Stange <nstange@suse.de>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Nicolai Stange <nstange@suse.de>,  Tyler Fanelli <tfanelli@redhat.com>,
  Oliver Steffen <osteffen@redhat.com>,  Stefano Garzarella
 <sgarzare@redhat.com>,  coconut-svsm@lists.linux.dev
Subject: Re: [DISCUSSION] svsm: attestation: if and how to authenticate the
 provided secret
In-Reply-To: <fe4fcbfeb22c26c8172960551d5721d2919a7004.camel@HansenPartnership.com>
	(James Bottomley's message of "Tue, 14 Oct 2025 17:40:07 -0400")
References: <a6188e4c2eb11ac6fef4eab605666d15c3f604c4.camel@HansenPartnership.com>
	<fe4fcbfeb22c26c8172960551d5721d2919a7004.camel@HansenPartnership.com>
Date: Fri, 17 Oct 2025 14:30:20 +0200
Message-ID: <87tszxvhgj.fsf@>
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
	BAYES_HAM(-3.00)[100.00%];
	INVALID_MSGID(1.70)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Flag: NO
X-Spam-Score: -2.10

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> On Tue, 2025-10-14 at 22:56 +0200, Nicolai Stange wrote:
>> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
>>=20
>> > On Tue, 2025-10-14 at 10:45 +0200, Nicolai Stange wrote:
>> > >=20
>> > > as I don't want to hijack Tyler's recent attestation PR, I'd like
>> > > to continue a discussion started there and best summarized in the
>> > > comment at [1] here.
>> > >=20
>> > > The question is whether or not to have the KBS authenticate the
>> > > secret returned to the SVSM upon a successful attestation.
>> > >=20
>> > > The current state is that authenticated encryption is being used
>> > > in the protocol (AES-KW + AES-GCM), but that's only bound to an
>> > > ephemeral ECDH key, hence doesn't link to any root of trust.
>> >=20
>> > Could we wind back a bit?=C2=A0 This discussion seems to be starting in
>> > the middle.=C2=A0 Where does the encrypted state actually come from?
>>=20
>> Sorry for being unclear -- this is one of the open questions, see
>> below.
>>=20
>>=20
>> > The threat being that if an attacker can supply the TPM state to
>> > your confidential VM, they know all the TPM parameters, including
>> > the private keys, and can fake any attestation.=C2=A0=C2=A0 In the non=
-CVM
>> > world, the state is usually part of the VM image (encrypted), but
>> > this happens because the TPM is running outside the VM envelope and
>> > suspend or shutdown can pull the encrypted state as part of the
>> > device state of the VM image.=C2=A0 In the CVM world the state is stor=
ed
>> > inside CVM in the SVSM and has to be inaccessible to the guest.=C2=A0 =
It
>> > is possible for the SVSM to encrypt the TPM state and pass it to
>> > the guest which then saves it in the VM image.=C2=A0 In that case, pro=
of
>> > of correctness can simply be supplying a key capable of decrypting
>> > the image.
>>=20
>> The current plan is to not involve the guest at all. Instead
>> - a (small) block device will get attached to the SVSM, via virtio
>> =C2=A0 currently,
>> - there will be a filesystem on that block device, which is encrypted
>> + authenticated with a (symmetric) "filesystem root key" known only
>> to the SVSM and
>> - that filesystem root key will get revealed by the KBS to the SVSM
>> upon
>> =C2=A0 successful attestation.
>>=20
>> The TPM state will be stored in a file on that filesystem. UEFI data
>> in another and so on.
>
> On this, how does the guest know it's pulled in the correct image?  If
> I were a malicious host, I could encrypt my own TPM image, accept your
> attestation to a KBS I control and release a key that decrypts my
> malicious image.  I think you give the answer below:

Yes, the goal of all this is to render such scenarios impossible.


> [...]
>> FTR, I'm trying to make a point for formatting and manufacturing
>> everything from within the SVSM upon first use, and to bind the
>> received filesystem root key to an ECDSA key associated with the KBS,
>> via:
>> - KBS signs its ephemeral ECDH public key with that ECDSA key,
>> - the shared key from ECDH is used for authenticated encryption of
>>   the secret, which includes the filesystem root key.
>
> So on first boot the CVM binds via public key to the KBS it's given and
> checks this key on subsequent boot time interactions with the KBS?

With the approach I currently have in mind there would be no
differentiation between first and subsequent boots: the SVSM receives a
new KBS ECDSA key for every boot/attestation cycle, memorizes the
current one in RAM only and would leave it to external parties to
implement policy based on that. For example, as outlined in my reply to
Tyler's mail ([1]), one could implement an IAK/IDevId or EK CA that
would issue certificates based on whether the SVSM presents a recognized
and trusted KBS' ECDSA pubkey.


> In which case it's Trust on First Use but it works, provided the KBS
> key can be stored reliably within the image and,

When you're saying "image", do you mean the SVSM persistence/CocoonFs
image containing the TPM state, or the guest's rootfs image? From the
context I suppose you're referring to the latter?

I think in this case Tyler is right when saying that if the LUKS rootfs
image is sealed by the TPM, then a successful unsealing operation would
be proof already that the correct SVSM persistence/CocoonFs image key is
being used. The problem would be how to prove in a generic way that the
expected LUKS rootfs was unlocked successfully.


> I assume, for immutable images the key will be provisioned inside the
> initial image?

For clarity, the SVSM persistence/CocoonFs image is currently assumed to
always be mutable, which is why I'm supposing you're referring to the
guest rootfs image here.

[If nothing else, there are plans to explore the feasability of
 implementing rollback protection on top of CooconFs, simply by sending
 the Merkle tree root HMAC off to a trusted party upon each
 update. Writing something at FS opening time would then guarantee a
 linear TPM state history, i.e. no forks/clones etc, but that requires
 mutability.]

Either way, AFAICS, the only way to enable the SVSM to verify on its own
that it's using the expected persistence/CocoonFs image would be to
embed the expected KBS ECDSA key into the IGVM, but I haven't really
thought this through yet.

Thanks!

Nicolai

[1] https://lore.kernel.org/r/877bwtzrvl.fsf@

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)
