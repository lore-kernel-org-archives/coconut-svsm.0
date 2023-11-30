Return-Path: <clopez@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 04EFE1A95A6
 for <svsm-devel@coconut-svsm.dev>; Thu, 30 Nov 2023 13:20:59 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C5E81F911
 for <svsm-devel@coconut-svsm.dev>; Thu, 30 Nov 2023 12:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701346859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vQcqJ7SCuOc0K4K1/ndTiG4DvkFVv3LN+O405+odFUM=;
 b=Xe2nX2kLHH5QsfPjAuqbczJgvHwgW2p3O1niivDYf8pTO0Q4F6DyrvBfeZTzjuGefVCmfz
 J0TnhcJW0UIdDg/Z4xwHuPckuH3vbdOhJcjT5Puqc2NJOsKw3LmvhwPeGHeQ0MhccviC8n
 GHrY3DzoTqDbJReybJtDxz6lLWxabVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701346859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vQcqJ7SCuOc0K4K1/ndTiG4DvkFVv3LN+O405+odFUM=;
 b=zG8ig5BstitCYc1mhVNULPme6F/e1cUhfwCnI+6NMLh/AOWgY8ZQ4/Lxya9HHOmlzghZeZ
 pV1qb1vIqPGbM3DA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 163D713A5C
 for <svsm-devel@coconut-svsm.dev>; Thu, 30 Nov 2023 12:20:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 3OqHASt+aGXATwAAn2gu4w
 (envelope-from <clopez@suse.de>)
 for <svsm-devel@coconut-svsm.dev>; Thu, 30 Nov 2023 12:20:59 +0000
Message-ID: <f83d8e11-41fa-4377-a646-cb11ba51404f@suse.de>
Date: Thu, 30 Nov 2023 13:20:42 +0100
MIME-Version: 1.0
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] Fallible allocations and smart pointers
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"; format="flowed"

Hi everyone,

I'm writing this email to get some comments on the topic of fallible
allocations and smart pointers, which we briefly discussed during the
last development call.

At the moment we use smart pointer types in various places throughout
the codebase. Currently these include `Box` (regular heap
allocations), `Arc` (reference counted heap allocations) and `Vec`
(dynamically-sized arrays). In the future we might also end up using
`Rc` or some of the map and set flavors. These types are provided by
the alloc crate, which is part of the core Rust library.

Given the goals of the SVSM, we would want to be able to recover from
allocation failures, as simply panicking is not acceptable. These
smart pointer types currently do not have stable APIs with a failure
mode - e.g. the following:

     let foo = Box::new(MyType::new());

will panic if the global allocator can't reserve `size_of::<MyType>()`
bytes with the adequate alignment.

Once the `allocator_api` feature [0] is stabilized, we will be able to
do [1]:

     let foo = Box::try_new(MyType::new())?;

The feature would also let the caller choose a specific allocator if
several are available. Ideally, we would also like to enable
`no_global_oom_handling` to completely prevent all implicit panics.

In any case, `allocator_api` does not seem to be anywhere close to
being stabilized, which means we need a solution in the meantime,
ideally without going back to using the nightly toolchain.

I have looked into several options which I list below with their
respective downsides. I have not tested any of them yet.

1. Bring our own implementation from scratch: costly and error-prone.
2. fallible-alloc crate [2]: only provides `Box` and `Vec`, so we
    would need to build the remaining types (for example the upstream
    alloc crate builds `Arc` and `Rc` out of `Box`, and so on). Costly,
    but less so than a completely from-scratch implementation.
3. fallible-collections crate [3]: supports `Box`, `Vec`, `Rc` and
    `HashMap`, but not `Arc` (it is listed as deprecated [4], and I
    suspect the root issue might also affect `Rc`). Same issues as
    point #2.
4. Linux kernel model (copy a subset of the upstream alloc files):
    requires maintenance to keep up with upstream, and likely means
    only supporting a specific version of the toolchain (see [5]).

So, if anybody has any comments regarding the topic, or wants to
propose a different approach to the ones above, please do so :)

Regards,
Carlos

[0] https://github.com/rust-lang/rust/issues/32838
[1] https://doc.rust-lang.org/alloc/boxed/struct.Box.html#method.try_new
[2] https://docs.rs/fallible_alloc/0.2.0/fallible_alloc/
[3] https://docs.rs/fallible_collections/0.4.9/fallible_collections/
[4] https://github.com/vcombey/fallible_collections/issues/13
[5] 
https://github.com/torvalds/linux/commit/3ed03f4da06ede71ac53cf25b9441a372e9f2487

-- 
Carlos López
Security Engineer
SUSE Software Solutions
