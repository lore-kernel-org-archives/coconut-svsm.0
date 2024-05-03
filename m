Return-Path: <chuanxiao.dong@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 671B81C081C
 for <svsm-devel@coconut-svsm.dev>; Fri,  3 May 2024 11:23:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714728222; x=1746264222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V7GX7dlvM5CP3963ibC5vGUa4KXyosZ9nSdGcQQDxY0=;
 b=NCVjO+AxXjJQFHR5FeWfjxLo2sxgOew7rI+QVcieyWdQiF1Pwm/HDffJ
 bZzMCNf9CA7K/9kSZAKEF3tl3CQnw/2vnWcp8/uRIoHu7MCzTpr53re+F
 W96ipd2LV4pYF5m+VFoT3sTNeK1/61KOg+3YK8uxsnFV05+lX0SXLylce
 7/VthLLAEgvxu0War3cG0eQEdaCLbjATEHap9c/mQDvjx05GPlrJnYsEp
 xdLNmR3EWkNcNaMBYcPQBkwzIcjMQNtBthCZTKtIAMkzLjKgXZvWuMtBg
 JaDl/EpJb45HYbm6AqrXCp6h6Xti1DjUbmRscDvJ7+rK9MPgZeOF+CK4S A==;
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Date: Fri, 3 May 2024 09:23:21 +0000
Message-ID: <BL3PR11MB6458C36EE179B77E16D68E248D1F2@BL3PR11MB6458.namprd11.prod.outlook.com>
References: <443d86bb-4915-44b0-8cef-93f1619cee2e@suse.de>
 <9693cc9c-80a6-45f4-9c4d-4bcc15ced56b@suse.de>
 <DS7PR21MB35244CC4F41EEEA0240F5E13CA1A2@DS7PR21MB3524.namprd21.prod.outlook.com>
 <4f398d58-830f-405f-bca1-4a424bbe6d60@suse.de>
In-Reply-To: <4f398d58-830f-405f-bca1-4a424bbe6d60@suse.de>
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
To: Thomas Leroy <tleroy@suse.de>, "Lange, Jon" <jlange@microsoft.com>, =?iso-8859-1?Q?Carlos_L=F3pez?= <clopez@suse.de>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

> -----Original Message-----
> From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of Thoma=
s Leroy
> Sent: Thursday, May 2, 2024 9:34 PM
> To: Lange, Jon <jlange@microsoft.com>; Carlos L=F3pez <clopez@suse.de>
> Cc: svsm-devel@coconut-svsm.dev
> Subject: Re: [svsm-devel] [EXTERNAL] Re: x86 decoder further steps
>=20
>=20
>=20
> On 4/30/24 19:01, Jon Lange wrote:
> > As COCONUT-SVSM grows into additional configurations, it will become
> > necessary for the SVSM to emulate MMIO instructions on behalf of the
> > guest OS.  This will require instruction emulation as well.  It would
> > seem a poor choice to have two different instruction emulators for
> > handling #VC and guest instruction emulation.  At the same time, it
> > would be a poor choice to incorporate a fully functional instruction
> > emulator both because it would be big (which has impact both on
> > resources and attack surface) and because it would be excessively
> > flexible (which dramatically increases the possibility of
> > exploitation).  I expect the best strategy would be to continue to
> > expand the existing instruction emulator so it can handle decode of
> > the common MMIO-handling instructions, such as moves (including
> > 16-byte moves), common ALU operations (especially bitwise operations
> > like AND/OR/XOR/BTS/BTR as well as TEST, plus their atomic
> > equivalents), and others that may be determined through experimentati
>  on.  Limiting the scope of emulator capabilities in this way by expandin=
g the existing emulator should
> strike an appropriate balance between functionality and safety.
> I first thought that we could replace our naive decoder by a more complet=
e one, using a third-party crate to
> save time. As said Carlos, we could have only picked the decoder part of =
the iced-x86 crate to reduce the
> amount of code to import, leaving the emulation part to us.
> However, if we'll never need a much more complete decoder, I agree with y=
ou that it's better to add the
> missing NAE events instructions decoding
> + emulation to our existent #VC handling code.

We made a prototype https://github.com/intel-staging/td-partitioning-svsm/t=
ree/svsm-tdp which extended the coconut-SVSM to support Intel TD partitione=
d guest. It can decode and emulate some basic MMIO and String I/O instructi=
ons used by the Linux guest. Currently it is part of TD partitioned guest s=
pecific code, but if this code is also helpful to the NAE events instructio=
n as well, we can see how to integrate it with the existing decoder?

Thanks
Chuanxiao

>=20
> I'm not aware of any potential future needs for a complete decoder (not e=
mulator), but maybe some
> people here do. That was another purpose of my first email. :)
>=20
> Thomas
>=20
> --
> Thomas Leroy
> Security Engineer
> SUSE Software Solutions
>=20
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
