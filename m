Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC98719D093
	for <coconut-svsm@lists.linux.dev>; Thu, 12 Mar 2026 01:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773277497; cv=none; b=Go7wXudaow7ca1aJoOpSkJjgq4UeM3dAUHni3W9UGVhiJRdN1R8QkxCp5luSk0Q+nvIOqvO81Bfzf/HcCdF+Qocq6qrfkp17SYkHx1TRm+AWcDMurgDdIY+qDlSnM/9JbukGTH5SGKbH2SlUlSi/2eVmegYQy8NScagmsYmDswI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773277497; c=relaxed/simple;
	bh=hfWPw5B/qy7WN/r12R6DDSpGBJRhyQXxuFwQczFfCKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LYuR6M+ymKJbVBVZgRMqkgZDRAMXJw9Po39d+vGr4pvbpyP3ZsOgXcofQzKbKWZt/eIJpk+Xf6GChtA46AgzFrH9X0/U5XQJRGLdErQBilbsmZ+rGu0Td4fhh44PfoHVNs7hHwOkFm4oO98eCfkdkQzNwkRh5KnG1Gird6ngLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fWtzU+ys; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+lEuCK1s; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QmqJQkhW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z6kIW+UZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fWtzU+ys";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+lEuCK1s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QmqJQkhW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z6kIW+UZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DECFA4D595;
	Thu, 12 Mar 2026 01:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773277494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74GOFKyioNXUtHMHdLWxE47483it6EmBenAwiz5SgHQ=;
	b=fWtzU+ysqQf3KowkKlIgjZCttRfJWLeeydp1YIPO2QlJcTVo6uO2uI2qYsZqCyILi1v54g
	yywdw9o4JY3wgFj5mQMxbuZktnOZYBO6Y7uivv4t70wuwGXyw1j90DN9mcuRpxnEPKEkAu
	idQu0EiUL8j3K0x3dGPE/FJQrnQHl5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773277494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74GOFKyioNXUtHMHdLWxE47483it6EmBenAwiz5SgHQ=;
	b=+lEuCK1sS4exWOMcy5hBrPdurSj4BK7NkL1ySMrUCcgNOcUoA7/my4QMbtFtq/eobaWpMi
	qUMWa62K07w7FmCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QmqJQkhW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z6kIW+UZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773277493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74GOFKyioNXUtHMHdLWxE47483it6EmBenAwiz5SgHQ=;
	b=QmqJQkhWYB3gnpj3ScEVZN8sq0FN2t42bI/tPg2cm+Mbb6HyJHN1/ldVDNysoSj2TNPDYG
	DPWlcFnVE69UMTg23pB02fM/6wTybq4lnU8tQFHioSTwkmb3qQPkAl6deKdIlONGL0spPt
	62fgWXdKRj+z53m0AJIKL2/PoNl72Ps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773277493;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74GOFKyioNXUtHMHdLWxE47483it6EmBenAwiz5SgHQ=;
	b=z6kIW+UZ1gk0ZuquApmwDzYYYaQ3xncfQ4qfGoFiOn5E+nrNRscpJZPAnXclIg4ls7Uq9B
	ZE9ErIMDV13TPKDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 907EC3FCDD;
	Thu, 12 Mar 2026 01:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WI7rHzURsmlIKQAAD6G6ig
	(envelope-from <clopez@suse.de>); Thu, 12 Mar 2026 01:04:53 +0000
Message-ID: <74aae8cf-3a05-44b1-a977-abc13a1095a5@suse.de>
Date: Thu, 12 Mar 2026 02:04:52 +0100
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Debug_swap in sev_features
To: Melody Wang <huibo.wang@amd.com>, Jon Lange <jlange@microsoft.com>,
 =?UTF-8?B?UsO2ZGVsLCBKw7ZyZw==?= <Joerg.Roedel@amd.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Cc: coconut-svsm@lists.linux.dev
References: <a43b6177-1b69-4369-84fa-7a3a596ba580@amd.com>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <a43b6177-1b69-4369-84fa-7a3a596ba580@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MIXED_CHARSET(0.71)[subject];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DECFA4D595

Hi,

On 3/9/26 7:35 PM, Melody Wang wrote:
> ( Sorry for resending, had mail issue. )
> 
> Hi guys,
> 
> I am working on PoC of Alternate Injection with Planes support.
> 
> I have run into one issue where the AP_CREATION for VMPL2 fails.
> 
> The failure happens in validate_sev_features() in kvm as it requires the
> creating vcpu and new vcpu have the same sev_features, but the new vcpu
> does not have debug_swap enabled:

I ran into this same issue, I reported it in some other email on this list.

> [2561459.191929] kvm_amd: kvm [675275]: vcpu0, guest rIP: 0x0
> validate_sev_features: vmgexit: mismatched AP sev_features [0x11] !=
> [0x29] from guest, vmpl: 2
> 
> I checked back to the SVSM and found when the guest vmsa is initialized
> in the
> init_guest_vmsa, where debug_swap is removed, the comment there says:
> 
>   // TODO: find a way to make this optional so guests that expect debug
>   // register protection can achieve it.
> 
> After I commented out this code:
> 
>   sev_status.remove(SEVStatusFlags::DBGSWP);
> 
> The issue is resolved.

Yes, exactly, this was introduced 539624271cb8 ("sev: require the debug
register virtualization feature") in the SVSM, and as Tom points out in
his reply, this is because the SEV features for the guest (VMPL2) VMSA
do not match those of the VMPL0 VMSA, and KVM (with the planes patches
on top) does not tolerate it.

> This works as a dirty hack but I thought I should let you know and perhaps
> hear your opinions about it and what would the right fix be.

My suggestion was to add SVM_SEV_FEAT_DEBUG_SWAP to
GUEST_CONTROLLED_SEV_FEATURES, but I never got around to try it.

Best,
Carlos
