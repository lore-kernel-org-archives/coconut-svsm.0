Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 741651C5C04
 for <svsm-devel@coconut-svsm.dev>; Thu,  8 Feb 2024 14:14:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707398070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YeUTFo8uc1p+m9KpeASqboioBCJzdFSIMv/7Dq2+9Bk=;
 b=ot7wGwM5im6UmDmLStnbTOk45XAOIJWsLEHEp6yNSP2HZ78oDwUarYP9Y+Z1H60+RhsRsT
 QzVyZW8D8gtTC6INGp72r4htlih49zAII//QfJMlCwyo8XZOsPPnJ/dB6Yp0SGcl7tiUJJ
 wFNa74esG4b7q9W3uwGUJn9XW4Ag8YU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707398070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YeUTFo8uc1p+m9KpeASqboioBCJzdFSIMv/7Dq2+9Bk=;
 b=cR/o8+6nAQeyWFmOiLZACP5j9JCvuW5V2DRmB67W6Op8Irv/aGP9onv97BXAZ0CyRHICir
 mJQSwKqR4sDqB2Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707398070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YeUTFo8uc1p+m9KpeASqboioBCJzdFSIMv/7Dq2+9Bk=;
 b=ot7wGwM5im6UmDmLStnbTOk45XAOIJWsLEHEp6yNSP2HZ78oDwUarYP9Y+Z1H60+RhsRsT
 QzVyZW8D8gtTC6INGp72r4htlih49zAII//QfJMlCwyo8XZOsPPnJ/dB6Yp0SGcl7tiUJJ
 wFNa74esG4b7q9W3uwGUJn9XW4Ag8YU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707398070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YeUTFo8uc1p+m9KpeASqboioBCJzdFSIMv/7Dq2+9Bk=;
 b=cR/o8+6nAQeyWFmOiLZACP5j9JCvuW5V2DRmB67W6Op8Irv/aGP9onv97BXAZ0CyRHICir
 mJQSwKqR4sDqB2Bg==
Date: Thu, 8 Feb 2024 14:14:25 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZcTTsZ156ghln73W@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] COCONUT-SVSM now uses cargo workspace
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

Hi,

I spent the morning getting the transition of the COCONUT-SVSM
repository to a cargo workspace merged. There were a couple of issues to
fix, but everything should be working now. Please report any issues in
case you find them.

Also, in case you are using the pre-commit git-hook you need to install
the latest version from the main branch. This one has some updates to
correctly run all checks in the new environment.

As discussed in the SVSM development calls, I also updated the
repository to reflect the change of the project license from
MIT-OR-Apache-2.0 to MIT.

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany
https://www.suse.com/

Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG Nürnberg)
