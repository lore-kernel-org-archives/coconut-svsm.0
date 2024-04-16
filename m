Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 0C19F1C7F96
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 17:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAW3glFbi/4fuFqXmyvpAwzObKsmS2JOxYv+DhWfe9Y=;
 b=Pd157vcFUiTUdl7LGF467ZnpVfmOXT9+y+vKbRd+DiHEXyXGaR81YSS8G2UcsD0qE+a2OjmdUnzKiyX9zVaP8imVKBGl2KzyavDIlUhcWtSQ0JPqyrXNRlv8Js875MDEY+AHOvkO4hxSfsbkJWmpwaJ4ZaUzezMBkDd+/0CSMJI=
Message-ID: <3732b0d2-0471-48ce-89b8-43f425040846@amd.com>
Date: Tue, 16 Apr 2024 10:53:06 -0500
Content-Language: en-US
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <1ca853e149fe37be748c028a9b0d00237eb73938.1711405593.git.thomas.lendacky@amd.com>
 <661e0e9418862_4d5612941c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <661e0e9418862_4d5612941c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
To: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 4/16/24 00:37, Dan Williams wrote:
> Tom Lendacky wrote:
>> When an SVSM is present, the guest can also request attestation reports
>> from the SVSM. These SVSM attestation reports can be used to attest the
>> SVSM and any services running within the SVSM.
>>
>> Extend the config-fs attestation support to allow for an SVSM attestation
>> report. This involves creating four (4) new config-fs attributes:
>>
>>    - 'service-provider' (input)
>>      This attribute is used to determine whether the attestation request
>>      should be sent to the specified service provider or to the SEV
>>      firmware. The SVSM service provider is represented by the value
>>      'svsm'.
>>
>>    - 'service_guid' (input)
>>      Used for requesting the attestation of a single service within the
>>      service provider. A null GUID implies that the SVSM_ATTEST_SERVICES
>>      call should be used to request the attestation report. A non-null
>>      GUID implies that the SVSM_ATTEST_SINGLE_SERVICE call should be used.
>>
>>    - 'service_manifest_version' (input)
>>      Used with the SVSM_ATTEST_SINGLE_SERVICE call, the service version
>>      represents a specific service manifest version be used for the
>>      attestation report.
>>
>>    - 'manifestblob' (output)
>>      Used to return the service manifest associated with the attestation
>>      report.
>>
>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>> ---
>>   Documentation/ABI/testing/configfs-tsm  |  69 +++++++++++
>>   arch/x86/include/asm/sev.h              |  31 ++++-
>>   arch/x86/kernel/sev.c                   |  50 ++++++++
>>   drivers/virt/coco/sev-guest/sev-guest.c | 151 ++++++++++++++++++++++++
>>   drivers/virt/coco/tsm.c                 |  93 ++++++++++++++-
>>   include/linux/tsm.h                     |  11 ++
>>   6 files changed, 402 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/configfs-tsm b/Documentation/ABI/testing/configfs-tsm
>> index dd24202b5ba5..72a7acdb5258 100644
>> --- a/Documentation/ABI/testing/configfs-tsm
>> +++ b/Documentation/ABI/testing/configfs-tsm
>> @@ -31,6 +31,21 @@ Description:
>>   		Standardization v2.03 Section 4.1.8.1 MSG_REPORT_REQ.
>>   		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56421.pdf
>>   
>> +What:		/sys/kernel/config/tsm/report/$name/manifestblob
>> +Date:		January, 2024
>> +KernelVersion:	v6.10
>> +Contact:	linux-coco@lists.linux.dev
>> +Description:
>> +		(RO) Optional supplemental data that a TSM may emit, visibility
>> +		of this attribute depends on TSM, and may be empty if no
>> +		manifest data is available.
>> +
>> +		When @provider is "sev_guest" and the @service_provider is
>> +		"svsm" this file contains the service manifest used for the SVSM
>> +		attestation report from the Secure VM Service Module for SEV-SNP
>> +		Guests v1.00 Section 7.
>> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
> 
> Should this be "See 'service_provider' for the format of this blob"? To
> date external "format specification" links are only referenced once in
> this file, and this one is now duplicated.

Yes, I can do that for this and the other ones you identified below.

> 
> 
>> +
>>   What:		/sys/kernel/config/tsm/report/$name/provider
>>   Date:		September, 2023
>>   KernelVersion:	v6.7
>> @@ -80,3 +95,57 @@ Contact:	linux-coco@lists.linux.dev
>>   Description:
>>   		(RO) Indicates the minimum permissible value that can be written
>>   		to @privlevel.
>> +
>> +What:		/sys/kernel/config/tsm/report/$name/service_provider
>> +Date:		January, 2024
>> +KernelVersion:	v6.10
>> +Contact:	linux-coco@lists.linux.dev
>> +Description:
>> +		(WO) Attribute is visible if a TSM implementation provider
>> +		supports the concept of attestation reports from a service
>> +		provider for TVMs, like SEV-SNP running under an SVSM.
>> +		Specifying the service provider via this attribute will create
>> +		an attestation report as specified by the service provider.
>> +		Currently supported service-providers are:
>> +			svsm
>> +
>> +		For the SVSM service provider, see the Secure VM Service Module
>> +		for SEV-SNP Guests v1.00 Section 7.
>> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
> 
> Given "SVSM" is a cross vendor concept should this explicitly
> callout: "For provider.service_provider == sev_guest.svsm" as
> preparation for other implementations defining their "svsm" manifest
> format?

I'm not sure. Do we need to get that specific? If SVSM is cross vendor, 
will it be using / adding to the existing SVSM specification? If not, 
then each vendor is likely to have its own name for the SVSM concept 
that would be unique enough...

> 

>> +
>> +What:		/sys/kernel/config/tsm/report/$name/service_manifest_version
>> +Date:		January, 2024
>> +KernelVersion:	v6.10
>> +Contact:	linux-coco@lists.linux.dev
>> +Description:
>> +		(WO) Attribute is visible if a TSM implementation provider
>> +		supports the concept of attestation reports from a service
>> +		provider for TVMs, like SEV-SNP running under an SVSM.
>> +		Indicates the service manifest version requested for the
>> +		attestation report. If this field is not set by the user,
>> +		the default manifest version of the service (the service's
>> +		initial/first manifest version) is returned. The initial
>> +		manifest version is always available.
> 
> ...and that number is zero? Is there any expectation that the kernel

Yes, that number is zero.

> sanity checks this version, or how does the user figure out they need to
> roll this request back?

Right now there aren't any non-zero versions, so there is nothing for 
the user to figure out. However, the service will determine when it 
creates a new version and then the user will need to understand what the 
reason for that is and decide. I'm not sure I can give you a specific 
answer at this stage, but we need to allow for a change in the manifest 
without affecting existing users.

And since the spec has been approved already, I can't really go back and 
add a requirement that manifest format always be additive.

> 
>> +
>> +		For the SVSM service provider, see the Secure VM Service Module
>> +		for SEV-SNP Guests v1.00 Section 7.
>> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
> 

>> +static ssize_t tsm_report_service_provider_store(struct config_item *cfg,
>> +						 const char *buf, size_t len)
>> +{
>> +	struct tsm_report *report = to_tsm_report(cfg);
>> +	size_t sp_len;
>> +	char *sp;
>> +	int rc;
>> +
>> +	guard(rwsem_write)(&tsm_rwsem);
>> +	rc = try_advance_write_generation(report);
>> +	if (rc)
>> +		return rc;
>> +
>> +	sp_len = (buf[len - 1] != '\n') ? len : len - 1;
> 
> This feels like it wants a sysfs_strdup().

If there start to be more string oriented operations in the file, then 
it might be worth it. For now I don't really see a reason.

> 
>> +
>> +	sp = kstrndup(buf, sp_len, GFP_KERNEL);
>> +	if (!sp)
>> +		return -ENOMEM;
>> +	kfree(report->desc.service_provider);
>> +
>> +	report->desc.service_provider = sp;
>> +
>> +	return len;
>> +}
>> +CONFIGFS_ATTR_WO(tsm_report_, service_provider);
>> +

>>   #define TSM_DEFAULT_ATTRS() \
>>   	&tsm_report_attr_generation, \
>>   	&tsm_report_attr_provider
>> @@ -265,6 +348,9 @@ static struct configfs_attribute *tsm_report_extra_attrs[] = {
>>   	TSM_DEFAULT_ATTRS(),
>>   	&tsm_report_attr_privlevel,
>>   	&tsm_report_attr_privlevel_floor,
>> +	&tsm_report_attr_service_provider,
>> +	&tsm_report_attr_service_guid,
>> +	&tsm_report_attr_service_manifest_version,
> 
> Shouldn't this patch come after the configfs dynamic visibility so there
> is no point in the history where vestigial attributes show up?

Sure, I can do that.

Thanks,
Tom

