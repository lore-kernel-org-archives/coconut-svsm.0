Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 9D8C41C9400
 for <svsm-devel@coconut-svsm.dev>; Mon, 29 Apr 2024 15:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLo8u6qlPWvt0gyKFhT0873gJzWXpBMD9y2XQjtldxw=;
 b=4jaUHWoKF6HEplvzYEMNCNVhCv0P9fBaRvilQPw6BZiybZK1NdARXX3iw/Lgi7YIuY2lSKgXvyDrc/QrQSiWgVpqidQ06o/M+By1z/zoGb7LMEKa2zEF6vDO/idodqsv+IlCGgKm6o8cFaGwo1mcaPzcSypxeTHCZCL4Ti4GsaI=
Message-ID: <4fd88c1c-6100-254e-ceec-98a4bcfa015c@amd.com>
Date: Mon, 29 Apr 2024 08:26:49 -0500
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <53e67e416fb4da085f32d8a3626c5c6e656554f9.1713974291.git.thomas.lendacky@amd.com>
 <662c2147c4fa3_b6e02948d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <662c2147c4fa3_b6e02948d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 12/15] fs/configfs: Add a callback to
 determine attribute visibility
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>

On 4/26/24 16:48, Dan Williams wrote:
> Tom Lendacky wrote:
>> In order to support dynamic decisions as to whether an attribute should be
>> created, add a callback that returns a bool to indicate whether the
>> attribute should be displayed. If no callback is registered, the attribute
>> is displayed by default.
>>
>> Cc: Joel Becker <jlbec@evilplan.org>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
>> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>> ---
>>   fs/configfs/dir.c        | 20 ++++++++++++++++++++
>>   include/linux/configfs.h |  3 +++
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
>> index 18677cd4e62f..463e66258507 100644
>> --- a/fs/configfs/dir.c
>> +++ b/fs/configfs/dir.c
>> @@ -580,6 +580,7 @@ static void detach_attrs(struct config_item * item)
>>   static int populate_attrs(struct config_item *item)
>>   {
>>   	const struct config_item_type *t = item->ci_type;
>> +	struct configfs_group_operations *ops;
>>   	struct configfs_attribute *attr;
>>   	struct configfs_bin_attribute *bin_attr;
>>   	int error = 0;
>> @@ -587,14 +588,33 @@ static int populate_attrs(struct config_item *item)
>>   
>>   	if (!t)
>>   		return -EINVAL;
>> +
>> +	ops = t->ct_group_ops;
>> +	if (!ops) {
>> +		struct config_group *g = item->ci_group;
>> +
>> +		/*
>> +		 * No item specific group operations, check if the item's group
>> +		 * has group operations.
>> +		 */
>> +		if (g && g->cg_item.ci_type)
>> +			ops = g->cg_item.ci_type->ct_group_ops;
> 
> Oh, I would not have expected to need to consider any alternate group
> ops for attribute visibility beyond t->ct_group_ops. However in my RFC
> example I made this mistake:

Right, that's the question. Do you use the default group ops that are 
created for TSM report or do you require the ops be part of the 
attributes. It is definitely easy to do the latter.

> 
>    static struct configfs_group_operations tsm_report_group_ops = {
>           .make_item = tsm_report_make_item,
> +        .is_visible = tsm_report_attr_visible,
> +        .is_bin_visible = tsm_report_bin_attr_visible,
>    };
>   
> Which in retrospect is the wrong level, and I suspect only reachable if
> you do the the above awkward indirection ("ops =
> g->cg_item.ci_type->ct_group_ops"). Instead, I was expecting symmetry
> with sysfs where the object that carries ->attrs also carries
> ->is_visible, so something like this:
> 
> + static struct configfs_group_operations tsm_report_attr_group_ops = {
> +         .is_visible = tsm_report_attr_visible,
> +         .is_bin_visible = tsm_report_bin_attr_visible,
> + };
> 
>    const struct config_item_type tsm_report_type = {
>            .ct_owner = THIS_MODULE,
>            .ct_bin_attrs = tsm_report_bin_attrs,
>            .ct_attrs = tsm_report_attrs,
>            .ct_item_ops = &tsm_report_item_ops,
> +         .ct_group_ops = &tsm_report_attr_group_ops
>    };
>    EXPORT_SYMBOL_GPL(tsm_report_default_type);
> 
> ..because is_visible() at the g->cg_item.ci_type->ct_group_ops level
> would seem to mean parent directory visibility which is mismatched.
> 
> However as I stare at this a bit more it sinks in that configfs "group"
> != sysfs "group". So I am open to the suggestion that ci_item_ops is the
> right place to house item attribute visibility callbacks, or even a new
> "ci_attr_ops" expressly for this purpose. Either way my expectation is
> that config_item_type can get to the visibilty callbacks for its
> attributes without needing to traverse any other groups or items.

I'll update the patchset to do that.

Thanks,
Tom

> 
