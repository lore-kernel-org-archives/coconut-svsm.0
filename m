Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id F1A481C34B4
 for <svsm-devel@coconut-svsm.dev>; Wed,  8 May 2024 10:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1715155530; bh=LNXGTaZk9UkXnDOi5iqZUBv+gZjFYV58YF6GqpPoGg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VcpCYUGmOQALUrqIltbtk+HitoNd08ST0yGp+lNunM3Tisk64JqvmzPlWgzOufeYw
 rsLj5BAuVsLGCuUQm+/Tx4pplFBiMH9jiNMUjKpbhCp5eiFXaQm5ciMjJvGb5CfaDZ
 rAQR8307R+l3IlLcElZ4TLBLapNOfqBcJkh06IEBBx3SXez3O2NAsksd+C8haUr77T
 dQQr0vkKoYeOwYUOttDgs3QOUgfxmN0Wa+hRouL0EH9y8UXianeBp1Jp70ICzUAiOL
 yNSc3DichvjV3N2fhz1lcHmXJlJraVxfTiHeHp5lC8XskgRvCg2ryvKUaFBbmNgMrN
 YD3NTV5zPNpMFhtk/yNEkF+sPtonSaoHwQQk8UF+oR/4MXBMpuHsmBOjLciDBWdYqj
 WKLncIRplOG3KH4GSedOFl4HyYUotPRYJySES2Fqj9LIg7LlsuW6Czlj7XXmKbfMbt
 X+4dvaNVjIQMryva3dFOFplBZeSunHjkqTc5+JQqWyM/yxK0hzwBxLSxp8gJ2pZhYM
 p75KUFdQ8rzN8k4nYD4ZILy8q6pGqTERr+q/TtMrw4/TPRgCxLoFm8y2+W68LUjiZk
 oL2sx2iciRZ/zg5Nk4RKLj/GQaxJ568FNtceUdgqRODTkD2RiG8W4trK3f5QfuQ149
 mALghcqMuX/rBZadaOP5BeJY=
Date: Wed, 8 May 2024 10:05:09 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240508080509.GWZjsyNS0xBXUzKPUG@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <07266b47e749267ef9a9ccbc9e8e9df78ed54857.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <07266b47e749267ef9a9ccbc9e8e9df78ed54857.1713974291.git.thomas.lendacky@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 05/15] x86/sev: Use kernel provided SVSM
 Calling Areas
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

On Wed, Apr 24, 2024 at 10:58:01AM -0500, Tom Lendacky wrote:
> +static int __svsm_msr_protocol(struct svsm_call *call)

All those protocol functions need a verb in the name:

__svsm_do_msr_protocol
__svsm_do_ghcb_protocol

or something slicker than the silly "do".

> +{
> +	u64 val, resp;
> +	u8 pending;
> +
> +	val = sev_es_rd_ghcb_msr();
> +
> +	sev_es_wr_ghcb_msr(GHCB_MSR_VMPL_REQ_LEVEL(0));
> +
> +	pending = 0;

Do that assignment above, at declaration.

> +	issue_svsm_call(call, &pending);
> +
> +	resp = sev_es_rd_ghcb_msr();
> +
> +	sev_es_wr_ghcb_msr(val);

The MSR SVSM protocol is supposed to restore the MSR? A comment pls.

> +
> +	if (pending)
> +		return -EINVAL;
> +
> +	if (GHCB_RESP_CODE(resp) != GHCB_MSR_VMPL_RESP)
> +		return -EINVAL;
> +
> +	if (GHCB_MSR_VMPL_RESP_VAL(resp) != 0)

s/ != 0//

> +		return -EINVAL;
> +
> +	return call->rax_out;

rax_out is u64, your function returns int because of the negative
values. But then it'll truncate the u64 in the success case.

> +}
> +
> +static int __svsm_ghcb_protocol(struct ghcb *ghcb, struct svsm_call *call)
> +{
> +	struct es_em_ctxt ctxt;
> +	u8 pending;
> +
> +	vc_ghcb_invalidate(ghcb);
> +
> +	/* Fill in protocol and format specifiers */
> +	ghcb->protocol_version = ghcb_version;
> +	ghcb->ghcb_usage       = GHCB_DEFAULT_USAGE;
> +
> +	ghcb_set_sw_exit_code(ghcb, SVM_VMGEXIT_SNP_RUN_VMPL);
> +	ghcb_set_sw_exit_info_1(ghcb, 0);
> +	ghcb_set_sw_exit_info_2(ghcb, 0);
> +
> +	sev_es_wr_ghcb_msr(__pa(ghcb));
> +
> +	pending = 0;

As above.

> +	issue_svsm_call(call, &pending);
> +
> +	if (pending)
> +		return -EINVAL;
> +
> +	switch (verify_exception_info(ghcb, &ctxt)) {
> +	case ES_OK:
> +		break;
> +	case ES_EXCEPTION:
> +		vc_forward_exception(&ctxt);
> +		fallthrough;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return call->rax_out;

As above.

> +}
> +
>  static enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
>  					  struct es_em_ctxt *ctxt,
>  					  u64 exit_code, u64 exit_info_1,
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index a500df807e79..21f3cc40d662 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -133,8 +133,13 @@ struct ghcb_state {
>  	struct ghcb *ghcb;
>  };
>  
> +/* For early boot SVSM communication */
> +static struct svsm_ca boot_svsm_ca_page __aligned(PAGE_SIZE);
> +
>  static DEFINE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
>  static DEFINE_PER_CPU(struct sev_es_save_area *, sev_vmsa);
> +static DEFINE_PER_CPU(struct svsm_ca *, svsm_caa);
> +static DEFINE_PER_CPU(u64, svsm_caa_pa);
>  
>  struct sev_config {
>  	__u64 debug		: 1,
> @@ -150,6 +155,15 @@ struct sev_config {
>  	       */
>  	      ghcbs_initialized	: 1,
>  
> +	      /*
> +	       * A flag used to indicate when the per-CPU SVSM CA is to be

s/A flag used //

and above.

> +	       * used instead of the boot SVSM CA.
> +	       *
> +	       * For APs, the per-CPU SVSM CA is created as part of the AP
> +	       * bringup, so this flag can be used globally for the BSP and APs.
> +	       */
> +	      cas_initialized	: 1,
> +
>  	      __reserved	: 62;
>  };
>  
> @@ -572,9 +586,42 @@ static enum es_result vc_ioio_check(struct es_em_ctxt *ctxt, u16 port, size_t si
>  	return ES_EXCEPTION;
>  }
>  
> +static __always_inline void vc_forward_exception(struct es_em_ctxt *ctxt)
> +{
> +	long error_code = ctxt->fi.error_code;
> +	int trapnr = ctxt->fi.vector;
> +
> +	ctxt->regs->orig_ax = ctxt->fi.error_code;
> +
> +	switch (trapnr) {
> +	case X86_TRAP_GP:
> +		exc_general_protection(ctxt->regs, error_code);
> +		break;
> +	case X86_TRAP_UD:
> +		exc_invalid_op(ctxt->regs);
> +		break;
> +	case X86_TRAP_PF:
> +		write_cr2(ctxt->fi.cr2);
> +		exc_page_fault(ctxt->regs, error_code);
> +		break;
> +	case X86_TRAP_AC:
> +		exc_alignment_check(ctxt->regs, error_code);
> +		break;
> +	default:
> +		pr_emerg("Unsupported exception in #VC instruction emulation - can't continue\n");
> +		BUG();
> +	}
> +}
> +
>  /* Include code shared with pre-decompression boot stage */
>  #include "sev-shared.c"
>  
> +static struct svsm_ca *__svsm_get_caa(void)

Why the "__" prefix?

I gon't see a svsm_get_caa() variant...

> +{
> +	return sev_cfg.cas_initialized ? this_cpu_read(svsm_caa)
> +				       : boot_svsm_caa;
> +}
> +
>  static noinstr void __sev_put_ghcb(struct ghcb_state *state)
>  {
>  	struct sev_es_runtime_data *data;
> @@ -600,6 +647,42 @@ static noinstr void __sev_put_ghcb(struct ghcb_state *state)
>  	}
>  }
>  
> +static int svsm_protocol(struct svsm_call *call)

svsm_issue_protocol_call() or whatnot...

Btw, can all this svsm guest gunk live simply in a separate file? Or is
it going to need a lot of sev.c stuff exported through an internal.h
header?

Either that or prefix all SVSM handling functions with "svsm_" so that
there's at least some visibility which is which.

> +{
> +	struct ghcb_state state;
> +	unsigned long flags;
> +	struct ghcb *ghcb;
> +	int ret;
> +
> +	/*
> +	 * This can be called very early in the boot, use native functions in
> +	 * order to avoid paravirt issues.
> +	 */
> +	flags = native_save_fl();
> +	if (flags & X86_EFLAGS_IF)
> +		native_irq_disable();

Uff, conditional locking.

What's wrong with using local_irq_save/local_irq_restore?

> +
> +	if (sev_cfg.ghcbs_initialized)
> +		ghcb = __sev_get_ghcb(&state);
> +	else if (boot_ghcb)
> +		ghcb = boot_ghcb;
> +	else
> +		ghcb = NULL;
> +
> +	do {
> +		ret = ghcb ? __svsm_ghcb_protocol(ghcb, call)
> +			   : __svsm_msr_protocol(call);
> +	} while (ret == SVSM_ERR_BUSY);
> +
> +	if (sev_cfg.ghcbs_initialized)
> +		__sev_put_ghcb(&state);
> +
> +	if (flags & X86_EFLAGS_IF)
> +		native_irq_enable();
> +
> +	return ret;
> +}

...

> @@ -2095,6 +2188,50 @@ static __head struct cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
>  	return cc_info;
>  }
>  
> +static __head void setup_svsm(struct cc_blob_sev_info *cc_info)

svsm_setup

> +{
> +	struct svsm_call call = {};
> +	int ret;
> +	u64 pa;
> +
> +	/*
> +	 * Record the SVSM Calling Area address (CAA) if the guest is not
> +	 * running at VMPL0. The CA will be used to communicate with the
> +	 * SVSM to perform the SVSM services.
> +	 */
> +	setup_svsm_ca(cc_info);
> +
> +	/* Nothing to do if not running under an SVSM. */
> +	if (!vmpl)
> +		return;

You set up stuff above and now you bail out?

Judging by setup_svsm_ca() you don't really need that vmpl var but you
can check

	if (!boot_svsm_caa)
		return;

to determine whether a SVSM was detected.

> +
> +	/*
> +	 * It is very early in the boot and the kernel is running identity
> +	 * mapped but without having adjusted the pagetables to where the
> +	 * kernel was loaded (physbase), so the get the CA address using

s/the //

> +	 * RIP-relative addressing.
> +	 */
> +	pa = (u64)&RIP_REL_REF(boot_svsm_ca_page);
> +
> +	/*
> +	 * Switch over to the boot SVSM CA while the current CA is still
> +	 * addressable. There is no GHCB at this point so use the MSR protocol.
> +	 *
> +	 * SVSM_CORE_REMAP_CA call:
> +	 *   RAX = 0 (Protocol=0, CallID=0)
> +	 *   RCX = New CA GPA
> +	 */
> +	call.caa = __svsm_get_caa();
> +	call.rax = SVSM_CORE_CALL(SVSM_CORE_REMAP_CA);
> +	call.rcx = pa;
> +	ret = svsm_protocol(&call);
> +	if (ret != SVSM_SUCCESS)
> +		panic("Can't remap the SVSM CA, ret=%#x (%d)\n", ret, ret);
> +
> +	boot_svsm_caa = (struct svsm_ca *)pa;
> +	boot_svsm_caa_pa = pa;

Huh, setup_svsm_ca() already assigned those...

>  bool __head snp_init(struct boot_params *bp)
>  {
>  	struct cc_blob_sev_info *cc_info;
> @@ -2108,12 +2245,7 @@ bool __head snp_init(struct boot_params *bp)
>  
>  	setup_cpuid_table(cc_info);
>  
> -	/*
> -	 * Record the SVSM Calling Area address (CAA) if the guest is not
> -	 * running at VMPL0. The CA will be used to communicate with the
> -	 * SVSM to perform the SVSM services.
> -	 */
> -	setup_svsm_ca(cc_info);
> +	setup_svsm(cc_info);
>  
>  	/*
>  	 * The CC blob will be used later to access the secrets page. Cache
> @@ -2306,3 +2438,12 @@ void sev_show_status(void)
>  	}
>  	pr_cont("\n");
>  }
> +
> +void __init snp_remap_svsm_ca(void)
> +{
> +	if (!vmpl)
> +		return;
> +
> +	/* Update the CAA to a proper kernel address */
> +	boot_svsm_caa = &boot_svsm_ca_page;
> +}
> diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
> index 422602f6039b..6155020e4d2d 100644
> --- a/arch/x86/mm/mem_encrypt_amd.c
> +++ b/arch/x86/mm/mem_encrypt_amd.c
> @@ -2,7 +2,7 @@
>  /*
>   * AMD Memory Encryption Support
>   *
> - * Copyright (C) 2016 Advanced Micro Devices, Inc.
> + * Copyright (C) 2016-2024 Advanced Micro Devices, Inc.

Are we doing that now?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
