Return-Path: <chuanxiao.dong@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 5E80D1C0CFD
 for <svsm-devel@coconut-svsm.dev>; Tue,  7 May 2024 09:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715066658; x=1746602658;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s29HYOMUB/J9HPnZHRPTIwj91j16Fg557lCWe5pnDQs=;
 b=HIVu1T3Bq/UzOHGh1awMfvACeKjk1Eisgkc1Vsk616iecJJbTLJmMktp
 T9bW8Q/KazLyFMTVRmM6TtMT1V+BMeB2RJ8HE7cDzs31R+z5+LOFkRMSI
 b4IYGdSOh9UlOxGOT2oeEmSwSUr/eYvg6VifLvNGWBF0zQ7OMkfe4kdiY
 NDDAl7DllajkdVv8LBAaQCpcvS8AHZSRiF8AxeBMGoVndyAbEXsujyG9t
 8n7vjCYayEH3bg2LWnrM9bejKa9gd9ibimVOvsaLWGhCl/D7kksnp6Ek3
 KcPMP6jLZExgugJswrhP065NaAEIamLiDrEAk/mrjZvE6uH8Z/iNzgagW w==;
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Date: Tue, 7 May 2024 07:24:12 +0000
Message-ID: <BL3PR11MB6458A66FC02DE4AB0387A3458DE42@BL3PR11MB6458.namprd11.prod.outlook.com>
References: <443d86bb-4915-44b0-8cef-93f1619cee2e@suse.de>
 <9693cc9c-80a6-45f4-9c4d-4bcc15ced56b@suse.de>
 <DS7PR21MB35244CC4F41EEEA0240F5E13CA1A2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <4f398d58-830f-405f-bca1-4a424bbe6d60@suse.de>
 <BL3PR11MB6458C36EE179B77E16D68E248D1F2@BL3PR11MB6458.namprd11.prod.outlook.com>
 <ZjS9aMGyuO0lpn-3@8bytes.org>
 <BL3PR11MB6458DDC4C9D6D3DD2D7E06F68DE42@BL3PR11MB6458.namprd11.prod.outlook.com>
 <DS7PR21MB352433BAB32AC9706B780910CAE42@DS7PR21MB3524.namprd21.prod.outlook.com>
In-Reply-To: <DS7PR21MB352433BAB32AC9706B780910CAE42@DS7PR21MB3524.namprd21.prod.outlook.com>
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
To: "Lange, Jon" <jlange@microsoft.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Cc: Thomas Leroy <tleroy@suse.de>, =?iso-8859-1?Q?Carlos_L=F3pez?= <clopez@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>


> -----Original Message-----
> From: Jon Lange <jlange@microsoft.com>
> Sent: Tuesday, May 7, 2024 12:31 PM
> To: Dong, Chuanxiao <chuanxiao.dong@intel.com>; J=F6rg R=F6del <joro@8byt=
es.org>
> Cc: Thomas Leroy <tleroy@suse.de>; Carlos L=F3pez <clopez@suse.de>; svsm-=
devel@coconut-svsm.dev
> Subject: RE: [svsm-devel] [EXTERNAL] Re: x86 decoder further steps
>=20
> My hope is that we can design the user/kernel virtualization ABI to inclu=
de MMIO primitives, such as
> "MMIO read requested" and "MMIO write requested".  These primitives would=
 involve performing all
> of the instruction decoding in kernel mode, so we can take advantage of a=
 single instruction decoder,
> and that decoder would pass MMIO requests up to user mode.

I think it matches what I though. Below is my understanding, and please let=
 me know if this matches with your expectation or not.

The vmentry has to be happened in the kernel mode as executing the TDCALL i=
nstruction in user mode will cause #GP, so the user mode will use some sort=
 of syscall to enter the kernel mode to do the vmentry. Based on this, the =
kernel mode is the first place to reach upon a guest vmexit. After identify=
 the vmexit reason, the kernel mode can directly perform the instruction de=
coding if it is needed, and pass the decoded MMIO information (like below e=
xample) up to the user mode via returning from this syscall. And then the u=
ser mode performs MMIO emulation, as below example, to return value Y to th=
e kernel mode via the syscall when needs to  vmentry again. The kernel mode=
 completes the instruction emulation by writing the value Y to the decoded =
destination register or guest memory, and then performs the vmentry.

> For example, it might say "vTPM
> driver: here is a CRB write at address X which contains value Y" or "hey =
virtual PCI driver: a request was
> made for config space at address X; please supply value Y to return." Not=
e that in this model, all of the
> register manipulation is also hidden in kernel mode so that the kernel/us=
er interface can be limited to
> address/value pairs for MMIO emulation.  This minimizes the amount of cod=
e that needs to be
> replicated across MMIO handlers and also minimizes the chattiness of the =
user/kernel interface.
>=20
> -Jon
>=20
> -----Original Message-----
> From: Dong, Chuanxiao <chuanxiao.dong@intel.com>
> Sent: Monday, May 6, 2024 7:16 PM
> To: J=F6rg R=F6del <joro@8bytes.org>
> Cc: Thomas Leroy <tleroy@suse.de>; Jon Lange <jlange@microsoft.com>; Carl=
os L=F3pez
> <clopez@suse.de>; svsm-devel@coconut-svsm.dev
> Subject: RE: [svsm-devel] [EXTERNAL] Re: x86 decoder further steps
>=20
> [You don't often get email from chuanxiao.dong@intel.com. Learn why this =
is important at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> > -----Original Message-----
> > From: J=F6rg R=F6del <joro@8bytes.org>
> > Sent: Friday, May 3, 2024 6:33 PM
> > To: Dong, Chuanxiao <chuanxiao.dong@intel.com>
> > Cc: Thomas Leroy <tleroy@suse.de>; Lange, Jon <jlange@microsoft.com>;
> > Carlos L=F3pez <clopez@suse.de>; svsm-devel@coconut-svsm.dev
> > Subject: Re: [svsm-devel] [EXTERNAL] Re: x86 decoder further steps
> >
> > On Fri, May 03, 2024 at 09:23:21AM +0000, Dong, Chuanxiao wrote:
> > > We made a prototype
> > > https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
i
> > > thub.com%2Fintel-staging%2Ftd-partitioning-svsm%2Ftree%2Fsvsm-tdp&da
> > > ta=3D05%7C02%7Cjlange%40microsoft.com%7Cf0e2c42e6a3145645be208dc6e3ba=
d
> > > 57%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638506449805174183%7
> > > CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I
> > > k1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DX2f6LB0t03ylcyYKSqIKrgLgIT=
Q
> > > Aa4r%2BAQpFqCk0YbY%3D&reserved=3D0 which extended the coconut-SVSM to
> > > support Intel TD partitioned guest.
> > > It can decode and emulate some basic MMIO and String I/O
> > > instructions used by the Linux guest. Currently it is part of TD
> > > partitioned guest specific code, but if this code is also helpful to
> > > the NAE events instruction as well, we can see how to integrate it
> > > with the existing decoder?
> >
> > I agree with Jon that it is best to implement our own limited
> > instruction decoder. This has security advantages as this decoder will
> > be smaller than a more complete one we pull in, which is especially imp=
ortant as instruction
> decoding will mostly be done in the SVSM kernel for performance reasons.
>=20
> As you know that, we are going to move parts of this prototype hypervisor=
 code from SVSM kernel to
> the user space. So based on this,  seems this hypervisor can still decode=
 instructions in the kernel. And
> completing the instruction emulation, e.g., writing back the MMIO read re=
sult (generated by the virtual
> device model) to the destination vcpu register or guest memory will also =
be done in the kernel mode, is
> this a correct understanding?
>=20
> > So itegrating the MMIO and String I/O emulation support from the Intel
> > branch into our own instruction decoder would be really great.
> >
> > Regards,
> >
> >       Joerg
