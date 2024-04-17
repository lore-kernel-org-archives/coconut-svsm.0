Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 69B7B1C0B90
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Apr 2024 22:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h71yltihMqnyoSsYcitF85Pw54bxFG2ag21jUjHnIc=;
 b=mbJxmXZ++vUA/WokuEotYEEPrGkZnlatnwHJdjzBtdN7DkLe5YA0FWABdV04PE7HywPHq8+uW5I23DlFYTrBlNYw7uV01GPR7cEOpqS8qAX8NxO4KXqiuaQXMKNYK8w+O/AohkI7cL3f8wumCeAZn5b7cRW27zV6xD40/o6wmpA=
Message-ID: <505dcf34-93ff-643c-b149-8ef9ce90c023@amd.com>
Date: Wed, 17 Apr 2024 15:35:53 -0500
Content-Language: en-US
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <1b0d8ec8e671ad957a2ad888725ce24edeedf74a.1711405593.git.thomas.lendacky@amd.com>
 <20240417114658.GHZh-2sk47TZgCp4Mb@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240417114658.GHZh-2sk47TZgCp4Mb@fat_crate.local>
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

On 4/17/24 06:46, Borislav Petkov wrote:
> On Mon, Mar 25, 2024 at 05:26:21PM -0500, Tom Lendacky wrote:
>> -static void enforce_vmpl0(void)
>> +static bool running_at_vmpl0(void *va)
> 
> Not too crazy about it: you're turning it into a function which runs in
> boolean context but takes a void *?!
> 
> And the boolean result is only a side-effect or what it does to the
> argument - modify its permissions. Which is weird and not really
> obvious.

Well, it doesn't really modify any permissions that matter. It tries to 
change the permission of a lesser privileged VMPL level. Since the 
kernel only runs at a single VMPL it would never be effected. The 
operation performed here is to update VMPL1 permission levels (which can 
only be done successfully at VMPL0) and return the result of the 
operation. A success implies running at VMPL0 and failure implies not 
running at VMPL0.

> 
> I'd prefer it if you made it into
> 
> static void vmpl0_modify_permissions(void *va)

I guess this confuses me, since it sounds like you're trying to modify 
the VMPL0 permissions, which you can't do. Maybe calling it 
modify_vmpl1_permissions() would be better. And a void return doesn't 
tell me whether it was successful and, therefore, whether the kernel is 
running at VMPL0.

Thanks,
Tom

> 
> which basically says, modify the permissions of @va in vmpl0, which is
> a lot closer to what the function does.
> 
> And then do
> 
> #define running_at_vmpl0(va)	vmpl0_modify_permissions((va))
> 
> because then through the indirection is at least clear how that "am
> I running at VMPL0?" check is being done.
> 
> And later, if we need other VMPLs, we can extend
> vmpl0_modify_permissions() and even do a more generic
> 
> vmpl_modify_permissions(unsigned int vmpl_level, void *va)
> 
> and so on and kill the silly macro.
> 
> Thx.
> 
