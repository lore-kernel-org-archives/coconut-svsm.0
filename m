Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E74951C0B90
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Apr 2024 22:51:15 +0200 (CEST)
Date: Wed, 17 Apr 2024 22:50:48 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240417205048.GHZiA2KGbFFTQFyTAM@fat_crate.local>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <1b0d8ec8e671ad957a2ad888725ce24edeedf74a.1711405593.git.thomas.lendacky@amd.com>
 <20240417114658.GHZh-2sk47TZgCp4Mb@fat_crate.local>
 <505dcf34-93ff-643c-b149-8ef9ce90c023@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <505dcf34-93ff-643c-b149-8ef9ce90c023@amd.com>
Subject: Re: [svsm-devel] [PATCH v3 02/14] x86/sev: Make the VMPL0 checking
 function more generic
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

On Wed, Apr 17, 2024 at 03:35:53PM -0500, Tom Lendacky wrote:
> Well, it doesn't really modify any permissions that matter. It tries to
> change the permission of a lesser privileged VMPL level.

Potato potato. :-P

> Since the kernel only runs at a single VMPL it would never be
> effected. The operation performed here is to update VMPL1 permission
> levels (which can only be done successfully at VMPL0) and return the
> result of the operation.  A success implies running at VMPL0 and
> failure implies not running at VMPL0.

Yap.

The point is, it is calling RMPADJUST. And it does modify RMP
permissions of a guest page.

Thus, if you prefer, you can go all out and call the helper

	rmp_adjust_permissions(unsigned int tgt_vmpl, void *pa)

and make it generic from the get-go.

And then have the macro wrap around it in order to explain that
particular use with the macro name.

If it is still not clear what I mean, lemme know and I'll do a diff
ontop.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
