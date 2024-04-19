Return-Path: <clopez@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 0034F1C76CE
 for <svsm-devel@coconut-svsm.dev>; Fri, 19 Apr 2024 09:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713512333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fQI8cdd6Bt+Pf/l+gNR+/fSBp1Tn+IHepOroZvuf5o=;
 b=0dWsvjuZH/1XDwfbMcVQo6rO85jIxTtFjVja8VdPnDh6DxdrO1JTfnxKFOvFVcPet3vuye
 VzicENz1f1r1tOosXdCR2fOgCEI5Vv6B+B+a9BLvKpAZHQyLlQcr1gRWeGhIZ46pRJM9l0
 6XA6Zsw/MCqCQi6kabaf+seFKhjkjig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713512333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fQI8cdd6Bt+Pf/l+gNR+/fSBp1Tn+IHepOroZvuf5o=;
 b=N9gyJ00aA3LsQ3y+WQYKKg7b9PDqBNuAL4UzovOlreYN1RGqAZi/m+qSMFiHkC1/mUZbw/
 OPWWqQjoxZyTKCBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713512332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fQI8cdd6Bt+Pf/l+gNR+/fSBp1Tn+IHepOroZvuf5o=;
 b=eBhxifHeRkx0iCjbqhTCIIEnuQGcGR0JaXH5V9LC0sZRAtQx/Ie79HZgrtxOdYhd/1xJRZ
 RBl7iVCwh6PxVNvRCH72p4t26iFfWMtngqchuFp8L4MeR89IumWi8va76yBkCtZDs6X6pQ
 0w69BP0Hnh6Z8PFoxi5IQ0s38ZqgjM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713512332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fQI8cdd6Bt+Pf/l+gNR+/fSBp1Tn+IHepOroZvuf5o=;
 b=ZHEBhUbJ0rshe8eeaUW8dyc1MDkH90l3U57d5yzeFT1DWZOhui2exEj3DbcK742++Fk68f
 R4sZvLFIuqlQA0DA==
Message-ID: <59a4efd5-b3ae-4b75-b634-d788f613dc12@suse.de>
Date: Fri, 19 Apr 2024 09:38:46 +0200
MIME-Version: 1.0
References: <1cef0323-1881-408b-8883-db3f3445c29e@suse.de>
 <81c35d2e7d280d5e6069a1651611834d754286d1.camel@ibm.com>
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <81c35d2e7d280d5e6069a1651611834d754286d1.camel@ibm.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] [RFC] moving libstpm bindings and safe
 abstractions into a separate repository
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Claudio Siqueira de Carvalho <cclaudio@ibm.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"; format="flowed"


Hi,

On 18/4/24 20:30, Claudio Siqueira de Carvalho wrote:
> On Wed, 2024-04-17 at 12:05 +0200, Carlos López wrote:
>> Hi everyone,
> 
> Hi Carlos,
> 
>>
>> I'd like to suggest that we move both the `libstpm` bindings (currently
>> in `libstpm/`) and safe abstractions (currently in
>> `kernel/src/vtpm/mstpm/`) to a separate repository.
>>
>> This new repository would contain two crates `libstpm-sys` (raw
>> bindings) and `libstpm` (safe abstractions). This follows the official
>> the recommendation in the Cargo Book [0], and mirrors the development of
>> other C-based crates. A few examples, among many:
>>
>> * libgit2-sys and git2 [1]
>> * curl-sys and curl [2]
>> * openssl-sys and openssl [3]
>> * libssh2-sys and ssh2 [4]
> 
> The *-sys recommendations seems to be applicable for packages that link to
> system libraries, which is not the case of the libmstpm.
> 

Not necessarily. Most of those examples embed a git submodule of the
upstream library (just like we do). The user may choose to build the
crate linking against the system library or the embedded copy.

>>
>> Currently we do have a separate crate for the raw bindings in our
>> ever-growing monorepo, but the safe abstractions are in the SVSM kernel
>> crate.
>>
>> This change would improve the reusability of the safe abstractions for
>> other projects, and also make it easier for third parties to find our
>> implementation.
> 
> You may want to have a look at the kernel/src/vtpm/mstpm/wrapper.rs as it would
> require some svsm/kernel functions to be visible to the libmstpm-sys.

To be honest I'm not sure why those wrappers are implemented in terms of
of these mem_allocate(), mem_reallocate(), etc. functions. As far as I
can tell we can simply use the functions in the alloc crate that call
into the global allocator (alloc::alloc::alloc(), realloc(), etc.). The
downstream user would just need to have a global allocator.

> Are there third parties interested on reusing our libmstpm?

Not that I know of.

> Thanks,
> Claudio
> 
>>
>> I'd like to take opinions from the SVSM community to see if others think
>> it's a positive change or not before starting any work. It's perhaps
>> something that could be discussed in the next SVSM call as well.
>>
>> [0]
>> https://doc.rust-lang.org/cargo/reference/build-scripts.html#-sys-packages
>> [1] https://github.com/rust-lang/git2-rs
>> [2] https://github.com/alexcrichton/curl-rust
>> [3] https://github.com/sfackler/rust-openssl
>> [4] https://github.com/alexcrichton/ssh2-rs
>>

Best,
Carlos

-- 
Carlos López
Security Engineer
SUSE Software Solutions
