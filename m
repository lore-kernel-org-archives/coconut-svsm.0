Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892C42C21FC
	for <coconut-svsm@lists.linux.dev>; Fri, 16 Jan 2026 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768572308; cv=none; b=hinRitfvVdONgXni2hIPuKGe/H4jRfI5NRjmIbjiJzRqoCtbGu8jkhYXgNuZe3ygJjV/HV5KXEyx0d5TOsLuXAdfA5IUXbimF5ro3m0dPI+4MQf4oM2Wyqaai7DHoupxTUzumbKiWOsuSJjsbt1AD2EddppyQKmq/Dwq8er3aqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768572308; c=relaxed/simple;
	bh=cehmraXS2ifzvtF+/+uxABL3B49JMq7M9r5bWJ5YMKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cBxx9ux1R+CDUTT0bHZV8//LrYkptFB+/sPdtlMt83/EcEG+Bo+WPmX1lxGcxQKW/IEraLx3VuJzzWj8TExRl4+8Awzo7UasL16/edEH1beFlSmPJ6SlGYdqElmrbxUJ4jRW0ucMq9O0FzQsBlqT8xVDugwvrphc5MK87DuglGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OoC7G3Us; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uje2i9IN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OoC7G3Us; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uje2i9IN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OoC7G3Us";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uje2i9IN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OoC7G3Us";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uje2i9IN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 71B1E5BE3C;
	Fri, 16 Jan 2026 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768572305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGjC5sNm43I318d+MDGf8qgpleTkdFSaMGGN/i6Ss9c=;
	b=OoC7G3UsnRnCj2khwwkJR7PdjzQf8/ivG8hNV6W1U0io9E3LpBpUQcVMYYTnjNDzEzcbz4
	gB6IM5sCVxXWI35d/nJgWmG7AZgezdvUooC2ya74/SGxw7ZMi/8bCqWCt+jXed93m4GIIU
	UfJqXEe0PA+Yk49TgceesZpFFgrOAyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768572305;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGjC5sNm43I318d+MDGf8qgpleTkdFSaMGGN/i6Ss9c=;
	b=uje2i9INFhx0RTepmSx8Gkb6lgHoUzrFIiNQIHeFuFuHOr4Y96ZrZgNlztNODLwPisfGH3
	RB1FqiPR2PcqrzDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OoC7G3Us;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uje2i9IN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768572305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGjC5sNm43I318d+MDGf8qgpleTkdFSaMGGN/i6Ss9c=;
	b=OoC7G3UsnRnCj2khwwkJR7PdjzQf8/ivG8hNV6W1U0io9E3LpBpUQcVMYYTnjNDzEzcbz4
	gB6IM5sCVxXWI35d/nJgWmG7AZgezdvUooC2ya74/SGxw7ZMi/8bCqWCt+jXed93m4GIIU
	UfJqXEe0PA+Yk49TgceesZpFFgrOAyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768572305;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGjC5sNm43I318d+MDGf8qgpleTkdFSaMGGN/i6Ss9c=;
	b=uje2i9INFhx0RTepmSx8Gkb6lgHoUzrFIiNQIHeFuFuHOr4Y96ZrZgNlztNODLwPisfGH3
	RB1FqiPR2PcqrzDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 251313EA63;
	Fri, 16 Jan 2026 14:05:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5zYtBpFFammUUwAAD6G6ig
	(envelope-from <clopez@suse.de>); Fri, 16 Jan 2026 14:05:05 +0000
Message-ID: <ca7e4568-5058-4474-9aa6-c2866dc4d6f5@suse.de>
Date: Fri, 16 Jan 2026 15:05:00 +0100
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
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <CA+bRGFrHnTCTYAR0UjG2vC+AtrJAU2Uy8G_MzVZfOELh11dxsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MIXED_CHARSET(0.71)[subject];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.80
X-Rspamd-Queue-Id: 71B1E5BE3C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

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

FWIW, boot now fails a bit earlier:

    (...)
    [SVSM] VMSA PA: 0x8000f46000
    [SVSM] Launching Firmware
    error: kvm run failed Invalid argument
    EAX=00000000 EBX=00000000 ECX=00000000 EDX=00800f12
    ESI=00000000 EDI=00000000 EBP=00000000 ESP=00000000
    EIP=0000fff0 EFL=00000002 [-------] CPL=0 II=0 A20=1 SMM=0 HLT=0
    ES =0000 00000000 0000ffff 00009300
    CS =f000 ffff0000 0000ffff 00009b00
    SS =0000 00000000 0000ffff 00009300
    DS =0000 00000000 0000ffff 00009300
    FS =0000 00000000 0000ffff 00009300
    GS =0000 00000000 0000ffff 00009300
    LDT=0000 00000000 0000ffff 00008200
    TR =0000 00000000 0000ffff 00008b00
    GDT=     00000000 0000ffff
    IDT=     00000000 0000ffff
    CR0=60000010 CR2=00000000 CR3=00000000 CR4=00000000
    DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000
DR3=0000000000000000
    DR6=00000000ffff0ff0 DR7=0000000000000400
    EFER=0000000000000000
    Code=c5 5a 08 2d 00 00 00 00 00 00 00 00 00 00 00 00 56 54 46 00
<0f> 20 c0 a8 01 74 05 e9 0c ff ff ff e9 f1 fe 90 00 00 00 00 00 00 00
00 00 00 00 00 00 00
    qemu-system-x86_64: terminating on signal 2

This is due to 539624271cb8 ("sev: require the debug register
virtualization feature") in the SVSM, as the SEV features for the guest
VMSA do not match those of the VMPL0 VMSA, and the current KVM planes
implementation rejects it:

    [251378.096570] [ T91528] kvm_amd: kvm [91524]: vcpu0, guest rIP:
0x0 vmgexit: mismatched AP sev_features [0x1] != [0x29] from guest

Not sure if the best approach is to special-case debug swap, or to
simply allow lower VMPL VMSAs to have a subset of the features of the
VMPL 0 VMSA.

Reverting the commit I mention above results again in the hang that
Oliver reports.

Best,
Carlos
