Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::60f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id C27E81C3F08
 for <svsm-devel@coconut-svsm.dev>; Wed,  5 Jun 2024 23:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6VNi9Ko125ovRm4ejx2yjyy4wOt9h4J9H1yBqmxlU8=;
 b=2fpTzhc1oPooe9e2sl7xksQnlJ/AobZm8jWlxcbYBkYxc4buyCHt/pCj4Xpi6ctmwwt0jJHbihkzTbpJd/ajUTdUJGCOxiN+QVtWJTTTg77fPZ5dZp3Hhyf9me13KwF/yRc+VpWNnRAnNdNXYzs0ksiw9lp0Q0XwHu/3yyls5C4=
Message-ID: <952085da-d209-5144-19ef-26c5e7b03cfb@amd.com>
Date: Wed, 5 Jun 2024 16:17:07 -0500
Content-Language: en-US
References: <cover.1717600736.git.thomas.lendacky@amd.com>
 <9d3fe161be93d4ea60f43c2a3f2c311fe708b63b.1717600736.git.thomas.lendacky@amd.com>
 <20240605193831.GYZmC-twcfjlArW3Hq@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240605193831.GYZmC-twcfjlArW3Hq@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v5 02/13] x86/sev: Check for the presence
 of an SVSM in the SNP Secrets page
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

On 6/5/24 14:38, Borislav Petkov wrote:
> On Wed, Jun 05, 2024 at 10:18:45AM -0500, Tom Lendacky wrote:
>> During early boot phases, check for the presence of an SVSM when running
>> as an SEV-SNP guest.
>>
>> An SVSM is present if not running at VMPL0 and the 64-bit value at offset
>> 0x148 into the secrets page is non-zero. If an SVSM is present, save the
>> SVSM Calling Area address (CAA), located at offset 0x150 into the secrets
>> page, and set the VMPL level of the guest, which should be non-zero, to
>> indicate the presence of an SVSM.
>>
>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>> ---
>>   .../arch/x86/amd-memory-encryption.rst        | 23 ++++++
>>   arch/x86/boot/compressed/sev.c                | 21 +++---
>>   arch/x86/include/asm/sev-common.h             |  4 ++
>>   arch/x86/include/asm/sev.h                    | 34 ++++++++-
>>   arch/x86/kernel/sev-shared.c                  | 71 +++++++++++++++++++
>>   arch/x86/kernel/sev.c                         |  7 ++
>>   6 files changed, 151 insertions(+), 9 deletions(-)
> 
> I did some touch-ups ontop:

Works for me, thanks!

Tom

> 
