Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id CF9A81C0DAD
 for <svsm-devel@coconut-svsm.dev>; Tue, 28 May 2024 22:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvssJWYkgWMSEBgNBbAXLccgKpcaBAe8L+cU1d8MHkk=;
 b=UvOU6M0ni0DsUo4Itcn22zUbqE/wtPxkzrE85qq3mp96xAMl5CcX9IvQXr8cwdHjoMgQdBUWiyTWSKJYNZ9PmNMzK0X2UfeiA1BA3g68yWrbfAi5tPkuD41HY6a9eNqdWCU9uhwunseM7jtCStgXJblOMLNSEuzcMlOsvyTq8Eg=
Message-ID: <4f704d19-088a-89d7-0515-144db61b93a5@amd.com>
Date: Tue, 28 May 2024 15:28:28 -0500
Content-Language: en-US
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <aa7f311d90efb49dfa6f4589854ee43c049b7b88.1713974291.git.thomas.lendacky@amd.com>
 <20240527123304.GBZlR9gBzBIjqEKKo6@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240527123304.GBZlR9gBzBIjqEKKo6@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 07/15] x86/sev: Use the SVSM to create a
 vCPU when not in VMPL0
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

On 5/27/24 07:33, Borislav Petkov wrote:
> On Wed, Apr 24, 2024 at 10:58:03AM -0500, Tom Lendacky wrote:
>> -static int snp_set_vmsa(void *va, bool vmsa)
>> +static int base_snp_set_vmsa(void *va, bool vmsa)
> 
> s/base_/__/

Ok.

> 
> The svsm_-prefixed ones are already a good enough distinction...
> 
>>   {
>>   	u64 attrs;
>>   
>> @@ -1013,6 +1013,40 @@ static int snp_set_vmsa(void *va, bool vmsa)
>>   	return rmpadjust((unsigned long)va, RMP_PG_SIZE_4K, attrs);
>>   }
>>   
>> +static int svsm_snp_set_vmsa(void *va, void *caa, int apic_id, bool vmsa)
> 								  ^^^^^^^^^^^
> 
> bool create_vmsa or so, to denote what this arg means.

Ok. I'll change it on the original function, too.

> 
>> +{
>> +	struct svsm_call call = {};
>> +	unsigned long flags;
>> +	int ret;
>> +
>> +	local_irq_save(flags);
>> +
>> +	call.caa = this_cpu_read(svsm_caa);
>> +	call.rcx = __pa(va);
>> +
>> +	if (vmsa) {
>> +		/* Protocol 0, Call ID 2 */
>> +		call.rax = SVSM_CORE_CALL(SVSM_CORE_CREATE_VCPU);
>> +		call.rdx = __pa(caa);
>> +		call.r8  = apic_id;
>> +	} else {
>> +		/* Protocol 0, Call ID 3 */
>> +		call.rax = SVSM_CORE_CALL(SVSM_CORE_DELETE_VCPU);
>> +	}
>> +
>> +	ret = svsm_protocol(&call);
>> +
>> +	local_irq_restore(flags);
>> +
>> +	return ret;
>> +}
>> +
>> +static int snp_set_vmsa(void *va, void *caa, int apic_id, bool vmsa)
>> +{
>> +	return vmpl ? svsm_snp_set_vmsa(va, caa, apic_id, vmsa)
>> +		    : base_snp_set_vmsa(va, vmsa);
> 
> Why do you even need helpers if you're not going to use them somewhere
> else? Just put the whole logic inside snp_set_vmsa().

I just think it's easier to follow, with specific functions for the 
situation and less indentation. But if you want, I can put it all in one 
function.

> 
>> +}
>> +
>>   #define __ATTR_BASE		(SVM_SELECTOR_P_MASK | SVM_SELECTOR_S_MASK)
>>   #define INIT_CS_ATTRIBS		(__ATTR_BASE | SVM_SELECTOR_READ_MASK | SVM_SELECTOR_CODE_MASK)
>>   #define INIT_DS_ATTRIBS		(__ATTR_BASE | SVM_SELECTOR_WRITE_MASK)
>> @@ -1044,11 +1078,11 @@ static void *snp_alloc_vmsa_page(int cpu)
>>   	return page_address(p + 1);
>>   }
>>   
>> -static void snp_cleanup_vmsa(struct sev_es_save_area *vmsa)
>> +static void snp_cleanup_vmsa(struct sev_es_save_area *vmsa, int apic_id)
>>   {
>>   	int err;
>>   
>> -	err = snp_set_vmsa(vmsa, false);
>> +	err = snp_set_vmsa(vmsa, NULL, apic_id, false);
>>   	if (err)
>>   		pr_err("clear VMSA page failed (%u), leaking page\n", err);
>>   	else
>> @@ -1059,6 +1093,7 @@ static int wakeup_cpu_via_vmgexit(u32 apic_id, unsigned long start_ip)
>>   {
>>   	struct sev_es_save_area *cur_vmsa, *vmsa;
>>   	struct ghcb_state state;
>> +	struct svsm_ca *caa;
>>   	unsigned long flags;
>>   	struct ghcb *ghcb;
>>   	u8 sipi_vector;
>> @@ -1105,6 +1140,12 @@ static int wakeup_cpu_via_vmgexit(u32 apic_id, unsigned long start_ip)
>>   	if (!vmsa)
>>   		return -ENOMEM;
>>   
>> +	/*
>> +	 * If an SVSM is present, then the SVSM CAA per-CPU variable will
>> +	 * have a value, otherwise it will be NULL.
>> +	 */
> 
> 	/* If an SVSM is present, the SVSM per-CPU CAA will be !NULL. */
> 
> Shorter.

Yep.

Thanks,
Tom

> 
