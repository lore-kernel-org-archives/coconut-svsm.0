Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 5AB281C790E
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 07:47:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713246480; x=1744782480;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tUTRSyxKYM7em+7cZ0j8poHb+i0bTHAKNPIBGGia9+o=;
 b=Yv7jje/iy/2XynsOD4nSPt4UFYy/7qH6S50xKn24chLqdXJfKtZH5Pke
 IkkSgyjXp7VAqgEDxKDSNAWFj1f+rB5Njpg8d+WSKkjERdDSonO3P8oSy
 zHHcovew7EMxwgjvYafl3qZjT84/imQXd3XT33t0stkOCDafQ8XXIuTjp
 EfGotwyRsye0qpyC+oSi0NemE5EFO9nRl0QbAQRG5Pgu+cQwke7hRK+8M
 QfXLBl+754oQnl5jKi/y1tNhHy9ErGHpaFrDe6ugpi/1iOErKfrN4HEcG
 j6iItLnBjir/cTAnZycW+X+jiFvG5TzNvMqxmAzgeziN/4MJDw7fGTilR g==;
Date: Mon, 15 Apr 2024 22:47:47 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <661e110326bd2_4d5612949a@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <67893f352bc54de61160bfe251cba0bdf0431f37.1711405593.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <67893f352bc54de61160bfe251cba0bdf0431f37.1711405593.git.thomas.lendacky@amd.com>
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
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>

Tom Lendacky wrote:
> Config-fs provides support to hide individual attribute entries. Using
> this support, base the display of the SVSM related entries on the presence
> of an SVSM.
> 
> Cc: Joel Becker <jlbec@evilplan.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/x86/coco/core.c        |  4 ++++
>  drivers/virt/coco/tsm.c     | 14 ++++++++++----
>  include/linux/cc_platform.h |  8 ++++++++
>  3 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
> index d07be9d05cd0..efa0f648f754 100644
> --- a/arch/x86/coco/core.c
> +++ b/arch/x86/coco/core.c
> @@ -12,6 +12,7 @@
>  
>  #include <asm/coco.h>
>  #include <asm/processor.h>
> +#include <asm/sev.h>
>  
>  enum cc_vendor cc_vendor __ro_after_init = CC_VENDOR_NONE;
>  u64 cc_mask __ro_after_init;
> @@ -78,6 +79,9 @@ static bool noinstr amd_cc_platform_has(enum cc_attr attr)
>  	case CC_ATTR_GUEST_STATE_ENCRYPT:
>  		return sev_status & MSR_AMD64_SEV_ES_ENABLED;
>  
> +	case CC_ATTR_GUEST_SVSM_PRESENT:
> +		return snp_get_vmpl();
> +
>  	/*
>  	 * With SEV, the rep string I/O instructions need to be unrolled
>  	 * but SEV-ES supports them through the #VC handler.
> diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
> index 46f230bf13ac..d30471874e87 100644
> --- a/drivers/virt/coco/tsm.c
> +++ b/drivers/virt/coco/tsm.c
> @@ -64,6 +64,12 @@ static struct tsm_report_state *to_state(struct tsm_report *report)
>  	return container_of(report, struct tsm_report_state, report);
>  }
>  
> +static bool provider_visibility(const struct config_item *item,
> +				const struct configfs_attribute *attr)
> +{
> +	return cc_platform_has(CC_ATTR_GUEST_SVSM_PRESENT);
> +}
> +
>  static int try_advance_write_generation(struct tsm_report *report)
>  {
>  	struct tsm_report_state *state = to_state(report);
> @@ -144,7 +150,7 @@ static ssize_t tsm_report_service_provider_store(struct config_item *cfg,
>  
>  	return len;
>  }
> -CONFIGFS_ATTR_WO(tsm_report_, service_provider);
> +CONFIGFS_ATTR_VISIBLE_WO(tsm_report_, service_provider, provider_visibility);
>  
>  static ssize_t tsm_report_service_guid_store(struct config_item *cfg,
>  					     const char *buf, size_t len)
> @@ -165,7 +171,7 @@ static ssize_t tsm_report_service_guid_store(struct config_item *cfg,
>  
>  	return len;
>  }
> -CONFIGFS_ATTR_WO(tsm_report_, service_guid);
> +CONFIGFS_ATTR_VISIBLE_WO(tsm_report_, service_guid, provider_visibility);
>  
>  static ssize_t tsm_report_service_manifest_version_store(struct config_item *cfg,
>  							 const char *buf, size_t len)
> @@ -186,7 +192,7 @@ static ssize_t tsm_report_service_manifest_version_store(struct config_item *cfg
>  
>  	return len;
>  }
> -CONFIGFS_ATTR_WO(tsm_report_, service_manifest_version);
> +CONFIGFS_ATTR_VISIBLE_WO(tsm_report_, service_manifest_version, provider_visibility);
>  
>  static ssize_t tsm_report_inblob_write(struct config_item *cfg,
>  				       const void *buf, size_t count)
> @@ -333,7 +339,7 @@ static ssize_t tsm_report_manifestblob_read(struct config_item *cfg, void *buf,
>  
>  	return tsm_report_read(report, buf, count, TSM_MANIFEST);
>  }
> -CONFIGFS_BIN_ATTR_RO(tsm_report_, manifestblob, NULL, TSM_OUTBLOB_MAX);
> +CONFIGFS_BIN_ATTR_VISIBLE_RO(tsm_report_, manifestblob, NULL, TSM_OUTBLOB_MAX, provider_visibility);

Yeah the same callback specified multiple times feels like something
that should only happen once at the group level.
