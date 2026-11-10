Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.90
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336551;
	b=LLlkIGsY337dSEknR9HxTTVkRF5efuM+YkYgMb5J9/ND4K1/c925JBQdAXk5D//CKJxs
	 9tInTYMsyluBy6JLfHtPWdH7puDxAt4AweGFErYAgAOoNn9UhPJVZWFFRf7XvDgbB9hy4
	 K1J37kA3kEbDsImOERK0zRHCs3M3NPeZelHnUjzrukDI30mxEYkBa5pGZHhQU6fo2hgsX
	 /h6H8E7BkvUIvoIfiHMTsmMVxyGFXX6s7efIyf6dlp9z8gBCvlhRkYDWpT2Ts84nJ+hHc
	 0jagTzwaNeqvnORp6RfQN0LNYO3zUCJrm2LsSpMCA4fIrrNwmjfBKP6/HRpS28xQnOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336551;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-traffictypediagnostic:x-ms-publictraffictype:
	 client-request-id:request-id:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xs21HbNQ3vZx4VS1oxq3XVTJ6EtDg/Gh3N9QO548scg=;
	b=PhaBIZCHN4gUICyVzG/WBFVqS4gLXGN395dqLgkERGVOgap0ybxKP/a5prjm2XIdK6m7
	 yNSG6yP+vYt0BivoOJwC9TjhK9X0+g8mylsOdJhIQOnSJQrXz3Ro9NQVXijVmY7OSYCPI
	 1UykKWPC5Yb0iRKJVm6kaP6pTqw0uHB751Js/34jNQeojZfk8fKgSL9EDBO2veCTE4paI
	 me846iT11b/uHCzbYMxkoQDBZBKy2M6myUVs68/1qZkwSjWzcm8SkkILH1CGcShaXuW2L
	 yP5kV3WRtZnigl+g3FHQ+EXuGcTxUlGHPfNwdKPBj0zMs/ESOy5wEfBllveqSW76Cfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microsoft.com;
	spf=pass smtp.mailfrom=microsoft.com;
	dkim=pass header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=ALmv77pE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.90
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020090.outbound.protection.outlook.com [52.101.201.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C31606A327;
	Tue, 10 Nov 2026 18:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C31606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=ALmv77pE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGCULFeS4Q/Af+m3fiu4XwddY8VqMDBg6z/+7yieMC+3FZMlwmzKzXpTgqMsjVxkh6Vv59OHfyO9gqjN+vThsKiO+40ZhE3eCgEr0wIB4bt1xo45RXPEtZ7HJd20kuHRN0f+0Y5vkkAjlUwPFm3JPZ9Q9tcsoZvEvCKf18acitLy6n3OJ3H8bVhcVcqSBKhldyAuBs9Y2WGpEohPNXuk9p9VMDitG4ovYRxLLqHC5evucea4DA/HBwYZX+N04uRKN9ZxWDyED+rIu6yckKmW1SJCZIfBMoPEmQ43/q3gbLAuFGWJvC7FSgTXfCuQEaetPWbFfx0vLY4ZPvOoRz2NxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xs21HbNQ3vZx4VS1oxq3XVTJ6EtDg/Gh3N9QO548scg=;
 b=mng4YqOekmwifEgs4ve6gpigsFxf1q58kOeaqVQQ+UxR7/dojEMC51ONG3KpEH4139gtoPJh7jTpLm9dtRRmbYhdRSo+AtB90YrvBFKtEiN1jb2tWiVncH3znqELtVZDAg/h/NyDvvVoTA93DgGsGHhJYHlT1JmTrpk9uEGTlIoLwDwzAU2JmyTSzD0Wcd8RZaLOezO3RFDBbXITLAXdehx1YAybE0q5h4dxVtLAHjV4OsesDV/oQCKb6uiX85ihIes3/tsIN3Nw1dldDy13v7s6zAn1xiLIeVd13YiNIMD6AgbB1s2/2GNZ1Mha2mZ82l5t1tT1Dp6LOQbuz20wHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xs21HbNQ3vZx4VS1oxq3XVTJ6EtDg/Gh3N9QO548scg=;
 b=ALmv77pEEj+aZWGharoBPE91irLI6Zm/d2Ld7vHaZRu8uJSEWbqbnWNJuoRozX/iaR+Gx+F6pj1P4K/1Uy0DSIfIuClQmzmthijuepmPbBFrqOWMuvnUf2ZN78UroXsQ1D470TsmF3IfcJVvMWj8J9Wz4BGhtGtv/nuTa5H5LIc=
Received: from LV5PR21MB5377.namprd21.prod.outlook.com (2603:10b6:408:307::5)
 by LV0PR21MB5973.namprd21.prod.outlook.com with HTTP via P2P; Tue, 10 Nov
 2026 18:49:08 +0000
Received: from LV5PR21MB5377.namprd21.prod.outlook.com
 ([fe80::19e7:7066:ab7b:acf6]) by LV5PR21MB5377.namprd21.prod.outlook.com
 ([fe80::19e7:7066:ab7b:acf6%7]) with mapi id 15.21.0639.000; Tue, 10 Nov 2026
 18:49:08 +0000
From: Jon Lange <jlange@microsoft.com>
To: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: No SVSM Development Call this week
Thread-Topic: No SVSM Development Call this week
Thread-Index: Ad1xQojr4TIUIRE4QOq3QZpxEm9SmwAAZA0Q
Date: Tue, 10 Nov 2026 18:49:08 +0000
Message-ID:
 <LV5PR21MB53779C2E5E42A57BC47F6323CA722@LV5PR21MB5377.namprd21.prod.outlook.com>
References:
 <LV5PR21MB537746AC2DDA95D08D5004DFCA722@LV5PR21MB5377.namprd21.prod.outlook.com>
In-Reply-To:
 <LV5PR21MB537746AC2DDA95D08D5004DFCA722@LV5PR21MB5377.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=8fbb9db4-514c-434e-b4f1-7768ffbc4ff9;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-11-10T18:37:06Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-traffictypediagnostic: LV5PR21MB5377:EE_|LV0PR21MB5973:EE_
x-ms-publictraffictype: Email
client-request-id: f4bedbd5-2abc-473f-9446-ce03fc380a01
request-id: 144157ff-a18e-463d-9934-08df3f5b4db7
x-ms-office365-filtering-correlation-id: 144157ff-a18e-463d-9934-08df3f5b4db7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|56012099006|11063799006|261026140227099003|261021135927099003|261028144727099003|261022105027099003|10067099003|22082099003|18002099003|7146999003;
x-microsoft-antispam-message-info:
 zy5fEVrg16RQs4STv51YCE9xV/Gt0PiGnNUqYAzZa0I9eadn5ixjJFVNv7wz24y+H7U/M3ff1rGtON7mz1vghJm3puqdV4v5GlR05XPSCSNs6xxkOPqso/PlmeMMdhUQ41H8IROpgAcijilH0Pqfc2zlb4liTIAgRqXtlWfaItQWpWKNmk66nW3/ilfv1N886zjamQUJXEjOGYzI1xWZO8mwP0a16YeYvpVEnWAFeXnbihJGQNQi0WqHw9XTY0+e94kV8yJ6sDltFWSn+DsnERJRs43GBNmd1NiczsLRmP1npMVLeyRdkAHuEWH69m4braUa46i6sqNC4qS9FiyWRVB0TGaxPDgK1eSSLi+TzhDtN6y9M7eTAZSHchb/OMnn1BaCZXHv7MOll9gt4q7/gDPPRdes/Pef1HH1IEXm25GqSxTA7yYOa77fvYFvNu2hzaFw7yfBhZ7k5gDZQhDCc0VmBzs34CqYqBKYsZzTTG3Q7zlSy15ypgiv0nyHK488fRdC0b66Xhm+/UIzXUXONgkoxCD4bhhdcXowVklTUf87mKyjiu5U0/S6r3GS8OLWx5LN1t002wS8rqWLpxt64sI6ZKKygQC0rqmCncw/r9AGNjkLtTB10RJxy/3fPssFWwHqDOJW6XWnB4x0n98f77lRXex1m9BnaEPIHIdMe2kXO4F4OmcmiFXAbX2sfofCFPG7qE9PAWUhtRm67RF5qqq40+xBzQ8eFa3cnCNpyTI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(261026140227099003)(261021135927099003)(261028144727099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(7146999003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rfROMVibrn37rltqTYPEKM4X1tiIK+D7ORtuLJP8DWo1weIUVO/YGY70Ae9v?=
 =?us-ascii?Q?6QmWSfn2uQEUFE2cjWJZFskMbU4a4ZsTJWn3ijqrv1bgoV/i7zTeMApbhZwG?=
 =?us-ascii?Q?BtG2G7Xpi9P02VE7Wd40LkuJRXNH/Ev2VJawa4T2xv38nFGJWSpp2k5aaGmU?=
 =?us-ascii?Q?W8cgdjnrRMOIoPZBW7xMhlJmahBO7RgmSrG17YeKQ/NU/BjSqPszuJdkDFcr?=
 =?us-ascii?Q?8UjvgGx7l8DvJJBVJ/nCc8qiN+8JHJ0Pevlb9LmsPa/Nzy0QRk2lWO2UbQab?=
 =?us-ascii?Q?4vKelDvSL8kkbatPYX2QgnRWmIjz/MhvT7kbv9v/mdxABab7PQrfv9k9fi1m?=
 =?us-ascii?Q?ApLAWt3a1t+IAubF9A2CfFQfias+8esu7whv8RThSXIkev+y+P1EnaFP+MJt?=
 =?us-ascii?Q?4ZFTkY+dsMpfW8Qh6RV03SOgQuOehzJNJs4un4avzbjEC/WdQJgYAvSEkfC3?=
 =?us-ascii?Q?te8Dff8559QnyOGC72Xu9rPBaED+OVc3vKsKKzwWIekQ72mTXzJOroRQDePt?=
 =?us-ascii?Q?VwSS5U+NOQX3BjXLOAWUU0kEPjzhGviZdSXt6o1qQONoBUOwYVkhAYIELZ4K?=
 =?us-ascii?Q?MOACctsQkka1UCEt+U+nwM0dllGHKyAapuSpF17pnR3AFVoV1PidynVJMTJc?=
 =?us-ascii?Q?dFwd+KIKYkIRECxnl/bXf/lizqZ4IbDs5us8o3qNBUwv6Vsgr/hbZTSI1H8+?=
 =?us-ascii?Q?BN6ml8junFh20SUEIfcNpdMPs2Uqph0yfRVD5dnlAAOpZDZsFIamJQn/BCIg?=
 =?us-ascii?Q?inygkkyhZAuOsYtzuX0oF9mKGrp/MkRVvGq32GhoeR6zLDKH0x6Zx/aVQwoj?=
 =?us-ascii?Q?LJur4pbidXQ8CVMWxZxEUBOsJHN9Wr1uchrFrZrAvppJ6SRMjEXOOlSjMlen?=
 =?us-ascii?Q?yGHrzeZgdy0HE3eab85wk+iCfewj+losYRUy7Fxr0Yewm/WJzhleN5pGibxV?=
 =?us-ascii?Q?Vn3mYon/d6TybFtYtwR74/oewkVij82+FTm1CKfa1rMYwg0PqT5Ovdr8T9Lm?=
 =?us-ascii?Q?TK8cbsT1qLotM9Gik+4+juBKDBHz798YSAxnnInuZlgpUzhk5jT6A0abFPBT?=
 =?us-ascii?Q?5CZYwiG01PtLorkpBEMaUw2DZnZtMQqhkluNAseM4Ezj1G8i5TkRPeHiCSLP?=
 =?us-ascii?Q?Kh5kC2PDADp6nJKMWqO+iJzv8tUt8l2vl/+fqQOa3sM/Lpq5WYVyH5Gs2bOK?=
 =?us-ascii?Q?IerI+b3eiqO8mfwJ/aBTpu6y1Scz+S4mDz9gIurhX7doE4EaPIrespa+Moi6?=
 =?us-ascii?Q?uGnp6wZuvCOve9EN5csoyJK0P2CoKEKQrw4gaQLaweHiwtsb2NPmfzMHjNan?=
 =?us-ascii?Q?e1v4dgQePYz7AtlYKHMv0Qb8W4V0nC3xncsMw+DPprOW9HyV+FXrlIei5yJG?=
 =?us-ascii?Q?AVFxTO0g9iMw2h2l/g2cuNzfurr17kFIQEfkc80UuxH+uyvfsNVmoN6Zjcou?=
 =?us-ascii?Q?CVn64MHTBivvO8IgOpx59kawIaNKpytx0PnrK23r30FbXsYaoD22o8qEBOFj?=
 =?us-ascii?Q?gHyErC9kA0Qfvb1Nf76fFkJFu/Y1AFm1RXqpYJf7R68E/cUIBfmlat38c3Nd?=
 =?us-ascii?Q?F+39tpLQ/B5bt0nJqFMnfUvYm4oSfa0Z9Gs4dYu5sq1f9XQSlQ3fcu4l3fPE?=
 =?us-ascii?Q?FQaeF5h7gksUCpM5hWUW+0t0fwv5aj3CTx9HyrPhPwG0xi/bUxcua5b60GXt?=
 =?us-ascii?Q?uoQIe395i2O9zFQZUjQ3cD2ROqCOnCJ0ocF9KhGOywV5eqdd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR21MB5377.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144157ff-a18e-463d-9934-08df3f5b4db7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 18:49:08.7731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Czad0S7Pi43njGCZsrFUzl3zshKimh4tnCxod/tLkjEN1IjleT365K7WjpN4TQAB40IDcDWb7w8MmYouLfofA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR21MB5973

(Sending again as plain text)

No SVSM development call will be held this week, as conflicts have arisen f=
or all members of the Technical Steering Committee, preventing our attendan=
ce.  The November 11 meeting is cancelled.  We will plan to meet again next=
 week, November 18, at our normal time.

-Jon
