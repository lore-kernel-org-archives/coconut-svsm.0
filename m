Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 7E37F1C29D7
 for <svsm-devel@coconut-svsm.dev>; Fri, 31 May 2024 21:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64Zqyj+CuOpU1hL4H8KFL0kyHt6ND4QzPMOm+ooAQ4I=;
 b=J8Ez0DsfRYxVHu/zzbszKD7XOQL0SaPqCY/FZ3uzUsEPeE/snom+kk7XCSAZAlAiZUcmCswnzco0zW3R/GfHe7w3Jeq7HJLFe5OXR4h7gS5BIWrhaMhEGbwLmfq+ynU6lbEHSc9pejtMNattMRoolkSIFGGSImImounp8S7uLQM=
Message-ID: <6e597167-7e29-175d-4e69-0ccf74dedf3e@amd.com>
Date: Fri, 31 May 2024 14:16:20 -0500
Content-Language: en-US
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <e377d148acac799f6905fc544fbb8bf2ed76e078.1713974291.git.thomas.lendacky@amd.com>
 <20240531145423.GLZlnkn4JHSyh4-G8P@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240531145423.GLZlnkn4JHSyh4-G8P@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 15/15] x86/sev: Allow non-VMPL0
 execution when an SVSM is present
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

On 5/31/24 09:54, Borislav Petkov wrote:
> On Wed, Apr 24, 2024 at 10:58:11AM -0500, Tom Lendacky wrote:
>> @@ -624,8 +626,12 @@ void sev_enable(struct boot_params *bp)
>>   		 * modifies permission bits, it is still ok to do so currently because Linux
>>   		 * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
>>   		 * permission mask changes are a don't-care.
>> +		 *
>> +		 * Running at VMPL0 is not required if an SVSM is present and the hypervisor
>> +		 * supports the required SVSM GHCB events.
>>   		 */
>> -		if (rmpadjust((unsigned long)&boot_ghcb_page, RMP_PG_SIZE_4K, 1))
>> +		if (rmpadjust((unsigned long)&boot_ghcb_page, RMP_PG_SIZE_4K, 1) &&
>> +		    !(vmpl && (hv_features & GHCB_HV_FT_SNP_MULTI_VMPL)))
>>   			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NOT_VMPL0);
>>   	}
> 
> Let's make that more readable:

Will do.

> 
> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> index fb1e60165cd1..157f749faba0 100644
> --- a/arch/x86/boot/compressed/sev.c
> +++ b/arch/x86/boot/compressed/sev.c
> @@ -610,8 +610,10 @@ void sev_enable(struct boot_params *bp)
>   	 * features.
>   	 */
>   	if (sev_status & MSR_AMD64_SEV_SNP_ENABLED) {
> -		u64 hv_features = get_hv_features();
> +		u64 hv_features;
> +		int rmpadj_ret;

But I'll probably just call this 'ret'.

>   
> +		hv_features = get_hv_features();
>   		if (!(hv_features & GHCB_HV_FT_SNP))
>   			sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SNP_UNSUPPORTED);
>   
> @@ -626,11 +628,15 @@ void sev_enable(struct boot_params *bp)
>   		 * modifies permission bits, it is still ok to do so currently because Linux
>   		 * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
>   		 * permission mask changes are a don't-care.
> -		 *
> +		 */
> +		rmpadj_ret = rmpadjust((unsigned long)&boot_ghcb_page, RMP_PG_SIZE_4K, 1);
> +
> +		/*
>   		 * Running at VMPL0 is not required if an SVSM is present and the hypervisor
>   		 * supports the required SVSM GHCB events.
>   		 */
> -		if (rmpadjust((unsigned long)&boot_ghcb_page, RMP_PG_SIZE_4K, 1) &&
> +
> +		if (rmpadj_ret &&
>   		    !(vmpl && (hv_features & GHCB_HV_FT_SNP_MULTI_VMPL)))
>   			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NOT_VMPL0);
>   	}
> 
>> -static int __init report_cpuid_table(void)
>> +static void __init report_cpuid_table(void)
>>   {
>>   	const struct snp_cpuid_table *cpuid_table = snp_cpuid_get_table();
>>   
>>   	if (!cpuid_table->count)
>> -		return 0;
>> +		return;
>>   
>>   	pr_info("Using SNP CPUID table, %d entries present.\n",
>>   		cpuid_table->count);
>>   
>>   	if (sev_cfg.debug)
>>   		dump_cpuid_table();
>> +}
>> +
>> +static void __init report_vmpl_level(void)
>> +{
>> +	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
>> +		return;
>> +
>> +	pr_info("SNP running at VMPL%u.\n", vmpl);
>> +}
>> +
>> +static int __init report_snp_info(void)
>> +{
>> +	report_vmpl_level();
>> +	report_cpuid_table();
>>   
>>   	return 0;
>>   }
>> -arch_initcall(report_cpuid_table);
>> +arch_initcall(report_snp_info);
> 
> Zap one more silly helper:
> 
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index 7955c024d5d7..ff5a32b0b21c 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -2356,32 +2356,23 @@ static void dump_cpuid_table(void)
>    * sort of indicator, and there's not really any other good place to do it,
>    * so do it here.
>    */
> -static void __init report_cpuid_table(void)
> +static int __init report_snp_info(void)
>   {
>   	const struct snp_cpuid_table *cpuid_table = snp_cpuid_get_table();
>   
>   	if (!cpuid_table->count)
> -		return;
> +		return 0;

Well you can't return in this case, just not report/dump the CPUID info. 
So I'll remove the helpers and adjust accordingly.

Thanks,
Tom

>   
>   	pr_info("Using SNP CPUID table, %d entries present.\n",
>   		cpuid_table->count);
>   
>   	if (sev_cfg.debug)
>   		dump_cpuid_table();
> -}
>   
> -static void __init report_vmpl_level(void)
> -{
>   	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
> -		return;
> +		return 0;
>   
>   	pr_info("SNP running at VMPL%u.\n", vmpl);
> -}
> -
> -static int __init report_snp_info(void)
> -{
> -	report_vmpl_level();
> -	report_cpuid_table();
>   
>   	return 0;
>   }
> 
