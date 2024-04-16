Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A0EFF1C7945
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 08:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713247537; x=1744783537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z7BeCgqNwItHEh+VWcJoDfPbJSfS3PBNu/ZQaTkEvGo=;
 b=E7DtCHNC+KCy1CGrFRtjmSxfVEaMLaTz4ieSe3c7AkXiHGiBUiy4rioS
 d8bNao9bxiadSSG++JCbBcWnEAtEf09c3W0Dlwrp48ostzhYi9I/LOJdn
 9hMsnZsJwSG7J+F8ynMOB/sKKKnK5gYrqA/wZ6y9g/xIft40OWLF2BfpZ
 JxNcqbj1v21/UpA52kjSUy3EmENzEmlWijAlnYapDVZwUyUcTYw5GMdYx
 bzY6EkY6Su8KnsnMYh5RFQSNASMnYZq72KugRmDi7qbZ8efceRv1/LB/0
 nt8ZUR91uVVqYPoG5QtcYnbuFLmXDxtRoW4qcaB05IYI7itVq3AMTynSd A==;
Date: Mon, 15 Apr 2024 23:05:29 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <661e15292be3_4d561294d6@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <67893f352bc54de61160bfe251cba0bdf0431f37.1711405593.git.thomas.lendacky@amd.com>
 <1f6f4477-0f2a-434a-8c89-3b5d51d61581@linux.intel.com>
 <19d69960-e548-a2e6-87d9-c463f2851613@amd.com>
 <e286883d-40ef-d749-26a8-7ec6fbd81eae@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e286883d-40ef-d749-26a8-7ec6fbd81eae@amd.com>
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
To: Tom Lendacky <thomas.lendacky@amd.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>

Tom Lendacky wrote:
> On 4/12/24 10:52, Tom Lendacky wrote:
> > On 4/9/24 13:12, Kuppuswamy Sathyanarayanan wrote:
> >> On 3/25/24 3:26 PM, Tom Lendacky wrote:
> >>> Config-fs provides support to hide individual attribute entries. Using
> >>> this support, base the display of the SVSM related entries on the 
> >>> presence
> >>> of an SVSM.
> >>>
> >>> Cc: Joel Becker <jlbec@evilplan.org>
> >>> Cc: Christoph Hellwig <hch@lst.de>
> >>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> >>> ---
> >>>   arch/x86/coco/core.c        |  4 ++++
> >>>   drivers/virt/coco/tsm.c     | 14 ++++++++++----
> >>>   include/linux/cc_platform.h |  8 ++++++++
> >>>   3 files changed, 22 insertions(+), 4 deletions(-)
> >>>
> 
> >>
> >> Any comment about the following query? I think introducing a CC flag 
> >> for this use
> >> case is over kill.
> >>
> >> https://lore.kernel.org/lkml/6b90b223-46e0-4e6d-a17c-5caf72e3c949@linux.intel.com/
> > 
> > If you don't think TDX will be able to make use of the SVSM attribute I 
> > can look at adding a callback. But I was waiting to see if anyone else 
> > had comments, for or against, before re-doing it all.
> > 
> 
> What about something like this (applied on top of patch 13):
> 
> diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
> index efa0f648f754..d07be9d05cd0 100644
> --- a/arch/x86/coco/core.c
> +++ b/arch/x86/coco/core.c
> @@ -12,7 +12,6 @@
>   
>   #include <asm/coco.h>
>   #include <asm/processor.h>
> -#include <asm/sev.h>
>   
>   enum cc_vendor cc_vendor __ro_after_init = CC_VENDOR_NONE;
>   u64 cc_mask __ro_after_init;
> @@ -79,9 +78,6 @@ static bool noinstr amd_cc_platform_has(enum cc_attr attr)
>   	case CC_ATTR_GUEST_STATE_ENCRYPT:
>   		return sev_status & MSR_AMD64_SEV_ES_ENABLED;
>   
> -	case CC_ATTR_GUEST_SVSM_PRESENT:
> -		return snp_get_vmpl();
> -
>   	/*
>   	 * With SEV, the rep string I/O instructions need to be unrolled
>   	 * but SEV-ES supports them through the #VC handler.
> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
> index 0d2c9926a97c..68c881a50026 100644
> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> @@ -1036,6 +1036,17 @@ static int sev_report_new(struct tsm_report *report, void *data)
>   	return 0;
>   }
>   
> +static bool sev_tsm_visibility(enum tsm_type type)
> +{
> +	/* Check for SVSM-related attributes */
> +	switch (type) {
> +	case TSM_TYPE_SERVICE_PROVIDER:
> +		return snp_get_vmpl();
> +	default:
> +		return false;
> +	}
> +}
> +
>   static struct tsm_ops sev_tsm_ops = {
>   	.name = KBUILD_MODNAME,
>   	.report_new = sev_report_new,
> @@ -1126,7 +1137,8 @@ static int __init sev_guest_probe(struct platform_device *pdev)
>   	/* Set the privlevel_floor attribute based on the current VMPL */
>   	sev_tsm_ops.privlevel_floor = snp_get_vmpl();
>   
> -	ret = tsm_register(&sev_tsm_ops, snp_dev, &tsm_report_extra_type);
> +	ret = tsm_register(&sev_tsm_ops, snp_dev, &tsm_report_extra_type,
> +			   sev_tsm_visibility);

I would have expected this in tsm_ops, but yes I think a callback lets
this fixup the ugly "extra" attributes situation as well.
