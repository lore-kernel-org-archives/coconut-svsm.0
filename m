Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 322AD1C3858
 for <svsm-devel@coconut-svsm.dev>; Fri, 31 May 2024 21:03:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynZxi1RAMGUVvX6VYTyjov5eG1Deyazh8J/sHHG3bPo=;
 b=jAxffO6MFQNd3YpnijEiPhW2K0pAJ1vJo4/jwt/KhUGYk44Xj48/+RG3xB5q0PE70+i3Q/aLAWaxVn0YOd0hbm1wHXepq+9nZyD6gDNwx9aL4BUvCn5KkqjPdWlTKUA/uL0dhyPT+k+BGyCFaZrhy9IqHxNPu07Z6kmgcCELJdE=
Message-ID: <f3bed7b1-0044-0962-3094-2d7ae2ac3737@amd.com>
Date: Fri, 31 May 2024 14:03:21 -0500
Content-Language: en-US
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <9a4c4a16d00834c1b7ff458e25c185ac1c9bcf79.1713974291.git.thomas.lendacky@amd.com>
 <20240531131619.GKZlnNo20bj98_ILiM@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240531131619.GKZlnNo20bj98_ILiM@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 14/15] x86/sev: Extend the config-fs
 attestation support for an SVSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 5/31/24 08:16, Borislav Petkov wrote:
> On Wed, Apr 24, 2024 at 10:58:10AM -0500, Tom Lendacky wrote:
>> +/*
>> + * The SVSM Attestation related structures
>> + */
>> +struct svsm_location_entry {
> 
> "svsm_loc" should be enough.

Ok

> 
>> +	u64 pa;
>> +	u32 len;
>> +	u8 rsvd[4];
>> +};
>> +
>> +struct svsm_attestation_call {
> 
> Can we shorten all "attestion" to "atst" or "attest"?

Will shorten to attest.

> 
>> +	struct svsm_location_entry report_buffer;
>> +	struct svsm_location_entry nonce;
>> +	struct svsm_location_entry manifest_buffer;
>> +	struct svsm_location_entry certificates_buffer;
> 
> report_buf;
> nonce;
> manifest_buf;
> certs_buf;
> 
> Please shorten all those.

Ok.

> 
>> +	/* For attesting a single service */
>> +	u8 service_guid[16];
>> +	u32 service_manifest_version;
> 
> manifest_ver;

Yep.

> 
>> +	u8 rsvd[4];
>> +};
>> +
>>   /*
>>    * SVSM protocol structure
> 
> ...
> 
>> +static void update_attestation_input(struct svsm_call *call, struct svsm_attestation_call *input)
>> +{
>> +	/* If (new) lengths have been returned, propograte them up */
> 
> "propagate"

Fixed.

> 
>> +	if (call->rcx_out != call->rcx)
>> +		input->manifest_buffer.len = call->rcx_out;
>> +
>> +	if (call->rdx_out != call->rdx)
>> +		input->certificates_buffer.len = call->rdx_out;
>> +
>> +	if (call->r8_out != call->r8)
>> +		input->report_buffer.len = call->r8_out;
>> +}
>> +
>> +int snp_issue_svsm_attestation_request(u64 call_id, struct svsm_attestation_call *input)
> 
> This looks like BIOS code. The only thing that's missing is the
> CamelCase. :-)
> 
> int snp_issue_svsm_attest_req(u64 call_id, struct svsm_attest_call *input_call)
> 
> Now that's more like it!

Ok.

> 
>> +{
>> +	struct svsm_attestation_call *attest_call;
> 
> 	struct svsm_attest_call *atst_call;

Ok, I'll use 'ac'

> 
>> +	struct svsm_call call = {};
>> +	unsigned long flags;
>> +	u64 attest_call_pa;
>> +	int ret;
>> +
>> +	if (!vmpl)
>> +		return -EINVAL;
>> +
> 
> ...
> 
>> +static int sev_svsm_report_new(struct tsm_report *report, void *data)
>> +{
>> +	unsigned int report_len, manifest_len, certificates_len;
>> +	void *report_blob, *manifest_blob, *certificates_blob;
> 
> Prose. Shorter pls.

Ok.

Thanks,
Tom

> 
>> +	struct svsm_attestation_call attest_call = {};
>> +	struct tsm_desc *desc = &report->desc;
>> +	unsigned int retry_count;
>> +	unsigned int size;
>> +	bool try_again;
>> +	void *buffer;
>> +	u64 call_id;
>> +	int ret;
> 
> ...
> 
