Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 6813D1C7CE5
 for <svsm-devel@coconut-svsm.dev>; Thu,  6 Jun 2024 16:39:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1717684745; bh=+LG5ed49RtXEviXf/9mwTYPthSUWIdmD9Du5/B+SoL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iUn8bC65hH12zSAv5Z1ZPeFgEfXppDTQC0RTZhU6a3Dtv3eN0gQ5TIRkgZ6yB7yxF
 qIXe0XtDmefjN7K5zKn5wi1Zo4AbaqUtTG6MqDXGK/JCAVcUi4b3E18reLYRcIyOPY
 5iQZTkFB3c2oD/yVnYH119lPuEhIrrN10IE3F0WRqqep8H2fBfRYE2n3DNJz6yZepe
 tADOSVaT7CcjfNj2xse2+VcVZF/VGrH3xDej3Bp//tnvSVSOHoMrr/jCV45PTOkmNV
 n3fUUljocQFNWPbus1Y562aurZ5AjEXdP/lj/8DKL6089kgfMzFyYyBWkCSTXjotxZ
 q51dFgeG1iS8F/kiug6ASDvef9qhgyCqGbGqYkGFE7fZNzQvAmjO1/FNEBkNZOOCzl
 MLXlyS1a4sT4Z3mIjBBlOW6LsBehDch9/i/aCZvZ5ULDSyhKscjP54Dq5+JzAoa3t6
 zvYDtkitTE6dhossGMsmKqkG5kFFzbO7uEKpR/UZ6GNnlgBTJtdfNvyDyHdWy/B5VB
 AmOxlIXx0QT6bodV5xRYz8ZUDvrOnn0v6JvRf8agMtJurDqpo6499tT7lsRUNK9U7f
 nGVOgO2rc1FdSyaWBvLDbprfpxGOf3DnzpsJvqdAEqrqYVs3w5YR8Vk45RXznDlDE4
 7dgC1VghNqaVjDTso2OqoxgQ=
Date: Thu, 6 Jun 2024 16:38:44 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240606143844.GDZmHJ9CK_aNoD3TSe@fat_crate.local>
References: <cover.1717600736.git.thomas.lendacky@amd.com>
 <4c4017d8b94512d565de9ccb555b1a9f8983c69c.1717600736.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c4017d8b94512d565de9ccb555b1a9f8983c69c.1717600736.git.thomas.lendacky@amd.com>
Subject: Re: [svsm-devel] [PATCH v5 04/13] x86/sev: Perform PVALIDATE using
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

On Wed, Jun 05, 2024 at 10:18:47AM -0500, Tom Lendacky wrote:
> The PVALIDATE instruction can only be performed at VMPL0. An SVSM will
> be present when running at VMPL1 or a lower privilege level.
> 
> When an SVSM is present, use the SVSM_CORE_PVALIDATE call to perform
> memory validation instead of issuing the PVALIDATE instruction directly.
> 
> The validation of a single 4K page is now explicitly identified as such
> in the function name, pvalidate_4k_page(). The pvalidate_pages() function
> is used for validating 1 or more pages at either 4K or 2M in size. Each
> function, however, determines whether it can issue the PVALIDATE directly
> or whether the SVSM needs to be invoked.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/x86/boot/compressed/sev.c |  45 +++++-
>  arch/x86/include/asm/sev.h     |  26 ++++
>  arch/x86/kernel/sev-shared.c   | 250 +++++++++++++++++++++++++++++++--
>  arch/x86/kernel/sev.c          |  30 ++--
>  4 files changed, 325 insertions(+), 26 deletions(-)

Some touchups ontop like slimming down indentation levels, etc.

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 226b68b4a29f..ce941a9890f8 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -284,11 +284,12 @@ void sev_es_shutdown_ghcb(void)
 		error("SEV-ES CPU Features missing.");
 
 	/*
-	 * This is used to determine whether to use the GHCB MSR protocol or
-	 * the GHCB shared page to perform a GHCB request. Since the GHCB page
-	 * is being changed to encrypted, it can't be used to perform GHCB
-	 * requests. Clear the boot_ghcb variable so that the GHCB MSR protocol
-	 * is used to change the GHCB page over to an encrypted page.
+	 * This denotes whether to use the GHCB MSR protocol or the GHCB
+	 * shared page to perform a GHCB request. Since the GHCB page is
+	 * being changed to encrypted, it can't be used to perform GHCB
+	 * requests. Clear the boot_ghcb variable so that the GHCB MSR
+	 * protocol is used to change the GHCB page over to an encrypted
+	 * page.
 	 */
 	boot_ghcb = NULL;
 
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index 8b191e313c0a..b889be32ef9c 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -1220,6 +1220,15 @@ static void __head setup_cpuid_table(const struct cc_blob_sev_info *cc_info)
 	}
 }
 
+static inline void __pval_terminate(u64 pfn, bool action, unsigned int page_size,
+				    int ret, u64 svsm_ret)
+{
+	WARN(1, "PVALIDATE failure: pfn: 0x%llx, action: %u, size: %u, ret: %d, svsm_ret: 0x%llx\n",
+	     pfn, action, page_size, ret, svsm_ret);
+
+	sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PVALIDATE);
+}
+
 static void svsm_pval_terminate(struct svsm_pvalidate_call *pc, int ret, u64 svsm_ret)
 {
 	unsigned int page_size;
@@ -1230,16 +1239,7 @@ static void svsm_pval_terminate(struct svsm_pvalidate_call *pc, int ret, u64 svs
 	action = pc->entry[pc->cur_index].action;
 	page_size = pc->entry[pc->cur_index].page_size;
 
-	WARN(1, "PVALIDATE failure: pfn 0x%llx, action=%u, size=%u - ret=%d, svsm_ret=0x%llx\n",
-	     pfn, action, page_size, ret, svsm_ret);
-	sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PVALIDATE);
-}
-
-static void pval_terminate(u64 pfn, bool action, unsigned int page_size, int ret)
-{
-	WARN(1, "PVALIDATE failure: pfn 0x%llx, action=%u, size=%u - ret=%d\n",
-	     pfn, action, page_size, ret);
-	sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PVALIDATE);
+	__pval_terminate(pfn, action, page_size, ret, svsm_ret);
 }
 
 static void svsm_pval_4k_page(unsigned long paddr, bool validate)
@@ -1284,7 +1284,7 @@ static void pvalidate_4k_page(unsigned long vaddr, unsigned long paddr, bool val
 	int ret;
 
 	/*
-	 * This can be called very early in the boot, so use rip-relative
+	 * This can be called very early during boot, so use rIP-relative
 	 * references as needed.
 	 */
 	if (RIP_REL_REF(snp_vmpl)) {
@@ -1292,7 +1292,7 @@ static void pvalidate_4k_page(unsigned long vaddr, unsigned long paddr, bool val
 	} else {
 		ret = pvalidate(vaddr, RMP_PG_SIZE_4K, validate);
 		if (ret)
-			pval_terminate(PHYS_PFN(paddr), validate, RMP_PG_SIZE_4K, ret);
+			__pval_terminate(PHYS_PFN(paddr), validate, RMP_PG_SIZE_4K, ret, 0);
 	}
 }
 
@@ -1315,16 +1315,19 @@ static void pval_pages(struct snp_psc_desc *desc)
 		validate = e->operation == SNP_PAGE_STATE_PRIVATE;
 
 		rc = pvalidate(vaddr, size, validate);
+		if (!rc)
+			continue;
+
 		if (rc == PVALIDATE_FAIL_SIZEMISMATCH && size == RMP_PG_SIZE_2M) {
 			unsigned long vaddr_end = vaddr + PMD_SIZE;
 
 			for (; vaddr < vaddr_end; vaddr += PAGE_SIZE, pfn++) {
 				rc = pvalidate(vaddr, RMP_PG_SIZE_4K, validate);
 				if (rc)
-					pval_terminate(pfn, validate, RMP_PG_SIZE_4K, rc);
+					__pval_terminate(pfn, validate, RMP_PG_SIZE_4K, rc, 0);
 			}
-		} else if (rc) {
-			pval_terminate(pfn, validate, size, rc);
+		} else {
+			__pval_terminate(pfn, validate, size, rc, 0);
 		}
 	}
 }
@@ -1429,24 +1432,26 @@ static void svsm_pval_pages(struct snp_psc_desc *desc)
 
 		do {
 			ret = svsm_perform_call_protocol(&call);
-			if (ret) {
-				/*
-				 * Check if the entry failed because of an RMP mismatch (a
-				 * PVALIDATE at 2M was requested, but the page is mapped in
-				 * the RMP as 4K).
-				 */
-				if (call.rax_out == SVSM_PVALIDATE_FAIL_SIZEMISMATCH &&
-				    pc->entry[pc->cur_index].page_size == RMP_PG_SIZE_2M) {
-					/* Save this entry for post-processing at 4K */
-					pv_4k[pv_4k_count++] = pc->entry[pc->cur_index];
-
-					/* Skip to the next one unless at the end of the list */
-					pc->cur_index++;
-					if (pc->cur_index < pc->num_entries)
-						ret = -EAGAIN;
-					else
-						ret = 0;
-				}
+			if (!ret)
+				continue;
+
+			/*
+			 * Check if the entry failed because of an RMP mismatch (a
+			 * PVALIDATE at 2M was requested, but the page is mapped in
+			 * the RMP as 4K).
+			 */
+
+			if (call.rax_out == SVSM_PVALIDATE_FAIL_SIZEMISMATCH &&
+			    pc->entry[pc->cur_index].page_size == RMP_PG_SIZE_2M) {
+				/* Save this entry for post-processing at 4K */
+				pv_4k[pv_4k_count++] = pc->entry[pc->cur_index];
+
+				/* Skip to the next one unless at the end of the list */
+				pc->cur_index++;
+				if (pc->cur_index < pc->num_entries)
+					ret = -EAGAIN;
+				else
+					ret = 0;
 			}
 		} while (ret == -EAGAIN);
 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
