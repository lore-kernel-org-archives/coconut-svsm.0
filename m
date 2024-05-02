Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 1F0CE1C081C
 for <svsm-devel@coconut-svsm.dev>; Thu,  2 May 2024 17:29:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbPYqIz+d/GKs2CemZwwcpNzRLKgkM0Qw40VH7JqDqM=;
 b=GcUMGFYuJa69vZxadTC61GOP6wRK/qFlSYxRCi9q4ytWKu/pFS3epIckkjufvTy60nSj81ubO4Q3df7L7GdaDd7sqQnrkUiD/bhdaFLgY9K1eghfodptaMSFUjtSdJod0wmbapYT96HMJIvdgVgdqQRAyQzOMgIdsNT+un4eNDg=
Message-ID: <66928741-aa5c-4bbb-9155-dc3a0609c50a@amd.com>
Date: Thu, 2 May 2024 10:29:02 -0500
Content-Language: en-US
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <6cf54cac47f212f4c2b59b123855d8c183989022.1713974291.git.thomas.lendacky@amd.com>
 <20240502093520.GRZjNeWLXU5j2UMOAM@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240502093520.GRZjNeWLXU5j2UMOAM@fat_crate.local>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 04/15] x86/sev: Check for the presence
 of an SVSM in the SNP Secrets page
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

On 5/2/24 04:35, Borislav Petkov wrote:
> On Wed, Apr 24, 2024 at 10:58:00AM -0500, Tom Lendacky wrote:
>> During early boot phases, check for the presence of an SVSM when running
>> as an SEV-SNP guest.
>>
>> An SVSM is present if not running at VMPL0 and the 64-bit value at offset
>> 0x148 into the secrets page is non-zero. If an SVSM is present, save the
>> SVSM Calling Area address (CAA), located at offset 0x150 into the secrets
>> page, and set the VMPL level of the guest, which should be non-zero, to
>> indicate the presence of an SVSM.
>>
>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>> ---
>>   .../arch/x86/amd-memory-encryption.rst        | 22 ++++++
>>   arch/x86/boot/compressed/sev.c                |  8 +++
>>   arch/x86/include/asm/sev-common.h             |  4 ++
>>   arch/x86/include/asm/sev.h                    | 25 ++++++-
>>   arch/x86/kernel/sev-shared.c                  | 70 +++++++++++++++++++
>>   arch/x86/kernel/sev.c                         |  7 ++
>>   6 files changed, 135 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/arch/x86/amd-memory-encryption.rst b/Documentation/arch/x86/amd-memory-encryption.rst
>> index 414bc7402ae7..32737718d4a2 100644
>> --- a/Documentation/arch/x86/amd-memory-encryption.rst
>> +++ b/Documentation/arch/x86/amd-memory-encryption.rst
>> @@ -130,4 +130,26 @@ SNP feature support.
>>   
>>   More details in AMD64 APM[1] Vol 2: 15.34.10 SEV_STATUS MSR
>>   
>> +Secure VM Service Module (SVSM)
>> +===============================
>> +
>> +SNP provides a feature called Virtual Machine Privilege Levels (VMPL). The most
>> +privileged VMPL is 0 with numerically higher numbers having lesser privileges.
>> +More details in AMD64 APM[1] Vol 2: 15.35.7 Virtual Machine Privilege Levels.
>> +
>> +The VMPL feature provides the ability to run software services at a more
>> +privileged level than the guest OS is running at. This provides a secure
> 
> Too many "provides".
> 
>> +environment for services within the guest's SNP environment, while protecting
>> +the service from hypervisor interference. An example of a secure service
>> +would be a virtual TPM (vTPM). Additionally, certain operations require the
>> +guest to be running at VMPL0 in order for them to be performed. For example,
>> +the PVALIDATE instruction is required to be executed at VMPL0.
>> +
>> +When a guest is not running at VMPL0, it needs to communicate with the software
>> +running at VMPL0 to perform privileged operations or to interact with secure
>> +services. This software running at VMPL0 is known as a Secure VM Service Module
>> +(SVSM). Discovery of an SVSM and the API used to communicate with it is
>> +documented in Secure VM Service Module for SEV-SNP Guests[2].
> 
> This paragraph needs to go second, not third.
> 
> Somehow that text is missing "restraint" and is all over the place.
> Lemme try to restructure it:
> 
> "SNP provides a feature called Virtual Machine Privilege Levels (VMPL) which
> defines four privilege levels at which guest software can run. The most
> privileged level is 0 and numerically higher numbers have lesser privileges.
> More details in the AMD64 APM[1] Vol 2, section "15.35.7 Virtual Machine
> Privilege Levels", docID: 24593.
> 
> When using that feature, different services can run at different protection
> levels, apart from the guest OS but still within the secure SNP environment.
> They can provide services to the guest, like a vTPM, for example.
> 
> When a guest is not running at VMPL0, it needs to communicate with the software
> running at VMPL0 to perform privileged operations or to interact with secure
> services. An example fur such a privileged operation is PVALIDATE which is
> *required* to be executed at VMPL0.
> 
> In this scenario, the software running at VMPL0 is usually called a Secure VM
> Service Module (SVSM). Discovery of an SVSM and the API used to communicate
> with it is documented in "Secure VM Service Module for SEV-SNP Guests", docID:
> 58019."
> 
> How's that?

Works for me.

> 
>> +
>>   [1] https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24593.pdf
>> +[2] https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
> 
> Yeah, about those links - they get stale pretty quickly. I think it suffices to
> explain what the document is and what it is called so that one can find it by
> searching the web. See what I did above.
> 
>> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
>> index 0457a9d7e515..cb771b380a6b 100644
>> --- a/arch/x86/boot/compressed/sev.c
>> +++ b/arch/x86/boot/compressed/sev.c
>> @@ -12,6 +12,7 @@
>>    */
>>   #include "misc.h"
>>   
>> +#include <linux/mm.h>
> 
> Please do not include a kernel-proper header into the decompresssor.
> Those things are solved by exposing the shared *minimal* functionality
> into

Right, should've known that.

> 
> arch/x86/include/asm/shared/
> 
> There are examples there.
> 
> By the looks of it:
> 
> In file included from arch/x86/boot/compressed/sev.c:130:
> arch/x86/boot/compressed/../../kernel/sev-shared.c: In function ‘setup_svsm_ca’:
> arch/x86/boot/compressed/../../kernel/sev-shared.c:1332:14: warning: implicit declaration of function ‘PAGE_ALIGNED’; did you mean ‘IS_ALIGNED’? [-Wimplicit-function-declaration]
>   1332 |         if (!PAGE_ALIGNED(caa))
>        |              ^~~~~~~~~~~~
>        |              IS_ALIGNED
> 
> it'll need PAGE_ALIGNED and IS_ALIGNED into an arch/x86/include/asm/shared/mm.h
> header.

PAGE_ALIGNED and IS_ALIGNED are from two separate header files (mm.h and 
align.h) which seems like a lot of extra changes for just one check.

Any objection to either adding this define to sev-shared.c on the "else" 
patch of the "#ifndef __BOOT_COMPRESSED" check:

#define PAGE_ALIGNED(x) IS_ALIGNED((x), PAGE_SIZE)

or just changing the above check to:

	if (!IS_ALIGNED(caa, PAGE_SIZE))

> 
>>   #include <asm/bootparam.h>
>>   #include <asm/pgtable_types.h>
>>   #include <asm/sev.h>
> 
> ..
> 
>> +static void __head setup_svsm_ca(const struct cc_blob_sev_info *cc_info)
>> +{
>> +	struct snp_secrets_page *secrets_page;
>> +	u64 caa;
>> +
>> +	BUILD_BUG_ON(sizeof(*secrets_page) != PAGE_SIZE);
>> +
>> +	/*
>> +	 * RMPADJUST modifies RMP permissions of a lesser-privileged (numerically
>> +	 * higher) privilege level. Here, clear the VMPL1 permission mask of the
>> +	 * GHCB page. If the guest is not running at VMPL0, this will fail.
>> +	 *
>> +	 * If the guest is running at VMPL0, it will succeed. Even if that operation
>> +	 * modifies permission bits, it is still ok to do so currently because Linux
>> +	 * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
>> +	 * permission mask changes are a don't-care.
>> +	 *
>> +	 * Use __pa() since this routine is running identity mapped when called,
>> +	 * both by the decompressor code and the early kernel code.
>> +	 */
> 
> Let's not replicate that comment. Diff ontop:
> 
> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> index cb771b380a6b..cde1890c8843 100644
> --- a/arch/x86/boot/compressed/sev.c
> +++ b/arch/x86/boot/compressed/sev.c
> @@ -576,18 +576,7 @@ void sev_enable(struct boot_params *bp)
>   		if (!(get_hv_features() & GHCB_HV_FT_SNP))
>   			sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SNP_UNSUPPORTED);
>   
> -		/*
> -		 * Enforce running at VMPL0.
> -		 *
> -		 * RMPADJUST modifies RMP permissions of a lesser-privileged (numerically
> -		 * higher) privilege level. Here, clear the VMPL1 permission mask of the
> -		 * GHCB page. If the guest is not running at VMPL0, this will fail.
> -		 *
> -		 * If the guest is running at VMPL0, it will succeed. Even if that operation
> -		 * modifies permission bits, it is still ok to do so currently because Linux
> -		 * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
> -		 * permission mask changes are a don't-care.
> -		 */
> +		/* Enforce running at VMPL0 - see comment above rmpadjust(). */

Not sure I agree. I'd prefer to keep the comment here because it is 
specific to this rmpadjust() call. See below.

>   		if (rmpadjust((unsigned long)&boot_ghcb_page, RMP_PG_SIZE_4K, 1))
>   			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NOT_VMPL0);
>   	}
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index 350db22e66be..b168403c07be 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -204,6 +204,17 @@ static __always_inline void sev_es_nmi_complete(void)
>   extern int __init sev_es_efi_map_ghcbs(pgd_t *pgd);
>   extern void sev_enable(struct boot_params *bp);
>   
> +/*
> + * RMPADJUST modifies RMP permissions of a lesser-privileged
> + * (numerically higher) privilege level. If @attrs==0, it will attempt
> + * to clear the VMPL1 permission mask of @vaddr. If the guest is not
> + * running at VMPL0, this will fail.
> + *
> + * If the guest is running at VMPL0, it will succeed. Even if that operation
> + * modifies permission bits, it is still ok to do so currently because Linux
> + * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
> + * permission mask changes are a don't-care.

If you want to put a comment here, then it needs to be more generic. The 
attrs value would be 1 if VMPL0 was attempting to clear VMPL1 
permissions. Also, you could be running at VMPL2 and successfully clear 
or set VMPL3 permissions. So this comment doesn't really flow with a 
generic RMPADJUST function.

/*
  * RMPAJDUST modifies the RMP permissions of a lesser-privileged
  * (numerically higher) VMPL. The @attrs option contains the VMPL
  * level to be modified for @vaddr. The operation will succeed only
  * if the guest is running at a higher-privileged (numerically lower)
  * VMPL.
  */

> + */
>   static inline int rmpadjust(unsigned long vaddr, bool rmp_psize, unsigned long attrs)
>   {
>   	int rc;
> diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
> index 46ea4e5e118a..9ca54bcf0e99 100644
> --- a/arch/x86/kernel/sev-shared.c
> +++ b/arch/x86/kernel/sev-shared.c
> @@ -1297,17 +1297,9 @@ static void __head setup_svsm_ca(const struct cc_blob_sev_info *cc_info)
>   	BUILD_BUG_ON(sizeof(*secrets_page) != PAGE_SIZE);
>   
>   	/*
> -	 * RMPADJUST modifies RMP permissions of a lesser-privileged (numerically
> -	 * higher) privilege level. Here, clear the VMPL1 permission mask of the
> -	 * GHCB page. If the guest is not running at VMPL0, this will fail.
> -	 *
> -	 * If the guest is running at VMPL0, it will succeed. Even if that operation
> -	 * modifies permission bits, it is still ok to do so currently because Linux
> -	 * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
> -	 * permission mask changes are a don't-care.
> -	 *
> -	 * Use __pa() since this routine is running identity mapped when called,
> -	 * both by the decompressor code and the early kernel code.
> +	 * See comment above rmpadjust() for details. Use __pa() since
> +	 * this routine is running identity mapped when called both by
> +	 * the decompressor code and the early kernel code.
>   	 */
>   	if (!rmpadjust((unsigned long)__pa(&boot_ghcb_page), RMP_PG_SIZE_4K, 1))
>   		return;
> 
>> +	if (!rmpadjust((unsigned long)__pa(&boot_ghcb_page), RMP_PG_SIZE_4K, 1))
>> +		return;
>> +
>> +	/*
>> +	 * Not running at VMPL0, ensure everything has been properly supplied
>> +	 * for running under an SVSM.
>> +	 */
>> +	if (!cc_info || !cc_info->secrets_phys || cc_info->secrets_len != PAGE_SIZE)
>> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SECRETS_PAGE);
>> +
>> +	secrets_page = (struct snp_secrets_page *)cc_info->secrets_phys;
>> +	if (!secrets_page->svsm_size)
>> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NO_SVSM);
>> +
>> +	if (!secrets_page->svsm_guest_vmpl)
>> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SVSM_VMPL0);
> 
> 0x15C	1 byte	SVSM_GUEST_VMPL		Indicates the VMPL at which the guest is executing.
> 
> Do I understand it correctly that this contains the VMPL of the guest and  the
> SVSM is running below it?

Right, the SVSM is supposed to place the VMPL level that it starts the 
guest at in this location.

> 
> IOW, SVSM should be at VMPL0 and the guest should be a at a level determined by
> that value and it cannot be 0.

Right. Not sure about the "cannot", more like "must not." The 
specification states that the guest should run at a VMPL other than 0. 
If an SVSM starts the guest at VMPL0, then the SVSM would not be 
protected from guest.

Thanks,
Tom

> 
> Just making sure I'm reading it right.
> 
> Thx.
> 
