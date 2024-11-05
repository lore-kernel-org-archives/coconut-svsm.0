Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id F34AD2A8B28
 for <svsm-devel@coconut-svsm.dev>; Tue,  5 Nov 2024 12:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730806852;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9eWeM1BTG9FgAvd1DLAavIdeEaqUgToNeoUXU9Y2UG0=;
 b=G6igpzNz9aCnGliLTmjEJV5VVLOStQlqJAtVns7eOimiUUd1mDP2KWbKqneFJEBdc3bpV4
 OuRAvOP2e4odO6Ag/9ssIt+eKC/eViYyZZO8Dpg128HyH3Bfh39BNYavMvLfeM2WdLYSCZ
 kCoxpjxr0p/+Fs1QCHUO9Ke5y3jJNTs=
Date: Tue, 5 Nov 2024 11:40:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Message-ID: <ZyoEPMNhmjWLwY7A@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <Zynjpg7NdAj8sePr@8bytes.org>
 <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
MIME-Version: 1.0
In-Reply-To: <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] [RFC] COCONUT-SVSM Release Process
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, svsm-devel@coconut-svsm.dev

On Tue, Nov 05, 2024 at 12:23:42PM +0100, Stefano Garzarella wrote:
> On Tue, Nov 05, 2024 at 10:21:42AM +0100, Jörg Rödel wrote:
> > ## Release Naming
> > 
> > The naming convention for releases is defined as follows:
> > 
> > * `[DR]YYYY.MM[.X[-rcX]]`
> > 
> > Each release starts with either the letter `D` for development releases or `R`
> > for stable releases.
> > 
> > Following the initial letter is a year.month marker of the year and month the
> > final release is expected to happen. A release name ending after the marker is
> > a development or final release.
> > 
> > After the year.month marker of a release there can be an optional `-rcX`,
> > where the `X` is an increasing number starting at `1`.If present this marks
>                                                        ^ missing space
> > release candidates.
> > 
> > Alternatively there can be a dot after the year.month marker, followed by an
> > increasing number starting at `1`. These release names mark a release update.
> > 
> > Some examples of valid release names: `D2024.12`, `R2025.03-rc1`, `R2025.03`,
> > `R2025.03.2`. Note that development releases always end after the year.month
> > marker.
> 
> My concern is having two types of release in the same month, e.g.
> R2025.03 and D2025.03.
> 
> How do we know which one happened sooner or later?

At the RPM packaging level,  the "R" release will always compare as
newer than the "D" release, simply because the "R" is larger than
"D" in ascii.

I'd really discourage from using any letters in the main part of
the version numbering scheme.

It is pretty unusual practice, except where used as a suffix eg
"-rcNN" or "-g<HASH>", and so is liable to have unhelpful / unexpected
ripple effects like the above version comparison behaviour.

> I'm not sure if using YYYY.NN is better, where NN is a counter shared
> among all release types (D or R).
> 
> 
> Another option is to increase the counter only for a stable release
> (or use the month in this case), and for development releases, add a
> few digits of the SHA-1 of the commit, something like this:

If you use a "NN" counter instead of month, then you can follow the
approach that even numbers are stable releases and odd numbers are
development releases. This is a simple rule to understand and has
well defined version comparison behaviour

> 
> R2025.03
> D2025.03-g9ec10216
> D2025.03-g5f4987a1
> D2025.03-gbb6e9222
> R2025.04
> 
> Or just use the year and SHA-1 for development releases:
> 
> R2025.03
> D2025-g9ec10216
> D2025-g5f4987a1
> D2025-gbb6e9222
> R2025.04

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

