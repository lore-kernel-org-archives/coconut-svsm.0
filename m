Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B4733086
	for <coconut-svsm@lists.linux.dev>; Tue, 14 Oct 2025 08:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431516; cv=none; b=WyL1GZRi/iMkA2f+FysLxeuhZFu+/eN9riHLplT1qE/xPRx52uhttBb/f+D/EU3EW5T3P729KLqETrgtvu2o4O4ioiASWSg6wkVjk0naRzwRIOYNbx02x/mtYmXRerFsKDckixJrxbItF2AlrFpfrgJiqHNl3L/wgzFgOAqGMSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431516; c=relaxed/simple;
	bh=txUbgBRL6KkZUD6PCfCa6qgHidvIyzlhJLimtIL641Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DlW24KW7rmcf2vg9ZYF6JPOXK6GA12XyBLUiWoo3p2aGCpg3eS0NYJA5k5yixMCrExeo/b63SaTkaTtGNMeTaWjfqMVdFLelbCUiKjN1NFxh61IgZCPiF3480j2IVy6KtyT1y38CWsilBqlai/2PwESwmq7uh5ialMGiMET98/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M4bAg3O+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PrpqsmzR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M4bAg3O+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PrpqsmzR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M4bAg3O+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PrpqsmzR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M4bAg3O+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PrpqsmzR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC96D21A77;
	Tue, 14 Oct 2025 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760431512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QAb/TAG862fDmb4FuQr2XPKbWFkASZE0v5QLAu863U4=;
	b=M4bAg3O+5K/cCheWVwlQ1FKQDunQpkaTb8Q0P/I3GBVlID1oSdD3X38FVRNS7AbFpmgMxs
	2bNWc6mjKYlsV/Cvj/D++DaRPm/l287b8wIBiexbMOk2oKh1Fnk1YjhI2OALrWVG5Mbjrv
	TQVrBL3rCQYOpFa0bImj1KAWmgkrULw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760431512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QAb/TAG862fDmb4FuQr2XPKbWFkASZE0v5QLAu863U4=;
	b=PrpqsmzRLv+czJke8cqmkbCKaoiO2CPXBCVT46A8NdfyZxStrZ/1BIscCHJKxo+cGZ0c01
	AG9XQB0in6+5N1Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=M4bAg3O+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PrpqsmzR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760431512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QAb/TAG862fDmb4FuQr2XPKbWFkASZE0v5QLAu863U4=;
	b=M4bAg3O+5K/cCheWVwlQ1FKQDunQpkaTb8Q0P/I3GBVlID1oSdD3X38FVRNS7AbFpmgMxs
	2bNWc6mjKYlsV/Cvj/D++DaRPm/l287b8wIBiexbMOk2oKh1Fnk1YjhI2OALrWVG5Mbjrv
	TQVrBL3rCQYOpFa0bImj1KAWmgkrULw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760431512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QAb/TAG862fDmb4FuQr2XPKbWFkASZE0v5QLAu863U4=;
	b=PrpqsmzRLv+czJke8cqmkbCKaoiO2CPXBCVT46A8NdfyZxStrZ/1BIscCHJKxo+cGZ0c01
	AG9XQB0in6+5N1Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC63413A44;
	Tue, 14 Oct 2025 08:45:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LjrVKJgN7mgDJAAAD6G6ig
	(envelope-from <nstange@suse.de>); Tue, 14 Oct 2025 08:45:12 +0000
From: Nicolai Stange <nstange@suse.de>
To: Tyler Fanelli <tfanelli@redhat.com>
Cc: Oliver Steffen <osteffen@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, Nicolai Stange <nstange@suse.de>,
 coconut-svsm@lists.linux.dev
Subject: [DISCUSSION] svsm: attestation: if and how to authenticate the
 provided secret
Date: Tue, 14 Oct 2025 10:45:12 +0200
Message-ID: <877bwxyiqv.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DC96D21A77
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.31
X-Spam-Level: 

Hi all,

as I don't want to hijack Tyler's recent attestation PR, I'd like to
continue a discussion started there and best summarized in the comment
at [1] here.

The question is whether or not to have the KBS authenticate the secret
returned to the SVSM upon a successful attestation.

The current state is that authenticated encryption is being used in the
protocol (AES-KW + AES-GCM), but that's only bound to an ephemeral ECDH
key, hence doesn't link to any root of trust.

I'm proposing, to do what TLS' ECDHE_ECDSA does, i.e. to make the KBS
sign its ephemeral ECDH key with a static ECDSA key and include that
signature in the attestation response.

Make the SVSM to verify the signature and memorize the KBS' ECDSA key
internally. For clarity: the SVSM would not verify any certificate
chain by itself.

With that, the SVSM can prove to any party that it's using a secret
obtained from that particular KBS instance, as identified by its
associated public ECDSA key:
- provide evidence that it's a well-behaving SVSM speaking (by means of
  another SNP report or some token obtained from the KBS in the course
  of attestation, ...),
- present the memorized KBS ECDSA key.

Motivation
----------
The SVSM persistence implementation will be using the secret obtained
from the attestation for protecting the externally stored data, c.f. my
"CocoonFs" PR at [2]. That is, the key will be used for both,
authentication and confidentiality protections.

That's inherently prone to MITM attacks: if the adversary is able to
control the persistence key, then it can read and modify the persisted
data.

My first thought on how to address this (and Tyler's initial reaction as
well), was to simply require that the VM owner ("end user") got to
create the persistence FS offline in a secure environment before first
use -- based on the presumption that if a wrong key was being returned
from the attestation process, then the SVSM would refuse to open the FS.

However, after thinking more about it, I came to the conclusion that
this workflow wouldn't be ideal from a practicality POV, and also,
wouldn't solve the problem in full.

First, a MITM can also mkfs a FS image with a key of his choice. The
implication is that the end user would not only have to create the
filesystem itself, but also populate its contents, like manufacturing
the TPM state offline and whatnot. And I'm not sure that would even
cover all potential applications of the persistence feature, like the
UEFI store.

Moreover, having the end user mkfs the FS image and transfer it into
e.g. the public cloud somehow might turn out impractical.

Also, having the end user mkfs the FS image requires that she got access
to the persistence key in the first place, unnecessarily extending the
set of entrusted parties. (And also, perhaps complicating the deployment
process, because that key would have to get enrolled into the KBS
somehow).

OTOH, if we were to have the persistence secret linked to the KBS' ECDSA
key, then
- we could mkfs the persistence FS from the SVSM upon first use and
- manufacture everything like TPM state from within the SVSM as needed.

AFAICS, it would even be possible for an organization to run something
like a "TPM EK CA", issuing credentials for the SVSM-manufactured TPM
EKs when presented with the KBS ECDSA key (alongside the SVSM evidence
in some form) from the SVSM.

Note how the overall process would be fully unattended and also, that an
organization wouldn't have to trust its VM owners / end users at all,
but could still trust the TPMs, simply by operating a KBS + an
associated "TPM EK CA".

What do you think, does it make sense?

Thanks,

Nicolai

[1] https://github.com/coconut-svsm/svsm/pull/828#issuecomment-3354168024
[2] https://github.com/coconut-svsm/svsm/pull/806

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)
