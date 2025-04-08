Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 5EB0C4799F
 for <svsm-devel@coconut-svsm.dev>; Tue,  8 Apr 2025 10:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744102502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dltj4p9a/qZGCSmEnSxyU4OgaAOGlCn3qZ5R+YIdHro=;
 b=ZpF6Oan29eUiJMeWVTXzhw1k8OV3LOuBxxKy3vYjudttp0d0nyZdUOssaaIGMcYVSUHNXB
 M7qkpxnSGYg3EK51+Zl8GyCyouo9YWhWDStP7+5KLw9YlhfE471XwcC9SPeq6bhFI/WRl6
 PcB+b2sz3FQmZTLYelnEhgF9je8Ozao=
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-e6dfe7fe81aso7865349276.2
 for <svsm-devel@coconut-svsm.dev>; Tue, 08 Apr 2025 01:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <Z/Qrq8iBBt4Dgz6J@AUSJOHALLEN.amd.com>
In-Reply-To: <Z/Qrq8iBBt4Dgz6J@AUSJOHALLEN.amd.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 8 Apr 2025 10:54:48 +0200
Message-ID: <CAGxU2F5M50aeP-3qs8NU5uhUeBSZ=c=xEb3BqCrDiQCTiLX=7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [svsm-devel] Using crates in SVSM kernel
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: John Allen <john.allen@amd.com>
Cc: svsm-devel@coconut-svsm.dev

Hi John,

On Mon, 7 Apr 2025 at 21:47, John Allen <john.allen@amd.com> wrote:
>
> Hi all,
>
> I am new to the project and embedded rust in general. I'm working with
> Pankaj G. on SVSM support for SNP live migration and I'm starting to
> sketch out some code for key exchange, but I'm learning that many crates
> available in non-embedded rust depend on std or on OS abstractions. For
> example, I want to generate a ecdsa p384 key using the p384 crate, but
> this depends on "get_random" which relies on a whitelist of supported
> targets to determine the rng method. This is just one of several crates
> that I would have liked to use, but depend on std or are incompatible
> with the "x86_64-unknown-none" target.

Yep, the dependency must support a way (usually a feature) to enable
`no_std` support.

What I have seen so far is that crates usually support 2 features (or
just one of them used to discriminate): `std` and `alloc`. `std` is
enabled by default and `alloc` must be enabled to support no_std,
disabling the default features.

>
> What is best practice when it comes to including libraries like this?
> What options do we have here other than reimplementing functionality
> from these crates or is reimplementation the expected course of action
> in this environment?

The option is to find crates that support no_std. You can see some of
them (aes-gcm, zerocopy) in kernel/Cargo.toml

I suggest you to take a look at
https://github.com/coconut-svsm/svsm/pull/528 where we added several
dependencies that supports no_std like the p384 crate that you
mentioned and the rdrand crate for the rng method:
https://github.com/coconut-svsm/svsm/pull/528/files#diff-45b9953e854edc633b513d9ce5dbb79628995bd5fc7f8880372d76bb4fffa0fd

Thanks,
Stefano

