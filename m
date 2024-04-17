Return-Path: <clopez@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A9AA31C8817
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Apr 2024 12:05:25 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 916BE33ABE
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Apr 2024 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713348324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aW51khFguFt7X0/bwTqivcrVshkoqx54klH4JM6E7S0=;
 b=HhbDPaYWGlBIhWpsa8gyOxVTflPG3ZfeE+Tv1/cmKs+ntb7Mray3cqJx8Dr43Cu+a+Yqy4
 TVg0Bb9cuIVhoTMK9BljNI8zDQIFmnn2iF3tBdw9S46Y86O0mMmdIYe4eiAIXUhYb7ts25
 L71sC5Wpl7wNkoz4n1NQ++rAyz8SvGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713348324;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aW51khFguFt7X0/bwTqivcrVshkoqx54klH4JM6E7S0=;
 b=XHF1txfexu/f7rkZ78okf6kQlLLs5oJHpTHB7Z1V5NeSCKsFXSGB4KQWLETSSCu1m2VFwc
 EMY9sQeLeQ0NqXCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713348323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aW51khFguFt7X0/bwTqivcrVshkoqx54klH4JM6E7S0=;
 b=CgbFnX3fksBmSuhC8r2AkXsEayF/ORwVHWUt1q147ziLAx2nQegbQElFjbfjY8qlmX/tN3
 Yld6rHv2kmqIfy3roJZzBkU7+kRVCBM4zWVVgH4a/29ZkH+ykP5mpPt59VSg1/tcsk9LKu
 4RuiR3A7afz0DXOTfdXzekttsnR5lZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713348323;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aW51khFguFt7X0/bwTqivcrVshkoqx54klH4JM6E7S0=;
 b=JERudIauGYFP+EK+I1RjuxoCQKh/ioXFUflUgu/h+jtzKiyFvBPpGbGLyGmvg6JJCl9wAh
 2d1HxyqdjX0COuDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 761EB13957
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Apr 2024 10:05:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1EXxGeOeH2YCZgAAD6G6ig
 (envelope-from <clopez@suse.de>)
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Apr 2024 10:05:23 +0000
Message-ID: <1cef0323-1881-408b-8883-db3f3445c29e@suse.de>
Date: Wed, 17 Apr 2024 12:05:22 +0200
MIME-Version: 1.0
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [RFC] moving libstpm bindings and safe abstractions
 into a separate repository
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

I'd like to suggest that we move both the `libstpm` bindings (currently
in `libstpm/`) and safe abstractions (currently in
`kernel/src/vtpm/mstpm/`) to a separate repository.

This new repository would contain two crates `libstpm-sys` (raw
bindings) and `libstpm` (safe abstractions). This follows the official
the recommendation in the Cargo Book [0], and mirrors the development of
other C-based crates. A few examples, among many:

* libgit2-sys and git2 [1]
* curl-sys and curl [2]
* openssl-sys and openssl [3]
* libssh2-sys and ssh2 [4]

Currently we do have a separate crate for the raw bindings in our
ever-growing monorepo, but the safe abstractions are in the SVSM kernel
crate.

This change would improve the reusability of the safe abstractions for
other projects, and also make it easier for third parties to find our
implementation.

I'd like to take opinions from the SVSM community to see if others think
it's a positive change or not before starting any work. It's perhaps
something that could be discussed in the next SVSM call as well.

[0] 
https://doc.rust-lang.org/cargo/reference/build-scripts.html#-sys-packages
[1] https://github.com/rust-lang/git2-rs
[2] https://github.com/alexcrichton/curl-rust
[3] https://github.com/sfackler/rust-openssl
[4] https://github.com/alexcrichton/ssh2-rs

-- 
Carlos López
Security Engineer
SUSE Software Solutions
