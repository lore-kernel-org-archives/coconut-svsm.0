Return-Path: <clopez@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 508871C771F
 for <svsm-devel@coconut-svsm.dev>; Fri, 19 Apr 2024 09:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713513061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FtclJPfON6//bZPgRudG236mBF17K+nW+yKnA4e8QA=;
 b=vvcOG2dAMiPdi8xKKk8oC95pEgNXeszNoVxgiHEjHnC5h6rCo/2fsfuuGvi1tVcoHHLGy9
 UlEXOgooa81FgP2Yg5ONIhkZn4SfY9ds67A9CU9EIpY+aAM8bwPYjSDCV9JJuQiFNoXVJa
 RgFb83xFDxT6svX766BeYd5/ej0GNtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713513061;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FtclJPfON6//bZPgRudG236mBF17K+nW+yKnA4e8QA=;
 b=XzY3dH1OdXtIWitffj87V6WLittJpxI7VnZrAud1b2odhv4+JG7WiZyhKmZJVXYuDkwOQf
 NW2qq3wbtsSOweAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713513061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FtclJPfON6//bZPgRudG236mBF17K+nW+yKnA4e8QA=;
 b=vvcOG2dAMiPdi8xKKk8oC95pEgNXeszNoVxgiHEjHnC5h6rCo/2fsfuuGvi1tVcoHHLGy9
 UlEXOgooa81FgP2Yg5ONIhkZn4SfY9ds67A9CU9EIpY+aAM8bwPYjSDCV9JJuQiFNoXVJa
 RgFb83xFDxT6svX766BeYd5/ej0GNtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713513061;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FtclJPfON6//bZPgRudG236mBF17K+nW+yKnA4e8QA=;
 b=XzY3dH1OdXtIWitffj87V6WLittJpxI7VnZrAud1b2odhv4+JG7WiZyhKmZJVXYuDkwOQf
 NW2qq3wbtsSOweAg==
Message-ID: <efaff480-7221-463f-b67f-d9e721f7632a@suse.de>
Date: Fri, 19 Apr 2024 09:50:56 +0200
MIME-Version: 1.0
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
References: <1cef0323-1881-408b-8883-db3f3445c29e@suse.de>
 <81c35d2e7d280d5e6069a1651611834d754286d1.camel@ibm.com>
 <59a4efd5-b3ae-4b75-b634-d788f613dc12@suse.de>
In-Reply-To: <59a4efd5-b3ae-4b75-b634-d788f613dc12@suse.de>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] [RFC] moving libstpm bindings and safe
 abstractions into a separate repository
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Claudio Siqueira de Carvalho <cclaudio@ibm.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"; format="flowed"


On 19/4/24 9:38, Carlos López wrote:
>>> Currently we do have a separate crate for the raw bindings in our
>>> ever-growing monorepo, but the safe abstractions are in the SVSM kernel
>>> crate.
>>>
>>> This change would improve the reusability of the safe abstractions for
>>> other projects, and also make it easier for third parties to find our
>>> implementation.
>>
>> You may want to have a look at the kernel/src/vtpm/mstpm/wrapper.rs as 
>> it would
>> require some svsm/kernel functions to be visible to the libmstpm-sys.
> 
> To be honest I'm not sure why those wrappers are implemented in terms of
> of these mem_allocate(), mem_reallocate(), etc. functions. As far as I
> can tell we can simply use the functions in the alloc crate that call
> into the global allocator (alloc::alloc::alloc(), realloc(), etc.). The
> downstream user would just need to have a global allocator.
Just realized the use of the layout functions. I guess we could declare
the needed functions (malloc, free, etc.) as extern and have downstream
users implement them? Not sure if that would work.

-- 
Carlos López
Security Engineer
SUSE Software Solutions
