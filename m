Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id AF6DA1C7F57
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 17:17:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JpcWrAdNNqwKUzLR5vd5L4fOtqsr7QtoxqQyDJ4AY4=;
 b=A2zU06s7kuuUjalA2sh9gsIKvHmPXm4zipHdlR2w3AIbrKiFQPZ4iBZ7Ffog+6Ubw/ze4j1cs7VZ6CiMVPlK8f7s8lHFOlhG6sOTShqTesRwlBZRUjd/osLH5VUeG9KLLvbg9fJB0mQrdi0F7scfFrIaDPregRkdZHtymK3MHR0=
Message-ID: <8a1b16c0-9897-bd10-b6f7-b428292c8c9f@amd.com>
Date: Tue, 16 Apr 2024 10:17:33 -0500
Content-Language: en-US
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <9615e6055e5b262a22bf312608647223517595b5.1711405593.git.thomas.lendacky@amd.com>
 <661e04966c622_4d5612946d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <661e04966c622_4d5612946d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 09/14] virt: sev-guest: Choose the VMPCK
 key based on executing VMPL
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 4/15/24 23:54, Dan Williams wrote:
> Hey, Tom, came looking to review the tsm_report changes and noticed
> this...
> 
> Tom Lendacky wrote:
>> Currently, the sev-guest driver uses the vmpck-0 key by default. When an
>> SVSM is present the kernel is running at a VMPL other than 0 and the
>> vmpck-0 key is no longer available. So choose the vmpck key based on the
>> active VMPL level.
> 
> The module parameter is not mentioned in the changelog. Is it not
> sufficient to always use snp_get_vmpl(), and if not should there be some
> documentation about when to specify vmpck_id?

It is possible to encounter an issue that causes the vmpck key to be 
cleared. In that situation, the guest is allowed to use a vmpck key 
associated with a lower VMPL. For that reason, the module parameter was 
added to the driver when it was initially created.

I can update the changelog to mention this.

Note that as long as the vmpck key exists, a guest running at VMPL2 
could request a VMPL0 report using the vmpck0 key, that is why it is 
important that the SVSM clear to zero any vmpck key that represents a 
higher privilege. For example, if the SVSM (running at VMPL0) launches 
the guest at VMPL2, it should zero out the vmpck0 and vmpck1 keys in the 
SNP Secrets Page supplied to the guest.

> 
> Do users know that "vmpl" and "vmpck_id" are interchangeable?

Yes, they should be aware of the relation of VMPL to VMPCK from the SNP 
specification.

Thanks,
Tom
