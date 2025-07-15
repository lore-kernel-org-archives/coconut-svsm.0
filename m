Received: from CY4PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11020125.outbound.protection.outlook.com [40.93.198.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC21D2B9A4;
	Tue, 15 Jul 2025 17:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752599942; cv=fail; b=kOYPVqT07Fu6fD8S0g7/OUJOJdCOS2SYUSi4FX34vT45J3XuXEcAZ+MiBVBpTc9ZZtixIm4riS6qTPUb+lll1glWT0stko76CUcuUFQ75/187uyLtf1JfN2Rwlu9hBnDQIDT6Z0u7o1a6Pex+uSKwI2LKdCsmGyPcARMxgYMUVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752599942; c=relaxed/simple;
	bh=UFPWfWH0JEkIncIPZ+AXfFjKIlprPOI4KaNPHCG7zzI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gon0JIXd4R7NGh4Iq5W110ZiyjgkUKlZHZx7SAQsmgWI22BN/J0w+vha32miyWI91PuUb3DJI9nfMdWwzke7npKOBiDS9ugUI8qrsbwZM0fKGSn6SCPPTj54soKi8B5Sa+Vfzm+Sf4/8jBicXS+k07toZ8RHPSw2/Ado3tL4hYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=D8irNsXy; arc=fail smtp.client-ip=40.93.198.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="D8irNsXy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E24IPhNqgcgudSwYuJeKgd4fjEuwnsYLptVxU0lgbTVa1RsyZurwpJ5m0KhZzk7xOYhoN1K2JbtG/Aa60qofFG5o4nNCM70R24JqO7FpNbmshH5K8x+r1LeqE+FNkKdSYst9mMn556BWm8+3cfh1FY/GIcScbP3ByuleG+6DXJBklEee8GyLc5iR+/AbaYsL204gVkJNlLyIVJNrIcQQcijS8qrQ66qz9NSfeLxd4Y7+xs3vKnmJelDCbqRl/uAPRypyKD8qA6vYQT9K4idWFsfMUlKCbsHgF4FKI2AgvLbqwnmpyiXqupTHuGr07DqCGJ4FngjBI4Oia2Px8LwNig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhdULJ3sKeknpqdgEzSOJeGrtFb+FT+KSlSvgPdOXaE=;
 b=a78oZkAYEnTesbdU5+xOYp8dDYSF2+BfjBs3utTyGfEVvov59xX8oo7iI2sBS3qZhCqh7B/c4Dxn+AOkwz77S4s3Ndr97EN9YAV0IWoPEVUK/Qm974pruMemPRcBTtioWHTKwuIB0M5bNvl5XCR7OfCjy1s7JBiWhzn2x9QZoYygyJFJoOs90wMy9UKtBIm95dQVWcEreMlo+Kxqs/MPlVnrk2xQrD6A0cJd57LHlTCiFaMFpPt+ZVIB7M3LrHwGVRRw0PrEwObqYg1r2geMXlqbjT8jsgermGwmRrOxvyV1sM48/zMSgbWuxmE8rLrNz5ucNyfS6R5c3A82IUNV0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhdULJ3sKeknpqdgEzSOJeGrtFb+FT+KSlSvgPdOXaE=;
 b=D8irNsXyCsF/burWiAPgTk4F/ZdAwmz2MHgnGUQZbBUAfnA4VXW2iwQeX6hgXV3MRH4aTlFfiT47VQxBQLzCJshJneIJfZoNB6oEaUtj8yZLoq/LXnbtBdX/ciFlfXbJiQnishZ3ZDiBw3Dh+BXdEKRoLoYAP30/rDFMiv/UdgA=
Received: from CH8PR21MB5222.namprd21.prod.outlook.com (2603:10b6:610:262::21)
 by CH4PR21MB4195.namprd21.prod.outlook.com (2603:10b6:610:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.6; Tue, 15 Jul
 2025 17:18:57 +0000
Received: from CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d]) by CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d%3]) with mapi id 15.20.8943.012; Tue, 15 Jul 2025
 17:18:57 +0000
From: Jon Lange <jlange@microsoft.com>
To: Gerd Hoffmann <kraxel@redhat.com>
CC: "Relph, Richard" <richard.relph@amd.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?=
	<joro@8bytes.org>, "coconut-svsm@lists.linux.dev"
	<coconut-svsm@lists.linux.dev>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025
Thread-Topic: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025
Thread-Index:
 AQHb7L3M5qoEeBG1Ekqfci7NxD34MLQhxWqAgABllQCABIeyAIABmKGAgAAQi4CAATaQAIABOd1wgAIqLwCAAEBL8IAESZqAgABaFaCAAYBUgIAAI5lA
Date: Tue, 15 Jul 2025 17:18:57 +0000
Message-ID:
 <CH8PR21MB5222B62B2C78A098AE3D5946CA57A@CH8PR21MB5222.namprd21.prod.outlook.com>
References: <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
 <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
 <d579919f-6e66-4499-8634-e258af61c933@amd.com>
 <aq6225hfazqsbqgx6fhj2klst52wdfivfa6xj2ost65sg5fq2r@4yoqnv2tp5nm>
 <LV5PR21MB5210A051A344852EC30C089CCA48A@LV5PR21MB5210.namprd21.prod.outlook.com>
 <auq7txxlerpwzl542o6rkjams22cy6rb2xoi3f7lbej6u47svi@rto2jldlvxyh>
 <LV5PR21MB5210915F19D877E261E66ABACA4BA@LV5PR21MB5210.namprd21.prod.outlook.com>
 <axljobcnpe6oct5v7edaocroajirywcft5z6lgtnoh3s6tj2r6@cux7zhrgbqnc>
 <CH8PR21MB5222CC6DCC81B272390F4ABECA54A@CH8PR21MB5222.namprd21.prod.outlook.com>
 <757kuxy36oqteplwd3kussc73w6lqeidbu2rxmzladj3kio7ei@jider3lbnthf>
In-Reply-To: <757kuxy36oqteplwd3kussc73w6lqeidbu2rxmzladj3kio7ei@jider3lbnthf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=6a785a69-3f8b-4383-aeea-c31a092bc681;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-07-15T17:14:31Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR21MB5222:EE_|CH4PR21MB4195:EE_
x-ms-office365-filtering-correlation-id: 2d2ea519-3cff-4d3e-b0f2-08ddc3c3ae9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?C/EfLuvnUizl4g+qEtIbwxPOooTbnUfpxUbbNPCX2TU/s9F4I4Whwb0e40?=
 =?iso-8859-1?Q?gDCeNPUzZQNkTgI4oEwFn+xRrTRMhXTKqyQVlKAri2jBYGkXda7dP1jOf4?=
 =?iso-8859-1?Q?+3HG1VCOwAm1lfdfiKRTDKGK72VdJzBqz8J/HdnBGXn637uRxukEq6izky?=
 =?iso-8859-1?Q?WJAA3TlnsA2hUWK7qV+6ixd17LHhvRQc2ym7GHaqtJ1Bj9C6o1OzM4Qqnp?=
 =?iso-8859-1?Q?/Rjan/ZKl/x8Eij2TrnMuyhlsX8N8q4O7/BrdQzKJSpmTk1iu1QVAoTR+8?=
 =?iso-8859-1?Q?HojMv18p1A+/XGhgt6m96bLQIszbR6NOgq751i5/96RCqxt0WCFzL8s4sZ?=
 =?iso-8859-1?Q?WExXtmLluD41RQstYCst6RtHsVb4gJycug0bbsOIxTE1SqndGsJhBnFgXm?=
 =?iso-8859-1?Q?xyG8ykcH1MNBH/7JqpgoYRSff6DayUeS+j6oSnj87H0Ex3BYZGy1gMEw8O?=
 =?iso-8859-1?Q?gQQ4eqRHyzxHcMuqU3YlQO/leQbdveRdOYEA8rgBFQ+b+Dwm4pofB5AhzI?=
 =?iso-8859-1?Q?EUm+ytZNf5w8FjdCIyZzAnHPue6AFc8J/Ork17JEW1At3hJwqjjLLvlCex?=
 =?iso-8859-1?Q?yuYTPkCfepCZxACNADArSwyL+2+sWFFP7pSv85Uw+FtK+HIrMV61OWi/25?=
 =?iso-8859-1?Q?C3LlByPaOz/nZQL80rLMYmRGfUJQS5RMppbXVBsq0mK/y70yEGKRxDkcPe?=
 =?iso-8859-1?Q?Je+cce2KtePh8xwsrH0zbFh6b5Ft+FyC4z+NLjpGB2lWsxDYnlq0/feQU7?=
 =?iso-8859-1?Q?Y5yCcu/09EAi4VGmzO4QspjeTpam2wGU6JBT7U2DNMBsdxmvlJBqE0TV+v?=
 =?iso-8859-1?Q?aasFOhSXHvIeQDAhZ5QmS3Ta1IJQLGwnWNGSPTA8ncikFFCqqUKkuMaO8A?=
 =?iso-8859-1?Q?sEJzyqCufQ8xKzqF/l+xfSoOLtFEH2u8o83l8Do7gCGxc5cHXOyvxkajX3?=
 =?iso-8859-1?Q?NXwG2eF70nST8BdEcU8Gy1tOlKvaKBLEFduHk0aw2dwz3gvNuHQFWdvK16?=
 =?iso-8859-1?Q?mg1o7wKkm00ZtKYYoSKG0g+54WV1tZlt3PQVvjdqwRTY6ULyNGRS/D+6z6?=
 =?iso-8859-1?Q?NNP6wiK4vEVnH1u3xqV7O5tQu9hwI5zmLABPdVC3RuKc6Ymk4SiCqwA0Kn?=
 =?iso-8859-1?Q?ZNOjsgHs+CoVIreHA+TnWoh7Bq3JNkF/tkjU0kcRD0UXLTKgJITlDm5Qr8?=
 =?iso-8859-1?Q?Nio4OHCiggG2+SRFiMo7de32FXetkBSDUhk/wFx2Ho8/utoGrqi3940A5/?=
 =?iso-8859-1?Q?bQdV/49bDp/zdJbqtCgC06IdnjftgL7JSHDpQYxBRQnrDjN1+6N0xfmVDs?=
 =?iso-8859-1?Q?kRuN5M+rh82qhKM4GNDD1SsFJ/m6GbsJalfoK+quWZp8qq+Azomzbs68sd?=
 =?iso-8859-1?Q?AOW6Iw2sz5rT+FTHUSklmmB8z+PEj/kQG8GyOHev5QItBJY3FwLKwo5Tz8?=
 =?iso-8859-1?Q?k6LXl76w9+KQq3tzRukoQv6u/Vmoxd/cg/l5Laquliesk086qtr4cLDsJJ?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR21MB5222.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0XDL+Db+PlXCh9hns7JA9QbbmMvT5U4WNxY2k+oyE1/BEvdUgYyUxNNvuI?=
 =?iso-8859-1?Q?kWGWvxN5V5r43+bXVmjn5OqLD4euGid+wcsRCI0Qo/aA5y0RBVqkzZEivk?=
 =?iso-8859-1?Q?+fOj+xws36WiCIC2ieo4YfXoPb1x6zRHSEW8mBJw28FM4tS59b7rDf+x4P?=
 =?iso-8859-1?Q?mfi4QD06yrTtnBa4XZAehmq/+9jINE9r7/dq6nAuNpDzF5CyDKubHYXcES?=
 =?iso-8859-1?Q?g+UjL4M8Gp3e3S3NMQqlsFj1MibzPPx5UyOKyr5I3ZNyVFSBm77MgSV3y4?=
 =?iso-8859-1?Q?jz4JjYrX35VpILdauUmLXBpHMmHgY+v36yHtrkzv3KAj42nUn4xrm8VqM1?=
 =?iso-8859-1?Q?ODFkWK0alyKWTO+Z33+rEM2W87lyKZePGvracJ2DG3VwMadb4xM3SHSIgw?=
 =?iso-8859-1?Q?YawZB5CkljtGVz4TxDysGtjdML3AIPKIo00oM3xoAKZeym18OFrRtjYsmX?=
 =?iso-8859-1?Q?mFIhgMcPVcMN3MyykYdnyjz9RHaFeouUXKJYnpscS5d+Ms/OSE/TpjKm6n?=
 =?iso-8859-1?Q?VGt0FxVpEuHrl6duar/9S59Ug/u50xINxCwz+j0hVgkvGq0VLeIfMx5CVH?=
 =?iso-8859-1?Q?ijP9eT8KYs5tbLAgV8Aa6XKV71Ty6xS4jDDbeSsoq859p+D61f/w7WgK+A?=
 =?iso-8859-1?Q?p6e7/XSAd8mN2wu0jQmQrljAmK9G2V5OgTYBjI6LZOCIymX+bJ+sf80ysa?=
 =?iso-8859-1?Q?f7yYICYMFv+ktreJJwcSfeJmksOYWv/Gd3BrKEZH1miCdChKvKskmk2hie?=
 =?iso-8859-1?Q?c/7RlvXmLVFodn56nM4T4mdsV4UloTzaXjjgbkhdriYKBV4acD0UfuD/cF?=
 =?iso-8859-1?Q?J2iSKt6r6cr3CA3tG593vFaB3g+9Wh7AWiuSOqWGYusDjZO4YBn4PVVYRZ?=
 =?iso-8859-1?Q?yUsShtrR2ii+25KSxoGruh1Om8AJhKTGIq72aR8KDcZ0es3OAV5t00UkPI?=
 =?iso-8859-1?Q?4XU9xoVsFO0xApn6qz7aCoHgzOLDrLwgLokXIlHi6Dg/9ECw/R/abkB19L?=
 =?iso-8859-1?Q?RiQ97WhLso4UMifRYVBEVHodmhSfHHxoIsQe09oG3109ZQ5Y8vBifTCIwX?=
 =?iso-8859-1?Q?qcBMsibx3r1YXOsnUbi4VyUdfK2J7IbB+hnfbUscmx30DfX1QZoBwocNNG?=
 =?iso-8859-1?Q?bcXs+RH/9mU3NOJ0NYcgJrPxMChIUM7GQAFytLq1d0wAqtxsYHK0BpfEk5?=
 =?iso-8859-1?Q?OdVGnutGGZPvA+JZ0lZCoUC1XAhjrYWGQrJ6HHHiqY4jJgW8XMpDXK30oV?=
 =?iso-8859-1?Q?kj6yR1kaLeXBpWWeLib2Zid++DOMudCB4+lEa97tkY+AxUto2CaGuR5jDt?=
 =?iso-8859-1?Q?x6jgUmwobRGDgEh/tGTX0zMkXAbfT9t/SSdVruOqT84+fsbsm37OOzmZkW?=
 =?iso-8859-1?Q?m2uTnuwiZxdNYixmPyJmLFAdXkiE/pw3Ne42kyP3xQcq8k5uLMQqfs6why?=
 =?iso-8859-1?Q?BNpkU9xVMZtAu6Bi4ZKPa1HuPRz282Ci+/SEtxOU4inLS0BD5ZwRzA0q1m?=
 =?iso-8859-1?Q?CIVSDZdzEfFupyh7Z2njshXdgwXBE3THPmfxVqeMIuiFmXpMCOqWbCjhbM?=
 =?iso-8859-1?Q?twKO5gig5etKiTuKEz5yw19z2ZNXuSHpIeNgvmz48K4pY1f96P5KMrRscl?=
 =?iso-8859-1?Q?W76FgNqJHmd/A11EeHL+V9wdmbOn9Gn+fb?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2ea519-3cff-4d3e-b0f2-08ddc3c3ae9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 17:18:57.1779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cuPE2/h89BMpxSHdLpYX/dRK1o7UEAcVPALU/jAVFjMiHndQjtwooqbsEVfv0DxJ2onzURNPm2rXB4D/mtvwfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR21MB4195

> I see the point in having only one implementation for this instead of
> implementing this again and again for each platform supported.  But
> waiting for Intel until we move forward doesn't look attractive either.

We've discussed this topic in the Technical Steering Committee, and our per=
spective is that this work is critical but not urgent.  We are not aware of=
 any immediate use cases that would encourage us to create cross-platform d=
ivergence just for the sake of getting something built in the short term.  =
If you are aware of any use cases, please let us know.  I would guess that =
if we can demonstrate some good reasons to get this done soon, then some vo=
lunteers might emerge to help with the cross-platform concerns sooner rathe=
r than later, and if not, we can have a good discussion about the right set=
 of compromises.

-Jon

-----Original Message-----
From: Gerd Hoffmann <kraxel@redhat.com>
Sent: Tuesday, July 15, 2025 8:07 AM
To: Jon Lange <jlange@microsoft.com>
Cc: Relph, Richard <richard.relph@amd.com>; J=F6rg R=F6del <joro@8bytes.org=
>; coconut-svsm@lists.linux.dev; linux-coco@lists.linux.dev
Subject: Re: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025

On Mon, Jul 14, 2025 at 04:18:11PM +0000, Jon Lange wrote:
> > Huh?  I've assumed svsm protocols can work on TDX too.
>
> In the past, they have suggested that such a calling convention is not
> needed, because the L1 can trap and emulate calls (including TDCALL
> requests), but I think there is now an understanding that this is not
> sufficient.  However, I am not aware of any active work to define any
> type of L1/L2 calling convention.

Ok, so unclear at this point in time what will happen here.

> I also know that for this specific question (memory carveouts),
> Intel's proposed direction was not to rely on an L1/L2 calling
> convention, but instead to rely on having the L1 place tables into the
> address space of OVMF before it begins execution.  This, of course,
> would work equally well on SEV-SNP or any other model in which an
> SVSM-type environment can execute before the guest firmware.

Well, there is the TDX Virtual Firmware Design Guide:
https://cdrdv2-public.intel.com/733585/tdx-virtual-firmware-design-guide-re=
v-004-20231206.pdf

Section 4.2 "TD Hand-Off Block (HOB)" describes how information can be
passed from VMM to the firmware.  It's about EFI firmware running on TDX
directly, without SVSM, but I think the same should work for launching
EFI firmware under SVSM.

> I know that Intel began investigating this work but I don't know how
> far it's gotten.

This does NOT sound like Intel wants reuse the existing spec.  At the
same time it is totally unclear if and when we get more clarity here
from Intel.

Hmm.

I see the point in having only one implementation for this instead of
implementing this again and again for each platform supported.  But
waiting for Intel until we move forward doesn't look attractive either.

take care,
  Gerd

