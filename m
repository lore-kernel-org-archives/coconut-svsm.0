Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021133.outbound.protection.outlook.com [52.101.57.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E86017BA6
	for <coconut-svsm@lists.linux.dev>; Mon,  1 Jun 2026 01:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780275745; cv=fail; b=hNi3TQE5EVB3KjVi6e1r1KO4XmUNaDVQSKmsw98ALwyKx+V/zsKDD/Mo/hjUjgtX2KYxONheEcseRvnbq39HJcOl+yZppZLMIyBjUyDDUIeQIcA3Y2l2ofwSjUhlUeZebV+OM4461huHJldoIHCm4LQxpa7pxGerZT7voN9xgNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780275745; c=relaxed/simple;
	bh=6q+PaTOxjogNcYfIwf//ZHVFN6AwNNsen+1G7dpuVso=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QnP6KJaA0aD6Z3ZNny+SNob3GhYE/Vy7oMOOwHgOgfr9L6A1mBbhV4iHnmxj7VBaH/KKJX/b5KQN78FYSNatOLt/u/MmgVZ+mMvLHxlf7ewjI/xUvupGtoidMFt6JeuUeP56HPjOAleB6AneuZb14ylXx/MVAQ0EZooIWnNxZQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=eRQTtUCg; arc=fail smtp.client-ip=52.101.57.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="eRQTtUCg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiiSeGnosImjupB37HN+7Je0cypbEeGjdWLwSs9Ue0fwESq7HLf1acYnXeYnS5fh/3zCfIuhltOZtAPkyq99QN+6PdZOmxHsvY5wTAR+orE+XNg7dLuHW1wNUsYVVMZG/wlvMzHawn+DC8Sc93eAn1jU1YYx77OSDhhBPbR6BL2vM3sSHqzA/Ncggq5gLOUNyd2lnDj2rWx3b06Fum/PscHQChpr7JybeScrkP/wN9USdkOIZZ+3lFYxOIJYc8p32OC60024VYTWmiNmPsOeqyxKLdI9YbV0qoOuW4XFBECe56SznN7aDXaMC8WCmb+lO4ylRA4U4QFXr7DaOeomqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEFHtJvbW0fvD/RRmCPV8SWxYs+YWs3llCWtFAQ9Mu4=;
 b=ew1yZFlToTCbWEvwUz9zKok/dpRpKHkq5+RkyIpBpQB1TryICLEULvJ6GxzMvPWJEKI9ZW4LLS9p7SkfDB0gD+Y1sN6jMc+8uifsP9g5l0eHTrWPRRkBIQLN7nY2eblOeGzsFh2ufSfmBgU1i3oTMI1iYur22SLvVJw8omFp4ILvzWvG4OUo4F+TSUYj9SuMv1e7Gc+14u0CsNFVtJ1dvs7y/2WKbDrH3OGZWHnRwelPLqgRJ9899lB/CZdLaNnwWHBK/5iBLrC7eCblh3S8HNHzLNuUHNYQn/WBGsCDLWTgn49RVuhUC06wCJRenJfDse57nORW6QzNSmrKlQ2jqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEFHtJvbW0fvD/RRmCPV8SWxYs+YWs3llCWtFAQ9Mu4=;
 b=eRQTtUCgW9vN5QvrBiHM+dW04YhhS7UN/+wIXfyi22YwdV/I+iVPYr5vYbSnPY3/EvrjGGxIvIAb1WCDcJcHUFC7f9smXk9BYLkxBgj1xH5FJhTL9WPnuFIcJcUj/9Xq6rLwAH/z6t4ps5cRlOMJxsTQtyw/inSyi1L/YSzJ4S0=
Received: from LV0PR21MB6859.namprd21.prod.outlook.com (2603:10b6:408:32f::18)
 by LV0PR21MB5924.namprd21.prod.outlook.com (2603:10b6:408:338::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.2; Mon, 1 Jun 2026
 01:02:21 +0000
Received: from LV0PR21MB6859.namprd21.prod.outlook.com
 ([fe80::189d:71d9:30be:1e38]) by LV0PR21MB6859.namprd21.prod.outlook.com
 ([fe80::189d:71d9:30be:1e38%4]) with mapi id 15.21.0092.002; Mon, 1 Jun 2026
 01:02:21 +0000
From: Jon Lange <jlange@microsoft.com>
To: Luigi Leonardi <leonardi@redhat.com>
CC: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>
Subject: RE: [EXTERNAL] Hyper-V support for IGVM optional parameter
Thread-Topic: [EXTERNAL] Hyper-V support for IGVM optional parameter
Thread-Index: AQHc7fQEvWZy3KDooUyqV3lhvXWhEbYo52fg
Date: Mon, 1 Jun 2026 01:02:21 +0000
Message-ID:
 <LV0PR21MB6859A80A7B69BA91BA17ED2DCA152@LV0PR21MB6859.namprd21.prod.outlook.com>
References:
 <CANo9s6kr38e_P59r2x3B_Xh+YqOWx5JmOmneY8xKJ9ZXQaASWA@mail.gmail.com>
In-Reply-To:
 <CANo9s6kr38e_P59r2x3B_Xh+YqOWx5JmOmneY8xKJ9ZXQaASWA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=30a25e34-1bca-4e49-8634-c195d5cf4bf3;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-06-01T00:57:43Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV0PR21MB6859:EE_|LV0PR21MB5924:EE_
x-ms-office365-filtering-correlation-id: 26ff50ca-0a1e-4e13-b587-08debf796fa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|4133799003|6133799003|3023799007|18002099003|56012099006|22082099003|38070700021|7053199004;
x-microsoft-antispam-message-info:
 OwD+YU6+rOdx5iHozXyMdDcemb1hTjgjHLemetRuW5MB+XFh4fPDqFDHVZUYd0/xFuzXoTyMgMOKaQQEMUwXAHIuahRTJdW8HU7JDQ1u5x+Dla+MuwDUrqZFvUZpKilvZ/E78++Jlh+xHonGwsmlm7j91KRz3sSf0R/sb8+QyoJnfTTwQ5wAO5BpCxN77Oy/ZbIbSpgqzSbuTVktvMMcZKOFkrvmPf6KtLuvS1/Zp4vZ7GuydsBh714lTm99475rKnD2ZWScTItHUB6cMNIYThD8RyIXcmfshFlmKvGi9Rj2PhwKbgVj1fpdQDyPsryGX3N2TbyquYOvZJ+dR32EfeRzYwOcahcWIZabaQh5L/DAFvfLtkcY7jQRkwcz59SBbk9xYK1InszuIskN8tJPXk7mG3rSdIQ17dgz82hToMAyuh6VOKZMVnfQyZgP9xwH/YtyGPmNAJT9wijC+SP8M0hgnewcx5qxV7MWaPhsvasRATtBpS8HT06xgLEPjTxbZ+Txqa1QDie/jHZanpvZM/hrd5YznuWGITlAyunM0w5C6lakScgAYxsNovokVM6KSXX4E1Uj0K04MVyIkmvK6Fbl86tv5X8cbB+VgYTDI29HeGDrSmnrbytBcT4NtL07W0pojoHVdO1kKqFUARLf2SYqtyXSaVoAe8oXRrx8pibMBvzLQ1i+0talZ6/rmLjtdYl/O26FIzOYsDsOgeQsGg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR21MB6859.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(4133799003)(6133799003)(3023799007)(18002099003)(56012099006)(22082099003)(38070700021)(7053199004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?D1u/GUxWcr24zfG+r//44l0yqw5i4kM3Is4bKISZh4OWWCrwV6h/MtXfMGY+?=
 =?us-ascii?Q?ajbObkxAb+Z+1rRK0roZ83JBbtfxbSY/kAeT+a2pWR7tMJ3t4PJ7Djq4uE4L?=
 =?us-ascii?Q?eS0l29Np9tJ37nr3cgVxdQHTxFjmkop4Rc8scvt3lSJySJjI9oNwsxZKZCNk?=
 =?us-ascii?Q?ALeW6rvUE9bJPPOfuJg36MbPiFRTKg2rykkgjlRqvJEgVDWJNICdfKv4XPP4?=
 =?us-ascii?Q?54eqyhsm62MiXGWBVtVlskaHnP2ulvZsl77Xg3Zk+bg1rsjK6WinwA0DzP7X?=
 =?us-ascii?Q?RibwgmNQv+9Ru8IbAbocCt7nQiNmZC2Zbdu4WPlpHfHV3nLwlL6q7DB2eCwS?=
 =?us-ascii?Q?MQsfHZaQexafiohBxr1dqfFiCiTLCz6qrJaOQ856W/4RtT4MidsHn0Z2AIJr?=
 =?us-ascii?Q?YZGm0we0NQ2HqaPrwcL+SmF+xQbWb0+Tc2jhKiUjeDW6IXVxfJy+8CEn6Q6A?=
 =?us-ascii?Q?v/3bcHkhbm4bJRq34YdCU/cAONoWgb7QnZCi88+o7Ami9S56aCwwEMdXQ8hi?=
 =?us-ascii?Q?R2cN8/Mm47C7oF1czKtv12KyDd+/ozQJhlCG8GrN3qULfgUjOsTNp0/NTsoT?=
 =?us-ascii?Q?rVAN3J0S+VnfuH5GBtRPl351coyNYmEDRG4vM1lAKy6QwtaRpl4zmCFKHY8p?=
 =?us-ascii?Q?rKJoDJE0O05wT2MINguZ4w6AMVWGivocqpG0yv53MI1uBSIcwmQUDq0eJtSI?=
 =?us-ascii?Q?kQf0iKRJ/GzgRAyYSwET+XLMPtwDUga6lbEuntPI4dR9CEAmsdNVEG/qWBvq?=
 =?us-ascii?Q?zYya/3ZiXt0NOpXKPG+Y4/oPYO0SueSr7bDiOUe+Bdx4+fi+fSg+1ymCfFH9?=
 =?us-ascii?Q?vMlptHLCVJPJwogY5ElnBuA5Jz7mTfCAAQkD7Ublq+xmtKx8pVv+MzScsaNu?=
 =?us-ascii?Q?K+EnJi5Ykv5iAEEpDDzedj5EGqRtvEqrLKRdgCnv9hBeiyDZ8DL6/FGkBczH?=
 =?us-ascii?Q?RtCubp7eDVDAZu+In3eVkR4Kk54DMqTIIaExhkt7/R4rZPuGEaPCSUNa2zu6?=
 =?us-ascii?Q?cXsuPw3sWxsXDp4+/h6juUSbHjOndGGkzcJWe1/bvSMlRvmQueB3cFRO1Z4B?=
 =?us-ascii?Q?4NqQT/b0puyqz531eHmJ1H6ad6zE3NhLRpKbZA+6lTNp66RAWZ2O6V4FioqF?=
 =?us-ascii?Q?M1+kJfPvbH6pU8k3MKrQeyHX44LgjHVVQUITds0A5+zALitimmCZpgWCKRsF?=
 =?us-ascii?Q?cIxiVnAoQHdJ0Nb1hZNCnXLJwbGgkso0MZTP89kd+fTV3BEIaX1/BtosDZxr?=
 =?us-ascii?Q?P0PRmir7MNEAaufhPTyUJrU3nYHYkcBfS/Sf2c4QzU8L1bqbUMkIRU8wRRcZ?=
 =?us-ascii?Q?UP1HLztUW5mWAmhO/L33wtrgCkzBfHugMRgrpac/EfrCgYGaBGyTVQDQMrbL?=
 =?us-ascii?Q?i5y/WIXnC7P+U5wdl08DhcZkUZN6Ovic0XagcckzT77DlKzkFbImgHn2qIF3?=
 =?us-ascii?Q?U4Cxlw748pHmCfC+rpla4/xXTv3UAPbFoYWVurFa2IGkUOniApYGk3WoGZ2g?=
 =?us-ascii?Q?hzkUBr0r6C+S1WDTJPNLGoclr09Ee31lpRAJswDYNljjXuSiKOHcBsOKzbUq?=
 =?us-ascii?Q?FVlsxpr88c8F8QGDM6kmrLi/LyEwo/jPYZZV92natvRfTvO6EK2lKrPyPVuc?=
 =?us-ascii?Q?CrrACeJKqVNzz9Hx9HLyc+GVoaXlTdJuwqNFxMnYASek7v5V5GyCIG4d+H1N?=
 =?us-ascii?Q?5Utoxx8Ot1zeU1PNh1KZcFciOJy8QL+vuxf9fW0Ch8D0hG9D?=
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
X-MS-Exchange-CrossTenant-AuthSource: LV0PR21MB6859.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ff50ca-0a1e-4e13-b587-08debf796fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 01:02:21.7740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6K8N8iDSpO8h/j5FQAXrxDolH8NtcU7ZKgWCsVxFU4CaoIRTTOX1+M9Ysow2cylUvVVhQMxWDdB/QNgP4frVnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR21MB5924

Hyper-V uses device tree extensively as part of our IGVM support for certai=
n configurations.  What I don't know offhand is how much of the DT specific=
ation we implement or even support.  I'll see if I can get some information=
 together to help provide some guidance on what would maximize the compatib=
ility between COCONUT-SVSM use of DT and the Hyper-V use of DT.

-Jon

-----Original Message-----
From: Luigi Leonardi <leonardi@redhat.com>
Sent: Wednesday, May 27, 2026 9:15 AM
To: Jon Lange <jlange@microsoft.com>
Cc: coconut-svsm@lists.linux.dev
Subject: [EXTERNAL] Hyper-V support for IGVM optional parameter

[You don't often get email from leonardi@redhat.com. Learn why this is impo=
rtant at https://aka.ms/LearnAboutSenderIdentification ]

Hi Jon,

I'm currently working on adding the device tree support for SVSM, and
I was thinking of
adding the DT directive, marking it as optional [1], for every hypervisor.

Do you know if Hyper-V supports this? QEMU currently does not, but I'm
working on it.[2]

This would simplify the logic in igvmbuilder, and when the other
hypervisors support
this directive, it would be totally transparent and require no change to SV=
SM.

Luigi

[1] https://docs.rs/igvm_defs/0.4.0/igvm_defs/struct.IgvmVariableHeaderType=
.html
[2]https://lore.kernel.org/qemu-devel/20260525-igvm_optional-v1-1-28edc607a=
cfd@redhat.com/

