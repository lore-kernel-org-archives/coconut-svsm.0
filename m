Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id ADB531C73F4
 for <svsm-devel@coconut-svsm.dev>; Mon, 15 Apr 2024 21:16:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9VEXK8ZUYo67wOptYY7w/xaWhBE//N7iSz1F+CHxv8=;
 b=gVp3QeQnnGkRfeOESKrSuyAZysvq/3pYBxidAeSo6DzzvzpT/emKOQbuPil5JteCO1qxSPLPRri5Jg8sFdSZnFtuBPUgw1sgzLzNh5EsGqO0A+VEVuTmJdZavwE9YWcXOdVp/MxDp/Y40ygtRPomiTp6lauRAIJzv8Q7N6R2xVQ=
Message-ID: <e286883d-40ef-d749-26a8-7ec6fbd81eae@amd.com>
Date: Mon, 15 Apr 2024 14:16:13 -0500
From: Tom Lendacky <thomas.lendacky@amd.com>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <67893f352bc54de61160bfe251cba0bdf0431f37.1711405593.git.thomas.lendacky@amd.com>
 <1f6f4477-0f2a-434a-8c89-3b5d51d61581@linux.intel.com>
 <19d69960-e548-a2e6-87d9-c463f2851613@amd.com>
Content-Language: en-US
In-Reply-To: <19d69960-e548-a2e6-87d9-c463f2851613@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 13/14] x86/sev: Hide SVSM attestation
 entries if not running under an SVSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>

On 4/12/24 10:52, Tom Lendacky wrote:
> On 4/9/24 13:12, Kuppuswamy Sathyanarayanan wrote:
>> On 3/25/24 3:26 PM, Tom Lendacky wrote:
>>> Config-fs provides support to hide individual attribute entries. Using
>>> this support, base the display of the SVSM related entries on the 
>>> presence
>>> of an SVSM.
>>>
>>> Cc: Joel Becker <jlbec@evilplan.org>
>>> Cc: Christoph Hellwig <hch@lst.de>
>>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>>> ---
>>>   arch/x86/coco/core.c        |  4 ++++
>>>   drivers/virt/coco/tsm.c     | 14 ++++++++++----
>>>   include/linux/cc_platform.h |  8 ++++++++
>>>   3 files changed, 22 insertions(+), 4 deletions(-)
>>>

>>
>> Any comment about the following query? I think introducing a CC flag 
>> for this use
>> case is over kill.
>>
>> https://lore.kernel.org/lkml/6b90b223-46e0-4e6d-a17c-5caf72e3c949@linux.intel.com/
> 
> If you don't think TDX will be able to make use of the SVSM attribute I 
> can look at adding a callback. But I was waiting to see if anyone else 
> had comments, for or against, before re-doing it all.
> 

What about something like this (applied on top of patch 13):

diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
index efa0f648f754..d07be9d05cd0 100644
--- a/arch/x86/coco/core.c
+++ b/arch/x86/coco/core.c
@@ -12,7 +12,6 @@
  
  #include <asm/coco.h>
  #include <asm/processor.h>
-#include <asm/sev.h>
  
  enum cc_vendor cc_vendor __ro_after_init = CC_VENDOR_NONE;
  u64 cc_mask __ro_after_init;
@@ -79,9 +78,6 @@ static bool noinstr amd_cc_platform_has(enum cc_attr attr)
  	case CC_ATTR_GUEST_STATE_ENCRYPT:
  		return sev_status & MSR_AMD64_SEV_ES_ENABLED;
  
-	case CC_ATTR_GUEST_SVSM_PRESENT:
-		return snp_get_vmpl();
-
  	/*
  	 * With SEV, the rep string I/O instructions need to be unrolled
  	 * but SEV-ES supports them through the #VC handler.
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 0d2c9926a97c..68c881a50026 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -1036,6 +1036,17 @@ static int sev_report_new(struct tsm_report *report, void *data)
  	return 0;
  }
  
+static bool sev_tsm_visibility(enum tsm_type type)
+{
+	/* Check for SVSM-related attributes */
+	switch (type) {
+	case TSM_TYPE_SERVICE_PROVIDER:
+		return snp_get_vmpl();
+	default:
+		return false;
+	}
+}
+
  static struct tsm_ops sev_tsm_ops = {
  	.name = KBUILD_MODNAME,
  	.report_new = sev_report_new,
@@ -1126,7 +1137,8 @@ static int __init sev_guest_probe(struct platform_device *pdev)
  	/* Set the privlevel_floor attribute based on the current VMPL */
  	sev_tsm_ops.privlevel_floor = snp_get_vmpl();
  
-	ret = tsm_register(&sev_tsm_ops, snp_dev, &tsm_report_extra_type);
+	ret = tsm_register(&sev_tsm_ops, snp_dev, &tsm_report_extra_type,
+			   sev_tsm_visibility);
  	if (ret)
  		goto e_free_cert_data;
  
diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 1253bf76b570..0fd8e60d7bee 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -301,7 +301,7 @@ static int __init tdx_guest_init(void)
  		goto free_misc;
  	}
  
-	ret = tsm_register(&tdx_tsm_ops, NULL, NULL);
+	ret = tsm_register(&tdx_tsm_ops, NULL, NULL, NULL);
  	if (ret)
  		goto free_quote;
  
diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
index d30471874e87..e73840aed13d 100644
--- a/drivers/virt/coco/tsm.c
+++ b/drivers/virt/coco/tsm.c
@@ -16,6 +16,7 @@ static struct tsm_provider {
  	const struct tsm_ops *ops;
  	const struct config_item_type *type;
  	void *data;
+	tsm_visibility_t visibility;
  } provider;
  static DECLARE_RWSEM(tsm_rwsem);
  
@@ -64,10 +65,13 @@ static struct tsm_report_state *to_state(struct tsm_report *report)
  	return container_of(report, struct tsm_report_state, report);
  }
  
-static bool provider_visibility(const struct config_item *item,
-				const struct configfs_attribute *attr)
+static bool service_provider_visibility(const struct config_item *item,
+					const struct configfs_attribute *attr)
  {
-	return cc_platform_has(CC_ATTR_GUEST_SVSM_PRESENT);
+	if (!provider.visibility)
+		return true;
+
+	return provider.visibility(TSM_TYPE_SERVICE_PROVIDER);
  }
  
  static int try_advance_write_generation(struct tsm_report *report)
@@ -150,7 +154,7 @@ static ssize_t tsm_report_service_provider_store(struct config_item *cfg,
  
  	return len;
  }
-CONFIGFS_ATTR_VISIBLE_WO(tsm_report_, service_provider, provider_visibility);
+CONFIGFS_ATTR_VISIBLE_WO(tsm_report_, service_provider, service_provider_visibility);
  
  static ssize_t tsm_report_service_guid_store(struct config_item *cfg,
  					     const char *buf, size_t len)
@@ -171,7 +175,7 @@ static ssize_t tsm_report_service_guid_store(struct config_item *cfg,
  
  	return len;
  }
-CONFIGFS_ATTR_VISIBLE_WO(tsm_report_, service_guid, provider_visibility);
+CONFIGFS_ATTR_VISIBLE_WO(tsm_report_, service_guid, service_provider_visibility);
  
  static ssize_t tsm_report_service_manifest_version_store(struct config_item *cfg,
  							 const char *buf, size_t len)
@@ -192,7 +196,7 @@ static ssize_t tsm_report_service_manifest_version_store(struct config_item *cfg
  
  	return len;
  }
-CONFIGFS_ATTR_VISIBLE_WO(tsm_report_, service_manifest_version, provider_visibility);
+CONFIGFS_ATTR_VISIBLE_WO(tsm_report_, service_manifest_version, service_provider_visibility);
  
  static ssize_t tsm_report_inblob_write(struct config_item *cfg,
  				       const void *buf, size_t count)
@@ -339,7 +343,8 @@ static ssize_t tsm_report_manifestblob_read(struct config_item *cfg, void *buf,
  
  	return tsm_report_read(report, buf, count, TSM_MANIFEST);
  }
-CONFIGFS_BIN_ATTR_VISIBLE_RO(tsm_report_, manifestblob, NULL, TSM_OUTBLOB_MAX, provider_visibility);
+CONFIGFS_BIN_ATTR_VISIBLE_RO(tsm_report_, manifestblob, NULL, TSM_OUTBLOB_MAX,
+			     service_provider_visibility);
  
  #define TSM_DEFAULT_ATTRS() \
  	&tsm_report_attr_generation, \
@@ -449,7 +454,8 @@ static struct configfs_subsystem tsm_configfs = {
  };
  
  int tsm_register(const struct tsm_ops *ops, void *priv,
-		 const struct config_item_type *type)
+		 const struct config_item_type *type,
+		 tsm_visibility_t visibility)
  {
  	const struct tsm_ops *conflict;
  
@@ -468,6 +474,7 @@ int tsm_register(const struct tsm_ops *ops, void *priv,
  	provider.ops = ops;
  	provider.data = priv;
  	provider.type = type;
+	provider.visibility = visibility;
  	return 0;
  }
  EXPORT_SYMBOL_GPL(tsm_register);
@@ -480,6 +487,7 @@ int tsm_unregister(const struct tsm_ops *ops)
  	provider.ops = NULL;
  	provider.data = NULL;
  	provider.type = NULL;
+	provider.visibility = NULL;
  	return 0;
  }
  EXPORT_SYMBOL_GPL(tsm_unregister);
diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
index f1b4266c1484..cb0d6cd1c12f 100644
--- a/include/linux/cc_platform.h
+++ b/include/linux/cc_platform.h
@@ -90,14 +90,6 @@ enum cc_attr {
  	 * Examples include TDX Guest.
  	 */
  	CC_ATTR_HOTPLUG_DISABLED,
-
-	/**
-	 * @CC_ATTR_GUEST_SVSM_PRESENT: Guest is running under an SVSM
-	 *
-	 * The platform/OS is running as a guest/virtual machine and is
-	 * running under a Secure VM Service Module (SVSM).
-	 */
-	CC_ATTR_GUEST_SVSM_PRESENT,
  };
  
  #ifdef CONFIG_ARCH_HAS_CC_PLATFORM
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index 27cc97fe8dcd..5aaf626d178d 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -74,7 +74,20 @@ extern const struct config_item_type tsm_report_default_type;
  /* publish @privlevel, @privlevel_floor, and @auxblob attributes */
  extern const struct config_item_type tsm_report_extra_type;
  
+/*
+ * Used to indicate the attribute group type to the visibility callback to
+ * avoid the callback having to examine the attribute name.
+ */
+enum tsm_type {
+	TSM_TYPE_SERVICE_PROVIDER,
+
+	TSM_TYPE_MAX
+};
+
+typedef bool (*tsm_visibility_t)(enum tsm_type type);
+
  int tsm_register(const struct tsm_ops *ops, void *priv,
-		 const struct config_item_type *type);
+		 const struct config_item_type *type,
+		 tsm_visibility_t visibility);
  int tsm_unregister(const struct tsm_ops *ops);
  #endif /* __TSM_H */

> Thanks,
> Tom
> 
