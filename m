Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BC2211CA05D
 for <svsm-devel@coconut-svsm.dev>; Wed, 24 Apr 2024 17:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjytLRT56OtsSgL9H3V29yrzuL7VwCpbjwgjYJY+6Ts=;
 b=bOGiU8hTBiXM7uyaLwpV2v3jlRSDSuHDSvqz77OKEuN6ap/ghYTCAc46QHgY8nSQccCedMlz8d5rLQe0u8IcRoMFyHcPA7L/Ro6XKpA6yyyj6lN4/lyhl/vjgb/Yq0lSZWJGl0zzxbgyNrpMfwbZ4R51S/t+O3Eo+0YwTiY3wyo=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 24 Apr 2024 10:58:05 -0500
Message-ID: <435f78e07c76e25d2d857138724098bc2a729b0a.1713974291.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1713974291.git.thomas.lendacky@amd.com>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v4 09/15] x86/sev: Provide guest VMPL level to
 userspace
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

Requesting an attestation report from userspace involves providing the
VMPL level for the report. Currently any value from 0-3 is valid because
Linux enforces running at VMPL0.

When an SVSM is present, though, Linux will not be running at VMPL0 and
only VMPL values starting at the VMPL level Linux is running at to 3 are
valid. In order to allow userspace to determine the minimum VMPL value
that can be supplied to an attestation report, create a sysfs entry that
can be used to retrieve the current VMPL level of Linux.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/kernel/sev.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 69a756781d90..8edf7362136b 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -2507,3 +2507,40 @@ void __init snp_remap_svsm_ca(void)
 	/* Update the CAA to a proper kernel address */
 	boot_svsm_caa = &boot_svsm_ca_page;
 }
+
+static ssize_t vmpl_show(struct kobject *kobj,
+			 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", vmpl);
+}
+
+static struct kobj_attribute vmpl_attr = __ATTR_RO(vmpl);
+
+static struct attribute *vmpl_attrs[] = {
+	&vmpl_attr.attr,
+	NULL
+};
+
+static struct attribute_group sev_attr_group = {
+	.attrs = vmpl_attrs,
+};
+
+static int __init sev_sysfs_init(void)
+{
+	struct kobject *sev_kobj;
+	int ret;
+
+	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
+		return -ENODEV;
+
+	sev_kobj = kobject_create_and_add("sev", kernel_kobj);
+	if (!sev_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_group(sev_kobj, &sev_attr_group);
+	if (ret)
+		kobject_put(sev_kobj);
+
+	return ret;
+}
+arch_initcall(sev_sysfs_init);
-- 
2.43.2

