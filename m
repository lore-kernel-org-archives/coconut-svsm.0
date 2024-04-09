Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::701])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 79E51281F5D
 for <svsm-devel@coconut-svsm.dev>; Tue,  9 Apr 2024 19:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIaUEgUWz4Rg0Lygka0iHiu4LMkTxpIiGLjzakT5xRY=;
 b=OEMhA1Fu2U5p0AngDwWVIK0ZtOF/8QZwaiCgBu4gS3hJOBlV5xSiB4oh6iiw9c1T/e+P0MY4U2GShrcXtefbR3SQY4lEYMbIjf48xTqHSCvGBkF4msrpsU7YpKkh6DIucrP/Yk9OnsjIhGGkEDYlFmf8rWQ5L6GODCHJYEnHKkY=
Message-ID: <ac044150-ffb1-09b5-1f36-fdd6e259ba59@amd.com>
Date: Tue, 9 Apr 2024 12:44:13 -0500
Content-Language: en-US
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <425afa6512994b1ca1bb366eb7abfb24d65175aa.1711405593.git.thomas.lendacky@amd.com>
 <20240409170917.GCZhV2PWPhmzTHhMRO@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240409170917.GCZhV2PWPhmzTHhMRO@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 4/9/24 12:09, Borislav Petkov wrote:
> On Mon, Mar 25, 2024 at 05:26:20PM -0500, Tom Lendacky wrote:
>> The snp_init() in boot/compressed/sev.c is local to that file and is not
>> called from outside of the file. Change the name so that it is not tied
>> to the function definition in arch/x86/include/asm/sev.h.
> 
> That part I don't understand: I can rename the function without making
> it static and it builds fine, so where is it "tied" to the function
> definition in kernel proper?

When it's not static and has the name snp_init(), then it has to match 
the definition in arch/x86/include/asm/sev.h, which is really intended 
for the snp_init() in arch/x86/kernel/sev.c when called from 
arch/x86/mm/mem_encrypt_identity.c.

So, yes, changing the name would be enough except then it remains not a 
static and you can get a compiler warning about not having a prototype 
for it if the -Wmissing-prototypes option is ever applied to that file 
(I don't believe it is today because it is in the decompressor code, but 
that can change). And since nothing calls the snp_init() in 
arch/x86/boot/compressed/sev.c from outside of that file, making it 
static was appropriate.

Thanks,
Tom

> 
> Don't get me wrong - leaking kernel proper symbols into the decompressor
> has been a pet peeve of mine for a while now but this is not the case
> here, is it?
> 
> And yes, the patch is fine - I'm just asking...
> 
> Thx.
> 
