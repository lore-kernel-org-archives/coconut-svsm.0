Return-Path: <Pankaj.Gupta@amd.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id DB9211C25BC
 for <svsm-devel@coconut-svsm.dev>; Fri, 12 Apr 2024 18:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GxZ7oEB1zgfrI8VkstbellCVYAHoGYvwF0gzkJC25c=;
 b=t9TVPmkkJlyv7f6ZYzXN97QU0p35RflVoXQ4RYacVWkLh2kVWDn5d+r53yJCRBfWlRXwQjOatO8kDIWbohaHah80nBJH8YdAVKccMvtWsyKU5/S64omlJL88825rjxQREq+1zt+fyRi1wQnv8yYa4YfjAc73o+A0os8xb9X1Mfc=
Message-ID: <f0117eab-4e58-3d59-961f-f8f44a146605@amd.com>
Date: Fri, 12 Apr 2024 18:41:27 +0200
Content-Language: en-US
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <1b0d8ec8e671ad957a2ad888725ce24edeedf74a.1711405593.git.thomas.lendacky@amd.com>
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <1b0d8ec8e671ad957a2ad888725ce24edeedf74a.1711405593.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 02/14] x86/sev: Make the VMPL0 checking
 function more generic
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
> Currently, the enforce_vmpl0() function uses a set argument when testing
> for VMPL0 and terminates the guest if the guest is not running at VMPL0.
> 
> Make the function more generic by moving it into the common code, renaming
> it, allowing it to take an argument for use in the VMPL0 check (RMPADJUST
> instruction) and return the result of the check, allowing the caller to
> determine the action taken based on the result.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

This is preparatory patch for patch3.

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>

> ---
>   arch/x86/boot/compressed/sev.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> index 5ad0ff4664f1..49dc9661176d 100644
> --- a/arch/x86/boot/compressed/sev.c
> +++ b/arch/x86/boot/compressed/sev.c
> @@ -335,10 +335,9 @@ void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
>   		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
>   }
>   
> -static void enforce_vmpl0(void)
> +static bool running_at_vmpl0(void *va)
>   {
>   	u64 attrs;
> -	int err;
>   
>   	/*
>   	 * RMPADJUST modifies RMP permissions of a lesser-privileged (numerically
> @@ -347,12 +346,11 @@ static void enforce_vmpl0(void)
>   	 *
>   	 * If the guest is running at VMPL0, it will succeed. Even if that operation
>   	 * modifies permission bits, it is still ok to do so currently because Linux
> -	 * SNP guests are supported only on VMPL0 so VMPL1 or higher permission masks
> -	 * changing is a don't-care.
> +	 * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
> +	 * permission mask changes are a don't-care.
>   	 */
>   	attrs = 1;
> -	if (rmpadjust((unsigned long)&boot_ghcb_page, RMP_PG_SIZE_4K, attrs))
> -		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NOT_VMPL0);
> +	return !rmpadjust((unsigned long)va, RMP_PG_SIZE_4K, attrs);
>   }
>   
>   /*
> @@ -588,7 +586,8 @@ void sev_enable(struct boot_params *bp)
>   		if (!(get_hv_features() & GHCB_HV_FT_SNP))
>   			sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SNP_UNSUPPORTED);
>   
> -		enforce_vmpl0();
> +		if (!running_at_vmpl0(&boot_ghcb_page))
> +			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NOT_VMPL0);
>   	}
>   
>   	if (snp && !(sev_status & MSR_AMD64_SEV_SNP_ENABLED))

