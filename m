Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11021086.outbound.protection.outlook.com [40.93.194.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E457464;
	Tue,  7 Oct 2025 02:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759803653; cv=fail; b=j0/06Xvxb+Z15dcjNY+oI7Apbt2bV4a89FJChnKhxQwOue56NVd4Z+gZvWDWFLV0TKU/xIBia7QseD2+0SE5y7Ltdr5u0T3zhrFSOdvVVohaDywQhx1hY0QrmYV5SSk38aE7h/ZaCPDV65EHMRSjMtGT+v7OLXEtWcGDsUxUT3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759803653; c=relaxed/simple;
	bh=ONNjftRtP32uu4iyDq49bq4UjbYhNPw35ObR1mMFg3A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pQDYX6KMyvNtFVFzCCQ9ty1q/jOeVUV31Ts0eEAnhS4KsQ5/AhhClDFJUMsKWY703mZtabqpQTiHRkvRpwsJHqnzyXhNgSZQD4wYQcntmm475CfaeJY9VovvktnJY6xlFSBI0QuO4aehYizUZoGn6R2awfsxl10NGCYulItZT+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=dkWcdqt+; arc=fail smtp.client-ip=40.93.194.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="dkWcdqt+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rL+1uBdvCicT4Z9CrSegobLfHGzF3pjzTT86BImTam9tojZ1gGwdCGAsYMJ+wve4WIGjEbIOGWQsZz7n0u9j5/HSJKtwWfWqMBYReLAvwzuQn+h/wK46RCnt/JAaHHKdMTa642/4Fir7u8Cd50zaaRsnYi6oxYPSi1B5SAef4lOkxXCdKYu5jAdgqp0N7i9CrwXroTQOD5+gvQy/hWVaGqJgMtt0TthqHpDRqz8VWlRI18v0se+jqI38MluNYO5D/D3CdokMBBHYrc1UUOvgWeQZZ7UwAwcoX6/tjLTcL/kmQ3/j/ilxDk6Dadq/XFH4u7L0ihUaHgX/M4yV1u8AXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+Onk7UFATga3zrDFff4iat4PfV9R/WP1iuEpg+L1Eo=;
 b=n8owvHLCNc8WSrIt2ViKqCzkZrCerSAxFZgh2Zp9OuiJER442gmNnqbemsETBzDWTp7BstgbS9faub6UYFb0auC4SPbBn4uxFCPLhuZ31U5Df2ZXfCaHZWBoLnfL9uUTOm/ig/tNHU7vwco81LsZyJJZmuBg42eVdmWEUXoHNPR8Ni87NThs6cs00mxe9JG802SZBrV2tMTM9Hj6IPnqIQ5lNvIRaBwq4ZtNzqz95O5ETXvFcgs8hSiBf9NzkvLBI+vq3lYc+1+Smk0qYi2AcvWuCdy6NeTQhTn4fEcn2Z9BxGZ6we+4d9Gjw7ZxuYxXoi/T3O50E+MjGbFPHZsgVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+Onk7UFATga3zrDFff4iat4PfV9R/WP1iuEpg+L1Eo=;
 b=dkWcdqt+eNKv3+RgxTM0ibol9S6Xg1uEWeVFhFth10EoDCRsJLW/F6+Y/wnv+vLta/2OvjOVrxoKFZ6H8Gc5OX7qAWYfTiTjvR1ktyXksZCDhKs0VAEJRhdsebOtsEIm9RAdbkR4a1D/VI3x5mQIcfe2+UtEl4G2NtlOQO+q9rM=
Received: from CH8PR21MB5222.namprd21.prod.outlook.com (2603:10b6:610:262::21)
 by CH8PR21MB5316.namprd21.prod.outlook.com (2603:10b6:610:272::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 02:20:48 +0000
Received: from CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d]) by CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d%5]) with mapi id 15.20.9203.007; Tue, 7 Oct 2025
 02:20:48 +0000
From: Jon Lange <jlange@microsoft.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, Nicolai Stange <nstange@suse.de>
CC: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"kraxel@redhat.com" <kraxel@redhat.com>, "Relph, Richard"
	<Richard.Relph@amd.com>, "Rodel, Jorg" <Joerg.Roedel@amd.com>, Melody Wang
	<huibo.wang@amd.com>, James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: RE: [EXTERNAL] Re: SVSM draft specification (v1.01 draft #3)
Thread-Topic: [EXTERNAL] Re: SVSM draft specification (v1.01 draft #3)
Thread-Index: AQHcNSDFaTKRonNYjkyYuGuNj7UBrrS1at4AgACJhxA=
Date: Tue, 7 Oct 2025 02:20:48 +0000
Message-ID:
 <CH8PR21MB522287B7C4739DD5AAC83B16CAE0A@CH8PR21MB5222.namprd21.prod.outlook.com>
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com> <87bjmmj4n2.fsf@>
 <8953f72f-edd2-edde-dc43-3782dbac8c16@amd.com>
In-Reply-To: <8953f72f-edd2-edde-dc43-3782dbac8c16@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=8de7b0ae-1d32-471e-8ce6-4b048d8a705d;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-10-07T02:08:52Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR21MB5222:EE_|CH8PR21MB5316:EE_
x-ms-office365-filtering-correlation-id: e029f5db-2be1-4453-446b-08de05482156
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4hQBNVv3cS7NXUiX/UwIiTrtiecgacb9AXtgp8hjlK7l8KIv024+CYpGSnxl?=
 =?us-ascii?Q?tSx60dp7YufubHsZltLvXvXJYqFJ5ZsnU8lMnQjVXTziOuS6MJOg1LoBakgt?=
 =?us-ascii?Q?1pWdy60DrGew4LmvSXVgFjrTjq3NmD/BgZKLLGkhF1L1GIEDXDPJAeP8NRBE?=
 =?us-ascii?Q?7HED+EKMNKLyBo5FFEvXshda6mOvT85OWLQHT6Tx6ux4Mn7bv6MvXlwsNL3Z?=
 =?us-ascii?Q?tmEBu/wvLUkOFAvGw2H2mlnb6roT0tida7xoUQl/uAExBu9FuSLJUszJtopd?=
 =?us-ascii?Q?i+zMWiF/biLvxdmYDl5m9yw1qudMjhBVHqBI8nZ5ThizpIJDsXWTo7RtB3t/?=
 =?us-ascii?Q?q48a5IJLXXTd79SD7g+Tg6nHjSa1YPhD7Lq/qtsKeUqSeBiPWsvI0Ja/1aSV?=
 =?us-ascii?Q?Nx2VgtXLTx+fR12QBVrbdFqJ/1nBxRvhiYLbRmQe8Wdo6gcS0ZjnzS6UVrk2?=
 =?us-ascii?Q?KmVN9ZYfRfk8cPEgQePyYm7Kx0DVVCqdwsbZ39WdxLZGGwtgPRfHdj3csO+o?=
 =?us-ascii?Q?ZHZfxCcZQnN+TbZjJmDLnF6zeHgLoIVJSe2p1oQfjLEZw1dcfTiK99WAlxtg?=
 =?us-ascii?Q?DpEvle4NOtPC+f21Vwe7uHap3a/w5xgS3QZunl1rx/FGOf7CQQKeBvIs3cde?=
 =?us-ascii?Q?zBtSb2AjnXqZX4971B7+m+uA4WiWpFddcamW83Mx055DMMMU7LVwHDCw6ISS?=
 =?us-ascii?Q?DByhktpZWuetUHxJVTRd6QVTPHSlZY0WWLr9HL7F/+XEUOMGZ0Xd2nwYTv5Y?=
 =?us-ascii?Q?E8FCG5JBbIcg1uMvqscB+5LaqaePiib2/C3q7k6enpazAQLN8R4PegvWtFyx?=
 =?us-ascii?Q?N8tpxALxhDQLOronju+arTdLh0clYP0Lsr/YHJxrfUyIa9z5nr8uCApfL3tU?=
 =?us-ascii?Q?Y5R4HeXM3w+RfxvTFECexHKK4iytguHuZSyiJ7tt/mGmUSrzysLXl6X/o6+9?=
 =?us-ascii?Q?igpyZr6RPuUinzF6ayipHFM9VZxZMB7ZYah9HS4SZFeHhIme6kxmuCoIZL3p?=
 =?us-ascii?Q?yUjZUJtaJ5g/rPzmZiCsbRyUVqGu82wPISNOQfiXLEQhXOhsq7LTHRaUpWj+?=
 =?us-ascii?Q?TgvEUEoaqRu9x7YO2SqhcLi905xOTJ6cr9v0XSQ+MgoPsmA5a61vkW5HSE3Z?=
 =?us-ascii?Q?IB4/12ci3P+mpqMOnCNbbtwWQ3cn8LzsYXQCZSCn8EwMNizRMWWWVJrF0rHa?=
 =?us-ascii?Q?6QFeU3jOTrEW+g/s91qLlMK5g3JDo33PnitOF+wuGbcHUJqdhPaOt3wpGfN6?=
 =?us-ascii?Q?PbNc2wC75nH9u2TM8IPq1YoA7jQfjj7dI8mDbtmIDUwj+V2SBapBU5P88azb?=
 =?us-ascii?Q?D7kxpdP7sY6Yg1xB5FVvWVY1X+CDLLZlMA+k9VrtgLeV15YtkZqSnDkjm6fv?=
 =?us-ascii?Q?UK93+kgxW/+4p1h3g/48ptH5MSIfoSnl0Tix/zYHhWnkuEMLfLGoLYy8oU6R?=
 =?us-ascii?Q?Tjbnz43AWc/QOFnur4bImKxfbmPpBt6OZl6q9TBd86I3LaQEImGD8I51vT5P?=
 =?us-ascii?Q?tBRp97vUDUqIw/8xXCH0LYXj15Nxq/YHygW0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR21MB5222.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HWtbNfXq1tK9qkP9ZnLfUEEIfGeHuq7sjdFjhSsofj2xok+AfgxTXxwq8+o+?=
 =?us-ascii?Q?glOjMUWjrfU49G+zFrTcXWmiHJT4/0KgIlXQqWvX4iOKxsQtchFI7hB47Urc?=
 =?us-ascii?Q?lWcKq1+Kz7HAajx4rOZumYvKsgGMU17m9yPRv0vcK6pVKI66atcpluZ/H2+z?=
 =?us-ascii?Q?fGclSWCUhxL7QIPgZ24xdYjo+vZhL/C0X9qMO7lhCmxLgtMjCcJ8fTSE9JpS?=
 =?us-ascii?Q?9avnRbuz4mIa5C8um0iNF/T6dRvNHi8CSSiAyiLVY4wTO/CBHYcJAG4B2bZw?=
 =?us-ascii?Q?z+k4ewS4WeHv+z+p31TNZTzZnz+t2QSS01NsCs487spmzZnfQZ+secXiVIWI?=
 =?us-ascii?Q?Y48DvnzsieGfM51yafqP4crOLqCkprqfZpHI6Ohwx8KegPp3KiHsbm0BeIEc?=
 =?us-ascii?Q?qjCV6aTRzLIRzShHTp8nSkVdpswWlDm+JdCu9W6mOn6NxhVl7gOUt9eY1wgz?=
 =?us-ascii?Q?8cbRx8G65GraeZOOr893jtMAh15d/H6ztYBPFSkBLXf64i36CcykCdzdXHnb?=
 =?us-ascii?Q?DPZFxprWM1TfNG/xlA3ga3cwt/cvATTO8ndagto1XtRclRRCBU921gxI9kcG?=
 =?us-ascii?Q?8RpbYEISqKqrjVYjFOivibJ5HfurY9ovH2IVybcQW75Ocz0xWBcMznjwvFmy?=
 =?us-ascii?Q?3jiYe7l4o3tYE1THcEo0W6fT1oeIOCsKouCK0+E5nfr6KoR4tfTV3Iju/R1B?=
 =?us-ascii?Q?sb00Bu+UZQkKbStLWW6FkTVY003eIrDwM+2Wymdbi8uNbC3ACMIpddbaRO0F?=
 =?us-ascii?Q?M7kg1P3swVn5eVMxlgMP3/thFfpZB9Qf7HYfpDNhECEeLsuZHiDTbdIEUhtZ?=
 =?us-ascii?Q?S9WdC+bzUVgfJnkro+5BknfXh8ZEt7c7AhmDJyYYjhMuSaa7tcSfpqx7K04T?=
 =?us-ascii?Q?/fENy9a5swKV4wXx4XBIi9XG3l4aFbgRNp/xfv2e4VMDIdNGIo8eG5tsqVfq?=
 =?us-ascii?Q?JtwR6p+9EmUYbW7lbzMdze2Y5Rvl9t8eKs2mGTFUey7xQ3SqcZ051fUwCnqP?=
 =?us-ascii?Q?QpB3L8WVqgVITQiV6pV4pm73ichPi5gyGDU6FAskKhMpGl+o1HHYaPxpJPzr?=
 =?us-ascii?Q?bQyDNasjweR/ORp6+BtqR846AEW0QEOhfBNshPTVOlIAp3u8hCQySTyvNYuR?=
 =?us-ascii?Q?7i1Hr9/sfio07kYr/vXIfQaKrdnmXzK0i0H960ZhfZW/H7RLMGUaZmELElyu?=
 =?us-ascii?Q?mJpHogH+oWLH39TN652bD3sJoxH6hn3ZXISABnZLDgIl1Q4i7kpM3R7lYBs4?=
 =?us-ascii?Q?6LQNZDnAxatiPXcDLZkYNJq1+rGKCirgCjZblDDzzUdyK8jEP1WKRfgPsThl?=
 =?us-ascii?Q?Yb/uycNuzrtDoJ9JiTw/xIt9L+39A9kBLiMd+sRo23Xq6bDgp9Vb8iDWSKW8?=
 =?us-ascii?Q?yhYIEpr51EK4+5NHQDNr+ne6dFUAakX7xyI/ULIDAP3qdLY3mvonMyRtxfSz?=
 =?us-ascii?Q?Xf/f0MhCQn2iLojxvkDnPzjyI6wd2rr93LFdIj/vxtgqqri9NLkMniZQGG1K?=
 =?us-ascii?Q?zjOAKSkmPOfKwemVI/RZ//UzvRkZUx9o9Smwcmwjb7cjo2QPKQT82if/myex?=
 =?us-ascii?Q?f0cRWpzWWVoeiovO3zVTwwmbZBaz3UXlYF/P7DJAGSGDCgIqdkwq9jKBlITR?=
 =?us-ascii?Q?EtpiqhLIIKuVpuMSaD1KJjZe4WmI3lIMNLofP96d5QEp?=
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
X-MS-Exchange-CrossTenant-AuthSource: CH8PR21MB5222.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e029f5db-2be1-4453-446b-08de05482156
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 02:20:48.7675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DjmNa5p4gSc3vaQsY5bHi9DwwqXmMl2rM8OjTCpmyBAqiwAJ5ZacUuunzuMZUNCWvFnRXznSQgGBE7F38Qib/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR21MB5316

Tom said something that concerns me greatly:

> Right, the base idea of a reboot would be that everything should appear a=
s if the guest was re-launched.

This is a great principle to state, but one that will almost certainly be u=
nable to make correct in the way the guest expects.  Because the SVSM does =
not restart, any code in the SVSM that must return to the reset state must =
implement explicit code to do so.  We could certainly define some sort of s=
ubscription mechanism that permits each running service to be advised when =
a guest reboot occurs, but it's up to each service to implement it correctl=
y.  Any service that fails to implement this correctly will violate the exp=
ectation of the guest.  If we had a bunch of existing code, it would be a l=
ost cause to audit 100% of it and confirm that it conforms to the reboot ex=
pectations.  We have at least a fighting chance given that we have very lit=
tle existing code, but declaring a requirement to new code to implement reb=
oot correctly doesn't mean that it's reasonable - or even possible - for ne=
w code modules to do so.

On top of that, remember that one goal of the COCONUT-SVSM project is to pr=
ovide cross-platform compatibility for any functionality that isn't coupled=
 to a single architecture.  There's nothing about reboot that is inherently=
 bound to SEV-SNP, so there will be an expectation that this can be support=
ed on Intel TDX or Arm CCA.  Both of those architectures implement one-way =
extensible measurement registers, and I fully expect that in the future, th=
e COCONUT-SVSM kernel will offer services to enable use of those measuremen=
t registers.  When such registers are used, it is impossible for the SVSM t=
o return to a reset state because the underlying platform doesn't permit an=
y rollback of measurement registers.  In fact, I wouldn't be surprised if A=
MD defines such registers in the future as well, so this may end up being a=
 universal problem.  I don't know how to reconcile "appear as if the guest =
was re-launched" with one-way extensible measurements.

We are defining the reboot protocol as its own protocol, with the ability t=
o define extensibility in any way we want.  I think we are going to be in a=
 much better position if we define reboot this way: (a) executing reboot re=
starts the guest but has no effect by itself on any other SVSM state, (b) t=
he reboot protocol is defined to offer extension points that permit other p=
rotocols to advertise whether they can participate in reboot, or whether th=
eir state persists across guest reboots, and (c) the guest must opt into se=
rvice resets for the set of services that it expects to reset, which of cou=
rse will be constrained by the set of services that support reset.  Such a =
design makes the operation of reboot entirely explicit, with no unpleasant =
surprises that arise because some SVSM service failed to implement reboot c=
orrectly - or failed to realize it was supposed to implement it at all.

-Jon

-----Original Message-----
From: Tom Lendacky <thomas.lendacky@amd.com>=20
Sent: Monday, October 6, 2025 10:57 AM
To: Nicolai Stange <nstange@suse.de>
Cc: coconut-svsm@lists.linux.dev; linux-coco@lists.linux.dev; Jon Lange <jl=
ange@microsoft.com>; kraxel@redhat.com; Relph, Richard <Richard.Relph@amd.c=
om>; Rodel, Jorg <Joerg.Roedel@amd.com>; Melody Wang <huibo.wang@amd.com>; =
James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [EXTERNAL] Re: SVSM draft specification (v1.01 draft #3)

On 10/4/25 06:19, Nicolai Stange wrote:
> Hi Tom,
>=20
> Tom Lendacky <thomas.lendacky@amd.com> writes:
>=20
>> Attached is the next version of the draft SVSM specification with the=20
>> following changes since the previous version:
>>
>>   - APIC emulation protocol added
>>     - Coconut-SVSM will need to be audited, as the current APIC emulatio=
n
>>       code does not completely match the "Alternate Injection Support"
>>       specification on which this protocol is based.
>>   - Reboot protocol added
>=20
> there's an ongoing discussion at GH ([1]) on how a reboot should=20
> interact with the _TPM_Init (think an emulated TPM power cycle) and=20
> that should probably get resolved before making the spec update effective=
.
>=20
> I'm trying my best to summarize the problem in what follows, James
> (CCed) might have some additional input.
>=20
> So, naively, a cold reset of the firmware, which qualifies as a reset=20
> of what's called the "Root of Trust for Measurement" (RTM) in TCG=20
> terminology, would require a reset of the TPM, i.e. to make it enter=20
> the _TPM_Init state, c.f. the TCG TPM 2.0 Library v184, part 1=20
> ("Architecture"), sec. 10.2.2 ("Initialization State"). Quote: "It=20
> should not be possible to reset the TPM without resetting the RTM. It=20
> should not be possible to reset the RTM without resetting the TPM."

Right, the base idea of a reboot would be that everything should appear as =
if the guest was re-launched.

>=20
> In particular, a reset of the TPM causes a reinitialization of all=20
> PCRs to their respective default values as defined in the platform=20
> profile (constant all-zeroes or all-ones in most cases).

Yes.

>=20
> At the current stage of the SVSM development, that's fine and could=20
> easily get implemented.
>=20
> However, James remarked in the course of the linked GH discussion that=20
> establishing such semantics now would prohibit us from letting the=20
> SVSM measure dynamic parts + configuration of itself into the TPM PCRs=20
> in the future. IIUC, the idea is to record standard TCG events=20
> capturing the dynamic aspects of the SVSM into the firmware's=20
> PCR-measured eventlog (for the firmware event log c.f. [2],=20
> EFI_TCG2_PROTOCOL.GetEventLog), which is quite appealing, because it=20
> would integrate transparently with existing workflows and tools like `tpm=
2_eventlog` etc..

Couldn't that be replayed by the SVSM into the TPM on "reboot?"

>=20
> So assuming we do not want to preclude the implementation of something=20
> like that in the future, the question is how to define interactions=20
> with the new `SVSM_REBOOT_EXECUTE` protocol command.
>=20
> From a high-level, AFAICT, we probably would have to
> a.) Convey all or a subsequence of the eventlog to the relaunched
>     firmware. If a subsequence, then that would have to contain all TCG
>     event records relevant to the SVSM's self-measurements.
> b.) Either do a "partial" TPM reset, making it to re-enter _TPM_Init,
>     but keep some subset of PCRs (*) at their current values in case the
>     full event log is conveyed, or do a full TPM reset and issue initial
>     PCR extends from the SVSM corresponding to the to be conveyed log in
>     case of a proper subsequence.
>=20
> The "relevant log subsequence" option is technically feasible in=20
> theory, but would require the SVSM to keep a log of its own events for=20
> the replay at firmware relaunch. James, who entered the GH discussion=20
> with a suggestion to hand the full log over with some mechanism=20
> resembling the one from Linux kexec warm reboots, later on mentioned=20
> some drawbacks with the approach of having the SVSM replay an=20
> internally stored log at firmware relaunch, please refer to [1] for detai=
ls.
>=20
> I myself don't have an opinion on the topic, but as a hand-over=20
> mechanism for the TCG event log would likely require support from the=20
> newly proposed `SVSM_REBOOT_EXECUTE` command, I wanted to make you=20
> aware of the pending discussion.

Maybe we need a QUERY command to determine if REBOOT is possible then.
If we add/have dynamic measurements but they can't be replayed back into th=
e TPM to present a "fresh" boot environment, then the QUERY command returns=
 an indicator that REBOOT is not possible.

Thoughts?

Thanks,
Tom

>=20
> Thanks!
>=20
> Nicolai
>=20
> [1]=20
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2Fcoconut-svsm%2Fsvsm%2Fpull%2F808%23issuecomment-3361113788&da
> ta=3D05%7C02%7Cjlange%40microsoft.com%7C111c90c2ab2f460b823608de0501b85f
> %7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638953702155666999%7CUnk
> nown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
> XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D6%2BQemUT
> nSthBlMW3HXDAkS%2BUkwBQMAjOhEQdZPsE5mo%3D&reserved=3D0
> [2]=20
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Ftrus
> tedcomputinggroup.org%2Fresource%2Ftcg-efi-protocol-specification%2F&d
> ata=3D05%7C02%7Cjlange%40microsoft.com%7C111c90c2ab2f460b823608de0501b85
> f%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638953702155682015%7CUn
> known%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOi
> JXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DWaLeG8dI
> QvXNaKB4Kvj%2BFedamG1XETV8SFj27u54ZE8%3D&reserved=3D0
>=20
> (*) Which one is not clear to me yet -- the obvious candidate is PCR[0]
>     and possibly some more, but there might be interactions with the
>     H-CRTM semantics, which require to initialize the PCR[0] differently
>     depending on whether the firmware issued a H-CRTM measurement
>     sequence before invoking TPM2_Startup() or not, c.f. TCG TPM 2.0
>     Library v184, part 1, ("Architecture"), sec. 32.3 ("H-CRTM before
>     TPM2_Startup() and TPM2_Startup() without H-CRTM").
>=20
>> Please review. If there are no or only minor comments, this draft=20
>> will become the next version of the specification.
>=20
