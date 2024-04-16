Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 496931C7FDF
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 18:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713284406; x=1744820406;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tqnHBt08iPmhzxbME0xHsYae6YSGaA7ncoXD6G3ZAB4=;
 b=Teu8vAy/CvvlsjLmmubUCLZMYidSWSfMDqB914al3htP8vdIlO0yLWR5
 FIB3xIBk/qyCIvCKsCvwi0G8JZy4eiIz/lua4RNg7T8+s720qGOyi49Zy
 nef7c3HhtmgHMpjqXEJEEX6IxHFH3Rq/9y5g+gGh90dfre7aeA5nsrlFl
 24C9rZ2u8cat9ieitdiphZKE1FMDh6ZT6jqutWylV5a6YpH5bDpWxPLKF
 eQNtk80ZYFrJKX3v0sPeq3zrilGS28ph4g0kzTBKPmwEf34eF/MsCeeR+
 rGTkcUM2rzigmphZX3o1e4tTgn7Pw6CnE1A5DfNEmk5UVex4/8+cbtxBz Q==;
Date: Tue, 16 Apr 2024 09:19:54 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <661ea52a53541_4d56129416@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <1ca853e149fe37be748c028a9b0d00237eb73938.1711405593.git.thomas.lendacky@amd.com>
 <661e0e9418862_4d5612941c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <3732b0d2-0471-48ce-89b8-43f425040846@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3732b0d2-0471-48ce-89b8-43f425040846@amd.com>
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
To: Tom Lendacky <thomas.lendacky@amd.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

Tom Lendacky wrote:
> On 4/16/24 00:37, Dan Williams wrote:
> > Tom Lendacky wrote:
> >> When an SVSM is present, the guest can also request attestation reports
> >> from the SVSM. These SVSM attestation reports can be used to attest the
> >> SVSM and any services running within the SVSM.
> >>
> >> Extend the config-fs attestation support to allow for an SVSM attestation
> >> report. This involves creating four (4) new config-fs attributes:
> >>
> >>    - 'service-provider' (input)
> >>      This attribute is used to determine whether the attestation request
> >>      should be sent to the specified service provider or to the SEV
> >>      firmware. The SVSM service provider is represented by the value
> >>      'svsm'.
> >>
> >>    - 'service_guid' (input)
> >>      Used for requesting the attestation of a single service within the
> >>      service provider. A null GUID implies that the SVSM_ATTEST_SERVICES
> >>      call should be used to request the attestation report. A non-null
> >>      GUID implies that the SVSM_ATTEST_SINGLE_SERVICE call should be used.
> >>
> >>    - 'service_manifest_version' (input)
> >>      Used with the SVSM_ATTEST_SINGLE_SERVICE call, the service version
> >>      represents a specific service manifest version be used for the
> >>      attestation report.
> >>
> >>    - 'manifestblob' (output)
> >>      Used to return the service manifest associated with the attestation
> >>      report.
> >>
> >> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
[..]
> >> +What:		/sys/kernel/config/tsm/report/$name/service_provider
> >> +Date:		January, 2024
> >> +KernelVersion:	v6.10
> >> +Contact:	linux-coco@lists.linux.dev
> >> +Description:
> >> +		(WO) Attribute is visible if a TSM implementation provider
> >> +		supports the concept of attestation reports from a service
> >> +		provider for TVMs, like SEV-SNP running under an SVSM.
> >> +		Specifying the service provider via this attribute will create
> >> +		an attestation report as specified by the service provider.
> >> +		Currently supported service-providers are:
> >> +			svsm
> >> +
> >> +		For the SVSM service provider, see the Secure VM Service Module
> >> +		for SEV-SNP Guests v1.00 Section 7.
> >> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
> > 
> > Given "SVSM" is a cross vendor concept should this explicitly
> > callout: "For provider.service_provider == sev_guest.svsm" as
> > preparation for other implementations defining their "svsm" manifest
> > format?
> 
> I'm not sure. Do we need to get that specific? If SVSM is cross vendor, 
> will it be using / adding to the existing SVSM specification? If not, 
> then each vendor is likely to have its own name for the SVSM concept 
> that would be unique enough...

Yeah, I guess we can kick can that down the road and see what other
vendors do. I know the coconut-svsm project is cross vendor, but I do
not know the details.

> >> +
> >> +What:		/sys/kernel/config/tsm/report/$name/service_manifest_version
> >> +Date:		January, 2024
> >> +KernelVersion:	v6.10
> >> +Contact:	linux-coco@lists.linux.dev
> >> +Description:
> >> +		(WO) Attribute is visible if a TSM implementation provider
> >> +		supports the concept of attestation reports from a service
> >> +		provider for TVMs, like SEV-SNP running under an SVSM.
> >> +		Indicates the service manifest version requested for the
> >> +		attestation report. If this field is not set by the user,
> >> +		the default manifest version of the service (the service's
> >> +		initial/first manifest version) is returned. The initial
> >> +		manifest version is always available.
> > 
> > ...and that number is zero? Is there any expectation that the kernel
> 
> Yes, that number is zero.
> 
> > sanity checks this version, or how does the user figure out they need to
> > roll this request back?
> 
> Right now there aren't any non-zero versions, so there is nothing for 
> the user to figure out. However, the service will determine when it 
> creates a new version and then the user will need to understand what the 
> reason for that is and decide. I'm not sure I can give you a specific 
> answer at this stage, but we need to allow for a change in the manifest 
> without affecting existing users.

Right, but it feels odd that userspace could write UINT_MAX to this
value and the kernel says, "yup, looks like a valid manifest version to
me".

> And since the spec has been approved already, I can't really go back and 
> add a requirement that manifest format always be additive.

Those breaking changes have not arrived yet so still a chance to
influence, no?

The documentation here at least guarantees that the initial manifest
version is always valid, and I expect the spec authors to realize that
the kernel has a role to play in not breaking existing userspace. I.e.
it is not in the spec's interest to disallow fallback to any
version between 0 and N-1 where N is the latest.

The kernel need not tolerate version induced breakage from ACPI
specification updates because that spec is committed to compatibility,
why does this spec need to be less disciplined than that?

> >> +
> >> +		For the SVSM service provider, see the Secure VM Service Module
> >> +		for SEV-SNP Guests v1.00 Section 7.
> >> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
> > 
> 
> >> +static ssize_t tsm_report_service_provider_store(struct config_item *cfg,
> >> +						 const char *buf, size_t len)
> >> +{
> >> +	struct tsm_report *report = to_tsm_report(cfg);
> >> +	size_t sp_len;
> >> +	char *sp;
> >> +	int rc;
> >> +
> >> +	guard(rwsem_write)(&tsm_rwsem);
> >> +	rc = try_advance_write_generation(report);
> >> +	if (rc)
> >> +		return rc;
> >> +
> >> +	sp_len = (buf[len - 1] != '\n') ? len : len - 1;
> > 
> > This feels like it wants a sysfs_strdup().
> 
> If there start to be more string oriented operations in the file, then 
> it might be worth it. For now I don't really see a reason.

To be clear I was thinking of occurrences of this patten outside of this
file. Turns out this pattern is not as prevalent as I would have
guessed, resource_alignment_store() was the only occurrence I could
find. Skip for now works for me.
