Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.113
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794595813;
	b=jL9gO5RSOEwo6b422xcfjPMRp6VZC+4uE9Rfrvh4fONiC+13TnlXSuzkbTMWRrJFnkjQ
	 0CwpmAw58Wv9479jHJUt1y4hgnbPueY0DKa+/fboahdYz7c0Uo86KgrjTu9+ma0dmwKQW
	 dtLT0kQiz/tQxepmJoJxmMQte9MHeC+Im8TKsCx+ar7FO1EbQ55lcEjUnGI1nz/gT11PP
	 sgM2C3aaFoiA78zXPIuhtOv8cF6AauP3PAZy3HuO6LbrUQW/95fHc8hagG8h+5kHj5mm4
	 PkyzwguvBLatqmE95vYW4V2T2KUPjWHi6JSEuk8AYHJFgE8jtLGD2u9GZQzvKuX0yVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595813;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ms-office365-filtering-correlation-id:
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
	bh=nbqjQTX5J9ef24kjuOn39E3K01OmO0TEw6BSh5gmDrk=;
	b=m2ulvJ2VEFw15ogjIvlt25J5O/uhbXi2sDsxg0EEM72zm/NhZF/jL4z8J7j6+7r8K2a7
	 8UNksdwBftD2+ztc2pYzFDPHCqUWNBNWQmgqhfDJ73urQGlZsrE1hnmZU50iI2oQmYwMk
	 5Cf0xCjkw0vGltA2ZVrK9EYolDc1uaaT4veWJdNEq2273aZwP0kxjrNxB+jFwV5baY4Io
	 QtYqJVXywIqTXJuJCNU555mcD9AUuuXiwUu3m8gJP1zTopzwWzkNgvwvMRp1wK2Mf7KdR
	 acIu2azW/CXslyWmW/CE6dC6nWkS3tlH1N6hkdQArc8hb33TMxyRC7SuWIrrXHotKYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microsoft.com;
	spf=pass smtp.mailfrom=microsoft.com;
	dkim=pass header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=RM0SPPwH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.113
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11020113.outbound.protection.outlook.com [52.101.46.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C90606A327;
	Fri, 13 Nov 2026 18:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C90606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=RM0SPPwH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlIJfW/e07s4tqHlnoc+qZY9Gr2oRcSvgmTk71JMfsT8Ly1LhDh7yi6GlScKu8xmVzWhtfFPxjb8rdHxFHhxt4t/vz1+F3DwwiJAHBNfFoZpJas+T7wcU7nrhRg+33crVchZIFVSH99X2d74N2IddXimNKTVNVi7D35aoCPmT5bAWHrRvWcBRYg9zkXFYhF9cpjzmLEoJLS3SmK/ZSLCIJ7fE6BuksEsiIJ6cec3Qs+PT48gUaQAGEHeut6+ZuPrErcJEkzpYLZ6jWCiq77pOpb/aTlSpHv/QRNfE36nzA9DTCdeIVFEkI8VKPIVlHzzJRsvG7Lc205EspIM5oamDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbqjQTX5J9ef24kjuOn39E3K01OmO0TEw6BSh5gmDrk=;
 b=xAPBowvVdfFCQ6HwaYAaYxXm00VCSHPz3uE/25etJ2adbt/qUML1mQRB+RQ+owrskBYD3cDr3KwXUU7EcpmzStKy0q1Cw6M6ieOyhpf7thddTX2fv2dg2VQ1wP9mFNEISJEoSM/Szhai5FTIjb6+sYf0keTTv6Ib7Gme9fnsEX/GZ5e+RlziUjSC86KqhyDcruNqEDOXA0g7AGjPB/IWn0YcHxgFVe8LyvwRfJSbhhzb5pcNjCEnsycUQQO2UVTYq+P6+a7GH9ylwlC3UyInkxpNyDG6yameu+WNnuH674W0dBnbF+Lyn1UMuEpLRNuBy+2u32W1pkiW9USpWYzIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbqjQTX5J9ef24kjuOn39E3K01OmO0TEw6BSh5gmDrk=;
 b=RM0SPPwHkbPZSwZM59foiYL4chbhEKw89qigcLsA3c4/fj0aAM/EwQvaz38ZqEVCTZIyngEQAEzibXyDFKWEJwUHfJVt0vkn3Xs8dsiY9aKnMXxoeTQxA+CY0o5Xs5vfOGJXjINLGWLIBTapKWgQGLe78rauGshOQCTrr6OQX6o=
Received: from LV5PR21MB5377.namprd21.prod.outlook.com (2603:10b6:408:307::5)
 by LV9PR21MB5643.namprd21.prod.outlook.com with HTTP via P2P; Fri, 13 Nov
 2026 18:03:00 +0000
Received: from LV5PR21MB5377.namprd21.prod.outlook.com
 ([fe80::19e7:7066:ab7b:acf6]) by LV5PR21MB5377.namprd21.prod.outlook.com
 ([fe80::19e7:7066:ab7b:acf6%7]) with mapi id 15.21.0639.000; Fri, 13 Nov 2026
 18:03:00 +0000
From: Jon Lange <jlange@microsoft.com>
To: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
CC: "Wang, Huibo" <Huibo.Wang@amd.com>
Subject: SVSM Alternate Injection specification
Thread-Topic: SVSM Alternate Injection specification
Thread-Index: Ad1zmGvw4pGtmBjoQECYRfTA1WPNzQ==
Date: Fri, 13 Nov 2026 18:03:00 +0000
Message-ID:
 <LV5PR21MB537757DF99591B258FB4E9FDCA7F2@LV5PR21MB5377.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=11f5ba76-7e53-47aa-8942-3840ec0ab4db;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-11-13T17:57:04Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-traffictypediagnostic: LV5PR21MB5377:EE_|LV9PR21MB5643:EE_
x-ms-publictraffictype: Email
client-request-id: 13710028-e72e-4296-aff9-de7f4f641383
request-id: 7cdc6f1d-d6b6-4004-1976-08df41b05b1b
x-ms-office365-filtering-correlation-id: 7cdc6f1d-d6b6-4004-1976-08df41b05b1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|261028144727099003|38070700021|11063799006|56012099006|261026140227099003|261022105027099003|261026121527099003|261022113327099003|10067099003|7146999003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 Z2j+YlWOkhNiCFi6wa6UZApDWYGcAWZOGai1tNz2/KtbB0QJ/+uLySVXGYRILrUpZOjeB5ZCxfSTiKHHDQbEtzbKkti+62vn5IgpZ92d4L7/Btip3hiB6LqUHyOU+J7UcdY6h4B4vOWi9+YxdD1yr6bEv76wAYpb3Sc6MHu28r0KL/JBRioApCE8BY1IjPH3OWOEQ2rWxIHyMskhUjRqKWZYUFgc90aONgKcTwJ5yWjNvQtJapaw28UV8xJ+P/JDEBIQsYY+OTJ4b2p59VqbqU3VBpxsN7Os54JCeUYAN0PbjZnwC3aZBG0/rm9aPb+fbaTXqnEvb7YXxtZhRCeuwyTBCpE1YQe1QirZgY+dXBAPRp725XZdnnxHqxKHxDaQBpvq5dOIBIuOGfLJCWnQjyRXVY9dkwZWhMoblrREyLmy62RyQg724neHqAQLbsKJB1nV/zRbp0VIQWZzVWMMXyUGT4+2coQhy1wBayTSgGE5fRxRrxcZBh63iTPRte1kKTcP05d23Blh6IwhNnyByUBiK+jwBL110do2VA8JgtM8F9GDPO1mZcXDvTZ6sle+4QHGH6ekhq64M9W8tOZ6Uk6VSnrAP2WB2fxeVzjxdP1QYXZRb5V/85aDjxzN+Sk8D7XNqFeMPTCUP56eLhPXsDn2RqxVXHu+2MUCSL5zUQ4JYQxNLHRPc7knJRLTJrOWAqE0HuIfGQ1oCXkoiz9Ec/sKVxNrLiXV+QI2BsceySo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(261028144727099003)(38070700021)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261026121527099003)(261022113327099003)(10067099003)(7146999003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?poWznwl2yijXPPtzdHGZgiKKQm7JlEIQaY9UIr5XNHsQYXt8ENGiwq8sceF9?=
 =?us-ascii?Q?bAWTDL//8PN2HF3qf1sHcBqhUuTZv2VXoPpZ1X11wbGTyUq0AXAuwjnmJfE8?=
 =?us-ascii?Q?CyziTGsSbsP/mp+mySkANG0etrbjK9FvjBPHNE/+jMKdr9frIO1xlErOlVDx?=
 =?us-ascii?Q?/7MEmCbBSz7AMcZVDNrQEWipxVez+MBKQw4CYKh9wcbzBU6HlQAi1Jw+Jb/O?=
 =?us-ascii?Q?3d+RuTRy0/p1rgHrsfpMT1r/gudcWTtqZITA9FZO488c6tnKkGIipmaLafGa?=
 =?us-ascii?Q?4waG4dnfB8MnWHm2oZvBaRnprULRRWUuPCnp6vl0YsZghwWVP7xHrm5fAwB1?=
 =?us-ascii?Q?iCRB2Li0q0WA/LPzomtkMONf80+g1+3yN6hgKhRANDcEGSgmrd4BBq3Lqg0k?=
 =?us-ascii?Q?XvrWsDqzMNU/C9ubyjMHenI+qD7sQkOdF5hST+xoyfv4DZYZEP75zBlHq1bY?=
 =?us-ascii?Q?q1/uVV/79uRd+/4lRShzwPdAavePI4pcpy2pVZyXA+w3O905GaS5K05jlihL?=
 =?us-ascii?Q?VwT/y6llRNkdWubMpdhkIuuYGGhvb6YcM521kasgH1v6kiCBZM2kUhmwJC9o?=
 =?us-ascii?Q?K8i1p5XwA950D5IPV/arhWxs6AOMeE0idKOwvgirj1dXlX0HFRYFAugJBbfm?=
 =?us-ascii?Q?W14rlWcVqVYzB3rFln5VLc7vLag9l9dLIx4coVfRZBQ6/nYBA0vjZHhSKfrX?=
 =?us-ascii?Q?O/8l+CyXHhhSd1ILBIYmluXAbOJaBU0UzQDlI9hB01oXVZGqVAT0HwoA7L1x?=
 =?us-ascii?Q?WSRF66/MST5iUgnpO/96myxrl9FnTdfUx664sWjhNM7HAgbuyFC9ArOdWmTo?=
 =?us-ascii?Q?FHZ0eGTpDxiZ6Wwob3NIOLTk5Ns35lK8VUETPeSaKLV49oJ7T8PTI2/kH0Cv?=
 =?us-ascii?Q?UDR1fgdjOH7wuOKhJhuU5VVVvG1lUfiMQ8zVoNUil+g9icCOf6oNw/bu7b+F?=
 =?us-ascii?Q?u+26ouE8arTQfWrnaAgSyNWMGCbrXjNbTI6nM7c8q00g/IeQaBIIDXwm8CaJ?=
 =?us-ascii?Q?Nfdz63HX4yZRugagbyw4eApMW755IMPIcVob1HZ6nV74ojDROp1ClIrxiJpe?=
 =?us-ascii?Q?BpUirLiFIFUjGoKFEXjh4MCasbVxcFm5WxzfHZAbzbOTFW2YgR2/cxMY99gL?=
 =?us-ascii?Q?kGgwjwpZPUSQt0Hrtd0tmHjp1T5khiv2k4BgTIO+G/DreTQS/yisT6lY8bEx?=
 =?us-ascii?Q?Y3PMGtaD/ujtPPjaBNQ6lToQ/TBIDKt3vUX/y2D7G4QbwPozfzIy7xO8ww/1?=
 =?us-ascii?Q?X7eUHDQzM2VMp2fInf7QNndUTQffhsURpBozzHmDPCNaBz+Z8mau6sjk4aLc?=
 =?us-ascii?Q?FAGY6RXL5RhJ+Xa8VARGBtwU20sUhR2xbY/i4B300cO7XNA8TZqS0rNn3ndf?=
 =?us-ascii?Q?iBiYDqcbJCBv+aEZxfQ+L6PFMpKXGoEkkkZ//w1D52ca6ETDvtUU7t+mwqYx?=
 =?us-ascii?Q?nl6W/UO7VsVou7/gh6O1L/maSxwmngFNxOOeVs0TC4hyYPVW8bALwYnbX314?=
 =?us-ascii?Q?PyxyfdbL0p1h3Wyy4LE6o2RiogcxfPyqeNxUaeCezYFCMr0NVPwIzLZFP0XG?=
 =?us-ascii?Q?fMg7+fPLyU4AAP7fFXetsDOlT6GsZiSeVl6TVnlKE9gz77n8uOTBbnrsqWYa?=
 =?us-ascii?Q?y4j0lp9WR9TjGIZcQeOYXobrib/U3FNmB75vidIkWSofHf5mxqa+zqWOFrKY?=
 =?us-ascii?Q?vZ06G3V2tp3m4uwIZWClKWjOSMlpzgKBzY3uaVfyjzdEdXQz?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdc6f1d-d6b6-4004-1976-08df41b05b1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 18:03:00.8322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4siVGka3vCsr5tNAkX8KTO7PSAbZBP5G22mCmXtCbc04Jj7vkB2IK1igi6FGc6zYbB2WeXf8IuOdvSGOW0jS2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR21MB5643

Melody pointed out to me that the Alternate Injection support she presented=
 at KVM Forum is based on a newer version of the Alternate Injection specif=
ication than the last one that was shared on the mailing list (back in May =
of 2024).  For the most part, the differences involve clarifications of edg=
e cases or inconsistencies within the spec.

I have placed the current copy (from June of 2024) in the COCONUT-SVSM repo=
sitory.  It can be found at https://github.com/coconut-svsm/svsm/blob/main/=
Documentation/docs/protocols/alternate-injection.md.  I expect that at some=
 point, the contents will be incorporated into AMD's SVSM and GHCB specific=
ations.

-Jon
