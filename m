Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 19D31269816
 for <svsm-devel@coconut-svsm.dev>; Thu, 31 Aug 2023 12:26:07 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CB7AD21863
 for <svsm-devel@coconut-svsm.dev>; Thu, 31 Aug 2023 10:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693477566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EsKmLbLWEIYWdfmbXRl5cqTMkvRLmcZ441BVSZTknTo=;
 b=Px6IN8vakis5CLoBNnvwaMhwYwZCaSsmUUVdxSdcsJSak5vOvJael93icjxEREcoiCd/IB
 pzhyDW3e01bF+Duo0O7B+8Xt+gFkkotQOk2jxdZnt1csjxAUH8SbYrev8YmqcvFCU/Bn27
 gDoiGJ6Tk23LvBz1HWjQ1z+ZgysBvUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693477566;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EsKmLbLWEIYWdfmbXRl5cqTMkvRLmcZ441BVSZTknTo=;
 b=pN2ZqXSqemspBNhINSPulpBqQy/AIx1Ezm4vW9WoKWfQgzSJh3NjYJvocKfDVS6taOhDpM
 sYPQypV2ui97taAg==
Received: from suse.de (jroedel.udp.ovpn1.nue.suse.de [10.163.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id BB2E22C142
 for <svsm-devel@coconut-svsm.dev>; Thu, 31 Aug 2023 10:26:06 +0000 (UTC)
Date: Thu, 31 Aug 2023 12:26:05 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZPBqvbMM28sdqewQ@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [RFC] SVSM Development Call
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

I talked to a couple of people recently about our SVSM project and the
idea came up to schedule a semi-regular call where the community can
sync on development and direction of the project.

It also fits my wish to be more transparent about our direction and work
and helps move discussions out of private formats to a more public
community forum.

So I wanted to propose a couple of time slots and see what people think.
The idea is to have a meeting every 2 weeks, I will collect and post an
agenda beforehand and we can always cancel if there is nothing to talk
about.

Some time slots that would work for me:

                  CEST   ET     CT     PST

	Tuesday	  5pm    11am   10am   8am
	          6pm    12pm   11am   9am

	Wednesday 5pm    11am   10am   8am
	          6pm    12pm   11am   9am 

	Thursday  6pm    12pm   11am   9am

	Friday    4pm    10am    9am   7am

I have only considered slots that work well for participants joining
from America or Europe/Africa because most people I talked to live in
these areas. If people living in Asia/Australia time zones want to join
as well please let me know. We can use alternating time slots to make
this possible.

Please let me know what you think.

Thanks,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany

(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman

