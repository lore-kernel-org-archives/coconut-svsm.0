Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24BF1487E9
	for <coconut-svsm@lists.linux.dev>; Wed, 16 Apr 2025 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812483; cv=none; b=DPuRmwCW95EmIebn+Yds+7f4/9qDA6Elq7lqCVYtnsr5DJVQVIzqHB2Jkzqhege+fF4p8g/a5SzohErneaF3z51YUCj9jLLNzJoK6xW1VbsaXVut3MuDXAqKDWQpBSmFaMQqP2kxd1/EqlKswh1cGYMwcfV6/1q8Yh8gEINArDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812483; c=relaxed/simple;
	bh=uSxNi9aO3fwcKsaqOpH5u844NBppr8EP+7UvSPmRvRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bqDPNhItRvRQqSmSjFEg2Bzd+vEjRcTjVruaYRN9qlzKeH7MXi3TjeBBiXPJz3OjxcVqdcqJF8u2StHbZFlkszu2OSefByarkCaSpl9NOj2zIkAelWA1cCoJ7phRjRWjrC1cnEfgQp8MJ1L+FCtTxEhXvwyGQKe78XrB0OrU7Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VE0Tu4ho; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8DOCUZC+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hSVcTaMn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nWeCa7iR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VE0Tu4ho";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8DOCUZC+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hSVcTaMn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nWeCa7iR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DAD6921175;
	Wed, 16 Apr 2025 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744812480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uSxNi9aO3fwcKsaqOpH5u844NBppr8EP+7UvSPmRvRM=;
	b=VE0Tu4hoJ8DyjQD+13XPFofN1kDBxQYwGbKwGnSiHtIT7aNCcbuvR49/oecEhX85NvXpHH
	1mJoBjcUBYPmw9klCo95N8G+W9zqZmK2VSRrUzQOzbnc3xDtBARWshF3i+YWD096B8SfLD
	eZ967tBctAIuLaTDk5W/PJgDtioe488=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744812480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uSxNi9aO3fwcKsaqOpH5u844NBppr8EP+7UvSPmRvRM=;
	b=8DOCUZC+31ljYt4j/NR4pnuNYbWILXJl3Re9kXMp9oxx9RQbO41G7Ztq9w7QonD/wEyAzt
	jmAQgRs/j81VQJDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hSVcTaMn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nWeCa7iR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744812479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uSxNi9aO3fwcKsaqOpH5u844NBppr8EP+7UvSPmRvRM=;
	b=hSVcTaMnXU+48jLpi1xVwhlK59dufCbzruEH3Qks80q4rcMm5l3hackXWn6GJ3D6MQuoYm
	Lxx3EC6Qb+Yrpqjy9VuFSKW0glYFqQl/Ck0OQnNoMXhdNeud2yDMZJgQF5URe2XQUMDNAP
	dAgxvwv616XvJejdfvY+tKLGnSBxmhc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744812479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uSxNi9aO3fwcKsaqOpH5u844NBppr8EP+7UvSPmRvRM=;
	b=nWeCa7iRQixBOsviBELdEHhFWqJFh9SYRt8aqElGeN0lCZw8AV+jdJeV7uSa33CfDqj3+G
	QdWJ2I5KFxv/VyBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B726A139A1;
	Wed, 16 Apr 2025 14:07:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JzYQK7+5/2dUSAAAD6G6ig
	(envelope-from <nstange@suse.de>); Wed, 16 Apr 2025 14:07:59 +0000
From: Nicolai Stange <nstange@suse.de>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: coconut-svsm@lists.linux.dev, Nicolai Stange <nstange@suse.de>
Subject: ECC keygen for PR #528 ("Attestation driver and proxy")
Date: Wed, 16 Apr 2025 16:07:59 +0200
Message-ID: <87ikn49p34.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DAD6921175
X-Spam-Score: -2.31
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	INVALID_MSGID(1.70)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Hi all,

I managed to carve out and cleanup the first batch ([1]) from my work on
an encrypted FS by now. The FS cleanup itself is still WIP, but the
crypto parts should be in a usable state.

As mentioned on last week's svsm-devel call, it might help with
addressing those stack size related issues with ECC keygen in the
context of PR #528 ([2]).

I prepared some example code for generating an ECC key with NIST P-521,
to be found at [3].

From some lax experiments in userspace, peak stack usage is at about 2.3kB.
(Which is still way above what I would have expected, given that no
 buffers are stored on the stack. I'm currently investigating that).

I'm not sure whether merely generating the key is all you need -- FWIW
there's also support for ecdh, ecdsa and ecschnorr, in case you're
wondering. I'd be happy to come up with some example code for these as
well.

Please let me know if you have any questions, either here or in today's
call.

Thanks!

Nicolai

[1] https://github.com/nicstange/cocoon-tpm
[2] https://github.com/coconut-svsm/svsm/pull/528
[3] https://github.com/nicstange/cocoon-tpm-crypto-ec-key-gen-demo

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)
