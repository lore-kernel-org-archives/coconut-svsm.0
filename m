Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 96BC61C3A6B
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Jan 2024 13:48:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705495698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kuWU8iRngxF2LSPNWcIwd7MS5lbLqQKeTAauQAS6vLo=;
 b=LBm9dpd2pFpjPzjYp+VLCRug7Jva+qnRaDLK1LNkWtf+nhYcILmQuMadSKfTXCy+gONUlg
 DXKMcIQMxcL/xxrx27iM3W69osagz8ryrAdxvB0VUjFZt3JoaFCuHUpmIw/nhn09fNzJFA
 4wq0seJ6oIEYxNlIbR1DVXJqviEQlb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705495698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kuWU8iRngxF2LSPNWcIwd7MS5lbLqQKeTAauQAS6vLo=;
 b=eHhNo3Q+iNyCsKw95YCJZCZPg5BgwSZJhI2/3RI8AgoCMmTwl9IKXiLhbt/6fpaAqDt2Zg
 lInSgozNz1ZOB7Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705495698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kuWU8iRngxF2LSPNWcIwd7MS5lbLqQKeTAauQAS6vLo=;
 b=LBm9dpd2pFpjPzjYp+VLCRug7Jva+qnRaDLK1LNkWtf+nhYcILmQuMadSKfTXCy+gONUlg
 DXKMcIQMxcL/xxrx27iM3W69osagz8ryrAdxvB0VUjFZt3JoaFCuHUpmIw/nhn09fNzJFA
 4wq0seJ6oIEYxNlIbR1DVXJqviEQlb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705495698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kuWU8iRngxF2LSPNWcIwd7MS5lbLqQKeTAauQAS6vLo=;
 b=eHhNo3Q+iNyCsKw95YCJZCZPg5BgwSZJhI2/3RI8AgoCMmTwl9IKXiLhbt/6fpaAqDt2Zg
 lInSgozNz1ZOB7Dg==
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Message-Id: <6C4D2A02-3B78-4F3F-AD1A-87A1C24CB8CD@suse.de>
Date: Wed, 17 Jan 2024 13:48:07 +0100
Subject: [svsm-devel] SVSM Development Call Jan 17th, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

Hi all,

Just a reminder for todays SVSM Development call at 9am PST/6pm CET.

If you have any agenda items you want to see covered, please let me =
know. Otherwise we will just do the usual rounds of updates and Q&A.

We meet as usual at https://meet.google.com/ppv-xehx-dvb

Regards,

J=C3=B6rg R=C3=B6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstra=C3=9Fe 146
90461 N=C3=BCrnberg
Germany
https://www.suse.com/

Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)

