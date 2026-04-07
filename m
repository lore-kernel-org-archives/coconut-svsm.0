Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11020108.outbound.protection.outlook.com [52.101.85.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973DB278156;
	Tue,  7 Apr 2026 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775600673; cv=fail; b=qentS5J6GvSEO6KinObE0G777Oor5Z6P7fv/hFAmFUMH+YPhUu4nJmTUgFUO2ouEJ4w23xbJYOY3Z5m3fcp8u0j12friQ4w7bH5orLdJIa6BuhznIKVFA7bVc9YtAGJB9yZy02VOx/Q/Lgd+JBkoQacw4ySkbZQREv+3omD8VWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775600673; c=relaxed/simple;
	bh=Lr9nj/VydDjA+9uJ7LQMbMDWb9HW2obUS/WYCyM+Vac=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WeaOQoN1aqpU7Bz9l1RLahhsfH0pAhbp6/ZYRghLMMsGi7gNSF1+H2MQjWmVGuo+iFFGKylOqr4cWw8YPf5XQ7gBkQq3kYNMhzqEivcuyeDqgE6lpOS2oZesy3Cr+H76Toi72sgqVGmvLdDuUj3eUp+zpYBk7oBsvecudyIe3gA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=Gdu/klhC; arc=fail smtp.client-ip=52.101.85.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="Gdu/klhC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7kDB5qZITchJ53U01HEo9WupRYUJoe0NkA31sAR3X9s2DMdIFdt7bXAe0Qh3k9oCtWVPeqxYWv2MP2O2eJMHqHfC/MdojtB3f2DaLqu5NjrYCzF178SYpMerqf2QiFmf0/BcNmE+6ns+csPQRI1NtFwtdvwF7aIo7qZNKAmPhvyToRV+cR3vp3wbQq2UtmLfzt+0tz0TVW/RzhaFGCBaEB2kH+DzT/DxMXHL4JfNxtEX42i3uxQjeTxvoqYsK7WQpItAQl0HHyUuIGmytTJk8FIcY8oqU3lD84n1Wq+IwTpgMxeYsB3OWsWH3Hfs7vua8tMdqKfESrd3LI9/J5e4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGmnS+CC48jnAryUqlR8BMzYrtcXw8qbR+fBP4sfCG8=;
 b=MPATUYiwIIBtujrI4cDoPZZKmbFknaiAqIc+CKkV1MN6E3Uacbarw1/+rGZOJPaloORSey6h1uO/Qo+kNET2BvUpuhWVwFZ8JoiGa1hllTix+xTa5DUlxTfgo0BDo1k42wnHx+HySiILA4oRD9Z7xl3KzCYu9IkyfFhDDmmu3woxHCvy3Ebju4QTmjmC9IITyLAAO9erGMxyak23c5/J0DaYzwJn/o5204TVs6EmreU68XId9d4BE3N1sL0FGABQkKkov71X7N03ISySIw5C3s8YUTEDCqMS4d4QZ4qtlXMaHN87olBNYJYI+QGOLe/fXtV+ePr4wl95dEsdeKPsAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGmnS+CC48jnAryUqlR8BMzYrtcXw8qbR+fBP4sfCG8=;
 b=Gdu/klhCqVHgo6kUZm2OWf+giKJdRoFtOmCf5LolegbP1dD34Nzmbedzg8+q/wG/Rz7Bmbgt8Rw+JGgMutQ6dtMSVQAjeM0q4jYpE1E/jSWdXHSQO6A9YkJp4iZjmmkdQqrr1mWN8T+OyI2B8DCnedCw2pbLTBId342IZzCSxtg=
Received: from SA1PR21MB6416.namprd21.prod.outlook.com (2603:10b6:806:4b0::23)
 by SA1PR21MB6728.namprd21.prod.outlook.com (2603:10b6:806:4a4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.6; Tue, 7 Apr
 2026 22:24:30 +0000
Received: from SA1PR21MB6416.namprd21.prod.outlook.com
 ([fe80::25e7:ea96:64e7:bfc5]) by SA1PR21MB6416.namprd21.prod.outlook.com
 ([fe80::25e7:ea96:64e7:bfc5%4]) with mapi id 15.20.9769.014; Tue, 7 Apr 2026
 22:24:30 +0000
From: Jon Lange <jlange@microsoft.com>
To: Stefano Garzarella <sgarzare@redhat.com>, "coconut-svsm@lists.linux.dev"
	<coconut-svsm@lists.linux.dev>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: [EXTERNAL] SVSM Development Call April 8th, 2026
Thread-Topic: [EXTERNAL] SVSM Development Call April 8th, 2026
Thread-Index: AQHcxqy5cISnFTIBYUimz6BExm7eCbXULLyA
Date: Tue, 7 Apr 2026 22:24:30 +0000
Message-ID:
 <SA1PR21MB641678A2C7B15C5D408545B6CA5AA@SA1PR21MB6416.namprd21.prod.outlook.com>
References:
 <CAGxU2F6OApB3K61_sPujnvK_gx_K8zFWyOSTPV9mzWOCyNkBJg@mail.gmail.com>
In-Reply-To:
 <CAGxU2F6OApB3K61_sPujnvK_gx_K8zFWyOSTPV9mzWOCyNkBJg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=71b766de-0896-4b7c-977d-cbe76c136c11;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-04-07T22:22:38Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR21MB6416:EE_|SA1PR21MB6728:EE_
x-ms-office365-filtering-correlation-id: 6d6c42ba-ec5d-45b6-0c09-08de94f46ff9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 NGm8c+eDNDghQB/mlmtBbXmi/0KUdNIKT2gB7JW+xTwN+Vwoaan567urTiTq0JGGYR9jbnFVS0PswcLud5LbgLtYD+jWARvCkdB6GUgKGKB3CXTUQWNDDDxeZP7VHQDyTMWK5SrM/102wo+HQCC5Gin8O/WHJzWMBdSMB7xMfnEh092I5kQZWWSnrHIzAH7mi2opfQ/BTm3XAn8T+I1Hzzxt/fnVn5Zv1xv7DdUI2gtYmbvRZz6YsECQQD4fFYQy0L/vuk4fYcex5x/I/cwXBC1Ud4cF/3tm6mOz6Kj6xRur+MJ5RGI7m4SVatGzadFLkHclG7+5Y5NfGFh7naPH2DDhgweV8Dy/FHVVtwYbazW7M5WA9rFiFyMKMaHMS6uieC8diH35qAmmyJB97Ao2fn2JuGJK6UwkW9q5YQHWuwrc1kjBBYpDvIUabF7/lHx0VxzMMElg0NOUEQqpisekjHGzmvzcsvzfgSbPrWvDE0/388a1AwErOVHsPh58+nIIEBplFhtE3kNddxIvbQC7jYXFWGj71HjplkK1OUIpL+HKqo9DwhlqVeoHL9f++f9x6K6kAyqjaFjvxyCBfy2Wd2vb83beIy7YTQZse/3lag2W/7okpnoJ5w53Xvbl/AjH0BBeG7YsGARKY2W60m1MWTHy/zL4N0JRXeRdIApHPNsjvUFfw+ddsFEiOOsHhGRAc0140VjmmOCGUd0NtBpWZoBpwmwxNFieoe2qVF3D2+JZ4Mkdt89aYaABmY9FHvba2/81KgansOWkfOU+QuWQAFDcbT9D8wkYIcxI1tAliuc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR21MB6416.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AxnTtKqy8db/4e2vP3XASRP6j4rHWHeqIRC3ef/Jc5WsHHh10ldH6nQ15IOs?=
 =?us-ascii?Q?OKVHf/B1ZdMgG0pDDZv0S7RE/dDO3RYQ49Je8k23xzZHvkeJa8AlClImZCfS?=
 =?us-ascii?Q?mYj3lkzE5u7GAy2mxefheufdWDbxQbGRncrY9YRuE2V+ImzlmqEJyMmxU6Pw?=
 =?us-ascii?Q?1azSiB/0tWi3nHmF7tKsKk0ZHcwkmg4bbiWZFtW5sAHZyNqGPQRk1uHIdPBM?=
 =?us-ascii?Q?bkafxC7PE7yu7uA7VCTFS4/6Frrr59+DBSv1e0UTmMZr4GktBwuL/cBax+yr?=
 =?us-ascii?Q?zYMm78OXWS8stZbLFuS7sF5AZkTH6H+yBHAcSMYg6ZTa0YjlBhq5ooAKKS4i?=
 =?us-ascii?Q?wsn85Y0OiC9myVvW+yJGa6JlfCzqLxpMFgGD6IDe+HatH1ox6EDg4wFAsvNg?=
 =?us-ascii?Q?2OV1bByAw/zXqyZVPnYX6eBfmT3zO/3D15DEMjUA6FkU40MnsOJoz1uybmrO?=
 =?us-ascii?Q?4MbvTnPlB0ad0eCKehyucIsvWvlicUz/8PorUup+vEsv03oUgiG/XygCh916?=
 =?us-ascii?Q?Nx/kp+H089NBlsCqE3vO64EELpebP57ahRPiPHeSyDBfgDz9KDEnkLLrjO4U?=
 =?us-ascii?Q?DKJrB2tCH8xm0Om6Z5Rm9skfuXZDI2qQw+UPgpmEIil3u5I0WmOFnmF+l68j?=
 =?us-ascii?Q?6dTYj47fGRrt54fzaNL40f3zzLVJ/x25IUulCx8NbrHD4lSdPRabrgYn5+Ma?=
 =?us-ascii?Q?xx1nnjqwPpj735ifWstUmvNAxeqZiameKsk0Tt/8PgBEfupANzkQpXVsMZIP?=
 =?us-ascii?Q?by8dTIoJtNelreRHlnV0ON3KaMzAVFF/5aBNvOpOkCRwHSv/GGl4f9QH9gYm?=
 =?us-ascii?Q?x6dwyQ9PDlEK5h4sfFd4W5IRUQ3AWbamhlLYP0RhVlU6QoYKSRelF/nRs63y?=
 =?us-ascii?Q?UqqRKxfGWsqKiJCunGHxEjzXgqR+ZYLNOCEWR3jEYy4tBbOUzdmrArfgLVOq?=
 =?us-ascii?Q?8s5ElTO+83Y0OdHJnkautFTuSspJjkw3KchmmtdpiTSVTbRoYsNLYAVLrZKg?=
 =?us-ascii?Q?Shpgnqllo2UI66Slbr/J1RiJn8VM6zFRARcakV/cPRYtM359dgPEYGQM0wiI?=
 =?us-ascii?Q?tWhrAc2kCJ5jl/sJYVQzPQJ3jAbXJg822b0ij+cM88qzsB4N1eYxeyb6nVrq?=
 =?us-ascii?Q?8scUWBNAdK1vSDaaSORaPQyhCGQE2okbt3w/rP4TYCZiYep3thZuuP8KNi5h?=
 =?us-ascii?Q?KsIhIv21qHw6fkMLiMssBvVqIcaAGJS+FOuxE+I68qFl0LYOuihZgTvfLX3r?=
 =?us-ascii?Q?wOPwNz2FGA2K98iDoVpq4UadFsFON2gwxbm73ukU397oNNQ2TVb4jLT7fzlv?=
 =?us-ascii?Q?8jwjf3e/xJy344mKEsYjkqBV1QDbQP+4Hk/e98RzZTqoThVV3TeWIno5qWx7?=
 =?us-ascii?Q?wnoqatg2JcD/Gd2BEtHPQzbhxiZHkUI+f8PWr9l6GzdFAOIkuvTa3WYZgWrJ?=
 =?us-ascii?Q?Pdt4jK7HDttiyW+hXqOq7TzLNP1teJnZNtAXMAKCWxm44sZdoZHxxsimDgcA?=
 =?us-ascii?Q?ZnguQ8OORa6uDnzALKLygjoPU/g7LmSqwWmkzyQ0+nvMKXgqX4hl7+/VaEzB?=
 =?us-ascii?Q?GQASceATHUySMe6W6WyxXJo2qq1QNwaNQsu9AYjXAbKTBA8wRRZMYKAoi/xM?=
 =?us-ascii?Q?hg0OeuXpIaH6n9jRaOk1ujwmWoWicMtfvLvy3Sb6Nhd7LX+RAR5MQgMjZt9O?=
 =?us-ascii?Q?odO3+9K97eM8Lw0/DM5QvcbdayCNhUDcN/wfHoSU5nc47NfvWDfq8Sk8dCZy?=
 =?us-ascii?Q?2BICxraj4g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR21MB6416.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6c42ba-ec5d-45b6-0c09-08de94f46ff9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 22:24:30.4262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+7APr95lQWT5F/jub5kfvOx+1jIjmuEy1k5YOcxMzRWK9LtYz6sFoQlwphaK03aul0GP9RTbMpd+gStwjzJfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR21MB6728

> Here is the call for agenda items for this week's SVSM development
> call. Please send any agenda items you have in mind as a reply to this
> email or raise them in the meeting.

As a reminder, we previously scheduled an agenda top for this week to discu=
ss IGVM measurements.  The IGVM community is working on a plan to add CoRIM=
 support to the IGVM crate, which would include automatic generation of exp=
ected measurements.  It will be helpful to have a discussion among consumer=
s of IGVM measurements to ensure that the CoRIM work can account for the ne=
eds of the community.

-Jon
