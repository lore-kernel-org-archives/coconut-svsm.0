Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11022130.outbound.protection.outlook.com [40.93.200.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E777FD;
	Thu, 10 Jul 2025 04:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.200.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752121983; cv=fail; b=U4Wjq2CromHR3SKuxMtAqesddYir1UyuBpWtgtcUykvZExiWfLvXPJ/dQ/CGwVwf+Njg4RvsTcD2nMxOWQffBghJfalRPeIXhUTL0HcYsUGUFKk+MBlGGUZ8AfzdqzmGniUSmlN4n5QjY/kxv3kdPpDHGaQSpxlrLCaSQ9EMwa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752121983; c=relaxed/simple;
	bh=1i6tnSLlRj4MvIBIojPinrmpJZTqtaO06DcfOcwV634=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pLdIp0chPq3RQAJtmDZowUVqZqQ9eGHgBqKQ6blsg2g9wsesiGiMnsH9ZMq0OsQmfGxnv5BE7Tlq+78Bw4clwR5YICLRdbst9EokF24ldNq/S8IbJtG7nSW46QylVINWwcLRWtU8xyM2Ei96eQrOwps2LoBPSljjg0zurRyEt8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=NfYwmMf4; arc=fail smtp.client-ip=40.93.200.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="NfYwmMf4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPqtCpdVrFD8Hf9X2WetoprYBhAbQJMMpJHWTTzdiYS4aDtPWqIAeqlISBEHUE7fib6gpHVES816GDvDe7i6N/9z8tgtoBpNVz5xMK09Q8WZvZrhUCL9X661Z8D5DBTpisnnsdc4kVruQlmvLoRJNbZNeSMFI7uTem+np4sB30Hgofj13CwrOVoAijnVFg6RjVH8HkFMVzROgakvPJcQgqXJmn8USJ3GR2X8qq3X5KIpPeJrl3zvgUHrEat2b4PKWtReJmapU06qb3xMaqlf60ZUaCoBd61D2KQ48ilcxURmFrYKGiTD/UhCQF44on6KykKgem7/mjKYeWqrEiGSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjYQEKrgijBAIRa83X8g5LrSFj2cLSWLpPlAQZ/Gxm8=;
 b=LE0og+VZb88YlQOjrjcHcRfR+Apw4efUe7Syfz2+yVGDVFz3NH2ayWjdPHG5cKik43KmKVG4BNdKwGizAs/0UOP9Z+/4XmgHME8yqze6IzJeBBCpslIbvP9ySVDtCd91CzXVynhKw2yAeVU/i1PFWlHtf+md6Sc7bUzgj9BpIw9a2IiHhCwtyH6n5vQVklZeagM08CMup0yvM8AnRyrcNiO9BTKwZLnBHq8SJKCCabm/KOyjFmF6+LdRJ9Hrzg7iDFU8XeAgJesZThXNMxrfjZiA/Ja7H+EBkOJnw3xfd1vaWqTPjAiZLAXo6V2CLw7pugubrekjPkcOqXyFhhoL+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjYQEKrgijBAIRa83X8g5LrSFj2cLSWLpPlAQZ/Gxm8=;
 b=NfYwmMf4KhjmmhXVtR3g/DdUrrUFy8FsC4T/YZPzTSaqYIq40eto6tPgsd2AMYZhgKPbzFOP/BQ3T9R6irlbQ9+L8YsPe4OJQj2zo8kcJiO6yuKrJREEsklQuqt/ejhpuUPKjJQR4sl8dXsMJrc52wjzGlUGxiHy4E+w7TSJBDw=
Received: from LV5PR21MB5210.namprd21.prod.outlook.com (2603:10b6:408:2f9::20)
 by LV2PR21MB3348.namprd21.prod.outlook.com (2603:10b6:408:170::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.5; Thu, 10 Jul
 2025 04:32:58 +0000
Received: from LV5PR21MB5210.namprd21.prod.outlook.com
 ([fe80::568:5091:870:8d7d]) by LV5PR21MB5210.namprd21.prod.outlook.com
 ([fe80::568:5091:870:8d7d%6]) with mapi id 15.20.8922.007; Thu, 10 Jul 2025
 04:32:58 +0000
From: Jon Lange <jlange@microsoft.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Relph, Richard"
	<richard.relph@amd.com>
CC: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	"coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: RE: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025
Thread-Topic: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025
Thread-Index:
 AQHb7L3M5qoEeBG1Ekqfci7NxD34MLQhxWqAgABllQCABIeyAIABmKGAgAAQi4CAATaQAIABOd1w
Date: Thu, 10 Jul 2025 04:32:58 +0000
Message-ID:
 <LV5PR21MB5210A051A344852EC30C089CCA48A@LV5PR21MB5210.namprd21.prod.outlook.com>
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
 <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
 <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
 <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
 <d579919f-6e66-4499-8634-e258af61c933@amd.com>
 <aq6225hfazqsbqgx6fhj2klst52wdfivfa6xj2ost65sg5fq2r@4yoqnv2tp5nm>
In-Reply-To: <aq6225hfazqsbqgx6fhj2klst52wdfivfa6xj2ost65sg5fq2r@4yoqnv2tp5nm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=c37c9409-eb64-4237-88b0-49125f076a85;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-07-10T04:27:03Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR21MB5210:EE_|LV2PR21MB3348:EE_
x-ms-office365-filtering-correlation-id: 7262b6c1-a902-4120-1f94-08ddbf6ad8e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Fzj5olDorVLhhCNVELxGnNAmL6bkc2MXzcMgigVvqe/B2dTRJtw2IyzHDj?=
 =?iso-8859-1?Q?Nh07S7UEePDUPOPFBgkYdQ4KChEFvF+eZekUSj6TFX4KxkMR01m4/EC9ut?=
 =?iso-8859-1?Q?yeHTzqqMDhI0mzvkM9k2rrtAG129ChV7IWlz8qEQiHTwxBxTo9Gyvif8N8?=
 =?iso-8859-1?Q?YgrnX1QUQ3CJMrbAFGR3djFMNNtWF2BFHZsrOtnemMO4A0YydKuuQecKv7?=
 =?iso-8859-1?Q?dsGx96V26J9ymw7yW6l0ts8yHqswS3hZ0eM1Xv1on3w85A6GwuR0Pp4Xlg?=
 =?iso-8859-1?Q?pcYWQ55w8ZZAwxYN7Go4Iv7KvjL8hH0/kSr3CHoyYmtArsJPqUT4zzXPqy?=
 =?iso-8859-1?Q?a1A7nczQDf5gfaOCQdpwhkyi6oo+14LcmGsJz1CCqBTCFJxtQ3IyEp5GPG?=
 =?iso-8859-1?Q?2N6kqDY/qGjKxkfPOJdaEFQ254DqrSwD1yT/6CCK7uY7S2uq4LFmo6Xh+l?=
 =?iso-8859-1?Q?GGAdqTbih1pM1CYcXoJWSM6iM5jKOCf73Q35wv3kPEmRU52AexGKnGrNCe?=
 =?iso-8859-1?Q?/3FKn9x0O/7DvRhdThyHogNPcYQwoIODTVV+UxDIyqc30V8otuU6Ekepan?=
 =?iso-8859-1?Q?DplajO/L8wL9j0hqDQ33x67KuivfYIajooEn2dNar4ZgSQX0ulfLv0awe0?=
 =?iso-8859-1?Q?4Rz6FuEiKNc3kt8uVhcCYt6L9oKbh4u2+pYn2rIFibx3y6uDuw5ZJEMabZ?=
 =?iso-8859-1?Q?wKSBvgVnfw95QR3YwwkhnVNkxJV6EXlRz06g7ATksMDxKbPSX8N/rKtQ9n?=
 =?iso-8859-1?Q?Zz0hZYNE45LNqpMIMMXWTdfJktMGaE7AAdFEOgWPDGQI7DgosHh0iYB4x2?=
 =?iso-8859-1?Q?VngSsXJynBU7RIGoel+76xOAiD6KDz07S+r8aifXxOeLxxoxEkoYAVn4dw?=
 =?iso-8859-1?Q?sBye09Zh1LNMZ6oR1Kio39POGolkilFcq6neFYHrarpZ0Bn2bhczl/N7yG?=
 =?iso-8859-1?Q?QaKmE73XX4PbjYbbB/PMnQ3LcM2mkwSCmlYzh4jBlPVlirx7bZrUcuFe5Y?=
 =?iso-8859-1?Q?2MTyD0nBvQSkrp7st5GrDS9MVtkoMl4aI3rrRtQYfxlibv71dBgH2A5nwR?=
 =?iso-8859-1?Q?u4wSKnrf1JOU30GSP9I9icDD9gAWA4S2/fEJPOrbxHBc13YB+poJWFye8U?=
 =?iso-8859-1?Q?JKD72Y/thITdXbsgdB6SnoHVP8MNdIphWiic6r3G4zTsQ9MHTO32NE/0a4?=
 =?iso-8859-1?Q?q+kdAZPOc16J0hD/IvmeGakvQtqiezWrGJ9nZL3Kd5E8j4TtuLutSwtGKQ?=
 =?iso-8859-1?Q?P7TY6mNvFj5/S1/czdn5k4kWk4GiFFHR+mqLSsxx5+Qkztwlb8uI4KsQid?=
 =?iso-8859-1?Q?N5wf2Vuz34kwtKOEZxE2W8nsM9mSgABjXECnrQihvQC2G2iLhRNvyKhhK2?=
 =?iso-8859-1?Q?cbTQIVlH9SFbPsGG1zuLzcElrTkZw8/C+X/s70BRxmUg2oO9j99rprAaUI?=
 =?iso-8859-1?Q?n2s2uXVrJHTbGP/90vDlB4PvN+jRwd3P4aJ6Q8fbCXkU7ssDJnxCUSrjaf?=
 =?iso-8859-1?Q?8MzzRhHftlYXu5KAGmq4aB0CZiIET+n0MdSnWlCjx53g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR21MB5210.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yzYhEfI2gwgqEnivUcuzKhf9VFTVNyo8IbrVfkHaj/GTcvzLJAMOTtRSwC?=
 =?iso-8859-1?Q?rfqc02aRmRUW2ojd/DWedFauyd4Wuh2stT8f98jQ9gf67ZIOxMJYHivpit?=
 =?iso-8859-1?Q?lnGtv/dPabQB1Y7eI6NwtICZhSAcCQ2A+POHY+BuHapbHJuaQG79CIYgPN?=
 =?iso-8859-1?Q?+M6ooCbP7qUG946SEeBDT8SQnAYIo8fR9ShMDjWS/3a3pG8TvcwXWTkd+H?=
 =?iso-8859-1?Q?2hFWQWJS/tYJMxkYCT6zNyJYZKHARSmuzHO1IOiuC1RYahacq1c/4er+oZ?=
 =?iso-8859-1?Q?uKlYfUY8f7XKyCbw/HWzOfgznFyKdg1nndG1hcDaXORhhgDIAzBYkBMsqD?=
 =?iso-8859-1?Q?m2aaSYnoGh3AqrjAhPrEivdU4xrF1cCRDuqi9E4+ayLEAAcQj4NZH8U6gX?=
 =?iso-8859-1?Q?AWciUr7Ivp/bg53G9iLByVI+4r8HuLACDjT8fPPo1xzY3n0bQUKxsjE0jf?=
 =?iso-8859-1?Q?X5a8g8YDroAPnUOweJ0Z24YhYNRVZV2aKIWPKp+jEaLmXW8KYO7qa3G054?=
 =?iso-8859-1?Q?gK1UT4tvY9xevozgg8Lu9RfrlGBu3TjeGmA8PycTK8ABW+k3bmWtx/q11i?=
 =?iso-8859-1?Q?BGDFKxmQ4sLhNrlG5j+4kwvckxWmLpbOnAYzMQWtK0CMlGmsPIjexKcpSQ?=
 =?iso-8859-1?Q?1ORYRyrdU40EgxTMxHmJp5jIIiPK2QGNDNCJBUwQHV3fXKLPdx1Xzs5hc7?=
 =?iso-8859-1?Q?Wqv59Vg2w9BtAGsrlwXAqBXLSB1ANQo0MV7YOdx8uCd6hgiOL7otmRvcKT?=
 =?iso-8859-1?Q?NAbse/W0F7V+ADLk0TBebKb3IIIh5YlwqUzHf44mWV+Dm+SRgzKcFaM4q7?=
 =?iso-8859-1?Q?em3+cyiLFdkNhD9ZqKoBMUiEnNXI9pPwrxfj86fUrBYU009ozVE0EYt2c2?=
 =?iso-8859-1?Q?h0riM9Aw6yNyVB/zUAgWIrBSJ0TtTzMnCXoepltGxFDJBQF/RKDJ2wFy8S?=
 =?iso-8859-1?Q?+sliEF73SNmDEP+q7j3tyhDfSJfn23IygtD5xJAlJfApY2X2wE++JMDJyQ?=
 =?iso-8859-1?Q?WgKFmKiyNm8QaD3kOxraxxGTUuk4Tv3n1EWHkURxa75xXBFPKHoBfejMRs?=
 =?iso-8859-1?Q?O7bDvzO09bBnNDpzMVgb6k0U8RGrFMI3iWKPJ4WSzQu/NzUvxKU5eVEwdZ?=
 =?iso-8859-1?Q?aA58yGJzUk3qmCOLW0TopWshEASDqeShZ82eZ/SLEp88tT12Ob+IaQ+rXC?=
 =?iso-8859-1?Q?yk939XpVcX2zf68htBumYg9I7qFglAWyotVQhsNJj6Cy9j/NohhlWZiaw3?=
 =?iso-8859-1?Q?DWWRCcgRhbUuagt00cTFC8yjssQGMe0UvSiVK39U8dqxv6xJjuJAtHlAQd?=
 =?iso-8859-1?Q?ob8K0HtM6TkSQ0xI2q1CzIgFDww4uieJrty0J4QPxXB0M9vv6b2pM4OcWy?=
 =?iso-8859-1?Q?ACFKv3CoplgntnFbOv5TaZ+hzkNxQY0bJURa0GO/lilOrFw7fo+W7zfttF?=
 =?iso-8859-1?Q?ootEFFAE+WU9CCyMEqrYqeuvxO0KcuxvVzRTbechDCYVXwX+xes0a1QrPk?=
 =?iso-8859-1?Q?ixFP8BZX7Xio2kusAzacWgKV/frXLbZcF+vbppPtG1nYWp7+cG2meVlg0E?=
 =?iso-8859-1?Q?oi5khQyZSOMcyjseauDTKcchl/hpwRoiVkVEyNHM7KphY0DwUoJ8o9/Xyd?=
 =?iso-8859-1?Q?Xed7sXRG1pj+QslauQRu8Ay+4hjajzICi+iPLc5Vseqs+Y84bM9jjvS9Oj?=
 =?iso-8859-1?Q?BebyOQjwUKIYALjVOxZgULrVAVBW599vkviGWc1c?=
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
X-MS-Exchange-CrossTenant-AuthSource: LV5PR21MB5210.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7262b6c1-a902-4120-1f94-08ddbf6ad8e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 04:32:58.1887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQl+J/F5Igll7N5ZH6ye5QgZBBH5fLB+nrCR/URlLZnC52YLE4Oc6SjJc4CfUwk1ivQByI0h2ut6V+b0fXv0OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR21MB3348

> i.e. support for SVSM_CORE_DEPOSIT_MEM ?

No, the SVSM knows the full memory map at boot time and therefore can know =
the amount of memory required for all bitmaps as part of its boot flow.  Th=
e simplest approach will be for the SVSM to carve out whatever memory it re=
quires, and to tell the guest (OVMF) what memory it has claimed for itself.=
  There is no need for additional bitmap memory unless the guest support me=
mory ballooning, which I think we can consider out of scope for now.  So th=
e question is what is the best way for the SVSM to advertise its carve-out =
to OVMF.=20

It is the case that the guest can execute SVSM_CORE_PVALIDATE on every 4 KB=
 page of available guest memory, and the SVSM must be prepared to handle su=
ch a case, so there must be sufficient space to track one bit per 4 KB page=
 of available guest memory.  It is also safe for the SVSM to return an erro=
r on any SVSM_CORE_PVALIDATE request that does not correspond to known gues=
t memory, since there is no expectation for such a PVALIDATE request to suc=
ceed if there is no evidence that there is physical memory backing such an =
address.

-Jon

-----Original Message-----
From: Gerd Hoffmann <kraxel@redhat.com>=20
Sent: Wednesday, July 9, 2025 2:44 AM
To: Relph, Richard <richard.relph@amd.com>
Cc: J=F6rg R=F6del <joro@8bytes.org>; coconut-svsm@lists.linux.dev; linux-c=
oco@lists.linux.dev
Subject: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025

> > I assume you mean dynamic at boot time?
>=20
> Jon Lange should weigh in here... he's the expert on this.
> But I believe it would need to be dynamic at run-time.

i.e. support for SVSM_CORE_DEPOSIT_MEM ?

> Being able start with a "reasonable" amount for page state while=20
> allowing for expansion later if needed is the preferred solution.

What events would trigger the need for expansion?  Would OVMF (which typica=
lly would run for a few seconds at boot) need to support that?
Or is that something only the linux kernel (or other guest kernels) would h=
ave to worry about?

take care,
  Gerd


