Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BDD051C0B91
 for <svsm-devel@coconut-svsm.dev>; Wed,  8 May 2024 21:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVyD2ZGZcY4slqtMjUxx0yQJkL9qn4er3p7HCBRspNw=;
 b=zSHUcECOrlsmrYUvi4o7jdMcu7M9V71MUFM4HsD/bFLL7P9z7bfr0EiYq5wIrnRtxwq+XjiZI7RUaOOVeeUeBZsjvr67kOMl0klqPvj+rGWf9tx4nheMfcFnlDqyu+hoKEEV3pIzr7PGBQTjczmEcrjZCaFyWSanVxhPzcSZEik=
Message-ID: <a8d2de1f-700b-73b8-55a4-578cf013dd6f@amd.com>
Date: Wed, 8 May 2024 14:40:06 -0500
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <07266b47e749267ef9a9ccbc9e8e9df78ed54857.1713974291.git.thomas.lendacky@amd.com>
 <20240508080509.GWZjsyNS0xBXUzKPUG@fat_crate.local>
 <22dc9ceb-4b16-be68-ed8e-c6a222619032@amd.com>
In-Reply-To: <22dc9ceb-4b16-be68-ed8e-c6a222619032@amd.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 05/15] x86/sev: Use kernel provided SVSM
 Calling Areas
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"

On 5/8/24 14:13, Tom Lendacky wrote:
> On 5/8/24 03:05, Borislav Petkov wrote:
>> On Wed, Apr 24, 2024 at 10:58:01AM -0500, Tom Lendacky wrote:

>>> diff --git a/arch/x86/mm/mem_encrypt_amd.c 
>>> b/arch/x86/mm/mem_encrypt_amd.c
>>> index 422602f6039b..6155020e4d2d 100644
>>> --- a/arch/x86/mm/mem_encrypt_amd.c
>>> +++ b/arch/x86/mm/mem_encrypt_amd.c
>>> @@ -2,7 +2,7 @@
>>>   /*
>>>    * AMD Memory Encryption Support
>>>    *
>>> - * Copyright (C) 2016 Advanced Micro Devices, Inc.
>>> + * Copyright (C) 2016-2024 Advanced Micro Devices, Inc.
>>
>> Are we doing that now?
> 
> Looks like a leftover change... will remove it.

Ah, there is a change in there. I guess I misunderstood your question 
because the change was cutoff from the reply. Anyway, yes, as far as I 
know, we should be doing that.

Thanks,
Tom

> 
> Thanks,
> Tom
> 
>>
