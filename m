Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 6F74A1A9E48
 for <svsm-devel@coconut-svsm.dev>; Tue, 21 Nov 2023 11:48:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 131332192D
 for <svsm-devel@coconut-svsm.dev>; Tue, 21 Nov 2023 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700563720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QFzFO+jfACQBaCjefj9pjQhWpRk/FgqB3yjMFFBi+Oo=;
 b=cSpdqV17SoOPegljkGREpIU4zUQyoWlHyvuVXUQQZuGZqhnWQii3hl86anzAAktWa3GntC
 OXIFwKDYPiUqu/gL3lc0Mou8MjqF4FeTPdbJd8Um7BayvMQLzBV6i1GfzFrHdYjEWVXf6E
 b1Kmd0sysTrg89fsxQmjaHmcYAQyKSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700563720;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QFzFO+jfACQBaCjefj9pjQhWpRk/FgqB3yjMFFBi+Oo=;
 b=MxEzjn/Phw5u/OBEhirMOzVy3bHoX/Jy2YgljyqLXixLfOPsl7cQ+uFpoAZF39Fxpuue54
 qckBk/aHBKg9rcCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC4F1139FD
 for <svsm-devel@coconut-svsm.dev>; Tue, 21 Nov 2023 10:48:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id au5OOAeLXGUVVwAAMHmgww
 (envelope-from <jroedel@suse.de>)
 for <svsm-devel@coconut-svsm.dev>; Tue, 21 Nov 2023 10:48:39 +0000
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Message-Id: <2F79114D-CB2D-4B82-9A6F-35F930B546E9@suse.de>
Date: Tue, 21 Nov 2023 11:48:29 +0100
Subject: [svsm-devel] No SVSM call this week
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi,

Tomorrow is a public holiday where I live and it is also Thanksgiving =
week, so there will be no SVSM call this week.

See you all on Wednesday next week.

Regards,

J=C3=B6rg R=C3=B6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstra=C3=9Fe 146
90461 N=C3=BCrnberg
Germany

Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew Myers, Andrew McDonald, =
Boudien Moerman
(HRB 36809, AG N=C3=BCrnberg)


