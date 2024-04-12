Return-Path: <Pankaj.Gupta@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 92B6B1C25BC
 for <svsm-devel@coconut-svsm.dev>; Fri, 12 Apr 2024 17:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIynRI23SjYwOmj/NqhNupTVM+w8GN2SP5OP9eFGduU=;
 b=MAnqQC6Z/RJg0jShxF5aOnaNZeeVIPTD2/QTnIOkGgjCxKDWo6EQySmv4rbuQfZ1p27Pwa0utn4MsDkufLUPIX95TdTvPhf3aLDPY4PgIuZHvI6tkBXI/hvHnhcmta4QDVyXocfhxY5aNJahzJlidCIICB6Kg8h2Q8Beoalv940=
Message-ID: <c17d72ad-544f-0c3c-e250-a78041bfcc16@amd.com>
Date: Fri, 12 Apr 2024 17:28:12 +0200
Content-Language: en-US
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <b91122a1faf096ec89bb49653d7959158a614528.1711405593.git.thomas.lendacky@amd.com>
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <b91122a1faf096ec89bb49653d7959158a614528.1711405593.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 06/14] x86/sev: Use the SVSM to create a
 vCPU when not in VMPL0
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 3/25/2024 11:26 PM, Tom Lendacky wrote:
> Using the RMPADJUST instruction, the VSMA attribute can only be changed
> at VMPL0. An SVSM will be present when running at VMPL1 or a lower
> privilege level.
> 
> When an SVSM is present, use the SVSM_CORE_CREATE_VCPU call or the
> SVSM_CORE_DESTROY_VCPU call to perform VMSA attribute changes. Use the
> VMPL level supplied by the SVSM within the VMSA and when starting the
> AP.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>

> ---
>   arch/x86/include/asm/sev.h |  2 ++
>   arch/x86/kernel/sev.c      | 60 +++++++++++++++++++++++++++++++++-----
>   2 files changed, 54 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index 204f0a4857d6..d7be613b7372 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -229,6 +229,8 @@ struct svsm_call {
>   #define SVSM_CORE_CALL(x)		((0ULL << 32) | (x))
>   #define SVSM_CORE_REMAP_CA		0
>   #define SVSM_CORE_PVALIDATE		1
> +#define SVSM_CORE_CREATE_VCPU		2
> +#define SVSM_CORE_DELETE_VCPU		3
>   
>   #ifdef CONFIG_AMD_MEM_ENCRYPT
>   extern void __sev_es_ist_enter(struct pt_regs *regs);
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index d3e182d69d65..ea8b43a0f01b 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -1016,7 +1016,7 @@ void snp_accept_memory(phys_addr_t start, phys_addr_t end)
>   	set_pages_state(vaddr, npages, SNP_PAGE_STATE_PRIVATE);
>   }
>   
> -static int snp_set_vmsa(void *va, bool vmsa)
> +static int base_snp_set_vmsa(void *va, bool vmsa)
>   {
>   	u64 attrs;
>   
> @@ -1034,6 +1034,40 @@ static int snp_set_vmsa(void *va, bool vmsa)
>   	return rmpadjust((unsigned long)va, RMP_PG_SIZE_4K, attrs);
>   }
>   
> +static int svsm_snp_set_vmsa(void *va, void *caa, int apic_id, bool vmsa)
> +{
> +	struct svsm_call call = {};
> +	unsigned long flags;
> +	int ret;
> +
> +	local_irq_save(flags);
> +
> +	call.caa = this_cpu_read(svsm_caa);
> +	call.rcx = __pa(va);
> +
> +	if (vmsa) {
> +		/* Protocol 0, Call ID 2 */
> +		call.rax = SVSM_CORE_CALL(SVSM_CORE_CREATE_VCPU);
> +		call.rdx = __pa(caa);
> +		call.r8  = apic_id;
> +	} else {
> +		/* Protocol 0, Call ID 3 */
> +		call.rax = SVSM_CORE_CALL(SVSM_CORE_DELETE_VCPU);
> +	}
> +
> +	ret = svsm_protocol(&call);
> +
> +	local_irq_restore(flags);
> +
> +	return ret;
> +}
> +
> +static int snp_set_vmsa(void *va, void *caa, int apic_id, bool vmsa)
> +{
> +	return vmpl ? svsm_snp_set_vmsa(va, caa, apic_id, vmsa)
> +		    : base_snp_set_vmsa(va, vmsa);
> +}
> +
>   #define __ATTR_BASE		(SVM_SELECTOR_P_MASK | SVM_SELECTOR_S_MASK)
>   #define INIT_CS_ATTRIBS		(__ATTR_BASE | SVM_SELECTOR_READ_MASK | SVM_SELECTOR_CODE_MASK)
>   #define INIT_DS_ATTRIBS		(__ATTR_BASE | SVM_SELECTOR_WRITE_MASK)
> @@ -1065,11 +1099,11 @@ static void *snp_alloc_vmsa_page(void)
>   	return page_address(p + 1);
>   }
>   
> -static void snp_cleanup_vmsa(struct sev_es_save_area *vmsa)
> +static void snp_cleanup_vmsa(struct sev_es_save_area *vmsa, int apic_id)
>   {
>   	int err;
>   
> -	err = snp_set_vmsa(vmsa, false);
> +	err = snp_set_vmsa(vmsa, NULL, apic_id, false);
>   	if (err)
>   		pr_err("clear VMSA page failed (%u), leaking page\n", err);
>   	else
> @@ -1080,6 +1114,7 @@ static int wakeup_cpu_via_vmgexit(u32 apic_id, unsigned long start_ip)
>   {
>   	struct sev_es_save_area *cur_vmsa, *vmsa;
>   	struct ghcb_state state;
> +	struct svsm_ca *caa;
>   	unsigned long flags;
>   	struct ghcb *ghcb;
>   	u8 sipi_vector;
> @@ -1126,6 +1161,12 @@ static int wakeup_cpu_via_vmgexit(u32 apic_id, unsigned long start_ip)
>   	if (!vmsa)
>   		return -ENOMEM;
>   
> +	/*
> +	 * If an SVSM is present, then the SVSM CAA per-CPU variable will
> +	 * have a value, otherwise it will be NULL.
> +	 */
> +	caa = per_cpu(svsm_caa, cpu);
> +
>   	/* CR4 should maintain the MCE value */
>   	cr4 = native_read_cr4() & X86_CR4_MCE;
>   
> @@ -1173,11 +1214,11 @@ static int wakeup_cpu_via_vmgexit(u32 apic_id, unsigned long start_ip)
>   	 *   VMPL level
>   	 *   SEV_FEATURES (matches the SEV STATUS MSR right shifted 2 bits)
>   	 */
> -	vmsa->vmpl		= 0;
> +	vmsa->vmpl		= vmpl;
>   	vmsa->sev_features	= sev_status >> 2;
>   
>   	/* Switch the page over to a VMSA page now that it is initialized */
> -	ret = snp_set_vmsa(vmsa, true);
> +	ret = snp_set_vmsa(vmsa, caa, apic_id, true);
>   	if (ret) {
>   		pr_err("set VMSA page failed (%u)\n", ret);
>   		free_page((unsigned long)vmsa);
> @@ -1193,7 +1234,10 @@ static int wakeup_cpu_via_vmgexit(u32 apic_id, unsigned long start_ip)
>   	vc_ghcb_invalidate(ghcb);
>   	ghcb_set_rax(ghcb, vmsa->sev_features);
>   	ghcb_set_sw_exit_code(ghcb, SVM_VMGEXIT_AP_CREATION);
> -	ghcb_set_sw_exit_info_1(ghcb, ((u64)apic_id << 32) | SVM_VMGEXIT_AP_CREATE);
> +	ghcb_set_sw_exit_info_1(ghcb,
> +				((u64)apic_id << 32)	|
> +				((u64)vmpl << 16)	|
> +				SVM_VMGEXIT_AP_CREATE);
>   	ghcb_set_sw_exit_info_2(ghcb, __pa(vmsa));
>   
>   	sev_es_wr_ghcb_msr(__pa(ghcb));
> @@ -1211,13 +1255,13 @@ static int wakeup_cpu_via_vmgexit(u32 apic_id, unsigned long start_ip)
>   
>   	/* Perform cleanup if there was an error */
>   	if (ret) {
> -		snp_cleanup_vmsa(vmsa);
> +		snp_cleanup_vmsa(vmsa, apic_id);
>   		vmsa = NULL;
>   	}
>   
>   	/* Free up any previous VMSA page */
>   	if (cur_vmsa)
> -		snp_cleanup_vmsa(cur_vmsa);
> +		snp_cleanup_vmsa(cur_vmsa, apic_id);
>   
>   	/* Record the current VMSA page */
>   	per_cpu(sev_vmsa, cpu) = vmsa;
