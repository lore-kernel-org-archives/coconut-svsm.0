Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 3EEC71C4BAE
 for <svsm-devel@coconut-svsm.dev>; Fri, 17 May 2024 17:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1715961558; bh=hOyx/EihvgqsW8aos4tSF8YAoqZcNUDe+O1fUCBVb5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YdRKqHrbxKQ3ln5ZlmKMzEP5uJLmDLNZQZxYa2USdLjBTxOw7rCSXctq0fx7/Dkyn
 ZtwLXjftsqLqORPnoTwLAv0qXpuqKZUOU/xMVXbBhm8xMjqPeJRf8V1eVdMkoqeu2P
 5Gq6JiapWoStnN0wgWrEH76ROZo1KVsqFrUFdy12L7joHph2nlmnnLFHUBhw4ECyhv
 U8ySw9vW9timgUiubo5wIg2MS59hDvZTa+NQX5QkHZfYgpZjmfx1mbUvaJCJkhrJI+
 GZD6nb3Khh/O8D32SnXFdmCvFAHFBmm2SrfII8gDOkMdJW/ofX7uxZHUCTrWERCR70
 WXLtvsAyFaUTgDMKf8YNKCXbJThUfxiPqY8KTtpiv+D7UxgjtS6Qfqw0cypBME8wF0
 hWmYEFgmPaQc7Wi7KDPb2EZ1KykkuLBaUKqBnfp9PvoXVMp0QRbfsmL3Js9lHHImmR
 9EpG2PeeK7ydvISaBzwi1ez/ULmNvFGjbbc+fS0Xeum226ygXAFaFF7lMUlADTQX8S
 CkkM4UzY6LnKF3Ib25SKLPoY45Pq57RCJooEZbovfmoiZ4F323Q4xMIAvVCIZQq45c
 qoIds/N3YzfsJJJFp1WSzl4R8leDxeOYbgEd/t8rroVVGA0EMSLQ/XUXWXWyTurIkT
 SeuyUn9uOJ7XClGWXKvAQkYA=
Date: Fri, 17 May 2024 17:58:58 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240517155858.GDZkd-wkWmYegos-eT@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <6cf54cac47f212f4c2b59b123855d8c183989022.1713974291.git.thomas.lendacky@amd.com>
 <20240502093520.GRZjNeWLXU5j2UMOAM@fat_crate.local>
 <66928741-aa5c-4bbb-9155-dc3a0609c50a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66928741-aa5c-4bbb-9155-dc3a0609c50a@amd.com>
Subject: Re: [svsm-devel] [PATCH v4 04/15] x86/sev: Check for the presence
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

On Thu, May 02, 2024 at 10:29:02AM -0500, Tom Lendacky wrote:
> PAGE_ALIGNED and IS_ALIGNED are from two separate header files (mm.h and
> align.h) which seems like a lot of extra changes for just one check.

No, pls put them in a single shared/mm.h header. And no, those are not
a lot of extra changes - those are changes which are moving the code in
the right direction and we do them sooner rather than later, otherwise
they'd pile up and we'll never be able to find time to do them - sev.c
movement attempt case-in-point.

> Not sure I agree. I'd prefer to keep the comment here because it is
> specific to this rmpadjust() call. See below.

Just don't replicate some versions of the same comment all over the
place. Do one big comment which explains which RMPADJUST has to do with
VMPL levels - perhaps over the insn - and then refer to it from the
other places after adding the specific explanations for them.

> Right. Not sure about the "cannot", more like "must not." The specification
> states that the guest should run at a VMPL other than 0. If an SVSM starts
> the guest at VMPL0, then the SVSM would not be protected from guest.

Yeah, well, you do terminate the guest if it is running at VMPL 0 *in*
the presence of a SVSM so it is a "must not". Ok.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
