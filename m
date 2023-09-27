Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 520F01A2556
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 14:11:23 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A61791F891
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695816682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5iorFX9bACHqAE6V6wass6af3K/CBbTzQhAxWMMRao0=;
 b=DU3tH29jQNETFvgvH+RYLMUmAnw7b+ZQuCNARq4anOk5jSvEKXRsp9GJ26Rg9ZoOEooDJk
 MWLV/c4fxEzpXSV3gulRXycpwsOLMIVqsxZBXqy3tBMBSMFEogEairfF8ZyUQB0vE9wO0A
 LOC+OIWKSDfOh6tMzy8zF3XIs83UCtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695816682;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5iorFX9bACHqAE6V6wass6af3K/CBbTzQhAxWMMRao0=;
 b=tE6PgZ2EPh8kykK8FP//z6RJ25WN1fjDOVn4J/MmJ5dm9spOzOQg5fl1aBYApLEZLdc2F4
 fuudvl4TMBNL+uDw==
Received: from suse.de (jroedel.udp.ovpn1.nue.suse.de [10.163.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 809002C142
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 12:11:22 +0000 (UTC)
Date: Wed, 27 Sep 2023 14:11:21 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZRQb6WDRz3q1F4Jg@suse.de>
References: <ZRGfRVgczigX_tyR@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZRGfRVgczigX_tyR@suse.de>
Subject: [svsm-devel] SVSM Call Agenda for Sept. 27th
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

Hi,

I received no requests for agenda items, so I put mine into the agenda
below:

	1. Development update
	
	   What happened since last meeting. Everyone is encouraged to
	   give their update as well about what they are working on and
	   what progress was made.

	2. Rust smart pointers and usage of alloc crate

	   There are several problems with the usage of the alloc crate,
	   which could be solved by using unstable features. But we just
	   switched to stable Rust for a good reason. So I like to
	   discuss how to move forward.

	3. Module runtime discussion

	   This started on the mailing list and questions came up about
	   which runtime to use and how to get there (e.g. which libc to
	   use).

	4. Governance discussion - Continued

	   This ended very abruptly last time. Let's continue in this
	   meeting.

See you at 6pm CEST/9am PST at

	https://meet.opensuse.org/coconutsvsm

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

