Return-Path: <tleroy@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 73D28284ADB
 for <svsm-devel@coconut-svsm.dev>; Thu, 29 Aug 2024 10:00:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724918426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9jnuhnx/ek+S85XEeRV26cxvgTCIKQ3BVCHcLjs9x4=;
 b=iqkicdi+DeqpErn7s2xIv8vyVaTgP1s1Ca+2Ie1UiR8x0rNOy/08toc8+Jl2dA2+EdBmUP
 ZguZz2TLZ0E6g12PYUaiKXBargqNANTMqrKPypCmZ7sReuBbksrVf6iW1qctUfNiG4ddei
 YE+ZkYpNFaBgKEBfAJSR+YQmhoKN054=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724918426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9jnuhnx/ek+S85XEeRV26cxvgTCIKQ3BVCHcLjs9x4=;
 b=RcLSe/jWrhepexA4Ie3Hr68mLXQtu8J7NJbWRQ0M+NJ0WjlyMJJjbZL2OMMaw0spMymuBs
 /u1MLYyeD/9xxWDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724918425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9jnuhnx/ek+S85XEeRV26cxvgTCIKQ3BVCHcLjs9x4=;
 b=qUmxIeoRwitDW/HB27+OEpTDGZ7HohVOSDqGKy50m+iEfjYM0fGiDpzo8fFNQqogApkrIs
 gjGVfG6qumy0N4/E/3xxQarvacs4BAzco8DNDRtVgjxAX0VR8zH1WKYOZ7iIJBR/eMv7QZ
 nNOtU/4jU1Bepud13lNhoyXBZ6F2vj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724918425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9jnuhnx/ek+S85XEeRV26cxvgTCIKQ3BVCHcLjs9x4=;
 b=OePdKvj44fFpDrsw4YC+4mHvjgIdmVKpBq24hVAAzLwirV4pQrw7w8vMO3Z1YEGSTd0Ul6
 OIC8Zu5rHKGRhTCw==
Message-ID: <1e6dc1a3-8126-499a-ae56-08b8bfd48cde@suse.de>
Date: Thu, 29 Aug 2024 10:00:24 +0200
MIME-Version: 1.0
References: <59a0b153-b2a5-464b-a72d-7fa7408882da@suse.com>
 <ZtAc_MgFsl11As6t@8bytes.org>
Content-Language: en-US
From: Thomas Leroy <tleroy@suse.de>
In-Reply-To: <ZtAc_MgFsl11As6t@8bytes.org>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] Kernel security features
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"

Thanks for your feedback Joerg :)

On 8/29/24 09:02, Jörg Rödel wrote:
> Thanks for starting this list, I think this is very relevant. The
> project already has the ground-work for KASLR. Making GDT and IDT
> read-only should be a low-hanging fruit. SMEP and SMAP is a bit more
> work, though also not that complicated.
>
> Shadow stacks is probably the hardest item to implement. What about
> KPTI, is that still necessary with recent processors? If we do KPTI then
> we also need PCID.
KPTI was also suggested my Carlos, so I appended it to the list but I'm
also unsure about it (I'll also add PCID).
If we allow an unprivileged user to run code on the same CPU, my
understanding is that KPTI would still be relevant to prevent leaking
sensitive data through side channel. However, with memory encrypted,
what exactly could an attacker leak?
Moreover, KPTI is also relevant to prevent an attacker with a powerful
primitive (like ROP, or arbitrary read/write) to access any gadgets or
memory from kernel space (however this can be bypassed on Linux by
chaining the correct gadgets).
Maybe we could try to reproduce the side-channel attacks before as a
starting analysis.

-- 
Thomas Leroy
Security Engineer
SUSE Software Solutions

