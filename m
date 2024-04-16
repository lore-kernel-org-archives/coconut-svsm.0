Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 987F41C7F97
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 17:58:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713283091; x=1744819091;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p9TgbAlhq0QodmjAnHh32o48RWj41XUd95FJn0nxmMQ=;
 b=Ld2dJc2lsYbnvm4rnTZ9pyZPTVJFX0bwm/H4Tmyv4iINb1YIaKY/qdcR
 ZEW6DjI5p1Hbre1U5faNhRgO1BTDqhbTeobWPlK8DjUg3E+3j3mRRTV1P
 ni4ydu3eg3K1AQh3z6mg+Vib6A52iEjzfQitaYZKeUoILGZcWEEfSvhbs
 2227Ii7zSbjMtMySFq4gPy75CjoKJgt1pU2O+Jj6cHtNtniooFxJkbS2g
 Gxcvq4IP3eQ5IlwgG22ZiBnvdjSw/3qTXcAF5yXQkFL0qAjCpJjvZZEqu
 9aZNHVFMwFJVcIjHQv8JIioVE9ns5kt9WOnUL7J1+B5ZV416XXDJ1FECB g==;
Date: Tue, 16 Apr 2024 08:57:59 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <661ea007d1844_4d5612948c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <bb088b1409283cd323515138feda224759a247ec.1711405593.git.thomas.lendacky@amd.com>
 <661e04cd345af_4d56129468@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <061802e1-7c95-f1f0-b462-3aca27583d76@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <061802e1-7c95-f1f0-b462-3aca27583d76@amd.com>
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
To: Tom Lendacky <thomas.lendacky@amd.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

Tom Lendacky wrote:
> On 4/15/24 23:55, Dan Williams wrote:
> > Tom Lendacky wrote:
> >> With the introduction of an SVSM, Linux will be running at a non-zero
> >> VMPL. Any request for an attestation report at a higher priviledge VMPL
> >> than what Linux is currently running will result in an error. Allow for
> >> the privlevel_floor attribute to be updated dynamically so that the
> >> attribute may be set dynamically.
> >>
> >> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> >> ---
> >>   drivers/virt/coco/sev-guest/sev-guest.c | 5 ++++-
> >>   include/linux/tsm.h                     | 2 +-
> >>   2 files changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
> >> index 1ff897913bf4..bba6531cb606 100644
> >> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> >> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> >> @@ -885,7 +885,7 @@ static int sev_report_new(struct tsm_report *report, void *data)
> >>   	return 0;
> >>   }
> >>   
> >> -static const struct tsm_ops sev_tsm_ops = {
> >> +static struct tsm_ops sev_tsm_ops = {
> >>   	.name = KBUILD_MODNAME,
> >>   	.report_new = sev_report_new,
> >>   };
> >> @@ -972,6 +972,9 @@ static int __init sev_guest_probe(struct platform_device *pdev)
> >>   	snp_dev->input.resp_gpa = __pa(snp_dev->response);
> >>   	snp_dev->input.data_gpa = __pa(snp_dev->certs_data);
> >>   
> >> +	/* Set the privlevel_floor attribute based on the current VMPL */
> >> +	sev_tsm_ops.privlevel_floor = snp_get_vmpl();
> > 
> > Why is this not vmpck_id?
> 
> Good catch, this probably should be pulled out separately and submitted 
> as a Fixes: against the current support. If you think it's important 
> enough, I can do that and put this at the beginning of the series. Or I 
> can just modify this to use the vmpck_id value. Any preference?

I dunno, you tell me. What breaks if privlevel_floor is mismatched vs
vmpl and/or vmpck_id? If it warrants a "Fixes:" it should probably be
broken out.

However, I *guess* it is just adding some sanity checking precision to
userspace requests and makes some input validation not catch errors when
userspace tries to generate reports from the wrong level, right? I.e.
privlevel_floor may be lower than expected, but userspace should not be
depending on that since the report generation will fail.
