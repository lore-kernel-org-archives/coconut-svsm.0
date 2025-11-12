Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1460346A0C
	for <coconut-svsm@lists.linux.dev>; Wed, 12 Nov 2025 17:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762969952; cv=none; b=Se3DZkvh93t+Nsy8w5df3HWsGfA3qnHofS8s/kc4WoJxHPz22XJJ4jYwFL3fWS3u/ivQt5hmuJ9gITXSlQYU657mr5CgQ8hNneRY8J+T/1oR+8WKqXrrKYJWrfRQt0iVvYYDtuyyn3xqTDyTrKkVyZdlsIDaVbDddQ7/KCoPkPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762969952; c=relaxed/simple;
	bh=Zamlccuhw48BDESIxS+s27WFaphEwjkxiut65JIOxsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KrreMslMXb4nuBaIoZdu1veqvK7EChWV5Ug3ahdQF/QrPGWkdO23/s2PhpKKyOKIvGHF9kO0/w7ueYMR0sTVGJU30hOI8rJEhT8+MJVCfxunGoEE7DtPlx5xT9952SmzfdJWSr7CUBPGUIAZt8qG8W4oWW9swDmC8gobo46aBOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XwPK+N76; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9WFxIWgb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XwPK+N76; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9WFxIWgb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XwPK+N76";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9WFxIWgb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XwPK+N76";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9WFxIWgb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A3D451F7CB;
	Wed, 12 Nov 2025 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762969948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVYLIjSjMRYjMCswir6DGWTZel6dJAk+FnD1MkzqduQ=;
	b=XwPK+N76CzoplFqbXTKVUZXUP/xMtTxVH11x4fsMxR2bHq7z9u8HAgiODXiJeYLDLCEjl9
	JD8HbsMbnO1BTcow4cc7b6cmTN1bNt/BFSyi55afstaFn8KFzKR49jV5v9ZHzT71l/UY5c
	zwKXuIzeXvzJQDCRwvmMtijTQSjm/ww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762969948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVYLIjSjMRYjMCswir6DGWTZel6dJAk+FnD1MkzqduQ=;
	b=9WFxIWgbq8K0vGVKYDeOVUJ1HoCpIj8TwaI518SJPtc4rvVH9mvViiGPMF/KnZk6t/02rv
	FMyH1SzMSj9ctiAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XwPK+N76;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9WFxIWgb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762969948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVYLIjSjMRYjMCswir6DGWTZel6dJAk+FnD1MkzqduQ=;
	b=XwPK+N76CzoplFqbXTKVUZXUP/xMtTxVH11x4fsMxR2bHq7z9u8HAgiODXiJeYLDLCEjl9
	JD8HbsMbnO1BTcow4cc7b6cmTN1bNt/BFSyi55afstaFn8KFzKR49jV5v9ZHzT71l/UY5c
	zwKXuIzeXvzJQDCRwvmMtijTQSjm/ww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762969948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVYLIjSjMRYjMCswir6DGWTZel6dJAk+FnD1MkzqduQ=;
	b=9WFxIWgbq8K0vGVKYDeOVUJ1HoCpIj8TwaI518SJPtc4rvVH9mvViiGPMF/KnZk6t/02rv
	FMyH1SzMSj9ctiAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B2973EA61;
	Wed, 12 Nov 2025 17:52:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /j0wB1zJFGkOfgAAD6G6ig
	(envelope-from <clopez@suse.de>); Wed, 12 Nov 2025 17:52:28 +0000
Message-ID: <e3f674ca-464e-4c6e-b121-bb69f467b325@suse.de>
Date: Wed, 12 Nov 2025 18:52:27 +0100
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM draft specification (v1.01 draft #3)
To: Tom Lendacky <thomas.lendacky@amd.com>, coconut-svsm@lists.linux.dev,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Cc: Jon Lange <jlange@microsoft.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "Relph, Richard" <Richard.Relph@amd.com>,
 "Rodel, Jorg" <Joerg.Roedel@amd.com>, Melody Wang <huibo.wang@amd.com>
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A3D451F7CB
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51

Hi,

On 10/3/25 6:01 PM, Tom Lendacky wrote:
> Attached is the next version of the draft SVSM specification with the
> following changes since the previous version:
> 
>   - APIC emulation protocol added
>     - Coconut-SVSM will need to be audited, as the current APIC emulation
>       code does not completely match the "Alternate Injection Support"
>       specification on which this protocol is based.

Just one small comment on the APIC protocol, related to PR #850 [0]: the
section for SVSM_APIC_WRITE_REGISTER states the behavior for invalid
register addresses, but not for invalid values (e.g. an unsupported
delivery mode in ICR in the case of that PR). I think this should be
explicitly stated, and more precisely, I would suggest explaining
whether the value of that register is changed or not if the write is
rejected (I would assume it is not).

Thanks,
Carlos

[0] https://github.com/coconut-svsm/svsm/pull/850
