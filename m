Return-Path: <clopez@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 93BAF1A166C
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 15:51:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694613087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPA9SZCQpapIj36a+dEcZ/cy+o2VyFHMqcybOuL60FI=;
 b=IAQ0rs+MF5SHZdC24jxdM0oeHsh1Jimc+NAMZfpQLebfIad/L4TqZ585Z1PvOSWiYIX1iK
 8qyUubSchqbg7CsoNcfTrUX/Gs4lDOWO4XKfB47diM/BN86Be8TynzerAll2MdEXOYFIUS
 SBVNjM0t004zq8M9UCdsqd6TsDX61OY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694613087;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPA9SZCQpapIj36a+dEcZ/cy+o2VyFHMqcybOuL60FI=;
 b=Ad7QHElKOjfNziH++/uSvLsrNqkXlIdq+cuuun89ldiulrHV57XP1fjFpSF/3j/0W/I80z
 hWVDaWEbGgDETdBw==
Message-ID: <9925f6b4-5b18-4cc9-b420-03ed3e1128cc@suse.de>
Date: Wed, 13 Sep 2023 15:51:26 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <ZQGe5nq8rMWujAY9@suse.de>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <ZQGe5nq8rMWujAY9@suse.de>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] SVSM Call Agenda Sept. 13th
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

Hi,

On 13/9/23 13:37, Jörg Rödel wrote:
> Hi,
> 
> here is a rough agenda for todays inaugural SVSM development call. Feel
> free to reply to this email with additional agenda items you want to see
> covered.

I might have missed it, but is there a meeting link somewhere?

Thanks
Carlos

-- 
Carlos López
Security Engineer
SUSE Software Solutions
