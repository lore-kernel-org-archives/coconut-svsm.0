Return-Path: <dionnaglaze@google.com>
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 060E141C52
 for <svsm-devel@coconut-svsm.dev>; Sat,  8 Feb 2025 02:25:17 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5dce1d61b44so4839353a12.2
 for <svsm-devel@coconut-svsm.dev>; Fri, 07 Feb 2025 17:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738977917; x=1739582717; darn=coconut-svsm.dev;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=66WAFqjIXzjnDlWaMzWJVsyPY3hoo6S7nm6Fq5i6Fcg=;
 b=tkRyljBQO/sz2VVMaT7T5tqbkzQ3JLjInI9gLK+Qxj1Q8zcPgY/SA6zv0yCTDGRCxZ
 q27Mg1L30v0AoaK4wDfznbiNwo8/SoMdEnrUZyiYq5KvXd5GcP6a6zXRklttgjdGdiWy
 s4Uk699iKieNuByZVzbXDy9zaXNS0ficfP9nKxtoCVmSTRw8sKJDypihMPT7T19hkS1K
 Z+SqZgQfJHPV1jzsxRBti8pFcvvOjnqwUcxpjEI9hetP6AVIEs/G04ATLSn46u8Pg4D7
 iL9eRI/I2ViONiRUB/lhk+++sowTPPgHeC3bUCcelN8lJ1zxrcg9fUH4AZK/g9kcc4EO
 RfNA==
MIME-Version: 1.0
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 7 Feb 2025 17:25:04 -0800
Message-ID: <CAAH4kHYLTCd=Bov_vyxmKPTA7-3vDJ5W4cuJ3=NLbBBX2Xq2Lw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: [svsm-devel] SVSM fTPM experiment
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

This is a full reattempt to get SVSM vTPM support into guest Linux
following Jarkko's hard constraint to use the existing stack.

Just got this building before the weekend and am being pulled away,
but if y'all want to play with it, have at it.

https://github.com/deeglaze/amdese-linux/tree/svsmftpm

I didn't look at the existing patch series, so probably it misses some
protocol nuances.

-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
