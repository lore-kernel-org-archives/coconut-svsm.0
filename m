Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id D8C831C0D01
 for <svsm-devel@coconut-svsm.dev>; Fri,  3 May 2024 12:34:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1714732470; bh=yoolI6BTv+BQCi2zu/RW+yLYP2FDu5y4KsL/rlMd26M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DIOwmEFVRrnfgfAlB/Pyov49iVCojofkIIOmDwbAnyV3oydu1EGjIT2n1YE25WGMy
 3eQwJXgpHIMp+IZfhEfgrZXVxXE3764VJe1rVxKqkJmv6GDxwT5JraLVcPZIHyURkn
 NatfIYVc+Wri8V9ohL8XYjeHrIG01kRBdVH3e/rHFlIHnqp363Haa+Ej86fhx2hFcd
 lLUUsVrl/j3eTqpXjvPwQtdIl0K8wDDcGVC6aLMsGwNb6xH8zJ8pd20CvSuTpPXqwp
 QS3Dov24BvLWLXKHl75UkKcSyQKTaOt+7s13ZJHXZXEQRB7zh783vFeZeemCNweqe9
 m8zrJ6ZNzSqPnqUjrZMEgkK0THciDWfTqwr41euW2J0SMKq/EWW/dynrRTRkE2EFEH
 PQzrRaX63v7HVAXhXBF3atglGgfm4JkJ7oEXuS+VgIwgUWknSQjmD/uuztmdnNGVpy
 63GYJOo5B55lQPqjxYc2JqQQ+dk5POOlgPSX2I102R2xVZ9u1L7B89AWrQxmp6JTOP
 1BLogMNBkv9pZuAq8aTpNEvfWqW03ijZ19kEeoLckezKpghYPr5PyluuQEQlZZmP0z
 23wQJgs6HF0rFvEub4V/vMrVEQZKZ18ep1a6Dh+lPhRvXToPny3jWv7GQMkC6/Lvzn
 1z5IuLhBjvFinls0cyIT+CG8=
Date: Fri, 3 May 2024 12:34:07 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240503103407.GSZjS9n-XMMKi5ZOek@fat_crate.local>
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

This one would need multiple review mails.

Lemme make this part 1.

On Wed, Apr 24, 2024 at 10:58:01AM -0500, Tom Lendacky wrote:
>  arch/x86/include/asm/sev-common.h |  13 ++
>  arch/x86/include/asm/sev.h        |  32 +++++
>  arch/x86/include/uapi/asm/svm.h   |   1 +
>  arch/x86/kernel/sev-shared.c      |  94 +++++++++++++-
>  arch/x86/kernel/sev.c             | 207 +++++++++++++++++++++++++-----

Ok, now would be as good time as any to start moving the SEV guest bits
to where we want them to live:

arch/x86/coco/sev/

so pls add the new SVSM guest support bits there:

arch/x86/coco/sev/svsm.c
arch/x86/coco/sev/svsm-shared.c

I guess.

And things which touch sev.c and sev-shared.c will have to add patches
which move bits to the new location.

>  arch/x86/mm/mem_encrypt_amd.c     |   8 +-
>  6 files changed, 320 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
> index 1225744a069b..4cc716660d4b 100644
> --- a/arch/x86/include/asm/sev-common.h
> +++ b/arch/x86/include/asm/sev-common.h
> @@ -96,6 +96,19 @@ enum psc_op {
>  	/* GHCBData[63:32] */				\
>  	(((u64)(val) & GENMASK_ULL(63, 32)) >> 32)
>  
> +/* GHCB Run at VMPL Request/Response */

Run?

> +#define GHCB_MSR_VMPL_REQ		0x016
> +#define GHCB_MSR_VMPL_REQ_LEVEL(v)			\
> +	/* GHCBData[39:32] */				\
> +	(((u64)(v) & GENMASK_ULL(7, 0) << 32) |		\
> +	/* GHCBDdata[11:0] */				\
> +	GHCB_MSR_VMPL_REQ)
> +
> +#define GHCB_MSR_VMPL_RESP		0x017
> +#define GHCB_MSR_VMPL_RESP_VAL(v)			\
> +	/* GHCBData[63:32] */				\
> +	(((u64)(v) & GENMASK_ULL(63, 32)) >> 32)
> +
>  /* GHCB Hypervisor Feature Request/Response */
>  #define GHCB_MSR_HV_FT_REQ		0x080
>  #define GHCB_MSR_HV_FT_RESP		0x081

...

> diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
> index 46ea4e5e118a..6f57eb804e70 100644
> --- a/arch/x86/kernel/sev-shared.c
> +++ b/arch/x86/kernel/sev-shared.c
> @@ -18,9 +18,11 @@
>  #define sev_printk_rtl(fmt, ...)	printk_ratelimited(fmt, ##__VA_ARGS__)
>  #else
>  #undef WARN
> -#define WARN(condition, format...) (!!(condition))
> +#define WARN(condition, format...)	(!!(condition))
>  #define sev_printk(fmt, ...)
>  #define sev_printk_rtl(fmt, ...)
> +#undef vc_forward_exception
> +#define vc_forward_exception(c)		panic("SNP: Hypervisor requested exception\n")
>  #endif
>  
>  /*
> @@ -244,6 +246,96 @@ static enum es_result verify_exception_info(struct ghcb *ghcb, struct es_em_ctxt
>  	return ES_VMM_ERROR;
>  }
>  
> +static __always_inline void issue_svsm_call(struct svsm_call *call, u8 *pending)

svsm_issue_call()

I guess.

> +{
> +	/*
> +	 * Issue the VMGEXIT to run the SVSM:

... to call the SVSM:" I guess.

> +	 *   - Load the SVSM register state (RAX, RCX, RDX, R8 and R9)
> +	 *   - Set the CA call pending field to 1
> +	 *   - Issue VMGEXIT
> +	 *   - Save the SVSM return register state (RAX, RCX, RDX, R8 and R9)
> +	 *   - Perform atomic exchange of the CA call pending field
> +	 */

That goes above the function name.

> +	asm volatile("mov %9, %%r8\n\t"
> +		     "mov %10, %%r9\n\t"
> +		     "movb $1, %11\n\t"
> +		     "rep; vmmcall\n\t"
> +		     "mov %%r8, %3\n\t"
> +		     "mov %%r9, %4\n\t"
> +		     "xchgb %5, %11\n\t"
> +		     : "=a" (call->rax_out), "=c" (call->rcx_out), "=d" (call->rdx_out),
> +		       "=m" (call->r8_out), "=m" (call->r9_out),
> +		       "+r" (*pending)
> +		     : "a" (call->rax), "c" (call->rcx), "d" (call->rdx),
> +		       "r" (call->r8), "r" (call->r9),
> +		       "m" (call->caa->call_pending)
> +		     : "r8", "r9", "memory");
> +}

Btw, where are we documenting this calling convention?

Anyway, I think you can do it this way (pasting the whole thing for
easier review):

static __always_inline void issue_svsm_call(struct svsm_call *call, u8 *pending)
{
	register unsigned long r8 asm("r8") = call->r8;
	register unsigned long r9 asm("r9") = call->r9;

	call->caa->call_pending = 1;

	/*
	 * Issue the VMGEXIT to run the SVSM:
	 *   - Load the SVSM register state (RAX, RCX, RDX, R8 and R9)
	 *   - Set the CA call pending field to 1
	 *   - Issue VMGEXIT
	 *   - Save the SVSM return register state (RAX, RCX, RDX, R8 and R9)
	 *   - Perform atomic exchange of the CA call pending field
	 */
	asm volatile("rep; vmmcall\n\t"
		     "xchgb %[pending], %[call_pending]"
		     : "=a" (call->rax_out),
		       "=c" (call->rcx_out),
		       "=d" (call->rdx_out),
		       [pending] "+r" (*pending),
		       "+r" (r8),
		       "+r" (r9)
		     : "a" (call->rax),
		       "c" (call->rcx),
		       "d" (call->rdx),
		       [call_pending] "m" (call->caa->call_pending)
		     : "memory");

	call->r8_out = r8;
	call->r9_out = r9;
}

I *think* the asm is the same but it needs more looking in detail. It
probably could be simplified even more.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
