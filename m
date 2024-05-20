Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 0581A1C61B5
 for <svsm-devel@coconut-svsm.dev>; Mon, 20 May 2024 15:57:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0FFZ0t27/ssnqVjVUm8RKiTC58eC0Cn6C9xCl0K5Cg=;
 b=JaJizE9TtoABkItEMhHOcAGQ70riR6BgcKMsQF4mWLWASn06eBSjpDBiKYZlxGNgG3EDMeaz5i5HIjbl/+o20VwLN8rSzof1ty3Jr4RelGvDcjEJuARs2TYBs4jPGRDsZU04scHB2kyxIvEGuMKn/9b2Qp85M1e57aKZKnn+62k=
Message-ID: <f8a92b19-9090-40ea-c2cf-707005f583a5@amd.com>
Date: Mon, 20 May 2024 08:57:43 -0500
Content-Language: en-US
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <6cf54cac47f212f4c2b59b123855d8c183989022.1713974291.git.thomas.lendacky@amd.com>
 <20240502093520.GRZjNeWLXU5j2UMOAM@fat_crate.local>
 <66928741-aa5c-4bbb-9155-dc3a0609c50a@amd.com>
 <20240517155858.GDZkd-wkWmYegos-eT@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20240517155858.GDZkd-wkWmYegos-eT@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 04/15] x86/sev: Check for the presence
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

On 5/17/24 10:58, Borislav Petkov wrote:
> On Thu, May 02, 2024 at 10:29:02AM -0500, Tom Lendacky wrote:
>> PAGE_ALIGNED and IS_ALIGNED are from two separate header files (mm.h and
>> align.h) which seems like a lot of extra changes for just one check.
> 
> No, pls put them in a single shared/mm.h header. And no, those are not
> a lot of extra changes - those are changes which are moving the code in
> the right direction and we do them sooner rather than later, otherwise
> they'd pile up and we'll never be able to find time to do them - sev.c
> movement attempt case-in-point.

So this will be a new shared directory in the top level include 
directory (as PAGE_ALIGNED is defined in include/linux/mm.h), not just 
in the arch/x86/include directory like the others (io.h, msr.h and 
tdx.h). Is that what you want?

Thanks,
Tom

> 
>> Not sure I agree. I'd prefer to keep the comment here because it is
>> specific to this rmpadjust() call. See below.
> 
> Just don't replicate some versions of the same comment all over the
> place. Do one big comment which explains which RMPADJUST has to do with
> VMPL levels - perhaps over the insn - and then refer to it from the
> other places after adding the specific explanations for them.
> 
>> Right. Not sure about the "cannot", more like "must not." The specification
>> states that the guest should run at a VMPL other than 0. If an SVSM starts
>> the guest at VMPL0, then the SVSM would not be protected from guest.
> 
> Yeah, well, you do terminate the guest if it is running at VMPL 0 *in*
> the presence of a SVSM so it is a "must not". Ok.
> 
