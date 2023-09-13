Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id C57171A14D0
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 13:37:11 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 864D0218EB
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694605031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sbx+7mZnK7foqRj9VPDS2VqWon8sp6z0zv4ez46KViE=;
 b=qf4GWSv8z+XB7pwPlcP6qzH19+vH89o0EPrSj6D16BX6w8mSyOP3fX7XOWFjZppxCxFwas
 gQEyOWwYIybf8IYTrDsJymtEVBiHh45uFQJfvayWRCWdpknm86Z38elup4BYoOKwLs+O4I
 /HAOp+qOtitLP8jb0YvYDVYGz6E5Hbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694605031;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sbx+7mZnK7foqRj9VPDS2VqWon8sp6z0zv4ez46KViE=;
 b=1GA1AkM8l26zNudBUOc6zr15E3ciqUkryGmAp+c6ggs/7p7E4jLgL+DiYn6MEoF+JRdV6N
 k2uHo2wzyRCJspBA==
Received: from suse.de (jroedel.udp.ovpn1.nue.suse.de [10.163.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6202F2C142
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 11:37:11 +0000 (UTC)
Date: Wed, 13 Sep 2023 13:37:10 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZQGe5nq8rMWujAY9@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] SVSM Call Agenda Sept. 13th
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

here is a rough agenda for todays inaugural SVSM development call. Feel
free to reply to this email with additional agenda items you want to see
covered.

	1. Introduction round. Everyone please introduce themselves and
	   tell what your interest in the SVSM is and/or what you are
	   working on for the SVSM.

	2. Development update - Current plan how to move forward
	   - CPL3 support/virtual memory management/tasks
	   - Crypto support
	   - Launch protocol
	   - ...?
	   I hope to give a short overview to the above topics and then
	   we can have an open discussion.

	3. Governance discussion - This becomes more pressing, so let us
	   discuss how we can move to a multi-maintainer model better
	   sooner than later.

	4. Open discussion/your topics :)

Have a lot of fun and see you in the meeting!

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

