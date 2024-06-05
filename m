Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 6B4D61C7AE9
 for <svsm-devel@coconut-svsm.dev>; Wed,  5 Jun 2024 17:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRK6aHalP6yxxv5CWxUvgOMg/8Mg7wqQ0dLgCT4h1bw=;
 b=5pxLBHbfZNxQg+neB3GbbCNAaek9oCLUvToMf5etzjDS8MSoGQrGfHJez0WAProvj+TCYcOSLv9qeWOXT0j9lLfFw/YfgnjZ7gku6SOGpe0ljb1CqKXykTETPNxGJe8zHu5iOkWjq00HDgSbrNgpm9RftuW6pCmjoCoU+iKGdC4=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 5 Jun 2024 10:18:50 -0500
Message-ID: <fff846da0d8d561f9fdaf297dcf8cd907545a25b.1717600736.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1717600736.git.thomas.lendacky@amd.com>
References: <cover.1717600736.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v5 07/13] x86/sev: Provide guest VMPL level to
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
 .../ABI/testing/sysfs-devices-system-cpu      | 12 +++++
 arch/x86/kernel/sev.c                         | 44 +++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index e7e160954e79..8fd7ed9aee4e 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -605,6 +605,18 @@ Description:	Umwait control
 			  Note that a value of zero means there is no limit.
 			  Low order two bits must be zero.
 
+What:		/sys/devices/system/cpu/sev
+		/sys/devices/system/cpu/sev/vmpl
+Date:		May 2024
+Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
+Description:	Secure Encrypted Virtualization (SEV) information
+
+		This directory is only present when running as an SEV-SNP guest.
+
+		vmpl: Reports the Virtual Machine Privilege Level (VMPL) at which
+		      the SEV-SNP guest is running.
+
+
 What:		/sys/devices/system/cpu/svm
 Date:		August 2019
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 5ba1c481b867..d09844db2361 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -2501,3 +2501,47 @@ void __init snp_remap_svsm_ca(void)
 	/* Update the CAA to a proper kernel address */
 	boot_svsm_caa = &boot_svsm_ca_page;
 }
+
+static ssize_t vmpl_show(struct kobject *kobj,
+			 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", snp_vmpl);
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
+	struct device *dev_root;
+	int ret;
+
+	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
+		return -ENODEV;
+
+	dev_root = bus_get_dev_root(&cpu_subsys);
+	if (!dev_root)
+		return -ENODEV;
+
+	sev_kobj = kobject_create_and_add("sev", &dev_root->kobj);
+	put_device(dev_root);
+
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

