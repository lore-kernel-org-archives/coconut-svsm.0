Return-Path: <Huibo.Wang@amd.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 346AB4A7E2
 for <svsm-devel@coconut-svsm.dev>; Wed,  7 May 2025 22:43:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7pOTxovxz2RHxE89mPiPaz0sII3q3PYrh7dOHioVd4=;
 b=rI2MI3O33UWJBg9eoIqu+d1lMrvmBnsfF3UzWb9i10h9GkxJJIFM2zkssIjK1M4s/T6HLw7GTMShKHYg/qrnAyfunk4V6Mz42r/oDaCXqHN46VNN5fOiHva0iLD9MtSP8mn0okTGWEJ6mAnWJdrnoyqMoZaRVHabM/FnCm0NDuA=
Message-ID: <1c49bccf-0ca2-482a-9ed0-c1f5b563e9e5@amd.com>
Date: Wed, 7 May 2025 13:43:45 -0700
MIME-Version: 1.0
From: "Melody (Huibo) Wang" <huibo.wang@amd.com>
References: <86219652-1174-4965-8aaa-11a05f2c1f46@amd.com>
 <SA6PR21MB4303E5A246588F3CC3E6C288CA8E2@SA6PR21MB4303.namprd21.prod.outlook.com>
 <b5b827f6-79f3-4012-be17-4317b0ed965d@amd.com>
Content-Language: en-US
In-Reply-To: <b5b827f6-79f3-4012-be17-4317b0ed965d@amd.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] [EXTERNAL] Extended Interrupt Information
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Jon Lange <jlange@microsoft.com>
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="utf-8"

Hi Jon,

I am updating the GHCB spec with Alternate Injection info. 

Regarding this paragraph in the AI spec: "To indicate separate interrupt sources for each VMPL, the #HV doorbell page is further extended to define the first 256 bytes. Bytes 0-31 contain interrupt information associated with VMPL0 itself." 

So this is 256 bytes in total (!) and the first 4 bytes - PendingEvent and
InjectionInfo - are included in those 256 bytes, correct?

The layout is NOT PendingEvent, InjectionInfo, 256 more bytes for a total of 260 bytes, right?

IOW, the first 4 bytes are part of the SVSM interrupt information, which is how I did it in my test program.

Sorry but I would like to absolutely make sure this is crystal clear in the GHCB spec so that there are no ambiguities.

Thanks a lot!

Melody



On 5/5/2025 3:31 PM, Melody (Huibo) Wang wrote:
> Thanks for confirming, it helps. :)
> 
> Thanks,
> Melody
> 
> On 5/5/2025 3:19 PM, Jon Lange wrote:
>> I believe your definitions are correct.
>>
>> -Jon
>>
>> -----Original Message-----
>> From: Melody (Huibo) Wang <huibo.wang@amd.com> 
>> Sent: Sunday, May 4, 2025 1:28 PM
>> To: Jon Lange <jlange@microsoft.com>
>> Cc: Lendacky, Thomas <Thomas.Lendacky@amd.com>; Jörg Rödel <joro@8bytes.org>; svsm-devel@coconut-svsm.dev
>> Subject: [EXTERNAL] Extended Interrupt Information
>>
>> Hi Jon,
>>
>> I have written a small C program that implements the new #HV doorbell page with extended interrupt information. 
>>
>> Could you please confirm that my reading of the spec is correct, especially fields layout and order? 
>>
>> #include <errno.h>
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <string.h>
>> #include <assert.h>
>>
>> #define PAGE_SIZE		4096
>>
>> #define DIV_ROUND_UP(n,d)	(((n) + (d) - 1) / (d))
>>
>> #define BITS_PER_TYPE(type)	(sizeof(type) * 8)
>> #define BITS_TO_LONGS(nr)	DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
>>
>> #define DECLARE_BITMAP(name,bits) \
>> 	unsigned long name[BITS_TO_LONGS(bits)]
>>
>> typedef unsigned char u8;
>> typedef unsigned short u16;
>>
>> /*
>>  * Hypervisor doorbell page:
>>  *
>>  * Used when restricted injection is enabled for a VM. One page in size that
>>  * is shared between the guest and hypervisor to communicate exception and
>>  * interrupt events.
>>  */
>> struct ext_irq_desc {
>> 	/* first 16-bit word */
>> 	struct {
>> 		u16 si_vector:		8,
>> 		    nmi:		1,
>> 		    mce:		1,
>> 		    trigger_mode:	1,
>> 		    reserved1:		3,
>> 		    multi_interrupts:	1,
>> 		    reserved2:		1;
>> 	} word0;
>>
>> 	/* Second 16-bit word */
>> 	struct {
>> 		u16 reserved5:		15,
>> 		    interrupt_vector:	1;
>> 	} word1;
>>
>> 	/*
>> 	 * Set the corresponding vmpl?_irq bit in inj_info after setting
>> 	 * multiple bits here.
>> 	 */
>>         u16 interrupt_bit_vector[14];
>>
>> 	/*
>> 	 * Reserved for future use.
>> 	 * TODO: Code should check them and fail if set.
>> 	 */
>>         u8 reserved6[32];
>> } __attribute__((packed));
>>
>> struct hvdb {
>> 	/* first 16-bit word PendingEvent */
>> 	struct {
>> 		/* Non-maskable event indicators */
>> 		u16 reserved1:          8,
>> 		nmi:                    1,
>> 		mce:                    1,
>> 		reserved2:              5,
>> 		no_further_signal:      1;
>> 	} pending_event;
>>
>> 	/* Second 16-bit word InjectionInfo */
>> 	union {
>> 		struct {
>> 			u16 no_eoi_required:	1,
>> 			    reserved3:		7,
>> 			    vmpl1_irq:		1,
>> 			    vmpl2_irq:		1,
>> 			    vmpl3_irq:		1,
>> 			    reserved4:		4;
>> 		} inj_info;
>> 		u16 injection_info;
>> 	};
>>
>> 	/* IRQ info associated with the SVSM itself */
>> 	/* XXX: code should enforce bytes [32-63] are zero */
>> 	u8 svsm_irq_info[64 - 4];
>>
>> 	/* VMPL[1-3] extended IRQ descriptors */
>>         struct ext_irq_desc irqs[3];
>>
>>         /* Remainder of the page is for software use */
>>         u8 reserved[PAGE_SIZE - 256];
>> } __attribute__((packed));
>>
>> int main(void)
>> {
>> 	struct hvdb h = { };
>>
>> 	assert(sizeof(struct ext_irq_desc) == 64);
>>
>> 	printf("sizeof(struct ext_irq_desc): %zu\n", sizeof(struct ext_irq_desc));
>>
>> 	h.inj_info.no_eoi_required = 1;
>> 	h.inj_info.vmpl3_irq = 1;
>>
>> 	printf("injection_info: 0x%x\n", h.injection_info);
>>
>> 	return 0;
>> }
>>
>>
>> Thanks,
>> Melody
> 

