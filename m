Return-Path: <clopez@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id CA02A26923D
 for <svsm-devel@coconut-svsm.dev>; Wed, 30 Aug 2023 21:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693422080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmhD5WMGqdXmOLyTfOxnbhnI0IH0DF6Z1nX1xOhoYtA=;
 b=I4JtcW93njkv0uLqhLaTQU5OUO08XEbuCWKN/TuAKy70iKrx3kmiTZ0AcMy+OX/33rqpKv
 UNU5xaY0ke8wWZrC68NW7LjlUlwxVU90157M8lOOa8nlhWF4yk0+pkP5+3Rg/3wDFAaAZc
 dQSLp82KnxvjnHyJbKUe0fXexoVnMmM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693422080;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmhD5WMGqdXmOLyTfOxnbhnI0IH0DF6Z1nX1xOhoYtA=;
 b=cEcFsOeD+NnwRnrWkkL108c5nR6CR0MyFcy+UNuqeszBApp/UVgfiyF3+VyPnST5c9lUm/
 DhW/FO9sjXRQKtBw==
Message-ID: <47b87e65-b504-4c58-8452-e50b8f829e34@suse.de>
Date: Wed, 30 Aug 2023 21:01:19 +0200
MIME-Version: 1.0
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
References: <586dd9d8-f057-5601-41ca-7c1c64083879@amd.com>
 <baf07b2e-d3b1-3477-c9e3-caa3ba7b3147@amd.com>
Content-Language: en-US
In-Reply-To: <baf07b2e-d3b1-3477-c9e3-caa3ba7b3147@amd.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] Fwd: Stage1 loader linker issues while building
 coconut svsm
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"; format="flowed"

Hi,

On 30/8/23 20:03, Kalra, Ashish wrote:
> Getting this ld error while linking stage1 loader in coconut svsm:
> 
> # cc -c -o stage1/stage1.o stage1/stage1.S
> 
> # cc -o stage1/stage1 stage1/stage1.o stage1/reset.o -nostdlib 
> -Wl,--build-id=none -Wl,-Tstage1/stage1.lds
> 
> /usr/local/bin/ld: stage1/stage1.o: relocation R_X86_64_32 against 
> `.startup.text' can not be used when making a PIE object; recompile with 
> -fPIE
> /usr/local/bin/ld: failed to set dynamic section sizes: bad value
> 

This is a known issue with ld [0], I think it should work with ld 2.39.

> When i link with -no-pie, ld works fine.
> 
> The stage1 loader code looks to be doing all relative addressing, i 
> don't see any absolute addresses, compiling is not giving any issues 
> anyway.

Perhaps we should add it to stage1 for now. I had to do the same thing
for stage2 and the SVSM kernel in my latest PR [1] for everything to
work.

Best,
Carlos

[0] https://github.com/coconut-svsm/svsm/issues/72
[1] https://github.com/coconut-svsm/svsm/pull/81

-- 
Carlos López
Security Engineer
SUSE Software Solutions
