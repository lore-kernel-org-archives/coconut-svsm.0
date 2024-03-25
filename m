Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 75D691E9836
 for <svsm-devel@coconut-svsm.dev>; Mon, 25 Mar 2024 23:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwHDeN04OmRtSSW0Zf1iHFTZa+AKo4apEWL7A8XQfoQ=;
 b=nyTlTE3dCS4ADJj95T+0025swyVzTcKe2JAGOTFDuO8/YIaWapK9u8ImgwKvoPGxdniXZwLvVaJVIAqMSefv226omljPWIloGqDJv06OGxd3L+rupE89DvHIts59Me8BuaaIQx95rrENSQjZA/DtXWOqMWnJKtdHPxzy+VGLZb8=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Mon, 25 Mar 2024 17:26:31 -0500
Message-ID: <e881a70fda1da98882241fc46fd57c3063fde55f.1711405593.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1711405593.git.thomas.lendacky@amd.com>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v3 12/14] fs/configfs: Add a callback to
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
attribute should be display. If no callback is registered, the attribute
is displayed by default.

Cc: Joel Becker <jlbec@evilplan.org>
Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 fs/configfs/file.c       |   7 +++
 include/linux/configfs.h | 111 +++++++++++++++++++++++++++------------
 2 files changed, 84 insertions(+), 34 deletions(-)

diff --git a/fs/configfs/file.c b/fs/configfs/file.c
index 0ad32150611e..a976c183756c 100644
--- a/fs/configfs/file.c
+++ b/fs/configfs/file.c
@@ -451,6 +451,9 @@ int configfs_create_file(struct config_item * item, const struct configfs_attrib
 	umode_t mode = (attr->ca_mode & S_IALLUGO) | S_IFREG;
 	int error = 0;
 
+	if (attr->is_visible && !attr->is_visible(item, attr))
+		return 0;
+
 	inode_lock_nested(d_inode(dir), I_MUTEX_NORMAL);
 	error = configfs_make_dirent(parent_sd, NULL, (void *) attr, mode,
 				     CONFIGFS_ITEM_ATTR, parent_sd->s_frag);
@@ -470,9 +473,13 @@ int configfs_create_bin_file(struct config_item *item,
 {
 	struct dentry *dir = item->ci_dentry;
 	struct configfs_dirent *parent_sd = dir->d_fsdata;
+	const struct configfs_attribute *attr = &bin_attr->cb_attr;
 	umode_t mode = (bin_attr->cb_attr.ca_mode & S_IALLUGO) | S_IFREG;
 	int error = 0;
 
+	if (attr->is_visible && !attr->is_visible(item, attr))
+		return 0;
+
 	inode_lock_nested(dir->d_inode, I_MUTEX_NORMAL);
 	error = configfs_make_dirent(parent_sd, NULL, (void *) bin_attr, mode,
 				     CONFIGFS_ITEM_BIN_ATTR, parent_sd->s_frag);
diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index 2606711adb18..c836d7bc7c9e 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -116,35 +116,57 @@ struct configfs_attribute {
 	const char		*ca_name;
 	struct module 		*ca_owner;
 	umode_t			ca_mode;
+	bool (*is_visible)(const struct config_item *, const struct configfs_attribute *);
 	ssize_t (*show)(struct config_item *, char *);
 	ssize_t (*store)(struct config_item *, const char *, size_t);
 };
 
-#define CONFIGFS_ATTR(_pfx, _name)			\
+#define __CONFIGFS_ATTR(_pfx, _name, _vis)		\
 static struct configfs_attribute _pfx##attr_##_name = {	\
 	.ca_name	= __stringify(_name),		\
 	.ca_mode	= S_IRUGO | S_IWUSR,		\
 	.ca_owner	= THIS_MODULE,			\
+	.is_visible	= _vis,				\
 	.show		= _pfx##_name##_show,		\
 	.store		= _pfx##_name##_store,		\
 }
 
-#define CONFIGFS_ATTR_RO(_pfx, _name)			\
+#define __CONFIGFS_ATTR_RO(_pfx, _name, _vis)		\
 static struct configfs_attribute _pfx##attr_##_name = {	\
 	.ca_name	= __stringify(_name),		\
 	.ca_mode	= S_IRUGO,			\
 	.ca_owner	= THIS_MODULE,			\
+	.is_visible	= _vis,				\
 	.show		= _pfx##_name##_show,		\
 }
 
-#define CONFIGFS_ATTR_WO(_pfx, _name)			\
+#define __CONFIGFS_ATTR_WO(_pfx, _name, _vis)		\
 static struct configfs_attribute _pfx##attr_##_name = {	\
 	.ca_name	= __stringify(_name),		\
 	.ca_mode	= S_IWUSR,			\
 	.ca_owner	= THIS_MODULE,			\
+	.is_visible	= _vis,				\
 	.store		= _pfx##_name##_store,		\
 }
 
+#define CONFIGFS_ATTR(_pfx, _name)			\
+	__CONFIGFS_ATTR(_pfx, _name, NULL)
+
+#define CONFIGFS_ATTR_RO(_pfx, _name)			\
+	__CONFIGFS_ATTR_RO(_pfx, _name, NULL)
+
+#define CONFIGFS_ATTR_WO(_pfx, _name)			\
+	__CONFIGFS_ATTR_WO(_pfx, _name, NULL)
+
+#define CONFIGFS_ATTR_VISIBLE(_pfx, _name, _vis)	\
+	__CONFIGFS_ATTR(_pfx, _name, _vis)
+
+#define CONFIGFS_ATTR_VISIBLE_RO(_pfx, _name, _vis)	\
+	__CONFIGFS_ATTR_RO(_pfx, _name, _vis)
+
+#define CONFIGFS_ATTR_VISIBLE_WO(_pfx, _name, _vis)	\
+	__CONFIGFS_ATTR_WO(_pfx, _name, _vis)
+
 struct file;
 struct vm_area_struct;
 
@@ -156,43 +178,64 @@ struct configfs_bin_attribute {
 	ssize_t (*write)(struct config_item *, const void *, size_t);
 };
 
-#define CONFIGFS_BIN_ATTR(_pfx, _name, _priv, _maxsz)		\
-static struct configfs_bin_attribute _pfx##attr_##_name = {	\
-	.cb_attr = {						\
-		.ca_name	= __stringify(_name),		\
-		.ca_mode	= S_IRUGO | S_IWUSR,		\
-		.ca_owner	= THIS_MODULE,			\
-	},							\
-	.cb_private	= _priv,				\
-	.cb_max_size	= _maxsz,				\
-	.read		= _pfx##_name##_read,			\
-	.write		= _pfx##_name##_write,			\
+#define __CONFIGFS_BIN_ATTR(_pfx, _name, _priv, _maxsz, _vis)		\
+static struct configfs_bin_attribute _pfx##attr_##_name = {		\
+	.cb_attr = {							\
+		.ca_name	= __stringify(_name),			\
+		.ca_mode	= S_IRUGO | S_IWUSR,			\
+		.ca_owner	= THIS_MODULE,				\
+		.is_visible	= _vis,					\
+	},								\
+	.cb_private	= _priv,					\
+	.cb_max_size	= _maxsz,					\
+	.read		= _pfx##_name##_read,				\
+	.write		= _pfx##_name##_write,				\
 }
 
-#define CONFIGFS_BIN_ATTR_RO(_pfx, _name, _priv, _maxsz)	\
-static struct configfs_bin_attribute _pfx##attr_##_name = {	\
-	.cb_attr = {						\
-		.ca_name	= __stringify(_name),		\
-		.ca_mode	= S_IRUGO,			\
-		.ca_owner	= THIS_MODULE,			\
-	},							\
-	.cb_private	= _priv,				\
-	.cb_max_size	= _maxsz,				\
-	.read		= _pfx##_name##_read,			\
+#define __CONFIGFS_BIN_ATTR_RO(_pfx, _name, _priv, _maxsz, _vis)	\
+static struct configfs_bin_attribute _pfx##attr_##_name = {		\
+	.cb_attr = {							\
+		.ca_name	= __stringify(_name),			\
+		.ca_mode	= S_IRUGO,				\
+		.ca_owner	= THIS_MODULE,				\
+		.is_visible	= _vis,					\
+	},								\
+	.cb_private	= _priv,					\
+	.cb_max_size	= _maxsz,					\
+	.read		= _pfx##_name##_read,				\
 }
 
-#define CONFIGFS_BIN_ATTR_WO(_pfx, _name, _priv, _maxsz)	\
-static struct configfs_bin_attribute _pfx##attr_##_name = {	\
-	.cb_attr = {						\
-		.ca_name	= __stringify(_name),		\
-		.ca_mode	= S_IWUSR,			\
-		.ca_owner	= THIS_MODULE,			\
-	},							\
-	.cb_private	= _priv,				\
-	.cb_max_size	= _maxsz,				\
-	.write		= _pfx##_name##_write,			\
+#define __CONFIGFS_BIN_ATTR_WO(_pfx, _name, _priv, _maxsz, _vis)	\
+static struct configfs_bin_attribute _pfx##attr_##_name = {		\
+	.cb_attr = {							\
+		.ca_name	= __stringify(_name),			\
+		.ca_mode	= S_IWUSR,				\
+		.ca_owner	= THIS_MODULE,				\
+		.is_visible	= _vis,					\
+	},								\
+	.cb_private	= _priv,					\
+	.cb_max_size	= _maxsz,					\
+	.write		= _pfx##_name##_write,				\
 }
 
+#define CONFIGFS_BIN_ATTR(_pfx, _name, _priv, _maxsz)			\
+	__CONFIGFS_BIN_ATTR(_pfx, _name, _priv, _maxsz, NULL)
+
+#define CONFIGFS_BIN_ATTR_RO(_pfx, _name, _priv, _maxsz)		\
+	__CONFIGFS_BIN_ATTR_RO(_pfx, _name, _priv, _maxsz, NULL)
+
+#define CONFIGFS_BIN_ATTR_WO(_pfx, _name, _priv, _maxsz)		\
+	__CONFIGFS_BIN_ATTR_WO(_pfx, _name, _priv, _maxsz, NULL)
+
+#define CONFIGFS_BIN_ATTR_VISIBLE(_pfx, _name, _priv, _maxs, _vis)	\
+	__CONFIGFS_BIN_ATTR(_pfx, _name, _priv, _maxsz, _vis)
+
+#define CONFIGFS_BIN_ATTR_VISIBLE_RO(_pfx, _name, _priv, _maxsz, _vis)	\
+	__CONFIGFS_BIN_ATTR_RO(_pfx, _name, _priv, _maxsz, _vis)
+
+#define CONFIGFS_BIN_ATTR_VISIBLE_WO(_pfx, _name, _priv, _maxsz, _vis)	\
+	__CONFIGFS_BIN_ATTR_WO(_pfx, _name, _priv, _maxsz, _vis)
+
 /*
  * If allow_link() exists, the item can symlink(2) out to other
  * items.  If the item is a group, it may support mkdir(2).
-- 
2.43.2

