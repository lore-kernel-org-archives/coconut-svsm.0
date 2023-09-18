Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id D57BE1A1900
 for <svsm-devel@coconut-svsm.dev>; Mon, 18 Sep 2023 11:35:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 618A61F892
 for <svsm-devel@coconut-svsm.dev>; Mon, 18 Sep 2023 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695029746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TXLq1udPsw7NlFNl2s7n31iJpn8E//ACUlZu0ey84I4=;
 b=eGx6zx+95WDpEQ+tItjvdbz0RqFEM8FRXKdWn2raoOOLep00GoNNLnUk2uF1+GByGcLIgo
 qC+xLlPVj1fjevp9QUEzoh/7fYjAypFDBQXmSBBAVXcK9MWnwD3oktLLLhKmQhC2LTAXMx
 HUs72O0gwjyqXBLfRCHLuqqGbGtRf8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695029746;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TXLq1udPsw7NlFNl2s7n31iJpn8E//ACUlZu0ey84I4=;
 b=tYWsTEWXXKLBg2QQX4DjFbpwv0RW8zoWnAhvHM1mHlB1YY+cXwwqelPGcRBVbgJktFgbCf
 5AqALmztGZ7WaCDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 413D413480
 for <svsm-devel@coconut-svsm.dev>; Mon, 18 Sep 2023 09:35:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ReITDfIZCGU+HAAAMHmgww
 (envelope-from <jroedel@suse.de>)
 for <svsm-devel@coconut-svsm.dev>; Mon, 18 Sep 2023 09:35:46 +0000
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Message-Id: <AD3DFF43-0B09-4AD6-86BE-E91978BA29E2@suse.de>
Date: Mon, 18 Sep 2023 11:35:35 +0200
Subject: [svsm-devel] SVSM development call
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

Apologies again for the abrupt ending of our last call. Next time we =
will try Jitsi, which will at least not throw us out in the middle of an =
interesting discussion.

Claudio requested that we have these meetings weekly for now, which if =
fine with me. Unfortunately this week does not work for me as I am =
attending OSS EU in Bilbao, but we can start a weekly schedule from next =
week on.

I will send around a Jitsi link early next week for our next call, which =
will happen at September 27th, 6pm CEST.

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


