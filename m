Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 361361C3858
 for <svsm-devel@coconut-svsm.dev>; Fri, 31 May 2024 21:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44uxD4DTYdNfz5YYpfGvNQz94eD3MqNESInykVFneA0=;
 b=5BoA1iZOyAGyIBhNcQ0O4soTvUeLBzIoELwEYeowPXEFMwG++syLR9UGwaTl1sYH+iFCo30GDnqaHcP0uOyxF+1FKyXQw6wC3V3/qJ/mQo+5U96jKmszw4u0ueSpPDsomfusMfpmElk4np5X/Y+zELPws9pEHcu/XQQmIka5HTA=
Message-ID: <d97f837e-fe7c-64ed-78ec-2581607150c6@amd.com>
Date: Fri, 31 May 2024 14:34:37 -0500
Content-Language: en-US
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <b8508f57712e3194484aa8695494eea26abe1b73.1713974291.git.thomas.lendacky@amd.com>
 <20240531125503.GEZlnIp7YobFu7g9iS@fat_crate.local>
 <ad55da28-e5e0-a348-3cbc-d1a80d0ab2bb@amd.com>
 <20240531190348.GKZlofFDL4ESfpOQ6O@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240531190348.GKZlofFDL4ESfpOQ6O@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 10/15] virt: sev-guest: Choose the VMPCK
 key based on executing VMPL
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

On 5/31/24 14:03, Borislav Petkov wrote:
> On Fri, May 31, 2024 at 01:36:06PM -0500, Tom Lendacky wrote:
>> The sev-guest driver needs to access it. Given it is a driver/module, I
>> created the accessor rather than mark the variable EXPORT_SYMBOL_GPL(). Your
>> call, I'm fine with either.
> 
> Yeah, if the variable doesn't change after init, then you don't really
> need an accessor.
> 
>> Yes, the driver can and does figure it out. However, this module parameter
>> was added in the off chance the default VMPCK gets wiped. Then you can
>> reload the driver and use a different (less privileged) VMPCK.
> 
> Is that what the text over snp_disable_vmpck() is alluding to?

Yes, I believe so.

> 
> Or where are we documenting this intended use?

It probably should have been documented above the module parameter itself 
and/or in the sev-guest documentation. Those can be done as part of this 
patch or separate, whichever is preferred.

Thanks,
Tom

> 
> Thx.
> 
