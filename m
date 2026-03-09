Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11020135.outbound.protection.outlook.com [40.93.198.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FBF37AA7B
	for <coconut-svsm@lists.linux.dev>; Mon,  9 Mar 2026 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081563; cv=fail; b=hDe4GGL1bbvU6Za7YZGfxrZjg6+fmaeTzT/iQeLg8aCj9gzfAcQ0MEFm154gy4wuDlM9FTP8eh5YxPlobbjKTGNXx0K8hqHLwnpKS8iRgkhkuRdL7+ap+ZOqc5lnpvyUjDSBSP6bqp+xaAn+c+KY73BwYS9Hp81OW2fEqoDwXBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081563; c=relaxed/simple;
	bh=JBsOiAW8pAI/kicoxwaBoFy3dodAbPMiWdQhtBYGxdc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=COqAaamVFdwbSTuyV7h9AQ+CRhdfHLioP6toVSieEuj+l60gFLdebAiCO2bw5wir3JLysQGzDuRlEaaYsnjRuFe3QwBBPSERaMm1GOvtOTveP3zjlfalYexq8NJiT+z//z0wHltvxiHjnJLPd/1niqI21KMnN+aY7MCwcCpdNA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=bBpDpeLe; arc=fail smtp.client-ip=40.93.198.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="bBpDpeLe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3k0ZD0wZQP0Vk5zk5L7TgBlHXCptGnQV0wystqgiXpozAA4LHG5eJma3nqbQuOtc808R9FSAWyVwnowDz4At7SJmPOfcDLfkMa5O8hNmrHe/pVv1hJvRlFLb3fmJkxxgszXrMpH7xoNec6amxpb0WB6Xw80qFYHEZfOgPNRuMdaeaQs0LGZwHgOLtCaWqFqEV6YMQZ+wt2CuBJm5mLsxgUMxOoPBVwazXjddNIc3od1MEuphsPwbkd5vL39ejKrd6Qg3GwDPoYbb4s41NaE6cNRrEoL1tastda51BOoGO2d5W3YaFVkiVCtR8ldl4X0NcGhjIxdXB48EOV7BPqULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBsOiAW8pAI/kicoxwaBoFy3dodAbPMiWdQhtBYGxdc=;
 b=bt1fTFUPkSMyFwf+ebA/xgoYcttM938Z+D62BUccMe108VGNpNWP471ND85Dryd2MsTinR/jjZWM12AXc7OTOIVvRwdVnZc/xQBUnIFsanYLKgqFNdUwZm7ulFQ0oJFJDEy4K5R8iEgSGmtcLgsnl5gYymsMsSR9m7In3IiPGA0JDrrmhcOx6JGcl8IWtBxCwQ9yUQYHnQ3oSS799AiWRX0cnyApGmaEtF0jFqrUadpO8HWFoLkZkUCQrKRCbpEWy2mqcPxe+x4aI046PsnXAEmYdn2q1LU33bPOYz1rEcTTfLb5j7g77SRqnp2BIV9CbNB7396SWR8+d22wf4dcKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBsOiAW8pAI/kicoxwaBoFy3dodAbPMiWdQhtBYGxdc=;
 b=bBpDpeLelaooAdvOtRHhXyTFtJVzzUO4KbDx4cgQOWGguIcXQtFNcnu93HlvEp13o7W4x/UlDiXRsUMYFuSTrhQxuNALSFMeXNNscBhc7uhi1R6PpKISwkxm6YzAwFloA4TpKeaQuugk/OIR2FHvtKw7aJ17H36eeXsePAPtbfg=
Received: from SA1PR21MB6416.namprd21.prod.outlook.com (2603:10b6:806:4b0::23)
 by LV9PR21MB4998.namprd21.prod.outlook.com (2603:10b6:408:2e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.2; Mon, 9 Mar
 2026 18:39:17 +0000
Received: from SA1PR21MB6416.namprd21.prod.outlook.com
 ([fe80::25e7:ea96:64e7:bfc5]) by SA1PR21MB6416.namprd21.prod.outlook.com
 ([fe80::25e7:ea96:64e7:bfc5%3]) with mapi id 15.20.9723.000; Mon, 9 Mar 2026
 18:39:18 +0000
From: Jon Lange <jlange@microsoft.com>
To: Melody Wang <huibo.wang@amd.com>, =?utf-8?B?UsO2ZGVsLCBKw7ZyZw==?=
	<Joerg.Roedel@amd.com>, thomas.lendacky <thomas.lendacky@amd.com>
CC: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>
Subject: RE: [EXTERNAL] Debug_swap in sev_features
Thread-Topic: [EXTERNAL] Debug_swap in sev_features
Thread-Index: AQHcr/OQ6WBwX/ZKM0WRVoPQFWO4tLWmiBPQ
Date: Mon, 9 Mar 2026 18:39:18 +0000
Message-ID:
 <SA1PR21MB64164C2337DEAF85CCE9959ACA79A@SA1PR21MB6416.namprd21.prod.outlook.com>
References: <a43b6177-1b69-4369-84fa-7a3a596ba580@amd.com>
In-Reply-To: <a43b6177-1b69-4369-84fa-7a3a596ba580@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=cb1ad205-65be-42b4-9760-d02011d6a1ca;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-03-09T18:38:57Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR21MB6416:EE_|LV9PR21MB4998:EE_
x-ms-office365-filtering-correlation-id: 0ef22555-6258-429e-f5b9-08de7e0b2c40
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 vE0B9fDnhZ78Zga3A4cBulSlWucp2gETQfUFpf2s7tSxpc2yJ8lR1bmb7nUZuL8GbwnDvCwZQImnKM5U7ShC9Qkok8IWgayXmdzdCK0eXD4VfJ9y2fSd6b0ce2n1hVG/I/snVmZ2eZLNAEX+PSRq3kPB0Ur3viZSxZc/nquea4xUUYNKNraQZVn9+/YjNqaIQd3TA4mNNcHTiikJCrXRuCUkp59sBHYLzoTh01X/A4KYVGaRvMcm07RfHzy2lkWLj19e5XeX0Z/cFs/aXCuVK+6hWSaSMS6kb2SPtWLw2Q2ujAi68bTjURFjReF9nQiT5GYzXrmZibRFs/Fa2bQEYj0lVz7Y03XtfjBnHzooUL/e+MXAqoC/0YFsCAt+I3uKfhV5Kyqky5STmyLNUFgwmz+4nT5zeLQEUhyGxugC0mvvAWZHtHBroOTqQyjG7AIe1aPd4pPcVGqvC2GOXvxHorCdGs5sFltqn43PGVUveZfU6uJ+e1GwK0YmmCRzeU6BHhC/G7l7lj+xTAWNIop0e9FAeG4K2rYB6g1/eAkesaVYN87lt/JPM2YSzVlL9BLMpzR7pRq+6G2yzh9xbQ63wYc1wFjEgiZAhFsGqeD63WTDplnLW+LFe9xwnu+BJFMVSwZ8WvDBIT2AxLhcpXhw1JsOwC/EUfVi062FqfN7gHzPJrhaUWmv8FXsiHRJmXJv5VyEKbpEQx31sBd3Q4CIJVV5FAm5uWDvVfwnpTb/AYNs4svx4SH6T4Ic3Y0aFaH0X6vZe5Uool8drYeEjMEZGj0jl8Wc9tE6pG8BiYnYet0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR21MB6416.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RUpOY3U1Um9OTXpyUUt6aE10d1Mxa0ZWSXRBTzZEVnZiRW5yWEZ2b0JHeTdR?=
 =?utf-8?B?V3paZml5cXpsMkNzWXhFd0xTVUdIUmF5Y0RxbFN2RlNUUitoYjZQNXFSbngz?=
 =?utf-8?B?VFJEREZuLzZoOXhEcWhCU01RVG9lSE5nZXhQQ0IwaXpJRUE1R3BkUzFhKzNL?=
 =?utf-8?B?YThNbzFTdEkxSWJ6T3NRcTlKUVFEUm1EYlJpQlNpR0k1RmZCZThpa1FZK1J0?=
 =?utf-8?B?ekpsSlBQQTlHSHYvaTlLV1FhMndOTXZDN0hFS3NLMDZqNlJFVElZR3ZaM2t6?=
 =?utf-8?B?VzRqcDExQUNMSGJMeTlsY1hEVUc4REhHVFNFclZKazZJcnRmYlRCaEYvTi9V?=
 =?utf-8?B?Ty9jTUhGY3REL1VnUkZJc0tWZ3hUYlk2bVNoaStEQlVKM1dzTGtSdVRGUnI4?=
 =?utf-8?B?RUJjMlRQYnkyWHYxZFM0M2psaUJnNlA3MFk3eC9hWGQ0cE4vMDFlQThBL0Zx?=
 =?utf-8?B?V0RFWm1DQ2p4WWx3azVKaE1ZYjJXbWZ0MGVPajM5SGlzSkhqMnRtNDZHZWNR?=
 =?utf-8?B?ZnY3QjJDclZYOVMyUGlCY0NROUUwVjVsNEpPN1dmNmw1NGd6aUxxanRNbmZi?=
 =?utf-8?B?bkZCUGNCTzd0K2FINnh2di9MUG9aWnpVRzcyRDd2Y1A1MGRIVG16L05WM2Z2?=
 =?utf-8?B?T2YyYTFINVNhQkdlRUFhU0pLUkVWejc3b25LM3JtQ1RtUTdXbUsxU1EzWjBT?=
 =?utf-8?B?OGExOWl6YkFkWktjUFg0V2hDTDVsRVJCZWRYeERIVUZQNml1dGxOMWRxOVVU?=
 =?utf-8?B?WU1jVStPMWF3TDYvQXFuVEZVMVdidnFmUEpEUHZVRld2TFd0T0drVlR0QnVs?=
 =?utf-8?B?aTFVTXZtc3JxNmdWM05PSlN3bWk1cVlUaTFjZ2tpQzZLSDhrMWd3dUpzZm92?=
 =?utf-8?B?aStEQ0FXRHFYMG1LMkR0Q2t5ZWxOWk9ZTmJObnFjWE1RWEZFNm9JeStaa202?=
 =?utf-8?B?a2ZReVoxT3Y3ODNlaGh1bXJ2TjFxQzQxZnRoVHZQa0JtZXErMnFmU2NpWS9T?=
 =?utf-8?B?SGpJckFzQlBMQzFLam1PNUltM2lrWFNvQXEram9JT0w4YVUyc3FCTmZYVDVX?=
 =?utf-8?B?Umt5bXQvOE45OTNxbUgwTmdRL3A4NWVTOCtpY3I2RFdhS2xnby9sZSthblda?=
 =?utf-8?B?bWllUUtZV2xSNUxVanMxOXRYbnQ1eEZBaXBGTWE5TzVnVDhKbitKNmZuMGJD?=
 =?utf-8?B?dmVCQ3VsM213U1VSSW45SjlqL2VyUkRUek55MWdNVFRWdElkYVllNEZ6dEFs?=
 =?utf-8?B?bHZIUGhnTzVvT012Q0VtWVI5QjlSaEtqOEFoSE04My9IaFN0TG1qa3pVQWcv?=
 =?utf-8?B?YW5xcnhtWGI1S2gwdGlLdXhGYzE3TldMcCtNMUc5ZzZSdmNRWkVWOWFkd3VI?=
 =?utf-8?B?c2VnTEY2WGdISGdvQktWclFERGJBNUdYMHlzK2gzdXBLM3RJUFFMcldpQ1JR?=
 =?utf-8?B?MGc1TG5iRFJXVkNwSjVobVAySWtVK1JjcFByUkZYbFY2Tk8zVjcyUzFTYS9R?=
 =?utf-8?B?YW55blRwMWJka01TRlBSczQ0TDk5YzI2RFdPVTVCNXdUMWRPVWRLbmdMWk9n?=
 =?utf-8?B?SkNJWWZCTHZibkJUWi8xNGRDMlNHekc2Zkt3SE5uL1hnYnRVNlpNQU9vdElq?=
 =?utf-8?B?bEx2SDhGUGNnZ0NYTlpLQTY3anAyejZmS3N5ZUlkU1lKOWN4SitOK01Pd1Vy?=
 =?utf-8?B?ZnhSKy9VYUlWVjRNMlRFSEcyWmVKSlBINDVVYnUxMml4dU8wN2J0V0ovNFB4?=
 =?utf-8?B?dVhEb3ZvVDZnZjNZRlhhSTJnM2lkZXArS2lqdmEzaXJxUm4zWkxsRlJvUDhL?=
 =?utf-8?B?TkFraStKM2RxWnZwQUx2dHhMQ2xabWZXYkZ2eTBVOWhaL3lQNzVrQVlWZ0FY?=
 =?utf-8?B?Y0srS0dEWEVOM3ZvWWtYaTFhUFFZUWpxc2RrdmlpTlFkVzJyWnRGNnRpY3J6?=
 =?utf-8?B?aGVSSkNWZ3pRUVpuanJBeFk5ejNQME9lZWZydzJnbW9DT1pmVGM3RkxuckEy?=
 =?utf-8?B?dTh0d1NZN2tTVFE4Y2hIQ0FIS0Fpd050dm92dEwwSnhQWWpWRVNMVU9uVkhH?=
 =?utf-8?B?YW9SWFlQQ0Zsd1VTSXdyNEdiWHFRTWVhaVB6eVYxdkJuSEZRVGh5UUh6YTNk?=
 =?utf-8?B?UTErVHdSdndEejYwRG4yY2g4a1ZtUTU1V1RCdi8rRm5iejdURlZwVWFqc3hI?=
 =?utf-8?B?ODBCK0pGMGFMbkw3UkM2aEdyazJmRkJEUitZK0lMc2dueGtVTExyeUl4VTFJ?=
 =?utf-8?B?ZWtTU2NWMlN1TXJVNG1GR3VlNFBEMHRhd2tYaWFEM3R5eTVFL0hmc3RXdDRZ?=
 =?utf-8?B?aFd4TVZXRERsbWkzbkw2SC9RYnM0d3MxVzROWXM1ZTBVcklQbC9yd2FvZ05r?=
 =?utf-8?Q?aKzq2ZhNcVoccjiry+6GcloUX4gd5J8bmKpyy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR21MB6416.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef22555-6258-429e-f5b9-08de7e0b2c40
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 18:39:18.5075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Q9rHuP/xsKRLuRCK+M9zU/h7978r1ePH5+Lr8rct4zSiuA+yY4UckkPGotajk1Q01LjLJGKP573Wm8kfLZAUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR21MB4998

Sm9lcmcgaWRlbnRpZmllZCBhIHNpbWlsYXIgaXNzdWUgYXQgb25lIHBvaW50IGFib3V0IGNvbnNp
c3RlbmN5IG9mIFNFViBmZWF0dXJlcyBhY3Jvc3MgZGlmZmVyZW50IFZNUExzLiAgSSBiZWxpZXZl
IGhlIGhhZCBhbiBvcGluaW9uIGFib3V0IHRoZSByaWdodCB3YXkgdG8gc29sdmUgdGhpcy4NCg0K
LUpvbg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWVsb2R5IFdhbmcgPGh1
aWJvLndhbmdAYW1kLmNvbT4gDQpTZW50OiBNb25kYXksIE1hcmNoIDksIDIwMjYgMTE6MzYgQU0N
ClRvOiBKb24gTGFuZ2UgPGpsYW5nZUBtaWNyb3NvZnQuY29tPjsgUsO2ZGVsLCBKw7ZyZyA8Sm9l
cmcuUm9lZGVsQGFtZC5jb20+OyB0aG9tYXMubGVuZGFja3kgPHRob21hcy5sZW5kYWNreUBhbWQu
Y29tPg0KQ2M6IGNvY29udXQtc3ZzbUBsaXN0cy5saW51eC5kZXYNClN1YmplY3Q6IFtFWFRFUk5B
TF0gRGVidWdfc3dhcCBpbiBzZXZfZmVhdHVyZXMNCg0KKCBTb3JyeSBmb3IgcmVzZW5kaW5nLCBo
YWQgbWFpbCBpc3N1ZS4gKQ0KDQpIaSBndXlzLA0KDQpJIGFtIHdvcmtpbmcgb24gUG9DIG9mIEFs
dGVybmF0ZSBJbmplY3Rpb24gd2l0aCBQbGFuZXMgc3VwcG9ydC4NCg0KSSBoYXZlIHJ1biBpbnRv
IG9uZSBpc3N1ZSB3aGVyZSB0aGUgQVBfQ1JFQVRJT04gZm9yIFZNUEwyIGZhaWxzLg0KDQpUaGUg
ZmFpbHVyZSBoYXBwZW5zIGluIHZhbGlkYXRlX3Nldl9mZWF0dXJlcygpIGluIGt2bSBhcyBpdCBy
ZXF1aXJlcyB0aGUgY3JlYXRpbmcgdmNwdSBhbmQgbmV3IHZjcHUgaGF2ZSB0aGUgc2FtZSBzZXZf
ZmVhdHVyZXMsIGJ1dCB0aGUgbmV3IHZjcHUgZG9lcyBub3QgaGF2ZSBkZWJ1Z19zd2FwIGVuYWJs
ZWQ6DQoNClsyNTYxNDU5LjE5MTkyOV0ga3ZtX2FtZDoga3ZtIFs2NzUyNzVdOiB2Y3B1MCwgZ3Vl
c3QgcklQOiAweDANCnZhbGlkYXRlX3Nldl9mZWF0dXJlczogdm1nZXhpdDogbWlzbWF0Y2hlZCBB
UCBzZXZfZmVhdHVyZXMgWzB4MTFdICE9IFsweDI5XSBmcm9tIGd1ZXN0LCB2bXBsOiAyDQoNCkkg
Y2hlY2tlZCBiYWNrIHRvIHRoZSBTVlNNIGFuZCBmb3VuZCB3aGVuIHRoZSBndWVzdCB2bXNhIGlz
IGluaXRpYWxpemVkIGluIHRoZSBpbml0X2d1ZXN0X3Ztc2EsIHdoZXJlIGRlYnVnX3N3YXAgaXMg
cmVtb3ZlZCwgdGhlIGNvbW1lbnQgdGhlcmUgc2F5czoNCg0KICAgLy8gVE9ETzogZmluZCBhIHdh
eSB0byBtYWtlIHRoaXMgb3B0aW9uYWwgc28gZ3Vlc3RzIHRoYXQgZXhwZWN0IGRlYnVnDQogICAv
LyByZWdpc3RlciBwcm90ZWN0aW9uIGNhbiBhY2hpZXZlIGl0Lg0KDQpBZnRlciBJIGNvbW1lbnRl
ZCBvdXQgdGhpcyBjb2RlOg0KDQrigIPigINzZXZfc3RhdHVzLnJlbW92ZShTRVZTdGF0dXNGbGFn
czo6REJHU1dQKTsNCg0KVGhlIGlzc3VlIGlzIHJlc29sdmVkLg0KDQpUaGlzIHdvcmtzIGFzIGEg
ZGlydHkgaGFjayBidXQgSSB0aG91Z2h0IEkgc2hvdWxkIGxldCB5b3Uga25vdyBhbmQgcGVyaGFw
cyBoZWFyIHlvdXIgb3BpbmlvbnMgYWJvdXQgaXQgYW5kIHdoYXQgd291bGQgdGhlIHJpZ2h0IGZp
eCBiZS4NCg0KLS0NClRoYW5rcywNCk1lbG9keQ0KDQo=
