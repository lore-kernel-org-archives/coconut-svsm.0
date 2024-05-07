Return-Path: <jlange@microsoft.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::701])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 45E841C2BDF
 for <svsm-devel@coconut-svsm.dev>; Tue,  7 May 2024 06:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVARwEXQKX3+sheCNPH157fyMSRtdYCBrSYrentZSX0=;
 b=Iyzuo3ieNXISlGYrQznjQ8oUuvUJZbsmrq+Yt1OWRwOaesHCO4h2gV0zwtVdkOmb1B1znOLVWgUaGMiCOLzV5GcSqewCgB81O3XuJOYydVNHEkX1OmNAcpbqtE+xIMUAJhGRd1UeJI/HpEeYUTDsWpN/JpW/WNyaHQ00wIrWA9E=
From: Jon Lange <jlange@microsoft.com>
Date: Tue, 7 May 2024 04:30:55 +0000
Message-ID: <DS7PR21MB352433BAB32AC9706B780910CAE42@DS7PR21MB3524.namprd21.prod.outlook.com>
References: <443d86bb-4915-44b0-8cef-93f1619cee2e@suse.de>
 <9693cc9c-80a6-45f4-9c4d-4bcc15ced56b@suse.de>
 <DS7PR21MB35244CC4F41EEEA0240F5E13CA1A2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <4f398d58-830f-405f-bca1-4a424bbe6d60@suse.de>
 <BL3PR11MB6458C36EE179B77E16D68E248D1F2@BL3PR11MB6458.namprd11.prod.outlook.com>
 <ZjS9aMGyuO0lpn-3@8bytes.org>
 <BL3PR11MB6458DDC4C9D6D3DD2D7E06F68DE42@BL3PR11MB6458.namprd11.prod.outlook.com>
In-Reply-To: <BL3PR11MB6458DDC4C9D6D3DD2D7E06F68DE42@BL3PR11MB6458.namprd11.prod.outlook.com>
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
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Cc: Thomas Leroy <tleroy@suse.de>, =?iso-8859-1?Q?Carlos_L=F3pez?= <clopez@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

My hope is that we can design the user/kernel virtualization ABI to include=
 MMIO primitives, such as "MMIO read requested" and "MMIO write requested".=
  These primitives would involve performing all of the instruction decoding=
 in kernel mode, so we can take advantage of a single instruction decoder, =
and that decoder would pass MMIO requests up to user mode.  For example, it=
 might say "vTPM driver: here is a CRB write at address X which contains va=
lue Y" or "hey virtual PCI driver: a request was made for config space at a=
ddress X; please supply value Y to return."  Note that in this model, all o=
f the register manipulation is also hidden in kernel mode so that the kerne=
l/user interface can be limited to address/value pairs for MMIO emulation. =
 This minimizes the amount of code that needs to be replicated across MMIO =
handlers and also minimizes the chattiness of the user/kernel interface.

-Jon

-----Original Message-----
From: Dong, Chuanxiao <chuanxiao.dong@intel.com>=20
Sent: Monday, May 6, 2024 7:16 PM
To: J=F6rg R=F6del <joro@8bytes.org>
Cc: Thomas Leroy <tleroy@suse.de>; Jon Lange <jlange@microsoft.com>; Carlos=
 L=F3pez <clopez@suse.de>; svsm-devel@coconut-svsm.dev
Subject: RE: [svsm-devel] [EXTERNAL] Re: x86 decoder further steps

[You don't often get email from chuanxiao.dong@intel.com. Learn why this is=
 important at https://aka.ms/LearnAboutSenderIdentification ]

> -----Original Message-----
> From: J=F6rg R=F6del <joro@8bytes.org>
> Sent: Friday, May 3, 2024 6:33 PM
> To: Dong, Chuanxiao <chuanxiao.dong@intel.com>
> Cc: Thomas Leroy <tleroy@suse.de>; Lange, Jon <jlange@microsoft.com>;=20
> Carlos L=F3pez <clopez@suse.de>; svsm-devel@coconut-svsm.dev
> Subject: Re: [svsm-devel] [EXTERNAL] Re: x86 decoder further steps
>
> On Fri, May 03, 2024 at 09:23:21AM +0000, Dong, Chuanxiao wrote:
> > We made a prototype
> > https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi
> > thub.com%2Fintel-staging%2Ftd-partitioning-svsm%2Ftree%2Fsvsm-tdp&da
> > ta=3D05%7C02%7Cjlange%40microsoft.com%7Cf0e2c42e6a3145645be208dc6e3bad
> > 57%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638506449805174183%7
> > CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I
> > k1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DX2f6LB0t03ylcyYKSqIKrgLgITQ
> > Aa4r%2BAQpFqCk0YbY%3D&reserved=3D0 which extended the coconut-SVSM to=20
> > support Intel TD partitioned guest.
> > It can decode and emulate some basic MMIO and String I/O=20
> > instructions used by the Linux guest. Currently it is part of TD=20
> > partitioned guest specific code, but if this code is also helpful to=20
> > the NAE events instruction as well, we can see how to integrate it=20
> > with the existing decoder?
>
> I agree with Jon that it is best to implement our own limited=20
> instruction decoder. This has security advantages as this decoder will=20
> be smaller than a more complete one we pull in, which is especially impor=
tant as instruction decoding will mostly be done in the SVSM kernel for per=
formance reasons.

As you know that, we are going to move parts of this prototype hypervisor c=
ode from SVSM kernel to the user space. So based on this,  seems this hyper=
visor can still decode instructions in the kernel. And completing the instr=
uction emulation, e.g., writing back the MMIO read result (generated by the=
 virtual device model) to the destination vcpu register or guest memory wil=
l also be done in the kernel mode, is this a correct understanding?

> So itegrating the MMIO and String I/O emulation support from the Intel=20
> branch into our own instruction decoder would be really great.
>
> Regards,
>
>       Joerg
