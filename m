Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46F39659E
	for <coconut-svsm@lists.linux.dev>; Tue, 14 Apr 2026 10:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161930; cv=none; b=YYsonYG5vzwECULOz8mY+c2lzRWUvlS0XnJbHYjAwmwqiGguC3dUcuXeX7Gslj5Bmpcn6QWuZcxKIX4J1tDPVa4S5p8r/2PX9PQUiUKkqJZ2xwDD4qNmlUfZWz9fz8hWMoAyGvxTFYcPTZPKRcuGlCrB5t7Fjc23AlU8ilTXTuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161930; c=relaxed/simple;
	bh=G5FdNk8u6HglpR/og6CaGoKfDGeejyNXpcfAPDWcdKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEMekXnjcctHaZ4qR4YQF+VCbes2lAeJjPMD8lfDjpRJ8MRhNRbUIrunmSMcmx/ePX2pLPE1aOldVDt7RyurgNmwXojiwIi45seB/Nv07oGdk1mqJb9fdceUfS0PJLJ+JChQBzgHn17JUrxe2dkmLjTgQQhBFYdVtAonXMeEbx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g3yd0U+s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t1Kulniq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g3yd0U+s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t1Kulniq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g3yd0U+s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t1Kulniq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g3yd0U+s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t1Kulniq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2DF1E6A8C6;
	Tue, 14 Apr 2026 10:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776161927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4eL4hbAQjLDa2aox4fscPI23SPEbB+A8H3zjU3/d7Y=;
	b=g3yd0U+siGbDfAXVY5JLoDcujHwD5uG1tVP56aN/IZMtKVw7WWhz1st/rBg0viM/vEWbi8
	Y5F2GTEerBPF0bYyfaPvHPTbJ6+wzVFUb+SIkm+GXyzzLLutuRa0ks4Uget/vMXnuDbH3w
	dBYDKdwDps9g5p3EPWU2h27rP5EDHBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776161927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4eL4hbAQjLDa2aox4fscPI23SPEbB+A8H3zjU3/d7Y=;
	b=t1KulniqesC+kqBIvTaudXRr53iU8z0Jd1NCPMdVnNHIbtelnbf0Stqc6d1MfmEDRd1eNL
	0LnyXy6EQyAJu1Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=g3yd0U+s;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=t1Kulniq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776161927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4eL4hbAQjLDa2aox4fscPI23SPEbB+A8H3zjU3/d7Y=;
	b=g3yd0U+siGbDfAXVY5JLoDcujHwD5uG1tVP56aN/IZMtKVw7WWhz1st/rBg0viM/vEWbi8
	Y5F2GTEerBPF0bYyfaPvHPTbJ6+wzVFUb+SIkm+GXyzzLLutuRa0ks4Uget/vMXnuDbH3w
	dBYDKdwDps9g5p3EPWU2h27rP5EDHBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776161927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4eL4hbAQjLDa2aox4fscPI23SPEbB+A8H3zjU3/d7Y=;
	b=t1KulniqesC+kqBIvTaudXRr53iU8z0Jd1NCPMdVnNHIbtelnbf0Stqc6d1MfmEDRd1eNL
	0LnyXy6EQyAJu1Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8F4C4B3C1;
	Tue, 14 Apr 2026 10:18:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wGM7NYYU3mkxAgAAD6G6ig
	(envelope-from <clopez@suse.de>); Tue, 14 Apr 2026 10:18:46 +0000
Message-ID: <9348d5f9-5e18-4bc6-b80a-043e3890be85@suse.de>
Date: Tue, 14 Apr 2026 12:18:38 +0200
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM Observability and Configuration Protocol draft
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev, Gerd Hoffmann <kraxel@redhat.com>
References: <d3v2ljpmhjukdwnavsn436fkgtuuojkptdr3f7bh3fcqr5zayy@d7jhqsyibycw>
 <4a0e6fd3-3d71-4e27-8536-dce4e171348b@suse.de>
 <2qhv4ezvbgww22lowygw647dgcmejfzcjiqhmo2boxh3scybw4@xmzjjbxw3e6p>
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <2qhv4ezvbgww22lowygw647dgcmejfzcjiqhmo2boxh3scybw4@xmzjjbxw3e6p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 2DF1E6A8C6
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 


On 4/14/26 11:59 AM, Jörg Rödel wrote:
>> I could see some cases where the guest wants to continuously consume
>> data from the SVSM (e.g. event-like information). Would it make sense to
>> have another set of calls to set up a shared ring buffer with a
>> source-defined entry size? Or 2 separate ring buffers in the case of
>> read/write sources. This could avoid a lot of calling and copying
>> overhead between the SVSM and the lower VPML guest. If this adds too
>> much complexity, it could be gated behind a higher protocol version to
>> allow for simpler implementations.
> 
> What use-case(s) do you have in mind that would benefit from that? I have a
> future extension in mind where the guest OS can register an IRQ which the SVSM
> will send when a given source changes. The use-case would be to push a changed
> root-hash of the cocoon-fs storage to the guest OS for logging and checking
> purposes to make storage-replay attacks harder.

I don't have a particular use case in mind, but given the general idea
of the protocol, something like this could be used to have poll-based
notification instead of IRQ-based, if the guest desires so. I guess the
log buffer could already benefit from something like this, as it would
remove the need for the guest to call into the SVSM to check if there is
new available data.

Carlos
