Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11021079.outbound.protection.outlook.com [52.101.62.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9B02874E6
	for <coconut-svsm@lists.linux.dev>; Mon, 19 May 2025 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670876; cv=fail; b=lsPsBmDw4vd25bbmHEEp/7KyiUJXHnPr3QIbtJLIsP1RKEsfjo84MYETmzdnOEqapiSUYeBz+WHxDVX3jUIm2Yp1z61qcx1HP1D3QcPqSxo0PdT+4OXvHs4wnUYIlaJQZhNngQCwC/mwEaMMr5SgG0K1WQUVVrSENDlV8Z6FYz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670876; c=relaxed/simple;
	bh=LygRh04Hh7h61gTsq1B4gclxWvyeRBeuaUN2hBXZD14=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FLLlvLFQnaiye1ZC2kHq0SAehlvD7rCCs0YTU+5t0rWT2bFyLJjPuPj9sP6kYZHp7zZ1YhhnLWzZv6S8s7ADWrcaiOARakCbz8kl1tZVGw2JQ5L2zM9CNed5XpTvgIJAxliT5LtDpIWjT55YqxsXkTw/Hf0G/8IM7/z58pPKNQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=U/3Y5oSy; arc=fail smtp.client-ip=52.101.62.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="U/3Y5oSy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jm7ULtMfT9U8j7Qs4Gy1gXA+UKv3TGDTqAdVZo4h5CAv5rykl0jOHxDEH6IvrRWLzZpbogUUxdzu2+3bzs7tz8p7N9LcVjOrP/X/X+i2Wqa5YIDvAuI3VC0/J3Wl4tGsw1vaitPmRP9gORlXgF9mrBzegxw+gX6A9uFta4uS1Nf2qFKxB5tRZdCk8gb3VIEoHtZaoKbkzkym/F9TazzHaqeczLeQ63Zi34lMwX0UNtvnhLYOBjg8a7zbZlezPbrR9zUuDe9a/1ipUNDEoaMSq/Gr+JL7UzblDjqEWsYvARtIQGPckGU6evOAzftZmTnENTk80dZayv7jWJcvOp/y1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qh/CsaoNMzXAEADRkj0ls40NRRXe6tclk7NaHROoROI=;
 b=PenVLy228lcRshsWzyqlWHoExYYoZPsXkz7i0LdICZ5+gN89vX2gr3HyKAI46xKg2W8Se6H37bL17HVEJuU3kJjiLwuvyn8oblw508albxUmcyNc0frii0vLQnYqMSwpRjRCEb2TekSbNtRr6AMQoL23uGjPF8f1crLLTIqP4boiYTQgKTzQak79Dguxdvl3bXgDhf6lwQow6LLzoLk7UfClN8lfxS49cajzshXQsXlA32TXrvIpboFx8myOWRACl+KpU7j6PyRQ5sqPdBnaJQyENyDBiWfSLduW76Zw5XapVrTmNfXzxyAve4kIKP2JXdrrTIFZFlSFc6gqwa/6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qh/CsaoNMzXAEADRkj0ls40NRRXe6tclk7NaHROoROI=;
 b=U/3Y5oSywx3FxzNe/9JBOCm8Gi77N7uFYVwbm/hnnRqm8rhmgkiymZK30Lu6vNomQw/93ewRcE4Xoc5pjXg5UmEKOQFVeXy8Mye9thksquomTwqr8vocrqP7CDfa5P0oIhUgtiO/VeAPt70o2Gc/xqu7FHjRbZbD94yflHb0AnA=
Received: from SA6PR21MB4303.namprd21.prod.outlook.com (2603:10b6:806:419::17)
 by SA1PR21MB4324.namprd21.prod.outlook.com (2603:10b6:806:3df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.8; Mon, 19 May
 2025 16:07:50 +0000
Received: from SA6PR21MB4303.namprd21.prod.outlook.com
 ([fe80::e19b:11d0:630d:d6fc]) by SA6PR21MB4303.namprd21.prod.outlook.com
 ([fe80::e19b:11d0:630d:d6fc%6]) with mapi id 15.20.8769.016; Mon, 19 May 2025
 16:07:50 +0000
From: Jon Lange <jlange@microsoft.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Adam Dunlap <acdunlap@google.com>
CC: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
	"svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Subject: RE: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation
Thread-Topic: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation
Thread-Index: AQHbyNL2fLP0DEpoMkqZQ9dnXoitdLPaG87w
Date: Mon, 19 May 2025 16:07:49 +0000
Message-ID:
 <SA6PR21MB430341F8085E6F0B004B865BCA9CA@SA6PR21MB4303.namprd21.prod.outlook.com>
References:
 <CAMBK9=YfWzsXqhav8d8-cLtn6RKLBKY4PN2FCHwjCci1Mi-fhQ@mail.gmail.com>
 <ifj4skreud33emq6apcrmp6s4na5nmwsncrxkozaicg4xih6il@5kqf6yjt3tsy>
In-Reply-To: <ifj4skreud33emq6apcrmp6s4na5nmwsncrxkozaicg4xih6il@5kqf6yjt3tsy>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=eca44392-b836-4d9a-8b3b-6da72dec57d0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-05-19T15:57:30Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA6PR21MB4303:EE_|SA1PR21MB4324:EE_
x-ms-office365-filtering-correlation-id: d7041cdb-7b05-468d-e7ee-08dd96ef4d97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?p9dBZXtXxVa1qGS3igapTiqeSWTyfCwls9nFOoaMfBpZaFG5mBFW9xYGSoBN?=
 =?us-ascii?Q?bE7sViV/j9BPldIpwVksMB6qoZqzEK+XzrzJLe/NnnUyO7la4goQr4WrHX67?=
 =?us-ascii?Q?Vxlp/HAUlVSaR1HGTicvqFpw4AApBG+qR/2fe8eykB/vPCffyYUvNl7PPHfk?=
 =?us-ascii?Q?2gAXZpSy9Kdtds9u8UhEtWlt899zcFZ2X/ts+VKxkLvB/CkTy2x8iaHPe17i?=
 =?us-ascii?Q?7KXsv07yDObFtUREDdJCRgMX/o6EmwL/vN3zWYseLE1RDQXt+ZSQOdlwSw3B?=
 =?us-ascii?Q?BKxwIGiGFapNstpSJ/O3Z2mAtkYwRIrlEwX7s966c7VS9yOFtr8BF6bdhEak?=
 =?us-ascii?Q?9ajvxpTj7X5itNDrfvnSMBGh9a0c1++61PCzAfQzHj1SNXezvBbQAauD6FRJ?=
 =?us-ascii?Q?oBxXy2wFtM7ITLmWnY+/0hMeIUAHA/4kgmkAqlhJu8NkmkDHL8xUEz6SU58k?=
 =?us-ascii?Q?y7AWEEhfa06voPP6NBsqfzSaFdD26760rUmtelKlxfiqNTS0pkTA6Re7sc0K?=
 =?us-ascii?Q?JoVcSMVDXYuBdKfFzJCfNBGai4F+lU1B7KMRJrtlB3GT4rvDVzcQBtqN0Fst?=
 =?us-ascii?Q?0xq9yZtf8lxms6hWEhKcgMWTWXHDjvg9JbeRmDhsHT/HizxFRofpew1LpFD9?=
 =?us-ascii?Q?PVV4gve8g3az0xsfG969iUSMnrnZJm4J9Dyfm2AwYELueLPbcXsXDNDjL2ip?=
 =?us-ascii?Q?BDtJDVnqhemOk5acLc9LPNZBzASO0u5TYeakdSzLL7wm7g8Bdc8OdsZQd2Td?=
 =?us-ascii?Q?k50jyFwhj+dquKhYyn7jBlicvq5Fx89ZiIbYEFrb9XbFP2Px1inEC7u67GUI?=
 =?us-ascii?Q?0aQBUJ9ETC3gXhxU63Yr2f6KHlsEBFK1jOuOl2rF6k0Fde6i8Cu+oxpsY8AD?=
 =?us-ascii?Q?Mh0rzBzOzi1iI3hyOWq5nw2KZ0JMxDUz81wowmfBcThq6N0mw1xaJ3O6m8/u?=
 =?us-ascii?Q?nNRlwhrDRxCM02nxJQpMSyFVG0SrFMysqEqPs90Yo3GwHDkHKkis9HR72oZI?=
 =?us-ascii?Q?1z3StsjT593knqivnb0LrUgBZAq41CeNgmkP9fFIaAoDb4TSPs4EunUDXAqD?=
 =?us-ascii?Q?E0/ltY41MiZJ7v+5ghSokJOktGoE64TEqpihgtQhBqRA8EzEwzAhkjcuDoL2?=
 =?us-ascii?Q?sZ/hd5A6AuNK5lFYRcESjdaqD4uRUm6cj0JMOqO12Oq8QUsuZHbitF0+hSZy?=
 =?us-ascii?Q?ewOvsoDYitN2dEPRALL79nSrdB+hjhkGW+g4MQOgAMQDvVSlKpmXwB5L48+1?=
 =?us-ascii?Q?w6F9r0Pm7LYqaHejvXwLz5PHF/NSNGSDeDD5SCc9RsKO+FZuTZlxYwz3TKTp?=
 =?us-ascii?Q?DejmbySNBOUSHgD7Z09ZOegpkd9HblTy/vuC6sPp/u55YJ9OBTWNk0fT0pD3?=
 =?us-ascii?Q?hQGFgutL4Cq6/2YFOIN/hwQ4P8IpnBYwyghT4ey6dqSlLXjobJfRA//PN2RK?=
 =?us-ascii?Q?VN/daDzDDUdD9onK9xxslSlpi77rqz4JhewvtrCAXdUokp5yyKJ4HQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA6PR21MB4303.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DnCjiMOt718dWM83519LvHEYwOA89FOMGoeXT87XNEB1VAP6sLb3ZQQs1fUK?=
 =?us-ascii?Q?yvY2nT/H+09epJ5p7nmDXyyR7Kxmrzr55Id3TN/zU3DyhOyeP8ALhaYTyMoj?=
 =?us-ascii?Q?bl78my+LwpaSf9+Hiwn/JzQCGzfKuhlIm0hdwS8rs/ld2tnxK+IrGUksTAdd?=
 =?us-ascii?Q?T0lbVVfwRPZwTIaYcxXkr5F/wEx9Qy0g2UwuTdstmFP/4yTNQYL1DU+GGMBe?=
 =?us-ascii?Q?qKRq123Ijz93EwK97gaphDCt87HCS7tVeoIt4dCIY9m4Ulc5+jGc0IJBqFqi?=
 =?us-ascii?Q?aNtKYH5XW8aVc6JOM/tksM5ZpTy1aux6z/ngF8xieLk9VwdoJ1cs9MRvHwPj?=
 =?us-ascii?Q?ZCHPdaANsSq29sGjObyYAdDCE/PomaSYRUMhNVSp5bvBEt91p37x2IfoWbYN?=
 =?us-ascii?Q?HcHmCcXe+zvkNNOsbhe2g3Qy6oH2vy93I7D1k6sasfNbXQINCm2Wv7jvw/42?=
 =?us-ascii?Q?Lxcz4Zlt8UZympOaJfLWy98z20OhnYQHzQ4xhf4eCdtO2yGG3AK3PjiO/uvc?=
 =?us-ascii?Q?EBWMuMfoIcU4dgG4HuIZlOwqiYTTcqK2FUVnNDXM3LhV8iJPZnbdJYDhmzJZ?=
 =?us-ascii?Q?v3ZGNjOfO6/EX00GnjnBeVvJGrXIriKDXwH6kNmcPOCTBaJ5hzhLYgs/Lo/V?=
 =?us-ascii?Q?vzewaQy1mNJXlLHW9nRnwWqvew/ZILpZkx6NrdnSE/o1gIiDAtzA0+GMnWPc?=
 =?us-ascii?Q?6yijWZJHYtaMB1DZaXNfXFbW6X8fWKKLLt+wRpcbC1EIefIZDBsQuTyvER66?=
 =?us-ascii?Q?aZeGfolT0bUr5/GRSaWq/r2/7dNwh4R2suH9HFwIHI49IOf4mkTt01XhK3Kd?=
 =?us-ascii?Q?zbcDOxuILUgRNKgWkkTZha9L1M+3I+ENDYWgH3GPmnd9tIW2cwkQHBWwH0ax?=
 =?us-ascii?Q?DuklZe+NIj7WHEdP+MmVt00whwGimwZjon/CG8B8bbxWNX9jTCGMrN0fiBrr?=
 =?us-ascii?Q?Oe9M+VCiEpP+2WcpGcXPlpkFaiFwLHrvXjiKtvjuFysYbs0fvTiprHSe3Hyz?=
 =?us-ascii?Q?DTy6KfCD0KExKsupWD8120JhoK926JbAKkhhUCVrDWu8pKvGNs8CGVVPgcgL?=
 =?us-ascii?Q?hGcg20TPXoKvyRA1xMliroA6tL3Z1bHS0ad+VjVm7muTV4rBcsNNW9s3zNJx?=
 =?us-ascii?Q?BDGaG6aKpdNJ69JPHg+dcEjavzkZlWdtP10XD2MlSDGvQuwRGNO1/rkDvgoW?=
 =?us-ascii?Q?3qLsyB88GEmbmslfA45swbc+ariGGf7rl+eL4+g3YV2jW43588/Em9zFGT2S?=
 =?us-ascii?Q?Y2JPRhBFDP6wb/tEM1DUhgFdBwupjz8/rJUkanO35F8X5Z2aEJNYC9bkk8hR?=
 =?us-ascii?Q?IXB6wzG6Vy8f17m04xnJ6+FtopkVxxdj+FNOAO9jIp1pMMP05SwARh0AkSm/?=
 =?us-ascii?Q?LjZGikh1Moe2215JEjN71Ffdgk1WvnaJfFl2kSV2yjWAAGA2zV8UabKAIlvP?=
 =?us-ascii?Q?Zl938eCute3sCNg+av/8p1g2eKdRfW3+j80oZG9qwW/Y9om29HcbYe8q94l9?=
 =?us-ascii?Q?EFO5Txl+2LHVU2PfYQhpYdXmRuGvUT2UDG0DwYSlHTg88p/00sv+9d/ZYptQ?=
 =?us-ascii?Q?baDC4xHJ9TTHxL3MFgLgd6Qt3Rrqv6Bs9xOKtVaf5V/UoGPbM4stQ15F+iCm?=
 =?us-ascii?Q?svmHA7AoobOEQs542+lxRyx9Z+obPMBiDYcmSeOyfh8b?=
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
X-MS-Exchange-CrossTenant-AuthSource: SA6PR21MB4303.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7041cdb-7b05-468d-e7ee-08dd96ef4d97
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 16:07:49.9197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WmcfTo6eI3O5rbvDSAjJ8e5cdVRAUl3W7cz+AA+/kdsmAl7pF2lBz+7yNgV/k+rN/RO6M6Rgc4SS++uD1GK5rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR21MB4324

Gerd wrote:

> Well.  Linux relocates the CAA page, and I don't think there is some way =
for UEFI runtime services to use that.
> First because UEFI can't figure the address of the Linux CAA page.  And s=
econd because linux wouldn't map
> the CAA page into the efi runtime service sandbox anyway.

This is why MSR C001_F000 is defined in the SVSM specification (see Section=
 4.2 - Post Boot).  UEFI runtime services can read that MSR, which will res=
ult in a #VC being delivered to Linux.  The Linux #VC handler should resolv=
e the #VC by supplying the address of the CAA page.  This will enable UEFI =
runtime services to obtain the address of the Linux CAA page so it can make=
 SVSM calls.

It seems that Linux would have to map at least the #VC handler into the UEF=
I runtime sandbox because there is the potential for UEFI runtime services =
to cause other #VC exceptions, which must not be fatal to the execution of =
the UEFI runtime.  If Linux must do that, then it seems like a small additi=
onal step to map the CAA page into that sandbox as well.

>     - Is it possible to emulate MMIO devices by letting page access
>       trap into SVSM?

This requires enabling REFLECT_VC in the guest VMSA, which would cause all =
#VC exceptions in Linux to be routed instead to VMPL 0.  This effectively e=
liminates the SVSM model (becoming a paravisor model) and that change would=
 be exceptionally intrusive to the operation of both VMPLs.  I would not re=
commend pursuing this path just to fix UEFI runtime services.

If enabling SVSM calls from the UEFI runtime sandbox is completely impracti=
cal, then it would theoretically be possible to have Linux issue an SVSM ca=
ll immediately before calling UEFI runtime services, where this call would =
enable REFLECT_VC (no such call is defined today, but it could be), and the=
n have Linux issue another SVSM call immediately after the UEFI runtime ser=
vices call returns, where this call would disable REFLECT_VC again.  This w=
ould require the SVSM to be prepared to handle every VC that could be gener=
ated UEFI runtime services, which is potentially a lot of code.  It would a=
lso require KVM to be aware that when a lower VMPL exits due to #VC, then V=
MPL 0 should be scheduled for execution (and I don't think KVM knows how to=
 do this today).

-Jon

-----Original Message-----
From: Gerd Hoffmann <kraxel@redhat.com>=20
Sent: Monday, May 19, 2025 8:30 AM
To: Adam Dunlap <acdunlap@google.com>
Cc: coconut-svsm@lists.linux.dev; svsm-devel@coconut-svsm.dev
Subject: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation

[You don't often get email from kraxel@redhat.com. Learn why this is import=
ant at https://aka.ms/LearnAboutSenderIdentification ]

  Hi,

> I've been debugging a boot failure on VMs running under Coconut-SVSM=20
> with 120 or more vCPUs. The guest kernel (on several distros) is=20
> hanging while trying to allocate a 256MiB memblock out of "low" memory=20
> for the SWIOTLB.
>
> While debugging this, I noticed that the memory map reported by EDK2=20
> has a ton of entries. There are the expected reserved regions, but=20
> then there's a section of about 2x #vcpus where there is 1 reserved=20
> and 1 usable page alternating. It turns out the reserved pages are=20
> allocated as CAA pages and then usable pages are allocated (and then
> freed) as VMSA pages at this[1] point in EDK2. Note that while these=20
> pages are allocated many times over the various UEFI phases, it's only=20
> the CAA pages from the first allocation that are getting leaked.

Doesn't match what I'm seeing here, using latest upstream edk2.

edk2 goes allocate three pages (when running under svsm).  Usually it will =
free the first, use the second as vmsa and the third as caa.  In case the v=
msa page happens to be 2M aligned it'll instead use the first as vmsa, seco=
nd as caa and free the third to workaround a processor bug.

Due to top-down allocation this packs the pages next to each other, I see a=
 single reserved memory block with two pages per processor (except boot pro=
cessor).

> I had a few questions that I thought someone here might know the answer t=
o:
> 1. Is UEFI supposed to keep these CAA pages allocated? I believe that=20
> UEFI is supposed to be able to talk to the TPM post-ExitBootServices=20
> and that would likely require CAA pages, but I might be missing=20
> something.

Well.  Linux relocates the CAA page, and I don't think there is some way fo=
r UEFI runtime services to use that.  First because UEFI can't figure the a=
ddress of the Linux CAA page.  And second because linux wouldn't map the CA=
A page into the efi runtime service sandbox anyway.

UEFI runtime services having their own CAA page doesn't work either because=
 the CAA page address is registered in SVSM, and once the linux kernel star=
ted using its own CAA page the UEFI CAA page stops working.

For the TPM this should not be an issue.  There are no TPM runtime services=
, the linux kernel talks to the (v)TPM using it's own driver.

For the UEFI variable service I'm working on this /is/ a problem though.
I simply can't do SVSM protocol calls after ExitBootService.  I guess my op=
tions are:

 (a) Find some other way to call into svsm.
     - Is it possible to emulate MMIO devices by letting page access
       trap into SVSM?
 (b) Write a linux driver for svsm efi variable access.

Hints or opinions anyone?

> 2. How are the other CAA pages being freed? The commit that adds the=20
> allocation [2] does not add any corresponding frees

No clue.  Apparently the pages are allocated twice, once in PEI phase, once=
 in DXE phase, and only the PEI phase allocations stick.  I had expected bo=
th stay because they are allocated as Reserved (so they are not freed autom=
atically at ExitBootService) and -- as you already figured -- there is no e=
xplicit free call.

take care,
  Gerd


