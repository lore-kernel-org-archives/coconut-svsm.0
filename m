Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E761E2A98A7
 for <svsm-devel@coconut-svsm.dev>; Tue,  5 Nov 2024 17:12:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730823128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9O0Qg67JCgWzyPgiHjr3HX+dLqv3l6UkJrWkjW67qtA=;
 b=PHUSBXzFQFOCXZivvFZqZm6MsatFNQ9BeuYtwAG+92rocwkTapq67AP5hZD9gixW5wpOC6
 Xcyl1WEPJp2+szyxLp8ba8KjwqBHLCFWeBijd8SfbOT1jfpskas4G1UGCW3/EAMq/0ABOp
 TC/NjQd/HQ5aq5UnkU3QY0bZ3W6RPi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730823128;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9O0Qg67JCgWzyPgiHjr3HX+dLqv3l6UkJrWkjW67qtA=;
 b=k09XeWNYgTAgZ6YqTkm58NS97b1RcTDjFmG8FsjQB675GdUyn9aatqEUwju6RYn0/EUJXq
 l1n33P8m6J4hidDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730823128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9O0Qg67JCgWzyPgiHjr3HX+dLqv3l6UkJrWkjW67qtA=;
 b=PHUSBXzFQFOCXZivvFZqZm6MsatFNQ9BeuYtwAG+92rocwkTapq67AP5hZD9gixW5wpOC6
 Xcyl1WEPJp2+szyxLp8ba8KjwqBHLCFWeBijd8SfbOT1jfpskas4G1UGCW3/EAMq/0ABOp
 TC/NjQd/HQ5aq5UnkU3QY0bZ3W6RPi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730823128;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9O0Qg67JCgWzyPgiHjr3HX+dLqv3l6UkJrWkjW67qtA=;
 b=k09XeWNYgTAgZ6YqTkm58NS97b1RcTDjFmG8FsjQB675GdUyn9aatqEUwju6RYn0/EUJXq
 l1n33P8m6J4hidDw==
Date: Tue, 5 Nov 2024 17:12:06 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZypD1pGNxRXFjZxS@suse.de>
References: <Zynjpg7NdAj8sePr@8bytes.org>
 <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
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
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"

Hi Stefano,

On Tue, Nov 05, 2024 at 12:23:42PM +0100, Stefano Garzarella wrote:
> My concern is having two types of release in the same month, e.g.
> R2025.03 and D2025.03.
> 
> How do we know which one happened sooner or later?

Stable releases are branched off at least 4 weeks before they are
tagged, so it is safe to assume that, given a development and stable
release in the same month, the development release will be based on a
more recent code base.

The stable and development releases also target different groups of
users, so I wonder why it is important to know which release happened
first?

> Or do we never expect to have a stable release and a development
> release in the same month?

Stable an development releases in the same month are allowed, I do not
want to forbid that.

> I'm not sure if using YYYY.NN is better, where NN is a counter shared
> among all release types (D or R).

I'd like to avoid sharing counters between development and stable
releases. This would indicate a relationship between these release types
that does not exist. Each release type targets a different
audience/use-case.

> Another option is to increase the counter only for a stable release
> (or use the month in this case), and for development releases, add a
> few digits of the SHA-1 of the commit, something like this:
> 
> R2025.03
> D2025.03-g9ec10216
> D2025.03-g5f4987a1
> D2025.03-gbb6e9222
> R2025.04

This might turn version comparisions for package managers into a real
nightmare. If we include the sha1 of the top-commit, we still need a
growing number to ensure version string ordering.

But I see the problem you are trying to solve, we need a way to cope
with multiple development releases per month. This can be solved with
adding another counter to the YYYY.MM part.

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany
https://www.suse.com/

Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG Nürnberg)
