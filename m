Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A46CE2814AD
 for <svsm-devel@coconut-svsm.dev>; Tue,  9 Apr 2024 19:58:08 +0200 (CEST)
Date: Tue, 9 Apr 2024 19:57:42 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240409175742.GEZhWBljxrJ8yGC3wE@fat_crate.local>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <425afa6512994b1ca1bb366eb7abfb24d65175aa.1711405593.git.thomas.lendacky@amd.com>
 <20240409170917.GCZhV2PWPhmzTHhMRO@fat_crate.local>
 <ac044150-ffb1-09b5-1f36-fdd6e259ba59@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac044150-ffb1-09b5-1f36-fdd6e259ba59@amd.com>
Subject: Re: [svsm-devel] [PATCH v3 01/14] x86/sev: Rename snp_init() in the
 boot/compressed/sev.c file
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

On Tue, Apr 09, 2024 at 12:44:13PM -0500, Tom Lendacky wrote:
> When it's not static and has the name snp_init(), then it has to match the
> definition in arch/x86/include/asm/sev.h, which is really intended for the
> snp_init() in arch/x86/kernel/sev.c when called from
> arch/x86/mm/mem_encrypt_identity.c.
> 
> So, yes, changing the name would be enough except then it remains not a
> static and you can get a compiler warning about not having a prototype for
> it if the -Wmissing-prototypes option is ever applied to that file (I don't
> believe it is today because it is in the decompressor code, but that can
> change). And since nothing calls the snp_init() in
> arch/x86/boot/compressed/sev.c from outside of that file, making it static
> was appropriate.

Yes, then please remove all that text about what could potentially
happen from the commit message so that it is not confusing as to what
the situation *currently* is.

The two functions are independent right now. It is enough to say that
you want to differentiate which one is called when, in order to avoid
confusion.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
