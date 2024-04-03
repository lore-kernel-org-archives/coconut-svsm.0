Return-Path: <jiewen.yao@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 4D8CF281821
 for <svsm-devel@coconut-svsm.dev>; Wed,  3 Apr 2024 15:11:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712149901; x=1743685901;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Tc55D7xNe5h7CU6RbRSOIt3BOfeme8W1pBj8kRrtM/Q=;
 b=fgeJzn7VYUBdqyII1AE4aO4drlrxnUFoktbizrtBedMmZrXl2pammLDp
 dLFawMm1yZZ0v+lh8ACrM3/Mu0VKqe+4G3LxJMHth7H7P3JIFWQJYj6vI
 vkIKkXZhxLlVgNGY9EWnCBiyQOqx2/n/KlhAdRcFUyxDIl31L8caZp7Fl
 YB/HS2Tb6Ncmh051MNHSnPyMuBffjLHguPvvTLOUReFSdaIqKB890/nlq
 k4dmunmwS6YGFLDghZCqcPpROHyy7ebcfGhVBzixLCmfgPCuuvAEEiNC+
 jIq7pf4pm4EAAR2A198zCqMLyHSmwp1sk3e0uC07BTQYuxHfv+N9t0X22 w==;
From: "Yao, Jiewen" <jiewen.yao@intel.com>
Date: Wed, 3 Apr 2024 13:11:31 +0000
Message-ID: <PH0PR11MB587915ABDE162E557E5BD5B58C3D2@PH0PR11MB5879.namprd11.prod.outlook.com>
References: <Zg07c6Y5a_Ak5oXs@8bytes.org>
 <PH0PR11MB5879CA2156D964F9A3808E038C3D2@PH0PR11MB5879.namprd11.prod.outlook.com>
 <74ff4091f24370033a349b72ba222a30ed039b6f.camel@linux.ibm.com>
In-Reply-To: <74ff4091f24370033a349b72ba222a30ed039b6f.camel@linux.ibm.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] SVSM Development Call April 3rd, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>

Thank you to confirm that James.

Yes, I will sync internally to understand the process for submitting patch =
to coconut-svsm.

Thank you
Yao, Jiewen

> -----Original Message-----
> From: James Bottomley <jejb@linux.ibm.com>
> Sent: Wednesday, April 3, 2024 8:19 PM
> To: Yao, Jiewen <jiewen.yao@intel.com>; J=F6rg R=F6del <joro@8bytes.org>;=
 svsm-
> devel@coconut-svsm.dev; linux-coco@lists.linux.dev
> Subject: Re: SVSM Development Call April 3rd, 2024
>=20
> On Wed, 2024-04-03 at 11:59 +0000, Yao, Jiewen wrote:
> > Hi Jorg
> > Probably you already notice that I have raised the question on vTPM
> > interface in coconut-svsm.
> >
> > I have explained how we did the POC in a secure way for TD-
> > partitioning with TPM CRB buffer.
> > Jeremi Piotrowski also explained the mechanism to expose vTPM through
> > TPM CRB MMIO. In Intel, we still don't understand why SVSM must use a
> > specific vTPM protocol, but not use TCG defined TPM2 CRB buffer
> > directly.
>=20
> Nobody has said *must*.  The enlightened interface was designed after
> we had all the trouble with the CRB one outlined in the previous email
> thread, so that's what this pull request has.  However, this being open
> source nothing prevents you submitting a pull request for a functioning
> CRB interface if that's what you want.
>=20
> James

