Return-Path: <clopez@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id CCE7A1A4054
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Dec 2023 12:45:37 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E70841F74C
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Dec 2023 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703677537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYaieWNtrIc8dDY2FsBWfuGk2K1bhb7tYEFCXWxJwUM=;
 b=sIcovk31If0dx7JtH51e7bWRljgAsRyoPvlS1IfcL3b5rWxI1DFEtHRLOpAvaHB0IlrZhl
 tdmQDXzNIU+wtjJYZbbgsBhBR6IIgXkli/fVdMkdPGuAvXv3sMViY1bMsWds6ydo2wbV9a
 qzzIuKigRtIzK16mtLmpw4F0ZFaF3Xw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703677537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYaieWNtrIc8dDY2FsBWfuGk2K1bhb7tYEFCXWxJwUM=;
 b=Jwvhr+bDXbJPE8ZP9OkRmT5hGxWJsrYRCecWxyWRzfEfMqMTGdm0FHI38TW2mLexbjZoam
 Eym3L2Cn8XRvJjDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703677536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYaieWNtrIc8dDY2FsBWfuGk2K1bhb7tYEFCXWxJwUM=;
 b=lvgzAFF/VvyI+yI8VEbr2L2o7FXBe0GmICq79TYLnOrmNSlV3W8Nt2nJOefSaED7RG4uHb
 3k7uffTvcZK5wBAExZ5LQClNh/Y732MjBjCOSBALPO+scZh31hvS/+58NG9LBpZGYUTqkx
 4Y8AEkA0zkAF2m+q1FWp09EyJZbmKEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703677536;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYaieWNtrIc8dDY2FsBWfuGk2K1bhb7tYEFCXWxJwUM=;
 b=z347C1YoyxpGWGYQtGzNT/ixXAOfEKAiqlv3oN4D+VlqoRKjpR+eQ7sdAbz0qiHXNNz5CI
 yz3T9vPkvnCQPbDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C331713635
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Dec 2023 11:45:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GNrNK2AOjGWEFgAAD6G6ig
 (envelope-from <clopez@suse.de>)
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Dec 2023 11:45:36 +0000
Message-ID: <b4dd62ad-7f8d-41cf-a2b5-6dd7bdb34339@suse.de>
Date: Wed, 27 Dec 2023 12:45:36 +0100
MIME-Version: 1.0
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
References: <f83d8e11-41fa-4377-a646-cb11ba51404f@suse.de>
In-Reply-To: <f83d8e11-41fa-4377-a646-cb11ba51404f@suse.de>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] Fallible allocations and smart pointers
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


Hi,

Happy holidays everyone. Just writing a short update on the topic of
smart pointers and fallible allocations, since the next SVSM call is
a couple of weeks away.

On 30/11/23 13:20, Carlos López wrote:
> I have looked into several options which I list below with their
> respective downsides. I have not tested any of them yet.
> 
> ...
> 4. Linux kernel model (copy a subset of the upstream alloc files):
>     requires maintenance to keep up with upstream, and likely means
>     only supporting a specific version of the toolchain (see [5]).

I finally went with something similar to this option. Unfortunately,
we cannot do the same thing as the kernel does, as they rely on
nightly features, and also build everything directly with rustc
(as opposed to using cargo). I simply copied a subset of the upstream
alloc crate and adapted it to have the parts of the API we need
(namely explicit allocator selection and manual error handling) and
not rely on nightly features. I think this is the simplest solution,
although it will require some maintenance on my part.

I have opened a draft PR [0] with an initial implementation of
SvsmBox, a fork of the upstream Box. It only has a subset of the
whole upstream Box API, avoiding implicit panics and the like. I
based the new code off of upstream version 1.73.

Feel free to review it if you have time. For review, I suggest taking
a look at the public API of the new alloc module via `make doc`, and
also diffing against upstream alloc (library/alloc/ path in the Rust
repository).

Best,
Carlos

[0] https://github.com/coconut-svsm/svsm/pull/196

-- 
Carlos López
Security Engineer
SUSE Software Solutions
