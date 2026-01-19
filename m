Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104822EBDD9
	for <coconut-svsm@lists.linux.dev>; Mon, 19 Jan 2026 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821764; cv=none; b=nevZhX/fEkwPSoRXI3aouaYMBmaUNiWsUTdgk6NliluLQTdk8ZbyyRnnFANIbRscbjTsecHhppauwwyAB4ckZCrGWKpAcykgnpkYkqK9mNY93fjw4nOrb5cY0tMKs9Mn4/NdGKPEW3zwIi0EPSeACNE/RkctGNk0uF5v4545hNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821764; c=relaxed/simple;
	bh=mpDi9+/Ss8ZZoIQIMlmX34KzsMuFWEBagJmb+zjvnvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sn/EesQr/FYGvkDU0hmzCCNrgvpJbEupMkuXe/yvEUEjNzM9N11ZlakVfaLnt5zIVQueSqBp0ML/l5kIAWCbE91ZZrBR/LzRKlsUMsLOJ6IPRJzZ1UYf/UmmmWxwWEd+CyzVG+Qw5N1hPwTJDEkGLkxwP0fPtb2l1NyDvWn7sdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rT9eleQ/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WxeHGN+R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rT9eleQ/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WxeHGN+R; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rT9eleQ/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WxeHGN+R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rT9eleQ/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WxeHGN+R"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 35EDD5BD88;
	Mon, 19 Jan 2026 11:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768821761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4yCmEBLyS3qYNDmGprzuD2Z8NUH2Srkk7lnIktjO5+o=;
	b=rT9eleQ/2I7QCqRqiwuiZeE5Yh0/rSBkglg3iBrgP7EKEW7Z57pDj6ohvpativjIGuwC85
	JXYB3/l10EOOf1BjKaUDOsDc8OaoR4X7iuGcthBE1R+hA3nqrO/D0didPf6pmiCMuckWYa
	8Eaqc4ZB3lN8Sikh5Hjf28H471ymmCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768821761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4yCmEBLyS3qYNDmGprzuD2Z8NUH2Srkk7lnIktjO5+o=;
	b=WxeHGN+Rh1H3VvcPTYlTD4JqCIkS9EPsjFG5POavuER4vbE67phHHP497jo069L2umflOU
	ZMOex+4AwA1YT4BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768821761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4yCmEBLyS3qYNDmGprzuD2Z8NUH2Srkk7lnIktjO5+o=;
	b=rT9eleQ/2I7QCqRqiwuiZeE5Yh0/rSBkglg3iBrgP7EKEW7Z57pDj6ohvpativjIGuwC85
	JXYB3/l10EOOf1BjKaUDOsDc8OaoR4X7iuGcthBE1R+hA3nqrO/D0didPf6pmiCMuckWYa
	8Eaqc4ZB3lN8Sikh5Hjf28H471ymmCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768821761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4yCmEBLyS3qYNDmGprzuD2Z8NUH2Srkk7lnIktjO5+o=;
	b=WxeHGN+Rh1H3VvcPTYlTD4JqCIkS9EPsjFG5POavuER4vbE67phHHP497jo069L2umflOU
	ZMOex+4AwA1YT4BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC92C3EA63;
	Mon, 19 Jan 2026 11:22:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 33sAMwAUbmk/RQAAD6G6ig
	(envelope-from <clopez@suse.de>); Mon, 19 Jan 2026 11:22:40 +0000
Message-ID: <7f1f445f-7171-4375-910a-1ad4eefbcf85@suse.de>
Date: Mon, 19 Jan 2026 12:22:40 +0100
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KVM planes branches
To: Oliver Steffen <osteffen@redhat.com>, coconut-svsm@lists.linux.dev
Cc: Joerg Roedel <joerg.roedel@amd.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Luigi Leonardi <leonardi@redhat.com>
References: <CA+bRGFrHnTCTYAR0UjG2vC+AtrJAU2Uy8G_MzVZfOELh11dxsg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <CA+bRGFrHnTCTYAR0UjG2vC+AtrJAU2Uy8G_MzVZfOELh11dxsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -3.59
X-Spamd-Result: default: False [-3.59 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MIXED_CHARSET(0.71)[subject];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO

Hi,

On 1/7/26 3:02 PM, Oliver Steffen wrote:
> Hi everyone,
> happy new year!
> 
> I am curious about the state of the KVM planes effort and want
> to experiment with it a bit.
> I tried out the KVM planes branches we have in our GitHub org.
> I built Qemu and the host kernel from there and I am able to launch
> the current SVSM with that. QEMU just needed the patch for MADT-via-IGVM.
> But the OVMF does not seem to start. All I see is
> 
> ...
> [SVSM] VTPM: TPM 2.0 Reference Implementation initialized
> [SVSM] [CPU 0] Virtual memory pages used: 0 * 4K, 0 * 2M
> [SVSM] VMSA PA: 0x8000f49000
> [SVSM] Launching Firmware
> [init] COCONUT-SVSM init process starting
> [SVSM] Terminating task init, exit_code 0
> [SVSM] Launching request-processing task on CPU 1
> [SVSM] Launching request-processing task on CPU 2
> [SVSM] Launching request-processing task on CPU 0
> [SVSM] Launching request-processing task on CPU 3
> 
> and then it seems to hang forever.
> Is that expected? Do I need a specific commit of SVSM or EDK2?

I managed to track down the issue to an infinite loop within KVM. Please
try the following fix:

    https://github.com/coconut-svsm/linux/pull/19

In my environment this allows edk2 to make progress and reach the grub
menu. As mentioned in a previous email, you will need to revert
539624271cb8 ("sev: require the debug register virtualization feature")
temporarily in the SVSM.

Best,
Carlos
