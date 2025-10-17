Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC123346BF
	for <coconut-svsm@lists.linux.dev>; Fri, 17 Oct 2025 11:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700711; cv=none; b=OzJrYsiQuJpK9GOgcfAgJDFHiKx4J+kxOe2OKBnEHTyCPh5raqJ/u8d1gzW6aHOeItcCbxWvk5GXLGO3hb3hRe9rTocwvdvkRbrqzbf9FfbmY/i+8EiT1QciCGD222YWHVetrhyD4dQlkD9SomBoWvbFX72/avHymi+7pNOtt6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700711; c=relaxed/simple;
	bh=WfsPaXoggdTDLyCTLL+V0pDY6v0DujKUj8FBxW2uS30=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OROLq4yBtmVUSA2GjmTm7LPikDgsXhUN5xQb/IVm23SVwWyCWaP2a8sgICxUkOw8KI/tQdO+jtNrqCrPprDzPKb/6PIVytmxTfaW9Z9GnMbTM3oFKPmeQ+of3HQJ5o1qw6gp0QwabojcQGJQF3Sqis0oHw3LHcjlfQF+eVwiUG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uBJjuQ3l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QId5mPEB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uBJjuQ3l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QId5mPEB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uBJjuQ3l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QId5mPEB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uBJjuQ3l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QId5mPEB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 245C821B3C;
	Fri, 17 Oct 2025 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760700707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNAdHeJ0ZrnFyiF9+7TS7IQj9yIZQ/JyP4JLv/VEk80=;
	b=uBJjuQ3lhRBMmsFpVr5KxhREKaQNeyED1xj7tATNN6PE77q+tUtKwXQrNZQNz1WUITUvc3
	mLRBiCo90Z6YH9eI5mHegsE433bWVcjgEBBfDq8f7HccZNKKHcDGnW19LGNTetc0wuG66Z
	a++Ma0V6KXQCL31kgOYcL0RMEkSbmB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760700707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNAdHeJ0ZrnFyiF9+7TS7IQj9yIZQ/JyP4JLv/VEk80=;
	b=QId5mPEBLJVNe6fjsc488CUulAzmd7T6igdsmWrZaUCknA5UyBMzlCaqqSIYkBy56faGrR
	aAfWPJnr51qmFRAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uBJjuQ3l;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QId5mPEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760700707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNAdHeJ0ZrnFyiF9+7TS7IQj9yIZQ/JyP4JLv/VEk80=;
	b=uBJjuQ3lhRBMmsFpVr5KxhREKaQNeyED1xj7tATNN6PE77q+tUtKwXQrNZQNz1WUITUvc3
	mLRBiCo90Z6YH9eI5mHegsE433bWVcjgEBBfDq8f7HccZNKKHcDGnW19LGNTetc0wuG66Z
	a++Ma0V6KXQCL31kgOYcL0RMEkSbmB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760700707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNAdHeJ0ZrnFyiF9+7TS7IQj9yIZQ/JyP4JLv/VEk80=;
	b=QId5mPEBLJVNe6fjsc488CUulAzmd7T6igdsmWrZaUCknA5UyBMzlCaqqSIYkBy56faGrR
	aAfWPJnr51qmFRAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E752B136C6;
	Fri, 17 Oct 2025 11:31:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TTA6NyIp8mjsKQAAD6G6ig
	(envelope-from <nstange@suse.de>); Fri, 17 Oct 2025 11:31:46 +0000
From: Nicolai Stange <nstange@suse.de>
To: Tyler Fanelli <tfanelli@redhat.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,  Nicolai Stange
 <nstange@suse.de>,  Oliver Steffen <osteffen@redhat.com>,  Stefano
 Garzarella <sgarzare@redhat.com>,  coconut-svsm@lists.linux.dev
Subject: Re: [DISCUSSION] svsm: attestation: if and how to authenticate the
 provided secret
In-Reply-To: <203dfa61-dd55-4fbb-86d2-c0cef55eaf27@redhat.com> (Tyler
	Fanelli's message of "Tue, 14 Oct 2025 21:33:46 -0400")
References: <a6188e4c2eb11ac6fef4eab605666d15c3f604c4.camel@HansenPartnership.com>
	<fe4fcbfeb22c26c8172960551d5721d2919a7004.camel@HansenPartnership.com>
	<203dfa61-dd55-4fbb-86d2-c0cef55eaf27@redhat.com>
Date: Fri, 17 Oct 2025 13:31:42 +0200
Message-ID: <877bwtzrvl.fsf@>
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
X-Rspamd-Queue-Id: 245C821B3C
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
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -2.31

Tyler Fanelli <tfanelli@redhat.com> writes:

> On 10/14/25 5:40 PM, James Bottomley wrote:
>> On Tue, 2025-10-14 at 22:56 +0200, Nicolai Stange wrote:
>>> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
>>>
>>>> On Tue, 2025-10-14 at 10:45 +0200, Nicolai Stange wrote:
>>>>>
>>>>> as I don't want to hijack Tyler's recent attestation PR, I'd like
>>>>> to continue a discussion started there and best summarized in the
>>>>> comment at [1] here.
>>>>>
>>>>> The question is whether or not to have the KBS authenticate the
>>>>> secret returned to the SVSM upon a successful attestation.
>>>>>
>>>>> The current state is that authenticated encryption is being used
>>>>> in the protocol (AES-KW + AES-GCM), but that's only bound to an
>>>>> ephemeral ECDH key, hence doesn't link to any root of trust.
>>>>
>>>> Could we wind back a bit?=C2=A0 This discussion seems to be starting in
>>>> the middle.=C2=A0 Where does the encrypted state actually come from?
>>>
>>> Sorry for being unclear -- this is one of the open questions, see
>>> below.
>>>
>>>
>>>> The threat being that if an attacker can supply the TPM state to
>>>> your confidential VM, they know all the TPM parameters, including
>>>> the private keys, and can fake any attestation.=C2=A0=C2=A0 In the non=
-CVM
>>>> world, the state is usually part of the VM image (encrypted), but
>>>> this happens because the TPM is running outside the VM envelope and
>>>> suspend or shutdown can pull the encrypted state as part of the
>>>> device state of the VM image.=C2=A0 In the CVM world the state is stor=
ed
>>>> inside CVM in the SVSM and has to be inaccessible to the guest.=C2=A0 =
It
>>>> is possible for the SVSM to encrypt the TPM state and pass it to
>>>> the guest which then saves it in the VM image.=C2=A0 In that case, pro=
of
>>>> of correctness can simply be supplying a key capable of decrypting
>>>> the image.
>>>
>>> The current plan is to not involve the guest at all. Instead
>>> - a (small) block device will get attached to the SVSM, via virtio
>>>  =C2=A0 currently,
>>> - there will be a filesystem on that block device, which is encrypted
>>> + authenticated with a (symmetric) "filesystem root key" known only
>>> to the SVSM and
>>> - that filesystem root key will get revealed by the KBS to the SVSM
>>> upon
>>>  =C2=A0 successful attestation.
>>>
>>> The TPM state will be stored in a file on that filesystem. UEFI data
>>> in another and so on.
>> On this, how does the guest know it's pulled in the correct image?
>> If
>> I were a malicious host, I could encrypt my own TPM image, accept your
>> attestation to a KBS I control and release a key that decrypts my
>> malicious image.  I think you give the answer below:
>>=20
>
> We intend for the guest's rootfs to be sealed to the persistent TPM
> found in encrypted storage. The malicious host could switch the TPM,
> but that TPM wouldn't be able to unseal the rootfs.
>
> This doesn't directly prevent the attack you mention above, but it
> would be a DoS.

So if I understand correctly (please correct if I'm wrong), a successful
unlock of the guest's LUKS-protected rootfs would act as a proxy for
"the SVSM is using the right/genuine CocoonFs image" in a sense?

The problem with that, for remote parties, is how would they verify that
LUKS disk XY had been successfully unlocked (assuming the guest has a
LUKS protected rootfs in the first place)?

I mean, take keylime for example. If I'm not mistaken, the verifier
component has a list of trusted "OEM IAK/IDevID Certificate CAs" ([1])
configured for its $TPM_CERT_STORE ([2]), with the IAK/IDevID being
signing keys on the TPM. (*) The TPM's IAK/IDevID being signed by such
a trusted CA is what establishes trust in the TPM and its measurements
as far as the remote party is concerned.

With "trust" meaning trust that
- the TPM implementation is correct and
- the IAK/IDevIDs are keys on the TPM and never leave it.

In our setup, with the SVSM attesting to the KBS, it's ultimately the
KBS enforcing the first part, by only ever releasing the persistence key
to well-behaving, i.e. attested SVSMs. The second part however, is true
only if the SVSM actually does use the secret key obtained from that
very KBS for the TPM state persistence.

So if a relying party, perhaps a "OEM IAK/IDevID or EK Certificate CA"
requested to issue IAK/IDevID certificates for the SVSM's TPM, wants to
establish this trust, it needs to verify both parts.

For that, we need confirmation that the key from the KBS is used for the
persistence. Proof of possession of some secret pre-provisioned offline
into the CocoonFs image, like a LUKS key, might work, but I don't see a
straightforward way to make that universal and also, it would make the
initial setup more complicated than need be, IMO. In particular, access
to the persistence key is required for that.

If OTOH we were to follow the route to associate the KBS with a ECDSA
key, and use that for (indirectly) authenticating the received secret,
then we could make the SVSM present that to the organization's "OEM
IAK/IDevID or EK Certificate CA", alongside evidence it's a SVSM, and
the CA would issue a "OEM IAK/IDevID or EK Certificate", because it
recognizes the KBS ECDSA key and trusts the associated KBS (and trusts
the SVSM to have verified the ECDSA signature). From then on, relying
parties like keylime would only have to trust that CA, and workflows
would be no different from any other TPM. Note that it wouldn't matter
when and where the initial TPM state is getting manufactured.

Moreover, any subsequent usage of a certified IAK/IDevID or EK would
henceforth be an implicit proof that the genuine CocoonFs image is being
used, which could perhaps be used for establishing trust in the state
stored by any other subsystem on the SVSM's persistent storage (UEFI
etc.) -- as per its global authentication: if anything on the filesystem
is genuine, then everything is.

Thanks!

Nicolai

[1] TCG "TPM 2.0 Keys for Device Identity and Attestation", ver 1.00, rev 12
[2] https://keylime.readthedocs.io/en/v7.12.1/user_guide/idevid_and_iak.html
(*) Other solutions might do something similar, but with trust
    established through the TPM's EKs instead of IAK/IDeveID, in turn
    certified by the TPM/Platform manufacturer. C.f. TCG TPM 2.0
    Library, v184, part 0 ("Introduction"), sec. 4.5.3
    ("Attestation"). On a high level, the concept is the same: there's
    some key on the TPM, certified by some CA to be trusted by relying
    verifiers in order to establish trust in the TPM.

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)
