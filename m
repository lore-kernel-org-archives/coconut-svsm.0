Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010028.outbound.protection.outlook.com [40.93.198.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE36929B8E8
	for <coconut-svsm@lists.linux.dev>; Wed, 11 Mar 2026 16:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773247906; cv=fail; b=TIihjAQAcgWaLSreASZ4+TeYWYfoxMKxEQx1eWTRoGsnOeCIN1Bd2M96MaXdWLDedNdDgiNLFFvOPfPbdE/+5TIwJWUNYMXAblp68J5Uk1WG/U53TywQDlDgTwfKYfaAfn/M2n7/R1FIGU8DwAvf10XCuLx8erbEqlncanQVFyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773247906; c=relaxed/simple;
	bh=31iKmWoeyg0hKEkFAibxqO7Nyq6UnSMYUqgRefOPfvA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UFeDn741JtawzIGl8gQGWbC6OBAVwFIqrH/7Eus5ybX1bnJn2AK9ncL9C/ipvDL098KAuENvDPT7UHmowSaOEfGA5vBZ8Q+LzigN9AXCRTir/iD5N9A9eQWhT3M5nmPUxZAYUm9s72LHxXd6Gd9OkLKJfL2yb4ndEkuzVuFuAqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KD2cWKvo; arc=fail smtp.client-ip=40.93.198.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KD2cWKvo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZSTZSgwsVQgDV9BRuXfAqyHyZeoov9xxWr8lq5Bx1FUK04x4WxECooRrN2UcTqER8FUBMdQOYx3BC5t0M75v0775hmxjyooFCPoxgMrfq2eYGc0wOweBWb8PMv8uEz34nVF1stwOKprleRTNA6J/Cn7doOO2QqU7Z0KPBH/WKwkrZcZ94o8jXm/yfZQddSi3BJ3ing9XbhjpjZawuRopnx4Nu1pwKi7v8I+3fNRp5rMOQBvF7eI3aYIN3wFgmmgDgMMddjAhDnDpYp2KAgsJBLyzFfCt0YHCaAcDvcELE8oFSJjsOuwBsT0myqLS0vAE0Qk43p3IHJYzyOqsvl82A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31iKmWoeyg0hKEkFAibxqO7Nyq6UnSMYUqgRefOPfvA=;
 b=VL/0fbPNU1wVUf736FsAOrTZRBvG6GYhQ6atM5bR9+U+NfFlQG1MlRoUgG5MP2gXXtdPQF2z8B2DoZ7sl5MXJWP0Qf0PjgvfEyX+QGG9D/tKT+T6wtpb/+6Ek+w/7oT/AgsGAnPpES2tRwqJtSIMgAONFyH0tYtnW8otFBKHN5Q/uBKVsKplIpOA0Bm9F0bCTMrUKjKaLZHECaSeg0v7bopaOEjWfY1AG8fdG+Sog1p3VLxHdnEGip/Gx4vOAGfTsk7m9eqhBl9ieFX10QV0DxCEDLoC4E6ynOMs6Hxn8IoE4QXX0uHK20iD2sJI+4AS3fMAFpvMg63lGVI3SmRXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31iKmWoeyg0hKEkFAibxqO7Nyq6UnSMYUqgRefOPfvA=;
 b=KD2cWKvoVKUxtlxELnWujXKO5/1YL+neq5zEuEqFCG0CUOI5kmOlh5/QbP61e/qPPbZM+mYgVFOa/4mRM6W1Mvk0AtdYKysLh6epSfp3d4v2XNjYjfv9bLAW5R7PhRxVbDkt3mucpkVzXNou4/uuc5xODpwCIkNqL10lxIBecwM=
Received: from PH0PR12MB7887.namprd12.prod.outlook.com (2603:10b6:510:26d::7)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 16:51:42 +0000
Received: from PH0PR12MB7887.namprd12.prod.outlook.com
 ([fe80::270:174e:8999:9810]) by PH0PR12MB7887.namprd12.prod.outlook.com
 ([fe80::270:174e:8999:9810%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 16:51:41 +0000
From: "Rodel, Jorg" <Joerg.Roedel@amd.com>
To: Jon Lange <jlange@microsoft.com>, "Wang, Huibo" <Huibo.Wang@amd.com>,
	"Lendacky, Thomas" <Thomas.Lendacky@amd.com>
CC: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>
Subject: RE: [EXTERNAL] Debug_swap in sev_features
Thread-Topic: [EXTERNAL] Debug_swap in sev_features
Thread-Index: AQHcr/OP1YX2zaVinUuvgk9UzpbYxbWmiCsAgAMGBdA=
Date: Wed, 11 Mar 2026 16:51:41 +0000
Message-ID:
 <PH0PR12MB788719376187484D48D4C1FD9347A@PH0PR12MB7887.namprd12.prod.outlook.com>
References: <a43b6177-1b69-4369-84fa-7a3a596ba580@amd.com>
 <SA1PR21MB64164C2337DEAF85CCE9959ACA79A@SA1PR21MB6416.namprd21.prod.outlook.com>
In-Reply-To:
 <SA1PR21MB64164C2337DEAF85CCE9959ACA79A@SA1PR21MB6416.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-03-11T16:49:36.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7887:EE_|MN2PR12MB4175:EE_
x-ms-office365-filtering-correlation-id: 7cf4456d-af1c-4f4d-45fa-08de7f8e785c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 NN6m6fx/gsfPqksgekFlrmu8myWDiYdGUZbejiSggpoZUvTZASWq+DVKenb/htsFus+6tQFVPznMp1jv3gw5UVZ79OJXc+UVUgicku0Q4FSHqItNVJlUci7cbQMWGOlpic46o+A4km0vVeGaiE4HDJ1Z9tKbyGKOlZZtM0neZ8G99lY5ie7QnDbv/zGJKXzrRIycjzXfCK0NWaH/hSs8VTNQulzzCxwDhfnDTJdJ0TMKsMTkhagKHnhqJuixp3mCuUYrCbdVRlyLDC4xx8hASXk3gJNgSgtlVNy5XUMz1BRVnTJ8lDV37uIc+SQWGWorsKrhoHJMlQ/jpXOoceR8Y6pM9EmQpQBusRurP2Tz1bpQrmcn2AVxFQAX+Wc9N7uYc+F20Gjd48maYIK8yUeLx9tw8iG/nqdY/HlLauseTpRPiI7WvwQAFZz17AA1zhnlUcStbj3ZKzuMInKxq+OpGRedm/K9keP3qSlh/HOkfydw0KqyZaMlUizSQGfSN1wC3LZ0yxdT+n6g6vADYdaPfKXmvTORNId5TLD28zDKeobz9kgK1Qq71Ag0Sm5GWHImO4FchE0isBYKDGDjfw/caHpa+r+/KKNdurEbV/k5icEcNZRfZ8I6NkwDXq1SnIpqg9ghOwTHcbaLM2RBOCn5qPmMMV3uPwVqnk4hGq7fIJfI0L+Grn9/pV4vEcAYRkzXEwhufLh0yZn/ipE12lkL7n9Y2bkHXWI22/azglO41EPktA7lNmeTNpp03V8dGlvO+p78j1KmvCMrIEcn08E5nGEwnpxDVli3nfcXtXAmmsc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7887.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkFXN0hMR1ZKTkx0VlpMdGREeHJGZ2ZocStFeG5DZDZRZDRKVVhTcGJGSERD?=
 =?utf-8?B?bTZnQUlHTlE1aWVsbjdBYjBrSzF3S0VIR1JKTlFESHc2NG5peHZLYVJDa1Zj?=
 =?utf-8?B?WFRITElkaGtDSkFva3ZJSXZkR3JVcmFzdWxIa1JCdFppa0VxQU1pMENmTXAv?=
 =?utf-8?B?a0ZOdWQvUXdOT2JCTTRHVkNDRFVUZ281eXNPa0YyR0hNazFiOHdic0w1dGhC?=
 =?utf-8?B?VVpzV2d1eTJwUHZoUXVFVGtxZU11cWIrMjV4L2IxSFdCUkJwQW9hQlhXeXJt?=
 =?utf-8?B?Wm1UTy82UzE4MHJzcEk0cFBrREpYRHhKNWw3dWNTcEZmQXNOTmoxN3RiU1pX?=
 =?utf-8?B?NXhjRzN5NTNob2J0NmlKdWZJRjhjYVFBaVpRRDdHSmRVMVFuZ1BCTDJQaW9u?=
 =?utf-8?B?Q0o4Zy9xSmhnenZkZGdLWVhyejZaZHJqR3dhaGN0T1plaDRDMnVXQWQwb2hJ?=
 =?utf-8?B?RmdsdFFFWDhTNkg1QmQwMjhwd3p4azEzWDVKb0dISlcrT0NoNldjdWRXdEY4?=
 =?utf-8?B?L1o4R1BhZ3BhYVRQMDZpUFB4NWRPSHZaZ3ZYQ21Xd3RyblZrdzduazFsdzNn?=
 =?utf-8?B?aVRUejJ6S2tES1hLOEJ1WHpCZStUbnlmcU1aaWJ3STZFTGFPbUF6K2xIb0tY?=
 =?utf-8?B?Wmp3THJEeWlZU3FIUUt2RGcxT1dHblRNUG5TZEJMQzBia1l2aSttb1BZNGFq?=
 =?utf-8?B?MlF0aG81VDVwTnBPN1FnSkpYOGs3d1Q3MEN1MHBuZ3dERzNrQkpqRURpOGN5?=
 =?utf-8?B?Rmo2S04vaFY5NVJNWnFHdFpsY29uNVQ5V0U5KzBUZXV6UDNXTlFibi9STkJV?=
 =?utf-8?B?MlhmT0s5RXFlTVpwQk91ck4rRU5DK3RsZy9ia3Mva2pRNTBkSG9RclRrTVkz?=
 =?utf-8?B?dUVheWVMdmlJQW5lVmhJbGFMcWdaVkN5aHpROTArNm1CclAzQkh3RVFCUHpS?=
 =?utf-8?B?THkxOVBjaHhtNERKeXVJMjZEb1kzUW9adjJXMHlkUmx0ZXVMNU9DUVAvN0dv?=
 =?utf-8?B?dDU5bVRUVnB5Nlh2dXhOTVhuUGU4ci9qNEtscDhJeVlhdXQzTjQ4cVBYYmlu?=
 =?utf-8?B?K21YQ1A4Vlc4L0lNb2oyanFpTFNlaGRGVmNaMkRKdk9yeUc0NkhUWG1idnQ2?=
 =?utf-8?B?ZmV5Mm9GWkdvVXNvNmYwekdoOHM4UGFzSGtsYXQrcmRmSkwxMmFuemZlc1Q0?=
 =?utf-8?B?MkxjcDdabEpwTGtKcGtYb1BPaW5GNkxnQk53VnZQMFk3Sm5ybi80d3c4Rnpk?=
 =?utf-8?B?aVVvUHlmN0JLK0JwNEpCYmtMT0tYaWFSMXVMeW82dGF1L2Q5Vk16a3QyYnhI?=
 =?utf-8?B?bFl6L1YzNUI3SWxVbzRlc09lRXFzbXdZK3p0NG11cU5aUkEzaU5UbTJ0NGhO?=
 =?utf-8?B?TkkvWjVzTkhtSkpoMjhOQzYxdURyM3FsWTJFL1RuQzM0ek1jSjBvTlphTzJ4?=
 =?utf-8?B?bmc2Rm9WbDNBTW5BMHE1MlhJWUdmUlNwL3p3Q2ptMytEMnY3L3kxQ2kxeFFa?=
 =?utf-8?B?cDF0ZDduNVVmZmc3L01aeGZ4VEsyeGlJaGVLMHVucnUxZGZEL09mS0RrZXI5?=
 =?utf-8?B?bUE5SkpRZUtTNnJoVzlLUkZaSXBtYlZZd2k0MkliSklNQytXOTdnUzRSdU9q?=
 =?utf-8?B?OHJnN2xjVENtV2J4QmdqN3lCMkhScmdQMFN2Zk5Nb1JyODQxRkpyQk1GQVZE?=
 =?utf-8?B?MDZxWmNUM1cyRmJ5ellZdi85Uk0zY0Z3M3NUMThoWjBvR3VlbTIwdHI4MjRB?=
 =?utf-8?B?eDJpR2JkUkxUQTdFWFBuV1NiOEdMUDVtaisvcXc2czlnNkdWblgxbXJBUy9q?=
 =?utf-8?B?VE5FWVFldmE4M3drTXp4ZmRTbVZmV1B2YTVqS21OYnVIbHVRL1lyRFI2Yksv?=
 =?utf-8?B?WkY5cml0ZkRhMC9PbktzOUw0SkJ0RVpKcG1KbG9JdE9acTR4aThGaHRHNEI1?=
 =?utf-8?B?dURlT0xhc3RFODR1MEVBQ1QyUGJ2SWszUEppandVckhPZ2dtR1FpbXJRU1dR?=
 =?utf-8?B?NGVZWG9aWkNqUXpmRFNXbVBIeFYyZ2U2dyt2NFpvbENNMTNjcmh4TEJVR3Vt?=
 =?utf-8?B?Ykh5OXRHVWlCL0RPQ2Q5Y1BBb3VJc3V1azBBMCtoMmpGc1k2cWpzRmt4emFv?=
 =?utf-8?B?L1dLbG84Nys1TFFkUVdON1AyNDlkOVBTSFpWbCtSNmVoYjgyQS9YeUJxUDU5?=
 =?utf-8?B?RHF4WjBuU0xDaERJc29obmQyUFgxd0lCRmhQVlBBWnY1RUp0RUZJRmtVcy9v?=
 =?utf-8?B?RUVmNFhwM0pBRm5OTU9sdDhiTFppZ0E4bmJBRGxJcEhEODJUNXMyZm9ZeVhW?=
 =?utf-8?Q?9fKD82vXZ3gPrOR8Fy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7887.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf4456d-af1c-4f4d-45fa-08de7f8e785c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 16:51:41.3595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eWbFPvXQkNUcv5NiOIL11i13OYFd5g3yJ5eOwh/0NC9zA7VQPaLwe0bn5xzq6kdBW8nrvRd137g7z5q3N3w7qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSSB0aGluayB0aGUgcHJvYmxlbSB3YXMgdGhhdCBPVk1GIGRvZXMgbm90IGV4cGVjdCBERUJV
R19TV1AgdG8gYmUgZW5hYmxlZCwgdGhlcmVmb3JlIGl0IG5lZWRzIHRvIGJlIGRpc2FibGVkIGlu
IFZNUEwyIGZvciBub3cuIFlvdSBjYW4gdXBkYXRlIHlvdXIgS1ZNIGJyYW5jaCB0byBhY2NlcHQg
dGhpcyBjb25maWd1cmF0aW9uIChvciBsaXZlIHdpdGggeW91ciBoYWNrIGZvciBub3cgdW50aWwg
dGhlIG5ldyBwbGFuZXMgY29kZSBpcyByZWFkeSBmb3IgdGVzdGluZykuDQoNCi1Kb2VyZw0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvbiBMYW5nZSA8amxhbmdlQG1p
Y3Jvc29mdC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggOSwgMjAyNiA3OjM5IFBNDQo+IFRv
OiBXYW5nLCBIdWlibyA8SHVpYm8uV2FuZ0BhbWQuY29tPjsgUm9kZWwsIEpvcmcNCj4gPEpvZXJn
LlJvZWRlbEBhbWQuY29tPjsgTGVuZGFja3ksIFRob21hcyA8VGhvbWFzLkxlbmRhY2t5QGFtZC5j
b20+DQo+IENjOiBjb2NvbnV0LXN2c21AbGlzdHMubGludXguZGV2DQo+IFN1YmplY3Q6IFJFOiBb
RVhURVJOQUxdIERlYnVnX3N3YXAgaW4gc2V2X2ZlYXR1cmVzDQo+DQo+IEpvZXJnIGlkZW50aWZp
ZWQgYSBzaW1pbGFyIGlzc3VlIGF0IG9uZSBwb2ludCBhYm91dCBjb25zaXN0ZW5jeSBvZiBTRVYg
ZmVhdHVyZXMNCj4gYWNyb3NzIGRpZmZlcmVudCBWTVBMcy4gIEkgYmVsaWV2ZSBoZSBoYWQgYW4g
b3BpbmlvbiBhYm91dCB0aGUgcmlnaHQgd2F5IHRvIHNvbHZlDQo+IHRoaXMuDQo+DQo+IC1Kb24N
Cj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWVsb2R5IFdhbmcgPGh1
aWJvLndhbmdAYW1kLmNvbT4NCj4gU2VudDogTW9uZGF5LCBNYXJjaCA5LCAyMDI2IDExOjM2IEFN
DQo+IFRvOiBKb24gTGFuZ2UgPGpsYW5nZUBtaWNyb3NvZnQuY29tPjsgUsO2ZGVsLCBKw7ZyZyA8
Sm9lcmcuUm9lZGVsQGFtZC5jb20+Ow0KPiB0aG9tYXMubGVuZGFja3kgPHRob21hcy5sZW5kYWNr
eUBhbWQuY29tPg0KPiBDYzogY29jb251dC1zdnNtQGxpc3RzLmxpbnV4LmRldg0KPiBTdWJqZWN0
OiBbRVhURVJOQUxdIERlYnVnX3N3YXAgaW4gc2V2X2ZlYXR1cmVzDQo+DQo+ICggU29ycnkgZm9y
IHJlc2VuZGluZywgaGFkIG1haWwgaXNzdWUuICkNCj4NCj4gSGkgZ3V5cywNCj4NCj4gSSBhbSB3
b3JraW5nIG9uIFBvQyBvZiBBbHRlcm5hdGUgSW5qZWN0aW9uIHdpdGggUGxhbmVzIHN1cHBvcnQu
DQo+DQo+IEkgaGF2ZSBydW4gaW50byBvbmUgaXNzdWUgd2hlcmUgdGhlIEFQX0NSRUFUSU9OIGZv
ciBWTVBMMiBmYWlscy4NCj4NCj4gVGhlIGZhaWx1cmUgaGFwcGVucyBpbiB2YWxpZGF0ZV9zZXZf
ZmVhdHVyZXMoKSBpbiBrdm0gYXMgaXQgcmVxdWlyZXMgdGhlIGNyZWF0aW5nDQo+IHZjcHUgYW5k
IG5ldyB2Y3B1IGhhdmUgdGhlIHNhbWUgc2V2X2ZlYXR1cmVzLCBidXQgdGhlIG5ldyB2Y3B1IGRv
ZXMgbm90IGhhdmUNCj4gZGVidWdfc3dhcCBlbmFibGVkOg0KPg0KPiBbMjU2MTQ1OS4xOTE5Mjld
IGt2bV9hbWQ6IGt2bSBbNjc1Mjc1XTogdmNwdTAsIGd1ZXN0IHJJUDogMHgwDQo+IHZhbGlkYXRl
X3Nldl9mZWF0dXJlczogdm1nZXhpdDogbWlzbWF0Y2hlZCBBUCBzZXZfZmVhdHVyZXMgWzB4MTFd
ICE9IFsweDI5XQ0KPiBmcm9tIGd1ZXN0LCB2bXBsOiAyDQo+DQo+IEkgY2hlY2tlZCBiYWNrIHRv
IHRoZSBTVlNNIGFuZCBmb3VuZCB3aGVuIHRoZSBndWVzdCB2bXNhIGlzIGluaXRpYWxpemVkIGlu
IHRoZQ0KPiBpbml0X2d1ZXN0X3Ztc2EsIHdoZXJlIGRlYnVnX3N3YXAgaXMgcmVtb3ZlZCwgdGhl
IGNvbW1lbnQgdGhlcmUgc2F5czoNCj4NCj4gICAgLy8gVE9ETzogZmluZCBhIHdheSB0byBtYWtl
IHRoaXMgb3B0aW9uYWwgc28gZ3Vlc3RzIHRoYXQgZXhwZWN0IGRlYnVnDQo+ICAgIC8vIHJlZ2lz
dGVyIHByb3RlY3Rpb24gY2FuIGFjaGlldmUgaXQuDQo+DQo+IEFmdGVyIEkgY29tbWVudGVkIG91
dCB0aGlzIGNvZGU6DQo+DQo+IOKAg+KAg3Nldl9zdGF0dXMucmVtb3ZlKFNFVlN0YXR1c0ZsYWdz
OjpEQkdTV1ApOw0KPg0KPiBUaGUgaXNzdWUgaXMgcmVzb2x2ZWQuDQo+DQo+IFRoaXMgd29ya3Mg
YXMgYSBkaXJ0eSBoYWNrIGJ1dCBJIHRob3VnaHQgSSBzaG91bGQgbGV0IHlvdSBrbm93IGFuZCBw
ZXJoYXBzIGhlYXINCj4geW91ciBvcGluaW9ucyBhYm91dCBpdCBhbmQgd2hhdCB3b3VsZCB0aGUg
cmlnaHQgZml4IGJlLg0KPg0KPiAtLQ0KPiBUaGFua3MsDQo+IE1lbG9keQ0KDQo=
