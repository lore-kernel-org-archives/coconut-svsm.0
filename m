Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 57FE31C7F96
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 17:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713282484; x=1744818484;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+u6ByJjY6qvYOBxSH0V/mBazyTGzrAIM8soMZte7ZM4=;
 b=heQxe8MfrZ+pcK7IArfWsQNMw3qUy+yHpIBhMxj/FhnInclodgYZbg26
 gnciNAjgEIA9r6VT580g6FwVDxnRymW6Y1YRftRdbJ1yalM2ph18bQZrJ
 5kGrN5csy5cawLiOvWht5FcF/52LweEwWQGVnxsxE4e+gks9elHE0UcTc
 OWsXxam+BJUvPKT5q1LpXx9xtUsxtgwFcH2s2x2cELmEwEqqJt6JxBA1t
 UzrlHX5l+IqVCSDdgd54TTvbFQ1E9oOrWxb7g7Cd+UPKKtgOOuLEZBHxA
 dVobAJMAOkG1phVV/AZKv6C9aUK+fXmRqXAivSdTAgD3PmWRgHkOqz8UY w==;
Date: Tue, 16 Apr 2024 08:47:54 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <661e9daa4b37c_4d56129418@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <9615e6055e5b262a22bf312608647223517595b5.1711405593.git.thomas.lendacky@amd.com>
 <661e04966c622_4d5612946d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <8a1b16c0-9897-bd10-b6f7-b428292c8c9f@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8a1b16c0-9897-bd10-b6f7-b428292c8c9f@amd.com>
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 09/14] virt: sev-guest: Choose the VMPCK
 key based on executing VMPL
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
> On 4/15/24 23:54, Dan Williams wrote:
> > Hey, Tom, came looking to review the tsm_report changes and noticed
> > this...
> > 
> > Tom Lendacky wrote:
> >> Currently, the sev-guest driver uses the vmpck-0 key by default. When an
> >> SVSM is present the kernel is running at a VMPL other than 0 and the
> >> vmpck-0 key is no longer available. So choose the vmpck key based on the
> >> active VMPL level.
> > 
> > The module parameter is not mentioned in the changelog. Is it not
> > sufficient to always use snp_get_vmpl(), and if not should there be some
> > documentation about when to specify vmpck_id?
> 
> It is possible to encounter an issue that causes the vmpck key to be 
> cleared. In that situation, the guest is allowed to use a vmpck key 
> associated with a lower VMPL. For that reason, the module parameter was 
> added to the driver when it was initially created.

Oh, sorry, misread that the module parameter was not new.

> I can update the changelog to mention this.

I guess it is too late now, but a proper sysfs attribute rather than a
module parameter would let you do sanity checking on the writes and
allow a natural place to document behavior in
Documentation/ABI/testing/sysfs-devices-sev-guest.
