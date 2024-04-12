Return-Path: <Pankaj.Gupta@amd.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 3C3E71C2929
 for <svsm-devel@coconut-svsm.dev>; Fri, 12 Apr 2024 19:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJFp22Z9NRJ+zh8RYxcRXpSV3bWV1RMB4YR4o+Dh8bc=;
 b=e7KNBZRXP1wgZBK5phNU4s9CGc7xWbrJJaoojfDk2cjWuCL6+DWT2Q2WfomxxsTRsg86S2sTxbAbps8OVsipJzFtS1bmyuOA8A9UladpBYOdDawXk3kqCi7/JQznHyL61hOam94nemshk2ZWOc6oV41cTfn+eUtzziZk69ZdlC8=
Message-ID: <9b0472c6-d2a9-9718-f73b-84aa775d8bf6@amd.com>
Date: Fri, 12 Apr 2024 19:03:47 +0200
Content-Language: en-US
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <e8d4877f3b7248031931ed193c026c42dd3363ef.1711405593.git.thomas.lendacky@amd.com>
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <e8d4877f3b7248031931ed193c026c42dd3363ef.1711405593.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 03/14] x86/sev: Check for the presence
 of an SVSM in the SNP Secrets page
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
> During early boot phases, check for the presence of an SVSM when running
> as an SEV-SNP guest.
> 
> An SVSM is present if the 64-bit value at offset 0x148 into the secrets
> page is non-zero. If an SVSM is present, save the SVSM Calling Area
> address (CAA), located at offset 0x150 into the secrets page, and set
> the VMPL level of the guest, which should be non-zero, to indicate the
> presence of an SVSM.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

Looks good.
Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>

> ---
>   arch/x86/boot/compressed/sev.c    | 35 ++++++++---------
>   arch/x86/include/asm/sev-common.h |  4 ++
>   arch/x86/include/asm/sev.h        | 25 +++++++++++-
>   arch/x86/kernel/sev-shared.c      | 64 +++++++++++++++++++++++++++++++
>   arch/x86/kernel/sev.c             | 16 ++++++++
>   5 files changed, 125 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> index 49dc9661176d..fe61ff630c7e 100644
> --- a/arch/x86/boot/compressed/sev.c
> +++ b/arch/x86/boot/compressed/sev.c
> @@ -12,6 +12,7 @@
>    */
>   #include "misc.h"
>   
> +#include <linux/mm.h>
>   #include <asm/bootparam.h>
>   #include <asm/pgtable_types.h>
>   #include <asm/sev.h>
> @@ -29,6 +30,15 @@
>   static struct ghcb boot_ghcb_page __aligned(PAGE_SIZE);
>   struct ghcb *boot_ghcb;
>   
> +/*
> + * SVSM related information:
> + *   When running under an SVSM, the VMPL that Linux is executing at must be
> + *   non-zero. The VMPL is therefore used to indicate the presence of an SVSM.
> + */
> +static u8 vmpl __section(".data");
> +static u64 boot_svsm_caa_pa __section(".data");
> +static struct svsm_ca *boot_svsm_caa __section(".data");
> +
>   /*
>    * Copy a version of this function here - insn-eval.c can't be used in
>    * pre-decompression code.
> @@ -335,24 +345,6 @@ void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
>   		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
>   }
>   
> -static bool running_at_vmpl0(void *va)
> -{
> -	u64 attrs;
> -
> -	/*
> -	 * RMPADJUST modifies RMP permissions of a lesser-privileged (numerically
> -	 * higher) privilege level. Here, clear the VMPL1 permission mask of the
> -	 * GHCB page. If the guest is not running at VMPL0, this will fail.
> -	 *
> -	 * If the guest is running at VMPL0, it will succeed. Even if that operation
> -	 * modifies permission bits, it is still ok to do so currently because Linux
> -	 * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
> -	 * permission mask changes are a don't-care.
> -	 */
> -	attrs = 1;
> -	return !rmpadjust((unsigned long)va, RMP_PG_SIZE_4K, attrs);
> -}
> -
>   /*
>    * SNP_FEATURES_IMPL_REQ is the mask of SNP features that will need
>    * guest side implementation for proper functioning of the guest. If any
> @@ -480,6 +472,13 @@ static bool early_snp_init(struct boot_params *bp)
>   	 */
>   	setup_cpuid_table(cc_info);
>   
> +	/*
> +	 * Record the SVSM Calling Area address (CAA) if the guest is not
> +	 * running at VMPL0. The CA will be used to communicate with the
> +	 * SVSM to perform the SVSM services.
> +	 */
> +	setup_svsm_ca(cc_info);
> +
>   	/*
>   	 * Pass run-time kernel a pointer to CC info via boot_params so EFI
>   	 * config table doesn't need to be searched again during early startup
> diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
> index b463fcbd4b90..68a8cdf6fd6a 100644
> --- a/arch/x86/include/asm/sev-common.h
> +++ b/arch/x86/include/asm/sev-common.h
> @@ -159,6 +159,10 @@ struct snp_psc_desc {
>   #define GHCB_TERM_NOT_VMPL0		3	/* SNP guest is not running at VMPL-0 */
>   #define GHCB_TERM_CPUID			4	/* CPUID-validation failure */
>   #define GHCB_TERM_CPUID_HV		5	/* CPUID failure during hypervisor fallback */
> +#define GHCB_TERM_SECRETS_PAGE		6	/* Secrets page failure */
> +#define GHCB_TERM_NO_SVSM		7	/* SVSM is not advertised in the secrets page */
> +#define GHCB_TERM_SVSM_VMPL0		8	/* SVSM is present but has set VMPL to 0 */
> +#define GHCB_TERM_SVSM_CAA		9	/* SVSM is present but the CA is not page aligned */
>   
>   #define GHCB_RESP_CODE(v)		((v) & GHCB_MSR_INFO_MASK)
>   
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index 9477b4053bce..891e7d9a1f66 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -152,9 +152,32 @@ struct snp_secrets_page_layout {
>   	u8 vmpck2[VMPCK_KEY_LEN];
>   	u8 vmpck3[VMPCK_KEY_LEN];
>   	struct secrets_os_area os_area;
> -	u8 rsvd3[3840];
> +
> +	u8 vmsa_tweak_bitmap[64];
> +
> +	/* SVSM fields */
> +	u64 svsm_base;
> +	u64 svsm_size;
> +	u64 svsm_caa;
> +	u32 svsm_max_version;
> +	u8 svsm_guest_vmpl;
> +	u8 rsvd3[3];
> +
> +	/* Remainder of page */
> +	u8 rsvd4[3744];
>   } __packed;
>   
> +/*
> + * The SVSM Calling Area (CA) related structures.
> + */
> +struct svsm_ca {
> +	u8 call_pending;
> +	u8 mem_available;
> +	u8 rsvd1[6];
> +
> +	u8 svsm_buffer[PAGE_SIZE - 8];
> +};
> +
>   #ifdef CONFIG_AMD_MEM_ENCRYPT
>   extern void __sev_es_ist_enter(struct pt_regs *regs);
>   extern void __sev_es_ist_exit(void);
> diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
> index 8b04958da5e7..66d33292eb78 100644
> --- a/arch/x86/kernel/sev-shared.c
> +++ b/arch/x86/kernel/sev-shared.c
> @@ -111,6 +111,24 @@ sev_es_terminate(unsigned int set, unsigned int reason)
>   		asm volatile("hlt\n" : : : "memory");
>   }
>   
> +static bool running_at_vmpl0(void *va)
> +{
> +	u64 attrs;
> +
> +	/*
> +	 * RMPADJUST modifies RMP permissions of a lesser-privileged (numerically
> +	 * higher) privilege level. Here, clear the VMPL1 permission mask of the
> +	 * GHCB page. If the guest is not running at VMPL0, this will fail.
> +	 *
> +	 * If the guest is running at VMPL0, it will succeed. Even if that operation
> +	 * modifies permission bits, it is still ok to do so currently because Linux
> +	 * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
> +	 * permission mask changes are a don't-care.
> +	 */
> +	attrs = 1;
> +	return !rmpadjust((unsigned long)va, RMP_PG_SIZE_4K, attrs);
> +}
> +
>   /*
>    * The hypervisor features are available from GHCB version 2 onward.
>    */
> @@ -1267,3 +1285,49 @@ static enum es_result vc_check_opcode_bytes(struct es_em_ctxt *ctxt,
>   
>   	return ES_UNSUPPORTED;
>   }
> +
> +/*
> + * Maintain the GPA of the SVSM Calling Area (CA) in order to utilize the SVSM
> + * services needed when not running in VMPL0.
> + */
> +static void __head setup_svsm_ca(const struct cc_blob_sev_info *cc_info)
> +{
> +	struct snp_secrets_page_layout *secrets_page;
> +	u64 caa;
> +
> +	BUILD_BUG_ON(sizeof(*secrets_page) != PAGE_SIZE);
> +
> +	/*
> +	 * Use __pa() since this routine is running identity mapped when
> +	 * called, both by the decompressor code and the early kernel code.
> +	 */
> +	if (running_at_vmpl0((void *)__pa(&boot_ghcb_page)))
> +		return;
> +
> +	/*
> +	 * Not running at VMPL0, ensure everything has been properly supplied
> +	 * for running under an SVSM.
> +	 */
> +	if (!cc_info || !cc_info->secrets_phys || cc_info->secrets_len != PAGE_SIZE)
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SECRETS_PAGE);
> +
> +	secrets_page = (struct snp_secrets_page_layout *)cc_info->secrets_phys;
> +	if (!secrets_page->svsm_size)
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NO_SVSM);
> +
> +	if (!secrets_page->svsm_guest_vmpl)
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SVSM_VMPL0);
> +
> +	vmpl = secrets_page->svsm_guest_vmpl;
> +
> +	caa = secrets_page->svsm_caa;
> +	if (!PAGE_ALIGNED(caa))
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SVSM_CAA);
> +
> +	/*
> +	 * The CA is identity mapped when this routine is called, both by the
> +	 * decompressor code and the early kernel code.
> +	 */
> +	boot_svsm_caa = (struct svsm_ca *)caa;
> +	boot_svsm_caa_pa = caa;
> +}
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index b59b09c2f284..64799a04feb4 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -135,6 +135,15 @@ struct ghcb_state {
>   static DEFINE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
>   static DEFINE_PER_CPU(struct sev_es_save_area *, sev_vmsa);
>   
> +/*
> + * SVSM related information:
> + *   When running under an SVSM, the VMPL that Linux is executing at must be
> + *   non-zero. The VMPL is therefore used to indicate the presence of an SVSM.
> + */
> +static u8 vmpl __ro_after_init;
> +static struct svsm_ca *boot_svsm_caa __ro_after_init;
> +static u64 boot_svsm_caa_pa __ro_after_init;
> +
>   struct sev_config {
>   	__u64 debug		: 1,
>   
> @@ -2122,6 +2131,13 @@ bool __head snp_init(struct boot_params *bp)
>   
>   	setup_cpuid_table(cc_info);
>   
> +	/*
> +	 * Record the SVSM Calling Area address (CAA) if the guest is not
> +	 * running at VMPL0. The CA will be used to communicate with the
> +	 * SVSM to perform the SVSM services.
> +	 */
> +	setup_svsm_ca(cc_info);
> +
>   	/*
>   	 * The CC blob will be used later to access the secrets page. Cache
>   	 * it here like the boot kernel does.

