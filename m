Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 9F6EF1C6612
 for <svsm-devel@coconut-svsm.dev>; Wed, 22 May 2024 18:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsDPNCNeoiLC7+YGRBbV+a3I1N7vxT/g8Zru/cMwnmA=;
 b=1/xw7hjW8cJ97mv/MgePMo5WB2CFwD/CFSoC3O0AU95csHe/hKyuNdAmDJivqVeEVsp0jGQMC7AgE1vJHrYksC4JvB8ZHUI2Zodh3cKTdWLnBAZXE31Yph9hjw1JOUqfRmka/ySy9Faib9x+CvNxNF5O8Vjrrbs7GP/rW6MnjtQ=
Message-ID: <db4d1dee-b25e-f28e-e8dc-9c9bcce68dd4@amd.com>
Date: Wed, 22 May 2024 11:15:28 -0500
Content-Language: en-US
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <6cf54cac47f212f4c2b59b123855d8c183989022.1713974291.git.thomas.lendacky@amd.com>
 <20240502093520.GRZjNeWLXU5j2UMOAM@fat_crate.local>
 <66928741-aa5c-4bbb-9155-dc3a0609c50a@amd.com>
 <20240517155858.GDZkd-wkWmYegos-eT@fat_crate.local>
 <f8a92b19-9090-40ea-c2cf-707005f583a5@amd.com>
 <20240522152712.GBZk4O0LIl2r0dH--H@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240522152712.GBZk4O0LIl2r0dH--H@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/22/24 10:27, Borislav Petkov wrote:
> On Mon, May 20, 2024 at 08:57:43AM -0500, Tom Lendacky wrote:
>> So this will be a new shared directory in the top level include directory
>> (as PAGE_ALIGNED is defined in include/linux/mm.h), not just in the
>> arch/x86/include directory like the others (io.h, msr.h and tdx.h). Is that
>> what you want?
> 
> You can actually do this - it is a lot easier and still clean:
> 
> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> index cb771b380a6b..5ee53a7a060e 100644
> --- a/arch/x86/boot/compressed/sev.c
> +++ b/arch/x86/boot/compressed/sev.c
> @@ -12,7 +12,6 @@
>    */
>   #include "misc.h"
>   
> -#include <linux/mm.h>
>   #include <asm/bootparam.h>
>   #include <asm/pgtable_types.h>
>   #include <asm/sev.h>
> diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
> index 46ea4e5e118a..bd4bbb30ef0c 100644
> --- a/arch/x86/kernel/sev-shared.c
> +++ b/arch/x86/kernel/sev-shared.c
> @@ -1329,7 +1329,12 @@ static void __head setup_svsm_ca(const struct cc_blob_sev_info *cc_info)
>   	vmpl = secrets_page->svsm_guest_vmpl;
>   
>   	caa = secrets_page->svsm_caa;
> -	if (!PAGE_ALIGNED(caa))
> +
> +	/*
> +	 * Open-code PAGE_ALIGNED() to avoid pulling in the world and
> +	 * more by including linux/mm.h.
> +	 */
> +	if (caa & (PAGE_SIZE - 1))

Or what I originally proposed:

	if (!IS_ALIGNED(caa, PAGE_SIZE))

Which also works without including mm.h.

Thanks,
Tom

>   		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SVSM_CAA);
>   
>   	/*
> 
