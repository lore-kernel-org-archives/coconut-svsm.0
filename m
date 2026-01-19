Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A223EA94
	for <coconut-svsm@lists.linux.dev>; Mon, 19 Jan 2026 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822257; cv=none; b=OkrVCcqoa7iM13bO6I70GB3TGa6/hnL24wWia8AZE+EwXRaLC3jmGie+NETjaL3R18sgz3Qyk+Yg1yP47/2AwsYgwCc/jaU+bDpyXT7unZjcUJAKQJqOo4SSfvk0QZ8TF4JS83gXOeCW6ek1v0jE1rjEvvkeef4x4tcPGuVR1OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822257; c=relaxed/simple;
	bh=T4IpkTjC3G/YPT0zgneg02IOesQAua9JKDva8KdqhoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6M760bBk7IF7hvL441dhj/8V7POCfonW6hSAQ/e7bQPmfx0l/0mtp3ml9lJRcnIQ8Y7OGi1RaWeimISxFgf/ryaXFc9DvPe7d1SmFNOpHqesIGO9Nbk+C1KTZGUVqJ/erW1BcMxrlKb0IWWDWUcXwd2nXi9EfJ80dAHcREDZjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gozVy3iE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=otx03bs3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fxgoYIDU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9UOeP3z7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gozVy3iE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="otx03bs3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fxgoYIDU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9UOeP3z7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BD2705BD73;
	Mon, 19 Jan 2026 11:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768822254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SV133S53nrqNYXoy8R0gYNIW1kXwc6TkW6X82Do2xyo=;
	b=gozVy3iEhM1k5C7c8Bhvbr+pymuWW/qp74uRdayO3w9oNd6kBzgcvki90AClN6U2mP07Cb
	V9weC7X8pKG+sLTovL7837rOk7BX2DcrKQvpvwhR37Fdb7NbMMBLge76QCs4IejXzFDKZi
	uPrezWt0YFxbH4Ci05xQJ0bThWooV+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768822254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SV133S53nrqNYXoy8R0gYNIW1kXwc6TkW6X82Do2xyo=;
	b=otx03bs33h4xoGFV4mCcvfEpfArgdU54seUxYFPVgP1hPecWMHO4IY4POjYiDFpvluFBpS
	Yo3euS6X6mpbebDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fxgoYIDU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9UOeP3z7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768822253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SV133S53nrqNYXoy8R0gYNIW1kXwc6TkW6X82Do2xyo=;
	b=fxgoYIDUEU8eNq9/cCZcSO8ysuSBLic2aKzJl8MNuAbaiG2nlLmGzTOg8ku1fKFavHX7RZ
	JNRK1rIoMt27hIEkFozyonvmhzyGZlizghS/ydXaJMnnZS+bRjiZphaRQXz7/9/Ogyljho
	LrE03P25iMUH61qd49RM1je7NI6tPxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768822253;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SV133S53nrqNYXoy8R0gYNIW1kXwc6TkW6X82Do2xyo=;
	b=9UOeP3z71WD86ZQPsoA/LRvpgHjQg1vkZXZA/LAIMsJ/Mbnfj0gdV0F89RoJQGeHMFyZ6W
	ZwUZAUpfI6FP27BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59A8C3EA63;
	Mon, 19 Jan 2026 11:30:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oDipEu0VbmmwTQAAD6G6ig
	(envelope-from <clopez@suse.de>); Mon, 19 Jan 2026 11:30:53 +0000
Message-ID: <8c1797a0-6a0a-4063-8a8c-8c7d657251cb@suse.de>
Date: Mon, 19 Jan 2026 12:30:52 +0100
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: KVM planes branches
To: Jon Lange <jlange@microsoft.com>, Oliver Steffen <osteffen@redhat.com>,
 "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>
Cc: Joerg Roedel <joerg.roedel@amd.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Luigi Leonardi <leonardi@redhat.com>
References: <CA+bRGFrHnTCTYAR0UjG2vC+AtrJAU2Uy8G_MzVZfOELh11dxsg@mail.gmail.com>
 <ca7e4568-5058-4474-9aa6-c2866dc4d6f5@suse.de>
 <CH8PR21MB5222CE1C15254477E5B7DF94CA8DA@CH8PR21MB5222.namprd21.prod.outlook.com>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <CH8PR21MB5222CE1C15254477E5B7DF94CA8DA@CH8PR21MB5222.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.95 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MIXED_CHARSET(0.56)[subject];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.95
X-Rspamd-Queue-Id: BD2705BD73
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 



On 1/16/26 5:21 PM, Jon Lange wrote:
> Carlos wrote:
> 
>> This is due to 539624271cb8 ("sev: require the debug register virtualization feature")
>> in the SVSM, as the SEV features for the guest VMSA do not match those of the VMPL0
>> VMSA, and the current KVM planes implementation rejects it:
> 
> In the future, KVM is going to have to accept different features in lower VMPLs, or else it will be impossible to enable features like alternate injection or REFLECT_VC (since those features can never be enabled for VMPL 0).  The best direction will be to eliminate any assumptions about cross-VMPL feature consistency.

Looking at it again, restricted injection and alternate injection are
considered "guest-controlled" SEV features in the KVM planes
implementation, meaning that they are exempt from the check. Perhaps we
should extend this to include debug swap.

Best,
Carlos

> -----Original Message-----
> From: Carlos López <clopez@suse.de> 
> Sent: Friday, January 16, 2026 6:05 AM
> To: Oliver Steffen <osteffen@redhat.com>; coconut-svsm@lists.linux.dev
> Cc: Joerg Roedel <joerg.roedel@amd.com>; Stefano Garzarella <sgarzare@redhat.com>; Luigi Leonardi <leonardi@redhat.com>
> Subject: [EXTERNAL] Re: KVM planes branches
> 
> Hi,
> 
> On 1/7/26 3:02 PM, Oliver Steffen wrote:
>> Hi everyone,
>> happy new year!
>>
>> I am curious about the state of the KVM planes effort and want to 
>> experiment with it a bit.
>> I tried out the KVM planes branches we have in our GitHub org.
>> I built Qemu and the host kernel from there and I am able to launch 
>> the current SVSM with that. QEMU just needed the patch for MADT-via-IGVM.
>> But the OVMF does not seem to start. All I see is
>>
>> ...
>> [SVSM] VTPM: TPM 2.0 Reference Implementation initialized [SVSM] [CPU 
>> 0] Virtual memory pages used: 0 * 4K, 0 * 2M [SVSM] VMSA PA: 
>> 0x8000f49000 [SVSM] Launching Firmware [init] COCONUT-SVSM init 
>> process starting [SVSM] Terminating task init, exit_code 0 [SVSM] 
>> Launching request-processing task on CPU 1 [SVSM] Launching 
>> request-processing task on CPU 2 [SVSM] Launching request-processing 
>> task on CPU 0 [SVSM] Launching request-processing task on CPU 3
>>
>> and then it seems to hang forever.
>> Is that expected? Do I need a specific commit of SVSM or EDK2?
> 
> FWIW, boot now fails a bit earlier:
> 
>     (...)
>     [SVSM] VMSA PA: 0x8000f46000
>     [SVSM] Launching Firmware
>     error: kvm run failed Invalid argument
>     EAX=00000000 EBX=00000000 ECX=00000000 EDX=00800f12
>     ESI=00000000 EDI=00000000 EBP=00000000 ESP=00000000
>     EIP=0000fff0 EFL=00000002 [-------] CPL=0 II=0 A20=1 SMM=0 HLT=0
>     ES =0000 00000000 0000ffff 00009300
>     CS =f000 ffff0000 0000ffff 00009b00
>     SS =0000 00000000 0000ffff 00009300
>     DS =0000 00000000 0000ffff 00009300
>     FS =0000 00000000 0000ffff 00009300
>     GS =0000 00000000 0000ffff 00009300
>     LDT=0000 00000000 0000ffff 00008200
>     TR =0000 00000000 0000ffff 00008b00
>     GDT=     00000000 0000ffff
>     IDT=     00000000 0000ffff
>     CR0=60000010 CR2=00000000 CR3=00000000 CR4=00000000
>     DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000
> DR3=0000000000000000
>     DR6=00000000ffff0ff0 DR7=0000000000000400
>     EFER=0000000000000000
>     Code=c5 5a 08 2d 00 00 00 00 00 00 00 00 00 00 00 00 56 54 46 00 <0f> 20 c0 a8 01 74 05 e9 0c ff ff ff e9 f1 fe 90 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00
>     qemu-system-x86_64: terminating on signal 2
> 
> This is due to 539624271cb8 ("sev: require the debug register virtualization feature") in the SVSM, as the SEV features for the guest VMSA do not match those of the VMPL0 VMSA, and the current KVM planes implementation rejects it:
> 
>     [251378.096570] [ T91528] kvm_amd: kvm [91524]: vcpu0, guest rIP:
> 0x0 vmgexit: mismatched AP sev_features [0x1] != [0x29] from guest
> 
> Not sure if the best approach is to special-case debug swap, or to simply allow lower VMPL VMSAs to have a subset of the features of the VMPL 0 VMSA.
> 
> Reverting the commit I mention above results again in the hang that Oliver reports.
> 
> Best,
> Carlos
> 

