Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 5E6401C74B1
 for <svsm-devel@coconut-svsm.dev>; Mon, 15 Apr 2024 22:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ip9zoYwq2tHposTIs3lNXTJyAww9VNhk8Y8ABOEht4=;
 b=Bn+yEgDhyo3eS1gDQZ6Om8rKViM5eL9TmpNTElcrbRlmJ23khyvRtfSxVbaJYG8ReJoFcaWySuD8xS28uJi+bATysX25bserbz34xWgk71AreW/sZujFjDrobzACUjUVULst+8IbKxSGAd+pMxwOUCqD4WIwFgClBP9ObQseDoo=
Message-ID: <490a6a10-47d0-0689-432a-cbf22de11ad6@amd.com>
Date: Mon, 15 Apr 2024 15:13:14 -0500
Content-Language: en-US
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <67893f352bc54de61160bfe251cba0bdf0431f37.1711405593.git.thomas.lendacky@amd.com>
 <1f6f4477-0f2a-434a-8c89-3b5d51d61581@linux.intel.com>
 <19d69960-e548-a2e6-87d9-c463f2851613@amd.com>
 <e286883d-40ef-d749-26a8-7ec6fbd81eae@amd.com>
 <81d05bd9-ef8f-4a3a-a5df-384a82be49f5@linux.intel.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <81d05bd9-ef8f-4a3a-a5df-384a82be49f5@linux.intel.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 13/14] x86/sev: Hide SVSM attestation
 entries if not running under an SVSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"; format="flowed"

On 4/15/24 14:48, Kuppuswamy Sathyanarayanan wrote:
> Hi,
> 
> On 4/15/24 12:16 PM, Tom Lendacky wrote:
>> On 4/12/24 10:52, Tom Lendacky wrote:
>>> On 4/9/24 13:12, Kuppuswamy Sathyanarayanan wrote:
>>>> On 3/25/24 3:26 PM, Tom Lendacky wrote:
>>>>> Config-fs provides support to hide individual attribute entries. Using
>>>>> this support, base the display of the SVSM related entries on the presence
>>>>> of an SVSM.
>>>>>
>>>>> Cc: Joel Becker <jlbec@evilplan.org>
>>>>> Cc: Christoph Hellwig <hch@lst.de>
>>>>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>>>>> ---
>>>>>    arch/x86/coco/core.c        |  4 ++++
>>>>>    drivers/virt/coco/tsm.c     | 14 ++++++++++----
>>>>>    include/linux/cc_platform.h |  8 ++++++++
>>>>>    3 files changed, 22 insertions(+), 4 deletions(-)
>>>>>
>>
>>>>
>>>> Any comment about the following query? I think introducing a CC flag for this use
>>>> case is over kill.
>>>>
>>>> https://lore.kernel.org/lkml/6b90b223-46e0-4e6d-a17c-5caf72e3c949@linux.intel.com/
>>>
>>> If you don't think TDX will be able to make use of the SVSM attribute I can look at adding a callback. But I was waiting to see if anyone else had comments, for or against, before re-doing it all.
>>>
>>
>> What about something like this (applied on top of patch 13):
>>

>> diff --git a/include/linux/tsm.h b/include/linux/tsm.h
>> index 27cc97fe8dcd..5aaf626d178d 100644
>> --- a/include/linux/tsm.h
>> +++ b/include/linux/tsm.h
>> @@ -74,7 +74,20 @@ extern const struct config_item_type tsm_report_default_type;
>>   /* publish @privlevel, @privlevel_floor, and @auxblob attributes */
>>   extern const struct config_item_type tsm_report_extra_type;
>>   
>> +/*
>> + * Used to indicate the attribute group type to the visibility callback to
>> + * avoid the callback having to examine the attribute name.
> 
> Checking the attribute name will give more flexibility, right? Since it is one time
> check, it should not be costly, right?

I thought about checking the name(s), but what if in the future another 
attribute is added, then you have to remember to update multiple places. 
This way you have an enum that represents the related attributes. Is 
there a scenario where you would want to not hide all attributes that 
are related? String comparisons just seem awkward to me.

I suppose the config_item and configfs_attr could also be supplied on 
the callback if that's a requirement.

> 
>> +enum tsm_type {
>> +    TSM_TYPE_SERVICE_PROVIDER,
>> +
>> +    TSM_TYPE_MAX
>> +};
>> +
>> +typedef bool (*tsm_visibility_t)(enum tsm_type type);
>> +
>>   int tsm_register(const struct tsm_ops *ops, void *priv,
>> -         const struct config_item_type *type);
>> +         const struct config_item_type *type,
>> +         tsm_visibility_t visibility);
>>   int tsm_unregister(const struct tsm_ops *ops);
>>   #endif /* __TSM_H */
>>
> 
> Why not add a callback in tsm_ops?

That's an option, too. Either way works for me.

Thanks,
Tom

> 
>>> Thanks,
>>> Tom
>>>
