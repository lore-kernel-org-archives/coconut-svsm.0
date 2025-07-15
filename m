Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11020132.outbound.protection.outlook.com [52.101.85.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37F72701CC;
	Tue, 15 Jul 2025 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752613234; cv=fail; b=D+TxAx/XNbcZA3VnGSccjROVLypefkF6KynxvN41T0ItXAp/V0WkPEUu5W/p5hRQwi5v7rKBhTo5AREnr0ZnDkMVhuGjk9Pw3ZJIVl/vSOnRIIaNUZ3S6YK61gnQiz50ygwEdBg6hOSgSxdpVd1cLrtex1HtCqZt5drL2g7k16M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752613234; c=relaxed/simple;
	bh=iG5HXn54BRDOaBKbOmsDhs2K4VIWK2yDIpPxb1stfLk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UdwIHi8C/pG3U5OocFAOyxHbcrKoXZfNhop3bsjB9fEfe8Akew58PmsGf0sJUQF8/fS1imd7zKQrX7pz+23oFkI8LGK4xyqPviUHCVgSfV97pFW+Bp4s4WRXINZxfnoTpaP4sWCA6jTt2wrwAEf/0RvAvsWaBBE9aS2KFWRZSpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=VxrRf6ZA; arc=fail smtp.client-ip=52.101.85.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="VxrRf6ZA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwxD2xWw3NPZW0P4UbsGbk4gIkIEhz3/mTDcdWQEm2aiLDQ7bbZeodNzMW7jLRRBXjr3uEkv2flkJoHv6e66zCwr589greuFo5QkWIB7HqS6vT5k1LDURw3BrqWzzM7Ic5mMKS1tE0aOBdwjqrJr5hYpzgPZssCpUj0k2fgRUGN6Za1zEXy13Z7Ju4ou+bZxlYlNyz4njno/8TC10na3AG79GWxqKfsiWuh6HmpLIHnUa5omxl2UmZ/YDGMvSC9InR90JV6MGj8HWFsWyb/YtdQyb4RU5ph8M3xIP+rA784GuQkg9XL5Ea8juNEEUXcEKR0WOl5Ay0dia8XgHZPKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyH7aPiZXuZ/sGYRN89FbUOV62+2unljNK4UO1Zejpw=;
 b=Gw/A6LWsiljyeB0orqOECG3DX8QpwBrA+he+Ai72MM+qq1wqQUq/F4vMXdCpJxQwwYyM7V8gQ1Wa9Qo3uxP+HvrEjkJvRO9pIf0HOkwVCOUW6tpncMkl1N7VcYgOTbY8BpmzOU2sqT0z41bErvIp205sPRnQyWRXooUAZot+U3yR+xfyS4XcTozvHcnjb4vzMobzlBfDbOZDNwHIzKtUlCpCMhX87kPYUZyHXTAqbVskdQjgCnKGoqEX6KFVUF3Dy24XA5l/jdCQo3fsDHIiatEn9WskVQocg6fzHiUpkaDIn7l6UaZ7pl9TXKg1NnM2vJ12b4Zga5kcwoRknx5mOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyH7aPiZXuZ/sGYRN89FbUOV62+2unljNK4UO1Zejpw=;
 b=VxrRf6ZA+onOHSBGFLxxJTEGPj44V0SI502SZhSTnUf3xJZDQ/XihiT3y4uysuX7T2E3WScZ+VDsuSLs4tSsafG4jo6RbOt8wEdvJkAuW/p199vYBsJUi9svR+V8doC8Y8aYLwds9QvIWkC5OfhT9R8hoK6obPLn82FWvwDo+hk=
Received: from CH8PR21MB5222.namprd21.prod.outlook.com (2603:10b6:610:262::21)
 by CH8PR21MB4692.namprd21.prod.outlook.com (2603:10b6:610:272::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.6; Tue, 15 Jul
 2025 21:00:29 +0000
Received: from CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d]) by CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d%3]) with mapi id 15.20.8943.012; Tue, 15 Jul 2025
 21:00:29 +0000
From: Jon Lange <jlange@microsoft.com>
To: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: SVSM Development Call July 16, 2025
Thread-Topic: SVSM Development Call July 16, 2025
Thread-Index: Adv1yzBQ92vUshNVRPuCceSO+M9Bgg==
Date: Tue, 15 Jul 2025 21:00:29 +0000
Message-ID:
 <CH8PR21MB5222BC9FD9C4CC24CCE44C8ACA57A@CH8PR21MB5222.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=dc86a3a7-6d0b-4ec2-a460-20b3a695b816;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-07-15T20:57:46Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR21MB5222:EE_|CH8PR21MB4692:EE_
x-ms-office365-filtering-correlation-id: 824ba756-1024-4d62-fd61-08ddc3e2a140
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dAB2zZncPa7yquAeuTWWBfCH3TAR9dfeKiJRRd881omqQnJxcSQR4TT9bh0L?=
 =?us-ascii?Q?+rSya8Jw6wL5wD2HRWAJwHkt73cAw/eUZ8jA0dsr+GO239xxMHzYc3ADaya+?=
 =?us-ascii?Q?+6s+6KFaIWgv8jea+IEOmyk7uIKognog67jsK4czKXubmNF9FmjO9qsSfLYf?=
 =?us-ascii?Q?zz7X3X7jC3+16/zCaTy7SlMt1V0643mgbDIQVpRyWwGEJEH0rUvmNLoFj6I0?=
 =?us-ascii?Q?Rn0Pvnzmh0S/rat2yQJ5KiZDdUguKLWgb14UaEYB6gFqbAfaqp5hheb5B8O/?=
 =?us-ascii?Q?IrdeQZk7jvRtRMH69K7jSWrX8Vz8AboklzFv/dc7gHv3Gd3/TpZO2oY/cDke?=
 =?us-ascii?Q?CWQdFKxArX+185WXunRIOJDfE2KOIM/Dq/9dI2UwZCs3rnS3JfbKxluG91M0?=
 =?us-ascii?Q?pX5zdp86S2lCALeRKRAZxmRjyQ01K/fpsLE88dHWsny4m+VrfkDN/dxZVCw/?=
 =?us-ascii?Q?fGxq5PrPT/h9N9xUOPtMkG+UFPq3COad9XdxV7p24CKCaQh1aLXyn0wFhbEY?=
 =?us-ascii?Q?qZqyAHL09sn1v28FcrOEprhYJ1lmo6yHB6CikkdG9nxi8OPgdOEbeIspl4kz?=
 =?us-ascii?Q?SqLBLlgPbfywZMo493xgFUCKZ3yJR40fpXN4IgXiEJ5xE+J9vYT+ehUENsM5?=
 =?us-ascii?Q?hDpixtn2J8pTsLDkuyIujUcBiag7nkAZ1SmAFVkNve6ebX29ObNi6YyZvpwn?=
 =?us-ascii?Q?O2frkMM9nKcG7/AAKM+wXfkvxzwvafVCDMnYfto2MyXWs87qvkqc10xVatP8?=
 =?us-ascii?Q?P5KcGFyv6ydiHvKbJWUlpcgSOzEvqAW4bSDgqjxccJG0q5+st9zckdjLzmnh?=
 =?us-ascii?Q?5Dazl+cHdHs1VDIgwMddSgkFl1R0i0MUjDJQFhR9SDTKVQefPUQ1eETGtsxu?=
 =?us-ascii?Q?Hk3uokZj4pZdKtBtLtGabAGtD0xA/fMEwqcuFqIhqRDd8WsVVQzvqjLbH/vW?=
 =?us-ascii?Q?tGvtItegpzH5fRwBwfWVvFdSWTm5s7WE0IT/ZpDVr/qhtHJDt9vETAeJoRlZ?=
 =?us-ascii?Q?HBB4BVbJkgfjH3mjK1ziIge2HSOhKnyBQgh7BtS/2/yATp/fWyx/e+gVLQ89?=
 =?us-ascii?Q?ITBU/gtLa08agw8FQ3N+VCzWs5xYrW+qzvlH80H5En91cwYLtdMPwhM8wTDV?=
 =?us-ascii?Q?xvubwD92zK2jYe5f1Fy1LrhBoC984nj5B963sHobKHnKEyY79anGvyUp0HxY?=
 =?us-ascii?Q?KZGFuXcYZTDYhoESnYvV60S2XbRbHtMprHrip3asBmIqTxL8UU6nwOHD0C5v?=
 =?us-ascii?Q?1kQPuvWPvIAlpi1LT5GUB0GMemXfZGIzY8Irz/Zy4IVASyHbLBZ5jbhzp/pH?=
 =?us-ascii?Q?g07M6opqYLe2yvABJRIuvwu2ZWQmqM3Y79gy4jywc3zRUxIDKg+dFleT9vTy?=
 =?us-ascii?Q?cPs6Iw/xbu23ZAt+bCfvSBsju8ZidC6AiWN0W7RxnpBGS23vm9QG0QNIVMOQ?=
 =?us-ascii?Q?sdGQvOkpof1U+PrsBLPO4YEG2V4Ul18Mf9qSUqthXaVTV5382skvCJlq0mNe?=
 =?us-ascii?Q?JavnPfYKLPHohPg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR21MB5222.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?w7M2OwJZ1n/eoCBXo2ZPjQS/FP46CxlXNf1VxwGe1G4B07RB4kAWJr3M2n+j?=
 =?us-ascii?Q?8g2tP8OkwaXjRMHaSsqh2AWpX2alUo/nVDp0KnJGe5U3a7AJVhe0ACYNN08A?=
 =?us-ascii?Q?PMbskt+swJTHJA4gz4xdNAWgLhk89KU4PoFcVLVZlIEw12krHZAIs/QZKL0z?=
 =?us-ascii?Q?FnuPwR+QLqQrdeVhpOJ+s+fscjBjaFYITsrC7v5t5bhR7e928pkFhR6jLRqu?=
 =?us-ascii?Q?chk+0TXuR4NbyAc3EKqlmDeejuioJZQtoDsXh1vl2ufi5F6StQtkL+/IE8gA?=
 =?us-ascii?Q?oVQqnhfHAQrN6HeAJsYLAT1KQUKzjcrrKiii8KeRp+qJIp/odDfA7ZXoJCNz?=
 =?us-ascii?Q?i5pUPFwLfDhByrA+bTz6756Rbr330uoI13e+OPGlg01FpGYzT2nfBzbShCFo?=
 =?us-ascii?Q?GN+svW0otn6lLSpOamJtP5SCUCkcbrvG1EtWfwwLowrbIMG2l1Wgnvr+d5LG?=
 =?us-ascii?Q?VCjkqP3zNraOLxmw9L7FsHftvRgjyHCzg1QZ2IocaXqsstSj8Dbgdt3Iwk8q?=
 =?us-ascii?Q?kxOgm887sjpMIKz2moedbFa4mmBRBG1YxfnilZSnLnbbUzZtU3loKFmSXfw8?=
 =?us-ascii?Q?yY858i+FsAcms484Q8GCSst2x93QymhNOeIRfpF7mz19DDuTGRjBN0Q3QPjs?=
 =?us-ascii?Q?k9WJpPBlCs7szn3iIY3Y3GqH4DKu9SW1KDeodIh9yCAhWcLoCcFIbpiUtIJ+?=
 =?us-ascii?Q?gb+/9OsO17mrfKZOD4MWP14BjS6fuhFZTHG87UPvTn9zkwvdEV5dpa6U4CB1?=
 =?us-ascii?Q?HeA6+1BYmne19rLJsZKAUI0HjGngZU4I2Vap1FQ9s2tI4k0CHjdyOL4cqGze?=
 =?us-ascii?Q?LaAtK7iuBYkKcpMDyDCNqWOmSO+59hz2EgChSzXBat1msxNU8DJiEoa4/kHG?=
 =?us-ascii?Q?7al4oWDdIKlUmXV92HH4euNuaIV665ljRXm6pcEHm1amMc4lcHMIxrpGDPG9?=
 =?us-ascii?Q?F6pJ3jSIRG7/Ec0CzYyQ9xyI07vysQ0vg1J/rTQWGRDe9fdZL5hVQNiLWpdK?=
 =?us-ascii?Q?rfy6bSFuS5mGRDNCh7vYDxqrCu0AzuhxuoODtyh2FIUO01XTV0aVsi+cr8My?=
 =?us-ascii?Q?DoYzvPzU2hylKg+rCM7vH67DxvxM/v0x+lqeS/CVbn6X4eYyVZGKJlhRUHn7?=
 =?us-ascii?Q?Ppr9x4QSdC4sS8ivqAzSGwJZVa4ffFT52jOUYQCQcD6vdIU45RBLpi4xob5Z?=
 =?us-ascii?Q?Iz7DexcqmLog2LuTcyilwCBXuwP5kK5ngRMwOWocUO8BrPxu7Heszfo7meKK?=
 =?us-ascii?Q?JJwaau36dAEAk58MrWTTFYVLBenTEQ/1IYRBYteqz18awwC8zKG1ccvg65kU?=
 =?us-ascii?Q?p064uqZNnaQHOXDa2TDU4LX9c2Hup31ezHR+VoPGu+qUzUB4s6E4pPrK1uVN?=
 =?us-ascii?Q?QewpMRTTYk9YQC8RbLBHaWQjWnIH4/P1ok22LYnPB26uoUrJHKYwOgSvqsRL?=
 =?us-ascii?Q?Cuc6sCnfCLwDpfN+kdzKalqFGQTbJgpPUdjkLRHsjAePFgGj4aaZ8e5Scmjh?=
 =?us-ascii?Q?Xn4wyO1IwskTa3H4wcbAeZl8HIRfIwrYbnbSBJ8sP79aGiPIvL2I47Xy+LXk?=
 =?us-ascii?Q?Y4ay6S15a8pYzB7nBu+J426OC7KwLNKXLv7vwvZ7?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 824ba756-1024-4d62-fd61-08ddc3e2a140
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 21:00:29.1278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6FgTA7DP0dAqmkKAcRh1jxga4Foun90bp4UmtI2fbZ4X101CUMxEQMRIhlYuEhI0hjn8tV/itA1sW+bmRvRPEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR21MB4692

Hi,

Here is the usual call for agenda items for the this week's SVSM developmen=
t call.  Please send me any agenda items you have in mind or raise them in =
the meeting.

We will use the LF Zoom instance. Details of the meeting can be found in ou=
r governance repository at https://github.com/coconut-svsm/governance.

The link to the COCONUT-SVSM calendar is https://zoom-lfx.platform.linuxfou=
ndation.org/meetings/coconut-svsm?view=3Dweek.

The meeting will be recorded and the recording eventually published.

-Jon
