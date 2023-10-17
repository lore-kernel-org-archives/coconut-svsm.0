Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A7A2B1A54A0
 for <svsm-devel@coconut-svsm.dev>; Tue, 17 Oct 2023 17:28:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43F901FF26
 for <svsm-devel@coconut-svsm.dev>; Tue, 17 Oct 2023 15:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697556495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4sexvzp/VGKNXttUFgGi42THPd6UHmh03YSKBDgcmrw=;
 b=mwoxTYoXCy4FudErRiC0Z+U4ZP+KObo/9c/Rd1KFMY8e2voRBitMSqKoe8WK332BiK7gnu
 9olXy3CcFzzx1DryuINNabDWTT5xpJmE/BJtNOh3mpzVyhi5nCAZIFzKY3Dgr62pCvcPbu
 ywCklPf/34d954DJjjFOCX16fQe72Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697556495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4sexvzp/VGKNXttUFgGi42THPd6UHmh03YSKBDgcmrw=;
 b=AuKZ8gCRaocky4auAJubjHdYqhiuYcJPTcKSgMYGhgob7y7BXeL/44Wv97rbJgSN7wgflF
 hIG6iqUCUyXJkGAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A5D313597
 for <svsm-devel@coconut-svsm.dev>; Tue, 17 Oct 2023 15:28:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1Ce5DQ+oLmVUOgAAMHmgww
 (envelope-from <jroedel@suse.de>)
 for <svsm-devel@coconut-svsm.dev>; Tue, 17 Oct 2023 15:28:15 +0000
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Message-Id: <C9D28719-3CFD-403D-B508-B8818872AAA1@suse.de>
Date: Tue, 17 Oct 2023 17:28:04 +0200
Subject: [svsm-devel] SVSM Call agenda Oct. 18th, 2023
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

Please send me your agenda items for tomorrows SVSM development call. =
For now I have two things on my list:

1. Github PR review. I would like to discuss some of the pending PRs to =
see what is missing to get them merged.
=20
The two PRs I want to talk about in tomorrows meeting are:

* Implement the attestation report feature, =
https://github.com/coconut-svsm/svsm/pull/69
* SVSM: Execute Guest OS at VMPL-3, =
https://github.com/coconut-svsm/svsm/pull/122

Please add more if you see the need for a live discussion on other PRs

2. Next steps for CPL-3 - Discuss what are the next steps and how we can =
parallelise the work.

See you all tomorrow!

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


