Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 36F621C0B84
 for <svsm-devel@coconut-svsm.dev>; Wed, 22 May 2024 20:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1716402263; bh=VKDQ9D3vPxUB5c+NJbgqGDU7CKprw8DEYhYbwJDr73Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KvHKQlMApNXrvaMVs/pZfmgacTGHuFikmSGRpt1WRIki06ije4ukjR3CXEl62dZE9
 Cu/v2ljxn711qfWqwO1BLrHgt9JSBmQwhEaehSZNF0iUo6YT+7M2QDyd91tTDn/7qc
 EfRrD5GgvdtjzXLaQWjpReyt13pzaVCE+R5D6SXdaHbk+Jk4g7faelsyDTuWejkA3A
 /EHDhmF/5i6oyNkKMD6xtZt+BWD+U02bU/RayT/TQEwtxUrS3+lLTGPUZ4BDhk4yYW
 Ln2Sz6cM/93jR9Uczng6fE7KgCxMzaUPLf3F9jXcNIo5iNht8Tz5fHY2TmvmLwXzxD
 YwwFrMF/FD+r+cluMjpnNDvLZNoyDOmJP0Ss3fYYqUWS2xVTyyxDYf0hn4dgWN488s
 ADXrYID5yx2ZD5ZSruGu30/JiDc5/RT2Si/VAl+nKtLfAzaklj1RWulE22K/agcBLN
 RVtEA+UEnqO2YuwAjVniIgmSrVN3xa5EidoZJzg7cM5c2b93mgVx5dZzzME42b/f+i
 yetmiQv+uDOBQyqnX3Ap2cYoH4Jh10jAFZTrHQeNIzQh4NmMk8sg55F1hptUMBa6rj
 1FkfCjyq9IoCtvXrS4oaC1cbIiPmToSOLBpf/zuv3RQy0d9++caeWuAMXatSvfeh9+
 wZiFiKLW//3sNy7wPuY8grZk=
Date: Wed, 22 May 2024 20:24:03 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240522182403.GAZk44Q7DalfDBk7Br@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <ce5f7ded87868adce2f4724415313229a8bf3eb3.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce5f7ded87868adce2f4724415313229a8bf3eb3.1713974291.git.thomas.lendacky@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 06/15] x86/sev: Perform PVALIDATE using
 the SVSM when not at VMPL0
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

On Wed, Apr 24, 2024 at 10:58:02AM -0500, Tom Lendacky wrote:
> The PVALIDATE instruction can only be performed at VMPL0. An SVSM will
> be present when running at VMPL1 or a lower privilege level.

s/when running/when the guest itself is running/

> When an SVSM is present, use the SVSM_CORE_PVALIDATE call to perform
> memory validation instead of issuing the PVALIDATE instruction directly.
> 
> The validation of a single 4K page is now explicitly identified as such
> in the function name, pvalidate_4k_page(). The pvalidate_pages() function
> is used for validating 1 or more pages at either 4K or 2M in size. Each
> function, however, determines whether it can issue the PVALIDATE directly
> or whether the SVSM needs to be invoked.

This all talks more about what this is doing and I'm missing the "why".

It sounds like when you're running a SVSM under the guest, you cannot
use PVALIDATE but the SVSM should do it for you. And you should start
with that.

The rest/details should be visible from the diff.

> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/x86/boot/compressed/sev.c |  45 ++++++++-
>  arch/x86/include/asm/sev.h     |  22 ++++
>  arch/x86/kernel/sev-shared.c   | 179 ++++++++++++++++++++++++++++++++-
>  arch/x86/kernel/sev.c          |  25 +++--
>  4 files changed, 253 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> index cb771b380a6b..32a1e98ffaa9 100644
> --- a/arch/x86/boot/compressed/sev.c
> +++ b/arch/x86/boot/compressed/sev.c
> @@ -130,6 +130,34 @@ static bool fault_in_kernel_space(unsigned long address)
>  /* Include code for early handlers */
>  #include "../../kernel/sev-shared.c"
>  
> +static struct svsm_ca *__svsm_get_caa(void)
> +{
> +	return boot_svsm_caa;
> +}
> +
> +static u64 __svsm_get_caa_pa(void)
> +{
> +	return boot_svsm_caa_pa;
> +}
> +
> +static int svsm_protocol(struct svsm_call *call)

Function name needs a verb.

> +{
> +	struct ghcb *ghcb;
> +	int ret;
> +
> +	if (boot_ghcb)
> +		ghcb = boot_ghcb;
> +	else
> +		ghcb = NULL;
> +
> +	do {
> +		ret = ghcb ? __svsm_ghcb_protocol(ghcb, call)
> +			   : __svsm_msr_protocol(call);
> +	} while (ret == SVSM_ERR_BUSY);
> +
> +	return ret;
> +}
> +
>  bool sev_snp_enabled(void)
>  {
>  	return sev_status & MSR_AMD64_SEV_SNP_ENABLED;
> @@ -146,8 +174,8 @@ static void __page_state_change(unsigned long paddr, enum psc_op op)
>  	 * If private -> shared then invalidate the page before requesting the
>  	 * state change in the RMP table.
>  	 */
> -	if (op == SNP_PAGE_STATE_SHARED && pvalidate(paddr, RMP_PG_SIZE_4K, 0))
> -		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PVALIDATE);
> +	if (op == SNP_PAGE_STATE_SHARED)
> +		pvalidate_4k_page(paddr, paddr, 0);

That is a bool so put a "false" in there.

>  	/* Issue VMGEXIT to change the page state in RMP table. */
>  	sev_es_wr_ghcb_msr(GHCB_MSR_PSC_REQ_GFN(paddr >> PAGE_SHIFT, op));
> @@ -162,8 +190,8 @@ static void __page_state_change(unsigned long paddr, enum psc_op op)
>  	 * Now that page state is changed in the RMP table, validate it so that it is
>  	 * consistent with the RMP entry.
>  	 */
> -	if (op == SNP_PAGE_STATE_PRIVATE && pvalidate(paddr, RMP_PG_SIZE_4K, 1))
> -		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PVALIDATE);
> +	if (op == SNP_PAGE_STATE_PRIVATE)
> +		pvalidate_4k_page(paddr, paddr, 1);

Ditto, but "true".

>  void snp_set_page_private(unsigned long paddr)
> @@ -256,6 +284,15 @@ void sev_es_shutdown_ghcb(void)
>  	if (!sev_es_check_cpu_features())
>  		error("SEV-ES CPU Features missing.");
>  
> +	/*
> +	 * The boot_ghcb value is used to determine whether to use the GHCB MSR

s/The boot_ghcb value /This is used/

> +	 * protocol or the GHCB shared page to perform a GHCB request. Since the
> +	 * GHCB page is being changed to encrypted, it can't be used to perform
> +	 * GHCB requests. Clear the boot_ghcb variable so that the GHCB MSR
> +	 * protocol is used to change the GHCB page over to an encrypted page.
> +	 */
> +	boot_ghcb = NULL;
> +
>  	/*
>  	 * GHCB Page must be flushed from the cache and mapped encrypted again.
>  	 * Otherwise the running kernel will see strange cache effects when
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index 8f180fd3cbf0..e6f1ed3f6ce3 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -187,6 +187,27 @@ struct svsm_ca {
>  #define SVSM_ERR_INVALID_PARAMETER		0x80000005
>  #define SVSM_ERR_INVALID_REQUEST		0x80000006
>  #define SVSM_ERR_BUSY				0x80000007
> +#define SVSM_PVALIDATE_FAIL_SIZEMISMATCH	0x80001006
> +
> +/*
> + * The SVSM PVALIDATE related structures
> + */
> +struct svsm_pvalidate_entry {
> +	u64 page_size		: 2,
> +	    action		: 1,
> +	    ignore_cf		: 1,
> +	    rsvd		: 8,
> +	    pfn			: 52;
> +};
> +
> +struct svsm_pvalidate_call {
> +	u16 entries;
> +	u16 next;
> +
> +	u8 rsvd1[4];
> +
> +	struct svsm_pvalidate_entry entry[];
> +};
>  
>  /*
>   * SVSM protocol structure
> @@ -207,6 +228,7 @@ struct svsm_call {
>  
>  #define SVSM_CORE_CALL(x)		((0ULL << 32) | (x))
>  #define SVSM_CORE_REMAP_CA		0
> +#define SVSM_CORE_PVALIDATE		1
>  
>  #ifdef CONFIG_AMD_MEM_ENCRYPT
>  extern void __sev_es_ist_enter(struct pt_regs *regs);
> diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
> index 6f57eb804e70..b415b10a0823 100644
> --- a/arch/x86/kernel/sev-shared.c
> +++ b/arch/x86/kernel/sev-shared.c
> @@ -40,6 +40,9 @@ static u8 vmpl __ro_after_init;
>  static struct svsm_ca *boot_svsm_caa __ro_after_init;
>  static u64 boot_svsm_caa_pa __ro_after_init;
>  
> +static struct svsm_ca *__svsm_get_caa(void);
> +static u64 __svsm_get_caa_pa(void);

Are we being lazy again? :)

So I know the below is bigger than two silly forward declarations but
forward declarations are a sign that our source code placement is
lacking and if we keep piling on that, it'll become a mess soon. And
guess who gets to mop up after y'all who don't have time to do it
because you have to enable features? :-\

So in order to avoid that, we'll re-position it to where we think it'll
be better going forward.

Btw, this is the second time, at least, where I think that that
sev-shared.c thing is starting to become more of a nuisance than a code
savings thing but I don't have a better idea for it yet.

So let's extend that ifdeffery at the top which provides things which
are called the same but defined differently depending on whether we're
in the decompressor or kernel proper.

IOW, something like this, ontop:

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 32a1e98ffaa9..9d89fc67574b 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -130,16 +130,6 @@ static bool fault_in_kernel_space(unsigned long address)
 /* Include code for early handlers */
 #include "../../kernel/sev-shared.c"
 
-static struct svsm_ca *__svsm_get_caa(void)
-{
-	return boot_svsm_caa;
-}
-
-static u64 __svsm_get_caa_pa(void)
-{
-	return boot_svsm_caa_pa;
-}
-
 static int svsm_protocol(struct svsm_call *call)
 {
 	struct ghcb *ghcb;
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index b415b10a0823..b4f1fd780925 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -11,20 +11,6 @@
 
 #include <asm/setup_data.h>
 
-#ifndef __BOOT_COMPRESSED
-#define error(v)			pr_err(v)
-#define has_cpuflag(f)			boot_cpu_has(f)
-#define sev_printk(fmt, ...)		printk(fmt, ##__VA_ARGS__)
-#define sev_printk_rtl(fmt, ...)	printk_ratelimited(fmt, ##__VA_ARGS__)
-#else
-#undef WARN
-#define WARN(condition, format...)	(!!(condition))
-#define sev_printk(fmt, ...)
-#define sev_printk_rtl(fmt, ...)
-#undef vc_forward_exception
-#define vc_forward_exception(c)		panic("SNP: Hypervisor requested exception\n")
-#endif
-
 /*
  * SVSM related information:
  *   When running under an SVSM, the VMPL that Linux is executing at must be
@@ -40,8 +26,47 @@ static u8 vmpl __ro_after_init;
 static struct svsm_ca *boot_svsm_caa __ro_after_init;
 static u64 boot_svsm_caa_pa __ro_after_init;
 
-static struct svsm_ca *__svsm_get_caa(void);
-static u64 __svsm_get_caa_pa(void);
+#ifdef __BOOT_COMPRESSED
+
+#undef WARN
+#define WARN(condition, format...)	(!!(condition))
+#define sev_printk(fmt, ...)
+#define sev_printk_rtl(fmt, ...)
+#undef vc_forward_exception
+#define vc_forward_exception(c)		panic("SNP: Hypervisor requested exception\n")
+
+static struct svsm_ca *__svsm_get_caa(void)
+{
+	return boot_svsm_caa;
+}
+
+static u64 __svsm_get_caa_pa(void)
+{
+	return boot_svsm_caa_pa;
+}
+
+#else /* __BOOT_COMPRESSED */
+
+#define error(v)			pr_err(v)
+#define has_cpuflag(f)			boot_cpu_has(f)
+#define sev_printk(fmt, ...)		printk(fmt, ##__VA_ARGS__)
+#define sev_printk_rtl(fmt, ...)	printk_ratelimited(fmt, ##__VA_ARGS__)
+
+static DEFINE_PER_CPU(struct svsm_ca *, svsm_caa);
+
+static struct svsm_ca *__svsm_get_caa(void)
+{
+	return sev_cfg.cas_initialized ? this_cpu_read(svsm_caa)
+				       : boot_svsm_caa;
+}
+
+static u64 __svsm_get_caa_pa(void)
+{
+	return sev_cfg.cas_initialized ? this_cpu_read(svsm_caa_pa)
+				       : boot_svsm_caa_pa;
+}
+
+#endif /* __BOOT_COMPRESSED */
 
 /* I/O parameters for CPUID-related helpers */
 struct cpuid_leaf {
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index bb6455ff45a2..db895a7a9401 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -138,7 +138,6 @@ static struct svsm_ca boot_svsm_ca_page __aligned(PAGE_SIZE);
 
 static DEFINE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
 static DEFINE_PER_CPU(struct sev_es_save_area *, sev_vmsa);
-static DEFINE_PER_CPU(struct svsm_ca *, svsm_caa);
 static DEFINE_PER_CPU(u64, svsm_caa_pa);
 
 struct sev_config {
@@ -616,18 +615,6 @@ static __always_inline void vc_forward_exception(struct es_em_ctxt *ctxt)
 /* Include code shared with pre-decompression boot stage */
 #include "sev-shared.c"
 
-static struct svsm_ca *__svsm_get_caa(void)
-{
-	return sev_cfg.cas_initialized ? this_cpu_read(svsm_caa)
-				       : boot_svsm_caa;
-}
-
-static u64 __svsm_get_caa_pa(void)
-{
-	return sev_cfg.cas_initialized ? this_cpu_read(svsm_caa_pa)
-				       : boot_svsm_caa_pa;
-}
-
 static noinstr void __sev_put_ghcb(struct ghcb_state *state)
 {
 	struct sev_es_runtime_data *data;

> +
>  /* I/O parameters for CPUID-related helpers */
>  struct cpuid_leaf {
>  	u32 fn;
> @@ -102,6 +105,8 @@ static u32 cpuid_std_range_max __ro_after_init;
>  static u32 cpuid_hyp_range_max __ro_after_init;
>  static u32 cpuid_ext_range_max __ro_after_init;
>  
> +static int svsm_protocol(struct svsm_call *call);

You get the idea...

>  static bool __init sev_es_check_cpu_features(void)
>  {
>  	if (!has_cpuflag(X86_FEATURE_RDRAND)) {
> @@ -1186,7 +1191,65 @@ static void __head setup_cpuid_table(const struct cc_blob_sev_info *cc_info)
>  	}
>  }
>  
> -static void pvalidate_pages(struct snp_psc_desc *desc)
> +static int base_pvalidate_4k_page(unsigned long vaddr, bool validate)
> +{
> +	return pvalidate(vaddr, RMP_PG_SIZE_4K, validate);
> +}

There are those silly wrappers again. Kill it pls.

> +
> +static int svsm_pvalidate_4k_page(unsigned long paddr, bool validate)

Will there ever be a pvalidate_2M_page?

If so, then you need to redesign this to have a lower-level helper

	__svsm_pvalidate_page(... ,size, );

and the 4K and 2M things call it.

> +{
> +	struct svsm_pvalidate_call *pvalidate_call;

Too long:

	struct svsm_pvalidate_call *pvl_call;

> +	struct svsm_call call = {};

I guess this needs to be

	struct svsm_call svsm_call = {};

so that you know what kind of call it is - you have two.

> +	u64 pvalidate_call_pa;
> +	unsigned long flags;
> +	int ret;
> +
> +	/*
> +	 * This can be called very early in the boot, use native functions in
> +	 * order to avoid paravirt issues.
> +	 */
> +	flags = native_save_fl();
> +	if (flags & X86_EFLAGS_IF)
> +		native_irq_disable();

Yeah, this'll change.

> +	call.caa = __svsm_get_caa();
> +
> +	pvalidate_call = (struct svsm_pvalidate_call *)call.caa->svsm_buffer;

That's almost a page worth of data, we don't zero it. How sensitive
would this be if the SVSM sees some old data?

Or we trust the SVSM and all is good?

> +	pvalidate_call_pa = __svsm_get_caa_pa() + offsetof(struct svsm_ca, svsm_buffer);
> +
> +	pvalidate_call->entries = 1;
> +	pvalidate_call->next    = 0;
> +	pvalidate_call->entry[0].page_size = RMP_PG_SIZE_4K;
> +	pvalidate_call->entry[0].action    = validate;
> +	pvalidate_call->entry[0].ignore_cf = 0;
> +	pvalidate_call->entry[0].pfn       = paddr >> PAGE_SHIFT;
> +
> +	/* Protocol 0, Call ID 1 */
> +	call.rax = SVSM_CORE_CALL(SVSM_CORE_PVALIDATE);
> +	call.rcx = pvalidate_call_pa;
> +
> +	ret = svsm_protocol(&call);
> +
> +	if (flags & X86_EFLAGS_IF)
> +		native_irq_enable();
> +
> +	return ret;
> +}
> +
> +static void pvalidate_4k_page(unsigned long vaddr, unsigned long paddr, bool validate)
> +{
> +	int ret;
> +
> +	ret = vmpl ? svsm_pvalidate_4k_page(paddr, validate)
> +		   : base_pvalidate_4k_page(vaddr, validate);

	if (vmpl)
		ret = svsm_pvalidate_4k_page(paddr, validate);
	else
		ret = pvalidate(vaddr, RMP_PG_SIZE_4K, validate);

No need for silly wrappers.

> +
> +	if (ret) {
> +		WARN(1, "Failed to validate address 0x%lx ret %d", vaddr, ret);
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PVALIDATE);
> +	}
> +}
> +
> +static void base_pvalidate_pages(struct snp_psc_desc *desc)
>  {
>  	struct psc_entry *e;
>  	unsigned long vaddr;
> @@ -1220,6 +1283,120 @@ static void pvalidate_pages(struct snp_psc_desc *desc)
>  	}
>  }
>  
> +static void svsm_pvalidate_pages(struct snp_psc_desc *desc)
> +{
> +	struct svsm_pvalidate_call *pvalidate_call;

shorten to "pvl_call" or so.

> +	struct svsm_pvalidate_entry *pe;

See, like this. :-P

> +	unsigned int call_count, i;
> +	struct svsm_call call = {};
> +	u64 pvalidate_call_pa;
> +	struct psc_entry *e;
> +	unsigned long flags;
> +	unsigned long vaddr;
> +	bool action;
> +	int ret;
> +
> +	/*
> +	 * This can be called very early in the boot, use native functions in
> +	 * order to avoid paravirt issues.
> +	 */
> +	flags = native_save_fl();
> +	if (flags & X86_EFLAGS_IF)
> +		native_irq_disable();
> +
> +	call.caa = __svsm_get_caa();
> +
> +	pvalidate_call = (struct svsm_pvalidate_call *)call.caa->svsm_buffer;
> +	pvalidate_call_pa = __svsm_get_caa_pa() + offsetof(struct svsm_ca, svsm_buffer);

As above.

> +	/* Calculate how many entries the CA buffer can hold */
> +	call_count = sizeof(call.caa->svsm_buffer);
> +	call_count -= offsetof(struct svsm_pvalidate_call, entry);
> +	call_count /= sizeof(pvalidate_call->entry[0]);
> +
> +	/* Protocol 0, Call ID 1 */
> +	call.rax = SVSM_CORE_CALL(SVSM_CORE_PVALIDATE);
> +	call.rcx = pvalidate_call_pa;
> +
> +	pvalidate_call->entries = 0;
> +	pvalidate_call->next    = 0;

Or you simply memset the whole thing and be safe.

> +	for (i = 0; i <= desc->hdr.end_entry; i++) {
> +		e = &desc->entries[i];
> +		pe = &pvalidate_call->entry[pvalidate_call->entries];
> +
> +		pe->page_size = e->pagesize ? RMP_PG_SIZE_2M : RMP_PG_SIZE_4K;
> +		pe->action    = e->operation == SNP_PAGE_STATE_PRIVATE;
> +		pe->ignore_cf = 0;
> +		pe->pfn       = e->gfn;
> +
> +		pvalidate_call->entries++;
> +		if (pvalidate_call->entries < call_count && i != desc->hdr.end_entry)
> +			continue;
> +
> +		ret = svsm_protocol(&call);
> +		if (ret == SVSM_PVALIDATE_FAIL_SIZEMISMATCH &&
> +		    pvalidate_call->entry[pvalidate_call->next].page_size == RMP_PG_SIZE_2M) {
> +			u64 pfn, pfn_end;
> +
> +			/*
> +			 * The "next" field is the index of the failed entry. Calculate the
> +			 * index of the entry after the failed entry before the fields are
> +			 * cleared so that processing can continue on from that point (take
> +			 * into account the for loop adding 1 to the entry).
> +			 */
> +			i -= pvalidate_call->entries - pvalidate_call->next;
> +			i += 1;
> +
> +			action = pvalidate_call->entry[pvalidate_call->next].action;
> +			pfn = pvalidate_call->entry[pvalidate_call->next].pfn;
> +			pfn_end = pfn + 511;
> +
> +			pvalidate_call->entries = 0;
> +			pvalidate_call->next    = 0;

You did that above before the loop. Looks weird doing it again.

> +			for (; pfn <= pfn_end; pfn++) {
> +				pe = &pvalidate_call->entry[pvalidate_call->entries];
> +
> +				pe->page_size = RMP_PG_SIZE_4K;
> +				pe->action    = action;
> +				pe->ignore_cf = 0;
> +				pe->pfn       = pfn;
> +
> +				pvalidate_call->entries++;
> +				if (pvalidate_call->entries < call_count && pfn != pfn_end)
> +					continue;
> +
> +				ret = svsm_protocol(&call);
> +				if (ret != SVSM_SUCCESS)
> +					break;
> +
> +				pvalidate_call->entries = 0;
> +				pvalidate_call->next    = 0;
> +			}
> +		}

I have no clue what's going on in this function. Sounds like it needs
splitting. And commenting too. Like the loop body should be something
like svsm_pvalidate_entry() or so.

And then that second loop wants to be a separate function too as it is
calling the SVSM protocol again.

> +
> +		if (ret != SVSM_SUCCESS) {
> +			pe = &pvalidate_call->entry[pvalidate_call->next];
> +			vaddr = (unsigned long)pfn_to_kaddr(pe->pfn);
> +
> +			WARN(1, "Failed to validate address %lx ret=%#x (%d)", vaddr, ret, ret);
> +			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PVALIDATE);
> +		}
> +
> +		pvalidate_call->entries = 0;
> +		pvalidate_call->next    = 0;

And here it is again. If anything, splitting and comments are needed
here at least.

...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
