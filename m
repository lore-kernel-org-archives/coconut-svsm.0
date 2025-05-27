Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023077.outbound.protection.outlook.com [40.93.201.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B6C27A446
	for <coconut-svsm@lists.linux.dev>; Tue, 27 May 2025 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748370224; cv=fail; b=QBL4DnVv6wDyXPI+hSip4r75aEyYoyKrOz4anL2kh3sX1OEVrgqRTHFIdsx+ToDSr9ZUW93zMY08WeULeYZFxYfaRzZZkgfVXMCBFBVF/nsq7PshspMk79oRQ4KFFE4tBqinbyUC2OvEXi0M6hZ7PsOPjgitJEXaEtynG6BBoQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748370224; c=relaxed/simple;
	bh=vTYsjZphn2KX81ifHpsx+27ZLCmK4Wv5Fh7wzD4YBOA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BSA89FYAA3bkAqmZp64iolDZPrdB/wkisBYWymyqbRYb91fI8LF9m3TyU5gLTwoBYwsqa8afe7/3qUlzwS+FHIlVomQc74vacx4Oq5OkVJ5pMIH4v7z7IxoBih32sTiE7n9M+hxl1oGpWC7R37WB8Z9sZNugxiz31NKD8NYOQ50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=E/ThiPbL; arc=fail smtp.client-ip=40.93.201.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="E/ThiPbL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLrJX+bl0hCNt8be1ymaz0y2NfVjSST+FawudfyGM7+3m3t2qi4WLbA5l4IosJQt01zmwGQyHUfdPo2yAu69lFX/2VXSggfoprVa7wyXX2u5rUrljk59h0v9Pepqx3sjQUWzAirH+cSchDI+40ysqje8junF37WxF8nTlSOtO6+e1N8QMpUIUZ4QGqeHUr+kUnNB9X7U7F3tdJPxzMGracDf5HxSP3ZhWK4KtaQ4PAUZtVIYiJ3sS/8karT+Ey87GuDQWX+Cl5/b9DEZ0x8SkcAukkJIQK+Qq3VzjXgcYRjRKXyHd0z7Ys5A/TgWrM79FFDVYpqlbbEN1yIBUwAQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNmn1+8xyekmbhqW/pNGkPQ5wVNtEKbx+krX+pgpxyc=;
 b=W+n9WuJJk5RhPb5S72uABTbUAgYzapnD8RpVqQiF+dXZCpGk3sNpZ/POaglbMNTjDRjsiIczYiS/Nu4ao7v9WmgOBpuzmDm29w6vXxLzQSlkLRVf0wuqY6owYZDMWthP07U2TCzOtH4oxpCsoVxkqmuufBmyL4h01n1RefwLnNeE9x06SY2vu5QHZ7P684ohM6rloqph58HtpP8iwPg3lN0GtSnGnXQjb9J2P7FAh5+jtUTKDUg3cnDl9CtKAE5OWDT3xZu9ACZEc6NVKwc5jfpkFlXd3TTUkYQZgP40gr2a/Ed1KKYeiLbTnOprS9UIvRoqni5351B9qobl6TnHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNmn1+8xyekmbhqW/pNGkPQ5wVNtEKbx+krX+pgpxyc=;
 b=E/ThiPbLPwwPXij5XRiag+0WXVKPIVQbAfAtNQHxZQB40uxILmX9HEmkcmNmMfw/qjadRznymYjV1+ao864v6ng4Bf9udDz/WAWzN/DOBE8j/D+FT+58n0SPFlINRGkgXIwK4oJmpEOPcohomjMCZBFilikK/zaduG4KmzBcB/k=
Received: from SA6PR21MB4303.namprd21.prod.outlook.com (2603:10b6:806:419::17)
 by SA3PR21MB3889.namprd21.prod.outlook.com (2603:10b6:806:2f6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.8; Tue, 27 May
 2025 18:23:36 +0000
Received: from SA6PR21MB4303.namprd21.prod.outlook.com
 ([fe80::e19b:11d0:630d:d6fc]) by SA6PR21MB4303.namprd21.prod.outlook.com
 ([fe80::e19b:11d0:630d:d6fc%6]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 18:23:36 +0000
From: Jon Lange <jlange@microsoft.com>
To: "Melody (Huibo) Wang" <huibo.wang@amd.com>, "Lendacky, Thomas"
	<Thomas.Lendacky@amd.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	"coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>
Subject: RE: [EXTERNAL] Re: Alternate Injection related questions
Thread-Topic: [EXTERNAL] Re: Alternate Injection related questions
Thread-Index: AQHbzzAaQ4r3zzpwOEmqioVa3fjuXbPmyYig
Date: Tue, 27 May 2025 18:23:35 +0000
Message-ID:
 <SA6PR21MB43037BCE35B57BA6EC3310A0CA64A@SA6PR21MB4303.namprd21.prod.outlook.com>
References: <cfdc763b-2c6d-4f80-8fa3-ed8d07994021@amd.com>
 <8dee65f4-24eb-4f33-ac85-59e1101c8a83@amd.com>
In-Reply-To: <8dee65f4-24eb-4f33-ac85-59e1101c8a83@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=fabf4b07-5eda-4a7b-b342-2eadc9ae73ec;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-05-27T18:19:58Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA6PR21MB4303:EE_|SA3PR21MB3889:EE_
x-ms-office365-filtering-correlation-id: 6e710aef-ecb3-4537-cc5b-08dd9d4b9845
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ACm6fzBTVVRN0kAp1PPvWDus2pyAgobUrJwP02xtzzH86NVi89udDZbCPf?=
 =?iso-8859-1?Q?kN93cpUnJ3cYyIRxACjoz+MlR8/8FhWTN8/TLi8YAMvJb+inR5/0B7ljmo?=
 =?iso-8859-1?Q?Thm0ErNKgSdnVBSj2wr25zbRo/qDbKGU8IsRqbBHNsbvXJJSR6/oYXx8Kl?=
 =?iso-8859-1?Q?DQ3QJeN3ipQcsqfmKvxcgDqLE3qWir2jzeqHkT3aioy8sbK/z0MN9bju2n?=
 =?iso-8859-1?Q?5o/m8ME6fg+5Gx2Gq4odAaoGle2Txpv/ZmoPv7siQ532Wxb5dXEQOMW67P?=
 =?iso-8859-1?Q?4ANsEiYN33jTHVQQIY6jeRiQO1kHI3xhiNAwjgNncjGcZeEJulwk8AeyyS?=
 =?iso-8859-1?Q?/perAcYQiVaaD3WyhASo7YaTE6GYmn10mhvX0Y9V6ZFghv3D3cBb4H5fBA?=
 =?iso-8859-1?Q?mXsIryjtXdQiu1O+7YJsDCrOzjhE5xiaA7MK5I5D+UhfSrqKDdciiM85NK?=
 =?iso-8859-1?Q?l+WFa4drv2L4XqisgOtHe0M3lHW4rsvmJLLz/URGyKEmyASAS7t8d11/Wy?=
 =?iso-8859-1?Q?qrFujUmS6aPnEmwv381Ge7HmCvG9o5TNbbtOsdPJX7LnCYjthPGWV19UGD?=
 =?iso-8859-1?Q?weRzEvfqo/u4q0V97ZYD8tE6krYRD5dPU8KJPWWq+Ov6Nq9MzBUK9tXAIH?=
 =?iso-8859-1?Q?SbyLRO39Ct0Suu5uxeyADc8blAYrsV2+fGIXrdpJRyrHeT4WKsT/gdTg8L?=
 =?iso-8859-1?Q?kSltlQYMZMeQK4mFWKZqUgkTExOQduQLHEbjL5mzbk7dkPJ+xCmUUyk5Zk?=
 =?iso-8859-1?Q?PzYmzQmoLIFfbP86ojKw0UQrkNCk48Uve4AjQ2DSrPz2fNqxNXqkOCE17Y?=
 =?iso-8859-1?Q?MsglE0UimCWziUatKNxKma95xh15gY0Y5dWwTsyS64VNls4qxPNN2v7Yr3?=
 =?iso-8859-1?Q?86mGhoymB9j2PUgtQjbuYfl5XMB/HqBzTtBhwNnDnnPPAia4BFvnNUUsH6?=
 =?iso-8859-1?Q?it3VXyQDI9J3wlkQ1aR8aCkKeash7Aupz3symFQmBj7F2MZanXh8nHMfFx?=
 =?iso-8859-1?Q?8pcjk72CbuE2tsxpWYH1oXuy+gYtj/m6tUP3QKRrKJ+QZqlTwwd2rM8wu8?=
 =?iso-8859-1?Q?3BOdl1Qridpp3JaukSyD5XcdDQ/DFBIAlWN/IzjxAtj6MUL2Kp797dUQdc?=
 =?iso-8859-1?Q?KJStT8WM82M16bHuHOXVeHlHnBBAcTQuo5xBwEXS27hHba+MMrGbP81fur?=
 =?iso-8859-1?Q?nMmP4cKNi00NihXKyajDmRtPJT/ikUlylgdQqBsaPlGL3qt+3t433y5Wtc?=
 =?iso-8859-1?Q?pgaf/+QOhEM4gyXzeq5heShyDVZvnvflg2d7Vj6H7HLJWupGaRIJ1NSsl5?=
 =?iso-8859-1?Q?YXbPWMRln88I8M7iw9nv+bVnQtN2vxUqRdRZHn+FQgJp0LtcGEexLSH64w?=
 =?iso-8859-1?Q?LjcAa3DcKqafbAyULyOfDYgZ71MVwk8AdQEjriCTzoL6oUSBVBwKoKn3l1?=
 =?iso-8859-1?Q?uEK2n1JgDNRi8CW16ubn7E/zo7R+OJ0ERoJuaRFJ0u1etTfLR+1kbLUT0S?=
 =?iso-8859-1?Q?E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA6PR21MB4303.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KG2zBGmSYUnCvWAAns3E/E6SfSrQe/HZ8cFO94mtu2Cb2+uKgFLTs7rrP+?=
 =?iso-8859-1?Q?A6VipNQSptKP4WOI3DZrKC937JmQiUFdo6Q1KnaVXi7smR2++klJc2T8Le?=
 =?iso-8859-1?Q?aUqBTQIDN1B9+1lty0cGOHZrRExbjnLntZQx+eBCQOpZkBJWemcZccgMC8?=
 =?iso-8859-1?Q?sIsgQKvb0X71dY6kVL/e6jNGFd4k+Ev7Q63natUd88XgLnb36tq2E+iEfr?=
 =?iso-8859-1?Q?0YK8rYLwV8ZkR5U8BmcGRsZH65ug/LgCV98eBrz5Tjv0XzJTlIWP1+X+0a?=
 =?iso-8859-1?Q?k8jeKUuOsZK6H+wQaPEeR0o8s8UJoqkQJ9h6/9QViNEyp3Ab/QH7jwk1M1?=
 =?iso-8859-1?Q?UQSvOy9V9EUeY9hnWWQJgUeAQUIbjPniHp9i2EJsRttt+jh/JneFRjFHcw?=
 =?iso-8859-1?Q?HpCZLdY7b5kCW63z/oLLcmy6Uvys7Z5kq5rYzpE4xE3AVn59VjfQ1nHgTv?=
 =?iso-8859-1?Q?veD1G64CZ8JsmOpDnATsU4YXMQQY31bi6U+cy9u9UutiA6ffqcR1wfso7/?=
 =?iso-8859-1?Q?j1aDv1Io2zrDm7Xb/K369Wj1lykn3RqNuD/4dbcANPEMcIkuWxgYYJ0hg6?=
 =?iso-8859-1?Q?GT7d/8GMpgjD87v/5BWR4nnUNXwOcY/UOmOLQckiTTMmNCcew98Qy4UHm/?=
 =?iso-8859-1?Q?r26ntHDutPB631SIzL64hApCcojY29AD9xo+skF8PyIRDvHig4vXdeT0CS?=
 =?iso-8859-1?Q?AYxNvrh1ou1nebRbfsF/qZnEkUh05FSSFCzw3Goc1YegmN6G1niOvmd2ek?=
 =?iso-8859-1?Q?7BKVGQQ6H7/02fBpvIEsdiEEVD+1IFIH7J3GuQmw0lLz0ZN+6WnC9yFdkv?=
 =?iso-8859-1?Q?7kE1T3F+V8oMFBQc2A+tC6HA4I8OKIOOT00Qk8DtHHTZTsrFwgv05ruFJb?=
 =?iso-8859-1?Q?sBAs06J2W1OdCWYdsk17Is1rWBRFzDAyyawWMJ2Rz9Zwz7tlg+ZNiSBhK+?=
 =?iso-8859-1?Q?5OSY0SR5IZM8293Om1KtsrxyRRu56oDhKYH3TunfVJvqNp0x0BkSNbOws8?=
 =?iso-8859-1?Q?MD/sIuBo7eEYoeoVq5YM6c/O2UUeEWYoJML5u1tbVFm94SMwb+bXjLjcD+?=
 =?iso-8859-1?Q?V4koqCfaDJ0TJXNKyA36RdZcEz6kZGqlGJcOoSXl1PyFp6XyZ1NPOhCxeD?=
 =?iso-8859-1?Q?mR49taeeDoHpRzs1N8QmhCalXoMhISK2D4t2KVwkhXHebDVB+Zb8ezSYCr?=
 =?iso-8859-1?Q?rKdtn9j1s6Vv0RKITp5UEKrI9+d9doxZCRrfNw32R6x9iGnFLxlc9/lquE?=
 =?iso-8859-1?Q?6o79hpOsiyHkKoIaH8gBwxAtz/AxD7H2M0pmhlyuBV3/NFXN9u7xOUZvHi?=
 =?iso-8859-1?Q?qCuAFijoaiNTVjpafTIGDlxCFxaVYs4VJjjET3rqIdsAqSxP+3i8OVRouS?=
 =?iso-8859-1?Q?piiqEDygFSs+XHHz/R75uxYRFVQo7cP5EqQDkXCd/07FlrDNyalRdCBql/?=
 =?iso-8859-1?Q?M6PbGZ8yXG23qCvL8C3YKLS2Mk0QfeTwnlZfFYissRXxKHHyAeSoJ+1oAn?=
 =?iso-8859-1?Q?MNJRmuzlUAdneF3IAub2+jStkeKlw0npxRfSgJ70f7T+4gFZQ7XaJwdmeP?=
 =?iso-8859-1?Q?j31A6UEB11WUO8UzwqfIAcUNrk592eG09tyEREqNNoJZfBSQlQBp/dVZZP?=
 =?iso-8859-1?Q?nvBSg4nO2PLySwFjYkHt/C53LT6Y+eAsztt8zAuggT3S6lTmCBoPtmUoJS?=
 =?iso-8859-1?Q?qzOLK6Wt8+f7iZZYmCbJBLlz1QsRZcrrQ7YjgLck?=
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
X-MS-Exchange-CrossTenant-AuthSource: SA6PR21MB4303.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e710aef-ecb3-4537-cc5b-08dd9d4b9845
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 18:23:35.8740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ftGtBZrFhk19LKs8FwxNxzMh8mkTV3geIgaIWSGxp9WWj/QMIUM1X/q+Deq4EpbrpxI1GJUGMb+juwzp+SyjuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR21MB3889

The SVSM will check the "no further signal" flag the next time it enables i=
nterrupts.  If that flag is set, the SVSM will act as if it has just receiv=
ed #HV and the pending interrupts will be delivered.

The design here is that "no further signal" indicates whether there is an e=
vent that has not been processed.  This is the only information that the SV=
SM can use to determine whether there are pending events to dispatch.  The =
#HV exception forces it to examine that flag, but the SVSM can choose to ch=
eck the flag at any time.

For example, look at raw_irqs_enable, and you'll see this code:
    // Now that interrupts are enabled, process any #HV events that may be
    // pending.
    this_cpu().process_hv_events_if_required();

There is similar logic in the IRET path to check whether interrupts were en=
abled at the time the exception was taken so that the #HV doorbell page can=
 be examined.  Look for the "default_return" label.

-Jon

-----Original Message-----
From: Melody (Huibo) Wang <huibo.wang@amd.com>
Sent: Tuesday, May 27, 2025 10:52 AM
To: Jon Lange <jlange@microsoft.com>; Lendacky, Thomas <Thomas.Lendacky@amd=
.com>; J=F6rg R=F6del <joro@8bytes.org>; coconut-svsm@lists.linux.dev
Subject: [EXTERNAL] Re: Alternate Injection related questions


Sorry for re-sending this since I had the wrong mailing list in the previou=
s one.

On 5/27/2025 10:39 AM, Melody (Huibo) Wang wrote:
> Hi Folks,
>
> I have a few questions, can you please help?
>
> I found that when an #HV arrives when interrupts are disabled in the SVSM=
, the #HV handler will postpone the #HV, but the postponing simply returns.
>
> Who should re-inject this #HV again?
>
>     postpone_hv:
>            // HV gets postponed
>            popq    %rcx
>            popq    %rbx
>            popq    %rax
>            addq    $8, %rsp
>            iretq
>
> Is the hypervisor supposed to re-inject the #HV hoping that interrupts wi=
ll be enabled?
>
> How is the hypervisor supposed to know whether a #HV which was postponed,=
 was actually handled so that it doesn't inject it again?
>
> In SVSM code now, the SVSM will read the doorbell page for extended inter=
rupt information without checking even there is a #HV coming in. Why are we=
 doing this? I think this needs to be triggered by a #HV handler instead of=
 reading the doorbell page automatically. Right?
>
> I have one more question about gdb tool, "https://coconut-svsm.github.io/=
svsm/installation/INSTALL/#debugging-using-gdb". I tried to use the tool, b=
ut it does not work, I have enabled it :
>
>  "kernel": {
>        "svsm": {
>            "features": "enable-gdb",
> But not able to make it work. This is the log:
>
> $ sudo gdb --ex "target extended-remote /dev/pts/4"
> GNU gdb (Ubuntu 15.0.50.20240403-0ubuntu1) 15.0.50.20240403-git
> Copyright (C) 2024 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu/.
> org%2Flicenses%2Fgpl.html&data=3D05%7C02%7Cjlange%40microsoft.com%7C1969
> d34327a3448c091408dd9d473987%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C
> 0%7C638839651456899199%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWU
> sIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%
> 7C0%7C%7C%7C&sdata=3DriKaPvm%2BpR6V2BB33Irz6Ds9qRNDhUJfVa40QsaLaqY%3D&re
> served=3D0> This is free software: you are free to change and
> redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
> Type "show copying" and "show warranty" for details.
> This GDB was configured as "x86_64-linux-gnu".
> Type "show configuration" for configuration details.
> For bug reporting instructions, please see:
> <https://www.gnu.org/software/gdb/bugs/>.
> Find the GDB manual and other documentation resources online at:
>     <http://www.gnu.org/software/gdb/documentation/>.
>
> For help, type "help".
> Type "apropos word" to search for commands related to "word".
> Remote debugging using /dev/pts/4
> Ignoring packet error, continuing...
> warning: unrecognized item "timeout" in "qSupported" response Ignoring
> packet error, continuing...
> Ignoring packet error, continuing...
> Remote replied unexpectedly to 'vMustReplyEmpty': timeout
> (gdb) quit
>
>
> Thanks,
> Melody
>

