Received: from CY4PR02CU008.outbound.protection.outlook.com (mail-westcentralusazon11021138.outbound.protection.outlook.com [40.93.199.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A725195811;
	Fri, 11 Jul 2025 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.199.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752254651; cv=fail; b=jvmEjmSdakXegnDAx3Mm1g3sqYuCUoPUMA7+ljvUv6UmRQ++bfAFi3vvrsttbtm/DdjcNRkaoeLV3I/jczAHMyg7bTb+tpUY17oj+hXiAAJ0mPjqEUjxgQN2R7a1A8CzAu7D8WMlMEfqyN3K2S1imjdfvwJ6o4ROqfmW0Rh2oEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752254651; c=relaxed/simple;
	bh=J33gfekX6bh6KzW+N28FY/WEmVxOHzzmaRFnR+v9zi8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eD01ZDGJ/fa8NC3Um2CdZQWG7k5gsrb5l+tEbQgTVileIG6UjHQWn8eyI6krF7WKwpbd9WE6rIDj+prMs4aduP2ppQgPdgiMWCdQA7t/kUAxUQK+UKlfL4/V87NkzNr/sro/9yrIhkVsvoNwzGpqUYlTK1XbxJOKl5Kplf79wgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=OmXqj1wG; arc=fail smtp.client-ip=40.93.199.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="OmXqj1wG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tML/bbnUBf9AkizWMy6ZHwjF6Y+PBD0KTuvGrHJYyP02CkqHQp2F0fHJhtTnbT9oDK13PEmgi5GDfOmh2OiYVG7gss9fd7T0iPjNy5UQLP9YNAHTQ20ai7asTpyJ1HY6VecjXnqc5T8J4eddC5ImOlGRv/zwJz4Qj0yMuaA6V1mmGzEfiBxXoJfSuxf5VrxkSYv1X0VOI8TRJ2NRk0b+uetiHA7fZZGkY+ibTdzyqjRh/bmR96SXbj90tFwHSMtxLFOFX8eIRV55l6kTsphfD4J97C3/70bPDZKJ4wo2MHoFDD2gLIu/95bzum6VXq5ffNVd5CySpPYvpX6San2PLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOSq8wgd1NG1flkoAN6ZS+XAgdMMV+1fdzKmRmJZ6lI=;
 b=fRtnmjRmit4ZevvaCMioCjiF13ONISi9VN8xLOW8GhyvWdfY7pqCradySHjO1M7QDvr/L7XXcfRTQiNguightQSu+AZPSGkN71mC0aqBk2ofuN1HA7w0O7KZ4QcGj5m5uiduBWWmDFv5SBAONPZxXltIzHnXQJF7VPU76a3MMckL5LYVJ0bD4C+GSARMZbRJsB9pqt4CmkOdaiuDVMf+5YwChZm8ngFJNSma4RaV0kIKRRutpUHG2ptS04f49aLq430WPfnl8d4r6Wm5jVAIKAmbe3wm5mKIQ6jo0uWposK6T2apLUd58/UcycS1iCEJr0jzBanakhyZv1bg91046A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOSq8wgd1NG1flkoAN6ZS+XAgdMMV+1fdzKmRmJZ6lI=;
 b=OmXqj1wGDy4jyLn3ujgMcBxTnRkTLDGJv0G6n3u2eV3Wlk6RgPtWRWHPl+ipW8Xhy1Z30pU7gAC9TktNMIbLOEnYRlrb7qdGkJBW+Pv6dDalQPKaTN9w+MhNpRMlou9rqA0z3S0CoG4AskjWzUpHb5Ui+hJxaUrj7iTs9CNBkf0=
Received: from LV5PR21MB5210.namprd21.prod.outlook.com (2603:10b6:408:2f9::20)
 by LV9PR21MB5356.namprd21.prod.outlook.com (2603:10b6:408:2e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.11; Fri, 11 Jul
 2025 17:24:07 +0000
Received: from LV5PR21MB5210.namprd21.prod.outlook.com
 ([fe80::568:5091:870:8d7d]) by LV5PR21MB5210.namprd21.prod.outlook.com
 ([fe80::568:5091:870:8d7d%6]) with mapi id 15.20.8922.007; Fri, 11 Jul 2025
 17:24:07 +0000
From: Jon Lange <jlange@microsoft.com>
To: Gerd Hoffmann <kraxel@redhat.com>
CC: "Relph, Richard" <richard.relph@amd.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?=
	<joro@8bytes.org>, "coconut-svsm@lists.linux.dev"
	<coconut-svsm@lists.linux.dev>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025
Thread-Topic: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025
Thread-Index:
 AQHb7L3M5qoEeBG1Ekqfci7NxD34MLQhxWqAgABllQCABIeyAIABmKGAgAAQi4CAATaQAIABOd1wgAIqLwCAAEBL8A==
Date: Fri, 11 Jul 2025 17:24:06 +0000
Message-ID:
 <LV5PR21MB5210915F19D877E261E66ABACA4BA@LV5PR21MB5210.namprd21.prod.outlook.com>
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
 <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
 <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
 <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
 <d579919f-6e66-4499-8634-e258af61c933@amd.com>
 <aq6225hfazqsbqgx6fhj2klst52wdfivfa6xj2ost65sg5fq2r@4yoqnv2tp5nm>
 <LV5PR21MB5210A051A344852EC30C089CCA48A@LV5PR21MB5210.namprd21.prod.outlook.com>
 <auq7txxlerpwzl542o6rkjams22cy6rb2xoi3f7lbej6u47svi@rto2jldlvxyh>
In-Reply-To: <auq7txxlerpwzl542o6rkjams22cy6rb2xoi3f7lbej6u47svi@rto2jldlvxyh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=c33f7a7d-a668-4fda-8f63-feceedae1b77;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-07-11T17:20:40Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR21MB5210:EE_|LV9PR21MB5356:EE_
x-ms-office365-filtering-correlation-id: 5dc4788c-b6df-4bf1-4e9c-08ddc09fbda6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?w0SU0Eom1+Joi2dP8oQ8YO/YqMHb7bQHjH7iwaO1bKBP3pUVZKE0Q7wNi1?=
 =?iso-8859-1?Q?OSPCpY6r8DGio+U2yqvlt7AXeP2F3c4cDK0W8012kYGkbZEmIruVnJP8dC?=
 =?iso-8859-1?Q?goPhttmxlgEyToKvLBy1rWsGnydqvazUUqjMh4z2A5k7Wu+rOz3lxduF9R?=
 =?iso-8859-1?Q?uDYRsS17EnIqd8sGtjvCpFjlCt7JmLkvx8/agwuxkj9ZrW5U8JlNIOAFn5?=
 =?iso-8859-1?Q?vQW4nRCHVo9jMIm7WC6jwa30PPi+3ZDP+5wHz2pKNo1+nznMxJ1MK4I/lZ?=
 =?iso-8859-1?Q?KN3t8mMrcERVLDkC0mtIvzxVGZN0hYUAMy9QA+wYfFZ61JrMXP3WNMLbTX?=
 =?iso-8859-1?Q?wIHBUqaJeLEAs6C6otLuemVrLto7VyMa13NxLr9lh/DXtY+aqXcydmI8X3?=
 =?iso-8859-1?Q?mosaVjkLBWiE24HH/IC99L+h3lkVJgYqbEZ7zL665EPMwZ0aRnTZMurfLi?=
 =?iso-8859-1?Q?t4JbKbEDzLSUKgXmeJnmRxljkO0yT1mlsC5yKFxIoBnGlZ9dDee4jjo9ZV?=
 =?iso-8859-1?Q?Ch/2oFb2+il3gkduE/7gbrWpZhDzovPlc4HvsHNpwoFGTBvFJ+SQo30B1N?=
 =?iso-8859-1?Q?+zKAmd1Wfx2ABAGslufh+h5NKhSA3evzDv8F2tDiL0fWgu7azdTGDzQQSp?=
 =?iso-8859-1?Q?ynxi8j4/9EhoNqiPdWmw+f21shGrC+wWgqPnbbtPxal9eTTAK3AfDNOa+6?=
 =?iso-8859-1?Q?Dr67xU0zOHkpIvWoEvlOifDx1za1Z5Myl4ORGKkiIfelVxqYwK8vF7+EY/?=
 =?iso-8859-1?Q?prFkkXUmTHjaQ1xR2QMxAUZlqlV2yUcduvDAdyt9JMtz/bDYQQ+kJLLK31?=
 =?iso-8859-1?Q?Bgwusnti0vTQiY3YbKDsxExR8bwr2ZR/F3Rab/XqagBiP4uhW6sF8ARISs?=
 =?iso-8859-1?Q?XG0mhMVkulnEGUfWf1H8O3NisfjfPw6MOHgHM5K+hG0HWkK29DxkUki/mN?=
 =?iso-8859-1?Q?P7yOcO/cppS++WcuXdMfTNiRBikfX/Ac0Pzeqp5i1tqbpqspIZTeh99g8E?=
 =?iso-8859-1?Q?ZzglaytgPkqmG+Ss2Z5oXmTRD0ZR/QlQ+/cFEua6anN1jK7FgB8LKIAVMT?=
 =?iso-8859-1?Q?Fx353Jfj2GGHUd2Q2Ty6TqctCiQb1iJ137o0l5STTWP6A0xm67hmwZ86DB?=
 =?iso-8859-1?Q?Dq0bDUalOwDctZhcB+7Z/xQY5Q9UaGiViiL6rngBwoWG7CIk+mIZAwmIJs?=
 =?iso-8859-1?Q?cOosvqToJJ/vQq/93bMAONEqCwxlXa58wPwa2FCbcOe6SA3E57rn+r/270?=
 =?iso-8859-1?Q?ru7tLBMCH2SxlhoYObhTrbMIwLiJDo96mz6wWTYzB/H3PTpndIEhDDWSQ6?=
 =?iso-8859-1?Q?u/9yxoeuLJLhePcYe0yrfNoyoFEtmURSGvL9uxVuJWjvFIok9N9gt3TGBz?=
 =?iso-8859-1?Q?ABi36hvB66lPJ6R1J1u34qJcjQZs3edlVZiz7wXVt6g27cIqKtKrfk65Nr?=
 =?iso-8859-1?Q?HH7mr82RKnp+pOINnQAJPewVhCJ1z6OsbkbR7dUR/RoVzGz95wUp6Fg9iR?=
 =?iso-8859-1?Q?w5BdOknZZM1fPkbBi4rjBd/r3BfrTIBldU2VS9i5Gg3hEyIjpktvXhPHF+?=
 =?iso-8859-1?Q?zaf+Eoc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR21MB5210.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2/E/Xcnoi9DIxM3Gm45+GFKlpmDF3iX4R5f3KHWORq+olOr4LEik33R54t?=
 =?iso-8859-1?Q?V1yngNqzrlLPiZca2vk/3UnmptMemug281lQzI1fCU+7+eqJtd0MtXucF0?=
 =?iso-8859-1?Q?Xr1DIcmav67NEev7NOjyBFIPlMfR3oLz4JU4QZZ2t2Y9h2SpilWmvjBPIg?=
 =?iso-8859-1?Q?rzT3RzZUFsJ3txyz4ILLbcbivq3DF12PXpJPOHr53EJw6NjRRa8SrkUoLH?=
 =?iso-8859-1?Q?dbhurZiL29+gye+cBC+P92X2R9ETDRQ75QbVZO0QTIKDcvhlGwOdRbaT+r?=
 =?iso-8859-1?Q?/PbMQcEeKDhwsEOeUGT6hy9jQhQJHnFwZKxNc5eZeqZjOUMQKKRnKk4ZRP?=
 =?iso-8859-1?Q?8yC3ty4FEMvxN98YgQ2r+77xyqxBfxkPfi7D4MbP+7os30qrRN3Vgljek5?=
 =?iso-8859-1?Q?fYnp8mX6fHGIXD0sFFFkbsO2DR4nQat6iID40fmm6nNiSo7y5uc+PcMk9O?=
 =?iso-8859-1?Q?ZcmfmOVcATPlmtajjnRUgY8G39G2Y/Vna+b4uqvG4p2hLo5w0OndUvgsjy?=
 =?iso-8859-1?Q?8d4rVdZp/STf7KPGB32TEheYeiVEJTRAz2dJZMs2bPf8nlfzFMZWlAPtp2?=
 =?iso-8859-1?Q?9PqlhY5bAwcPpoSNv46WA8E9a9B8zhs3QzFdhLmn3/n1NlFbfySDaCLoUP?=
 =?iso-8859-1?Q?TAPJrC3zt4dm5766fOBNR0+iiA1dp4wQRO9kzMLEpcq45VLoRwCSLi+FHc?=
 =?iso-8859-1?Q?C536QEA64q/sDzgP0uU4zllCW+UhuQ0/040uSxN88BFG54JJNuOBFCPEDM?=
 =?iso-8859-1?Q?i4yB61ADfdJB0xTDlVV4AVsYxwm5suLdIigtV3YhIx43chNx93Y3eZl9oq?=
 =?iso-8859-1?Q?orOlWRbrCiBt309YNTglEmjKMuhnKIr2HR7Fxhx3cTWeA7PQixpdvpu/i6?=
 =?iso-8859-1?Q?gGV6eGq79bVPB8XYEf8vRVQ/dPkYyBC4sLSgr3KUMmFDYSi58YJ1IN1rTe?=
 =?iso-8859-1?Q?aNvX+VNqYxwImYpi90J+KBmP/oRyFFwtVvYqccXXU1WD3c4q3YoFa9VYzY?=
 =?iso-8859-1?Q?/PGit6ZuPDvD1zEoRXweVzJQpnBFj8Q9pZdkHfQG1OdmMk7QlGDx8tG58e?=
 =?iso-8859-1?Q?o9fGCW8RoymuD7cURpPm79nTdWioBlcq6eMFMorMQa+B8CoWdQ1uKczOHQ?=
 =?iso-8859-1?Q?MnTIkkd/bH1Iayg9AihKT5SIHE9dZfiwgvZamy83e3A5b88eljo+0tSD1d?=
 =?iso-8859-1?Q?ELzSKpTEMwFE6X1QDnq8SKu0M270cwIZqjS+sP4v7Kvp2pf+UF477n9AUz?=
 =?iso-8859-1?Q?xRcubvSxN2QynoZcDffMacjqAkO+8CGXvd3/9TCZueToJgd10R5fCsWFM/?=
 =?iso-8859-1?Q?ZGJIJefhx7w8qni02pY0Ggp/gyjppQm9urGuyOWSXsRNxIZDCtwNAH5ar2?=
 =?iso-8859-1?Q?8Ltsu5b9fBvZg1Ifi9vEiM6l18GsFANbc+84P+FaZ7qo5HLqaBuTqsqWF7?=
 =?iso-8859-1?Q?jhHT+H0hqqVZKuMCIXDJ9LQbEujRGVOE0HBXxHt0So4WI5qufisebV7dS+?=
 =?iso-8859-1?Q?rRuC/xlKnnQ7bQzerr9iX49BiXVewbsdc3sT20x9qRj+6q16VIJdymW8Pi?=
 =?iso-8859-1?Q?YYsNo2JAJUS02pHvBKATt0e/5vfs8ymxqr7Hl/AdEHHknHH6x7xbUTjLfE?=
 =?iso-8859-1?Q?bMy21CbCuRHDZhJlD+XcrvTn9gm9yJf2ZYcu8gQyc+GRc656pytPTFgCXF?=
 =?iso-8859-1?Q?WPX7mDUnUCflC5dDwHf1+S+fo2dtBSd1kBClNlCV?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc4788c-b6df-4bf1-4e9c-08ddc09fbda6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 17:24:06.9956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5U9R0EzDMWyQk9XvCWEmFf+Rp3pgWe87hUfquspXqhNruit9mvysnN6zW86hyP/vgUBKP0QZBL177f6iI049ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR21MB5356

> OVMF doing svsm calls for this should work fine (didn't actually test, bu=
t OVMF does memory validate calls quite early at boot, so I don't expect bl=
ockers).  A protocol along these lines should work I think:

There are two challenges with using an SVSM protocol to discover the memory=
 map.  First, at least as I have been led to believe, OVMF isn't able to ex=
ecute SVSM calls prior to the point in time that it requires the memory map=
 to be available.  More importantly, though, SVSM calls are only available =
on SEV-SNP architectures, but memory reserves for page bitmaps are required=
 on all platforms that support COCONUT-SVSM (TDX today, and ARM-CCA in the =
future).  Devising a protocol that only works on one architecture doesn't l=
eave us in a very good place for the future.  Whatever design we produce fo=
r TDX should work equally well on SEV-SNP and thus should be our first choi=
ce so we can minimize the amount of platform-specific logic.

-Jon=20

-----Original Message-----
From: Gerd Hoffmann <kraxel@redhat.com>=20
Sent: Friday, July 11, 2025 6:31 AM
To: Jon Lange <jlange@microsoft.com>
Cc: Relph, Richard <richard.relph@amd.com>; J=F6rg R=F6del <joro@8bytes.org=
>; coconut-svsm@lists.linux.dev; linux-coco@lists.linux.dev
Subject: Re: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025

On Thu, Jul 10, 2025 at 04:32:58AM +0000, Jon Lange wrote:
> > i.e. support for SVSM_CORE_DEPOSIT_MEM ?
>=20
> No, the SVSM knows the full memory map at boot time and therefore can=20
> know the amount of memory required for all bitmaps as part of its boot=20
> flow.  The simplest approach will be for the SVSM to carve out=20
> whatever memory it requires, and to tell the guest (OVMF) what memory=20
> it has claimed for itself.  There is no need for additional bitmap=20
> memory unless the guest support memory ballooning, which I think we=20
> can consider out of scope for now.  So the question is what is the=20
> best way for the SVSM to advertise its carve-out to OVMF.

OVMF doing svsm calls for this should work fine (didn't actually test, but =
OVMF does memory validate calls quite early at boot, so I don't expect bloc=
kers).  A protocol along these lines should work I think:

memmap call #1

  IN  RAX    $protocol.1
  OUT RCX    number of entries

memmap call #2

  IN  RAX    $protocol.2
  IN  RCX    entry index
  OUT RCX    entry index
  OUT RDX    entry type (e820)
  OUT R8     entry address
  OUT R9     entry size

Comments?

take care,
  Gerd

