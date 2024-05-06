Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A83A61C28FB
 for <svsm-devel@coconut-svsm.dev>; Mon,  6 May 2024 12:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1714990164; bh=yDr1d+Rpi28/rr/NTeMKaEESBQG5/hCp8YbpHq/FNGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fxhWNI7xGUuq0TG29EfWKa5XsWgrwrDf2hRgnywI43wzMluTYjWUhLK5ZxvxRioSg
 n7H3ltxQAeorYssA1r1X2pSBy+frVvUUNI1WbivXZTbsHSotS/Coyw1yQBJzPzQ81K
 PIceAxUp03s4B31aKNKOS1h4sZWFk4O/rr4CXtFetht3Uz1FzNlSaFgOvAY66S7sIf
 glW3SIh/ArL5JI0cksjKl10wv/tO8Ex5uk5ALqRXdSXxymFykLCo2+cWcY6qkomyDg
 aSxI/jHkB+R31dXBir8T4sZfAupVHAMk5P6hcZiiDsJurW00ReYO6aFWx0LIdHFGHf
 pOtp86zOzXxbrn1VUeglMRPAw3zwufJi7nxNmozsO87CzLcgsz7OpugYjUYcWu3HgV
 acKjH5VcCci/ltJLmIe20OIY3Z4HmHRcW8QbLuDIcYNqvSbbn6U+/z3SCc7yzRecqf
 UslWq7pgPFWzqVfYbkjxuBqVIkCcOAZZz2ZqB6/1G19g3o/copT54byFAmjy4rr3QX
 DhVNKV2AjqMoEkWelMJxSuf3o6sLo6BTcCZjDkar05YAcGYgldbdvjirC3NbDrRHU0
 olZtmUhC/f89T1ARPEPyCPf8b29nnqeZ/Kya3rAuUkcX2kVPmajVL72haNoSGRVZel
 xemUn1/hlC8sVdWKVXj2xYC4=
Date: Mon, 6 May 2024 12:09:05 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240506100905.GFZjisQTQwbkv2eKsh@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <07266b47e749267ef9a9ccbc9e8e9df78ed54857.1713974291.git.thomas.lendacky@amd.com>
 <20240503103407.GSZjS9n-XMMKi5ZOek@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503103407.GSZjS9n-XMMKi5ZOek@fat_crate.local>
Subject: Re: [svsm-devel] [PATCH v4 05/15] x86/sev: Use kernel provided SVSM
 Calling Areas
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

Ok,

I think this is very readable and clear what's going on:

static __always_inline void issue_svsm_call(struct svsm_call *call, u8 *pending)
{
        register unsigned long rax asm("rax") = call->rax;
        register unsigned long rcx asm("rcx") = call->rcx;
        register unsigned long rdx asm("rdx") = call->rdx;
        register unsigned long r8  asm("r8")  = call->r8;
        register unsigned long r9  asm("r9")  = call->r9;

        call->caa->call_pending = 1;

        asm volatile("rep; vmmcall\n\t"
                     : "+r" (rax), "+r" (rcx), "+r" (rdx), "+r" (r8), "+r" (r9));

        xchg(pending, 1);

        call->rax_out = rax;
        call->rcx_out = rcx;
        call->rdx_out = rdx;
        call->r8_out = r8;
        call->r9_out = r9;
}

and the asm looks ok but the devil's in the detail.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
