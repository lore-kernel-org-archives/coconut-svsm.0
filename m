Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 210DC1C7195
 for <svsm-devel@coconut-svsm.dev>; Mon, 27 May 2024 14:01:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1716811295; bh=kFJbAAz0Ge0oQNpUds7hPofKuWTKPhhEYoWu+CDfR7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VRgtj16qkJpX3zuhQokUE9F7o0l8Z6Hduxi/hxfNla+AptmoJJGyoKSZxLyepgE+7
 udOjNmeZIHJX9vIK2yKWfTGrtDYJKLRQ8VEZh7TmKwrF5JlaVZGCyFEW+HE7wbJMAd
 MyFLBnwJrKDU1LR+29UEh/fItXxnQvagSwvk7kyS67UYuoKwsOYtH2ZuPbW6ZGXGVZ
 Payjce71JOapupgHLm3r0SVT2yzfKZxcPWGCqs/BVD7lmwvA50r7X1uUvYn1op4+CW
 650GkjNXwQqg4dPWfs5IM8OpPhAD1b6035EEjHQZXYjI4e0A+DfGpVBQeJ2AtOUU6s
 5NOSiSgOtU3S5ue+dHn9J5DE6W35qR/SCl9fRzTITFl9W1QtB51KmGEdh3OVx/dw9I
 2S70fsSS6NeNX9vHknF9V0ys2dQ/9qwM4DOGdzaBC29DSrxPoQkpEGegd65QR/2s8r
 Px7OG1RwFeb97NwslBEgvU6hdgSXdwUkjU9l3gznGoIzSKeaxScIAuV4mgdbmiJGQP
 3uvaIUiorY6yNj3Y/wkyeLVYXD4iRSFWYuCotPOf2xCIpSNBPVaUy+2XoDE+V0TrZH
 6S0U65tOh1WantTuA5gj9DJ53tG3XdlYlomiFPeJluGqGnE+hjshSE2CoNbRQJQuMG
 Cj7CTYij63C7u8xIa5Dh3S2E=
Date: Mon, 27 May 2024 14:01:14 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240527120114.GCZlR2Cpu_8rJXlMOS@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <ce5f7ded87868adce2f4724415313229a8bf3eb3.1713974291.git.thomas.lendacky@amd.com>
 <20240522182403.GAZk44Q7DalfDBk7Br@fat_crate.local>
 <408e9902-d9b1-d087-a44d-fb27342cf21f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <408e9902-d9b1-d087-a44d-fb27342cf21f@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 06/15] x86/sev: Perform PVALIDATE using
 the SVSM when not at VMPL0
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

On Wed, May 22, 2024 at 04:14:54PM -0500, Tom Lendacky wrote:
> Right, changing that from previous comment. But are you also asking that the
> if / else style be used?

Yeah, please. It is trivial and thus more readable this way.

> Sure, I'll add more comments or expand the comment above.

Yes, and pls split it into helpers. Those bunch of nested loops are
kinda begging to be separate function helpers.

> That's because you can only pass a certain number of entries to the SVSM to
> handle at one time. If the kernel is in the process of validating, say,
> 1,000 entries, but the CA can only hold 511 at a time, then after it reaches
> the 511th entry, the SVSM must be called. Upon return, the kernel resets the
> CA area and builds up the entries in there again, calling the SVSM again
> when the area is again full or we reach the last entry to be validated.
> 
> I'll add more detail in the comments.

Yeah, that "portioning" must be explained there.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
