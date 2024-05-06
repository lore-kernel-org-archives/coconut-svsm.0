Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id D5EE61C28FC
 for <svsm-devel@coconut-svsm.dev>; Mon,  6 May 2024 15:14:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XQG40XabNpImRDVi1b8r4wGyjeiOhmI1/5Hexc0MbY=;
 b=VT7Qe05R0c7VJ37pL+BZEu6lPrSxBlE9l+l/6fJ/RDwYpyMXCb+avf6IWi6WNgj1CJDWNM7fBNAXR/ysOMGt3q8uDtKkuSRDRTuFf1EbcopT7wcr8UXHZlELj8xXRhOYSD/1hyuZP0ltkx/3xhvpH58GB7ylJ/LRQWv4OND3Or4=
Message-ID: <c4640af2-a791-848a-bacb-071f0bc8f9b1@amd.com>
Date: Mon, 6 May 2024 08:14:34 -0500
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <07266b47e749267ef9a9ccbc9e8e9df78ed54857.1713974291.git.thomas.lendacky@amd.com>
 <20240503103407.GSZjS9n-XMMKi5ZOek@fat_crate.local>
 <20240506100905.GFZjisQTQwbkv2eKsh@fat_crate.local>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240506100905.GFZjisQTQwbkv2eKsh@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 5/6/24 05:09, Borislav Petkov wrote:
> Ok,
> 
> I think this is very readable and clear what's going on:

I'll test it out.

> 
> static __always_inline void issue_svsm_call(struct svsm_call *call, u8 *pending)
> {
>          register unsigned long rax asm("rax") = call->rax;
>          register unsigned long rcx asm("rcx") = call->rcx;
>          register unsigned long rdx asm("rdx") = call->rdx;
>          register unsigned long r8  asm("r8")  = call->r8;
>          register unsigned long r9  asm("r9")  = call->r9;
> 
>          call->caa->call_pending = 1;
> 
>          asm volatile("rep; vmmcall\n\t"
>                       : "+r" (rax), "+r" (rcx), "+r" (rdx), "+r" (r8), "+r" (r9));
> 
>          xchg(pending, 1);

This isn't quite right. The xchg has to occur between pending and 
call->caa->call_pending.

Thanks,
Tom

> 
>          call->rax_out = rax;
>          call->rcx_out = rcx;
>          call->rdx_out = rdx;
>          call->r8_out = r8;
>          call->r9_out = r9;
> }
> 
> and the asm looks ok but the devil's in the detail.
> 
