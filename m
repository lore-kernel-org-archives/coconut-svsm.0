Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 11D1E2A9962
 for <svsm-devel@coconut-svsm.dev>; Wed,  6 Nov 2024 09:30:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730881814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/pTBJRq+oowBVBspeRDdFDPGmQShXC2P8RekvBjioE=;
 b=iJ8VFucUOtdhjUpgtQ67xT8mn2FEtvmtHlT0wpVjkxngGhbubFHBfcDPJzImx1ndEFgBo9
 J6yvHiuiysYhcf5Pc2DnXS6ezkgjgOdx6JeCDWa/O/D8b8kfuBl4nYHn4i1YSCx0WuB8iK
 pelixstUhMHuhRTQSj+aDH92Z9RhvBw=
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-460d76f1d7eso120740741cf.2
 for <svsm-devel@coconut-svsm.dev>; Wed, 06 Nov 2024 00:30:13 -0800 (PST)
Date: Wed, 6 Nov 2024 09:30:03 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <oldkqlccn3psltlxzqyh2kj6gokuif5z5likmnbtzbl7voljzw@3s2dktl3otwk>
References: <Zynjpg7NdAj8sePr@8bytes.org>
 <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
 <ZypD1pGNxRXFjZxS@suse.de>
 <CAAH4kHbjYOPhUgqHtYUEx-5Z9jfH-Dd_r8xi5EaON2P9+nz6=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAH4kHbjYOPhUgqHtYUEx-5Z9jfH-Dd_r8xi5EaON2P9+nz6=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, svsm-devel@coconut-svsm.dev

On Tue, Nov 05, 2024 at 08:20:03AM -0800, Dionna Amalie Glaze wrote:
>On Tue, Nov 5, 2024 at 8:12 AM Jörg Rödel <jroedel@suse.de> wrote:
>>
>> Hi Stefano,
>>
>> On Tue, Nov 05, 2024 at 12:23:42PM +0100, Stefano Garzarella wrote:
>> > My concern is having two types of release in the same month, e.g.
>> > R2025.03 and D2025.03.
>> >
>> > How do we know which one happened sooner or later?
>>
>> Stable releases are branched off at least 4 weeks before they are
>> tagged, so it is safe to assume that, given a development and stable
>> release in the same month, the development release will be based on a
>> more recent code base.
>>
>> The stable and development releases also target different groups of
>> users, so I wonder why it is important to know which release happened
>> first?
>>
>> > Or do we never expect to have a stable release and a development
>> > release in the same month?
>>
>> Stable an development releases in the same month are allowed, I do not
>> want to forbid that.
>>
>> > I'm not sure if using YYYY.NN is better, where NN is a counter shared
>> > among all release types (D or R).
>>
>> I'd like to avoid sharing counters between development and stable
>> releases. This would indicate a relationship between these release types
>> that does not exist. Each release type targets a different
>> audience/use-case.
>>
>> > Another option is to increase the counter only for a stable release
>> > (or use the month in this case), and for development releases, add a
>> > few digits of the SHA-1 of the commit, something like this:
>> >
>> > R2025.03
>> > D2025.03-g9ec10216
>> > D2025.03-g5f4987a1
>> > D2025.03-gbb6e9222
>> > R2025.04
>>
>> This might turn version comparisions for package managers into a real
>> nightmare. If we include the sha1 of the top-commit, we still need a
>> growing number to ensure version string ordering.
>>
>
>A scheme we use has been YYYY-MM[-DD][-profile][-rcX]
>The profile marker is to allow for different build profiles from the same trunk.
>I don't think that releases from a SHA1 hash make sense, since I would
>always presume that cutting a release tag means creating a branch upon
>which to cherry-pick fixes. Cherry-picking on top of the named SHA1

I proposed the SHA1 just for development release which from the 
description are simply a snapshot of the main branch, so no 
cherry-picking should be done for those releases.

>hash changes the head hash and kind of ruins it.
>If you want D to mean unstable features but are not broken outright,
>I'd say to call it the unstable profile. That way you make sure to
>track experimental/unstable additions behind features that you can
>later promote to stable.
>
>I wouldn't worry too much about creating multiple canonical profiles
>at this point though.

Yep, multiple profiles can work.

Thanks,
Stefano

