Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id D95421C75D1
 for <svsm-devel@coconut-svsm.dev>; Mon, 29 Apr 2024 16:28:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qowei5uThCsh+f0MlB4N5K1mPCTsTQmdzJHy4sHaxds=;
 b=ixXLpb9U7J1DrzCTnJMHZ3UVzZSXTHaBZcwrs2SDfbmt4qExrQJo9zpSAxQk8OOZFLxZdgrnyqsyFqcOpI6B0Y/km7PaXYDj1OzfL4H1njVYgXokPfQJfNk6UJyWseyDmxQ0m7qFbvZ2PysEfBGKiEnw8lJStbJyxfMD+lusLQc=
Message-ID: <33620512-a456-aa87-25d3-e15f2d3d256f@amd.com>
Date: Mon, 29 Apr 2024 09:28:22 -0500
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <e3143c1f3d0b26fcd8884c6f75644b634a7138e8.1713974291.git.thomas.lendacky@amd.com>
 <662c239680842_b6e02944b@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <f6af3a35-7ddd-7f56-d7d9-34c77647614d@amd.com>
In-Reply-To: <f6af3a35-7ddd-7f56-d7d9-34c77647614d@amd.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 13/15] x86/sev: Take advantage of
 configfs visibility support in TSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"

On 4/29/24 08:35, Tom Lendacky wrote:
> On 4/26/24 16:58, Dan Williams wrote:
>> Tom Lendacky wrote:
>>> The TSM attestation report support provides multiple configfs attribute
>>> types (both for standard and binary attributes) to allow for additional
>>> attributes to be displayed for SNP as compared to TDX. With the ability
>>> to hide attributes via configfs, consoldate the multiple attribute 
>>> groups
>>> into a single standard attribute group and a single binary attribute
>>> group. Modify the TDX support to hide the attributes that were 
>>> previously
>>> "hidden" as a result of registering the selective attribute groups.
>>>
>>> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
>>> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
>>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>>> ---
>>>   drivers/virt/coco/sev-guest/sev-guest.c |  3 +-
>>>   drivers/virt/coco/tdx-guest/tdx-guest.c | 29 ++++++++-
>>>   drivers/virt/coco/tsm.c                 | 82 ++++++++++++-------------
>>>   include/linux/tsm.h                     | 41 ++++++++++---
>>>   4 files changed, 102 insertions(+), 53 deletions(-)
>> [..]
>>> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c 
>>> b/drivers/virt/coco/tdx-guest/tdx-guest.c
>>> index 1253bf76b570..964af57f345c 100644
>>> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
>>> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
>> [..]
>>> @@ -249,6 +250,30 @@ static int tdx_report_new(struct tsm_report 
>>> *report, void *data)
>>>       return ret;
>>>   }
>>> +static bool tdx_report_attr_visible(struct config_item *item,
>>> +                    struct configfs_attribute *attr, int n)
>>> +{
>>> +    switch (n) {
>>> +    case TSM_REPORT_GENERATION:
>>> +    case TSM_REPORT_PROVIDER:
>>> +        return true;
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +static bool tdx_report_bin_attr_visible(struct config_item *item,
>>> +                    struct configfs_bin_attribute *attr, int n)
>>> +{
>>> +    switch (n) {
>>> +    case TSM_REPORT_INBLOB:
>>> +    case TSM_REPORT_OUTBLOB:
>>> +        return true;
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>
>> Why do these callbacks need @item and @attr?
> 
> It is a generic callback from configfs, so outside of TSM, an 
> implementation may find it useful to have these. But, with the code 
> change to require the callback at the attribute level, now, these can be 
> eliminated.
> 
>>
>> [..]
>>> +static bool tsm_report_is_visible(struct config_item *item,
>>> +                  struct configfs_attribute *attr, int n)
>>
>> Per the comment on where to find the is_visible() callbacks for a given
>> item type, I expect the need to pass @item here goes away when this can
>> assume that there is only one way to have is_visible() invoked for
>> @attr, right?
> 
> Yes.

But as I look closer, there is only a single ops callback pair 
(is_visible() and is_bin_visible()), so as long there is never another 
group / subdir defined under the TSM report, this works. But if another 
group is added, then the item parameter would likely be needed or the 
ops callback would have to be updated to differentiate for the vendor 
(SNP/TDX).

Thanks,
Tom

> 
> Thanks,
> Tom
> 
>>
>> Other than that, this conversion looks good to me.
