Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11022108.outbound.protection.outlook.com [40.93.200.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBBF25F994;
	Mon, 14 Jul 2025 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.200.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752509896; cv=fail; b=VYPZZtZDY7Edf6VCaK0KTtaglLg5Kj5i3vxOs9604+UpnjdOnwb+dIwvdYyTRBe0xne3LJrulMBm2uJnQg4UflBzkgHtN8OHifL8YqyNg0LDCk7mF2PThuB1MXzCyoIM92SEvnmTYFRXxaQFhAFi3ktEOLsKMeI1bNAOxpo7HgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752509896; c=relaxed/simple;
	bh=D7J0QFULn96Ei6eDaGMdzi8ULbEe7v6puluEQdXXm7Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ops+Upcm+iXAPTYCrjyPQEkPrtrdAQVOwphLk55NMst3wBhvBTeC6EnVnkS1kzm4SVHOTv8XCSdqQ+ghoUCUog/JT0EuC5C2L891iQOSeJgM++Dpu06URCG7Pa8r8xmwRyKMYMufIf3RHZMleo8y01kY3Pwolrpd+OpnYhiGSC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=GI44P+2C; arc=fail smtp.client-ip=40.93.200.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="GI44P+2C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjnV0JBWAvECq8L+jVnecoHtsJ8zUAfqSH74oyVEKim5IGB4CmBIT16j7EbNXhkKKtnabiQY2bkyRnyhdH3G45fBnGGKF+5nIEJxi6KxxuGGxcOh+pUKRq+yk+UQlIzcfGwSNwazPXnsxQG9uLR+mc45KAfef9FWBHvmIqgoVpeY+kQrQIQGQUwCo35Mjh/StfRGs/l/pagtBFN6DH0hHBgBTjPjPHlQR7yXV9J1rWQxY0QAaie5FR1wDdk90ObnEKfHD3JV0lc7tduZUatuDsIILcc9MQVx82mIMXRFpkSf1/LZDptzj3vXjSqNSwCSfPcODjr1b05/XnUuHug5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iztGRHc32+qwwMwaCi63Y93mrab7LGB2Qn6hxLjIJrs=;
 b=MP8mUeSY6Alf3oYRI4lKaiPKTly7f2n7mCPYntlCnvylr/xvN7hmMMoCrVGKTQbXNLSUPEUKkf1JIRqUsDTCOiYPQ1vMyPD75Bgoxn4p93zogMBpcxofhYdaaeO6UFetsUnvlBJBrpaWiC80Eh+UBGlSiO4x2Zqk1et3TJly4nLcdeP85WNBWLW8DYxSKVrzd5k9JkDHu8HrKJO3Z78RvS2YS9mNNiuym2hcpz4AlHHSdYq7DUs9ioyEExiLXoGowFitgO+bnbIQov0Ccf+BB9eEjCtQ0QRms/0O/gYuvvaDpvVWz3ZLuG6aRW4J27kQAMD1I5udN4N0INbVyhjUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iztGRHc32+qwwMwaCi63Y93mrab7LGB2Qn6hxLjIJrs=;
 b=GI44P+2CsojIyK3lHDl8GMuDp0vJXplpTCRCMcQSAy1WVG9I0a9OJ8YCGRrnAJLvBdHqa22KViq+v9qhym3Tm/S5hHYNoW+7DF5G8bIZ92A+FFe82s1PSke1Q8f2WqMgf7LoP0ukZ4D+NrVq2WRukKrM8Th5ZH4IpmwMgswZ3KI=
Received: from CH8PR21MB5222.namprd21.prod.outlook.com (2603:10b6:610:262::21)
 by CH8PR21MB4815.namprd21.prod.outlook.com (2603:10b6:610:277::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.12; Mon, 14 Jul
 2025 16:18:11 +0000
Received: from CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d]) by CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d%3]) with mapi id 15.20.8943.012; Mon, 14 Jul 2025
 16:18:11 +0000
From: Jon Lange <jlange@microsoft.com>
To: Gerd Hoffmann <kraxel@redhat.com>
CC: "Relph, Richard" <richard.relph@amd.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?=
	<joro@8bytes.org>, "coconut-svsm@lists.linux.dev"
	<coconut-svsm@lists.linux.dev>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025
Thread-Topic: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025
Thread-Index:
 AQHb7L3M5qoEeBG1Ekqfci7NxD34MLQhxWqAgABllQCABIeyAIABmKGAgAAQi4CAATaQAIABOd1wgAIqLwCAAEBL8IAESZqAgABaFaA=
Date: Mon, 14 Jul 2025 16:18:11 +0000
Message-ID:
 <CH8PR21MB5222CC6DCC81B272390F4ABECA54A@CH8PR21MB5222.namprd21.prod.outlook.com>
References: <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
 <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
 <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
 <d579919f-6e66-4499-8634-e258af61c933@amd.com>
 <aq6225hfazqsbqgx6fhj2klst52wdfivfa6xj2ost65sg5fq2r@4yoqnv2tp5nm>
 <LV5PR21MB5210A051A344852EC30C089CCA48A@LV5PR21MB5210.namprd21.prod.outlook.com>
 <auq7txxlerpwzl542o6rkjams22cy6rb2xoi3f7lbej6u47svi@rto2jldlvxyh>
 <LV5PR21MB5210915F19D877E261E66ABACA4BA@LV5PR21MB5210.namprd21.prod.outlook.com>
 <axljobcnpe6oct5v7edaocroajirywcft5z6lgtnoh3s6tj2r6@cux7zhrgbqnc>
In-Reply-To: <axljobcnpe6oct5v7edaocroajirywcft5z6lgtnoh3s6tj2r6@cux7zhrgbqnc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=5328ea28-abd8-4f62-a60f-8356b77b36c4;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-07-14T16:11:33Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR21MB5222:EE_|CH8PR21MB4815:EE_
x-ms-office365-filtering-correlation-id: 56fe4127-8c7a-48c8-60c4-08ddc2f206f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lAFF0vp3QXZu/R59epjfBTw5BMpOHRjXso3NTAltriPI65RUBbLsKk8y0f?=
 =?iso-8859-1?Q?BCeoSws9xS2YpCgPAtw1IEhilr7eXTygUOYJT6cEIVysM/JNayoS+T6/0+?=
 =?iso-8859-1?Q?7cLCLdojVcax5Snec/hbeKdPF4Xv2g+zkuJGkb/24pTcrKGPq11Gg/AAfD?=
 =?iso-8859-1?Q?Emlpdx3scCllG4Mz5nx+MUirUr6Tl15J9/DYjdzeqP0Tx1d+EwYrQngq96?=
 =?iso-8859-1?Q?vojrkoXCfVJCLa8ZF3m0cUyf+13PvbDHnJ5xMF29+2cosUIWJ6Mt7PCizA?=
 =?iso-8859-1?Q?2Jp2BWGxQ/or0Fc4OlcN6cBXWFmzy//dmg6drD9Aw0ui0OOGQxlM9IkIxE?=
 =?iso-8859-1?Q?BtpW0G9pAgreseH31sJHkrICyqp4P5Ip9Si9xfo9lMUKmBY0PTdSbywEwg?=
 =?iso-8859-1?Q?FvdaTLZ2bq8OjgN5PWpDH6+zZycsuZwz70SyJ9siUe0f8gCpu3E2w2R6rs?=
 =?iso-8859-1?Q?pivuL0LuGUKiU5n524d2SukQNGTOxBbUz9rx24USPoarSn5CeoXccU8IfF?=
 =?iso-8859-1?Q?AS9osatPymGbmmWbJZdwYOQkL+ZZHV2KThdlGAM0lWqXHQJdHt/0WX8DKG?=
 =?iso-8859-1?Q?jfysgI3OoVZAqnsJ8FOmhKHjj8MXjCgAP5MMNWSqdAJ0ywS7kK8PVjxLKM?=
 =?iso-8859-1?Q?+nMDwxbmoYPN4NPsNtB23Po6mWRs4tZOAUHhfQMWjjI6YGsF1ZGqmQFYRG?=
 =?iso-8859-1?Q?AzyqUwn1v1Frcg/g0kK+teN9iVthicJ2+DTU5i/eEhrjZqaL5niP/5JrV1?=
 =?iso-8859-1?Q?y43idr5kASvIwqBJAxG3mPInoyXUbOWuE8pOziRcAKSSX8NEHBbQBwV/6e?=
 =?iso-8859-1?Q?mAY92z7DgzQY4BCfcgptRmYvyOUF3K6JgGIfBuE+4KiOJ5KX/HjNMSEA4d?=
 =?iso-8859-1?Q?BM442jBNEUIJXLP09TQD/Ypkpr/EIYZaeO8SQgo0X9M6j4wMwmgsbathfC?=
 =?iso-8859-1?Q?WXyZUJbaEBqIrytaClG6cta3zktH20JVZ+t+YxdeU8tQdqkm7WDxE/viCe?=
 =?iso-8859-1?Q?VNaVICvDaRzMexW0uWHs8zDM+OWcjIpBme+Od2ej6TBtMUBwsTPDoJIN4h?=
 =?iso-8859-1?Q?CyrLUUgfGidowBxWdwOkeiWCXOBEmYlS7CmzlpIgpbHaPXfMm5MqgIMAe9?=
 =?iso-8859-1?Q?SN2v9gTcLeuwvOK5KjmNHxxr6mVQJqtgrCGnUtnttBkNF+JCPOw02g0LA9?=
 =?iso-8859-1?Q?Ech86a3T93MvXdyKFormw6K/Pyw5NB3Y+ADjeUIWf95V+2u9P1UPmnImSv?=
 =?iso-8859-1?Q?Kr8VbJUAxo9JG3DqebYoOMf30wLp3CaeCoTgua0YnbaQvF/6YTQ0IqmGY3?=
 =?iso-8859-1?Q?Qq9CpLlrfE8D5mVU0ZlWqErWVwe01Cs7K/r2J1fj/FQwiFL0Bz2hSczgkI?=
 =?iso-8859-1?Q?nGD7xhBA4rsEMsFPPSeDvGIeMaEQ7Cny58eA+KBZmz/B2xTW0oZx4izZZv?=
 =?iso-8859-1?Q?TY74gkyTCLxRP/XGLUqTa6ehm/ZmbgviFSeWOh7lNoZesb+kS8JhKv0Wot?=
 =?iso-8859-1?Q?vwqwMI85IdJPb9qkJ7eZKbIu/o6vVRkRlbkEd8Hzmdrt14r4F9JLq8ltrP?=
 =?iso-8859-1?Q?ZauMvUk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR21MB5222.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MUcQrQPlM/hdWUtiD/g2XyNyaXIdU14DDjsTMxxfje+1J5BsI3cc9bSLbB?=
 =?iso-8859-1?Q?4g+qwkgn6/GpWzc+8rMZw2IHO27xhBI9gyl+tVAWEKO7aPEeJqkIw6pJ37?=
 =?iso-8859-1?Q?7IZ1cZui8bRADLZLeJdvHxMgGJKpRe6JdgCU21b8g20bdRlJoq55s9Ub+k?=
 =?iso-8859-1?Q?rIcS//ouP8qe0YPrv2LEFqNv8Po7o0W+mKGo0gnJ1bBvJvsVEhIfLbEN3Z?=
 =?iso-8859-1?Q?POlOUrWgqeDGYcdOfi6j0/zvsieDJo0lhcyFZGT8B83eKUGAWfZvbkltRu?=
 =?iso-8859-1?Q?METJKKNiF2aAa8v7Erm+MDd5hmskcgeC4Z/72Vumq8BIbwnsrBxuxFQrni?=
 =?iso-8859-1?Q?T94QZo0uLlB0lse0gs+bLDCqKn3IQ7BDCSLae+1n9vLGqH60osnrFy+qWX?=
 =?iso-8859-1?Q?tYUEz1HSmLdmPNaMwOwmMuDspPLyJYo8dwDUIYR7m+qbf2AVXF+hjktWA7?=
 =?iso-8859-1?Q?lJant6Sy8ueFnNie1fCaCvEJ1tOsCsu/y6ORLEO7eC1kn2anqixq3lH1tw?=
 =?iso-8859-1?Q?8OsPJsS/jjZyZUG+burdN1LbNwFst0O82CtmaAxYikHlKBmQQh/CKjjBdD?=
 =?iso-8859-1?Q?3BMS+plaRWfDRO0gcH9eg29UkrpR9c+bouF6aM46d5lnH32SIMElIJHFkt?=
 =?iso-8859-1?Q?ch0iLh3Q4PfZoLKZPiZhZyMxVnkI+E7r+XF8X5JBe/w2oPK9xB+eMIr6Jl?=
 =?iso-8859-1?Q?5HJYPzRjxJFLULi9rkTiz3XAai2JF2idMMoPS5cVGJechS1uMjqwpxJexz?=
 =?iso-8859-1?Q?yGI3Bcb/6CFIc7EBO7yPapQLm0D/WjxPpVRxXVamB89gMEmp/4+z7zwOHr?=
 =?iso-8859-1?Q?REspvHwkmN0lfS05HB2t4SWcYQJUY0iKJIjvzuM/LB2mjinszUrinItEhk?=
 =?iso-8859-1?Q?teKad4dFFxceBLLN9x0f4Z9owS7UB4uOy6bidR2ckHAOiEvhEpSnbqgXe0?=
 =?iso-8859-1?Q?sqqHsPaxS9y3+kg9ViuSezfdQLNlOYyrYfduCzL4eRpzfba2wOoghkZ8zV?=
 =?iso-8859-1?Q?3LP/S2mqpjxuS1r2qSWrdAT/NOHIqAbdT0qzvyKLtyrZkhso4SDkxZM+Oh?=
 =?iso-8859-1?Q?P2IfO9QFS9mOtzEL9dUDPO7XlLTXTy3ocf4gvT/LdQW+T0xlqlEp28IkHa?=
 =?iso-8859-1?Q?kocQglfc0hmWK6wSaQ8LnMovcqPOO/JQagP8teUI6W2d1f9ud/aSlBaz2i?=
 =?iso-8859-1?Q?AVSRYlxGDjAE0jtV+oKNLEPI01t/fP2NupKNMEunVidQ6y6Ql6qqAwpm5m?=
 =?iso-8859-1?Q?KQtlZOvJy2AvmyiOH+216zOx09YSeCwjmhIyr0KtUpt3d2qLf8uw7rvKFs?=
 =?iso-8859-1?Q?6QBHpyy6/HiC3tXnMaCud5nLDQSthayMBupkXYWbBafz7wW64oQpG7splu?=
 =?iso-8859-1?Q?G7mBBu5GyUN2moaQUU2zNLAxFzPtytEaY2AVM1ue1XwUW2zdus6CV7QNJ+?=
 =?iso-8859-1?Q?jei1TJWug4Oks6pnhNOxDPLRy3tVoeeA+Ny1ywV8YQglzkbDraS4wuW4mQ?=
 =?iso-8859-1?Q?B3P1WqhrN2Z3gn1PBOqad2KSYCe2Uvf/wEcPQIaqTxvcn2CMTij17YDdZO?=
 =?iso-8859-1?Q?eQHC1Slzvgzi9SiT8mWmO5YRtOA1dXuGMvaQ1JoY4IWcmcp6IIzQiY/WJk?=
 =?iso-8859-1?Q?Dq9YPJDm79VuZPAvgxXHQ7zM38zeQgBLz6nYA4Fk7PI/86UMizR8+EluhV?=
 =?iso-8859-1?Q?P/3RzaD6ZF2SkZx40g8RCmOz+W6PlZmor9YDho7D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fe4127-8c7a-48c8-60c4-08ddc2f206f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 16:18:11.0940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fSGVbIrIwg0PUyotJybLqmiUd0RdDoQVSgS/9g+9nPaCfMKolcpb7ryQi9F7Gaz3WGt1PNBBDFur/ElfUewr7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR21MB4815

> Huh?  I've assumed svsm protocols can work on TDX too.

The idea of an SVSM protocol might be sensible, but there is no calling con=
vention.  The TDX partitioning model and the SEV-SNP VMPL model have radica=
lly different concepts of control flow transfers, so the SVSM calling conve=
ntion is not easily adapted to TDX.  Intel has never defined such a calling=
 convention.  In the past, they have suggested that such a calling conventi=
on is not needed, because the L1 can trap and emulate calls (including TDCA=
LL requests), but I think there is now an understanding that this is not su=
fficient.  However, I am not aware of any active work to define any type of=
 L1/L2 calling convention.

I also know that for this specific question (memory carveouts), Intel's pro=
posed direction was not to rely on an L1/L2 calling convention, but instead=
 to rely on having the L1 place tables into the address space of OVMF befor=
e it begins execution.  This, of course, would work equally well on SEV-SNP=
 or any other model in which an SVSM-type environment can execute before th=
e guest firmware.  I know that Intel began investigating this work but I do=
n't know how far it's gotten.

> Can you clarify what options exist on TDX?
> Pointer to documentation is fine.

Because no L1/L2 calling convention has been defined, there is no documenta=
tion I can refer you to.  The best I can suggest is the TDX Module ABI spec=
ification (which you can find by searching).  There is also the TDX GHCI sp=
ecification, but this is designed for guest-to-host interaction, and cannot=
 really be used for L1/L2 calls because L2 TDVMCALL invocations may go dire=
ctly to the host in some configurations, so there is no way to guarantee th=
at the L1 can observe any requests issued by the L2.

-Jon

-----Original Message-----
From: Gerd Hoffmann <kraxel@redhat.com>
Sent: Monday, July 14, 2025 3:49 AM
To: Jon Lange <jlange@microsoft.com>
Cc: Relph, Richard <richard.relph@amd.com>; J=F6rg R=F6del <joro@8bytes.org=
>; coconut-svsm@lists.linux.dev; linux-coco@lists.linux.dev
Subject: Re: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025

On Fri, Jul 11, 2025 at 05:24:06PM +0000, Jon Lange wrote:
> > OVMF doing svsm calls for this should work fine (didn't actually test, =
but OVMF does memory validate calls quite early at boot, so I don't expect =
blockers).  A protocol along these lines should work I think:
>
> There are two challenges with using an SVSM protocol to discover the
> memory map.  First, at least as I have been led to believe, OVMF isn't
> able to execute SVSM calls prior to the point in time that it requires
> the memory map to be available.

This is not correct.  Experimental but working patches:
 * coconut: https://github.com/coconut-svsm/svsm/pull/760
 * edk2: https://github.com/kraxel/edk2/commits/devel/svsm-memmap/

> More importantly, though, SVSM calls are only available on SEV-SNP
> architectures, but memory reserves for page bitmaps are required on
> all platforms that support COCONUT-SVSM (TDX today, and ARM-CCA in the
> future).  Devising a protocol that only works on one architecture
> doesn't leave us in a very good place for the future.

Huh?  I've assumed svsm protocols can work on TDX too.

The calling convention for guests to call into svsm surely must be
different on TDX.  But I've expected some similar mechanism could be
used ...

> Whatever design we produce for TDX

Can you clarify what options exist on TDX?
Pointer to documentation is fine.

thanks,
  Gerd

