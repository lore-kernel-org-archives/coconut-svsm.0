Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id F221D1C78AC
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 06:55:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713243349; x=1744779349;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xZBHvCmHDKbDDxNz7HBBQdfpRVfsNbBX9Uij9qkv5xw=;
 b=Gqx91kWjvn3S5j7aBS1MFE7UEYVgPZrQg54tR9myedcDetFLds02iPvq
 +GmIw7D6FfqKmPcMhnn+ANmsvwMJsB9edChvym9EsFp7/cYgZItMFCWy9
 bW+3iwza9R7Igt9BUUJ4KEkxxma7UC0ROo0x4YwL/CrBg1w0kep8tE1FF
 5VzA76K621nzXoyXvS2q/yinNKny4eRTqTq5gF35NxWulUYgz7RpSQYVA
 FigWxm3H23zSP2tB/hzXZrkiaq8gI0BJsVCogiTg3Q2REOL0qz42ggSCU
 RbBOKSTaLMTuMPyQ7kDNiyQVzYmtLusejGYbYrrqPSj/TdB5vm1QlFudH w==;
Date: Mon, 15 Apr 2024 21:55:41 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <661e04cd345af_4d56129468@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <bb088b1409283cd323515138feda224759a247ec.1711405593.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bb088b1409283cd323515138feda224759a247ec.1711405593.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 10/14] configfs-tsm: Allow the
 privlevel_floor attribute to be updated
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
> With the introduction of an SVSM, Linux will be running at a non-zero
> VMPL. Any request for an attestation report at a higher priviledge VMPL
> than what Linux is currently running will result in an error. Allow for
> the privlevel_floor attribute to be updated dynamically so that the
> attribute may be set dynamically.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  drivers/virt/coco/sev-guest/sev-guest.c | 5 ++++-
>  include/linux/tsm.h                     | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
> index 1ff897913bf4..bba6531cb606 100644
> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> @@ -885,7 +885,7 @@ static int sev_report_new(struct tsm_report *report, void *data)
>  	return 0;
>  }
>  
> -static const struct tsm_ops sev_tsm_ops = {
> +static struct tsm_ops sev_tsm_ops = {
>  	.name = KBUILD_MODNAME,
>  	.report_new = sev_report_new,
>  };
> @@ -972,6 +972,9 @@ static int __init sev_guest_probe(struct platform_device *pdev)
>  	snp_dev->input.resp_gpa = __pa(snp_dev->response);
>  	snp_dev->input.data_gpa = __pa(snp_dev->certs_data);
>  
> +	/* Set the privlevel_floor attribute based on the current VMPL */
> +	sev_tsm_ops.privlevel_floor = snp_get_vmpl();

Why is this not vmpck_id?
