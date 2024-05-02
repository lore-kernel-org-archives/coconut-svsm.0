Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 5A3E51C0B5F
 for <svsm-devel@coconut-svsm.dev>; Thu,  2 May 2024 15:17:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2q0+xtbNDJli4JekY5bDyAcujxuoONlicjHDZ0LhzCI=;
 b=kcoQC4lCQte7Ff/BAFvChklPkEw8RpVUXsHTklnaJ5BAOVOVC1L14BvwZupf2K8qXBRbs/FocFOCulOxP7oSjlNcY6beBEgLuIS9ULpp/FNBbJjvEzz8P9rNvX1cJg6vDSLmSOTW6iFq81eeM7MJ+v4oP0PZBncOVr6AFwjYHdI=
Message-ID: <36973db8-30c3-60e7-b2f4-505c76bf01c4@amd.com>
Date: Thu, 2 May 2024 08:17:46 -0500
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <b8508f57712e3194484aa8695494eea26abe1b73.1713974291.git.thomas.lendacky@amd.com>
 <CAJ5mJ6gEd4SXtbhRhBowqVNgqqDspvtSC-NLPzNcoE=xHkZ6YQ@mail.gmail.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <CAJ5mJ6gEd4SXtbhRhBowqVNgqqDspvtSC-NLPzNcoE=xHkZ6YQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
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
To: Jacob Xu <jacobhxu@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"

On 5/1/24 18:57, Jacob Xu wrote:
> General question on VMPCKs: the secrets page defines them listed all
> together one at a time, does that mean any guest at any VMPL can
> observe all the VMPCKs? Or is SVSM running at VMPL0 supposed to clear
> VMPCK0 before it hands off control to edk2?

The SVSM should clear VMPCK0 in the copy of the secrets page provided to 
the guest BIOS/OS.

Thanks,
Tom

> 
> 
> On Wed, Apr 24, 2024 at 8:59 AM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>>
>> Currently, the sev-guest driver uses the vmpck-0 key by default. When an
>> SVSM is present the kernel is running at a VMPL other than 0 and the
>> vmpck-0 key is no longer available. If a specific vmpck key has not be
>> requested by the user via the vmpck_id module parameter, choose the vmpck
>> key based on the active VMPL level.
>>
>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>> ---
>>   arch/x86/include/asm/sev.h              |  2 ++
>>   arch/x86/kernel/sev.c                   |  6 ++++++
>>   drivers/virt/coco/sev-guest/sev-guest.c | 10 +++++++---
>>   3 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
>> index a7312b936d16..64fcadd6d602 100644
>> --- a/arch/x86/include/asm/sev.h
>> +++ b/arch/x86/include/asm/sev.h
>> @@ -307,6 +307,7 @@ u64 snp_get_unsupported_features(u64 status);
>>   u64 sev_get_status(void);
>>   void sev_show_status(void);
>>   void snp_remap_svsm_ca(void);
>> +int snp_get_vmpl(void);
>>   #else
>>   static inline void sev_es_ist_enter(struct pt_regs *regs) { }
>>   static inline void sev_es_ist_exit(void) { }
>> @@ -337,6 +338,7 @@ static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
>>   static inline u64 sev_get_status(void) { return 0; }
>>   static inline void sev_show_status(void) { }
>>   static inline void snp_remap_svsm_ca(void) { }
>> +static inline int snp_get_vmpl(void) { return 0; }
>>   #endif
>>
>>   #ifdef CONFIG_KVM_AMD_SEV
>> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
>> index 8edf7362136b..75f11da867a3 100644
>> --- a/arch/x86/kernel/sev.c
>> +++ b/arch/x86/kernel/sev.c
>> @@ -2454,6 +2454,12 @@ int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, struct sn
>>   }
>>   EXPORT_SYMBOL_GPL(snp_issue_guest_request);
>>
>> +int snp_get_vmpl(void)
>> +{
>> +       return vmpl;
>> +}
>> +EXPORT_SYMBOL_GPL(snp_get_vmpl);
>> +
>>   static struct platform_device sev_guest_device = {
>>          .name           = "sev-guest",
>>          .id             = -1,
>> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
>> index 04a7bd1e4314..e7dd7df86427 100644
>> --- a/drivers/virt/coco/sev-guest/sev-guest.c
>> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
>> @@ -2,7 +2,7 @@
>>   /*
>>    * AMD Secure Encrypted Virtualization (SEV) guest driver interface
>>    *
>> - * Copyright (C) 2021 Advanced Micro Devices, Inc.
>> + * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
>>    *
>>    * Author: Brijesh Singh <brijesh.singh@amd.com>
>>    */
>> @@ -70,8 +70,8 @@ struct snp_guest_dev {
>>          u8 *vmpck;
>>   };
>>
>> -static u32 vmpck_id;
>> -module_param(vmpck_id, uint, 0444);
>> +static int vmpck_id = -1;
>> +module_param(vmpck_id, int, 0444);
>>   MODULE_PARM_DESC(vmpck_id, "The VMPCK ID to use when communicating with the PSP.");
>>
>>   /* Mutex to serialize the shared buffer access and command handling. */
>> @@ -923,6 +923,10 @@ static int __init sev_guest_probe(struct platform_device *pdev)
>>          if (!snp_dev)
>>                  goto e_unmap;
>>
>> +       /* Adjust the default VMPCK key based on the executing VMPL level */
>> +       if (vmpck_id == -1)
>> +               vmpck_id = snp_get_vmpl();
>> +
>>          ret = -EINVAL;
>>          snp_dev->vmpck = get_vmpck(vmpck_id, layout, &snp_dev->os_area_msg_seqno);
>>          if (!snp_dev->vmpck) {
>> --
>> 2.43.2
>>
>> --
>> Svsm-devel mailing list
>> Svsm-devel@coconut-svsm.dev
>> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
