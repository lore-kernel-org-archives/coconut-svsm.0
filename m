Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::611])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id B26FB1C7BE9
 for <svsm-devel@coconut-svsm.dev>; Wed,  5 Jun 2024 17:19:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjbJFvhCusmjaV8ztNq9uLF6nk+eh+ilw0xpIsXVlQY=;
 b=wNjUNO9SUO655tFS5W7Hn/1brA6qoM13InkveomqSQC4eGhte0netmo6vemN79DDAFr5E5g4nqx+sntS97O38xMeKFAOaHffCYoRfcweNFHySxIgnBGHODIvukf2SCaPfRUutDtgMKNjFg9gReyMhMXp2oV6d0iE7eiaPQkWch8=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 5 Jun 2024 10:18:45 -0500
Message-ID: <9d3fe161be93d4ea60f43c2a3f2c311fe708b63b.1717600736.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1717600736.git.thomas.lendacky@amd.com>
References: <cover.1717600736.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v5 02/13] x86/sev: Check for the presence of an
 SVSM in the SNP Secrets page
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>
Content-Type: text/plain; charset="utf-8"

During early boot phases, check for the presence of an SVSM when running
as an SEV-SNP guest.

An SVSM is present if not running at VMPL0 and the 64-bit value at offset
0x148 into the secrets page is non-zero. If an SVSM is present, save the
SVSM Calling Area address (CAA), located at offset 0x150 into the secrets
page, and set the VMPL level of the guest, which should be non-zero, to
indicate the presence of an SVSM.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 .../arch/x86/amd-memory-encryption.rst        | 23 ++++++
 arch/x86/boot/compressed/sev.c                | 21 +++---
 arch/x86/include/asm/sev-common.h             |  4 ++
 arch/x86/include/asm/sev.h                    | 34 ++++++++-
 arch/x86/kernel/sev-shared.c                  | 71 +++++++++++++++++++
 arch/x86/kernel/sev.c                         |  7 ++
 6 files changed, 151 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/x86/amd-memory-encryption.rst b/Documentation/arch/x86/amd-memory-encryption.rst
index 414bc7402ae7..79eebaa85b7d 100644
--- a/Documentation/arch/x86/amd-memory-encryption.rst
+++ b/Documentation/arch/x86/amd-memory-encryption.rst
@@ -130,4 +130,27 @@ SNP feature support.
 
 More details in AMD64 APM[1] Vol 2: 15.34.10 SEV_STATUS MSR
 
+Secure VM Service Module (SVSM)
+===============================
+SNP provides a feature called Virtual Machine Privilege Levels (VMPL) which
+defines four privilege levels at which guest software can run. The most
+privileged level is 0 and numerically higher numbers have lesser privileges.
+More details in the AMD64 APM[1] Vol 2, section "15.35.7 Virtual Machine
+Privilege Levels", docID: 24593.
+
+When using that feature, different services can run at different protection
+levels, apart from the guest OS but still within the secure SNP environment.
+They can provide services to the guest, like a vTPM, for example.
+
+When a guest is not running at VMPL0, it needs to communicate with the software
+running at VMPL0 to perform privileged operations or to interact with secure
+services. An example fur such a privileged operation is PVALIDATE which is
+*required* to be executed at VMPL0.
+
+In this scenario, the software running at VMPL0 is usually called a Secure VM
+Service Module (SVSM). Discovery of an SVSM and the API used to communicate
+with it is documented in "Secure VM Service Module for SEV-SNP Guests", docID:
+58019[2].
+
 [1] https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24593.pdf
+[2] https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 0457a9d7e515..927b71495122 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -462,6 +462,13 @@ static bool early_snp_init(struct boot_params *bp)
 	 */
 	setup_cpuid_table(cc_info);
 
+	/*
+	 * Record the SVSM Calling Area (CA) address if the guest is not
+	 * running at VMPL0. The CA will be used to communicate with the
+	 * SVSM to perform the SVSM services.
+	 */
+	svsm_setup_ca(cc_info);
+
 	/*
 	 * Pass run-time kernel a pointer to CC info via boot_params so EFI
 	 * config table doesn't need to be searched again during early startup
@@ -571,14 +578,12 @@ void sev_enable(struct boot_params *bp)
 		/*
 		 * Enforce running at VMPL0.
 		 *
-		 * RMPADJUST modifies RMP permissions of a lesser-privileged (numerically
-		 * higher) privilege level. Here, clear the VMPL1 permission mask of the
-		 * GHCB page. If the guest is not running at VMPL0, this will fail.
-		 *
-		 * If the guest is running at VMPL0, it will succeed. Even if that operation
-		 * modifies permission bits, it is still ok to do so currently because Linux
-		 * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
-		 * permission mask changes are a don't-care.
+		 * Use RMPADJUST (see the rmpadjust() function for a description of
+		 * what the instruction does) to update the VMPL1 permissions of a
+		 * page. If the guest is running at VMPL0, this will succeed. If the
+		 * guest is running at any other VMPL, this will fail. Linux SNP guests
+		 * only ever run at a single VMPL level so permission mask changes of a
+		 * lesser-privileged VMPL are a don't-care.
 		 */
 		if (rmpadjust((unsigned long)&boot_ghcb_page, RMP_PG_SIZE_4K, 1))
 			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NOT_VMPL0);
diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
index 5a8246dd532f..d31f2ed398f0 100644
--- a/arch/x86/include/asm/sev-common.h
+++ b/arch/x86/include/asm/sev-common.h
@@ -163,6 +163,10 @@ struct snp_psc_desc {
 #define GHCB_TERM_NOT_VMPL0		3	/* SNP guest is not running at VMPL-0 */
 #define GHCB_TERM_CPUID			4	/* CPUID-validation failure */
 #define GHCB_TERM_CPUID_HV		5	/* CPUID failure during hypervisor fallback */
+#define GHCB_TERM_SECRETS_PAGE		6	/* Secrets page failure */
+#define GHCB_TERM_NO_SVSM		7	/* SVSM is not advertised in the secrets page */
+#define GHCB_TERM_SVSM_VMPL0		8	/* SVSM is present but has set VMPL to 0 */
+#define GHCB_TERM_SVSM_CAA		9	/* SVSM is present but CAA is not page aligned */
 
 #define GHCB_RESP_CODE(v)		((v) & GHCB_MSR_INFO_MASK)
 
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index ca20cc4e5826..16d09c1a8ceb 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -152,9 +152,32 @@ struct snp_secrets_page {
 	u8 vmpck2[VMPCK_KEY_LEN];
 	u8 vmpck3[VMPCK_KEY_LEN];
 	struct secrets_os_area os_area;
-	u8 rsvd3[3840];
+
+	u8 vmsa_tweak_bitmap[64];
+
+	/* SVSM fields */
+	u64 svsm_base;
+	u64 svsm_size;
+	u64 svsm_caa;
+	u32 svsm_max_version;
+	u8 svsm_guest_vmpl;
+	u8 rsvd3[3];
+
+	/* Remainder of page */
+	u8 rsvd4[3744];
 } __packed;
 
+/*
+ * The SVSM Calling Area (CA) related structures.
+ */
+struct svsm_ca {
+	u8 call_pending;
+	u8 mem_available;
+	u8 rsvd1[6];
+
+	u8 svsm_buffer[PAGE_SIZE - 8];
+};
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 extern void __sev_es_ist_enter(struct pt_regs *regs);
 extern void __sev_es_ist_exit(void);
@@ -185,6 +208,15 @@ static inline int rmpadjust(unsigned long vaddr, bool rmp_psize, unsigned long a
 {
 	int rc;
 
+	/*
+	 * RMPADJUST modifies the RMP permissions of a page of a lesser-privileged
+	 * (numerically higher) VMPL.
+	 *
+	 * If the guest is running at a higher-privilege than the privilege level
+	 * the instruction is targeting, the instruction will succeed, otherwise,
+	 * it will fail.
+	 */
+
 	/* "rmpadjust" mnemonic support in binutils 2.36 and newer */
 	asm volatile(".byte 0xF3,0x0F,0x01,0xFE\n\t"
 		     : "=a"(rc)
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index b4f8fa0f722c..739362066e00 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -23,6 +23,21 @@
 #define sev_printk_rtl(fmt, ...)
 #endif
 
+/*
+ * SVSM related information:
+ *   When running under an SVSM, the VMPL that Linux is executing at must be
+ *   non-zero. The VMPL is therefore used to indicate the presence of an SVSM.
+ *
+ *   During boot, the page tables are set up as identity mapped and later
+ *   changed to use kernel virtual addresses. Maintain separate virtual and
+ *   physical addresses for the CAA to allow SVSM functions to be used during
+ *   early boot, both with identity mapped virtual addresses and proper kernel
+ *   virtual addresses.
+ */
+static u8 snp_vmpl __ro_after_init;
+static struct svsm_ca *boot_svsm_caa __ro_after_init;
+static u64 boot_svsm_caa_pa __ro_after_init;
+
 /* I/O parameters for CPUID-related helpers */
 struct cpuid_leaf {
 	u32 fn;
@@ -1269,3 +1284,59 @@ static enum es_result vc_check_opcode_bytes(struct es_em_ctxt *ctxt,
 
 	return ES_UNSUPPORTED;
 }
+
+/*
+ * Maintain the GPA of the SVSM Calling Area (CA) in order to utilize the SVSM
+ * services needed when not running in VMPL0.
+ */
+static void __head svsm_setup_ca(const struct cc_blob_sev_info *cc_info)
+{
+	struct snp_secrets_page *secrets_page;
+	u64 caa;
+
+	BUILD_BUG_ON(sizeof(*secrets_page) != PAGE_SIZE);
+
+	/*
+	 * Check if running at VMPL0.
+	 *
+	 * Use RMPADJUST (see the rmpadjust() function for a description of what
+	 * the instruction does) to update the VMPL1 permissions of a page. If
+	 * the guest is running at VMPL0, this will succeed and implies there is
+	 * no SVSM. If the guest is running at any other VMPL, this will fail.
+	 * Linux SNP guests only ever run at a single VMPL level so permission mask
+	 * changes of a lesser-privileged VMPL are a don't-care.
+	 *
+	 * Use a rip-relative reference to obtain the proper address, since this
+	 * routine is running identity mapped when called, both by the decompressor
+	 * code and the early kernel code.
+	 */
+	if (!rmpadjust((unsigned long)&RIP_REL_REF(boot_ghcb_page), RMP_PG_SIZE_4K, 1))
+		return;
+
+	/*
+	 * Not running at VMPL0, ensure everything has been properly supplied
+	 * for running under an SVSM.
+	 */
+	if (!cc_info || !cc_info->secrets_phys || cc_info->secrets_len != PAGE_SIZE)
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SECRETS_PAGE);
+
+	secrets_page = (struct snp_secrets_page *)cc_info->secrets_phys;
+	if (!secrets_page->svsm_size)
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NO_SVSM);
+
+	if (!secrets_page->svsm_guest_vmpl)
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SVSM_VMPL0);
+
+	RIP_REL_REF(snp_vmpl) = secrets_page->svsm_guest_vmpl;
+
+	caa = secrets_page->svsm_caa;
+	if (caa & (PAGE_SIZE - 1))
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SVSM_CAA);
+
+	/*
+	 * The CA is identity mapped when this routine is called, both by the
+	 * decompressor code and the early kernel code.
+	 */
+	RIP_REL_REF(boot_svsm_caa) = (struct svsm_ca *)caa;
+	RIP_REL_REF(boot_svsm_caa_pa) = caa;
+}
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 3342ed58e168..36a117a38b10 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -2108,6 +2108,13 @@ bool __head snp_init(struct boot_params *bp)
 
 	setup_cpuid_table(cc_info);
 
+	/*
+	 * Record the SVSM Calling Area address (CAA) if the guest is not
+	 * running at VMPL0. The CA will be used to communicate with the
+	 * SVSM to perform the SVSM services.
+	 */
+	svsm_setup_ca(cc_info);
+
 	/*
 	 * The CC blob will be used later to access the secrets page. Cache
 	 * it here like the boot kernel does.
-- 
2.43.2

