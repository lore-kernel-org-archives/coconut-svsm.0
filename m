Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id D26BC1C82D9
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 22:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713297844; x=1744833844;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0sIMIEA610kk/tFor5FPlu85UAO+Wb30TB2OEIaRzyA=;
 b=FW7NSN18WBDL8vVPLm+df/coA+uET+GrQXLbQEYyzZ8aYuzIB5/kSC2x
 rNoebe5XiYIS6awrFXEEe2DSU9p+hRkjIOj0Mw8ETKbWDhL/U/Q6k9UaP
 HKeST4JX/H33JQ4GfCiFR5NzY+DtT0cgTSTeHmev+UEPC7o15/ATN/rxL
 JKYqYp/tOdk0NbxvdOCRMM3Z1FIysFr+95P9zPI8SNQsDapM0ZiSh9uro
 /nr84qg+DeaYGFxSnuNDi9MI3SwwsWm1z/j/BHawkUve+yPegR2VD2Zo2
 bHzPBgHX37HrL49sZ0f/El3OQwY+gz1Tj8tHBxQMs3CjOqUsUsI5NU4T8 A==;
Date: Tue, 16 Apr 2024 13:03:51 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <661ed9a781e80_4d56129495@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <e881a70fda1da98882241fc46fd57c3063fde55f.1711405593.git.thomas.lendacky@amd.com>
 <661e10a01f1d8_4d561294d0@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <7fc4e7d4-dfa8-b626-76c7-1f8993304a2d@amd.com>
 <661ec2968fa55_4d56129470@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <3cb02504-4854-8bc6-7962-e590e656856d@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3cb02504-4854-8bc6-7962-e590e656856d@amd.com>
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
To: Tom Lendacky <thomas.lendacky@amd.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>

Tom Lendacky wrote:
> On 4/16/24 13:25, Dan Williams wrote:
> > Tom Lendacky wrote:
> >> On 4/16/24 00:46, Dan Williams wrote:
> >>> Tom Lendacky wrote:
> >>>> In order to support dynamic decisions as to whether an attribute should be
> >>>> created, add a callback that returns a bool to indicate whether the
> >>>> attribute should be display. If no callback is registered, the attribute
> > [..]
> >>>> Cc: Joel Becker <jlbec@evilplan.org>
> >>>> Cc: Christoph Hellwig <hch@lst.de>
> >>>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> >>>> ---
> >>>>    fs/configfs/file.c       |   7 +++
> >>>>    include/linux/configfs.h | 111 +++++++++++++++++++++++++++------------
> >>>>    2 files changed, 84 insertions(+), 34 deletions(-)
> >>>>
> > [..]
> >>>> diff --git a/include/linux/configfs.h b/include/linux/configfs.h
> >>>> index 2606711adb18..c836d7bc7c9e 100644
> >>>> --- a/include/linux/configfs.h
> >>>> +++ b/include/linux/configfs.h
> >>>> @@ -116,35 +116,57 @@ struct configfs_attribute {
> >>>>    	const char		*ca_name;
> >>>>    	struct module 		*ca_owner;
> >>>>    	umode_t			ca_mode;
> >>>> +	bool (*is_visible)(const struct config_item *, const struct configfs_attribute *);
> >>>>    	ssize_t (*show)(struct config_item *, char *);
> >>>>    	ssize_t (*store)(struct config_item *, const char *, size_t);
> >>>>    };
> >>>>    
> >>>> -#define CONFIGFS_ATTR(_pfx, _name)			\
> >>>> +#define __CONFIGFS_ATTR(_pfx, _name, _vis)		\
> >>>>    static struct configfs_attribute _pfx##attr_##_name = {	\
> >>>>    	.ca_name	= __stringify(_name),		\
> >>>>    	.ca_mode	= S_IRUGO | S_IWUSR,		\
> >>>>    	.ca_owner	= THIS_MODULE,			\
> >>>> +	.is_visible	= _vis,				\
> >>>>    	.show		= _pfx##_name##_show,		\
> >>>>    	.store		= _pfx##_name##_store,		\
> >>>
> >>> Shouldn't this operation live in configfs_group_operations? That would
> >>> mirror the sysfs organization, and likely saves some memory.
> >>
> >> I suppose it can, but then you lose the grouping of attributes within
> >> the same directory, right? A configfs group will result in moving the
> >> entries into a subdirectory, right? If we go with the group level, then
> >> we will be moving the existing TSM extra attributes and the new TSM SVSM
> >> attributes into new, separate sub-directories.
> > 
> > I am not following the concern about "losing the grouping"? Here is what
> > I was thinking with having the visibility routines in group operations.
> > This is just the broard strokes, it compiles, but still needs the finer
> > detail work to make tdx-guest skip all the attributes that do not apply
> > to it.  Might need to be broken up a bit more, but hopefully conveys the
> > idea. Does this address your grouping concern?
> 
> Yes and no. Basically the is_visible()/is_bin_visible() callback will 
> have to check every index value for a "group" against the passed in 
> value. I was trying to group the values together using an enum in order 
> to make it a bit easier and more readable in the callback. Adding 
> another attribute to the group requires updates in multiple places. But 
> thats just how I was looking at it. I can also see where you might want 
> to selectively hide/show entries and this method works well for that.
> 
> I'll follow this approach (add you as Co-developed-by: or Suggested-by:, 
> whichever you prefer) and submit a v4.

Sure, you can add:

Co-developed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>

...if you want to reuse any of this sample patch.
