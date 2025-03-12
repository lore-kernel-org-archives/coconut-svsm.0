Return-Path: <Pankaj.Gupta@amd.com>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 9ED7440E03
 for <svsm-devel@coconut-svsm.dev>; Wed, 12 Mar 2025 10:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNfRMlgcb/3p4FiEU2L2b8FCrykVWCOQVutM2oxG7nY=;
 b=HZSuMUQXyssmKeU9raYlCpuOGiOW1Jos/PU1RKP7sf1SQ9zH84lXoRsRo+JMU/YvCBlh2baUJvWU6skSwvBJqzQ0asSEtRiMuHPtPrwyKGeu2L7NICY1moM8ls5ZbCTxOq09iNbmLXi538jfqYYrysZLYQZtAHx6NBv5VfipFFY=
Message-ID: <8c98c480-56b4-4fd0-af54-ae4d79cb1fbd@amd.com>
Date: Wed, 12 Mar 2025 10:36:17 +0100
References: <Z9FSCnYWkV0g12R0@8bytes.org>
Content-Language: en-US
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <Z9FSCnYWkV0g12R0@8bytes.org>
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

Hi Joerg,

Thanks for the headsup!

> Hi everyone,
> 
> As some of you already noticed there is a regression with the current
> SVSM tree, as it does not boot the SVSM-kernel anymore on KVM with
> SEV-SNP hardware. The problem was in our host kernel, for which I just
> merged a fix. So please update your host environments with the updated
> kernel if you experience this problem.
> 
> The reason for the breakage was a PR to unconditionally compile in the
> shadow-stack code in all builds and do detection at runtime.

Would you mind sharing the #PR? Now, I am wondering why I did not notice 
any no boot scenario at all.

Thanks,
Pankaj

> Unfortunately this broke on KVM because our SVSM Linux kernel tree does
> still intercept all shadow-stack MSRs. So when COCONUT accesses these
> MSRs it will cause a #VC exception and the kernel panics.
> 
> My fix disables the intercepts of the shadow-stack MSRs in our host
> kernel. This is safe because Linux does only implement user
> shadow-stacks so far and that state is switched via the FPU load/unload
> path.
> 
> Regards,
> 
> 	Joerg

