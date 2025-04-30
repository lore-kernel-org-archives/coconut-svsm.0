Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8021DE2C2
	for <coconut-svsm@lists.linux.dev>; Wed, 30 Apr 2025 05:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745990435; cv=none; b=LoBErx+CbYK25tuZeERnoMg0gd8j/aNuOt0lymoC2gRztPMKoAexFDriFNUYSM+zjmYtZorr7DyLo5sKw4rJ7xp9K6Jlkxjyz2hd65SAd6vT8Flh5YVXJz2EIFNe1u78UuK9EtWPg8OdedwsopaGLV1gBeCmR4g0WTqMf83qzPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745990435; c=relaxed/simple;
	bh=4b9v4V3RHVawka9TLkMNoMy4jOUCxkZC21CZM1HzXnc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j9fRPc65VFXJOMbmw6Tyx1brnVOkjWEfNOwZQ0wIo9IYnLPTWuG6fgY619ibnC+rpbwMxCdhoH4Ax0i4/lukJWRAL99JahtG4jwriW21Fne4qwom5iSz6sEQVcHZqxFn6suPLw4c0OttCapA9WRTNWGVWz/aU21mye4rqq1kaK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QjoPR83e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I041d4f1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kDKqsCdt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ydjVReNv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QjoPR83e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I041d4f1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kDKqsCdt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ydjVReNv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D71AE218F4;
	Wed, 30 Apr 2025 05:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745990430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duj/4uoFtGwMQuzOA5bYdyU3mEq/WnYKijoKv+YpVms=;
	b=QjoPR83ez6rm7RFR6QyqyDu3IVoRCUx6u90dUxen5JUFyRFcMq4HgCKCEFJgaxdgLN9+Dg
	3+TcjWE9DdyKGtLGRKAGN0ANd0StQNlXkiBLjyQypJwVcTiF/mEncZaJcqEc6mPTf0cl1v
	eIL9O1zBCUckSfHMfJgVqXvgF/HYP3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745990430;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duj/4uoFtGwMQuzOA5bYdyU3mEq/WnYKijoKv+YpVms=;
	b=I041d4f16kXDEQkGIZMgG5/fUTOn6XgyrPNRQVtLvCWaXss2Gbs8iy2sxGztzKTIjD3whn
	feVHxALvXX6bcPBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kDKqsCdt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ydjVReNv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745990429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duj/4uoFtGwMQuzOA5bYdyU3mEq/WnYKijoKv+YpVms=;
	b=kDKqsCdtufs9/az5uo58DyTFselWn4ZBMVNgxsz/u7eLliSUjN8PKyNY4B0+KVRejJrQKv
	MJaw3j+7sO70BJBm4DMPJ0UEcF6UFC6HpmHW8u/lXGKBZ/zoAFToteIkkMCAw9gtg+5+xf
	DYcBv8+1K0OMxup/uNVA/n7EqLzUMek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745990429;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duj/4uoFtGwMQuzOA5bYdyU3mEq/WnYKijoKv+YpVms=;
	b=ydjVReNvpiS+t34/NTuPDNJ/TGah167lc2NIg3rh5CPST4YfsLgy9UdixEH/0hwnnzoKIc
	wvw4fqjVSfU+DpAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6653813A25;
	Wed, 30 Apr 2025 05:20:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h858Fx2zEWgXWAAAD6G6ig
	(envelope-from <nstange@suse.de>); Wed, 30 Apr 2025 05:20:29 +0000
From: Nicolai Stange <nstange@suse.de>
To: Tyler Fanelli <tfanelli@redhat.com>
Cc: Nicolai Stange <nstange@suse.de>,  Stefano Garzarella
 <sgarzare@redhat.com>,  coconut-svsm@lists.linux.dev
Subject: Re: ECC keygen for PR #528 ("Attestation driver and proxy")
In-Reply-To: <e1ade6fd-53f9-43d1-a270-4d233194b4d1@redhat.com> (Tyler
	Fanelli's message of "Wed, 30 Apr 2025 00:47:25 -0400")
References: <25558.125041610080302253@us-mta-166.us.mimecast.lan>
	<CAGxU2F5aM_GXbcbOocrwpsGS4H+1i7O9xM4MhKrx8ycGOgah=w@mail.gmail.com>
	<96587.125042918523400199@us-mta-360.us.mimecast.lan>
	<e1ade6fd-53f9-43d1-a270-4d233194b4d1@redhat.com>
Date: Wed, 30 Apr 2025 07:20:24 +0200
Message-ID: <87ikmmkyxz.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D71AE218F4
X-Spam-Score: -2.31
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	INVALID_MSGID(1.70)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Hi Tyler,

Tyler Fanelli <tfanelli@redhat.com> writes:

> On 4/29/25 6:46 PM, Nicolai Stange wrote:
>> Hi Stefano,
>> Stefano Garzarella <sgarzare@redhat.com> writes:
>>=20
>>> On Wed, 16 Apr 2025 at 16:08, Nicolai Stange <nstange@suse.de> wrote:
>>>>
>>>> I managed to carve out and cleanup the first batch ([1]) from my work =
on
>>>> an encrypted FS by now. The FS cleanup itself is still WIP, but the
>>>> crypto parts should be in a usable state.
>>>>
>>>> As mentioned on last week's svsm-devel call, it might help with
>>>> addressing those stack size related issues with ECC keygen in the
>>>> context of PR #528 ([2]).
>>>>
>>>> I prepared some example code for generating an ECC key with NIST P-521,
>>>> to be found at [3].
>>>>
>>>>  From some lax experiments in userspace, peak stack usage is at about =
2.3kB.
>>>> (Which is still way above what I would have expected, given that no
>>>>   buffers are stored on the stack. I'm currently investigating that).
>>>>
>>>> I'm not sure whether merely generating the key is all you need -- FWIW
>>>> there's also support for ecdh, ecdsa and ecschnorr, in case you're
>>>> wondering. I'd be happy to come up with some example code for these as
>>>> well.
>>>>
>>>> Please let me know if you have any questions, either here or in today's
>>>> call.
>>>
>>> Cool, thanks for the example code, I guess this can unlock for now
>>> Tyler's PR and FS support, but as we discussed yesterday in the
>>> community call, the long term plan is to use OpenSSL/BoringSSL. I'll
>>> open an issue ASAP to track that work, and I'll start to investigate
>>> it.
>> I've implemented a BoringSSL FFI backend as a configurable
>> alternative
>> to the cocoon-tpm-crypto now (example code is updated accodingly), and
>> did a POC integration into SVSM, c.f. [4]. Good news is it still boots :)
>>=20
>
> Thanks for this. I'm currently updating PR #528 to use
> cocoon-tpm-crypto for generating ECC keys. For now, should I err
> towards using the BoringSSL feature?
>

That would become a Cargo feature ("boringssl") for the svsm kernel
crate, but yes, we can make it the default, either in the Cargo.toml or
by specifying it in the Makefile as it's being done for the vtpm IIRC.

One note though: the cocoon-tpm-crypto in its current form depends on a
1.86 toolchain, while the svsm fixes 1.82. Either we bump that up, or I
would have to go figure which of the used language features are
incompatible with 1.82 and somehow fix that up or work around (one is
upcasts of &mut dyn's to supertraits).

In either case, as the integration of the boringssl build into the svsm
environment is non-trival (see that demo POC [4]), I would leave that
part at least to a separate, dedicated PR.

Thanks!

Nicolai

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)
