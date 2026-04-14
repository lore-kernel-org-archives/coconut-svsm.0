Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4012C3939BC
	for <coconut-svsm@lists.linux.dev>; Tue, 14 Apr 2026 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159532; cv=none; b=NhtbS/SIVpnWYbNPNEO66v7jptul6sNqMrFl3SRUEpOCQB1f2Q55L8zP8X0IsJ/itiPqx2QEkxNed0N7reqL+maKUA8x0eByMGq5i4LAXT70RL24GQIcv/wy/EHXMB2lU/e5WKWIpcXgPEmiqbRltMGYjwmreb21kWukS4sJMLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159532; c=relaxed/simple;
	bh=0MRu7BSlcYFiS0SWBUokm0IwtBt8KEUgmqUVerBCs4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRQLuZ90ZVMw+DIVf8+iTvd99saah7l3lNe9OWZtZIj74VNwhbp2Bu5CTmzeBWLyYkaOWMe9KlvspWNr4mA5nkO06+PcIFllVt5SL7sRG02DSFj8+0Br9t23LCAkvltO/6PxuY8x0hKUdPgcFtr2pzt7ICC4KdfKPT7+R5DSB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BYoodJbi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=llU7+ndO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BYoodJbi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=llU7+ndO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BYoodJbi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="llU7+ndO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BYoodJbi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="llU7+ndO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 96E105BDBD;
	Tue, 14 Apr 2026 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776159529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4nxozoKi1q1rtWrYS6UFpMY9Nkb/bREcw/Dh905HKo=;
	b=BYoodJbi0URw5DMmHjlhU6rYTQ2N/9U2f/zJYYSWMJEbGwmrL8NIwRanAZL2v8yVbv4gXO
	srUUzzjiiiiY4aKZeGHxr8MRSpcgo1nuURffue0DulzfT99C3stSwu4GSW4idLSdOlH94N
	hHw41Q86tSBw0f1MYa3q2U21nWW9MyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776159529;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4nxozoKi1q1rtWrYS6UFpMY9Nkb/bREcw/Dh905HKo=;
	b=llU7+ndOK4xPCQZVrCGk+0XO++VM6CB0wZFLfEaohFyYkSp2TJmoPkLpJIYL/kIlLPEtKa
	+kUNBOcpa4q1sUBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BYoodJbi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=llU7+ndO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776159529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4nxozoKi1q1rtWrYS6UFpMY9Nkb/bREcw/Dh905HKo=;
	b=BYoodJbi0URw5DMmHjlhU6rYTQ2N/9U2f/zJYYSWMJEbGwmrL8NIwRanAZL2v8yVbv4gXO
	srUUzzjiiiiY4aKZeGHxr8MRSpcgo1nuURffue0DulzfT99C3stSwu4GSW4idLSdOlH94N
	hHw41Q86tSBw0f1MYa3q2U21nWW9MyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776159529;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4nxozoKi1q1rtWrYS6UFpMY9Nkb/bREcw/Dh905HKo=;
	b=llU7+ndOK4xPCQZVrCGk+0XO++VM6CB0wZFLfEaohFyYkSp2TJmoPkLpJIYL/kIlLPEtKa
	+kUNBOcpa4q1sUBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 665B14B39B;
	Tue, 14 Apr 2026 09:38:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G0ZoFikL3mkXWQAAD6G6ig
	(envelope-from <clopez@suse.de>); Tue, 14 Apr 2026 09:38:49 +0000
Message-ID: <4a0e6fd3-3d71-4e27-8536-dce4e171348b@suse.de>
Date: Tue, 14 Apr 2026 11:38:44 +0200
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM Observability and Configuration Protocol draft
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 coconut-svsm@lists.linux.dev
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <d3v2ljpmhjukdwnavsn436fkgtuuojkptdr3f7bh3fcqr5zayy@d7jhqsyibycw>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <d3v2ljpmhjukdwnavsn436fkgtuuojkptdr3f7bh3fcqr5zayy@d7jhqsyibycw>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 96E105BDBD
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 

Hi,

On 4/14/26 10:25 AM, Jörg Rödel wrote:
> # **[DRAFT]** SVSM Observability and Configuration Protocol
> 
> The SVSM Observability and Configuration Protocol (OCP) is a new sub-protocol
> of the SVSM specification and uses protocol ID value 5. The initial version of
> the OCP is 1. Versioning is strictly additive, i.e., all calls present in a
> protocol version must also be present in any later version.

Maybe we could have a short rationale section with e.g. expected use
cases for the protocol.

> 
> The following enumerates the set of calls supported by version 1 of the OCP:
> 
> | Call ID | First version supported | Name | Function |
> |--------:|------------------------:|------|----------|
> | 0 | 1 | `SVSM_OCP_LIST` | Query a list of supported observability and configuration sources. |
> | 1 | 1 | `SVSM_OCP_READ` | Read data from an observability source. |
> | 2 | 1 | `SVSM_OCP_WRITE` | Write data to a configuration source. |

I could see some cases where the guest wants to continuously consume
data from the SVSM (e.g. event-like information). Would it make sense to
have another set of calls to set up a shared ring buffer with a
source-defined entry size? Or 2 separate ring buffers in the case of
read/write sources. This could avoid a lot of calling and copying
overhead between the SVSM and the lower VPML guest. If this adds too
much complexity, it could be gated behind a higher protocol version to
allow for simpler implementations.

Best,
Carlos
