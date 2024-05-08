Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 48E001C0B91
 for <svsm-devel@coconut-svsm.dev>; Wed,  8 May 2024 22:09:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moyDe9WUoXzCNjGYvs041/i1I+Z8FRGciDZwanAxVcQ=;
 b=PKICXTfMJMNdV1GPKYadkzt9+mIWBJgxco7tay3olYbzQiRU2X0tvvr8GBpG2lwMAXbUuPPnRlBsnorgSKT5b3PPMrjrYHm9kHzzg0gGVsCLl7XmTr73x31sNwlW0g5lt4b3KWbU8tWen00qowDsjFeFi7Fgfm8tFRXmDXtOEqA=
Message-ID: <d3b59450-fdbd-2813-bbc0-58f9dc2ba817@amd.com>
Date: Wed, 8 May 2024 15:09:02 -0500
Content-Language: en-US
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <07266b47e749267ef9a9ccbc9e8e9df78ed54857.1713974291.git.thomas.lendacky@amd.com>
 <20240508080509.GWZjsyNS0xBXUzKPUG@fat_crate.local>
 <22dc9ceb-4b16-be68-ed8e-c6a222619032@amd.com>
 <20240508195842.GIZjvZcpRz0bdkiPWA@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240508195842.GIZjvZcpRz0bdkiPWA@fat_crate.local>
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

On 5/8/24 14:58, Borislav Petkov wrote:
> On Wed, May 08, 2024 at 02:13:17PM -0500, Tom Lendacky wrote:
>> ok, maybe __perform_svsm_msr_protocol or such.
> 
> We'll bikeshed it in the coming weeks.

:)

> 
>> There's quite a bit of interaction so I'll make sure to prefix everything.
> 
> Ack.
> 
>> The paravirt versions of local_irq_save and local_irq_restore can't be used
>> as early as this routine is called.
> 
> tglx says you should do native_local_irq_save()/.._restore() helpers
> just like the arch_local_irq_save()/..._restore() ones but use only
> native_ functions without the paravirt gunk.
> 
> In a prepatch pls.

Will do.

> 
>>>> +	struct svsm_call call = {};
>>>> +	int ret;
>>>> +	u64 pa;
>>>> +
>>>> +	/*
>>>> +	 * Record the SVSM Calling Area address (CAA) if the guest is not
>>>> +	 * running at VMPL0. The CA will be used to communicate with the
>>>> +	 * SVSM to perform the SVSM services.
>>>> +	 */
>>>> +	setup_svsm_ca(cc_info);
>>>> +
>>>> +	/* Nothing to do if not running under an SVSM. */
>>>> +	if (!vmpl)
>>>> +		return;
>>>
>>> You set up stuff above and now you bail out?
>>
>> setup_svsm_ca() is what sets the vmpl variable. So nothing will have been
>> setup if the VMPL is zero, in which case we don't continue on.
> 
> You still assign
> 
>          /*
>           * The CA is identity mapped when this routine is called, both by the
>           * decompressor code and the early kernel code.
>           */
>          boot_svsm_caa = (struct svsm_ca *)caa;
>          boot_svsm_caa_pa = caa;
> 
> regardless of vmpl.

If we're not running at VMPL0 (based on the RMPADJUST check) and if the 
SVSM doesn't advertise a non-zero VMPL value, we will self-terminate. So 
those values are only set if we are not running at VMPL0 and the SVSM 
has provided a non-zero value to us.

I'm going to turn the function into a bool function so that the call 
becomes:

	if (!svsm_setup_caa(cc_info))
		return;

> 
> I think you should assign those only when vmpl != 0.

I do. I think you're missing the RMPADJUST check that causes the 
function to return early if we're running at VMPL0.

> 
> Otherwise the code is confusing.
> 
>>> Judging by setup_svsm_ca() you don't really need that vmpl var but you
>>> can check
>>>
>>> 	if (!boot_svsm_caa)
>>> 		return;
>>>
>>> to determine whether a SVSM was detected.
>>
>> Yes, but the vmpl var will be used for attestation requests, sysfs, etc.
> 
> I guess that comes later in the patchset...
> 
>>> Huh, setup_svsm_ca() already assigned those...
>>
>> setup_svsm_ca() assigned the ones from the secrets page. The kernel now
>> switches to using its own CA.
> 
> Comment pls.

There's a block comment above it all, but maybe it isn't clear enough. 
I'll rework it.

Thanks,
Tom

> 
> Thx.
> 
