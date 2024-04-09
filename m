Return-Path: <sathyanarayanan.kuppuswamy@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 775FE281F1C
 for <svsm-devel@coconut-svsm.dev>; Tue,  9 Apr 2024 20:13:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712686388; x=1744222388;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mt4LK8wRky83QmRbMyyw2lMJig0xnioKZPacc3nZi+E=;
 b=CRuLux5kFHC9Ef2wLfAtMHwPsinGzMupJgME/JIiiZ0uw7svpeFZJ+LT
 VRYLupsU3AUR9a+G1eZ92OlXfsqiS/r4hRCk7Ir05Q2cezByDP4GWvH3U
 AwOEf0zxLnbNv91tbW0Mpgo2m66jCw6mnfQlSdWOp8fz31gLSqzaqxmTl
 AilE/MNPNnuXfBz02lvr/Lsj9d0bLRBHg4hfmOnn7V4HjoepCguYb6jeU
 imTYCCV1AH7rZgG0h89IUmh0Fy0GdJbKd9UbxqkO0juehqfvEBqOHTo72
 2BeHI5aH1AEm9cLS53vXUKFNf/ZAH2AHlTn0uC6oVU50u/4arxWUFv6MN g==;
Message-ID: <1f6f4477-0f2a-434a-8c89-3b5d51d61581@linux.intel.com>
Date: Tue, 9 Apr 2024 11:12:52 -0700
MIME-Version: 1.0
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <67893f352bc54de61160bfe251cba0bdf0431f37.1711405593.git.thomas.lendacky@amd.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <67893f352bc54de61160bfe251cba0bdf0431f37.1711405593.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>


On 3/25/24 3:26 PM, Tom Lendacky wrote:
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

Any comment about the following query? I think introducing a CC flag for this use
case is over kill.

https://lore.kernel.org/lkml/6b90b223-46e0-4e6d-a17c-5caf72e3c949@linux.intel.com/

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
>  
>  #define TSM_DEFAULT_ATTRS() \
>  	&tsm_report_attr_generation, \
> diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
> index cb0d6cd1c12f..f1b4266c1484 100644
> --- a/include/linux/cc_platform.h
> +++ b/include/linux/cc_platform.h
> @@ -90,6 +90,14 @@ enum cc_attr {
>  	 * Examples include TDX Guest.
>  	 */
>  	CC_ATTR_HOTPLUG_DISABLED,
> +
> +	/**
> +	 * @CC_ATTR_GUEST_SVSM_PRESENT: Guest is running under an SVSM
> +	 *
> +	 * The platform/OS is running as a guest/virtual machine and is
> +	 * running under a Secure VM Service Module (SVSM).
> +	 */
> +	CC_ATTR_GUEST_SVSM_PRESENT,
>  };
>  
>  #ifdef CONFIG_ARCH_HAS_CC_PLATFORM

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

