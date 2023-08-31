Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 5FB4026972E
 for <svsm-devel@coconut-svsm.dev>; Thu, 31 Aug 2023 11:14:35 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D2BC61F853
 for <svsm-devel@coconut-svsm.dev>; Thu, 31 Aug 2023 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693473274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=geKEj1w1bZA6KJ3uMI2P9PiNpONx72kB0J8C/eEjPjw=;
 b=FqWj7j8zSA7TJqZuBgXHpDxFFL3TllyLdpUWtt7TChzB4JpURIu/8rScolR3PgGin3G8q4
 zTNskMsJC61LTCLBTR/spcDNftppKB/QBDQAKRLZDTzcYXE1un31b6p+Nng7saPyEtUhRm
 sLG5H2RPbKu0fwvpFM7P/SDxFEA2wf0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693473274;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=geKEj1w1bZA6KJ3uMI2P9PiNpONx72kB0J8C/eEjPjw=;
 b=r+dSsBgCp9qBUscKEgFCCxS/v/WVIrYq41/kpEh1JLuZV1HbDuFPKNnf+u9ujKIyTG0bOq
 3r/kzoKgy1C7qcAg==
Received: from suse.de (jroedel.udp.ovpn1.nue.suse.de [10.163.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C16DD2C142
 for <svsm-devel@coconut-svsm.dev>; Thu, 31 Aug 2023 09:14:34 +0000 (UTC)
Date: Thu, 31 Aug 2023 11:14:33 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZPBZ-QTrz85YkEbQ@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] Coconut now builds with rust-stable
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

I just tested and merged

	https://github.com/coconut-svsm/svsm/pull/81

which, due to the awesome work of Carlos López, makes all necessary
changes to build Coconut-SVSM with rust-stable.

One prerequisite for that change was to get rid our our custom build
target and switch to the generic x86_64-unknown-none target. This means
you need to add this target to your rust installation from now on. On my
side all I had to do was

	$ rustup target add x86_64-unknown-none

to successfully build the SVSM after this change.

Have a lot of fun,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany

(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman

