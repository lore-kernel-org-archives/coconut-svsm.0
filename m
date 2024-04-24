Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 9E2121CA051
 for <svsm-devel@coconut-svsm.dev>; Wed, 24 Apr 2024 17:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4K3CwHj8lUBipV0Su0kgRY2TCUaYltx9lZIDJlMISiw=;
 b=a/Zd+kLVQ5Hows3UvJxT0nnkoE2jEw81YTGUca4dOcaNK8i1thHJ8kz/nAbPGNQ10Kg7hmJc39TWaVS7G55fhByZMYP3cZOAQlpQV1PXhEEAQzk6dlF9b9CeNZ6o7VWRRkk7B07cjtdNhrSSBEcrdHNuV8x4R1RdX4gnTA2/FkA=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 24 Apr 2024 10:58:04 -0500
Message-ID: <0b460ba621d39fda47694332f09301b440619efc.1713974291.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1713974291.git.thomas.lendacky@amd.com>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v4 08/15] x86/sev: Provide SVSM discovery
 support
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

The SVSM specification documents an alternative method of discovery for
the SVSM using a reserved CPUID bit and a reserved MSR.

For the CPUID support, the SNP CPUID table is updated to set bit 28 of
the EAX register of the 0x8000001f leaf when an SVSM is present. This bit
has been reserved for use in this capacity.

For the MSR support, a new reserved MSR 0xc001f000 has been defined. A #VC
should be generated when accessing this MSR. The #VC handler is expected
to ignore writes to this MSR and return the physical calling area address
(CAA) on reads of this MSR.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/include/asm/cpufeatures.h |  1 +
 arch/x86/include/asm/msr-index.h   |  2 ++
 arch/x86/kernel/sev-shared.c       | 11 +++++++++++
 arch/x86/kernel/sev.c              | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 3c7434329661..a17a81b3189b 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -446,6 +446,7 @@
 #define X86_FEATURE_V_TSC_AUX		(19*32+ 9) /* "" Virtual TSC_AUX */
 #define X86_FEATURE_SME_COHERENT	(19*32+10) /* "" AMD hardware-enforced cache coherency */
 #define X86_FEATURE_DEBUG_SWAP		(19*32+14) /* AMD SEV-ES full debug state swap support */
+#define X86_FEATURE_SVSM_PRESENT	(19*32+28) /* "" SNP SVSM is present */
 
 /* AMD-defined Extended Feature 2 EAX, CPUID level 0x80000021 (EAX), word 20 */
 #define X86_FEATURE_NO_NESTED_DATA_BP	(20*32+ 0) /* "" No Nested Data Breakpoints */
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index e022e6eb766c..45ffa27569f4 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -660,6 +660,8 @@
 #define MSR_AMD64_RMP_BASE		0xc0010132
 #define MSR_AMD64_RMP_END		0xc0010133
 
+#define MSR_SVSM_CAA			0xc001f000
+
 /* AMD Collaborative Processor Performance Control MSRs */
 #define MSR_AMD_CPPC_CAP1		0xc00102b0
 #define MSR_AMD_CPPC_ENABLE		0xc00102b1
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index b415b10a0823..50db783f151e 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -1561,6 +1561,8 @@ static enum es_result vc_check_opcode_bytes(struct es_em_ctxt *ctxt,
 static void __head setup_svsm_ca(const struct cc_blob_sev_info *cc_info)
 {
 	struct snp_secrets_page *secrets_page;
+	struct snp_cpuid_table *cpuid_table;
+	unsigned int i;
 	u64 caa;
 
 	BUILD_BUG_ON(sizeof(*secrets_page) != PAGE_SIZE);
@@ -1607,4 +1609,13 @@ static void __head setup_svsm_ca(const struct cc_blob_sev_info *cc_info)
 	 */
 	boot_svsm_caa = (struct svsm_ca *)caa;
 	boot_svsm_caa_pa = caa;
+
+	/* Advertise the SVSM presence via CPUID. */
+	cpuid_table = (struct snp_cpuid_table *)snp_cpuid_get_table();
+	for (i = 0; i < cpuid_table->count; i++) {
+		struct snp_cpuid_fn *fn = &cpuid_table->fn[i];
+
+		if (fn->eax_in == 0x8000001f)
+			fn->eax |= BIT(28);
+	}
 }
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 3f4342b31736..69a756781d90 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1326,12 +1326,29 @@ int __init sev_es_efi_map_ghcbs(pgd_t *pgd)
 	return 0;
 }
 
+static enum es_result vc_handle_svsm_caa_msr(struct es_em_ctxt *ctxt)
+{
+	struct pt_regs *regs = ctxt->regs;
+
+	/* Writes to the SVSM CAA msr are ignored */
+	if (ctxt->insn.opcode.bytes[1] == 0x30)
+		return ES_OK;
+
+	regs->ax = lower_32_bits(this_cpu_read(svsm_caa_pa));
+	regs->dx = upper_32_bits(this_cpu_read(svsm_caa_pa));
+
+	return ES_OK;
+}
+
 static enum es_result vc_handle_msr(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 {
 	struct pt_regs *regs = ctxt->regs;
 	enum es_result ret;
 	u64 exit_info_1;
 
+	if (regs->cx == MSR_SVSM_CAA)
+		return vc_handle_svsm_caa_msr(ctxt);
+
 	/* Is it a WRMSR? */
 	exit_info_1 = (ctxt->insn.opcode.bytes[1] == 0x30) ? 1 : 0;
 
-- 
2.43.2

