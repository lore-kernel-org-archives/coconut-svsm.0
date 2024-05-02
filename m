Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 2A31C1C0BFB
 for <svsm-devel@coconut-svsm.dev>; Thu,  2 May 2024 19:30:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714671005; x=1746207005;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mgfc6IXCSZTUf6HA+pe63+mOjVvJsQUoDTI5o4F5irc=;
 b=dUiVZQPLNVROCw92T7U8UVwFfuHYOtocL0u/rdgfCRjg8lbng6CX+VOb
 yxn4xxmol5Sq+XHRV1bM61SsNDtGUXJ2H3SatWoJiWXr2+R2O6cfNQh/q
 OoL/16CJ3jRnPrWKkMFtttYZWa2pvmjC/Ve/QYUjlS++Cwa1FsWwi+lW6
 2aJxtWNUzNQjpd+IomrKO+euoBi6a+IWg35WdP8+7vH9J0fvaYDBWq1ys
 +1byx3Io7bXy1LlTre5eSd6VCs4R9rhayf/ktGha291QIrzpQsnFIxr6Y
 qU896oZryX8poa1l7B48QNZI6ChwbUpj91r85oZp2IgT9nnVT1JyX6ekA w==;
Date: Thu, 2 May 2024 10:29:55 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <6633cd93cd0bc_138462942@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <e3143c1f3d0b26fcd8884c6f75644b634a7138e8.1713974291.git.thomas.lendacky@amd.com>
 <CAC41dw-g2=jKkevGOJUqnzYTpxQ8+Z_JxnNNuoLR+CM_yqfRzA@mail.gmail.com>
 <6632a2e0738d_1384629442@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <CAC41dw_Dnm=suyue+jFx2z8f+YT1K_aWfQEijrU=WH4OLWpOqQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAC41dw_Dnm=suyue+jFx2z8f+YT1K_aWfQEijrU=WH4OLWpOqQ@mail.gmail.com>
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
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

Kuppuswamy Sathyanarayanan wrote:
[..]
> Got it. Makes sense. It is simpler to do it this way. I am just
> worried that the vendor driver might mistakenly disable some core
> attributes like inblob, outblob, provider and generation.

Then it gets to keep the pieces it broke.
