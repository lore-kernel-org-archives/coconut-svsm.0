Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 566D81CA051
 for <svsm-devel@coconut-svsm.dev>; Wed, 24 Apr 2024 17:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qa9qGzd4f67WtUpq1M7yG8u8qe9Yy9BZe6DqeXmZ8FA=;
 b=pf2W+TG0b6qDFYJAS+O9dypfwQiq42TjgBcyJNb6WBHUgxkMDHv20YEtsghPFJg/BJArNtMAIA4mDV7VluW/6Nbn19lvaffJWn50wWWYj6TiC31sx0MVSKRMX0Sl4LfUxe/yfcvGsQ+DK0EOeRBYw8MwFKua4adEJrTv2rp/A9g=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 24 Apr 2024 10:58:00 -0500
Message-ID: <6cf54cac47f212f4c2b59b123855d8c183989022.1713974291.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1713974291.git.thomas.lendacky@amd.com>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v4 04/15] x86/sev: Check for the presence of an
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
 .../arch/x86/amd-memory-encryption.rst        | 22 ++++++
 arch/x86/boot/compressed/sev.c                |  8 +++
 arch/x86/include/asm/sev-common.h             |  4 ++
 arch/x86/include/asm/sev.h                    | 25 ++++++-
 arch/x86/kernel/sev-shared.c                  | 70 +++++++++++++++++++
 arch/x86/kernel/sev.c                         |  7 ++
 6 files changed, 135 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/amd-memory-encryption.rst b/Documentation/arch/x86/amd-memory-encryption.rst
index 414bc7402ae7..32737718d4a2 100644
--- a/Documentation/arch/x86/amd-memory-encryption.rst
+++ b/Documentation/arch/x86/amd-memory-encryption.rst
@@ -130,4 +130,26 @@ SNP feature support.
 
 More details in AMD64 APM[1] Vol 2: 15.34.10 SEV_STATUS MSR
 
+Secure VM Service Module (SVSM)
+===============================
+
+SNP provides a feature called Virtual Machine Privilege Levels (VMPL). The most
+privileged VMPL is 0 with numerically higher numbers having lesser privileges.
+More details in AMD64 APM[1] Vol 2: 15.35.7 Virtual Machine Privilege Levels.
+
+The VMPL feature provides the ability to run software services at a more
+privileged level than the guest OS is running at. This provides a secure
+environment for services within the guest's SNP environment, while protecting
+the service from hypervisor interference. An example of a secure service
+would be a virtual TPM (vTPM). Additionally, certain operations require the
+guest to be running at VMPL0 in order for them to be performed. For example,
+the PVALIDATE instruction is required to be executed at VMPL0.
+
+When a guest is not running at VMPL0, it needs to communicate with the software
+running at VMPL0 to perform privileged operations or to interact with secure
+services. This software running at VMPL0 is known as a Secure VM Service Module
+(SVSM). Discovery of an SVSM and the API used to communicate with it is
+documented in Secure VM Service Module for SEV-SNP Guests[2].
+
 [1] https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24593.pdf
+[2] https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 0457a9d7e515..cb771b380a6b 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -12,6 +12,7 @@
  */
 #include "misc.h"
 
+#include <linux/mm.h>
 #include <asm/bootparam.h>
 #include <asm/pgtable_types.h>
 #include <asm/sev.h>
@@ -462,6 +463,13 @@ static bool early_snp_init(struct boot_params *bp)
 	 */
 	setup_cpuid_table(cc_info);
 
+	/*
+	 * Record the SVSM Calling Area (CA) address if the guest is not
+	 * running at VMPL0. The CA will be used to communicate with the
+	 * SVSM to perform the SVSM services.
+	 */
+	setup_svsm_ca(cc_info);
+
 	/*
 	 * Pass run-time kernel a pointer to CC info via boot_params so EFI
 	 * config table doesn't need to be searched again during early startup
diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
index b463fcbd4b90..1225744a069b 100644
--- a/arch/x86/include/asm/sev-common.h
+++ b/arch/x86/include/asm/sev-common.h
@@ -159,6 +159,10 @@ struct snp_psc_desc {
 #define GHCB_TERM_NOT_VMPL0		3	/* SNP guest is not running at VMPL-0 */
 #define GHCB_TERM_CPUID			4	/* CPUID-validation failure */
 #define GHCB_TERM_CPUID_HV		5	/* CPUID failure during hypervisor fallback */
+#define GHCB_TERM_SECRETS_PAGE		6	/* Secrets page failure */
+#define GHCB_TERM_NO_SVSM		7	/* SVSM is not advertised in the secrets page */
+#define GHCB_TERM_SVSM_VMPL0		8	/* SVSM is present but has set VMPL to 0 */
+#define GHCB_TERM_SVSM_CAA		9	/* SVSM is present but CAA is not page aligned */
 
 #define GHCB_RESP_CODE(v)		((v) & GHCB_MSR_INFO_MASK)
 
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 48bc397db649..56f7d843f7a4 100644
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
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index b4f8fa0f722c..46ea4e5e118a 100644
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
+static u8 vmpl __ro_after_init;
+static struct svsm_ca *boot_svsm_caa __ro_after_init;
+static u64 boot_svsm_caa_pa __ro_after_init;
+
 /* I/O parameters for CPUID-related helpers */
 struct cpuid_leaf {
 	u32 fn;
@@ -1269,3 +1284,58 @@ static enum es_result vc_check_opcode_bytes(struct es_em_ctxt *ctxt,
 
 	return ES_UNSUPPORTED;
 }
+
+/*
+ * Maintain the GPA of the SVSM Calling Area (CA) in order to utilize the SVSM
+ * services needed when not running in VMPL0.
+ */
+static void __head setup_svsm_ca(const struct cc_blob_sev_info *cc_info)
+{
+	struct snp_secrets_page *secrets_page;
+	u64 caa;
+
+	BUILD_BUG_ON(sizeof(*secrets_page) != PAGE_SIZE);
+
+	/*
+	 * RMPADJUST modifies RMP permissions of a lesser-privileged (numerically
+	 * higher) privilege level. Here, clear the VMPL1 permission mask of the
+	 * GHCB page. If the guest is not running at VMPL0, this will fail.
+	 *
+	 * If the guest is running at VMPL0, it will succeed. Even if that operation
+	 * modifies permission bits, it is still ok to do so currently because Linux
+	 * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
+	 * permission mask changes are a don't-care.
+	 *
+	 * Use __pa() since this routine is running identity mapped when called,
+	 * both by the decompressor code and the early kernel code.
+	 */
+	if (!rmpadjust((unsigned long)__pa(&boot_ghcb_page), RMP_PG_SIZE_4K, 1))
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
+	vmpl = secrets_page->svsm_guest_vmpl;
+
+	caa = secrets_page->svsm_caa;
+	if (!PAGE_ALIGNED(caa))
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SVSM_CAA);
+
+	/*
+	 * The CA is identity mapped when this routine is called, both by the
+	 * decompressor code and the early kernel code.
+	 */
+	boot_svsm_caa = (struct svsm_ca *)caa;
+	boot_svsm_caa_pa = caa;
+}
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 6949fbccec40..a500df807e79 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -2108,6 +2108,13 @@ bool __head snp_init(struct boot_params *bp)
 
 	setup_cpuid_table(cc_info);
 
+	/*
+	 * Record the SVSM Calling Area address (CAA) if the guest is not
+	 * running at VMPL0. The CA will be used to communicate with the
+	 * SVSM to perform the SVSM services.
+	 */
+	setup_svsm_ca(cc_info);
+
 	/*
 	 * The CC blob will be used later to access the secrets page. Cache
 	 * it here like the boot kernel does.
-- 
2.43.2

