Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 596C81C2BCD
 for <svsm-devel@coconut-svsm.dev>; Fri, 31 May 2024 14:30:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1717158619; bh=Cp7gWFWCgunxt2EZJJB/aMuJ7vmygLLqyPm4seO3fyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SMApdGDKJuXYKkzBsXvwplsjbBQp5vqi+c5SXxkmQngoAniCZWwd+D8iDQqxgQXAq
 9aIylFmNIC2SiiDYnmCouKbPaNfEIcXMoILkbr70GUv16+ylobyh2c832VEhU6uUvK
 3UrxUutyaYyOU0uMnM06iX0V9wfxNLY2ZrFxfNc5IKxoRlV2CukGQ7eMjX3zkxTTv6
 6CptbotB/rPBL/D1tn7nwnWvqv14u1ke7ld8OTKUJ64iDVVeM0/jgadH9AaMFCv6mH
 sXlu7OcCjKqOZaYJdLeMGlXEZMTAn6E8yqbeNosVT3qL1RocRBTA1uXTxSfLfimK2Z
 qVf20E6SmUCF9rvTjWdhdXMumbv5LmoIPqXFNfZfwavzsrFB4Zrvb+QkPJun87P8/W
 7fHkb9g+ehc6LED69c92QsZed8qHvOuMrlYvptYKteNzFhNhrssmXihrxp63rdVVZ5
 VyjQ+wiYsqWQMH1T5o0MlQCXHzxejAua71GG9eh+LtM9GJGjHynoSFV7QbLfDequXq
 qnbKRMXMswlVjY/GpL+0/xbCssqOmNuFYtSP5+i/p8G0vUZsqcSrqYFh23d5v7vNlN
 NLVcMASThnwqJxikvCi5OOmsM2y5PvBeVvd8ndXCkSC4UYJiPzJIRnzpoSntafxkmA
 vLHMB5HIbule/nrq7PtTEjdE=
Date: Fri, 31 May 2024 14:29:59 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240531122959.GCZlnCx8uxvozjmfly@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <aa7f311d90efb49dfa6f4589854ee43c049b7b88.1713974291.git.thomas.lendacky@amd.com>
 <20240527123304.GBZlR9gBzBIjqEKKo6@fat_crate.local>
 <4f704d19-088a-89d7-0515-144db61b93a5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f704d19-088a-89d7-0515-144db61b93a5@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 07/15] x86/sev: Use the SVSM to create a
 vCPU when not in VMPL0
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

On Tue, May 28, 2024 at 03:28:28PM -0500, Tom Lendacky wrote:
> I just think it's easier to follow, with specific functions for the
> situation and less indentation. But if you want, I can put it all in one
> function.

Well, if the function were huge and hard to read sure, but right now it
is simple and with single indentation level. There's the other side of
having too many small helpers, leading into not seeing the flow. The
logic we should follow is: if the function is big and fat and has too
many indentation levels, you split into smaller functions.

The "Functions" section in Documentation/process/coding-style.rst has
some blurb on the matter.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
