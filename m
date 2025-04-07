Return-Path: <John.Allen@amd.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 08790452D5
 for <svsm-devel@coconut-svsm.dev>; Mon,  7 Apr 2025 21:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SO2OWzYJ5fjwg+QYaMG63bN+ncKZzBDYKOYmHhADUNA=;
 b=ebyIRHkmKoAL7IUGRGcphJfNIVXJJIlbMr5piHNimje0ONh0isGocnCqKdiBa2syRawB6s5zA90GEUkc2hkfbIqc+iNovsv1DOGv996fdGt4Y8UMo7otHvsK4N3RSQO1YIUIBMSMtZQIz8PpCwCKxwkR6/v8AQ0180xqUHcHYqs=
Date: Mon, 7 Apr 2025 14:46:51 -0500
From: John Allen <john.allen@amd.com>
Message-ID: <Z/Qrq8iBBt4Dgz6J@AUSJOHALLEN.amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
MIME-Version: 1.0
Subject: [svsm-devel] Using crates in SVSM kernel
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

I am new to the project and embedded rust in general. I'm working with
Pankaj G. on SVSM support for SNP live migration and I'm starting to
sketch out some code for key exchange, but I'm learning that many crates
available in non-embedded rust depend on std or on OS abstractions. For
example, I want to generate a ecdsa p384 key using the p384 crate, but
this depends on "get_random" which relies on a whitelist of supported
targets to determine the rng method. This is just one of several crates
that I would have liked to use, but depend on std or are incompatible
with the "x86_64-unknown-none" target.

What is best practice when it comes to including libraries like this?
What options do we have here other than reimplementing functionality
from these crates or is reimplementation the expected course of action
in this environment?

Thanks,
John
