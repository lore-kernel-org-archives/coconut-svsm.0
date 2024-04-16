Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 277E11C790D
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 07:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713246377; x=1744782377;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n/cfkZ+paF4kOllDL4zziNwucxTSYvJXPwjbMiS8Ois=;
 b=d3HvsbNluNUPNCO7bMOfEGLa8fv0lwtz9kotkuZwPZAqB2/JuVFZHZOk
 1iANl+UZDU0m3vt5Orz+W1PE1gt+pOaReYrbirRF3EGHhqkeTZgE4vFb1
 BsVppr9ohgVdvMXzR5/Zm3A0/FvexZ8WS6wC0M+q8CeqXqR6X/FeVuzzN
 JvUXsHMYIp8fTDN88U7cF7u4eN8GO7H1xaO0gsCJTb3LV0PKvAU3AX7HN
 Ybe61S7exVZo62FbNgkJGAxNo3zDl1llFkH4BI+741evd6yjjI7pC6rJu
 mJ7Snj35HvGAG//D4ifkqfZ7iwA2VfurqZQ2JztBgvtsX9DvvvE+TbS4a g==;
Date: Mon, 15 Apr 2024 22:46:08 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <661e10a01f1d8_4d561294d0@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <e881a70fda1da98882241fc46fd57c3063fde55f.1711405593.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e881a70fda1da98882241fc46fd57c3063fde55f.1711405593.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 12/14] fs/configfs: Add a callback to
 determine attribute visibility
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>

Tom Lendacky wrote:
> In order to support dynamic decisions as to whether an attribute should be
> created, add a callback that returns a bool to indicate whether the
> attribute should be display. If no callback is registered, the attribute

s/display/displayed/

> is displayed by default.
> 
> Cc: Joel Becker <jlbec@evilplan.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  fs/configfs/file.c       |   7 +++
>  include/linux/configfs.h | 111 +++++++++++++++++++++++++++------------
>  2 files changed, 84 insertions(+), 34 deletions(-)
> 
> diff --git a/fs/configfs/file.c b/fs/configfs/file.c
> index 0ad32150611e..a976c183756c 100644
> --- a/fs/configfs/file.c
> +++ b/fs/configfs/file.c
> @@ -451,6 +451,9 @@ int configfs_create_file(struct config_item * item, const struct configfs_attrib
>  	umode_t mode = (attr->ca_mode & S_IALLUGO) | S_IFREG;
>  	int error = 0;
>  
> +	if (attr->is_visible && !attr->is_visible(item, attr))
> +		return 0;
> +
>  	inode_lock_nested(d_inode(dir), I_MUTEX_NORMAL);
>  	error = configfs_make_dirent(parent_sd, NULL, (void *) attr, mode,
>  				     CONFIGFS_ITEM_ATTR, parent_sd->s_frag);
> @@ -470,9 +473,13 @@ int configfs_create_bin_file(struct config_item *item,
>  {
>  	struct dentry *dir = item->ci_dentry;
>  	struct configfs_dirent *parent_sd = dir->d_fsdata;
> +	const struct configfs_attribute *attr = &bin_attr->cb_attr;
>  	umode_t mode = (bin_attr->cb_attr.ca_mode & S_IALLUGO) | S_IFREG;
>  	int error = 0;
>  
> +	if (attr->is_visible && !attr->is_visible(item, attr))
> +		return 0;
> +
>  	inode_lock_nested(dir->d_inode, I_MUTEX_NORMAL);
>  	error = configfs_make_dirent(parent_sd, NULL, (void *) bin_attr, mode,
>  				     CONFIGFS_ITEM_BIN_ATTR, parent_sd->s_frag);
> diff --git a/include/linux/configfs.h b/include/linux/configfs.h
> index 2606711adb18..c836d7bc7c9e 100644
> --- a/include/linux/configfs.h
> +++ b/include/linux/configfs.h
> @@ -116,35 +116,57 @@ struct configfs_attribute {
>  	const char		*ca_name;
>  	struct module 		*ca_owner;
>  	umode_t			ca_mode;
> +	bool (*is_visible)(const struct config_item *, const struct configfs_attribute *);
>  	ssize_t (*show)(struct config_item *, char *);
>  	ssize_t (*store)(struct config_item *, const char *, size_t);
>  };
>  
> -#define CONFIGFS_ATTR(_pfx, _name)			\
> +#define __CONFIGFS_ATTR(_pfx, _name, _vis)		\
>  static struct configfs_attribute _pfx##attr_##_name = {	\
>  	.ca_name	= __stringify(_name),		\
>  	.ca_mode	= S_IRUGO | S_IWUSR,		\
>  	.ca_owner	= THIS_MODULE,			\
> +	.is_visible	= _vis,				\
>  	.show		= _pfx##_name##_show,		\
>  	.store		= _pfx##_name##_store,		\

Shouldn't this operation live in configfs_group_operations? That would
mirror the sysfs organization, and likely saves some memory.
