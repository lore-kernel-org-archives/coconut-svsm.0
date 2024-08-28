Return-Path: <thomas.leroy@suse.com>
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id C99E4286575
 for <svsm-devel@coconut-svsm.dev>; Wed, 28 Aug 2024 15:37:56 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a83597ce5beso113783966b.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 28 Aug 2024 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1724852275; x=1725457075; darn=coconut-svsm.dev;
 h=content-transfer-encoding:to:autocrypt:subject:from
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVxFIc0CbEcNBwWGiem5Ns5I7DfQUe5ZJUxQlSNC48M=;
 b=IxjhwFYX55h34ci3ZnRZYUtOTL5ONDWNLj/uU5Wkfr98+VUuqC9ne3Ny9tMlNYp2NQ
 ZqYm2414v3ntNLolKv63dEtsMhEEMsY8lhT6ovcnR88BbEG+bfabvWlQe1hEsiAEOkWh
 bo16+USJd1fX+zetUAkWDfhsbvKrs3Wk4u+cSna32jnod7jE9GOUFcU7+zvoypP3pz1x
 JOBAipfcCgHcBGVRDeYa6Lyh9QnJc7Qho+kbAHH6j9zGuKys/0D+8Ml+Ynkmd+VtQFc/
 D8EW5m3st25T2TXSGk7iEd3/jLDtaQckEUoAVTE8mbKDq+DTnF/uOiXlNBpnJYxNhEE3
 o3hw==
Received: from [192.168.1.108] (88-177-86-171.subs.proxad.net. [88.177.86.171])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb2134c3sm2252054a12.55.2024.08.28.06.37.54
 for <svsm-devel@coconut-svsm.dev>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 06:37:54 -0700 (PDT)
Message-ID: <59a0b153-b2a5-464b-a72d-7fa7408882da@suse.com>
Date: Wed, 28 Aug 2024 15:37:53 +0200
MIME-Version: 1.0
Content-Language: en-US
From: Thomas Leroy <thomas.leroy@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: [svsm-devel] Kernel security features
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

Hi everyone,

I created an issue on Github repo [0] to start tracking down the
security features and hardening we could add to the COCONUT kernel.

The current list currently contains:
- KASLR
- Read-only GDT and IDT
- SMEP and SMAP
- Heap hardening
- Shadow stacks

This is still a draft list, maybe some features can't be implemented yet
or could also be irrelevant, so please feel free to comment on this :)

Thomas

[0] https://github.com/coconut-svsm/svsm/issues/448

-- 
Thomas Leroy
Security Engineer
SUSE Software Solutions

