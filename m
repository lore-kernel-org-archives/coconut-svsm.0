Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id C92A646515
 for <svsm-devel@coconut-svsm.dev>; Thu, 20 Mar 2025 18:21:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742491301;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32nrUOuHZmFKP/ec66Szpbu5TXfc9T8y5Gx1q1+Y1Ig=;
 b=SACXUQryECsJMwxKOq1DCZsdMDkW24MRyn+NkVl2E2WOyEWAJTD7TJxQoW33eOrhsG3QiH
 Tg3QPLpSNcgbLKPmuII0eESVKKKbSeB2F7fl1gDcb9qSou9ihhL2u+nR4es2wIyGXv/uID
 K739bqDYrlvhyQnfFtTmqi0HJ46tvbQ=
Date: Thu, 20 Mar 2025 17:21:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Message-ID: <Z9xOnKUgQlzhLjBu@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <CAGxU2F4DOAhiRd02V0U6So0XV528DAahzJGgQTqFFDuF3j1+xw@mail.gmail.com>
 <Z9xK6ACrFT5PTmrJ@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <Z9xK6ACrFT5PTmrJ@8bytes.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] Call for mentors/ideas for Google Summer of Code
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>, svsm-devel@coconut-svsm.dev

On Thu, Mar 20, 2025 at 06:05:44PM +0100, Jörg Rödel wrote:
> Hi Stefano,
> 
> On Thu, Mar 20, 2025 at 10:25:38AM +0100, Stefano Garzarella wrote:
> > the QEMU community has kindly offered to use their GSoC as an umbrella
> > for ideas regarding SVSM as well, since there are many students
> > interested in programming in Rust.
> 
> This is a great opportunity for our SVSM project. I have a few ideas for
> projects I am happily be the mentor for those:

FWIW, based on QEMU's history in GSoC, the ideas that tend to be
most successful are those where the scope & tasks is pretty well
defined head of time. It is good to eliminate uncertainty so that
the student doesn't get stuck/delayed by community debate over
design questions. It is also ideal if it is an idea that has
multiple logical delivery points, such that if they run out of
time, there is still a partial solution that can usefully come
out of it, even if the original end goal was missed.


> 1. Implement proper CPUID Feature Handling Framework for COCONUT
> 
> * Extend x86-cpuid project to generate Rust code usable by SVSM.
> * Integrate code into the SVSM and convert existing checks.
> * Re-work checking for required features.
> * Bring changes upstream to their respective projects (x86-cpuid and
>   SVSM).
> * (Not sure if this is big enough for a GSoC project).

Depends on the student, but it sounds like it fits in the
theme of being well defined, with staged delivery possible,
so worth persuing.

> 
> 2. Observability Device and Linux Support
> 
> * Design a protocol for SVSM observability.
> * Implement SVSM and Linux kernel + user-mode side for getting and
>   presenting the data.

This sounds quite open ended for GSoC, until the general theme of the
design is well fleshed out ahead of time, to reduce uncertainty for
the student.

> 3. Encryption and simple File-System Layer for Block Storage device
> 
> * Title says it all
> * Maybe good for someone else to mentor as well.

Having implemented LUKSv1 for QEMU myself, I would say block storage
encryption would be a major project just on its own. At least it is
well defined, because there's a good spec to target if you just pick
LUKS. LUKSv2 adds alot more functionality over LUKSv1, but it would
allow for incremental delivery if the student targets v1, and then
has the option to incrementally try as much of v2 as they find tiem for.

A filesystem layer would be be worthy project just standalone,
separate from encryption, too. Scope of it would depend whether
you're just doing a basic FAT driver, or something more complex,
or a completely custom design.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

