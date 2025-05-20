Return-Path: <Huibo.Wang@amd.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E72554BC95
 for <svsm-devel@coconut-svsm.dev>; Tue, 20 May 2025 20:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjjnR9zex4LsHPqJCHzmPGjx+s3cWCX0/wfeQD6Gqwg=;
 b=o5+O/OBI6DXZv8tzhsdHj2ZvUSoTtuiFWET7K5lQ/9rL8rdn/Ay+vO2ULeJR+i/m+4mEfNVXExPs9PGEdRzjH8lFUfnQVQNwC/iSkGEvH6hYw+mzdvngAByuanBU+xj9syl5w0q3GHSysJyYF5dctaD9uNstn86mREvmr3HbUHI=
Message-ID: <8daff046-38d3-4d69-989c-1398a0d2d46f@amd.com>
Date: Tue, 20 May 2025 11:47:36 -0700
MIME-Version: 1.0
Content-Language: en-US
From: "Melody (Huibo) Wang" <huibo.wang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: [svsm-devel] Questions about Alternate Injection and timers
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Jon Lange <jlange@microsoft.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

Hi Jon,

I have a few questions I would like to clarify with you.

1. How do you envision the whole flow of injecting a timer interrupt into an
   AI-enabled guest with a SVSM?

   Qemu+KVM enables both the PIC and APIC by default and it tries to inject IRQ 0 as a timer
   interrupt but the spec talks only about vectors 31-255 will be handled
   by the SVSM What about 0-31 and 0 especially which is the PIC timer
   interrupt line?

2. In Coconut SVSM, we do not use "Injection Notification Vector" 0x50 to
   differentiate this #HV is for SVSM or lower VMPL, instead the SVSM is
   reading the extended interrupt information from the doorbell page
   automatically. At least I don't see where in the code we use vector 0x50 to
   do the differentiation.

   I would imagine we should use this vector to see if we need to read the
   doorbell page and after that we should clear this bit. We would need to
   make sure that KVM and SVSM are "compatible" in the pending event field,
   no?


As always, thanks for the help!

Melody
 

 

 
