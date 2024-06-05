Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 418FE1C7AE9
 for <svsm-devel@coconut-svsm.dev>; Wed,  5 Jun 2024 17:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSAQ121X98iwiEcitX8x/iHAY6E8i4awlh577kfvVy0=;
 b=hpnW3bYBpQAMlZH38TUvOw8QKeRQRZJj7aaG40hiCwQX8K38xlaT5C3FOA13c9UL7fhqyyo8bUHUVbEQiSyt311/bJvNJop/PEvfQ80ilS0brZnPPkzCAEWp41I2KuqxEHEpiXvvMOlC/O6RVlyBL0SGerN7ZJm2keUB2bmSZnQ=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 5 Jun 2024 10:18:56 -0500
Message-ID: <2ce7cf281cce1d0cba88f3f576687ef75dc3c953.1717600736.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1717600736.git.thomas.lendacky@amd.com>
References: <cover.1717600736.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v5 13/13] x86/sev: Allow non-VMPL0 execution
 when an SVSM is present
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

To allow execution at a level other than VMPL0, an SVSM must be present.
Allow the SEV-SNP guest to continue booting if an SVSM is detected and
the hypervisor supports the SVSM feature as indicated in the GHCB
hypervisor features bitmap.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/boot/compressed/sev.c    | 17 ++++++++++++++---
 arch/x86/include/asm/sev-common.h |  1 +
 arch/x86/kernel/sev.c             | 20 ++++++++++++--------
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 1cc3106a3ba7..018c37ec1838 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -609,11 +609,15 @@ void sev_enable(struct boot_params *bp)
 	 * features.
 	 */
 	if (sev_status & MSR_AMD64_SEV_SNP_ENABLED) {
-		if (!(get_hv_features() & GHCB_HV_FT_SNP))
+		u64 hv_features;
+		int ret;
+
+		hv_features = get_hv_features();
+		if (!(hv_features & GHCB_HV_FT_SNP))
 			sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SNP_UNSUPPORTED);
 
 		/*
-		 * Enforce running at VMPL0.
+		 * Enforce running at VMPL0 or with an SVSM.
 		 *
 		 * Use RMPADJUST (see the rmpadjust() function for a description of
 		 * what the instruction does) to update the VMPL1 permissions of a
@@ -622,7 +626,14 @@ void sev_enable(struct boot_params *bp)
 		 * only ever run at a single VMPL level so permission mask changes of a
 		 * lesser-privileged VMPL are a don't-care.
 		 */
-		if (rmpadjust((unsigned long)&boot_ghcb_page, RMP_PG_SIZE_4K, 1))
+
+		ret = rmpadjust((unsigned long)&boot_ghcb_page, RMP_PG_SIZE_4K, 1);
+
+		/*
+		 * Running at VMPL0 is not required if an SVSM is present and the hypervisor
+		 * supports the required SVSM GHCB events.
+		 */
+		if (ret && !(snp_vmpl && (hv_features & GHCB_HV_FT_SNP_MULTI_VMPL)))
 			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NOT_VMPL0);
 	}
 
diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
index 78a4c25119da..e90d403f2068 100644
--- a/arch/x86/include/asm/sev-common.h
+++ b/arch/x86/include/asm/sev-common.h
@@ -122,6 +122,7 @@ enum psc_op {
 
 #define GHCB_HV_FT_SNP			BIT_ULL(0)
 #define GHCB_HV_FT_SNP_AP_CREATION	BIT_ULL(1)
+#define GHCB_HV_FT_SNP_MULTI_VMPL	BIT_ULL(5)
 
 /*
  * SNP Page State Change NAE event
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index f4ae1d037b04..b7f3c767ef00 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -2349,23 +2349,27 @@ static void dump_cpuid_table(void)
  * expected, but that initialization happens too early in boot to print any
  * sort of indicator, and there's not really any other good place to do it,
  * so do it here.
+ *
+ * If running as an SNP guest, report the current VM privilege level (VMPL).
  */
-static int __init report_cpuid_table(void)
+static int __init report_snp_info(void)
 {
 	const struct snp_cpuid_table *cpuid_table = snp_cpuid_get_table();
 
-	if (!cpuid_table->count)
-		return 0;
+	if (cpuid_table->count) {
+		pr_info("Using SNP CPUID table, %d entries present.\n",
+			cpuid_table->count);
 
-	pr_info("Using SNP CPUID table, %d entries present.\n",
-		cpuid_table->count);
+		if (sev_cfg.debug)
+			dump_cpuid_table();
+	}
 
-	if (sev_cfg.debug)
-		dump_cpuid_table();
+	if (cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
+		pr_info("SNP running at VMPL%u.\n", snp_vmpl);
 
 	return 0;
 }
-arch_initcall(report_cpuid_table);
+arch_initcall(report_snp_info);
 
 static int __init init_sev_config(char *str)
 {
-- 
2.43.2

