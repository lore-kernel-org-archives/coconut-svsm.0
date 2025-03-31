Return-Path: <carlos.bilbao.osdev@gmail.com>
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 9A807471E8
 for <svsm-devel@coconut-svsm.dev>; Mon, 31 Mar 2025 21:51:02 +0200 (CEST)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-72c09f8369cso989390a34.3
 for <svsm-devel@coconut-svsm.dev>; Mon, 31 Mar 2025 12:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743450661; x=1744055461; darn=coconut-svsm.dev;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6EOAX+KLJ5/GURF/2r7R+WXp0Aa4AWIyBOv/YXtTHl0=;
 b=er4y3LtypySsEC0vdmH4acTH0XLccV0ppinvBxtMAhcFhNnJGslDtfY50/n45lTTMT
 fNl6MBTaFIL79CPkQWe6a8nVgtR/7+g48AlYKmwJi+Y8PivWwHFrH0mAH8pSmNTrDTr9
 FrXFY42Qt4wiQoXLVWyS2uNlCphXlCC+701V1nkFtyJFBOmcZTD0O3tfN+ZsDVm/waJP
 CKX0poC4w1BPikMJApF/P2tnzR7MbCVOCgfoQtUwjlBTBMkOZEKD7rVx5KabsKhR8don
 TWkRLUlcCDDG4jPvNLTcroJKT72yhGndLRh8Y5wmQboYBDAEcU9WaRcQvESckLNq4gGL
 tJ0w==
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e?
 ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-72c580cd6c5sm1591419a34.32.2025.03.31.12.50.59
 for <svsm-devel@coconut-svsm.dev>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 12:51:00 -0700 (PDT)
Message-ID: <d00778ba-ac1d-49a2-bea3-3f8f5a1b31ad@gmail.com>
Date: Mon, 31 Mar 2025 14:50:59 -0500
MIME-Version: 1.0
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] About integrating Coconut-SVSM in the cloud
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

Hey folks,

It looks like the Coconut-SVSM project has grown significantly since I last
checked the repo -- kudos to all!

I've been thinking about the practicality of integrating CoCo into the
cloud. I'd love to help in that direction and, from my experience working
for a cloud provider, several questions come to mind. I'd love to hear your
thoughts on these, both from the perspective of Coconut-SVSM and more
broadly.

1. I'm worried about the latency of encrypting guest pages, particularly at
   VM creation. Have you measured the impact on VM boot time, using a
   non-Coconut baseline? I’d be happy to run tests and share findings. That
   said, at this stage of development, my understanding is that we wouldn't
   yet see the full impact of the attestation phase -- please correct me if
   I'm wrong, maybe with vTPM that's well understood.

2. Beyond the time penalty of bringing up the CoCo guest, do you foresee
   any bottlenecks in VM creation? For example, if 200 users attempt to
   launch confidential guests simultaneously, would this be a scalability
   challenge? I also plan to give that a try.

3. Also, how would that time penalty during VM creation translate to VM
   live migration? For example, once keys are exchanged and the CoCo guest
   is ready to go, I wonder if the entire process need to be repeated
   while/after migrating nodes -- assuming an encrypted network is used?

   My guess is that only a subset of those tests _need_ to be done but that
   a more concerned guest may want to check its memory again? Now that I
   think about it, is there a requirement for destination node to match fw?

4. In some cases, customers experience guest VM crashes and request
   debugging support. Would it even be possible to analyze a core dump from
   a CoCo guest? If the guest kernel has crashed, I’m unsure whether the
   necessary keys could still be retrieved.

5. I'm very interested in this question: As a CoCo dev, is there a feature
   you wish cloud providers would offer?

6. More generally, what concerns you about enabling CoCo in the cloud? Are
   there any major challenges you anticipate? I'm probably missing stuff.

I plan to attend LSS NA and would love to better understand your stance on
these questions, so I can ask for potential answers and gather opinions on
any unresolved aspects.

Thanks so much folks!!

Cheers,
Carlos Bilbao

