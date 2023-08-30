Return-Path: <Ashish.Kalra@amd.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id EE9422693B7
 for <svsm-devel@coconut-svsm.dev>; Wed, 30 Aug 2023 20:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDhc07M5dMmbt5BEikhUjKI1AiIgjPGSImf8p61duCc=;
 b=eeVttHDaMdHFcAuy4fdJPuUcT37d6pi4QARqEOLcmEssAf9cw0oy8vQMVsFbEzTNSgUA4QqaPK1nCb5ReMFpA65YQme96meR8wV3KmFEpgpEqMWSG34COkokVj1IG3iNv3j3oCuqymvU5H19a+a16HevGycBC91VjlgdzpXjRSY=
Message-ID: <baf07b2e-d3b1-3477-c9e3-caa3ba7b3147@amd.com>
Date: Wed, 30 Aug 2023 13:03:09 -0500
Content-Language: en-US
References: <586dd9d8-f057-5601-41ca-7c1c64083879@amd.com>
From: "Kalra, Ashish" <ashish.kalra@amd.com>
In-Reply-To: <586dd9d8-f057-5601-41ca-7c1c64083879@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: [svsm-devel] Fwd: Stage1 loader linker issues while building
 coconut svsm
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hello,

Getting this ld error while linking stage1 loader in coconut svsm:

# cc -c -o stage1/stage1.o stage1/stage1.S

# cc -o stage1/stage1 stage1/stage1.o stage1/reset.o -nostdlib 
-Wl,--build-id=none -Wl,-Tstage1/stage1.lds

/usr/local/bin/ld: stage1/stage1.o: relocation R_X86_64_32 against 
`.startup.text' can not be used when making a PIE object; recompile with 
-fPIE
/usr/local/bin/ld: failed to set dynamic section sizes: bad value


When i link with -no-pie, ld works fine.

The stage1 loader code looks to be doing all relative addressing, i 
don't see any absolute addresses, compiling is not giving any issues anyway.

Also, ld is version 2.40:

$ ld --version
GNU ld (GNU Binutils) 2.40

Thanks,
Ashish
