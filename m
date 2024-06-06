Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 415321C4BAE
 for <svsm-devel@coconut-svsm.dev>; Thu,  6 Jun 2024 14:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1717677418; bh=hCARUglQ0EczUqMmRbsoa1+G52Dl41ypLPGzy2vyutw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eB491hChBeKYe25WOi6cJD5O/Xu0N/PlTkWceQ9dh7lxHbIxuzqoeGGMSMAWhAHAR
 MWYf+6gm2Dow1fBlu8pomThtvds7b7fT/m1e7FTfQiTuVixfDPT6Jnwl03Jom8zVi5
 mg6Istch31nNEiOZd7amqJVB7aWNQ784IP0BCa9Qb/krAwu4+q90U0xhaXX4+PXzqf
 UJ8kGmSwT47TXU+QQuDre4YMcKH2zPlzIbkSj8rU4N/3z+hy6AiPnhSAa+iFWVpPMq
 OboBsmg9ieNy8ur6ZcAYZD23qwdswvloXFwECrg/cW0b0XWFTfcYTvtdOnh3cQq0an
 0rs3v2RIpP/hcEOG/KR5+ahep6e+WSQQWE/sAjNWFWL3WffG2+XR4NtRNnMLrXRg7j
 PkEtR8xYcufwSUCpzlrBnsVYPDnwmGcZsRr5mwsIBYt7aZeTqVyf08G6HWtb2aJhnR
 UgaI8TekYSVosYxlVwq8OZsJp6Hs5BxkqTtmEys4oMTbCpxDPVC2GitAWLjdTkHUZT
 tMsshEgjJCnlIVmLOpIpN6mhBSUk8SbZ54s88gIoP+THDWItxONz0xtS4BX0bpGBd+
 hDcIUMMM1cs9OMCE4R7JK4lk6CWFiIjZxs/WBPUoDSxAFvE6v3WZ4vIeoAlhqTkNYx
 HPeBS6XHNg3K15GftN/SeW00=
Date: Thu, 6 Jun 2024 14:36:37 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240606123637.GBZmGtVcB1BpBCwoAK@fat_crate.local>
References: <cover.1717600736.git.thomas.lendacky@amd.com>
 <fa8021130bcc3bcf14d722a25548cb0cdf325456.1717600736.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fa8021130bcc3bcf14d722a25548cb0cdf325456.1717600736.git.thomas.lendacky@amd.com>
Subject: Re: [svsm-devel] [PATCH v5 03/13] x86/sev: Use kernel provided SVSM
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

On Wed, Jun 05, 2024 at 10:18:46AM -0500, Tom Lendacky wrote:
> The SVSM Calling Area (CA) is used to communicate between Linux and the
> SVSM. Since the firmware supplied CA for the BSP is likely to be in
> reserved memory, switch off that CA to a kernel provided CA so that access
> and use of the CA is available during boot. The CA switch is done using
> the SVSM core protocol SVSM_CORE_REMAP_CA call.
> 
> An SVSM call is executed by filling out the SVSM CA and setting the proper
> register state as documented by the SVSM protocol. The SVSM is invoked by
> by requesting the hypervisor to run VMPL0.
> 
> Once it is safe to allocate/reserve memory, allocate a CA for each CPU.
> After allocating the new CAs, the BSP will switch from the boot CA to the
> per-CPU CA. The CA for an AP is identified to the SVSM when creating the
> VMSA in preparation for booting the AP.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/x86/include/asm/sev-common.h |  13 ++
>  arch/x86/include/asm/sev.h        |  32 +++++
>  arch/x86/include/uapi/asm/svm.h   |   1 +
>  arch/x86/kernel/sev-shared.c      | 128 +++++++++++++++++-
>  arch/x86/kernel/sev.c             | 217 +++++++++++++++++++++++++-----
>  arch/x86/mm/mem_encrypt_amd.c     |   8 +-
>  6 files changed, 360 insertions(+), 39 deletions(-)

Some touchups again:

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index c101b42cb421..4145928d2874 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -290,7 +290,7 @@ void snp_accept_memory(phys_addr_t start, phys_addr_t end);
 u64 snp_get_unsupported_features(u64 status);
 u64 sev_get_status(void);
 void sev_show_status(void);
-void snp_remap_svsm_ca(void);
+void snp_update_svsm_ca(void);
 #else
 static inline void sev_es_ist_enter(struct pt_regs *regs) { }
 static inline void sev_es_ist_exit(void) { }
@@ -320,7 +320,7 @@ static inline void snp_accept_memory(phys_addr_t start, phys_addr_t end) { }
 static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
 static inline u64 sev_get_status(void) { return 0; }
 static inline void sev_show_status(void) { }
-static inline void snp_remap_svsm_ca(void) { }
+static inline void snp_update_svsm_ca(void) { }
 #endif
 
 #ifdef CONFIG_KVM_AMD_SEV
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index b458f3c2242a..b5110c68d241 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -246,7 +246,7 @@ static enum es_result verify_exception_info(struct ghcb *ghcb, struct es_em_ctxt
 	return ES_VMM_ERROR;
 }
 
-static int process_svsm_result_codes(struct svsm_call *call)
+static inline int svsm_process_result_codes(struct svsm_call *call)
 {
 	switch (call->rax_out) {
 	case SVSM_SUCCESS:
@@ -274,7 +274,7 @@ static int process_svsm_result_codes(struct svsm_call *call)
  *     - RAX specifies the SVSM protocol/callid as input and the return code
  *       as output.
  */
-static __always_inline void issue_svsm_call(struct svsm_call *call, u8 *pending)
+static __always_inline void svsm_issue_call(struct svsm_call *call, u8 *pending)
 {
 	register unsigned long rax asm("rax") = call->rax;
 	register unsigned long rcx asm("rcx") = call->rcx;
@@ -310,7 +310,7 @@ static int svsm_perform_msr_protocol(struct svsm_call *call)
 
 	sev_es_wr_ghcb_msr(GHCB_MSR_VMPL_REQ_LEVEL(0));
 
-	issue_svsm_call(call, &pending);
+	svsm_issue_call(call, &pending);
 
 	resp = sev_es_rd_ghcb_msr();
 
@@ -325,7 +325,7 @@ static int svsm_perform_msr_protocol(struct svsm_call *call)
 	if (GHCB_MSR_VMPL_RESP_VAL(resp))
 		return -EINVAL;
 
-	return process_svsm_result_codes(call);
+	return svsm_process_result_codes(call);
 }
 
 static int svsm_perform_ghcb_protocol(struct ghcb *ghcb, struct svsm_call *call)
@@ -348,7 +348,7 @@ static int svsm_perform_ghcb_protocol(struct ghcb *ghcb, struct svsm_call *call)
 
 	sev_es_wr_ghcb_msr(__pa(ghcb));
 
-	issue_svsm_call(call, &pending);
+	svsm_issue_call(call, &pending);
 
 	if (pending)
 		return -EINVAL;
@@ -363,7 +363,7 @@ static int svsm_perform_ghcb_protocol(struct ghcb *ghcb, struct svsm_call *call)
 		return -EINVAL;
 	}
 
-	return process_svsm_result_codes(call);
+	return svsm_process_result_codes(call);
 }
 
 static enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 6bab3244a3b9..51a0984b422c 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -161,7 +161,7 @@ struct sev_config {
 	       * For APs, the per-CPU SVSM CA is created as part of the AP
 	       * bringup, so this flag can be used globally for the BSP and APs.
 	       */
-	      cas_initialized	: 1,
+	      use_cas		: 1,
 
 	      __reserved	: 62;
 };
@@ -615,15 +615,17 @@ static __always_inline void vc_forward_exception(struct es_em_ctxt *ctxt)
 /* Include code shared with pre-decompression boot stage */
 #include "sev-shared.c"
 
-static struct svsm_ca *svsm_get_caa(void)
+static inline struct svsm_ca *svsm_get_caa(void)
 {
 	/*
-	 * Use rip-relative references when called early in the boot. If
-	 * cas_initialized is set, then it is late in the boot and no need
-	 * to worry about rip-relative references.
+	 * Use rIP-relative references when called early in the boot. If
+	 * ->use_cas is set, then it is late in the boot and no need
+	 * to worry about rIP-relative references.
 	 */
-	return RIP_REL_REF(sev_cfg).cas_initialized ? this_cpu_read(svsm_caa)
-						    : RIP_REL_REF(boot_svsm_caa);
+	if (RIP_REL_REF(sev_cfg).use_cas)
+		return this_cpu_read(svsm_caa);
+	else
+		return RIP_REL_REF(boot_svsm_caa);
 }
 
 static noinstr void __sev_put_ghcb(struct ghcb_state *state)
@@ -1517,7 +1519,7 @@ void __init sev_es_init_vc_handling(void)
 			panic("Can't remap the SVSM CA, ret=%d, rax_out=0x%llx\n",
 			      ret, call.rax_out);
 
-		sev_cfg.cas_initialized = true;
+		sev_cfg.use_cas = true;
 
 		local_irq_restore(flags);
 	}
@@ -2443,7 +2445,7 @@ void sev_show_status(void)
 	pr_cont("\n");
 }
 
-void __init snp_remap_svsm_ca(void)
+void __init snp_update_svsm_ca(void)
 {
 	if (!snp_vmpl)
 		return;
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index 6155020e4d2d..84624ae83b71 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -515,7 +515,7 @@ void __init sme_early_init(void)
 	 * Switch the SVSM CA mapping (if active) from identity mapped to
 	 * kernel mapped.
 	 */
-	snp_remap_svsm_ca();
+	snp_update_svsm_ca();
 }
 
 void __init mem_encrypt_free_decrypted_mem(void)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
