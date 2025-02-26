Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 40F6843B87
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Feb 2025 23:40:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7+fU94nefFuizyupuoxvHSyTsGUVeN5YiZ0xKUXcQk=;
 b=UMxq/RLvStI63bg8rHfE4Sxk+2CeRt3G69gUjtYFZL6xiz9NvTIsxmaWL7BJl+ALeuDhJK8G8GUQDVvIGLwGlRVQgRsFNJ/B929DEjDd/mnWTW5JCzG2zvAwkDa+7v851d5lAps1z+dHbm1sw97wyNt5zCGhb3hcC2Ns6pjuoSY=
Message-ID: <cf792be2-56f8-653e-237d-a98787976b1d@amd.com>
Date: Wed, 26 Feb 2025 16:40:17 -0600
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: [svsm-devel] GUIDs in the GHCB and SVSM specifications
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, svsm-devel@coconut-svsm.dev

All,

There has been some talk about how the GUIDs in the GHCB and SVSM
specifications should be encoded [1]. The term GUID brings encoding
ambiguity with it.

- RFC 4122 specifies the format of a GUID/UUID and the encodingas
network byte order.

- The UEFI specification says that their GUID format is that of RFC
4122, but that the encoding is different. UEFI has time_low, time_mid,
and time_hi_and_version as little-endian encoded.

Given this, the GHCB and SVSM specifications need to be updated to
specify the expected encoding of the GUIDs.

The GHCB specification will add that the certificate GUIDs follow RFC
4122 in format and encoding (network byte order). This is based on
existing users and tools that have already (likely) been using network
byte order.

The SVSM specification, however, because support has already been added
to the Linux kernel using guid library APIs, will follow RFC 4122 in
format with an encoding of time_low, time_mid, and time_hi_and_version
as little-endian. In Linux, the guid library APIs are guid_parse(),
guid_gen(), etc.

If there are no objections, I'll make those changes.

Thanks,
Tom

[1] https://github.com/coconut-svsm/svsm/pull/541#discussion_r1963201009
