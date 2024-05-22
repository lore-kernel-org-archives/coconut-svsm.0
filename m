Return-Path: <bp@alien8.de>
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 243D51C6612
 for <svsm-devel@coconut-svsm.dev>; Wed, 22 May 2024 17:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1716391651; bh=OB6gaqSjxiAFW2RlpmSCnZD7Qhpu4drPtRMxzaVxZVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A8fJFvtaQXZh+IL0mQwaxVMveFNb0QaGouYARbnD32GFsrOSxHs2vSfrlSvWx8b3q
 8lGZBwsSfTj864KzXx/ix/EpMEfgk/n3juA6cjSkdyBf+id1aSxWyi8j3oIjWbeSNE
 cpCYADDFi2pVs5ywMf9m2E9QdQY5NER4FJnDXqa4t+tNnVN3Pz61c/dFlDY6ormuQa
 98znUkYr3r8VPxX1Pc7y+142KbgLiAuAq2UJsNC08fY+PyDsIs36f8bGSjl6UYCRVc
 j278zltej0G+BTKXXM7U7zLosQMjnK1c7/U+jBDXqU69V9LqNPFydqbeSs+ryv+Dhq
 9BysgszjnuutjF0s0gZeNyZMv9/RCs7Ej5R5iB4ega8J0ZLrVu8ojtE3VU9wQARuAB
 czOq3WxNbEuEbyV8kTylOrU/hHikgLwVXG/TKCShxqNwat1Aac6twPuYzpbHdzCL2r
 IKxAYL1MSZe4TMnZczgyFvjt3OnKc9U1CZHqab36ipRTvI3cQeu7D+w9FRDaL25tqZ
 jpWxJd2DSePTMNKR+dJS2k18uMiae1r3Gt6lfAu8/jo6Fq1/kZBpXQLn+vV3GWI4Jo
 USwLrSY/1tkfpdTWR84zycBGaOnwsuAkFue5w0hwMrZYb7GB4sFrD1DUXHOc9TFdeu
 bbY2n7Ph8A+OoBSJWeKq9mFg=
Date: Wed, 22 May 2024 17:27:12 +0200
From: Borislav Petkov <bp@alien8.de>
Message-ID: <20240522152712.GBZk4O0LIl2r0dH--H@fat_crate.local>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <6cf54cac47f212f4c2b59b123855d8c183989022.1713974291.git.thomas.lendacky@amd.com>
 <20240502093520.GRZjNeWLXU5j2UMOAM@fat_crate.local>
 <66928741-aa5c-4bbb-9155-dc3a0609c50a@amd.com>
 <20240517155858.GDZkd-wkWmYegos-eT@fat_crate.local>
 <f8a92b19-9090-40ea-c2cf-707005f583a5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8a92b19-9090-40ea-c2cf-707005f583a5@amd.com>
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
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

On Mon, May 20, 2024 at 08:57:43AM -0500, Tom Lendacky wrote:
> So this will be a new shared directory in the top level include directory
> (as PAGE_ALIGNED is defined in include/linux/mm.h), not just in the
> arch/x86/include directory like the others (io.h, msr.h and tdx.h). Is that
> what you want?

You can actually do this - it is a lot easier and still clean:

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index cb771b380a6b..5ee53a7a060e 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -12,7 +12,6 @@
  */
 #include "misc.h"
 
-#include <linux/mm.h>
 #include <asm/bootparam.h>
 #include <asm/pgtable_types.h>
 #include <asm/sev.h>
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index 46ea4e5e118a..bd4bbb30ef0c 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -1329,7 +1329,12 @@ static void __head setup_svsm_ca(const struct cc_blob_sev_info *cc_info)
 	vmpl = secrets_page->svsm_guest_vmpl;
 
 	caa = secrets_page->svsm_caa;
-	if (!PAGE_ALIGNED(caa))
+
+	/*
+	 * Open-code PAGE_ALIGNED() to avoid pulling in the world and
+	 * more by including linux/mm.h.
+	 */
+	if (caa & (PAGE_SIZE - 1))
 		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SVSM_CAA);
 
 	/*

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
