Return-Path: <clopez@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 597CE265DB8
 for <svsm-devel@coconut-svsm.dev>; Thu,  7 Sep 2023 14:29:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694089758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZfMNOtrCX9KzdsmgKliyvWiybfvhIl4+AjArrwWhlFA=;
 b=11YKeYmk8hgEQy3mxBfwinT1JW5R/lt54akghMSlEOnEF+bA00w1AgCvIyFPh7TBU7JYSh
 QLh4JgO8s3JPD9zzd4yRHYIFz56M9x+7St1g2m4xLa2zEMfnoXReKFRkg4cjBaTboS0RJk
 Ewhwtukwr7TKpwo3TbW/L4MbhhHpXG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694089758;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZfMNOtrCX9KzdsmgKliyvWiybfvhIl4+AjArrwWhlFA=;
 b=XEjcmS4ft96186+LAynH8bwW9pcquj6XLprPfnvG0KAAzML7q5tCb3AlY8aHGQwMMu5Ki/
 RmTmgMdBDVfjsqCQ==
Message-ID: <873bdb74-a67b-4fe7-a41b-ba3477fccb01@suse.de>
Date: Thu, 7 Sep 2023 14:29:16 +0200
MIME-Version: 1.0
References: <ZPBqvbMM28sdqewQ@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <ZPBqvbMM28sdqewQ@suse.de>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] [RFC] SVSM Development Call
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"; format="flowed"

Thursday would be a bit harder for me, but I could make it depending on 
the week. The rest of the slots look good.

On 31/8/23 12:26, Jörg Rödel wrote:
> Hi,
> 
> I talked to a couple of people recently about our SVSM project and the
> idea came up to schedule a semi-regular call where the community can
> sync on development and direction of the project.
> 
> It also fits my wish to be more transparent about our direction and work
> and helps move discussions out of private formats to a more public
> community forum.
> 
> So I wanted to propose a couple of time slots and see what people think.
> The idea is to have a meeting every 2 weeks, I will collect and post an
> agenda beforehand and we can always cancel if there is nothing to talk
> about.
> 
> Some time slots that would work for me:
> 
>                    CEST   ET     CT     PST
> 
> 	Tuesday	  5pm    11am   10am   8am
> 	          6pm    12pm   11am   9am
> 
> 	Wednesday 5pm    11am   10am   8am
> 	          6pm    12pm   11am   9am
> 
> 	Thursday  6pm    12pm   11am   9am
> 
> 	Friday    4pm    10am    9am   7am
> 
> I have only considered slots that work well for participants joining
> from America or Europe/Africa because most people I talked to live in
> these areas. If people living in Asia/Australia time zones want to join
> as well please let me know. We can use alternating time slots to make
> this possible.
> 
> Please let me know what you think.
> 
> Thanks,
> 

-- 
Carlos López
Security Engineer
SUSE Software Solutions
