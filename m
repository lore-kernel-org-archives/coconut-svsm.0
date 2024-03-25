Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 7207E1E260A
 for <svsm-devel@coconut-svsm.dev>; Mon, 25 Mar 2024 23:27:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN5QZrGS3+Cj+q5tlmfvaqsYgq1ZY9uSlVZFVWphlp0=;
 b=zzvXCRDMuVMEjcbzZm1/nlBNsa5Goq/34yVISYqC6wIGTGbOVIuX538+cv8pH5u0imKVjAhIh7XLkfiECRPoE2f15r1+YuSs8oJIK5TQfficK/iNtyExpzL5hwreZzOP5ctfP5onQg83R0PFwMQ6zJD1C9vDE9+M2mugNNMttas=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Mon, 25 Mar 2024 17:26:21 -0500
Message-ID: <1b0d8ec8e671ad957a2ad888725ce24edeedf74a.1711405593.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1711405593.git.thomas.lendacky@amd.com>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v3 02/14] x86/sev: Make the VMPL0 checking
 function more generic
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>
Content-Type: text/plain; charset="utf-8"

Currently, the enforce_vmpl0() function uses a set argument when testing
for VMPL0 and terminates the guest if the guest is not running at VMPL0.

Make the function more generic by moving it into the common code, renaming
it, allowing it to take an argument for use in the VMPL0 check (RMPADJUST
instruction) and return the result of the check, allowing the caller to
determine the action taken based on the result.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/boot/compressed/sev.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 5ad0ff4664f1..49dc9661176d 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -335,10 +335,9 @@ void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
 		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
 }
 
-static void enforce_vmpl0(void)
+static bool running_at_vmpl0(void *va)
 {
 	u64 attrs;
-	int err;
 
 	/*
 	 * RMPADJUST modifies RMP permissions of a lesser-privileged (numerically
@@ -347,12 +346,11 @@ static void enforce_vmpl0(void)
 	 *
 	 * If the guest is running at VMPL0, it will succeed. Even if that operation
 	 * modifies permission bits, it is still ok to do so currently because Linux
-	 * SNP guests are supported only on VMPL0 so VMPL1 or higher permission masks
-	 * changing is a don't-care.
+	 * SNP guests running at VMPL0 only run at VMPL0, so VMPL1 or higher
+	 * permission mask changes are a don't-care.
 	 */
 	attrs = 1;
-	if (rmpadjust((unsigned long)&boot_ghcb_page, RMP_PG_SIZE_4K, attrs))
-		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NOT_VMPL0);
+	return !rmpadjust((unsigned long)va, RMP_PG_SIZE_4K, attrs);
 }
 
 /*
@@ -588,7 +586,8 @@ void sev_enable(struct boot_params *bp)
 		if (!(get_hv_features() & GHCB_HV_FT_SNP))
 			sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SNP_UNSUPPORTED);
 
-		enforce_vmpl0();
+		if (!running_at_vmpl0(&boot_ghcb_page))
+			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_NOT_VMPL0);
 	}
 
 	if (snp && !(sev_status & MSR_AMD64_SEV_SNP_ENABLED))
-- 
2.43.2

