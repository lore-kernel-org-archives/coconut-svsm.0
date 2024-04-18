Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id CF6021C6256
 for <svsm-devel@coconut-svsm.dev>; Thu, 18 Apr 2024 20:38:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mu7GGKlAphx157M7g3TJ7xVPvvmaS0iXl5nsbRBqHIc=;
 b=W3U0jHv0esJHoVK/Z0klBCAvUTsfZggl2+LgFo4EErsPO9C+2EQkR4+zrkc7YeycNo00JaDzVS7D9JMlMT89O5zukFsfEACW4NFkcfY/Cgsc7C/+UDIVpQwNeMHwpDhgV5iwwvxeDSAkoZfGwuunW5lhoDYXE1WvpwmMYMUKB78=
Message-ID: <36453f2f-3a2f-ae8b-215f-da9972f14d6d@amd.com>
Date: Thu, 18 Apr 2024 13:38:49 -0500
Content-Language: en-US
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <1b0d8ec8e671ad957a2ad888725ce24edeedf74a.1711405593.git.thomas.lendacky@amd.com>
 <20240417114658.GHZh-2sk47TZgCp4Mb@fat_crate.local>
 <505dcf34-93ff-643c-b149-8ef9ce90c023@amd.com>
 <20240417205048.GHZiA2KGbFFTQFyTAM@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240417205048.GHZiA2KGbFFTQFyTAM@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 4/17/24 15:50, Borislav Petkov wrote:
> On Wed, Apr 17, 2024 at 03:35:53PM -0500, Tom Lendacky wrote:
> 
> Yap.
> 
> The point is, it is calling RMPADJUST. And it does modify RMP
> permissions of a guest page.
> 
> Thus, if you prefer, you can go all out and call the helper
> 
> 	rmp_adjust_permissions(unsigned int tgt_vmpl, void *pa)
> 
> and make it generic from the get-go.

I think I'll just eliminate the function then and call rmpadjust directly, 
that should make it clear.

Thanks,
Tom

> 
> And then have the macro wrap around it in order to explain that
> particular use with the macro name.
> 
> If it is still not clear what I mean, lemme know and I'll do a diff
> ontop.
> 
> Thx.
> 
