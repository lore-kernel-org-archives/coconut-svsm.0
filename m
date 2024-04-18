Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id DF1D81C5FC1
 for <svsm-devel@coconut-svsm.dev>; Thu, 18 Apr 2024 23:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKWDpv9Kpf43XfKqVuz7a6XFWdGXYlTu4VBAt8MxXzE=;
 b=pqsoOZMlHZFZBxVtetlwY5/qvtaCtwA1gh2yCa3O9q0mYwrZ89JIGDWEA04e7Hm6sa+HbsO+JuWFZccLg3zYgqH+82g1Iz3KWK4HwtIB6h0GJ0mDWKOmdiDDM6AyIxGUWCNDY9sNxeAcl0plt5BPbhnQVuz77+P+grcCvz6hDHU=
Message-ID: <d525f2ef-d8f0-a694-401f-8cb964dcdaed@amd.com>
Date: Thu, 18 Apr 2024 16:17:36 -0500
Content-Language: en-US
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <e8d4877f3b7248031931ed193c026c42dd3363ef.1711405593.git.thomas.lendacky@amd.com>
 <20240417204030.GIZiAzvuLG6qcFFMyT@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240417204030.GIZiAzvuLG6qcFFMyT@fat_crate.local>
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
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 4/17/24 15:40, Borislav Petkov wrote:
> On Mon, Mar 25, 2024 at 05:26:22PM -0500, Tom Lendacky wrote:
>> During early boot phases, check for the presence of an SVSM when running
>> as an SEV-SNP guest.
>>
>> An SVSM is present if the 64-bit value at offset 0x148 into the secrets
>> page is non-zero. If an SVSM is present, save the SVSM Calling Area
>> address (CAA), located at offset 0x150 into the secrets page, and set
>> the VMPL level of the guest, which should be non-zero, to indicate the
>> presence of an SVSM.
> 
> Where are we pointing to the SVSM spec?
> 
> This is in the 0th message
> 
> https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
> 
> but pls add it to our documentation here:
> 
> Documentation/arch/x86/amd-memory-encryption.rst

Do you want it added as a in this patch or in a documentation patch at the 
end of the series?

> 
>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>> ---
>>   arch/x86/boot/compressed/sev.c    | 35 ++++++++---------
>>   arch/x86/include/asm/sev-common.h |  4 ++
>>   arch/x86/include/asm/sev.h        | 25 +++++++++++-
>>   arch/x86/kernel/sev-shared.c      | 64 +++++++++++++++++++++++++++++++
>>   arch/x86/kernel/sev.c             | 16 ++++++++
>>   5 files changed, 125 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
>> index 49dc9661176d..fe61ff630c7e 100644
>> --- a/arch/x86/boot/compressed/sev.c
>> +++ b/arch/x86/boot/compressed/sev.c
>> @@ -12,6 +12,7 @@
>>    */
>>   #include "misc.h"
>>   
>> +#include <linux/mm.h>
>>   #include <asm/bootparam.h>
>>   #include <asm/pgtable_types.h>
>>   #include <asm/sev.h>
>> @@ -29,6 +30,15 @@
>>   static struct ghcb boot_ghcb_page __aligned(PAGE_SIZE);
>>   struct ghcb *boot_ghcb;
>>   
>> +/*
>> + * SVSM related information:
>> + *   When running under an SVSM, the VMPL that Linux is executing at must be
>> + *   non-zero. The VMPL is therefore used to indicate the presence of an SVSM.
>> + */
>> +static u8 vmpl __section(".data");
>> +static u64 boot_svsm_caa_pa __section(".data");
>> +static struct svsm_ca *boot_svsm_caa __section(".data");
> 
> Explain what those last 2 are in comments above it pls.

Will do.

> 
>>   /*
>>    * SNP_FEATURES_IMPL_REQ is the mask of SNP features that will need
>>    * guest side implementation for proper functioning of the guest. If any
>> @@ -480,6 +472,13 @@ static bool early_snp_init(struct boot_params *bp)
>>   	 */
>>   	setup_cpuid_table(cc_info);
>>   
>> +	/*
>> +	 * Record the SVSM Calling Area address (CAA) if the guest is not
> 
> 			Calling Area (CA) address
> 
>> +	 * running at VMPL0. The CA will be used to communicate with the
> 
> and then you can use "CA" here.

Will do.

> 
>> +	 * SVSM to perform the SVSM services.
>> +	 */
>> +	setup_svsm_ca(cc_info);
>> +
>>   	/*
>>   	 * Pass run-time kernel a pointer to CC info via boot_params so EFI
>>   	 * config table doesn't need to be searched again during early startup
>> diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
>> index b463fcbd4b90..68a8cdf6fd6a 100644
>> --- a/arch/x86/include/asm/sev-common.h
>> +++ b/arch/x86/include/asm/sev-common.h
>> @@ -159,6 +159,10 @@ struct snp_psc_desc {
>>   #define GHCB_TERM_NOT_VMPL0		3	/* SNP guest is not running at VMPL-0 */
>>   #define GHCB_TERM_CPUID			4	/* CPUID-validation failure */
>>   #define GHCB_TERM_CPUID_HV		5	/* CPUID failure during hypervisor fallback */
>> +#define GHCB_TERM_SECRETS_PAGE		6	/* Secrets page failure */
>> +#define GHCB_TERM_NO_SVSM		7	/* SVSM is not advertised in the secrets page */
>> +#define GHCB_TERM_SVSM_VMPL0		8	/* SVSM is present but has set VMPL to 0 */
>> +#define GHCB_TERM_SVSM_CAA		9	/* SVSM is present but the CA is not page aligned */
> 
> "CAA" in the comment I guess. :)

Will do.

> 
>> +/*
>> + * Maintain the GPA of the SVSM Calling Area (CA) in order to utilize the SVSM
>> + * services needed when not running in VMPL0.
>> + */
>> +static void __head setup_svsm_ca(const struct cc_blob_sev_info *cc_info)
>> +{
>> +	struct snp_secrets_page_layout *secrets_page;
> 
> Why was that thing ever called "_layout" and not simply
> snp_secrets_page?
> 
> Fix it?

Sure, I can change that as a pre-patch to the series.

> 
>> +	u64 caa;
>> +
>> +	BUILD_BUG_ON(sizeof(*secrets_page) != PAGE_SIZE);
> 
> Put it in the header under the struct definition I guess.

It can't stand on it's own in the header file. I'd have to put it in a 
#define or an inline function and then use that in some code. So it's 
probably best to keep it here.

> 
>> +	/*
>> +	 * Use __pa() since this routine is running identity mapped when
>> +	 * called, both by the decompressor code and the early kernel code.
>> +	 */
>> +	if (running_at_vmpl0((void *)__pa(&boot_ghcb_page)))
>> +		return;
>> +
>> +	/*
>> +	 * Not running at VMPL0, ensure everything has been properly supplied
>> +	 * for running under an SVSM.
>> +	 */
>> +	if (!cc_info || !cc_info->secrets_phys || cc_info->secrets_len != PAGE_SIZE)
>> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SECRETS_PAGE);
>> +
>> +	secrets_page = (struct snp_secrets_page_layout *)cc_info->secrets_phys;
>> +	if (!secrets_page->svsm_size)
>> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NO_SVSM);
>> +
>> +	if (!secrets_page->svsm_guest_vmpl)
>> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SVSM_VMPL0);
>> +
>> +	vmpl = secrets_page->svsm_guest_vmpl;
>> +
>> +	caa = secrets_page->svsm_caa;
>> +	if (!PAGE_ALIGNED(caa))
>> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SVSM_CAA);
>> +
>> +	/*
>> +	 * The CA is identity mapped when this routine is called, both by the
>> +	 * decompressor code and the early kernel code.
>> +	 */
>> +	boot_svsm_caa = (struct svsm_ca *)caa;
>> +	boot_svsm_caa_pa = caa;
>> +}
>> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
>> index b59b09c2f284..64799a04feb4 100644
>> --- a/arch/x86/kernel/sev.c
>> +++ b/arch/x86/kernel/sev.c
>> @@ -135,6 +135,15 @@ struct ghcb_state {
>>   static DEFINE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
>>   static DEFINE_PER_CPU(struct sev_es_save_area *, sev_vmsa);
>>   
>> +/*
>> + * SVSM related information:
>> + *   When running under an SVSM, the VMPL that Linux is executing at must be
>> + *   non-zero. The VMPL is therefore used to indicate the presence of an SVSM.
>> + */
>> +static u8 vmpl __ro_after_init;
>> +static struct svsm_ca *boot_svsm_caa __ro_after_init;
>> +static u64 boot_svsm_caa_pa __ro_after_init;
> 
> Uff, duplication.
> 
> Let's put them in sev-shared.c pls and avoid that.

Ok, but it will require moving some functions after the inclusion of 
sev-shared.c and then (later) adding some advance function declarations.

Thanks,
Tom

> 
> Thx.
> 
