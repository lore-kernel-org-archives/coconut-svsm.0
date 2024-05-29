Return-Path: <chuanxiao.dong@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id EDDE31C27CC
 for <svsm-devel@coconut-svsm.dev>; Wed, 29 May 2024 02:15:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716941716; x=1748477716;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5BDEsTm+07yqTb0DKK0C+PWPA1gC4eumNmHws/tarXs=;
 b=cGW4L0GpEcmUrGmXDVq2Hjf0+dxjHBYVmATxWumc2M+PolvBXtG0PsMe
 at/4FsaedWgtBqFUjrC9QbtNMVEJkdkLFZL+4sUP+Ey+CMLvqOfMtDZcu
 QAgMixXkmgMlrvVGqk2usLrYVJ2rbI6qdJs9kJdyaxQ4rY0gh4hCqUA54
 AGt9ijbh21nPi86S0tgBju7vROTAEXrvj6hO1VOe2uAcmsc3g+6smDrI1
 7iitCLJJtCNWPgtuwuyuQSkZY/p6PTG3vjla/6OHZEkT7NVi/B7fUxsEW
 bVp9x/q7ggRRB/a8pF0ReD/d55b4uvW66uYln4qTz8GRBMpFqkEGpjtbk w==;
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Date: Wed, 29 May 2024 00:15:11 +0000
Message-ID: <BL3PR11MB64589F48AB63EA77FD06CDB38DF22@BL3PR11MB6458.namprd11.prod.outlook.com>
References: <ZlY5A4N4S88FeFDQ@8bytes.org>
In-Reply-To: <ZlY5A4N4S88FeFDQ@8bytes.org>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] SVSM Development Call May 29th, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>

> -----Original Message-----
> From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of J?rg =
R?del
> Sent: Wednesday, May 29, 2024 4:05 AM
> To: svsm-devel@coconut-svsm.dev; linux-coco@lists.linux.dev
> Subject: [svsm-devel] SVSM Development Call May 29th, 2024
>=20
> Hi,
>=20
> Here is the usual call for agenda items for this weeks SVSM development c=
all. Please send me any
> agenda items you have in mind or raise them in the meeting. I have one it=
em for the list:
>=20
> 	* Update on my system call design work
>=20
> Details of the meeting (GMeet and Calendar links, meeting time) can be fo=
und in our governance
> repository at:
>=20
> 	https://github.com/coconut-svsm/governance
>=20
> The meeting will be recorded and the recording eventually published.

Hello, just wondering if the meeting minutes published at https://github.co=
m/coconut-svsm/governance/tree/main/Meetings are the recordings or there wi=
ll be video/sound recordings published at somewhere else?

Thanks
Chuanxiao
>=20
> See you all there.
>=20
> Regards,
>=20
> 	J=F6rg
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
