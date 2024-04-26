Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BEE8C1C8398
 for <svsm-devel@coconut-svsm.dev>; Fri, 26 Apr 2024 23:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714168734; x=1745704734;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GmmfsK5O/zlp7INMUA7Ywz9NUb5G3rW31M5aUneI1C8=;
 b=ZTjA80vaOtVt+jF1es4ed2KT56JU0LTxZzUnqm8eLgJPDan7RlMvKiC8
 P1b+Ajsn7YJODNyRwZ2xkwOdnwRh47VducQDJk2P/TfMeGqbMoWh7Sxz7
 cc5dOog88OLeXphLZE7NaOzKpsT2PWnmqwSe+ZB6R4hEpittCMwfLOSaE
 nUF0jn+cZnJMkw7lEZatU/gTHvQ+1B8s8dE0ZhiXkWj811znilPE15DwA
 WlS8rJDWnhgG5roQGSkzZ3ldqiQKr25OLsYB+hGVUDNpBEwwBmfheh1yq
 YeP7ywmdyY1dwLmTdp8U/i8VF/kqtO+yc1c+htMhy8lQn0H+2860uCUoU g==;
Date: Fri, 26 Apr 2024 14:58:46 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <662c239680842_b6e02944b@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <e3143c1f3d0b26fcd8884c6f75644b634a7138e8.1713974291.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e3143c1f3d0b26fcd8884c6f75644b634a7138e8.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 13/15] x86/sev: Take advantage of
 configfs visibility support in TSM
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
> The TSM attestation report support provides multiple configfs attribute
> types (both for standard and binary attributes) to allow for additional
> attributes to be displayed for SNP as compared to TDX. With the ability
> to hide attributes via configfs, consoldate the multiple attribute groups
> into a single standard attribute group and a single binary attribute
> group. Modify the TDX support to hide the attributes that were previously
> "hidden" as a result of registering the selective attribute groups.
> 
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  drivers/virt/coco/sev-guest/sev-guest.c |  3 +-
>  drivers/virt/coco/tdx-guest/tdx-guest.c | 29 ++++++++-
>  drivers/virt/coco/tsm.c                 | 82 ++++++++++++-------------
>  include/linux/tsm.h                     | 41 ++++++++++---
>  4 files changed, 102 insertions(+), 53 deletions(-)
[..]
> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
> index 1253bf76b570..964af57f345c 100644
> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
[..]
> @@ -249,6 +250,30 @@ static int tdx_report_new(struct tsm_report *report, void *data)
>  	return ret;
>  }
>  
> +static bool tdx_report_attr_visible(struct config_item *item,
> +				    struct configfs_attribute *attr, int n)
> +{
> +	switch (n) {
> +	case TSM_REPORT_GENERATION:
> +	case TSM_REPORT_PROVIDER:
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool tdx_report_bin_attr_visible(struct config_item *item,
> +					struct configfs_bin_attribute *attr, int n)
> +{
> +	switch (n) {
> +	case TSM_REPORT_INBLOB:
> +	case TSM_REPORT_OUTBLOB:
> +		return true;
> +	}
> +
> +	return false;
> +}

Why do these callbacks need @item and @attr?

[..]
> +static bool tsm_report_is_visible(struct config_item *item,
> +				  struct configfs_attribute *attr, int n)

Per the comment on where to find the is_visible() callbacks for a given
item type, I expect the need to pass @item here goes away when this can
assume that there is only one way to have is_visible() invoked for
@attr, right?

Other than that, this conversion looks good to me.
