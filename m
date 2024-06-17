Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id EDF0D1C8541
 for <svsm-devel@coconut-svsm.dev>; Mon, 17 Jun 2024 19:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7g7nSRyhMtSgVvSzBVCnDe8ChGJyUlm+OK38AZQDCk=;
 b=O/ic0JLchzbhfCd2bVyKiPNVayCxPxBMNxcO8AatZ9VpAwx0fPFC9ZA1kc0FJJ2MpcK8Dp31r207V+xFJ8Xad2AKWzJWaSAE0iX8GlxtHiSGRSkXtMYHCVHgUGbuPbJ/EuRn+v+mWCkPM1Of1Hwxb8vfXegwzcF/5JuXz8SXukM=
Message-ID: <234bb23c-d295-76e5-a690-7ea68dc1118b@amd.com>
Date: Mon, 17 Jun 2024 12:50:27 -0500
From: Tom Lendacky <thomas.lendacky@amd.com>
References: <cover.1717600736.git.thomas.lendacky@amd.com>
 <4c4017d8b94512d565de9ccb555b1a9f8983c69c.1717600736.git.thomas.lendacky@amd.com>
Content-Language: en-US
In-Reply-To: <4c4017d8b94512d565de9ccb555b1a9f8983c69c.1717600736.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v5 04/13] x86/sev: Perform PVALIDATE using
 the SVSM when not at VMPL0
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On 6/5/24 10:18, Tom Lendacky wrote:
> The PVALIDATE instruction can only be performed at VMPL0. An SVSM will
> be present when running at VMPL1 or a lower privilege level.
> 
> When an SVSM is present, use the SVSM_CORE_PVALIDATE call to perform
> memory validation instead of issuing the PVALIDATE instruction directly.
> 
> The validation of a single 4K page is now explicitly identified as such
> in the function name, pvalidate_4k_page(). The pvalidate_pages() function
> is used for validating 1 or more pages at either 4K or 2M in size. Each
> function, however, determines whether it can issue the PVALIDATE directly
> or whether the SVSM needs to be invoked.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>   arch/x86/boot/compressed/sev.c |  45 +++++-
>   arch/x86/include/asm/sev.h     |  26 ++++
>   arch/x86/kernel/sev-shared.c   | 250 +++++++++++++++++++++++++++++++--
>   arch/x86/kernel/sev.c          |  30 ++--
>   4 files changed, 325 insertions(+), 26 deletions(-)

Small fix on top of this patch for SVSM PVALIDATE support.

Thanks,
Tom

diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index b889be32ef9c..7933c1203b63 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -1360,15 +1360,12 @@ static u64 svsm_build_ca_from_pfn_range(u64 pfn, u64 pfn_end, bool action,
  	return pfn;
  }
  
-static void svsm_build_ca_from_psc_desc(struct snp_psc_desc *desc,
-					struct svsm_pvalidate_call *pc)
+static int svsm_build_ca_from_psc_desc(struct snp_psc_desc *desc, unsigned int desc_entry,
+				       struct svsm_pvalidate_call *pc)
  {
  	struct svsm_pvalidate_entry *pe;
-	unsigned int desc_entry;
  	struct psc_entry *e;
  
-	desc_entry = desc->hdr.cur_entry;
-
  	/* Nothing in the CA yet */
  	pc->num_entries = 0;
  	pc->cur_index   = 0;
@@ -1391,7 +1388,7 @@ static void svsm_build_ca_from_psc_desc(struct snp_psc_desc *desc,
  			break;
  	}
  
-	desc->hdr.cur_entry = desc_entry;
+	return desc_entry;
  }
  
  static void svsm_pval_pages(struct snp_psc_desc *desc)
@@ -1427,8 +1424,8 @@ static void svsm_pval_pages(struct snp_psc_desc *desc)
  	call.rax = SVSM_CORE_CALL(SVSM_CORE_PVALIDATE);
  	call.rcx = pc_pa;
  
-	while (desc->hdr.cur_entry <= desc->hdr.end_entry) {
-		svsm_build_ca_from_psc_desc(desc, pc);
+	for (i = 0; i <= desc->hdr.end_entry;) {
+		i = svsm_build_ca_from_psc_desc(desc, i, pc);
  
  		do {
  			ret = svsm_perform_call_protocol(&call);

> 
