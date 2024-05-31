Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 3790C1C29D7
 for <svsm-devel@coconut-svsm.dev>; Fri, 31 May 2024 15:16:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1717161401; bh=MBoInph48R5H6sVBCrU78RHdg8wzQUMpapSuKIbmamc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JEOF8PX7AHTrUx4BAHiguRqjAhC4NqdN9iwlxWvatGp6h4dKscp7mKEc5+MXAU02R
 5MvxPaKapcNixUFCSCh4XwH3biA73mV4cc2t3qIqmHDXgqTErtQD0+V8t6ClltU78B
 DG1CkNCRmJuC1sRYklIaH5F1+2B8phh4/OBGemtmlikpsHHKBk1ZmG1RzBGfZlozMX
 cwRZLtSJzgKwcI0yS5dzCLXTZdkB81U9RNjbBIPz14lwZhtXkC2Gy6vdT+AG0HW9gg
 KXW2S/ylYlxI5QSlT+ZeJI0SjVYE2Ekp/Fg9TjI4ia48JXVgfjvcYM2TvfWG215hV0
 0yWkOConHYUnvuiTJmUA4LXFoFxavX25ed+J0ji76BProl+ofKUaylQezWoQ4/a9CN
 vseaK1RufHcxBf2z7juKPPh4zhQLbncAFgrXwnHkvOkBm2PhAuPmpG2A4Tf5GCFoqm
 hPaTAnOizkILBsK0aiEqCkmZjVHVG64NJ1TD5WTG47IlNpRs8d5SxG9QFNsKOID3uh
 5mkSuDS9/HyTA+b9FZaMC/LMrqp6zG6po3OiVr2ksjzxpeyHL+/BXeKoMyO3q290IH
 A05ji2/CKHKuFF9eYCAa++i5Lhb6zFUOjwqdkyIzxt4/iV0nBfeDtDMdnJAeyd3V6m
 hXY/h+AecapPBFUEM5evp4tM=
Date: Fri, 31 May 2024 15:16:19 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240531131619.GKZlnNo20bj98_ILiM@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <9a4c4a16d00834c1b7ff458e25c185ac1c9bcf79.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9a4c4a16d00834c1b7ff458e25c185ac1c9bcf79.1713974291.git.thomas.lendacky@amd.com>
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
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On Wed, Apr 24, 2024 at 10:58:10AM -0500, Tom Lendacky wrote:
> +/*
> + * The SVSM Attestation related structures
> + */
> +struct svsm_location_entry {

"svsm_loc" should be enough.

> +	u64 pa;
> +	u32 len;
> +	u8 rsvd[4];
> +};
> +
> +struct svsm_attestation_call {

Can we shorten all "attestion" to "atst" or "attest"?

> +	struct svsm_location_entry report_buffer;
> +	struct svsm_location_entry nonce;
> +	struct svsm_location_entry manifest_buffer;
> +	struct svsm_location_entry certificates_buffer;

report_buf;
nonce;
manifest_buf;
certs_buf;

Please shorten all those.

> +	/* For attesting a single service */
> +	u8 service_guid[16];
> +	u32 service_manifest_version;

manifest_ver;

> +	u8 rsvd[4];
> +};
> +
>  /*
>   * SVSM protocol structure

...

> +static void update_attestation_input(struct svsm_call *call, struct svsm_attestation_call *input)
> +{
> +	/* If (new) lengths have been returned, propograte them up */

"propagate"

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

This looks like BIOS code. The only thing that's missing is the
CamelCase. :-)

int snp_issue_svsm_attest_req(u64 call_id, struct svsm_attest_call *input_call)

Now that's more like it!

> +{
> +	struct svsm_attestation_call *attest_call;

	struct svsm_attest_call *atst_call;

> +	struct svsm_call call = {};
> +	unsigned long flags;
> +	u64 attest_call_pa;
> +	int ret;
> +
> +	if (!vmpl)
> +		return -EINVAL;
> +

...

> +static int sev_svsm_report_new(struct tsm_report *report, void *data)
> +{
> +	unsigned int report_len, manifest_len, certificates_len;
> +	void *report_blob, *manifest_blob, *certificates_blob;

Prose. Shorter pls.

> +	struct svsm_attestation_call attest_call = {};
> +	struct tsm_desc *desc = &report->desc;
> +	unsigned int retry_count;
> +	unsigned int size;
> +	bool try_again;
> +	void *buffer;
> +	u64 call_id;
> +	int ret;

...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
