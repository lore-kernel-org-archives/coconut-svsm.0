Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086271C84C0
	for <coconut-svsm@lists.linux.dev>; Mon,  6 Oct 2025 16:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759767479; cv=none; b=VDub3mz5eUi8DV/yNyuCO77FoTiTyWe/xvWAihw5wi4N6fRgIDfdUxGEzM55g6YFGrWQnVaNW1qf7MyUn3aAl1H7jPobaskDMkyoDtvUpvSp7Js2wG/uurQiJJ2g6db1nI3mMUc0qYRhXQrUQAQASPcop+Bn9vH4Ij/Ccvam5BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759767479; c=relaxed/simple;
	bh=vWB/X7cpUom8yJfmJYvmHBn9ILMRz+ivvBiB7955SpI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bBs95yYxokOEoMzrVFLQfBl8KF8Vo9p0vUdXMGGj3KSE17RRMd7LFy1uTJt9ZeGat4VRhoWnsaQuFfpjaO5iGGJAmMH6sIygaJoGyhxNwrlrvbSky33Se+4ye8NUxW5L/wG3vHZCcSQiAEWOCcKs7IVdp5g8PATeXTA9U717dKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OEUWBnxK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AIPRCbj6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OEUWBnxK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AIPRCbj6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OEUWBnxK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AIPRCbj6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OEUWBnxK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AIPRCbj6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2728D1F789;
	Mon,  6 Oct 2025 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759767476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjeRbhwsIbJfTNI0xaowndskAx42sjvbMufMS5H2JpY=;
	b=OEUWBnxKqzTnJ3xV7HXRrmJVVnX9ZrgJ4Ie3iHadk+BqyRTGW7bSayxip3MAmJXicujPAk
	sQpMYVi7HZwPTSVRP2/ZRwQAi7Kq+91o9D1GQ9XhuRVyCt8lyhtjVKQglpjkjRzy2tZSSx
	td/M4J2mgUMtGlVFEtcLwvnQ4BCsK0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759767476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjeRbhwsIbJfTNI0xaowndskAx42sjvbMufMS5H2JpY=;
	b=AIPRCbj6iA2S6cpPBwJR6NBNVvsRCT7TClY8MxhhgDLuO/Lir08qR728ZBUPHcnw601YJn
	tvv9e2At+elrovDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759767476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjeRbhwsIbJfTNI0xaowndskAx42sjvbMufMS5H2JpY=;
	b=OEUWBnxKqzTnJ3xV7HXRrmJVVnX9ZrgJ4Ie3iHadk+BqyRTGW7bSayxip3MAmJXicujPAk
	sQpMYVi7HZwPTSVRP2/ZRwQAi7Kq+91o9D1GQ9XhuRVyCt8lyhtjVKQglpjkjRzy2tZSSx
	td/M4J2mgUMtGlVFEtcLwvnQ4BCsK0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759767476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjeRbhwsIbJfTNI0xaowndskAx42sjvbMufMS5H2JpY=;
	b=AIPRCbj6iA2S6cpPBwJR6NBNVvsRCT7TClY8MxhhgDLuO/Lir08qR728ZBUPHcnw601YJn
	tvv9e2At+elrovDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C18C113700;
	Mon,  6 Oct 2025 16:17:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 20qWLbPr42hzPQAAD6G6ig
	(envelope-from <nstange@suse.de>); Mon, 06 Oct 2025 16:17:55 +0000
From: Nicolai Stange <nstange@suse.de>
To: "Relph, Richard" <Richard.Relph@amd.com>
Cc: Nicolai Stange <nstange@suse.de>,  "Lendacky, Thomas"
 <Thomas.Lendacky@amd.com>,  "coconut-svsm@lists.linux.dev"
 <coconut-svsm@lists.linux.dev>,  "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>,  Jon Lange <jlange@microsoft.com>,
  "kraxel@redhat.com" <kraxel@redhat.com>,  "Rodel, Jorg"
 <Joerg.Roedel@amd.com>,  "Wang, Huibo" <Huibo.Wang@amd.com>,  James
 Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: SVSM draft specification (v1.01 draft #3)
In-Reply-To: <523D9120-05D9-41D7-98CA-FD6DBF199748@amd.com> (Richard Relph's
	message of "Mon, 6 Oct 2025 14:44:12 +0000")
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com>
	<523D9120-05D9-41D7-98CA-FD6DBF199748@amd.com>
Date: Mon, 06 Oct 2025 18:17:55 +0200
Message-ID: <877bx8knrg.fsf@>
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.10

Hi Richard,

"Relph, Richard" <Richard.Relph@amd.com> writes:

>     I disagree with the premise =E2=80=9Cthat establishing such semantics=
 now
> would prohibit us=E2=80=9D from doing anything whatsoever in the future. =
The
> new Reset command has flags.

just to make it explicit: AFAIU, flags are insufficient for implementing
an event log handover mechanism like James proposed. What would be
needed for that is a means to pass the event log from the guest into
`SVSM_REBOOT_EXECUTE` for handover to the relaunched guest. But granted,
given the current lack of any defined mechanism for injecting such an
eventlog back into the restarted guest again, it would be quite a task
to define all that coherently protocol-wise at this point.


> It=E2=80=99s in a completely separate, versioned protocol that can be ext=
ended
> with additional commands. Though the current spec says this command
> will live =E2=80=98forever=E2=80=99, I=E2=80=99m OK with having the proto=
col specify a minimum
> version that would, in the future, even permit this command to be
> unusable.

You mean like bumping the protocol version the day the SVSM wants to do
self-measurements into the TPM PCRs and say something along the lines of
"starting from version XY, `SVSM_REBOOT_EXECUTE` has become undefined,
please use `SVSM_REBOOT_EXECUTE_EX` instead"? Perhaps not ideal in terms
of future interoperability, but definitely fine as far as I'm concerned.


> For now, we can mandate that the reset command does not alter or
> modify TPM state in any way

The option to do nothing isn't really a good one IMO:
1.) The restarted guest would not be able to present a complete,
    verifiable event log for a remote attestation, because it's lacking
    the head part of what's been extended into the PCRs. That is, remote
    attestation of the restarted guest would be impossible (at least
    if supposed to cover the boot event log).
2.) There are potential security implications with e.g. a restarted
    "bad" guest continuing on the TPM state of a preceding "good" one.

> and leave it up to the VMPL 2 guest to decide what to do.
> Alternatively, we could specify that the command reset the TPM and
> RTM as if it were a power off/on cycle.  Or use one of the flag
> bits to differentiate between these 2 simple possibilities.

> Anything else seems like it would be unnecessarily complicated at
> this point in time.

Not for me to judge upon really, I merely wanted to give a heads-up that
there is a related discussion happening over at GH in the first place.

Thanks,

Nicolai

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)
