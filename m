Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 6F2971A3342
 for <svsm-devel@coconut-svsm.dev>; Tue, 10 Oct 2023 22:43:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EAFED1F6E6
 for <svsm-devel@coconut-svsm.dev>; Tue, 10 Oct 2023 20:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696970612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J+9M8h/UC7T7OuvB92aIJ+mrFmvMujGVLGHuzRIg1U4=;
 b=cXmCUkvI4LTASwl/cx4HqUL4fqzboLo8k5VQwWYUtCmdfQjb9k3X55b8Db+254WYa4Vg3h
 Li96wBO3GHqKk53Eh+hKPjq0rnnAGx6lho8O5saYru8nwFD3Vp4x4kYgDgMnpVFwDfeYnB
 2xbtf8FhK5dh2fo8RQa4RVDsb7nC/3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696970612;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J+9M8h/UC7T7OuvB92aIJ+mrFmvMujGVLGHuzRIg1U4=;
 b=8/rpwOgnlpiXej0Uth1FXWbm+nmAJaqJK3o8gNK1tDLf1IFzeGAtxBr+S5ZKCUAu2RsmqC
 4pzNxSWOpc4Jg2AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D95481358F
 for <svsm-devel@coconut-svsm.dev>; Tue, 10 Oct 2023 20:43:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3xejM3S3JWW5CQAAMHmgww
 (envelope-from <jroedel@suse.de>)
 for <svsm-devel@coconut-svsm.dev>; Tue, 10 Oct 2023 20:43:32 +0000
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Message-Id: <F632E161-584F-42BB-8027-CE42B39DDAC3@suse.de>
Date: Tue, 10 Oct 2023 22:43:22 +0200
Subject: [svsm-devel] No call on Oct. 11th
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

I am traveling on short-notice and can't make it to the SVSM development =
call tomorrow. And as there are no urgent agenda items either I canceled =
it for this week.

Happy hacking and talk to you next week!

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


