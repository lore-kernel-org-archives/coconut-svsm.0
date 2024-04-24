Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id AD3CB1CA04E
 for <svsm-devel@coconut-svsm.dev>; Wed, 24 Apr 2024 17:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fvoIpw98EGryWgKZZYrMRJWz18TwCVHQc7OK/87QBM=;
 b=hY4JBgVWQ16yKsutxpLix2aTc/R+6xn27ZOoGZLzdQjVEEsTdXQGI6vDKkEKEBJi1Gl6nbhD4YWLWpJDaLxTWwxk4OFEPh/b3E9RymlFxrN5pbV3L19fYYnSgRsuw7ZNoU+4GNbggFKp6IlU3iqPKqne4Jrxyk57sXIA1XU/ro4=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 24 Apr 2024 10:57:57 -0500
Message-ID: <bc8d58302c6ab66c3beeab50cce3ec2c6bd72d6c.1713974291.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1713974291.git.thomas.lendacky@amd.com>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v4 01/15] x86/sev: Shorten
 snp_secrets_page_layout to snp_secrets_page
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

Ending a struct name with "layout" is a little redundant, so shorten the
snp_secrets_page_layout name to just snp_secrets_page.

No functional change.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/include/asm/sev.h              | 2 +-
 arch/x86/kernel/sev.c                   | 4 ++--
 drivers/virt/coco/sev-guest/sev-guest.c | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 7f57382afee4..48bc397db649 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -140,7 +140,7 @@ struct secrets_os_area {
 #define VMPCK_KEY_LEN		32
 
 /* See the SNP spec version 0.9 for secrets page format */
-struct snp_secrets_page_layout {
+struct snp_secrets_page {
 	u32 version;
 	u32 imien	: 1,
 	    rsvd1	: 31;
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 995f94467101..6949fbccec40 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -648,7 +648,7 @@ static u64 __init get_secrets_page(void)
 
 static u64 __init get_snp_jump_table_addr(void)
 {
-	struct snp_secrets_page_layout *layout;
+	struct snp_secrets_page *layout;
 	void __iomem *mem;
 	u64 pa, addr;
 
@@ -662,7 +662,7 @@ static u64 __init get_snp_jump_table_addr(void)
 		return 0;
 	}
 
-	layout = (__force struct snp_secrets_page_layout *)mem;
+	layout = (__force struct snp_secrets_page *)mem;
 
 	addr = layout->os_area.ap_jump_table_pa;
 	iounmap(mem);
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 87f241825bc3..04a7bd1e4314 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -59,7 +59,7 @@ struct snp_guest_dev {
 	 */
 	struct snp_guest_msg secret_request, secret_response;
 
-	struct snp_secrets_page_layout *layout;
+	struct snp_secrets_page *layout;
 	struct snp_req_data input;
 	union {
 		struct snp_report_req report;
@@ -743,7 +743,7 @@ static const struct file_operations snp_guest_fops = {
 	.unlocked_ioctl = snp_guest_ioctl,
 };
 
-static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno)
+static u8 *get_vmpck(int id, struct snp_secrets_page *layout, u32 **seqno)
 {
 	u8 *key = NULL;
 
@@ -897,8 +897,8 @@ static void unregister_sev_tsm(void *data)
 
 static int __init sev_guest_probe(struct platform_device *pdev)
 {
-	struct snp_secrets_page_layout *layout;
 	struct sev_guest_platform_data *data;
+	struct snp_secrets_page *layout;
 	struct device *dev = &pdev->dev;
 	struct snp_guest_dev *snp_dev;
 	struct miscdevice *misc;
-- 
2.43.2

