Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id EBFE31C869C
 for <svsm-devel@coconut-svsm.dev>; Fri, 26 Apr 2024 22:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714164733; x=1745700733;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c2/txzVhLs/QOBH2Ayuyjp0Gxiw6HeQIjU/BK6a4xtM=;
 b=Z3r8YiaVQkfw8HbTjHU9aSRMvKkk/jzvqi//TTRTLvwRY/bWWLPP2SWA
 cR0PC7HZBj15+OGsfV7uAaJ8cgYktrvmYyO+NDa76t05uEMZ5cYpJE7f+
 Xp4k0U3XG2SSD3X/BVVhXvNOZPI+GnnYVhJDw4KXLoMclxYuzrfa70zcZ
 4+yA+5g1iRIoDentXcpTcR/rOpyvIZfvyTpLIzlvM+wyVLe+6qXIc7ruF
 M23/41ESMr977tjja9H7Ad+w9I54P/i/RV75y2QFBjAKDY+zpSZ+oH0xr
 JcxOKe/MdZxXoERbWf9X+vUiHY/D7UOqUDJQ9ko/fcNnRGKmsZxGcWUU0 w==;
Date: Fri, 26 Apr 2024 13:51:45 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <662c13e1bb59d_b6e029460@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <731690ebf2434c553a08bb06e5bc6cd8fe48a4bc.1713974291.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <731690ebf2434c553a08bb06e5bc6cd8fe48a4bc.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 11/15] configfs-tsm: Allow the
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
> VMPL. Any request for an attestation report at a higher privilege VMPL
> than what Linux is currently running will result in an error. Allow for
> the privlevel_floor attribute to be updated dynamically so that the
> attribute may be set dynamically. Set the privlevel_floor attribute to
> be the value of the vmpck_id being used.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

This addresses my comment on the last version.

Acked-by: Dan Williams <dan.j.williams@intel.com>
