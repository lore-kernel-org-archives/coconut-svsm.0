Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FBD23EAB2
	for <coconut-svsm@lists.linux.dev>; Wed, 11 Mar 2026 04:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773203374; cv=none; b=ASKimbCevGTQ3mvnmt8qhj4E4rkE8LNF0tcXMd1TwD9qusKmAtNJZvx7NjyWuxHe30KI4ANGuQpYjBuVlM8/e/hkkwwmUiM0tC8fJI4a2tpAOJ2uCkRZKoS0OUjlp1BGiP0alai2SkslRNNbaSSO9dwDyAoA3oz59Qr3MNeOXwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773203374; c=relaxed/simple;
	bh=BI+wwR3gMJCkIfpA2uTuWcVLoUbppH/zEqUxPNeR1ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FwNQiJ09BfpXzmlPSI0q5M6crKXCApMwKvvjXhQvfYjO9nREb5Bk3frbJbu1rKsNNMesA2jNHj3LL6T+tzdTgpWT4c1fbAar7qOngVViW+348qvcT+kABQLm71sHbVxIAWqZfH37QHGaltphl0BmpHfXBPWcVu+dCMXy7/65Fog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hOsA78/U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fXVoh61H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xfWNsxC/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ic09199y; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hOsA78/U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fXVoh61H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xfWNsxC/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ic09199y"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E61D14D36C;
	Wed, 11 Mar 2026 04:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773203371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=EX8dnsaNqq/54nColLuUfPBF/Gh+/tvq9besgpDQRCk=;
	b=hOsA78/UgSS8VLHf4a4hy/vusmuCMw6cz5ISWpUSu5ghhdqUqPgfrBx+1EjOfD0B+aDPQz
	ei++E0FrXY8wX3iPVPTP38BO2CqJGY6Z3WgP3JyYSsF8pZP5hn1EAqg/eUGAyW0NqPRcK4
	6dPk1nZfAJgrfYZvORUndXTn5Ele8w0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773203371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=EX8dnsaNqq/54nColLuUfPBF/Gh+/tvq9besgpDQRCk=;
	b=fXVoh61HluKZ/XsCZoveyIdIj00UGJE3nr12u8rOpFxTFFyqr/XflbsIW8J8bjtVPnROhq
	Z1wNZDnCNzqlwnBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773203370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=EX8dnsaNqq/54nColLuUfPBF/Gh+/tvq9besgpDQRCk=;
	b=xfWNsxC/nwBVxkbiAzuFk/Lo3jfw+bgplfKOgHjqJLc7zQCRQFjDbG6sPxUmzbDfkThzSt
	ibLNHu/DizmBqEUMzt0ipG9HcIXUS5jf+WPYyR3Wp3b9LgOWYLlOg6ZB9I1vIaIQJolNPY
	JXKegAa/R+xZu0Hjsk/I+TO7GOdUias=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773203370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=EX8dnsaNqq/54nColLuUfPBF/Gh+/tvq9besgpDQRCk=;
	b=Ic09199y0CvkfqnTfCq55nl0Z9TX5yne2Lm27fY0JHjtIz/tHVz2BmcgEguoF2NAcQvU4l
	MdR4JWDDTwFoKWCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C16653F81C;
	Wed, 11 Mar 2026 04:29:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +BLxLarvsGnhcwAAD6G6ig
	(envelope-from <nstange@suse.de>); Wed, 11 Mar 2026 04:29:30 +0000
From: Nicolai Stange <nstange@suse.de>
To: Tyler Fanelli <tfanelli@redhat.com>
Cc: Oliver Steffen <osteffen@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, coconut-svsm@lists.linux.dev
Subject: [DISCUSSION] svsm: attestation + CocoonFs: 
Date: Wed, 11 Mar 2026 05:29:30 +0100
Message-ID: <873427gf9x.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -1.59
X-Spam-Level: 
X-Spamd-Result: default: False [-1.59 / 50.00];
	BAYES_HAM(-2.99)[99.97%];
	INVALID_MSGID(1.70)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	SUBJECT_ENDS_SPACES(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.969];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

Hi Tyler,

I've been told in one of the svsm devel calls that a capability for
storing some info in plaintext in CocoonFs would be helpful for your
attestation efforts.

Before I go and implement something, let me ask about the nature of that
data.
- What exactly are you planning to store there?
- Presumably the filesystem salt from the image header, supposed to also
  serve as a filesystem ID ([1]), is not sufficient?
- Is the data considered immutable over the lifetime of the FS?
- Is it Ok if that data is not authenticated?

Thanks!

Nicolai

[1] https://coconut-svsm.github.io/cocoon-tpm/cocoonfs/cocoonfs-format.html#image-header
