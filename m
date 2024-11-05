Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 8358A2A903D
 for <svsm-devel@coconut-svsm.dev>; Tue,  5 Nov 2024 17:26:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730824005;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=470OQ9VwaA9F3nRqEhw17H6bA51QpLPPpc8+rRSqE0I=;
 b=dTHeY+a7/Lg8Z0Zsmp4LsRXu6FM4oeVgE8ifSy6uKCiHd2k9US6z5d93HhiVqgLN2C8OFW
 XA/7U5e7MaMjGzbnv7sbaV2Vg0JR+n7K6+MjhDma9whOBIOOFHhG6NfCQivzPcf5vF3Hf/
 F3Hxv1rxHQwG2avVjG4+Wt+cEQEp9xw=
Date: Tue, 5 Nov 2024 16:26:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Message-ID: <ZypHN-0o4XNBeUwI@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <Zynjpg7NdAj8sePr@8bytes.org>
 <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
 <ZyoEPMNhmjWLwY7A@redhat.com> <Zyo-tSnk3agmV6KV@suse.de>
MIME-Version: 1.0
In-Reply-To: <Zyo-tSnk3agmV6KV@suse.de>
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
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: Stefano Garzarella <sgarzare@redhat.com>, svsm-devel@coconut-svsm.dev

On Tue, Nov 05, 2024 at 04:50:13PM +0100, Jörg Rödel wrote:
> Hi Daniel,
> 
> On Tue, Nov 05, 2024 at 11:40:44AM +0000, Daniel P. Berrangé wrote:
> > At the RPM packaging level,  the "R" release will always compare as
> > newer than the "D" release, simply because the "R" is larger than
> > "D" in ascii.
> 
> Do you expect development and stable releases within the same package
> stream? My expectation is that distributions package the stable and
> development releases with different package names (e.g. coconut-svsm vs.
> coconut-svsm-unstable).

I can't speak for all distros, but in Fedora / RHEL we will generally
aim to ship a single stream of software, unless there's a very compelling
backcompat need to ship multiple *stable* versions.

In Fedora rawhide, we'll sometimes ship development releases, in
situations where we expect a followup stable release to be ready,
before the Fedora relase branches. The idea of this is that it
gets earlier testing of the forthcoming stable release, so we can
identify and resolve problems more quickly. This does assume that
the upstream project in question is shipping development releases
that are considered high quality, which may or may not the case.


I would flip the question around and ask why there is a need to have
distinct version number series for development vs stable releases.
It is very unusual - personally I can't think of examples of projects
doing this. A single version number series is the standard practice.

> > If you use a "NN" counter instead of month, then you can follow the
> > approach that even numbers are stable releases and odd numbers are
> > development releases. This is a simple rule to understand and has
> > well defined version comparison behaviour
> 
> Okay, that is another option. I find that slightly less intuitive, but
> since other projects do it this way I might be wrong with this and we
> actually don't need to intensively teach users about that sheme.



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

