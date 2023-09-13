Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BCB541A154E
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 19:12:01 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 51E9121887
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 17:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694625121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UhbI+zBjZxO1X87e7gbA5M+N1SC3QRbUPyiZugLT1Vc=;
 b=M27RkEoGMfLGAvRprU85GBlcUmLA0WGF45dbnpmFp/4Xdadp55KoR1ObZIdblMw5q2z+lo
 ZsGprZloCzkJOJEkaRxMbihf+clV1Qcbx5zDCsYPkzEEZu8NogWbyTLeIfZCA21Rbxkrub
 d1DNkiRWIfXT8mdrzXjlZfqBr8IUGjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694625121;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UhbI+zBjZxO1X87e7gbA5M+N1SC3QRbUPyiZugLT1Vc=;
 b=znR3f1GQx3gKjsQ+T9jsf4nc7XiB6ECnoO8mSrbHs2Wj3UIrJvwbv4GAt9SKrs2CQoZbLu
 0FJuhlLvsea60iDw==
Received: from suse.de (jroedel.udp.ovpn1.nue.suse.de [10.163.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 364972C142
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 17:12:01 +0000 (UTC)
Date: Wed, 13 Sep 2023 19:12:00 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZQHtYKFUOP5uPwdH@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] IGVM Links
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

in the meeting we discussed using IGVM as the launch format for SVSM and
I promised to send links, so here they are. The Rust parser code is
here:

	https://crates.io/crates/igvm

And the crate with the definitions, which also serves as a
specification:

	https://crates.io/crates/igvm_defs

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

