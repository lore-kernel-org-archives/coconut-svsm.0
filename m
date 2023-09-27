Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 6D36B1A25B8
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 17:49:50 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DD2A61F38C
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695829789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ux2s02iVAEmnYi1JD5yLRkW9OHQkrDpkzupEZqKw6mA=;
 b=TEBBa+8uxmVJEmjykvYW+17npB2yJwA4NLlAW2YVmVctYiAHNhmWy5OyJEYoHlxQB3ibJH
 ph6tqeBl/9L+gjVWYzMiL+ABVGwK9zGncTdRd9Yb+8EUNX1BE3cz3t36KISQiCTKEnJPQT
 DoH4JTSsYvBkVphEL1SPJjxo+gE7gmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695829789;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ux2s02iVAEmnYi1JD5yLRkW9OHQkrDpkzupEZqKw6mA=;
 b=dNwSP4FdEpvK90AQmhGtAyaJKhcKwIGN1i0pUcKRk7372tLJAB+D+YLNy5hcYIQPOE9puf
 zhXx03ChwCD97ZDg==
Received: from suse.de (jroedel.udp.ovpn1.nue.suse.de [10.163.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B667D2C19D
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 15:49:49 +0000 (UTC)
Date: Wed, 27 Sep 2023 17:49:48 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZRRPHOlDQz4O-CoS@suse.de>
References: <ZRGfRVgczigX_tyR@suse.de>
 <ZRQb6WDRz3q1F4Jg@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZRQb6WDRz3q1F4Jg@suse.de>
Subject: Re: [svsm-devel] SVSM Call Agenda for Sept. 27th
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"

Almost forgot, there is another item for today:

On Wed, Sep 27, 2023 at 02:11:21PM +0200, Jörg Rödel wrote:
> 	1. Development update
> 	
> 	   What happened since last meeting. Everyone is encouraged to
> 	   give their update as well about what they are working on and
> 	   what progress was made.

	1.5. Upcoming update of support repositorys for Linux kernel and
	     QEMU.

	     Soon we will update the base repos for the Linux host and
	     guest kernel and QEMU that are used to run the SVSM.

> 	2. Rust smart pointers and usage of alloc crate
> 
> 	   There are several problems with the usage of the alloc crate,
> 	   which could be solved by using unstable features. But we just
> 	   switched to stable Rust for a good reason. So I like to
> 	   discuss how to move forward.
> 
> 	3. Module runtime discussion
> 
> 	   This started on the mailing list and questions came up about
> 	   which runtime to use and how to get there (e.g. which libc to
> 	   use).
> 
> 	4. Governance discussion - Continued
> 
> 	   This ended very abruptly last time. Let's continue in this
> 	   meeting.
> 
> See you at 6pm CEST/9am PST at
> 
> 	https://meet.opensuse.org/coconutsvsm

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany

(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman

