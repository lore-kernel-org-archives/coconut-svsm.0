Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 558CD284ADB
 for <svsm-devel@coconut-svsm.dev>; Thu, 29 Aug 2024 10:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724920006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sw8Ul5k6V7PgGS3LcsqV3Nq33CNI+YmbpXxIWi4b8Pg=;
 b=d6Fn8kRPn/T30/herZkATwAyZ4/dzTcG9hobWN22yHKcJnFUi/XO8U9MmU20yovx+tvF9f
 a6sy0mIjq3FALqj26xfNhS/F8UEeD9ax6qn+5C/xgtSm8WSNakMneCsTBhCVeE2KxSXHrx
 wCQjxHVrhEkhlmZb3cMtOwOUj9V3DiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724920006;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sw8Ul5k6V7PgGS3LcsqV3Nq33CNI+YmbpXxIWi4b8Pg=;
 b=Mz1S/k5HNErMEzRz3iYyHwQFW7MWl7qmFT/5Mwo8BaVbcM/doeHsz32D0q8oRItchTEA1F
 gim30SxXIM3DUrAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724920006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sw8Ul5k6V7PgGS3LcsqV3Nq33CNI+YmbpXxIWi4b8Pg=;
 b=d6Fn8kRPn/T30/herZkATwAyZ4/dzTcG9hobWN22yHKcJnFUi/XO8U9MmU20yovx+tvF9f
 a6sy0mIjq3FALqj26xfNhS/F8UEeD9ax6qn+5C/xgtSm8WSNakMneCsTBhCVeE2KxSXHrx
 wCQjxHVrhEkhlmZb3cMtOwOUj9V3DiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724920006;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sw8Ul5k6V7PgGS3LcsqV3Nq33CNI+YmbpXxIWi4b8Pg=;
 b=Mz1S/k5HNErMEzRz3iYyHwQFW7MWl7qmFT/5Mwo8BaVbcM/doeHsz32D0q8oRItchTEA1F
 gim30SxXIM3DUrAA==
Date: Thu, 29 Aug 2024 10:26:37 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZtAwvRkCd9geJlm2@suse.de>
References: <59a0b153-b2a5-464b-a72d-7fa7408882da@suse.com>
 <ZtAc_MgFsl11As6t@8bytes.org>
 <1e6dc1a3-8126-499a-ae56-08b8bfd48cde@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e6dc1a3-8126-499a-ae56-08b8bfd48cde@suse.de>
Subject: Re: [svsm-devel] Kernel security features
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Thomas Leroy <tleroy@suse.de>
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 29, 2024 at 10:00:24AM +0200, Thomas Leroy wrote:
> KPTI was also suggested my Carlos, so I appended it to the list but I'm
> also unsure about it (I'll also add PCID).
> If we allow an unprivileged user to run code on the same CPU, my
> understanding is that KPTI would still be relevant to prevent leaking
> sensitive data through side channel. However, with memory encrypted,
> what exactly could an attacker leak?
> Moreover, KPTI is also relevant to prevent an attacker with a powerful
> primitive (like ROP, or arbitrary read/write) to access any gadgets or
> memory from kernel space (however this can be bypassed on Linux by
> chaining the correct gadgets).
> Maybe we could try to reproduce the side-channel attacks before as a
> starting analysis.

The question for KPTI is whether modern, TDX-capable Intel CPUs are
still vulnerable to the Meltdown side-channel attack. The memory
encryption will not protect against any of these side-channels, as
encryption starts at the memory controller boundary and all data in the
caches is unencrypted.

For the various Spectre attacks the situation is a bit different, as
some of those still need software mitigation which we then also need in
the SVSM.

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany
https://www.suse.com/

Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG Nürnberg)
