Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E595D1C928A
 for <svsm-devel@coconut-svsm.dev>; Tue, 23 Apr 2024 00:07:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1713823673; bh=PuUcTHftX7jcB4ldOFBM0GlZ/jOLTbRSz5LFuMJcDks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ihzRIa3EAOUNbAyPMdOoz+u35N3JU4doNKZJGCWvAj+BwLWVswRdIMVFj6FUMtyGa
 Efm4OprAPNfmYKGrVuwQNj4iqDDiaKOjrIEAM03pibKEGUjCTsuwdyQJCoOe9/Jtc5
 eydrOSHxkvJNVU0O4Ur+MYez3KOIPhyVM6k2jFZ9UQSPAfaau6EZAWCKAEQ/RKnOjd
 4ysyvIfyLx+1LeWqQcUSAWIPNXTQscUesDsY6mbyRF6q3gzgyFpTpOmrFArrxXBjLn
 2ZJ9LuzIvRBzXLc8I3TM49YmTGPq7EwTO8fgMSJIIXQYdl0/K3L8r362d7cCC2YGC3
 4jWJr04Y6qr0y3EBwdX0U+yImLaNSQBPP2Y9dr1nRf8eN/6aHUQw0frQPxA9Dl26l4
 MBFo++qE/NBGlFacVkLL276Oza+3e2pqzmum1gBPbrAwjiV3TO7Ioz/qWDbVSOIceX
 RxMONupN89NN6mUQ/fBfGJK/hTMmKjXHAqfeQ3ZvvrvPsXcn0SqR1sTe7lWkxFfoWt
 N/mW9V42enqR/r2/3HrtyeR5K6f5qO1vEkgjgLBZDRax+8MQyDsp2PFXj9zGP9QH0C
 8i8pnlG/D5ssRqat+HCmriMttBhLlebONv5GgqY5vlvmDUN9yIRMEg7HrHyEecWsag
 V1idnnMPljA+MLbU/YWqzdfg=
Date: Tue, 23 Apr 2024 00:07:33 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240422220733.GEZibfpQt1QmJa3x6q@fat_crate.local>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <e8d4877f3b7248031931ed193c026c42dd3363ef.1711405593.git.thomas.lendacky@amd.com>
 <20240417204030.GIZiAzvuLG6qcFFMyT@fat_crate.local>
 <d525f2ef-d8f0-a694-401f-8cb964dcdaed@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d525f2ef-d8f0-a694-401f-8cb964dcdaed@amd.com>
Subject: Re: [svsm-devel] [PATCH v3 03/14] x86/sev: Check for the presence
 of an SVSM in the SNP Secrets page
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

On Thu, Apr 18, 2024 at 04:17:36PM -0500, Tom Lendacky wrote:
> Do you want it added as a in this patch or in a documentation patch at the
> end of the series?

Either way's fine.

> > Why was that thing ever called "_layout" and not simply
> > snp_secrets_page?
> > 
> > Fix it?
> 
> Sure, I can change that as a pre-patch to the series.

Ack.

> 
> > 
> > > +	u64 caa;
> > > +
> > > +	BUILD_BUG_ON(sizeof(*secrets_page) != PAGE_SIZE);
> > 
> > Put it in the header under the struct definition I guess.
> 
> It can't stand on it's own in the header file. I'd have to put it in a
> #define or an inline function and then use that in some code. So it's
> probably best to keep it here.

You can always put it in an inline function in the header to move this
macro out of the way but ok, one macro is not too nasty yet. :-)

> > Uff, duplication.
> > 
> > Let's put them in sev-shared.c pls and avoid that.
> 
> Ok, but it will require moving some functions after the inclusion of
> sev-shared.c and then (later) adding some advance function declarations.

I guess I'll have to see it.

I get the feeling that this sev-shared.c is starting to get problematic
and we have to do some dancing to get it all to work nicely.

In this particular case, those decompressor and kernel proper variables
should probably be passed explicitly to the shared function or returned
from it so that there's no "magic" fitting of the shared function
touching external variables of the same name and thus those names are
kept the same and it all becomes fragile.

IOW:

	svsm_ca = setup_svsm_ca(...);
	svsm_ca_pa = (unsigned long)svsm_ca;

or whatever needs to happen. But you get the idea...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
