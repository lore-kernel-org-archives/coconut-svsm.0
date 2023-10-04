Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 3F1DE1A2CED
 for <svsm-devel@coconut-svsm.dev>; Wed,  4 Oct 2023 14:53:09 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 004D41F6E6
 for <svsm-devel@coconut-svsm.dev>; Wed,  4 Oct 2023 12:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696423989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oerkH9NcfCfVGnKCe4yTmUsR2r7wWhJwDcCyxm9cDZc=;
 b=yd/DzY4NuE4T+49DXAvGtxnzQggjOSkjKV1TYvWd8K0EA4j32h8pd2YxjGUNueOil9gh8E
 hRhiObZjiWu36Zx0Sxmt1UyK0IAZkaToG5WbWx+BLVG7ZXe5fHxZaqE8ooSNR4dIeWQ2X1
 5EbbJkbAv4ZzU+VRiivkOQHAHv/cUJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696423989;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oerkH9NcfCfVGnKCe4yTmUsR2r7wWhJwDcCyxm9cDZc=;
 b=ZgnDnXrhr0LpY2EWPq4MncNWr6i3L1HYTAHotR3g/N6kjumZ0FYRY2zTr9wudXWSlrMPrS
 BIyjfQc/MSNWYdBA==
Received: from suse.de (jroedel.udp.ovpn2.prg.suse.de [10.100.205.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id BCD312C142
 for <svsm-devel@coconut-svsm.dev>; Wed,  4 Oct 2023 12:53:08 +0000 (UTC)
Date: Wed, 4 Oct 2023 14:53:05 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZR1gMXzB9ccq3rch@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] SVSM Call Agenda for Oct. 4th
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

here is the agenda for todays SVSM development call:

	1. Development update
	
	   What happened since last meeting. Everyone is encouraged to
	   give their update as well about what they are working on and
	   what progress was made.

	2. CPL3 Status

	   Where we are wrt. CPL3 support and what are the next steps.

	3. Governance discussion - Continued

	   We were out of time last week, so let's try again today.

	4. Other topics

	   Feel free to propose additional agenda items during the
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
