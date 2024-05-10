Return-Path: <chuanxiao.dong@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id B40B21C27C2
 for <svsm-devel@coconut-svsm.dev>; Fri, 10 May 2024 13:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715340913; x=1746876913;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0GNz3WICCNefCOkA3AKxAQqvm3u6Oq6yM4wUj+etGAA=;
 b=oBFlaAX5uMP3/bysZV3OiAWcTGSA66c/p2/xFF4Jhee7u1xdU0wIcmWr
 QPdJP2hSxQonQ7EDhfB6CJGJI33uojaXbyQeYOB8APd9vwTzAFKtCYGD4
 MkX3bmzgWSHXCLyvQk6kplwzNYO0ut2+3qYY/tHfVdtT/gEV3z8YdlwUI
 t2WRD4WXrsBw9bPyMeAr0qfn+On7g2KjbuP+J64Tv9lG0MbS+D8zvNenl
 Xqg/e3Gajb0Ki0n8rwQ5F/9J2gQMal4uiBbfynMON+FyDf6q+e8Nn8RZM
 xr96gmEXk6FsLIdQRWgGSlSsiXd3vtCP/xjRIXbIINHWzAyBTR67JWuz2 w==;
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Date: Fri, 10 May 2024 11:34:45 +0000
Message-ID: <BL3PR11MB645875720DD2C67A2A0CB5FB8DE72@BL3PR11MB6458.namprd11.prod.outlook.com>
References: <443d86bb-4915-44b0-8cef-93f1619cee2e@suse.de>
 <9693cc9c-80a6-45f4-9c4d-4bcc15ced56b@suse.de>
 <DS7PR21MB35244CC4F41EEEA0240F5E13CA1A2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <4f398d58-830f-405f-bca1-4a424bbe6d60@suse.de>
 <BL3PR11MB6458C36EE179B77E16D68E248D1F2@BL3PR11MB6458.namprd11.prod.outlook.com>
 <ZjS9aMGyuO0lpn-3@8bytes.org>
 <BL3PR11MB6458DDC4C9D6D3DD2D7E06F68DE42@BL3PR11MB6458.namprd11.prod.outlook.com>
 <DS7PR21MB352433BAB32AC9706B780910CAE42@DS7PR21MB3524.namprd21.prod.outlook.com>
 <BL3PR11MB6458A66FC02DE4AB0387A3458DE42@BL3PR11MB6458.namprd11.prod.outlook.com>
In-Reply-To: <BL3PR11MB6458A66FC02DE4AB0387A3458DE42@BL3PR11MB6458.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] [EXTERNAL] Re:  x86 decoder further steps
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>, "Lange, Jon" <jlange@microsoft.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>


> -----Original Message-----
> From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of Dong,=
 Chuanxiao
> Sent: Tuesday, May 7, 2024 3:24 PM
> To: Lange, Jon <jlange@microsoft.com>; J=F6rg R=F6del <joro@8bytes.org>
> Cc: svsm-devel@coconut-svsm.dev
> Subject: Re: [svsm-devel] [EXTERNAL] Re: x86 decoder further steps
>=20
>=20
> > -----Original Message-----
> > From: Jon Lange <jlange@microsoft.com>
> > Sent: Tuesday, May 7, 2024 12:31 PM
> > To: Dong, Chuanxiao <chuanxiao.dong@intel.com>; J=F6rg R=F6del
> > <joro@8bytes.org>
> > Cc: Thomas Leroy <tleroy@suse.de>; Carlos L=F3pez <clopez@suse.de>;
> > svsm-devel@coconut-svsm.dev
> > Subject: RE: [svsm-devel] [EXTERNAL] Re: x86 decoder further steps
> >
> > My hope is that we can design the user/kernel virtualization ABI to
> > include MMIO primitives, such as "MMIO read requested" and "MMIO write
> > requested".  These primitives would involve performing all of the
> > instruction decoding in kernel mode, so we can take advantage of a sing=
le instruction decoder, and
> that decoder would pass MMIO requests up to user mode.
>=20
> I think it matches what I though. Below is my understanding, and please l=
et me know if this matches
> with your expectation or not.
>=20
> The vmentry has to be happened in the kernel mode as executing the TDCALL=
 instruction in user mode
> will cause #GP, so the user mode will use some sort of syscall to enter t=
he kernel mode to do the
> vmentry. Based on this, the kernel mode is the first place to reach upon =
a guest vmexit. After identify
> the vmexit reason, the kernel mode can directly perform the instruction d=
ecoding if it is needed, and
> pass the decoded MMIO information (like below example) up to the user mod=
e via returning from this
> syscall. And then the user mode performs MMIO emulation, as below example=
, to return value Y to the
> kernel mode via the syscall when needs to  vmentry again. The kernel mode=
 completes the instruction
> emulation by writing the value Y to the decoded destination register or g=
uest memory, and then
> performs the vmentry.

Some update, we will decouple the instruction decoder from the Intel branch=
 and try to integrate with the coconut-svsm existing one.

Please let us know if there is any further comment.

Thanks
Chuanxiao
>=20
> > For example, it might say "vTPM
> > driver: here is a CRB write at address X which contains value Y" or
> > "hey virtual PCI driver: a request was made for config space at
> > address X; please supply value Y to return." Note that in this model,
> > all of the register manipulation is also hidden in kernel mode so that
> > the kernel/user interface can be limited to address/value pairs for MMI=
O emulation.  This minimizes
> the amount of code that needs to be replicated across MMIO handlers and a=
lso minimizes the
> chattiness of the user/kernel interface.
> >
> > -Jon
> >
> > -----Original Message-----
> > From: Dong, Chuanxiao <chuanxiao.dong@intel.com>
> > Sent: Monday, May 6, 2024 7:16 PM
> > To: J=F6rg R=F6del <joro@8bytes.org>
> > Cc: Thomas Leroy <tleroy@suse.de>; Jon Lange <jlange@microsoft.com>;
> > Carlos L=F3pez <clopez@suse.de>; svsm-devel@coconut-svsm.dev
> > Subject: RE: [svsm-devel] [EXTERNAL] Re: x86 decoder further steps
> >
> > [You don't often get email from chuanxiao.dong@intel.com. Learn why
> > this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > > -----Original Message-----
> > > From: J=F6rg R=F6del <joro@8bytes.org>
> > > Sent: Friday, May 3, 2024 6:33 PM
> > > To: Dong, Chuanxiao <chuanxiao.dong@intel.com>
> > > Cc: Thomas Leroy <tleroy@suse.de>; Lange, Jon
> > > <jlange@microsoft.com>; Carlos L=F3pez <clopez@suse.de>;
> > > svsm-devel@coconut-svsm.dev
> > > Subject: Re: [svsm-devel] [EXTERNAL] Re: x86 decoder further steps
> > >
> > > On Fri, May 03, 2024 at 09:23:21AM +0000, Dong, Chuanxiao wrote:
> > > > We made a prototype
> > > > https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
F
> > > > gi
> > > > thub.com%2Fintel-staging%2Ftd-partitioning-svsm%2Ftree%2Fsvsm-tdp&
> > > > da
> > > > ta=3D05%7C02%7Cjlange%40microsoft.com%7Cf0e2c42e6a3145645be208dc6e3=
b
> > > > ad
> > > > 57%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638506449805174183
> > > > %7
> > > > CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
> > > > 6I
> > > > k1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DX2f6LB0t03ylcyYKSqIKrgLg=
I
> > > > TQ
> > > > Aa4r%2BAQpFqCk0YbY%3D&reserved=3D0 which extended the coconut-SVSM
> > > > to support Intel TD partitioned guest.
> > > > It can decode and emulate some basic MMIO and String I/O
> > > > instructions used by the Linux guest. Currently it is part of TD
> > > > partitioned guest specific code, but if this code is also helpful
> > > > to the NAE events instruction as well, we can see how to integrate
> > > > it with the existing decoder?
> > >
> > > I agree with Jon that it is best to implement our own limited
> > > instruction decoder. This has security advantages as this decoder
> > > will be smaller than a more complete one we pull in, which is
> > > especially important as instruction
> > decoding will mostly be done in the SVSM kernel for performance reasons=
.
> >
> > As you know that, we are going to move parts of this prototype
> > hypervisor code from SVSM kernel to the user space. So based on this,
> > seems this hypervisor can still decode instructions in the kernel. And
> > completing the instruction emulation, e.g., writing back the MMIO read
> > result (generated by the virtual device model) to the destination vcpu =
register or guest memory will
> also be done in the kernel mode, is this a correct understanding?
> >
> > > So itegrating the MMIO and String I/O emulation support from the
> > > Intel branch into our own instruction decoder would be really great.
> > >
> > > Regards,
> > >
> > >       Joerg
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
