Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::616])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id B91551C7AE9
 for <svsm-devel@coconut-svsm.dev>; Wed,  5 Jun 2024 17:20:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzeSj+sUzj3hgQqk6L6vstC9tEv6wqQVMdDGWDD/dVo=;
 b=gibihAjz2QgA8LoJ+i9ZDOB/yvTspNmEgV0PMGUsBOfM0R1WS9i1sHiqv5X6VdNqSX8TZdWakssmeINow6pZgpaKvtHQJ59PBfCaC1Ehsw/Za5s6Azh2grNa2gvyI3VsXK9aOXaHAXWuKndFcdWi6j2b7oTXneNa8de1/nwx3Cw=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 5 Jun 2024 10:18:51 -0500
Message-ID: <b88081c5d88263176849df8ea93e90a404619cab.1717600736.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1717600736.git.thomas.lendacky@amd.com>
References: <cover.1717600736.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v5 08/13] virt: sev-guest: Choose the VMPCK key
 based on executing VMPL
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

Currently, the sev-guest driver uses the vmpck-0 key by default. When an
SVSM is present, the kernel is running at a VMPL other than 0 and the
vmpck-0 key is no longer available. If a specific vmpck key has not be
requested by the user via the vmpck_id module parameter, choose the vmpck
key based on the active VMPL level.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 Documentation/virt/coco/sev-guest.rst   | 11 +++++++++++
 arch/x86/include/asm/sev.h              | 11 +++++++++--
 arch/x86/kernel/sev-shared.c            |  3 ++-
 drivers/virt/coco/sev-guest/sev-guest.c | 17 ++++++++++++++---
 4 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/Documentation/virt/coco/sev-guest.rst b/Documentation/virt/coco/sev-guest.rst
index e1eaf6a830ce..9d00967a5b2b 100644
--- a/Documentation/virt/coco/sev-guest.rst
+++ b/Documentation/virt/coco/sev-guest.rst
@@ -204,6 +204,17 @@ has taken care to make use of the SEV-SNP CPUID throughout all stages of boot.
 Otherwise, guest owner attestation provides no assurance that the kernel wasn't
 fed incorrect values at some point during boot.
 
+4. SEV Guest Driver Communication Key
+=====================================
+
+Communication between an SEV guest and the SEV firmware in the AMD Secure
+Processor (ASP, aka PSP) is protected by a VM Platform Communication Key
+(VMPCK). By default, the sev-guest driver uses the VMPCK associated with the
+VM Privilege Level (VMPL) at which the guest is running. Should this key be
+wiped by the sev-guest driver (see the driver for reasons why a VMPCK can be
+wiped), a different key can be used by reloading the sev-guest driver and
+specifying the desired key using the vmpck_id module parameter.
+
 
 Reference
 ---------
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 36cd7aebaa9b..f7a966e99a73 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -237,6 +237,9 @@ struct svsm_call {
 #define SVSM_CORE_DELETE_VCPU		3
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
+
+extern u8 snp_vmpl;
+
 extern void __sev_es_ist_enter(struct pt_regs *regs);
 extern void __sev_es_ist_exit(void);
 static __always_inline void sev_es_ist_enter(struct pt_regs *regs)
@@ -320,7 +323,10 @@ u64 snp_get_unsupported_features(u64 status);
 u64 sev_get_status(void);
 void sev_show_status(void);
 void snp_remap_svsm_ca(void);
-#else
+
+#else	/* !CONFIG_AMD_MEM_ENCRYPT */
+
+#define snp_vmpl 0
 static inline void sev_es_ist_enter(struct pt_regs *regs) { }
 static inline void sev_es_ist_exit(void) { }
 static inline int sev_es_setup_ap_jump_table(struct real_mode_header *rmh) { return 0; }
@@ -350,7 +356,8 @@ static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
 static inline u64 sev_get_status(void) { return 0; }
 static inline void sev_show_status(void) { }
 static inline void snp_remap_svsm_ca(void) { }
-#endif
+
+#endif	/* CONFIG_AMD_MEM_ENCRYPT */
 
 #ifdef CONFIG_KVM_AMD_SEV
 bool snp_probe_rmptable_info(void);
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index e91fcffcf602..10599e66c5fd 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -36,7 +36,8 @@
  *   early boot, both with identity mapped virtual addresses and proper kernel
  *   virtual addresses.
  */
-static u8 snp_vmpl __ro_after_init;
+u8 snp_vmpl __ro_after_init;
+EXPORT_SYMBOL_GPL(snp_vmpl);
 static struct svsm_ca *boot_svsm_caa __ro_after_init;
 static u64 boot_svsm_caa_pa __ro_after_init;
 
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 654290a8e1ba..4597042f31e4 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -2,7 +2,7 @@
 /*
  * AMD Secure Encrypted Virtualization (SEV) guest driver interface
  *
- * Copyright (C) 2021 Advanced Micro Devices, Inc.
+ * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
  *
  * Author: Brijesh Singh <brijesh.singh@amd.com>
  */
@@ -70,8 +70,15 @@ struct snp_guest_dev {
 	u8 *vmpck;
 };
 
-static u32 vmpck_id;
-module_param(vmpck_id, uint, 0444);
+/*
+ * The VMPCK ID represents the key used by the SNP guest to communicate with the
+ * SEV firmware in the AMD Secure Processor (ASP, aka PSP). By default, the key
+ * used will be the key associated with the VMPL at which the guest is running.
+ * Should the default key be wiped (see snp_disable_vmpck()), this parameter
+ * allows for using one of the remaining VMPCKs.
+ */
+static int vmpck_id = -1;
+module_param(vmpck_id, int, 0444);
 MODULE_PARM_DESC(vmpck_id, "The VMPCK ID to use when communicating with the PSP.");
 
 /* Mutex to serialize the shared buffer access and command handling. */
@@ -923,6 +930,10 @@ static int __init sev_guest_probe(struct platform_device *pdev)
 	if (!snp_dev)
 		goto e_unmap;
 
+	/* Adjust the default VMPCK key based on the executing VMPL level */
+	if (vmpck_id == -1)
+		vmpck_id = snp_vmpl;
+
 	ret = -EINVAL;
 	snp_dev->vmpck = get_vmpck(vmpck_id, secrets, &snp_dev->os_area_msg_seqno);
 	if (!snp_dev->vmpck) {
-- 
2.43.2

