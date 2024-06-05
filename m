Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 4E5F31C7BE9
 for <svsm-devel@coconut-svsm.dev>; Wed,  5 Jun 2024 17:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97CFRtmVneyhtbBwUcNnRcQCwWEYI0vvcRSrjMKjYnU=;
 b=2JTuK3j1eYjgwGUBLSZ8dxf81huqo1ddvGQb6cIJluZ6hCtQukDQwR9gHAuedeXaAr2E3MZhVsI9YXN5axYlP+XYqkoVNjz8FKNKXs0hwPKV1nDXUj8lEQ+f2/KU/mcn7hZoAUcXS8z4OtJox7uNTOV/y6iu6NHUfFCnscv4Dwo=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 5 Jun 2024 10:18:44 -0500
Message-ID: <c4c33c0d07200164a3dd8cfd6da0344f57732648.1717600736.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1717600736.git.thomas.lendacky@amd.com>
References: <cover.1717600736.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v5 01/13] x86/irqflags: Provide native versions
 of the local_irq_save()/restore()
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

Functions that need to disable IRQs, but are common to both early boot and
post-boot execution, are unable to deal with paravirt support associated
with local_irq_save() and local_irq_restore().

Create native versions of these for use in these situations.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/include/asm/irqflags.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index 8c5ae649d2df..cf7fc2b8e3ce 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -54,6 +54,26 @@ static __always_inline void native_halt(void)
 	asm volatile("hlt": : :"memory");
 }
 
+static __always_inline int native_irqs_disabled_flags(unsigned long flags)
+{
+	return !(flags & X86_EFLAGS_IF);
+}
+
+static __always_inline unsigned long native_local_irq_save(void)
+{
+	unsigned long flags = native_save_fl();
+
+	native_irq_disable();
+
+	return flags;
+}
+
+static __always_inline void native_local_irq_restore(unsigned long flags)
+{
+	if (!native_irqs_disabled_flags(flags))
+		native_irq_enable();
+}
+
 #endif
 
 #ifdef CONFIG_PARAVIRT_XXL
-- 
2.43.2

