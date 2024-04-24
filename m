Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 07ACD1CA049
 for <svsm-devel@coconut-svsm.dev>; Wed, 24 Apr 2024 18:00:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELZcJgxOSXODzN2532DoRKWi17pLvwTMLPyCdzX2jG0=;
 b=WnsXIyJI4FqKne2+DpvzJ+5ooFLlt3XIAcdUZxaQSGeksVQqtw/oDeFaivgGbrSStdnlfpqVYpqPrbJTDNTClozuxZCp/WERfX3XozaTSvHk7BBieSq2QKS/T55lyDHoFR+ASlxot3oeZlWElluGE2BWNMm7MJ6MyYxLXcm4ZHQ=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 24 Apr 2024 10:58:10 -0500
Message-ID: <9a4c4a16d00834c1b7ff458e25c185ac1c9bcf79.1713974291.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1713974291.git.thomas.lendacky@amd.com>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v4 14/15] x86/sev: Extend the config-fs
 attestation support for an SVSM
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

When an SVSM is present, the guest can also request attestation reports
from the SVSM. These SVSM attestation reports can be used to attest the
SVSM and any services running within the SVSM.

Extend the config-fs attestation support to allow for an SVSM attestation
report. This involves creating four (4) new config-fs attributes:

  - 'service-provider' (input)
    This attribute is used to determine whether the attestation request
    should be sent to the specified service provider or to the SEV
    firmware. The SVSM service provider is represented by the value
    'svsm'.

  - 'service_guid' (input)
    Used for requesting the attestation of a single service within the
    service provider. A null GUID implies that the SVSM_ATTEST_SERVICES
    call should be used to request the attestation report. A non-null
    GUID implies that the SVSM_ATTEST_SINGLE_SERVICE call should be used.

  - 'service_manifest_version' (input)
    Used with the SVSM_ATTEST_SINGLE_SERVICE call, the service version
    represents a specific service manifest version be used for the
    attestation report.

  - 'manifestblob' (output)
    Used to return the service manifest associated with the attestation
    report.

Only display these new attributes when running under an SVSM.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 Documentation/ABI/testing/configfs-tsm  |  63 ++++++++
 arch/x86/include/asm/sev.h              |  31 +++-
 arch/x86/kernel/sev.c                   |  50 +++++++
 drivers/virt/coco/sev-guest/sev-guest.c | 186 ++++++++++++++++++++++++
 drivers/virt/coco/tsm.c                 |  93 +++++++++++-
 include/linux/tsm.h                     |  19 +++
 6 files changed, 439 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-tsm b/Documentation/ABI/testing/configfs-tsm
index dd24202b5ba5..bc8f6efa5d6f 100644
--- a/Documentation/ABI/testing/configfs-tsm
+++ b/Documentation/ABI/testing/configfs-tsm
@@ -31,6 +31,18 @@ Description:
 		Standardization v2.03 Section 4.1.8.1 MSG_REPORT_REQ.
 		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56421.pdf
 
+What:		/sys/kernel/config/tsm/report/$name/manifestblob
+Date:		January, 2024
+KernelVersion:	v6.10
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) Optional supplemental data that a TSM may emit, visibility
+		of this attribute depends on TSM, and may be empty if no
+		manifest data is available.
+
+		See 'service_provider' for information on the format of the
+		manifest blob.
+
 What:		/sys/kernel/config/tsm/report/$name/provider
 Date:		September, 2023
 KernelVersion:	v6.7
@@ -80,3 +92,54 @@ Contact:	linux-coco@lists.linux.dev
 Description:
 		(RO) Indicates the minimum permissible value that can be written
 		to @privlevel.
+
+What:		/sys/kernel/config/tsm/report/$name/service_provider
+Date:		January, 2024
+KernelVersion:	v6.10
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(WO) Attribute is visible if a TSM implementation provider
+		supports the concept of attestation reports from a service
+		provider for TVMs, like SEV-SNP running under an SVSM.
+		Specifying the service provider via this attribute will create
+		an attestation report as specified by the service provider.
+		Currently supported service-providers are:
+			svsm
+
+		For the "svsm" service provider, see the Secure VM Service Module
+		for SEV-SNP Guests v1.00 Section 7.
+		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
+
+What:		/sys/kernel/config/tsm/report/$name/service_guid
+Date:		January, 2024
+KernelVersion:	v6.10
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(WO) Attribute is visible if a TSM implementation provider
+		supports the concept of attestation reports from a service
+		provider for TVMs, like SEV-SNP running under an SVSM.
+		Specifying an empty/null GUID (00000000-0000-0000-0000-000000)
+		requests all active services within the service provider be
+		part of the attestation report. Specifying a GUID request
+		an attestation report of just the specified service using the
+		manifest form specified by the service_manifest_version
+		attribute.
+
+		See 'service_provider' for information on the format of the
+		service guid.
+
+What:		/sys/kernel/config/tsm/report/$name/service_manifest_version
+Date:		January, 2024
+KernelVersion:	v6.10
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(WO) Attribute is visible if a TSM implementation provider
+		supports the concept of attestation reports from a service
+		provider for TVMs, like SEV-SNP running under an SVSM.
+		Indicates the service manifest version requested for the
+		attestation report (default 0). If this field is not set by
+		the user, the default manifest version of the service (the
+		service's initial/first manifest version) is returned.
+
+		See 'service_provider' for information on the format of the
+		service manifest version.
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 64fcadd6d602..2c66e7f2a7c7 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -209,6 +209,27 @@ struct svsm_pvalidate_call {
 	struct svsm_pvalidate_entry entry[];
 };
 
+/*
+ * The SVSM Attestation related structures
+ */
+struct svsm_location_entry {
+	u64 pa;
+	u32 len;
+	u8 rsvd[4];
+};
+
+struct svsm_attestation_call {
+	struct svsm_location_entry report_buffer;
+	struct svsm_location_entry nonce;
+	struct svsm_location_entry manifest_buffer;
+	struct svsm_location_entry certificates_buffer;
+
+	/* For attesting a single service */
+	u8 service_guid[16];
+	u32 service_manifest_version;
+	u8 rsvd[4];
+};
+
 /*
  * SVSM protocol structure
  */
@@ -232,6 +253,10 @@ struct svsm_call {
 #define SVSM_CORE_CREATE_VCPU		2
 #define SVSM_CORE_DELETE_VCPU		3
 
+#define SVSM_ATTEST_CALL(x)		((1ULL << 32) | (x))
+#define SVSM_ATTEST_SERVICES		0
+#define SVSM_ATTEST_SINGLE_SERVICE	1
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 extern void __sev_es_ist_enter(struct pt_regs *regs);
 extern void __sev_es_ist_exit(void);
@@ -302,6 +327,7 @@ bool snp_init(struct boot_params *bp);
 void __noreturn snp_abort(void);
 void snp_dmi_setup(void);
 int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, struct snp_guest_request_ioctl *rio);
+int snp_issue_svsm_attestation_request(u64 call_id, struct svsm_attestation_call *input);
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
 u64 snp_get_unsupported_features(u64 status);
 u64 sev_get_status(void);
@@ -332,7 +358,10 @@ static inline int snp_issue_guest_request(u64 exit_code, struct snp_req_data *in
 {
 	return -ENOTTY;
 }
-
+static inline int snp_issue_svsm_attestation_request(u64 call_id, struct svsm_attestation_call *input)
+{
+	return -ENOTTY;
+}
 static inline void snp_accept_memory(phys_addr_t start, phys_addr_t end) { }
 static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
 static inline u64 sev_get_status(void) { return 0; }
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 75f11da867a3..5e71c94b952c 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -2390,6 +2390,56 @@ static int __init init_sev_config(char *str)
 }
 __setup("sev=", init_sev_config);
 
+static void update_attestation_input(struct svsm_call *call, struct svsm_attestation_call *input)
+{
+	/* If (new) lengths have been returned, propograte them up */
+	if (call->rcx_out != call->rcx)
+		input->manifest_buffer.len = call->rcx_out;
+
+	if (call->rdx_out != call->rdx)
+		input->certificates_buffer.len = call->rdx_out;
+
+	if (call->r8_out != call->r8)
+		input->report_buffer.len = call->r8_out;
+}
+
+int snp_issue_svsm_attestation_request(u64 call_id, struct svsm_attestation_call *input)
+{
+	struct svsm_attestation_call *attest_call;
+	struct svsm_call call = {};
+	unsigned long flags;
+	u64 attest_call_pa;
+	int ret;
+
+	if (!vmpl)
+		return -EINVAL;
+
+	local_irq_save(flags);
+
+	call.caa = __svsm_get_caa();
+
+	attest_call = (struct svsm_attestation_call *)call.caa->svsm_buffer;
+	attest_call_pa = __svsm_get_caa_pa() + offsetof(struct svsm_ca, svsm_buffer);
+
+	*attest_call = *input;
+
+	/*
+	 * Set input registers for the request and set RDX and R8 to known
+	 * values in order to detect length values being returned in them.
+	 */
+	call.rax = call_id;
+	call.rcx = attest_call_pa;
+	call.rdx = -1;
+	call.r8 = -1;
+	ret = svsm_protocol(&call);
+	update_attestation_input(&call, input);
+
+	local_irq_restore(flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snp_issue_svsm_attestation_request);
+
 int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, struct snp_guest_request_ioctl *rio)
 {
 	struct ghcb_state state;
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index ec3d894cfe31..d37a8b27d12a 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -39,6 +39,8 @@
 #define SNP_REQ_MAX_RETRY_DURATION	(60*HZ)
 #define SNP_REQ_RETRY_DELAY		(2*HZ)
 
+#define SVSM_MAX_RETRIES		3
+
 struct snp_guest_crypto {
 	struct crypto_aead *tfm;
 	u8 *iv, *authtag;
@@ -784,6 +786,148 @@ struct snp_msg_cert_entry {
 	u32 length;
 };
 
+static int sev_svsm_report_new(struct tsm_report *report, void *data)
+{
+	unsigned int report_len, manifest_len, certificates_len;
+	void *report_blob, *manifest_blob, *certificates_blob;
+	struct svsm_attestation_call attest_call = {};
+	struct tsm_desc *desc = &report->desc;
+	unsigned int retry_count;
+	unsigned int size;
+	bool try_again;
+	void *buffer;
+	u64 call_id;
+	int ret;
+
+	/*
+	 * Allocate pages for the request:
+	 * - Report blob (4K)
+	 * - Manifest blob (4K)
+	 * - Certificate blob (16K)
+	 *
+	 * Above addresses must be 4K aligned
+	 */
+	report_len = SZ_4K;
+	manifest_len = SZ_4K;
+	certificates_len = SEV_FW_BLOB_MAX_SIZE;
+
+	if (guid_is_null(&desc->service_guid)) {
+		call_id = SVSM_ATTEST_CALL(SVSM_ATTEST_SERVICES);
+	} else {
+		export_guid(attest_call.service_guid, &desc->service_guid);
+		attest_call.service_manifest_version = desc->service_manifest_version;
+
+		call_id = SVSM_ATTEST_CALL(SVSM_ATTEST_SINGLE_SERVICE);
+	}
+
+	retry_count = 0;
+
+retry:
+	size = report_len + manifest_len + certificates_len;
+	buffer = alloc_pages_exact(size, __GFP_ZERO);
+	if (!buffer)
+		return -ENOMEM;
+
+	report_blob = buffer;
+	attest_call.report_buffer.pa = __pa(report_blob);
+	attest_call.report_buffer.len = report_len;
+
+	manifest_blob = report_blob + report_len;
+	attest_call.manifest_buffer.pa = __pa(manifest_blob);
+	attest_call.manifest_buffer.len = manifest_len;
+
+	certificates_blob = manifest_blob + manifest_len;
+	attest_call.certificates_buffer.pa = __pa(certificates_blob);
+	attest_call.certificates_buffer.len = certificates_len;
+
+	attest_call.nonce.pa = __pa(desc->inblob);
+	attest_call.nonce.len = desc->inblob_len;
+
+	ret = snp_issue_svsm_attestation_request(call_id, &attest_call);
+	switch (ret) {
+	case SVSM_SUCCESS:
+		break;
+	case SVSM_ERR_INVALID_PARAMETER:
+		ret = -EINVAL;
+
+		if (retry_count >= SVSM_MAX_RETRIES)
+			goto error;
+
+		try_again = false;
+
+		if (attest_call.report_buffer.len > report_len) {
+			report_len = PAGE_ALIGN(attest_call.report_buffer.len);
+			try_again = true;
+		}
+
+		if (attest_call.manifest_buffer.len > manifest_len) {
+			manifest_len = PAGE_ALIGN(attest_call.manifest_buffer.len);
+			try_again = true;
+		}
+
+		if (attest_call.certificates_buffer.len > certificates_len) {
+			certificates_len = PAGE_ALIGN(attest_call.certificates_buffer.len);
+			try_again = true;
+		}
+
+		/* If one of the buffers wasn't large enough, retry the request */
+		if (try_again) {
+			free_pages_exact(buffer, size);
+			retry_count++;
+			goto retry;
+		}
+
+		goto error;
+	case SVSM_ERR_BUSY:
+		ret = -EAGAIN;
+		goto error;
+	default:
+		pr_err_ratelimited("SVSM attestation request failed (%#x)\n", ret);
+		ret = -EINVAL;
+		goto error;
+	}
+
+	ret = -ENOMEM;
+
+	report_len = attest_call.report_buffer.len;
+	void *rbuf __free(kvfree) = kvzalloc(report_len, GFP_KERNEL);
+	if (!rbuf)
+		goto error;
+
+	memcpy(rbuf, report_blob, report_len);
+	report->outblob = no_free_ptr(rbuf);
+	report->outblob_len = report_len;
+
+	manifest_len = attest_call.manifest_buffer.len;
+	void *mbuf __free(kvfree) = kvzalloc(manifest_len, GFP_KERNEL);
+	if (!mbuf)
+		goto error;
+
+	memcpy(mbuf, manifest_blob, manifest_len);
+	report->manifestblob = no_free_ptr(mbuf);
+	report->manifestblob_len = manifest_len;
+
+	certificates_len = attest_call.certificates_buffer.len;
+	if (!certificates_len)
+		goto success;
+
+	void *cbuf __free(kvfree) = kvzalloc(certificates_len, GFP_KERNEL);
+	if (!cbuf)
+		goto error;
+
+	memcpy(cbuf, certificates_blob, certificates_len);
+	report->auxblob = no_free_ptr(cbuf);
+	report->auxblob_len = certificates_len;
+
+success:
+	ret = 0;
+
+error:
+	free_pages_exact(buffer, size);
+
+	return ret;
+}
+
 static int sev_report_new(struct tsm_report *report, void *data)
 {
 	struct snp_msg_cert_entry *cert_table;
@@ -798,6 +942,13 @@ static int sev_report_new(struct tsm_report *report, void *data)
 	if (desc->inblob_len != SNP_REPORT_USER_DATA_SIZE)
 		return -EINVAL;
 
+	if (desc->service_provider) {
+		if (strcmp(desc->service_provider, "svsm"))
+			return -EINVAL;
+
+		return sev_svsm_report_new(report, data);
+	}
+
 	void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
@@ -886,9 +1037,44 @@ static int sev_report_new(struct tsm_report *report, void *data)
 	return 0;
 }
 
+static bool sev_report_attr_visible(struct config_item *item,
+				    struct configfs_attribute *attr, int n)
+{
+	switch (n) {
+	case TSM_REPORT_GENERATION:
+	case TSM_REPORT_PROVIDER:
+	case TSM_REPORT_PRIVLEVEL:
+	case TSM_REPORT_PRIVLEVEL_FLOOR:
+		return true;
+	case TSM_REPORT_SERVICE_PROVIDER:
+	case TSM_REPORT_SERVICE_GUID:
+	case TSM_REPORT_SERVICE_MANIFEST_VER:
+		return snp_get_vmpl();
+	}
+
+	return false;
+}
+
+static bool sev_report_bin_attr_visible(struct config_item *item,
+					struct configfs_bin_attribute *attr, int n)
+{
+	switch (n) {
+	case TSM_REPORT_INBLOB:
+	case TSM_REPORT_OUTBLOB:
+	case TSM_REPORT_AUXBLOB:
+		return true;
+	case TSM_REPORT_MANIFESTBLOB:
+		return snp_get_vmpl();
+	}
+
+	return false;
+}
+
 static struct tsm_ops sev_tsm_ops = {
 	.name = KBUILD_MODNAME,
 	.report_new = sev_report_new,
+	.report_attr_visible = sev_report_attr_visible,
+	.report_bin_attr_visible = sev_report_bin_attr_visible,
 };
 
 static void unregister_sev_tsm(void *data)
diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
index dedb4f582630..3c9587e8746b 100644
--- a/drivers/virt/coco/tsm.c
+++ b/drivers/virt/coco/tsm.c
@@ -34,7 +34,7 @@ static DECLARE_RWSEM(tsm_rwsem);
  * The attestation report format is TSM provider specific, when / if a standard
  * materializes that can be published instead of the vendor layout. Until then
  * the 'provider' attribute indicates the format of 'outblob', and optionally
- * 'auxblob'.
+ * 'auxblob' and 'manifestblob'.
  */
 
 struct tsm_report_state {
@@ -47,6 +47,7 @@ struct tsm_report_state {
 enum tsm_data_select {
 	TSM_REPORT,
 	TSM_CERTS,
+	TSM_MANIFEST,
 };
 
 static struct tsm_report *to_tsm_report(struct config_item *cfg)
@@ -118,6 +119,74 @@ static ssize_t tsm_report_privlevel_floor_show(struct config_item *cfg,
 }
 CONFIGFS_ATTR_RO(tsm_report_, privlevel_floor);
 
+static ssize_t tsm_report_service_provider_store(struct config_item *cfg,
+						 const char *buf, size_t len)
+{
+	struct tsm_report *report = to_tsm_report(cfg);
+	size_t sp_len;
+	char *sp;
+	int rc;
+
+	guard(rwsem_write)(&tsm_rwsem);
+	rc = try_advance_write_generation(report);
+	if (rc)
+		return rc;
+
+	sp_len = (buf[len - 1] != '\n') ? len : len - 1;
+
+	sp = kstrndup(buf, sp_len, GFP_KERNEL);
+	if (!sp)
+		return -ENOMEM;
+	kfree(report->desc.service_provider);
+
+	report->desc.service_provider = sp;
+
+	return len;
+}
+CONFIGFS_ATTR_WO(tsm_report_, service_provider);
+
+static ssize_t tsm_report_service_guid_store(struct config_item *cfg,
+					     const char *buf, size_t len)
+{
+	struct tsm_report *report = to_tsm_report(cfg);
+	int rc;
+
+	guard(rwsem_write)(&tsm_rwsem);
+	rc = try_advance_write_generation(report);
+	if (rc)
+		return rc;
+
+	report->desc.service_guid = guid_null;
+
+	rc = guid_parse(buf, &report->desc.service_guid);
+	if (rc)
+		return rc;
+
+	return len;
+}
+CONFIGFS_ATTR_WO(tsm_report_, service_guid);
+
+static ssize_t tsm_report_service_manifest_version_store(struct config_item *cfg,
+							 const char *buf, size_t len)
+{
+	struct tsm_report *report = to_tsm_report(cfg);
+	unsigned int val;
+	int rc;
+
+	rc = kstrtouint(buf, 0, &val);
+	if (rc)
+		return rc;
+
+	guard(rwsem_write)(&tsm_rwsem);
+	rc = try_advance_write_generation(report);
+	if (rc)
+		return rc;
+	report->desc.service_manifest_version = val;
+
+	return len;
+}
+CONFIGFS_ATTR_WO(tsm_report_, service_manifest_version);
+
 static ssize_t tsm_report_inblob_write(struct config_item *cfg,
 				       const void *buf, size_t count)
 {
@@ -162,6 +231,9 @@ static ssize_t __read_report(struct tsm_report *report, void *buf, size_t count,
 	if (select == TSM_REPORT) {
 		out = report->outblob;
 		len = report->outblob_len;
+	} else if (select == TSM_MANIFEST) {
+		out = report->manifestblob;
+		len = report->manifestblob_len;
 	} else {
 		out = report->auxblob;
 		len = report->auxblob_len;
@@ -187,7 +259,7 @@ static ssize_t read_cached_report(struct tsm_report *report, void *buf,
 
 	/*
 	 * A given TSM backend always fills in ->outblob regardless of
-	 * whether the report includes an auxblob or not.
+	 * whether the report includes an auxblob/manifestblob or not.
 	 */
 	if (!report->outblob ||
 	    state->read_generation != state->write_generation)
@@ -223,8 +295,10 @@ static ssize_t tsm_report_read(struct tsm_report *report, void *buf,
 
 	kvfree(report->outblob);
 	kvfree(report->auxblob);
+	kvfree(report->manifestblob);
 	report->outblob = NULL;
 	report->auxblob = NULL;
+	report->manifestblob = NULL;
 	rc = ops->report_new(report, provider.data);
 	if (rc < 0)
 		return rc;
@@ -251,11 +325,23 @@ static ssize_t tsm_report_auxblob_read(struct config_item *cfg, void *buf,
 }
 CONFIGFS_BIN_ATTR_RO(tsm_report_, auxblob, NULL, TSM_OUTBLOB_MAX);
 
+static ssize_t tsm_report_manifestblob_read(struct config_item *cfg, void *buf,
+					    size_t count)
+{
+	struct tsm_report *report = to_tsm_report(cfg);
+
+	return tsm_report_read(report, buf, count, TSM_MANIFEST);
+}
+CONFIGFS_BIN_ATTR_RO(tsm_report_, manifestblob, NULL, TSM_OUTBLOB_MAX);
+
 static struct configfs_attribute *tsm_report_attrs[] = {
 	[TSM_REPORT_GENERATION] = &tsm_report_attr_generation,
 	[TSM_REPORT_PROVIDER] = &tsm_report_attr_provider,
 	[TSM_REPORT_PRIVLEVEL] = &tsm_report_attr_privlevel,
 	[TSM_REPORT_PRIVLEVEL_FLOOR] = &tsm_report_attr_privlevel_floor,
+	[TSM_REPORT_SERVICE_PROVIDER] = &tsm_report_attr_service_provider,
+	[TSM_REPORT_SERVICE_GUID] = &tsm_report_attr_service_guid,
+	[TSM_REPORT_SERVICE_MANIFEST_VER] = &tsm_report_attr_service_manifest_version,
 	NULL,
 };
 
@@ -263,6 +349,7 @@ static struct configfs_bin_attribute *tsm_report_bin_attrs[] = {
 	[TSM_REPORT_INBLOB] = &tsm_report_attr_inblob,
 	[TSM_REPORT_OUTBLOB] = &tsm_report_attr_outblob,
 	[TSM_REPORT_AUXBLOB] = &tsm_report_attr_auxblob,
+	[TSM_REPORT_MANIFESTBLOB] = &tsm_report_attr_manifestblob,
 	NULL,
 };
 
@@ -271,8 +358,10 @@ static void tsm_report_item_release(struct config_item *cfg)
 	struct tsm_report *report = to_tsm_report(cfg);
 	struct tsm_report_state *state = to_state(report);
 
+	kvfree(report->manifestblob);
 	kvfree(report->auxblob);
 	kvfree(report->outblob);
+	kfree(report->desc.service_provider);
 	kfree(state);
 }
 
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index fa19291a9854..7c52a16a61c3 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -5,6 +5,7 @@
 #include <linux/sizes.h>
 #include <linux/types.h>
 #include <linux/configfs.h>
+#include <linux/uuid.h>
 
 #define TSM_INBLOB_MAX 64
 #define TSM_OUTBLOB_MAX SZ_32K
@@ -20,11 +21,17 @@
  * @privlevel: optional privilege level to associate with @outblob
  * @inblob_len: sizeof @inblob
  * @inblob: arbitrary input data
+ * @service_provider: optional name of where to obtain the tsm report blob
+ * @service_guid: optional service-provider service guid to attest
+ * @service_manifest_version: optional service-provider service manifest version requested
  */
 struct tsm_desc {
 	unsigned int privlevel;
 	size_t inblob_len;
 	u8 inblob[TSM_INBLOB_MAX];
+	char *service_provider;
+	guid_t service_guid;
+	unsigned int service_manifest_version;
 };
 
 /**
@@ -34,6 +41,8 @@ struct tsm_desc {
  * @outblob: generated evidence to provider to the attestation agent
  * @auxblob_len: sizeof(@auxblob)
  * @auxblob: (optional) auxiliary data to the report (e.g. certificate data)
+ * @manifestblob_len: sizeof(@manifestblob)
+ * @manifestblob: (optional) manifest data associated with the report
  */
 struct tsm_report {
 	struct tsm_desc desc;
@@ -41,6 +50,8 @@ struct tsm_report {
 	u8 *outblob;
 	size_t auxblob_len;
 	u8 *auxblob;
+	size_t manifestblob_len;
+	u8 *manifestblob;
 };
 
 /**
@@ -49,12 +60,18 @@ struct tsm_report {
  * @TSM_REPORT_PROVIDER: index of the provider name attribute
  * @TSM_REPORT_PRIVLEVEL: index of the desired privilege level attribute
  * @TSM_REPORT_PRIVLEVEL_FLOOR: index of the minimum allowed privileg level attribute
+ * @TSM_REPORT_SERVICE_PROVIDER: index of the service provider identifier attribute
+ * @TSM_REPORT_SERVICE_GUID: index of the service GUID attribute
+ * @TSM_REPORT_SERVICE_MANIFEST_VER: index of the service manifest version attribute
  */
 enum tsm_attr_index {
 	TSM_REPORT_GENERATION,
 	TSM_REPORT_PROVIDER,
 	TSM_REPORT_PRIVLEVEL,
 	TSM_REPORT_PRIVLEVEL_FLOOR,
+	TSM_REPORT_SERVICE_PROVIDER,
+	TSM_REPORT_SERVICE_GUID,
+	TSM_REPORT_SERVICE_MANIFEST_VER,
 };
 
 /**
@@ -62,11 +79,13 @@ enum tsm_attr_index {
  * @TSM_REPORT_INBLOB: index of the binary report input attribute
  * @TSM_REPORT_OUTBLOB: index of the binary report output attribute
  * @TSM_REPORT_AUXBLOB: index of the binary auxiliary data attribute
+ * @TSM_REPORT_MANIFESTBLOB: index of the binary manifest data attribute
  */
 enum tsm_bin_attr_index {
 	TSM_REPORT_INBLOB,
 	TSM_REPORT_OUTBLOB,
 	TSM_REPORT_AUXBLOB,
+	TSM_REPORT_MANIFESTBLOB,
 };
 
 /**
-- 
2.43.2

