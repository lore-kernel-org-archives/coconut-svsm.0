Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 7696B1C78A6
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 06:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713243298; x=1744779298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x5klNPA8BU9PwtfUNxjByF+KaIvJnCHlkr6Njz0E0Zg=;
 b=Br8sPjI4EeRDzcK0/7pzSaCH67jtUDXpJ6GKRLp0dQvaKm5TFEKW18nH
 NJeEaGJiqI+aOes7dcYtKgyGlyp9o1s/UYE2kreo4l7MQMGCkI4vKNm2H
 UwM8amK8aS0Q7sShr5sw3Er+T6wE0AFy96Au+F+rFq3EQy85faVNmXTrZ
 lo7pqE3iiaZfiH6FQ3/ETxMein8yadBVomFhgDP+kGr8kDxmaUW5o0dg1
 Bdcr3VaufXhlHakKBWdlX3HFSg0Xxls3nEI5beuSzqwSTO5gB/RAm9K6f
 T7loQ1Px+J1mRkMgWUNv7efdsibVTavH9LXBEkbknyJsoC4IhZ+Ds0iK0 Q==;
Date: Mon, 15 Apr 2024 21:54:46 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <661e04966c622_4d5612946d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <9615e6055e5b262a22bf312608647223517595b5.1711405593.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9615e6055e5b262a22bf312608647223517595b5.1711405593.git.thomas.lendacky@amd.com>
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
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

Hey, Tom, came looking to review the tsm_report changes and noticed
this...

Tom Lendacky wrote:
> Currently, the sev-guest driver uses the vmpck-0 key by default. When an
> SVSM is present the kernel is running at a VMPL other than 0 and the
> vmpck-0 key is no longer available. So choose the vmpck key based on the
> active VMPL level.

The module parameter is not mentioned in the changelog. Is it not
sufficient to always use snp_get_vmpl(), and if not should there be some
documentation about when to specify vmpck_id?

Do users know that "vmpl" and "vmpck_id" are interchangeable?
