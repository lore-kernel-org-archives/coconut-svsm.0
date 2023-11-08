Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 9A4D41A6569
 for <svsm-devel@coconut-svsm.dev>; Wed,  8 Nov 2023 08:59:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 160751F8AB
 for <svsm-devel@coconut-svsm.dev>; Wed,  8 Nov 2023 07:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699430364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/j1sqi4iJ1klyB4H9gnqIeFfQGpAAqFPwoDDCGsSR5c=;
 b=zMowMYH+MQsmKlRATUkj6aw8C4pUAilGSaJse9MHh47rrSmWekdOZdcKVCznz+kIu+6Yr8
 /vkvZipSiddNHpa7hCrAEeFB7rum8RtDWEkFgcxdLQIbhhriIsrFbiYahVm4pSloca/2lc
 vyNgjGwSq2FQjX7TwstljEkicFSOgDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699430364;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/j1sqi4iJ1klyB4H9gnqIeFfQGpAAqFPwoDDCGsSR5c=;
 b=YzuC+/DqnqLNfRbtC3iVh5nrt3oaKotK+rZeGDxxVVZTJdhQKLcvPEhp3KlQj9G2MU0/AK
 fnkYF9284uBg96Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04A71133F5
 for <svsm-devel@coconut-svsm.dev>; Wed,  8 Nov 2023 07:59:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8f1RO9s/S2XUJwAAMHmgww
 (envelope-from <jroedel@suse.de>)
 for <svsm-devel@coconut-svsm.dev>; Wed, 08 Nov 2023 07:59:23 +0000
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Message-Id: <F33FFDDF-777F-4D13-A793-0597F137864F@suse.de>
Date: Wed, 8 Nov 2023 08:59:13 +0100
Subject: [svsm-devel] Canceling todays call
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi all,

I am sorry to cancel todays call, but I am currently out sick. I will =
use the time for recovery so that we all can have productive sessions at =
Linux Plumbers next week.

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


