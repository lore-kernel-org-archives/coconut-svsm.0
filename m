Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 7500D1C889B
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Apr 2024 13:47:29 +0200 (CEST)
Date: Wed, 17 Apr 2024 13:46:58 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240417114658.GHZh-2sk47TZgCp4Mb@fat_crate.local>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <1b0d8ec8e671ad957a2ad888725ce24edeedf74a.1711405593.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1b0d8ec8e671ad957a2ad888725ce24edeedf74a.1711405593.git.thomas.lendacky@amd.com>
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

On Mon, Mar 25, 2024 at 05:26:21PM -0500, Tom Lendacky wrote:
> -static void enforce_vmpl0(void)
> +static bool running_at_vmpl0(void *va)

Not too crazy about it: you're turning it into a function which runs in
boolean context but takes a void *?!

And the boolean result is only a side-effect or what it does to the
argument - modify its permissions. Which is weird and not really
obvious.

I'd prefer it if you made it into

static void vmpl0_modify_permissions(void *va)

which basically says, modify the permissions of @va in vmpl0, which is
a lot closer to what the function does.

And then do

#define running_at_vmpl0(va)	vmpl0_modify_permissions((va))

because then through the indirection is at least clear how that "am
I running at VMPL0?" check is being done.

And later, if we need other VMPLs, we can extend
vmpl0_modify_permissions() and even do a more generic

vmpl_modify_permissions(unsigned int vmpl_level, void *va)

and so on and kill the silly macro.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
