Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id DF2431CA05D
 for <svsm-devel@coconut-svsm.dev>; Wed, 24 Apr 2024 17:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zLSYjw0FK+2RjD5YSIL8TRuugJd5EXzQpGHQo0AbJc=;
 b=3OEWoETGUg6QEFE+m8yZ9yDP1f7hOVoEhim0WzT5CbdxIaASnjgqAHbzocnXXmhW3GEmY0CiFWI7tbeCBFOnZJRVHvnJlQZoskf8vvFqn04aqbeQfpGGEmwcMdPvDx4LoY5qHH7SGQ0fVI/eFoMDT+mQjFC5ya4t3k7P9JCVd+U=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 24 Apr 2024 10:58:08 -0500
Message-ID: <53e67e416fb4da085f32d8a3626c5c6e656554f9.1713974291.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1713974291.git.thomas.lendacky@amd.com>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v4 12/15] fs/configfs: Add a callback to
 determine attribute visibility
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
 Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"

In order to support dynamic decisions as to whether an attribute should be
created, add a callback that returns a bool to indicate whether the
attribute should be displayed. If no callback is registered, the attribute
is displayed by default.

Cc: Joel Becker <jlbec@evilplan.org>
Cc: Christoph Hellwig <hch@lst.de>
Co-developed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 fs/configfs/dir.c        | 20 ++++++++++++++++++++
 include/linux/configfs.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index 18677cd4e62f..463e66258507 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -580,6 +580,7 @@ static void detach_attrs(struct config_item * item)
 static int populate_attrs(struct config_item *item)
 {
 	const struct config_item_type *t = item->ci_type;
+	struct configfs_group_operations *ops;
 	struct configfs_attribute *attr;
 	struct configfs_bin_attribute *bin_attr;
 	int error = 0;
@@ -587,14 +588,33 @@ static int populate_attrs(struct config_item *item)
 
 	if (!t)
 		return -EINVAL;
+
+	ops = t->ct_group_ops;
+	if (!ops) {
+		struct config_group *g = item->ci_group;
+
+		/*
+		 * No item specific group operations, check if the item's group
+		 * has group operations.
+		 */
+		if (g && g->cg_item.ci_type)
+			ops = g->cg_item.ci_type->ct_group_ops;
+	}
+
 	if (t->ct_attrs) {
 		for (i = 0; (attr = t->ct_attrs[i]) != NULL; i++) {
+			if (ops && ops->is_visible && !ops->is_visible(item, attr, i))
+				continue;
+
 			if ((error = configfs_create_file(item, attr)))
 				break;
 		}
 	}
 	if (t->ct_bin_attrs) {
 		for (i = 0; (bin_attr = t->ct_bin_attrs[i]) != NULL; i++) {
+			if (ops && ops->is_bin_visible && !ops->is_bin_visible(item, bin_attr, i))
+				continue;
+
 			error = configfs_create_bin_file(item, bin_attr);
 			if (error)
 				break;
diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index 2606711adb18..c771e9d0d0b9 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -216,6 +216,9 @@ struct configfs_group_operations {
 	struct config_group *(*make_group)(struct config_group *group, const char *name);
 	void (*disconnect_notify)(struct config_group *group, struct config_item *item);
 	void (*drop_item)(struct config_group *group, struct config_item *item);
+	bool (*is_visible)(struct config_item *item, struct configfs_attribute *attr, int n);
+	bool (*is_bin_visible)(struct config_item *item, struct configfs_bin_attribute *attr,
+			       int n);
 };
 
 struct configfs_subsystem {
-- 
2.43.2

