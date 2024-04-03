Return-Path: <jiewen.yao@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id C2B9E2818A2
 for <svsm-devel@coconut-svsm.dev>; Wed,  3 Apr 2024 13:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712145577; x=1743681577;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ShyCm8dDQsKZPuPpsHH9mTGpI036iJu2XbK/sOPv0gA=;
 b=RCHQQ/vvKX9h6Ey/RjVuDZs91nMkXWt2k7pOGG0xH6rVeNnh/gMseAoD
 k0/JWhz8Bk+Gc11uFxXRZ3H4m0OCO1lSB+YJ8mUch1OnCH8a8Uf3wA0Dv
 bOaS+uL3Hx2NzlfkIIwKv0NjzvqLELE7KjVp2dfepdyIEQs4jbJas30QS
 62HopdFZarPxTelgJvsitkQxnq1DVeilI05mlYo1j2bsrY8nbMsWkqAsc
 jMy0jVnxUwbm0QcXwI+SFscb621Uua7ptO5bJFDOU6Of1lYUllDWuBtN8
 Y4Dbz6u3n//LfpSMGDOV2iiXvbUX0xK/WQ3grCja5LHsMLMPhTQA3Xrda Q==;
From: "Yao, Jiewen" <jiewen.yao@intel.com>
Date: Wed, 3 Apr 2024 11:59:31 +0000
Message-ID: <PH0PR11MB5879CA2156D964F9A3808E038C3D2@PH0PR11MB5879.namprd11.prod.outlook.com>
References: <Zg07c6Y5a_Ak5oXs@8bytes.org>
In-Reply-To: <Zg07c6Y5a_Ak5oXs@8bytes.org>
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
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>

Hi Jorg
Probably you already notice that I have raised the question on vTPM interfa=
ce in coconut-svsm.

I have explained how we did the POC in a secure way for TD-partitioning wit=
h TPM CRB buffer.
Jeremi Piotrowski also explained the mechanism to expose vTPM through TPM C=
RB MMIO.
In Intel, we still don't understand why SVSM must use a specific vTPM proto=
col, but not use TCG defined TPM2 CRB buffer directly.

Unfortunately, it is hard for me to use "Google Meet", and probably I am no=
t able to join.
If possible, I hope we can continue the vTPM interface discussion in email =
before we make decision.

Thank you
Yao, Jiewen


> -----Original Message-----
> From: J=F6rg R=F6del <joro@8bytes.org>
> Sent: Wednesday, April 3, 2024 7:20 PM
> To: svsm-devel@coconut-svsm.dev; linux-coco@lists.linux.dev
> Subject: SVSM Development Call April 3rd, 2024
>=20
> Hi,
>=20
> Here is the usual call for agenda items for this weeks SVSM development
> call. My agenda so far is:
>=20
> 	* vTPM merge fallout
> 	* Security issue mitigations
>=20
> The items we can not cover during the meeting will be deferred to the
> next meeting.
>=20
> Please note that Europe is now also on summer time, so the meeting will
> be at its usual time spot again. The definitive time is always in the
> Google calendar I shared below.
>=20
> Details of the meeting (GMeet and Calendar links, meeting time) can be
> found in our governance repository at:
>=20
> 	https://github.com/coconut-svsm/governance
>=20
> The meeting will be recorded and the recording eventually published.
>=20
> See you all there.
>=20
> Regards,
>=20
> 	J=F6rg

