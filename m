Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 04C252A99DC
 for <svsm-devel@coconut-svsm.dev>; Wed,  6 Nov 2024 09:24:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730881481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WrxXkfLnli3f4zQF6BUsV3/8EmFzZJFgBnjQXWOFdg=;
 b=OYapSIMBCHKAG+30W+QKq68W3otcvcoiekVL6r2ooRdtg6SvZ8I+pF5j54JgAvBMRoe7/e
 89uJoOKdNVnQHFZ+0Yk9uesTeVRRLy7Cu8+TDxT9KRYWmsSYD6Go7tCz3iDZHjNgLwyu0y
 CVZJDzPa7AJy/M6ft5qLuEJ1GJfVwHY=
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7b14073eabdso1049911285a.3
 for <svsm-devel@coconut-svsm.dev>; Wed, 06 Nov 2024 00:24:39 -0800 (PST)
Date: Wed, 6 Nov 2024 09:24:31 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <pkyrfuqduyjdvtdzdapbftccrdza4ddyb5w5blljqznna6o5s4@alesxq3luu56>
References: <Zynjpg7NdAj8sePr@8bytes.org>
 <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
 <ZypD1pGNxRXFjZxS@suse.de>
MIME-Version: 1.0
In-Reply-To: <ZypD1pGNxRXFjZxS@suse.de>
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
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"; format="flowed"

On Tue, Nov 05, 2024 at 05:12:06PM +0100, Jörg Rödel wrote:
>Hi Stefano,
>
>On Tue, Nov 05, 2024 at 12:23:42PM +0100, Stefano Garzarella wrote:
>> My concern is having two types of release in the same month, e.g.
>> R2025.03 and D2025.03.
>>
>> How do we know which one happened sooner or later?
>
>Stable releases are branched off at least 4 weeks before they are
>tagged, so it is safe to assume that, given a development and stable
>release in the same month, the development release will be based on a
>more recent code base.
>
>The stable and development releases also target different groups of
>users, so I wonder why it is important to know which release happened
>first?

Even as a developer, sometimes I think it is useful to know how a stable 
release and development are related. For example, it might be useful for 
some sort of initial triage of a bug discovered in a development release 
to also quickly infer which stable releases might be affected.

That said, I don't have a strong opinion on this, as I think we'll 
eventually use the git repo for bisection etc. where it's easy to figure 
out the relationship between tags.

>
>> Or do we never expect to have a stable release and a development
>> release in the same month?
>
>Stable an development releases in the same month are allowed, I do not
>want to forbid that.
>
>> I'm not sure if using YYYY.NN is better, where NN is a counter shared
>> among all release types (D or R).
>
>I'd like to avoid sharing counters between development and stable
>releases. This would indicate a relationship between these release types
>that does not exist. Each release type targets a different
>audience/use-case.
>
>> Another option is to increase the counter only for a stable release
>> (or use the month in this case), and for development releases, add a
>> few digits of the SHA-1 of the commit, something like this:
>>
>> R2025.03
>> D2025.03-g9ec10216
>> D2025.03-g5f4987a1
>> D2025.03-gbb6e9222
>> R2025.04
>
>This might turn version comparisions for package managers into a real
>nightmare. If we include the sha1 of the top-commit, we still need a
>growing number to ensure version string ordering.
>
>But I see the problem you are trying to solve, we need a way to cope
>with multiple development releases per month. This can be solved with
>adding another counter to the YYYY.MM part.

Yep, I agree.

Thanks,
Stefano

