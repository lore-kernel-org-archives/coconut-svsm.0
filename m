Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 4644F281F40
 for <svsm-devel@coconut-svsm.dev>; Tue,  9 Apr 2024 19:09:41 +0200 (CEST)
Date: Tue, 9 Apr 2024 19:09:17 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240409170917.GCZhV2PWPhmzTHhMRO@fat_crate.local>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <425afa6512994b1ca1bb366eb7abfb24d65175aa.1711405593.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <425afa6512994b1ca1bb366eb7abfb24d65175aa.1711405593.git.thomas.lendacky@amd.com>
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

On Mon, Mar 25, 2024 at 05:26:20PM -0500, Tom Lendacky wrote:
> The snp_init() in boot/compressed/sev.c is local to that file and is not
> called from outside of the file. Change the name so that it is not tied
> to the function definition in arch/x86/include/asm/sev.h.

That part I don't understand: I can rename the function without making
it static and it builds fine, so where is it "tied" to the function
definition in kernel proper?

Don't get me wrong - leaking kernel proper symbols into the decompressor
has been a pet peeve of mine for a while now but this is not the case
here, is it?

And yes, the patch is fine - I'm just asking...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
