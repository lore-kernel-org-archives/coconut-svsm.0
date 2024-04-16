Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 04FE31C78F5
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 07:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713245853; x=1744781853;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gWJom7rWOv5lm1CRe75RoZf4h8KkngkZTtS9hsNgMU0=;
 b=R7PkB9tVhtpIVDqCfGNnJvg1qOsiQy2mu+2qUzMqUAbSvHB9zXIehMAg
 O9aozoPYttRlO19q+bmMtic3DbGULC5z2WxxnjOGPh5+z3st7j2+Dx9rv
 +rv98PwKwkSz0L7NdgM7y7kRAcUFE8nbybLgvyPwmjn8mL8r3gRm8UDNp
 Ffn01/e09n8EPOfQPU7ULcE/ZjraGvk8g9X4niF2KFdYDF5AZCFib9r5H
 XIoGvi1CDdd+1UKreBfS63Is+Lx90iS5Dp1elk/lMqtaORx+EgFxzlPN/
 75poA8MKihYiJ/ZRlW59bVrAX6QCDTzAg6aFWbVtp5XswcYY8Qg6jTkoJ A==;
Date: Mon, 15 Apr 2024 22:37:24 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <661e0e9418862_4d5612941c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <1ca853e149fe37be748c028a9b0d00237eb73938.1711405593.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1ca853e149fe37be748c028a9b0d00237eb73938.1711405593.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 11/14] x86/sev: Extend the config-fs
 attestation support for an SVSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

Tom Lendacky wrote:
> When an SVSM is present, the guest can also request attestation reports
> from the SVSM. These SVSM attestation reports can be used to attest the
> SVSM and any services running within the SVSM.
> 
> Extend the config-fs attestation support to allow for an SVSM attestation
> report. This involves creating four (4) new config-fs attributes:
> 
>   - 'service-provider' (input)
>     This attribute is used to determine whether the attestation request
>     should be sent to the specified service provider or to the SEV
>     firmware. The SVSM service provider is represented by the value
>     'svsm'.
> 
>   - 'service_guid' (input)
>     Used for requesting the attestation of a single service within the
>     service provider. A null GUID implies that the SVSM_ATTEST_SERVICES
>     call should be used to request the attestation report. A non-null
>     GUID implies that the SVSM_ATTEST_SINGLE_SERVICE call should be used.
> 
>   - 'service_manifest_version' (input)
>     Used with the SVSM_ATTEST_SINGLE_SERVICE call, the service version
>     represents a specific service manifest version be used for the
>     attestation report.
> 
>   - 'manifestblob' (output)
>     Used to return the service manifest associated with the attestation
>     report.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  Documentation/ABI/testing/configfs-tsm  |  69 +++++++++++
>  arch/x86/include/asm/sev.h              |  31 ++++-
>  arch/x86/kernel/sev.c                   |  50 ++++++++
>  drivers/virt/coco/sev-guest/sev-guest.c | 151 ++++++++++++++++++++++++
>  drivers/virt/coco/tsm.c                 |  93 ++++++++++++++-
>  include/linux/tsm.h                     |  11 ++
>  6 files changed, 402 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-tsm b/Documentation/ABI/testing/configfs-tsm
> index dd24202b5ba5..72a7acdb5258 100644
> --- a/Documentation/ABI/testing/configfs-tsm
> +++ b/Documentation/ABI/testing/configfs-tsm
> @@ -31,6 +31,21 @@ Description:
>  		Standardization v2.03 Section 4.1.8.1 MSG_REPORT_REQ.
>  		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56421.pdf
>  
> +What:		/sys/kernel/config/tsm/report/$name/manifestblob
> +Date:		January, 2024
> +KernelVersion:	v6.10
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(RO) Optional supplemental data that a TSM may emit, visibility
> +		of this attribute depends on TSM, and may be empty if no
> +		manifest data is available.
> +
> +		When @provider is "sev_guest" and the @service_provider is
> +		"svsm" this file contains the service manifest used for the SVSM
> +		attestation report from the Secure VM Service Module for SEV-SNP
> +		Guests v1.00 Section 7.
> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf

Should this be "See 'service_provider' for the format of this blob"? To
date external "format specification" links are only referenced once in
this file, and this one is now duplicated.


> +
>  What:		/sys/kernel/config/tsm/report/$name/provider
>  Date:		September, 2023
>  KernelVersion:	v6.7
> @@ -80,3 +95,57 @@ Contact:	linux-coco@lists.linux.dev
>  Description:
>  		(RO) Indicates the minimum permissible value that can be written
>  		to @privlevel.
> +
> +What:		/sys/kernel/config/tsm/report/$name/service_provider
> +Date:		January, 2024
> +KernelVersion:	v6.10
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(WO) Attribute is visible if a TSM implementation provider
> +		supports the concept of attestation reports from a service
> +		provider for TVMs, like SEV-SNP running under an SVSM.
> +		Specifying the service provider via this attribute will create
> +		an attestation report as specified by the service provider.
> +		Currently supported service-providers are:
> +			svsm
> +
> +		For the SVSM service provider, see the Secure VM Service Module
> +		for SEV-SNP Guests v1.00 Section 7.
> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf

Given "SVSM" is a cross vendor concept should this explicitly
callout: "For provider.service_provider == sev_guest.svsm" as
preparation for other implementations defining their "svsm" manifest
format? 

> +
> +What:		/sys/kernel/config/tsm/report/$name/service_guid
> +Date:		January, 2024
> +KernelVersion:	v6.10
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(WO) Attribute is visible if a TSM implementation provider
> +		supports the concept of attestation reports from a service
> +		provider for TVMs, like SEV-SNP running under an SVSM.
> +		Specifying an empty/null GUID (00000000-0000-0000-0000-000000)
> +		requests all active services within the service provider be
> +		part of the attestation report. Specifying a GUID request
> +		an attestation report of just the specified service using the
> +		manifest form specified by the service_manifest_version
> +		attribute.
> +
> +		For the SVSM service provider, see the Secure VM Service Module
> +		for SEV-SNP Guests v1.00 Section 7.
> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf

...another "See..." instead of duplicate.

> +
> +What:		/sys/kernel/config/tsm/report/$name/service_manifest_version
> +Date:		January, 2024
> +KernelVersion:	v6.10
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(WO) Attribute is visible if a TSM implementation provider
> +		supports the concept of attestation reports from a service
> +		provider for TVMs, like SEV-SNP running under an SVSM.
> +		Indicates the service manifest version requested for the
> +		attestation report. If this field is not set by the user,
> +		the default manifest version of the service (the service's
> +		initial/first manifest version) is returned. The initial
> +		manifest version is always available.

...and that number is zero? Is there any expectation that the kernel
sanity checks this version, or how does the user figure out they need to
roll this request back?

> +
> +		For the SVSM service provider, see the Secure VM Service Module
> +		for SEV-SNP Guests v1.00 Section 7.
> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf

Ditto on replacing this with a "See.." reference.


> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index 066eb0ba3d63..94af7fb7a8e1 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -209,6 +209,27 @@ struct svsm_pvalidate_call {
>  	struct svsm_pvalidate_entry entry[];
>  };
>  
> +/*
> + * The SVSM Attestation related structures
> + */
> +struct svsm_location_entry {
> +	u64 pa;
> +	u32 len;
> +	u8 rsvd[4];
> +};
> +
> +struct svsm_attestation_call {
> +	struct svsm_location_entry report_buffer;
> +	struct svsm_location_entry nonce;
> +	struct svsm_location_entry manifest_buffer;
> +	struct svsm_location_entry certificates_buffer;
> +
> +	/* For attesting a single service */
> +	u8 service_guid[16];
> +	u32 service_manifest_version;
> +	u8 rsvd[4];
> +};
> +
>  /*
>   * SVSM protocol structure
>   */
> @@ -232,6 +253,10 @@ struct svsm_call {
>  #define SVSM_CORE_CREATE_VCPU		2
>  #define SVSM_CORE_DELETE_VCPU		3
>  
> +#define SVSM_ATTEST_CALL(x)		((1ULL << 32) | (x))
> +#define SVSM_ATTEST_SERVICES		0
> +#define SVSM_ATTEST_SINGLE_SERVICE	1
> +
>  #ifdef CONFIG_AMD_MEM_ENCRYPT
>  extern void __sev_es_ist_enter(struct pt_regs *regs);
>  extern void __sev_es_ist_exit(void);
> @@ -302,6 +327,7 @@ void snp_set_wakeup_secondary_cpu(void);
>  bool snp_init(struct boot_params *bp);
>  void __noreturn snp_abort(void);
>  int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, struct snp_guest_request_ioctl *rio);
> +int snp_issue_svsm_attestation_request(u64 call_id, struct svsm_attestation_call *input);
>  void snp_accept_memory(phys_addr_t start, phys_addr_t end);
>  u64 snp_get_unsupported_features(u64 status);
>  u64 sev_get_status(void);
> @@ -333,7 +359,10 @@ static inline int snp_issue_guest_request(u64 exit_code, struct snp_req_data *in
>  {
>  	return -ENOTTY;
>  }
> -
> +static inline int snp_issue_svsm_attestation_request(u64 call_id, struct svsm_attestation_call *input)
> +{
> +	return -ENOTTY;
> +}
>  static inline void snp_accept_memory(phys_addr_t start, phys_addr_t end) { }
>  static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
>  static inline u64 sev_get_status(void) { return 0; }
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index 7e2b9934a95d..0a06632898c6 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -2400,6 +2400,56 @@ static int __init init_sev_config(char *str)
>  }
>  __setup("sev=", init_sev_config);
>  
> +static void update_attestation_input(struct svsm_call *call, struct svsm_attestation_call *input)
> +{
> +	/* If (new) lengths have been returned, propograte them up */
> +	if (call->rcx_out != call->rcx)
> +		input->manifest_buffer.len = call->rcx_out;
> +
> +	if (call->rdx_out != call->rdx)
> +		input->certificates_buffer.len = call->rdx_out;
> +
> +	if (call->r8_out != call->r8)
> +		input->report_buffer.len = call->r8_out;
> +}
> +
> +int snp_issue_svsm_attestation_request(u64 call_id, struct svsm_attestation_call *input)
> +{
> +	struct svsm_attestation_call *attest_call;
> +	struct svsm_call call = {};
> +	unsigned long flags;
> +	u64 attest_call_pa;
> +	int ret;
> +
> +	if (!vmpl)
> +		return -EINVAL;
> +
> +	local_irq_save(flags);
> +
> +	call.caa = __svsm_get_caa();
> +
> +	attest_call = (struct svsm_attestation_call *)call.caa->svsm_buffer;
> +	attest_call_pa = __svsm_get_caa_pa() + offsetof(struct svsm_ca, svsm_buffer);
> +
> +	*attest_call = *input;
> +
> +	/*
> +	 * Set input registers for the request and set RDX and R8 to known
> +	 * values in order to detect length values being returned in them.
> +	 */
> +	call.rax = call_id;
> +	call.rcx = attest_call_pa;
> +	call.rdx = -1;
> +	call.r8 = -1;
> +	ret = svsm_protocol(&call);
> +	update_attestation_input(&call, input);
> +
> +	local_irq_restore(flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(snp_issue_svsm_attestation_request);
> +
>  int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, struct snp_guest_request_ioctl *rio)
>  {
>  	struct ghcb_state state;
> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
> index bba6531cb606..0d2c9926a97c 100644
> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> @@ -38,6 +38,8 @@
>  #define SNP_REQ_MAX_RETRY_DURATION	(60*HZ)
>  #define SNP_REQ_RETRY_DELAY		(2*HZ)
>  
> +#define SVSM_MAX_RETRIES		3
> +
>  struct snp_guest_crypto {
>  	struct crypto_aead *tfm;
>  	u8 *iv, *authtag;
> @@ -783,6 +785,148 @@ struct snp_msg_cert_entry {
>  	u32 length;
>  };
>  
> +static int sev_svsm_report_new(struct tsm_report *report, void *data)
> +{
> +	unsigned int report_len, manifest_len, certificates_len;
> +	void *report_blob, *manifest_blob, *certificates_blob;
> +	struct svsm_attestation_call attest_call = {};
> +	struct tsm_desc *desc = &report->desc;
> +	unsigned int retry_count;
> +	unsigned int size;
> +	bool try_again;
> +	void *buffer;
> +	u64 call_id;
> +	int ret;
> +
> +	/*
> +	 * Allocate pages for the request:
> +	 * - Report blob (4K)
> +	 * - Manifest blob (4K)
> +	 * - Certificate blob (16K)
> +	 *
> +	 * Above addresses must be 4K aligned
> +	 */
> +	report_len = SZ_4K;
> +	manifest_len = SZ_4K;
> +	certificates_len = SEV_FW_BLOB_MAX_SIZE;
> +
> +	if (guid_is_null(&desc->service_guid)) {
> +		call_id = SVSM_ATTEST_CALL(SVSM_ATTEST_SERVICES);
> +	} else {
> +		export_guid(attest_call.service_guid, &desc->service_guid);
> +		attest_call.service_manifest_version = desc->service_manifest_version;
> +
> +		call_id = SVSM_ATTEST_CALL(SVSM_ATTEST_SINGLE_SERVICE);
> +	}
> +
> +	retry_count = 0;
> +
> +retry:
> +	size = report_len + manifest_len + certificates_len;
> +	buffer = alloc_pages_exact(size, __GFP_ZERO);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	report_blob = buffer;
> +	attest_call.report_buffer.pa = __pa(report_blob);
> +	attest_call.report_buffer.len = report_len;
> +
> +	manifest_blob = report_blob + report_len;
> +	attest_call.manifest_buffer.pa = __pa(manifest_blob);
> +	attest_call.manifest_buffer.len = manifest_len;
> +
> +	certificates_blob = manifest_blob + manifest_len;
> +	attest_call.certificates_buffer.pa = __pa(certificates_blob);
> +	attest_call.certificates_buffer.len = certificates_len;
> +
> +	attest_call.nonce.pa = __pa(desc->inblob);
> +	attest_call.nonce.len = desc->inblob_len;
> +
> +	ret = snp_issue_svsm_attestation_request(call_id, &attest_call);
> +	switch (ret) {
> +	case SVSM_SUCCESS:
> +		break;
> +	case SVSM_ERR_INVALID_PARAMETER:
> +		ret = -EINVAL;
> +
> +		if (retry_count >= SVSM_MAX_RETRIES)
> +			goto error;
> +
> +		try_again = false;
> +
> +		if (attest_call.report_buffer.len > report_len) {
> +			report_len = PAGE_ALIGN(attest_call.report_buffer.len);
> +			try_again = true;
> +		}
> +
> +		if (attest_call.manifest_buffer.len > manifest_len) {
> +			manifest_len = PAGE_ALIGN(attest_call.manifest_buffer.len);
> +			try_again = true;
> +		}
> +
> +		if (attest_call.certificates_buffer.len > certificates_len) {
> +			certificates_len = PAGE_ALIGN(attest_call.certificates_buffer.len);
> +			try_again = true;
> +		}
> +
> +		/* If one of the buffers wasn't large enough, retry the request */
> +		if (try_again) {
> +			free_pages_exact(buffer, size);
> +			retry_count++;
> +			goto retry;
> +		}
> +
> +		goto error;
> +	case SVSM_ERR_BUSY:
> +		ret = -EAGAIN;
> +		goto error;
> +	default:
> +		pr_err_ratelimited("SVSM attestation request failed (%#x)\n", ret);
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
> +	ret = -ENOMEM;
> +
> +	report_len = attest_call.report_buffer.len;
> +	void *rbuf __free(kvfree) = kvzalloc(report_len, GFP_KERNEL);
> +	if (!rbuf)
> +		goto error;
> +
> +	memcpy(rbuf, report_blob, report_len);
> +	report->outblob = no_free_ptr(rbuf);
> +	report->outblob_len = report_len;
> +
> +	manifest_len = attest_call.manifest_buffer.len;
> +	void *mbuf __free(kvfree) = kvzalloc(manifest_len, GFP_KERNEL);
> +	if (!mbuf)
> +		goto error;
> +
> +	memcpy(mbuf, manifest_blob, manifest_len);
> +	report->manifestblob = no_free_ptr(mbuf);
> +	report->manifestblob_len = manifest_len;
> +
> +	certificates_len = attest_call.certificates_buffer.len;
> +	if (!certificates_len)
> +		goto success;
> +
> +	void *cbuf __free(kvfree) = kvzalloc(certificates_len, GFP_KERNEL);
> +	if (!cbuf)
> +		goto error;
> +
> +	memcpy(cbuf, certificates_blob, certificates_len);
> +	report->auxblob = no_free_ptr(cbuf);
> +	report->auxblob_len = certificates_len;
> +
> +success:
> +	ret = 0;
> +
> +error:
> +	free_pages_exact(buffer, size);
> +
> +	return ret;
> +}
> +
>  static int sev_report_new(struct tsm_report *report, void *data)
>  {
>  	struct snp_msg_cert_entry *cert_table;
> @@ -797,6 +941,13 @@ static int sev_report_new(struct tsm_report *report, void *data)
>  	if (desc->inblob_len != SNP_REPORT_USER_DATA_SIZE)
>  		return -EINVAL;
>  
> +	if (desc->service_provider) {
> +		if (strcmp(desc->service_provider, "svsm"))
> +			return -EINVAL;
> +
> +		return sev_svsm_report_new(report, data);
> +	}
> +
>  	void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
> diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
> index d1c2db83a8ca..46f230bf13ac 100644
> --- a/drivers/virt/coco/tsm.c
> +++ b/drivers/virt/coco/tsm.c
> @@ -35,7 +35,7 @@ static DECLARE_RWSEM(tsm_rwsem);
>   * The attestation report format is TSM provider specific, when / if a standard
>   * materializes that can be published instead of the vendor layout. Until then
>   * the 'provider' attribute indicates the format of 'outblob', and optionally
> - * 'auxblob'.
> + * 'auxblob' and 'manifestblob'.
>   */
>  
>  struct tsm_report_state {
> @@ -48,6 +48,7 @@ struct tsm_report_state {
>  enum tsm_data_select {
>  	TSM_REPORT,
>  	TSM_CERTS,
> +	TSM_MANIFEST,
>  };
>  
>  static struct tsm_report *to_tsm_report(struct config_item *cfg)
> @@ -119,6 +120,74 @@ static ssize_t tsm_report_privlevel_floor_show(struct config_item *cfg,
>  }
>  CONFIGFS_ATTR_RO(tsm_report_, privlevel_floor);
>  
> +static ssize_t tsm_report_service_provider_store(struct config_item *cfg,
> +						 const char *buf, size_t len)
> +{
> +	struct tsm_report *report = to_tsm_report(cfg);
> +	size_t sp_len;
> +	char *sp;
> +	int rc;
> +
> +	guard(rwsem_write)(&tsm_rwsem);
> +	rc = try_advance_write_generation(report);
> +	if (rc)
> +		return rc;
> +
> +	sp_len = (buf[len - 1] != '\n') ? len : len - 1;

This feels like it wants a sysfs_strdup().

> +
> +	sp = kstrndup(buf, sp_len, GFP_KERNEL);
> +	if (!sp)
> +		return -ENOMEM;
> +	kfree(report->desc.service_provider);
> +
> +	report->desc.service_provider = sp;
> +
> +	return len;
> +}
> +CONFIGFS_ATTR_WO(tsm_report_, service_provider);
> +
> +static ssize_t tsm_report_service_guid_store(struct config_item *cfg,
> +					     const char *buf, size_t len)
> +{
> +	struct tsm_report *report = to_tsm_report(cfg);
> +	int rc;
> +
> +	guard(rwsem_write)(&tsm_rwsem);
> +	rc = try_advance_write_generation(report);
> +	if (rc)
> +		return rc;
> +
> +	report->desc.service_guid = guid_null;
> +
> +	rc = guid_parse(buf, &report->desc.service_guid);
> +	if (rc)
> +		return rc;
> +
> +	return len;
> +}
> +CONFIGFS_ATTR_WO(tsm_report_, service_guid);
> +
> +static ssize_t tsm_report_service_manifest_version_store(struct config_item *cfg,
> +							 const char *buf, size_t len)
> +{
> +	struct tsm_report *report = to_tsm_report(cfg);
> +	unsigned int val;
> +	int rc;
> +
> +	rc = kstrtouint(buf, 0, &val);
> +	if (rc)
> +		return rc;
> +
> +	guard(rwsem_write)(&tsm_rwsem);
> +	rc = try_advance_write_generation(report);
> +	if (rc)
> +		return rc;
> +	report->desc.service_manifest_version = val;
> +
> +	return len;
> +}
> +CONFIGFS_ATTR_WO(tsm_report_, service_manifest_version);
> +
>  static ssize_t tsm_report_inblob_write(struct config_item *cfg,
>  				       const void *buf, size_t count)
>  {
> @@ -163,6 +232,9 @@ static ssize_t __read_report(struct tsm_report *report, void *buf, size_t count,
>  	if (select == TSM_REPORT) {
>  		out = report->outblob;
>  		len = report->outblob_len;
> +	} else if (select == TSM_MANIFEST) {
> +		out = report->manifestblob;
> +		len = report->manifestblob_len;
>  	} else {
>  		out = report->auxblob;
>  		len = report->auxblob_len;
> @@ -188,7 +260,7 @@ static ssize_t read_cached_report(struct tsm_report *report, void *buf,
>  
>  	/*
>  	 * A given TSM backend always fills in ->outblob regardless of
> -	 * whether the report includes an auxblob or not.
> +	 * whether the report includes an auxblob/manifestblob or not.
>  	 */
>  	if (!report->outblob ||
>  	    state->read_generation != state->write_generation)
> @@ -224,8 +296,10 @@ static ssize_t tsm_report_read(struct tsm_report *report, void *buf,
>  
>  	kvfree(report->outblob);
>  	kvfree(report->auxblob);
> +	kvfree(report->manifestblob);
>  	report->outblob = NULL;
>  	report->auxblob = NULL;
> +	report->manifestblob = NULL;
>  	rc = ops->report_new(report, provider.data);
>  	if (rc < 0)
>  		return rc;
> @@ -252,6 +326,15 @@ static ssize_t tsm_report_auxblob_read(struct config_item *cfg, void *buf,
>  }
>  CONFIGFS_BIN_ATTR_RO(tsm_report_, auxblob, NULL, TSM_OUTBLOB_MAX);
>  
> +static ssize_t tsm_report_manifestblob_read(struct config_item *cfg, void *buf,
> +					    size_t count)
> +{
> +	struct tsm_report *report = to_tsm_report(cfg);
> +
> +	return tsm_report_read(report, buf, count, TSM_MANIFEST);
> +}
> +CONFIGFS_BIN_ATTR_RO(tsm_report_, manifestblob, NULL, TSM_OUTBLOB_MAX);
> +
>  #define TSM_DEFAULT_ATTRS() \
>  	&tsm_report_attr_generation, \
>  	&tsm_report_attr_provider
> @@ -265,6 +348,9 @@ static struct configfs_attribute *tsm_report_extra_attrs[] = {
>  	TSM_DEFAULT_ATTRS(),
>  	&tsm_report_attr_privlevel,
>  	&tsm_report_attr_privlevel_floor,
> +	&tsm_report_attr_service_provider,
> +	&tsm_report_attr_service_guid,
> +	&tsm_report_attr_service_manifest_version,

Shouldn't this patch come after the configfs dynamic visibility so there
is no point in the history where vestigial attributes show up?
