Return-Path: <Pankaj.Gupta@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::610])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id DA157454B4
 for <svsm-devel@coconut-svsm.dev>; Wed, 12 Mar 2025 10:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/Dm6dvWXa5QTJD/HlONXR0EAGTvqCh5EROm6IEkgI8=;
 b=49CeXApedwa/BrzusDQ9N+7qFwHd1+7LQaG1GqxAA10l+E56CBJux0gMizYHzJ+vzBrhhrxR44IZbuLcsx+SMMgMX1ywtPhVAQe6b/MaPc2RjDvpUPhwvg0kWIPEu/2ohbs8ODeQMPD/9wN56MVfZfsuX8bfI5NcDp9TEC8ozc4=
Message-ID: <96c84424-5d2d-4bdd-8e48-ec217d0a41db@amd.com>
Date: Wed, 12 Mar 2025 10:48:17 +0100
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
References: <Z9FSCnYWkV0g12R0@8bytes.org>
 <8c98c480-56b4-4fd0-af54-ae4d79cb1fbd@amd.com>
Content-Language: en-US
In-Reply-To: <8c98c480-56b4-4fd0-af54-ae4d79cb1fbd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] SVSM Host Kernel KVM Update Required
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, svsm-devel@coconut-svsm.dev


>> As some of you already noticed there is a regression with the current
>> SVSM tree, as it does not boot the SVSM-kernel anymore on KVM with
>> SEV-SNP hardware. The problem was in our host kernel, for which I just
>> merged a fix. So please update your host environments with the updated
>> kernel if you experience this problem.
>>
>> The reason for the breakage was a PR to unconditionally compile in the
>> shadow-stack code in all builds and do detection at runtime.
> 
> Would you mind sharing the #PR? Now, I am wondering why I did not notice 
> any no boot scenario at all.

I think i got it.

"cpu: compile for shadow stack support by default (PR #630)"

Thanks,
Pankaj

