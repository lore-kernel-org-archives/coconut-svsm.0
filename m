Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BFD411C7754
 for <svsm-devel@coconut-svsm.dev>; Fri, 31 May 2024 14:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1717159728; bh=TY6VcibxdweZqQIFn+missxQLP+1JlXnv47ORNzMTiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O8jCgTB3M9+aX8bNkwCg0eDZjy3e61S9TpWBS4rXqtIFK5tHcEisjKoDJkMKniRTt
 J5tKGvpDW9cyPvfbHuYGCB/5StUYCosPiPP+kLK5WSKrTW/suSamhrl2y93/yZfiCZ
 urjJFBvdZ9C3QiOaNz+wKLSBOj4eppaBXXQanyV/fBDqkNWcu0Qy1swCjsPJaW/diT
 z3nbzVfAM27LJKIVeiaSLd76N29aLGFcIl4dIEW9ht8BKSiD49R6BUsKylLg+kLZ/H
 3INm01Y4fKvSs0+JWhhtEwXWiBZHTMOIaY5OIhkL5L4qDDkaX3+JY6PRqr0jW+VLTT
 sJLJrNwZuWhPiRTpBLWeS7yHtH03dutxd+uhRAJEGpndy/xNlJlC8iClHA2LiT6POJ
 NHJVDxGq6BfZgf5NiCwMbMlQqsWxahJmAKe8IT1rQzMHo8N93slh21gHEEgc7kBuW1
 DplDRryDV73XWsPJZ1TV5h6iOyU9oS2XE1Xq14OrGMGruFX8YEbhB5Mteb/uqkrtyR
 y8DZCL6zFAMFHdKl+LWPQoOs2/mvrEHhEUDed9TvVvx65XRcIi3FK5dfnXVf+iSfv4
 ELhhHEYR2X7Ocm0u2G/zjbHViL+d7zas/uklR4VmP604uKOmr4V+LnCdp3Gpk6lDjX
 3S8VCws3pa+z7iLCS6KlQZQ0=
Date: Fri, 31 May 2024 14:48:29 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240531124829.GDZlnHHZnj-oByMTIK@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <0b460ba621d39fda47694332f09301b440619efc.1713974291.git.thomas.lendacky@amd.com>
 <20240527131022.GAZlSGPm_s0FAu_BRB@fat_crate.local>
 <ab9e93f0-132e-b7cc-48e0-f83463003e21@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab9e93f0-132e-b7cc-48e0-f83463003e21@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 08/15] x86/sev: Provide SVSM discovery
 support
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On Tue, May 28, 2024 at 03:57:10PM -0500, Tom Lendacky wrote:
> The alternative method is really meant for things like UEFI runtime services
> (which uses the kernels #VC handler), not the kernel directly.
> 
> Some of those checks have to be made very early, I'll see if it is feasible
> to rely on the CPUID check / cpu_feature_enabled() support.

Put that in the commit message.

> We can separate out SVSM vs VMPL, but if the kernel isn't running at VMPL0
> then it requires that an SVSM be present.

Ok, I guess the two things are identical.

> I'll incorporate this, but probably won't change the way exit_info_1 is
> assigned.

Oh, but we love our '!!' construct:

git grep -E '\s!![^!]' *.[ch] | wc -l
7776

At least so many, my pattern is not precise.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
