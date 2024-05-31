Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A047F1C773F
 for <svsm-devel@coconut-svsm.dev>; Fri, 31 May 2024 20:36:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1cV9OLZzejUVJ4CFzT0bcSGiJSTXpSUEmR2+fSxUhQ=;
 b=11S+DYEXYI6RT78s9d17maJPezEvS3l8QrMzVVHHfT2e9HFQ/KsW2OSrsJ0Qv3N2iLwDyr6uKrNJoGoWooL3hsxm/Fii0w6oQJFSbbqdgm4iNB6sVUdISPoJmAMdRD0jiDyZncilBqhZK0S/UImSChamwNYRCD6KTV1KKUfvMUI=
Message-ID: <ad55da28-e5e0-a348-3cbc-d1a80d0ab2bb@amd.com>
Date: Fri, 31 May 2024 13:36:06 -0500
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <b8508f57712e3194484aa8695494eea26abe1b73.1713974291.git.thomas.lendacky@amd.com>
 <20240531125503.GEZlnIp7YobFu7g9iS@fat_crate.local>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240531125503.GEZlnIp7YobFu7g9iS@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 10/15] virt: sev-guest: Choose the VMPCK
 key based on executing VMPL
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

On 5/31/24 07:55, Borislav Petkov wrote:
> On Wed, Apr 24, 2024 at 10:58:06AM -0500, Tom Lendacky wrote:
>> +int snp_get_vmpl(void)
>> +{
>> +	return vmpl;
> 
> The vmpl doesn't change after init, right?
> 
> If so, you can make that vmpl variable __ro_after_init and drop yet

It already is __ro_after_init.

> another parrotting accessor.

The sev-guest driver needs to access it. Given it is a driver/module, I 
created the accessor rather than mark the variable EXPORT_SYMBOL_GPL(). 
Your call, I'm fine with either.

> 
>> -static u32 vmpck_id;
>> -module_param(vmpck_id, uint, 0444);
>> +static int vmpck_id = -1;
>> +module_param(vmpck_id, int, 0444);
>>   MODULE_PARM_DESC(vmpck_id, "The VMPCK ID to use when communicating with the PSP.");
> 
> Can the driver figure out the vmpck_id from the kernel directly instead
> of having to supply it with a module param?

Yes, the driver can and does figure it out. However, this module parameter 
was added in the off chance the default VMPCK gets wiped. Then you can 
reload the driver and use a different (less privileged) VMPCK.

Thanks,
Tom

> 
> This is yet another silly module param which you have to go and engineer
> into the loading and have to know what you're doing.
> 
> If you can automate that, then it is a win-win thing.
> 
> Thx.
> 
