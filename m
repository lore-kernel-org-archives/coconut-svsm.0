Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 29F561E983D
 for <svsm-devel@coconut-svsm.dev>; Mon, 25 Mar 2024 23:26:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tU4myvcDtCnR1U+pxZrwfxKRIdvQWY1JvfuKBFtRs3M=;
 b=KFnQfFA7AmpVa2GTO5493mnBSLF4Qufu0x0C12fgmvRPDbImXVNbACBMUg1vCB+GfXb+UBOQIC8hmJ3adaqI6rybTot3TSF2AG4Da8k6++qIVPwPuBkWalDGmxvFY/kN8HYfJPg2q9Brf5TnwULXVov77QWUzveznfnj0HvdxwQ=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Mon, 25 Mar 2024 17:26:20 -0500
Message-ID: <425afa6512994b1ca1bb366eb7abfb24d65175aa.1711405593.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1711405593.git.thomas.lendacky@amd.com>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v3 01/14] x86/sev: Rename snp_init() in the
 boot/compressed/sev.c file
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

The snp_init() in boot/compressed/sev.c is local to that file and is not
called from outside of the file. Change the name so that it is not tied
to the function definition in arch/x86/include/asm/sev.h. Move the renamed
snp_init() and related functions up in the file to avoid having to add a
forward declaration and make the function static, too.

This will allow the snp_init() function in arch/x86/kernel/sev.c to be
changed without having to make the same change in boot/compressed/sev.c.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/boot/compressed/sev.c | 162 ++++++++++++++++-----------------
 1 file changed, 81 insertions(+), 81 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index ec71846d28c9..5ad0ff4664f1 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -413,6 +413,85 @@ void snp_check_features(void)
 	}
 }
 
+/* Search for Confidential Computing blob in the EFI config table. */
+static struct cc_blob_sev_info *find_cc_blob_efi(struct boot_params *bp)
+{
+	unsigned long cfg_table_pa;
+	unsigned int cfg_table_len;
+	int ret;
+
+	ret = efi_get_conf_table(bp, &cfg_table_pa, &cfg_table_len);
+	if (ret)
+		return NULL;
+
+	return (struct cc_blob_sev_info *)efi_find_vendor_table(bp, cfg_table_pa,
+								cfg_table_len,
+								EFI_CC_BLOB_GUID);
+}
+
+/*
+ * Initial set up of SNP relies on information provided by the
+ * Confidential Computing blob, which can be passed to the boot kernel
+ * by firmware/bootloader in the following ways:
+ *
+ * - via an entry in the EFI config table
+ * - via a setup_data structure, as defined by the Linux Boot Protocol
+ *
+ * Scan for the blob in that order.
+ */
+static struct cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
+{
+	struct cc_blob_sev_info *cc_info;
+
+	cc_info = find_cc_blob_efi(bp);
+	if (cc_info)
+		goto found_cc_info;
+
+	cc_info = find_cc_blob_setup_data(bp);
+	if (!cc_info)
+		return NULL;
+
+found_cc_info:
+	if (cc_info->magic != CC_BLOB_SEV_HDR_MAGIC)
+		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SNP_UNSUPPORTED);
+
+	return cc_info;
+}
+
+/*
+ * Indicate SNP based on presence of SNP-specific CC blob. Subsequent checks
+ * will verify the SNP CPUID/MSR bits.
+ */
+static bool early_snp_init(struct boot_params *bp)
+{
+	struct cc_blob_sev_info *cc_info;
+
+	if (!bp)
+		return false;
+
+	cc_info = find_cc_blob(bp);
+	if (!cc_info)
+		return false;
+
+	/*
+	 * If a SNP-specific Confidential Computing blob is present, then
+	 * firmware/bootloader have indicated SNP support. Verifying this
+	 * involves CPUID checks which will be more reliable if the SNP
+	 * CPUID table is used. See comments over snp_setup_cpuid_table() for
+	 * more details.
+	 */
+	setup_cpuid_table(cc_info);
+
+	/*
+	 * Pass run-time kernel a pointer to CC info via boot_params so EFI
+	 * config table doesn't need to be searched again during early startup
+	 * phase.
+	 */
+	bp->cc_blob_address = (u32)(unsigned long)cc_info;
+
+	return true;
+}
+
 /*
  * sev_check_cpu_support - Check for SEV support in the CPU capabilities
  *
@@ -463,7 +542,7 @@ void sev_enable(struct boot_params *bp)
 		bp->cc_blob_address = 0;
 
 	/*
-	 * Do an initial SEV capability check before snp_init() which
+	 * Do an initial SEV capability check before early_snp_init() which
 	 * loads the CPUID page and the same checks afterwards are done
 	 * without the hypervisor and are trustworthy.
 	 *
@@ -478,7 +557,7 @@ void sev_enable(struct boot_params *bp)
 	 * Setup/preliminary detection of SNP. This will be sanity-checked
 	 * against CPUID/MSR values later.
 	 */
-	snp = snp_init(bp);
+	snp = early_snp_init(bp);
 
 	/* Now repeat the checks with the SNP CPUID table. */
 
@@ -535,85 +614,6 @@ u64 sev_get_status(void)
 	return m.q;
 }
 
-/* Search for Confidential Computing blob in the EFI config table. */
-static struct cc_blob_sev_info *find_cc_blob_efi(struct boot_params *bp)
-{
-	unsigned long cfg_table_pa;
-	unsigned int cfg_table_len;
-	int ret;
-
-	ret = efi_get_conf_table(bp, &cfg_table_pa, &cfg_table_len);
-	if (ret)
-		return NULL;
-
-	return (struct cc_blob_sev_info *)efi_find_vendor_table(bp, cfg_table_pa,
-								cfg_table_len,
-								EFI_CC_BLOB_GUID);
-}
-
-/*
- * Initial set up of SNP relies on information provided by the
- * Confidential Computing blob, which can be passed to the boot kernel
- * by firmware/bootloader in the following ways:
- *
- * - via an entry in the EFI config table
- * - via a setup_data structure, as defined by the Linux Boot Protocol
- *
- * Scan for the blob in that order.
- */
-static struct cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
-{
-	struct cc_blob_sev_info *cc_info;
-
-	cc_info = find_cc_blob_efi(bp);
-	if (cc_info)
-		goto found_cc_info;
-
-	cc_info = find_cc_blob_setup_data(bp);
-	if (!cc_info)
-		return NULL;
-
-found_cc_info:
-	if (cc_info->magic != CC_BLOB_SEV_HDR_MAGIC)
-		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SNP_UNSUPPORTED);
-
-	return cc_info;
-}
-
-/*
- * Indicate SNP based on presence of SNP-specific CC blob. Subsequent checks
- * will verify the SNP CPUID/MSR bits.
- */
-bool snp_init(struct boot_params *bp)
-{
-	struct cc_blob_sev_info *cc_info;
-
-	if (!bp)
-		return false;
-
-	cc_info = find_cc_blob(bp);
-	if (!cc_info)
-		return false;
-
-	/*
-	 * If a SNP-specific Confidential Computing blob is present, then
-	 * firmware/bootloader have indicated SNP support. Verifying this
-	 * involves CPUID checks which will be more reliable if the SNP
-	 * CPUID table is used. See comments over snp_setup_cpuid_table() for
-	 * more details.
-	 */
-	setup_cpuid_table(cc_info);
-
-	/*
-	 * Pass run-time kernel a pointer to CC info via boot_params so EFI
-	 * config table doesn't need to be searched again during early startup
-	 * phase.
-	 */
-	bp->cc_blob_address = (u32)(unsigned long)cc_info;
-
-	return true;
-}
-
 void sev_prep_identity_maps(unsigned long top_level_pgt)
 {
 	/*
-- 
2.43.2

