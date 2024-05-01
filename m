Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 19DA81CA2C0
 for <svsm-devel@coconut-svsm.dev>; Wed,  1 May 2024 21:28:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714591729; x=1746127729;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JX3bPSixXAN8llzH0r2IlD5+51eukb5MqgYOKhIBmZA=;
 b=BhATFnFCp8UUrhKD8+MUGmb8ilhCBgIgkQpbI8iz5ERaOsCbyWf31VBC
 vc2mQwncDVJfIJ3sJ4ipOYYrQGsINK9SptM4EAT1aWfqz/QoKzWesqT+E
 91x3yeI3q8zbkPveoilKoJ33HMB7lTj8bFYZpNvqov2EWGKd9azL4ZTqP
 MDHubbTmU5csCjAjrypdXzq2aJSNMHzhz2Hwu3mV6nWb/X7HMUt/+92jZ
 wyKwIYpXxWOVY0EqyTMAUDAFLgTVon+232/0JOOrWpEjRHARyzcgcwQ3M
 weeW5UnW4c4Ga9hpO/izfhtSif825p5C9UsWbqpAxgT0ik7zF0bI4Z3ON g==;
Date: Wed, 1 May 2024 12:28:39 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <663297e7cbdee_1384629418@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <e3143c1f3d0b26fcd8884c6f75644b634a7138e8.1713974291.git.thomas.lendacky@amd.com>
 <662c239680842_b6e02944b@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <f6af3a35-7ddd-7f56-d7d9-34c77647614d@amd.com>
 <33620512-a456-aa87-25d3-e15f2d3d256f@amd.com>
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33620512-a456-aa87-25d3-e15f2d3d256f@amd.com>
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
To: Tom Lendacky <thomas.lendacky@amd.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>
Content-Type: text/plain; charset="utf-8"

Tom Lendacky wrote:
[..]
> >>> +static bool tsm_report_is_visible(struct config_item *item,
> >>> +                  struct configfs_attribute *attr, int n)
> >>
> >> Per the comment on where to find the is_visible() callbacks for a given
> >> item type, I expect the need to pass @item here goes away when this can
> >> assume that there is only one way to have is_visible() invoked for
> >> @attr, right?
> > 
> > Yes.
> 
> But as I look closer, there is only a single ops callback pair 
> (is_visible() and is_bin_visible()), so as long there is never another 
> group / subdir defined under the TSM report, this works. But if another 
> group is added, then the item parameter would likely be needed or the 
> ops callback would have to be updated to differentiate for the vendor 
> (SNP/TDX).

Makes sense, for the tsm_report_is_visible() signature. Especially as
this is proposed as a generic configfs facility. It has symmetry with
sysfs that passes an @kobj parent anchor, to sysfs is_visible()
callbacks.

However, I still think neither @item nor @attr need to be passed down
from tsm_report_is_visible() to the vendor backend. Those can be added
when/if another item type is added, which I do not see on the horizon.
