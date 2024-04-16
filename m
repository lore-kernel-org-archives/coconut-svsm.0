Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 6114A1C7949
 for <svsm-devel@coconut-svsm.dev>; Tue, 16 Apr 2024 08:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713247792; x=1744783792;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L+HPnGKiIsW2w+3stdhxWs3gx+UhDpnL1blpDqHShpE=;
 b=KNG4Oun0GjoHACPq1K6hdahv3BlzY55Xt4lOWjGgYF7XramcU8jYmukn
 fFG/78yY3Oju+KNmKrnEHJAhbms3w0I6bUSTfmh7Ula4B0IRyuLXQGW/c
 VPZKoSIZS9wh8+teoT+lqBXaO1pMDvQ82cPCFEeIgcAN1w8yaB/XxT+FH
 rqLX0pTit7HThDlcq/Lassy7+fn54+D9/Q4ZZGta3KqLa3gtaPFY/7aNN
 dX0Ek5ZgYEfu6Rk1GobgDe8orIQTHIynSxyDlrTn/H6M33wCLY0WszPQ+
 UuRJ5jfUz2jLBPZ176uxfeG53VPqQTyrn2OnFsieq90Z4G2UZlPmeQY9F Q==;
Date: Mon, 15 Apr 2024 23:09:33 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <661e161db9034_4d56129418@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1711405593.git.thomas.lendacky@amd.com>
 <67893f352bc54de61160bfe251cba0bdf0431f37.1711405593.git.thomas.lendacky@amd.com>
 <1f6f4477-0f2a-434a-8c89-3b5d51d61581@linux.intel.com>
 <19d69960-e548-a2e6-87d9-c463f2851613@amd.com>
 <e286883d-40ef-d749-26a8-7ec6fbd81eae@amd.com>
 <81d05bd9-ef8f-4a3a-a5df-384a82be49f5@linux.intel.com>
 <490a6a10-47d0-0689-432a-cbf22de11ad6@amd.com>
 <7e138229-24bf-447b-b8dd-5340eaa939fe@linux.intel.com>
 <eb745e16-b3eb-0e9c-59c8-45aa01244386@amd.com>
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb745e16-b3eb-0e9c-59c8-45aa01244386@amd.com>
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v3 13/14] x86/sev: Hide SVSM attestation
 entries if not running under an SVSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"

Tom Lendacky wrote:
> On 4/15/24 16:50, Kuppuswamy Sathyanarayanan wrote:
> > 
> > On 4/15/24 1:13 PM, Tom Lendacky wrote:
> >> On 4/15/24 14:48, Kuppuswamy Sathyanarayanan wrote:
> >>> Hi,
> >>>
> >>> On 4/15/24 12:16 PM, Tom Lendacky wrote:
> >>>> On 4/12/24 10:52, Tom Lendacky wrote:
> >>>>> On 4/9/24 13:12, Kuppuswamy Sathyanarayanan wrote:
> >>>>>> On 3/25/24 3:26 PM, Tom Lendacky wrote:
> >>>>>>> Config-fs provides support to hide individual attribute entries. Using
> >>>>>>> this support, base the display of the SVSM related entries on the presence
> >>>>>>> of an SVSM.
> >>>>>>>
> >>>>>>> Cc: Joel Becker <jlbec@evilplan.org>
> >>>>>>> Cc: Christoph Hellwig <hch@lst.de>
> >>>>>>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> >>>>>>> ---
> >>>>>>>     arch/x86/coco/core.c        |  4 ++++
> >>>>>>>     drivers/virt/coco/tsm.c     | 14 ++++++++++----
> >>>>>>>     include/linux/cc_platform.h |  8 ++++++++
> >>>>>>>     3 files changed, 22 insertions(+), 4 deletions(-)
> >>>>>>>
> >>>>
> >>>>>>
> >>>>>> Any comment about the following query? I think introducing a CC flag for this use
> >>>>>> case is over kill.
> >>>>>>
> >>>>>> https://lore.kernel.org/lkml/6b90b223-46e0-4e6d-a17c-5caf72e3c949@linux.intel.com/
> >>>>>
> >>>>> If you don't think TDX will be able to make use of the SVSM attribute I can look at adding a callback. But I was waiting to see if anyone else had comments, for or against, before re-doing it all.
> >>>>>
> >>>>
> >>>> What about something like this (applied on top of patch 13):
> >>>>
> >>
> >>>> diff --git a/include/linux/tsm.h b/include/linux/tsm.h
> >>>> index 27cc97fe8dcd..5aaf626d178d 100644
> >>>> --- a/include/linux/tsm.h
> >>>> +++ b/include/linux/tsm.h
> >>>> @@ -74,7 +74,20 @@ extern const struct config_item_type tsm_report_default_type;
> >>>>    /* publish @privlevel, @privlevel_floor, and @auxblob attributes */
> >>>>    extern const struct config_item_type tsm_report_extra_type;
> >>>>    +/*
> >>>> + * Used to indicate the attribute group type to the visibility callback to
> >>>> + * avoid the callback having to examine the attribute name.
> >>>
> >>> Checking the attribute name will give more flexibility, right? Since it is one time
> >>> check, it should not be costly, right?
> >>
> >> I thought about checking the name(s), but what if in the future another attribute is added, then you have to remember to update multiple places. This way you have an enum that represents the related attributes. Is there a
> > 
> > I think it depends on how you implement the visibility function. If the vendor driver allows all attributes by default and denies few selected ones, you don't have to update the vendor driver for all new attributes. Letting the vendor driver decide whether to support any new attributes makes sense to me.
> > 
> >> scenario where you would want to not hide all attributes that are related? String comparisons just seem awkward to me.
> >>
> >> I suppose the config_item and configfs_attr could also be supplied on the callback if that's a requirement.
> > 
> > 
> > I am ok with enum based checks. But lets see what others think. Personally I think checking config attr name is more flexible.
> 
> I think we can do both. Supply the enum, config_item and configfs_attr 
> and then the callback can decide using the enum and/or the attribute name.
> 
> It could be extended to the current extra attributes, too. The enum 
> could have a TSM_TYPE_EXTRA (for the privlevel, privlevel_floor and 
> auxblob) and allow those to be hidden as appropriate, too.
> 

I guess I should have read all feedback before supplying my own, but
looks like you arrived at the same result.
