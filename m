Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 549041C6EDD
 for <svsm-devel@coconut-svsm.dev>; Mon, 27 May 2024 15:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1716815443; bh=gbXlsU5DZNdMyStGbqa9nXLhq2eGCwR6s6CdnXmy78E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EIiWNLnJl7EvuDHU4jVcjSMS7l+ExO3GHpbyRLAAIQ30+W8XqBmA0KP4CPQcUQK2K
 eWE0FprRqmHxNRgCb/YG5AOmbEz9wLxeezRjKZBZwDufvJr/yXhCmj/I5co7M6rmfl
 lyiqHo6k/tnV+Mg1pBnD95zboe2L/ZxfSFv633HI9FOP+QqoGDiCkKGWCAPnFFd5b5
 6XJrqyL5w5hWLKbKV02Z3XKYhVIYnDy0l1Rcc+nysQMHqEO2/n6QTKR7xI3dDG9p49
 65EHeGg+gJJtce45UqQ0ewvUJ5gsUDGEJnUOT3EOT7BLb0VJwkGRqQ+keZPylj8UeX
 WXGbOh40qr6H+lflPj7EMqrxf7PBhSauBRhv6kTJ6kQC18U6RurMg9V5s2/AwACtjt
 8DVoWX/Ir0XWJcOuV//6LNDNGRsCb/K8VzXsYzpd3ghuiIbieDrymHX7xm9ietn7L3
 boKRvyPwUroofri7R0dwN8C1j87Ale0DetTPMbQYXbLBMWDxaB0H16ugw0Bj7dxqh8
 NJ7CV7zCDyQwcvnAbKupRWnF1JErB6jltJwp5KqvpTXILLd5krZCmPF91M6OssUIVE
 H5ub0e3p0hYPMboHSipLzur3dBtFrhM8+IJnMK3JPYPAh5YVX+Qr000nYvc+BHWPgc
 +A35caauOc9WUP/L+yRY09i4=
Date: Mon, 27 May 2024 15:10:22 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240527131022.GAZlSGPm_s0FAu_BRB@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <0b460ba621d39fda47694332f09301b440619efc.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b460ba621d39fda47694332f09301b440619efc.1713974291.git.thomas.lendacky@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 08/15] x86/sev: Provide SVSM discovery
 support
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On Wed, Apr 24, 2024 at 10:58:04AM -0500, Tom Lendacky wrote:
> The SVSM specification documents an alternative method of discovery for
> the SVSM using a reserved CPUID bit and a reserved MSR.

Yes, and all your code places where you do

	if (vmpl)

to check whether the guest is running over a SVSM should do the CPUID
check. We should not be hardcoding the VMPL level to mean a SVSM is
present.

> 
> For the CPUID support, the SNP CPUID table is updated to set bit 28 of

s/is updated/update the.../

> the EAX register of the 0x8000001f leaf when an SVSM is present. This bit
> has been reserved for use in this capacity.
> 
> For the MSR support, a new reserved MSR 0xc001f000 has been defined. A #VC
> should be generated when accessing this MSR. The #VC handler is expected
> to ignore writes to this MSR and return the physical calling area address
> (CAA) on reads of this MSR.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/x86/include/asm/cpufeatures.h |  1 +
>  arch/x86/include/asm/msr-index.h   |  2 ++
>  arch/x86/kernel/sev-shared.c       | 11 +++++++++++
>  arch/x86/kernel/sev.c              | 17 +++++++++++++++++
>  4 files changed, 31 insertions(+)
> 
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index 3c7434329661..a17a81b3189b 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -446,6 +446,7 @@
>  #define X86_FEATURE_V_TSC_AUX		(19*32+ 9) /* "" Virtual TSC_AUX */
>  #define X86_FEATURE_SME_COHERENT	(19*32+10) /* "" AMD hardware-enforced cache coherency */
>  #define X86_FEATURE_DEBUG_SWAP		(19*32+14) /* AMD SEV-ES full debug state swap support */
> +#define X86_FEATURE_SVSM_PRESENT	(19*32+28) /* "" SNP SVSM is present */

X86_FEATURE_SVSM is better right?

And then we might even want to show it in /proc/cpuinfo here to really
say that we're running over a SVSM as that might be useful info. Think
alternate injection support for one.

>  /* AMD-defined Extended Feature 2 EAX, CPUID level 0x80000021 (EAX), word 20 */
>  #define X86_FEATURE_NO_NESTED_DATA_BP	(20*32+ 0) /* "" No Nested Data Breakpoints */
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index e022e6eb766c..45ffa27569f4 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -660,6 +660,8 @@
>  #define MSR_AMD64_RMP_BASE		0xc0010132
>  #define MSR_AMD64_RMP_END		0xc0010133
>  
> +#define MSR_SVSM_CAA			0xc001f000
> +
>  /* AMD Collaborative Processor Performance Control MSRs */
>  #define MSR_AMD_CPPC_CAP1		0xc00102b0
>  #define MSR_AMD_CPPC_ENABLE		0xc00102b1
> diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
> index b415b10a0823..50db783f151e 100644
> --- a/arch/x86/kernel/sev-shared.c
> +++ b/arch/x86/kernel/sev-shared.c
> @@ -1561,6 +1561,8 @@ static enum es_result vc_check_opcode_bytes(struct es_em_ctxt *ctxt,
>  static void __head setup_svsm_ca(const struct cc_blob_sev_info *cc_info)
>  {
>  	struct snp_secrets_page *secrets_page;
> +	struct snp_cpuid_table *cpuid_table;
> +	unsigned int i;
>  	u64 caa;
>  
>  	BUILD_BUG_ON(sizeof(*secrets_page) != PAGE_SIZE);
> @@ -1607,4 +1609,13 @@ static void __head setup_svsm_ca(const struct cc_blob_sev_info *cc_info)
>  	 */
>  	boot_svsm_caa = (struct svsm_ca *)caa;
>  	boot_svsm_caa_pa = caa;
> +
> +	/* Advertise the SVSM presence via CPUID. */
> +	cpuid_table = (struct snp_cpuid_table *)snp_cpuid_get_table();
> +	for (i = 0; i < cpuid_table->count; i++) {
> +		struct snp_cpuid_fn *fn = &cpuid_table->fn[i];
> +
> +		if (fn->eax_in == 0x8000001f)
> +			fn->eax |= BIT(28);
> +	}
>  }
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index 3f4342b31736..69a756781d90 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -1326,12 +1326,29 @@ int __init sev_es_efi_map_ghcbs(pgd_t *pgd)
>  	return 0;
>  }
>  
> +static enum es_result vc_handle_svsm_caa_msr(struct es_em_ctxt *ctxt)

No need for that helper. And you can reuse the exit_info_1 assignment.
Diff ontop:

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 40eb547d0d6c..7a248d66227e 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1326,31 +1326,25 @@ int __init sev_es_efi_map_ghcbs(pgd_t *pgd)
 	return 0;
 }
 
-static enum es_result vc_handle_svsm_caa_msr(struct es_em_ctxt *ctxt)
-{
-	struct pt_regs *regs = ctxt->regs;
-
-	/* Writes to the SVSM CAA msr are ignored */
-	if (ctxt->insn.opcode.bytes[1] == 0x30)
-		return ES_OK;
-
-	regs->ax = lower_32_bits(this_cpu_read(svsm_caa_pa));
-	regs->dx = upper_32_bits(this_cpu_read(svsm_caa_pa));
-
-	return ES_OK;
-}
-
 static enum es_result vc_handle_msr(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 {
 	struct pt_regs *regs = ctxt->regs;
 	enum es_result ret;
 	u64 exit_info_1;
 
-	if (regs->cx == MSR_SVSM_CAA)
-		return vc_handle_svsm_caa_msr(ctxt);
-
 	/* Is it a WRMSR? */
-	exit_info_1 = (ctxt->insn.opcode.bytes[1] == 0x30) ? 1 : 0;
+	exit_info_1 = !!(ctxt->insn.opcode.bytes[1] == 0x30);
+
+	if (regs->cx == MSR_SVSM_CAA) {
+		/* Writes to the SVSM CAA msr are ignored */
+		if (exit_info_1)
+			return ES_OK;
+
+		regs->ax = lower_32_bits(this_cpu_read(svsm_caa_pa));
+		regs->dx = upper_32_bits(this_cpu_read(svsm_caa_pa));
+
+		return ES_OK;
+	}
 
 	ghcb_set_rcx(ghcb, regs->cx);
 	if (exit_info_1) {

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
