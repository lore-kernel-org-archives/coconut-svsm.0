Return-Path: <dan.j.williams@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 2245B1CA2E7
 for <svsm-devel@coconut-svsm.dev>; Wed,  1 May 2024 22:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714594558; x=1746130558;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W67N1bupqopF4OdecuAxktFdND1r0HiFL7dPtxhiR64=;
 b=Vgj/nBN3xdSCI6/hnHdxOXBL7vgCRbgubCr9//GoPz5pjCeSgzgX0mRc
 yn88TC3aVxAEgkB779ydFC5w5HaEe5bpUbOaSEV/+ZJTbv4p6k0dmZQQR
 s1vv5vbE7MxEJaHBhuHTtSxvHNT9bmukE1WH4m9ZMZJcGBCKTgc9IZKd5
 fFki8Cl3ifmiLj8hFX8PnLiZPSD/EhtoWYi0BIFHtcA2p/2jrMZNXFBof
 sx7+jvU3Q51MSjHF5kIWbJh2nnkIGR3JRslYulyaUGaRvz1htBVngmKRt
 rqtupf6Ri+0MK8UBi2sbwDCqoX4RgsBtJ7EGKSoEyCyHZnLex/Xz4lcAA Q==;
Date: Wed, 1 May 2024 13:15:28 -0700
From: Dan Williams <dan.j.williams@intel.com>
Message-ID: <6632a2e0738d_1384629442@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.1713974291.git.thomas.lendacky@amd.com>
 <e3143c1f3d0b26fcd8884c6f75644b634a7138e8.1713974291.git.thomas.lendacky@amd.com>
 <CAC41dw-g2=jKkevGOJUqnzYTpxQ8+Z_JxnNNuoLR+CM_yqfRzA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC41dw-g2=jKkevGOJUqnzYTpxQ8+Z_JxnNNuoLR+CM_yqfRzA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [svsm-devel] [PATCH v4 13/15] x86/sev: Take advantage of
 configfs visibility support in TSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>

Kuppuswamy Sathyanarayanan wrote:
> On Wed, Apr 24, 2024 at 9:00 AM Tom Lendacky <thomas.lendacky@amd.com> wrote:
> >
> > The TSM attestation report support provides multiple configfs attribute
> > types (both for standard and binary attributes) to allow for additional
> > attributes to be displayed for SNP as compared to TDX. With the ability
> > to hide attributes via configfs, consoldate the multiple attribute groups
> > into a single standard attribute group and a single binary attribute
> > group. Modify the TDX support to hide the attributes that were previously
> > "hidden" as a result of registering the selective attribute groups.
> >
> > Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
[..]
> > + */
> > +enum tsm_attr_index {
> > +       TSM_REPORT_GENERATION,
> 
> Do we need an index for the generation attribute ? Since it is a core
> function, we can allow it by default.

That is up to the is_visible() callback to decide the declaration of
which index corresponds to which attribute is just static information.

> 
> > +       TSM_REPORT_PROVIDER,
> 
> Same as above.

These numbers need to match the array indices of tsm_report_attrs.

Your suggestion makes the declaration of tsm_report_attrs more
difficult:

 static struct configfs_attribute *tsm_report_attrs[] = {
    [TSM_REPORT_GENERATION] = &tsm_report_attr_generation,
    [TSM_REPORT_PROVIDER] = &tsm_report_attr_provider,
    [TSM_REPORT_PRIVLEVEL] = &tsm_report_attr_privlevel,
    [TSM_REPORT_PRIVLEVEL_FLOOR] = &tsm_report_attr_privlevel_floor,
    NULL,
 };

...because then the definition of TSM_REPORT_PRIVLEVEL would need to
know how many attributes precede it in the array. So, defining it this
way makes it more robust against future changes that want to
add/delete/reorder attributes in the array.

> 
> > +       TSM_REPORT_PRIVLEVEL,
> > +       TSM_REPORT_PRIVLEVEL_FLOOR,
> > +};
> > +
> > +/**
> > + * enum tsm_bin_attr_index - index used to reference binary report attributes
> > + * @TSM_REPORT_INBLOB: index of the binary report input attribute
> > + * @TSM_REPORT_OUTBLOB: index of the binary report output attribute
> > + * @TSM_REPORT_AUXBLOB: index of the binary auxiliary data attribute
> > + */
> > +enum tsm_bin_attr_index {
> > +       TSM_REPORT_INBLOB,
> > +       TSM_REPORT_OUTBLOB,
> > +       TSM_REPORT_AUXBLOB,
> > +};
> 
> Why differentiate between bin attr and regular attr? Why not use the same enum?

I do not understand your suggestion. There are two arrays:

 static struct configfs_bin_attribute *tsm_report_bin_attrs[] = {
       [TSM_REPORT_INBLOB] = &tsm_report_attr_inblob,
       [TSM_REPORT_OUTBLOB] = &tsm_report_attr_outblob,
       [TSM_REPORT_AUXBLOB] = &tsm_report_attr_auxblob,
       NULL,
 };

...so there are 2 sets of indices. If only one enum is used then one of
those arrays becomes sparsely populated causing the NULL array
terminator to pop up in unexpected indices.

> > +
> >  /**
> >   * struct tsm_ops - attributes and operations for tsm instances
> >   * @name: tsm id reflected in /sys/kernel/config/tsm/report/$report/provider
> >   * @privlevel_floor: convey base privlevel for nested scenarios
> >   * @report_new: Populate @report with the report blob and auxblob
> >   * (optional), return 0 on successful population, or -errno otherwise
> > + * @report_attr_visible: show or hide a report attribute entry
> > + * @report_bin_attr_visible: show or hide a report binary attribute entry
> >   *
> >   * Implementation specific ops, only one is expected to be registered at
> >   * a time i.e. only one of "sev-guest", "tdx-guest", etc.
> > @@ -56,14 +85,12 @@ struct tsm_ops {
> >         const char *name;
> >         unsigned int privlevel_floor;
> >         int (*report_new)(struct tsm_report *report, void *data);
> > +       bool (*report_attr_visible)(struct config_item *item,
> > +                                   struct configfs_attribute *attr, int n);
> > +       bool (*report_bin_attr_visible)(struct config_item *item,
> > +                                       struct configfs_bin_attribute *attr, int n);
> 
> I think we can use a single callback . We don't really gain anything
> with bin attr differentiation.

No, the goal here is symmetry with sysfs, and the arrays are separate so
the @n argument is a different index space. It also loses some type
safety for making sure that bin_attr callbacks can safely assume that
they were not passed a text attribute by mistake.
