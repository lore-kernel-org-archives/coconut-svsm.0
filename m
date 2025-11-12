Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011051.outbound.protection.outlook.com [52.101.52.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D651EB9E3;
	Wed, 12 Nov 2025 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955709; cv=fail; b=kIINOnYff3C2jtT10Wlpyo9F5YDwKHnGBtgfTvyJJlCZ7MXqg315KJd9tYrpkJSqv2FbtSI/Cd9oTWG3ez2UBYCfVFrZ5NNpGiKxLqX38ribx6GgBiIeUs8glOn90MVuSZsd7KRnJPD/EJ/YTWq+F5G9fackNMBLO/y+osUwR6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955709; c=relaxed/simple;
	bh=CwOkuCFhlSjV5oWYfgvbr3pgC9PbjIc8Uuc3O6h6568=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TOUdxgxHrE2d1krzdVNWnb5A3kK+NF+u8vrYqZWFyCkdMaKyHqiwygiCnhCCn2A4rqNELuzQl6lvBwvJ7NcxGMj0w36CsxhNs5UMJNy/oqiwEofMrFJ1mk7cG+RmhOaPgLJtwmmsuDKkD+r7R0V4yWKEfRf66ALFn1p5szzRI+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R8o1TaYH; arc=fail smtp.client-ip=52.101.52.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R8o1TaYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSwofaY8HBN7R7zOE9cfLDoyJU+AWF4DVr8TCmgqstjxu5ElDWqfA3I11dNRruoBb2JwTSVzoR4VlfFn8ZmETAOZX90/mmsZVrySfuyhlCqXp4PVapiwncycT5NvBNcj+jn4/so54Wpn+x7EeGBv2neZOfr3SxhzAXDrnmvcRAHbGJg2tBckaiGiSQ9h5ZeyWDInOlhmhDzkcup6YWO/VNAbRIuv+gxdD3BfyTlJ7TxfRSUxolbnfek65w3uuMOdJo6/AmpOwVDW56TAMofQYXO+3O3QoUEZGhxttX80u9hHEqtqNpwwtDKKqxxCjb+dWgyhDXhs+71s1c3FDNOoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwOkuCFhlSjV5oWYfgvbr3pgC9PbjIc8Uuc3O6h6568=;
 b=GOppc5vxRWL5gh5NVHb5g7J1ytf+tg/QvJ3D9CP1meWinM+t+QJwFVIxZzPYLkp4i+jNFtGdc3DWjrADqiBov7GM7gV1IVzLVg/ERiTo3tc9W+8Akwprdho04qGpLo9nzb5wgrCQjFn+E8lWydQeZHPtpwZWkZPIzdYAFQ61fe2Iax/mSP5jpPGUzFsitMeCWE3iu51MdX1fXERe3s75aWYMZE6TRvNN/j4V/AqH5P/rEomBDRHTOldrCwqIphgt1whHt8lTlxxMtl/kYflm9K1lA0hc00l2DLj3pjoB4dNZWf5gzNsog+YiorH2CSqnDhwSdQB4OH4zpZ0PhGyOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwOkuCFhlSjV5oWYfgvbr3pgC9PbjIc8Uuc3O6h6568=;
 b=R8o1TaYHFxr1dfotAL/nxn+wTgbp7J1AWUpkvGkEfrC+R6+fVQKjIMsXaGSZSPE/vTTT/cG3HebzE8xvf+ms5+AMOL5QYgQGABkNEC3hcqsLzvl7+enRjNKkde2SNPCJ0d+C35rKUlkB5qpjjfn1t6yq9YkV+H6cKp7qPjp2TpY=
Received: from CH2PR12MB5516.namprd12.prod.outlook.com (2603:10b6:610:6b::23)
 by SA1PR12MB7411.namprd12.prod.outlook.com (2603:10b6:806:2b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 12 Nov
 2025 13:55:00 +0000
Received: from CH2PR12MB5516.namprd12.prod.outlook.com
 ([fe80::80c2:1d4f:4a3b:73e]) by CH2PR12MB5516.namprd12.prod.outlook.com
 ([fe80::80c2:1d4f:4a3b:73e%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:55:00 +0000
From: "Relph, Richard" <Richard.Relph@amd.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
CC: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: One pager on SVSM_REBOOT_EXECUTE
Thread-Topic: One pager on SVSM_REBOOT_EXECUTE
Thread-Index: AQHcTno66iC6Du/eC0OQIjmeOHr99bTuv0+AgABbjQA=
Date: Wed, 12 Nov 2025 13:55:00 +0000
Message-ID: <95C518AE-50D4-401F-A260-67B63088E1DA@amd.com>
References: <A8B4CD4A-DB61-44C2-B1B5-B1E6F38A244B@amd.com>
 <cgiypgi34vkzsmn6vsdvxpgh6v2oaddfrb6nozdvru2xrswyxb@magqcoyl3xw5>
In-Reply-To: <cgiypgi34vkzsmn6vsdvxpgh6v2oaddfrb6nozdvru2xrswyxb@magqcoyl3xw5>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5516:EE_|SA1PR12MB7411:EE_
x-ms-office365-filtering-correlation-id: ed55ab42-2d0d-4bf1-e57c-08de21f3127f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?c2dRclFGbE1pSjZhUHNCOVdPczlUQjN3TUZhM1Blb1ZLdUZRWXhQZEt5SzZS?=
 =?utf-8?B?cHV0SGFPSk4wU0U5dzJQcWlwYjJKTG4xaS9NSElNVi9tY21TaHVJVm9aeWxV?=
 =?utf-8?B?NmFLODVpdE5WMm5LcTFMcEZ1MVludEdHMU1HTmRqVGxxMFBDQjBTU1V6OGFo?=
 =?utf-8?B?Uk5NU29EV2RtZmU4Y0ZIY1ZuclJDK1dkU25jeXB6c2h0SVA2SEtQQUN3VFk5?=
 =?utf-8?B?VjZpSkFKNHpINlhNRFlxeUZtSkJGdGJvNE9pUlFYM1g3UnRZTld1aDFaTlRE?=
 =?utf-8?B?WmxoTHQ3NGZIbFhQdllsdG0wbzdmWUtsaUNuUTA0WXlqMjg2VncrR05ORnVO?=
 =?utf-8?B?eG5JMXR3NmRIRUVQRGtjVHRUNWtMR3ZkTXNYd3RpYVBUSzhqQXNzZ0VzdzRG?=
 =?utf-8?B?UE9uTE9HcDJxcU51dzU2dExRQjJic3pBMUNOMHF6eWVDSTlhQVM4Mkg5ekhT?=
 =?utf-8?B?bzE2aGZwZCs2cklWY3V6UVRZM0VQUHphcnZWS2xYbWZEREZ3SzZrMEJUZWxa?=
 =?utf-8?B?RmZrMnlscHpMbm0vemYvUFZGc0RkSkcxeFFpUmNnS01qZkd2MEZ4SnUvOXBw?=
 =?utf-8?B?SnRhZkk0RVUyck8wYldreXIxZ0dFT1hPWi96ams1UmZZczlnc2IrTmtQYmZJ?=
 =?utf-8?B?UUVjYnRoNHlFMy8wRThIaUlqMExuVTJFOUVZaW5TZFI1MTF6eUxhdDJ2ZDN0?=
 =?utf-8?B?VnFueUhENVdPSFMxWEFBaFU3R2R3OGtTTmpDS1dTMlhnaDRwMEVSeWpXZ3U2?=
 =?utf-8?B?U1VVU2FCVXVVOW9EZnRxTHlMdVc4Qkt5bXZKa2FiQ2RlREZQUmhMVThiZmoy?=
 =?utf-8?B?eEE2aHZtUXJLL1dzRUJieXRwYjFXLzVkcFRzbUtScUUzeDNhMlVsS203cEVw?=
 =?utf-8?B?dHJYT3VwcjhXNnUweFR0MUZjNGxhOUR3cmJYUm1YZTdTUWlvOEROZXVlVUxN?=
 =?utf-8?B?K0ZuWDZ2UEdHZnpucE9VMzVyb0RyeVlTWGRSMzU1RTNJVFdXdHpkSVR6cWwy?=
 =?utf-8?B?N0wyVnVMRzlLMy91cjZia0lTQ3RHQUZNcnl3NzhhTFFxalJkQTlvd1BPRGpW?=
 =?utf-8?B?RndJaHovbDU3a0ZpMzk2cWh2ZzB5QUthcStYNWd6NE5DWms2Q3hOYmVnb0Zv?=
 =?utf-8?B?bnVNa0lVa0laaVJoTjFqT015RXQwemRXYWN6MDJRZXNocWlBR3RRcXoyWjNB?=
 =?utf-8?B?S1ZINnRMVDdPWE1lakJGMENMdSszc1J1OXY5dk8zZzUrTWQxc0lIeEM0WDdm?=
 =?utf-8?B?cE45Y1RWMTh6QkR3TUpFSjZKRFRvUmlZQVFnOGtoaUVwZnNtRTV0Tys1L01Z?=
 =?utf-8?B?RE1RQVJHZlJIRWdVbXFkTWN3RTJPK3dKeHBvTm5qM1dBc0xaV1VCTEluTm5u?=
 =?utf-8?B?eEN1THhkcVhLUGVWaFk1dmxKb3V6cnZNTFFEbjZvUG1WNWYvRC9jYXg2K0NF?=
 =?utf-8?B?b1BvQU1ienYvZEw3MURTck5CK2pwV0g1VThhdE5oYm1pclRZWXlDUGxtSEZu?=
 =?utf-8?B?eHpVMmlaLzBQWW96SVowU3hBR0tIeWFYOXFyMFJscVNFRE8xNEs4cmVMREhK?=
 =?utf-8?B?empEZWIrRkpzSXpZQi92ZXM5ekVqdzNwOTBBWnJvUUNmZW93TzR1V0ZQZmVl?=
 =?utf-8?B?QUttTkpKMDBVTmo3WTdZQWJlazMvYlBORkdWVlRhZG5DcWJQdlY2NzJUdG5G?=
 =?utf-8?B?UE9keXZOV0R6dWViZnQya3BEai9TRmZPWWp0TWNZakJyOWs3RTY0eExhMHlJ?=
 =?utf-8?B?SW5HeXVQSWYwOFg5dUd5OW5yT3JDYm52WU9raGJDdzZUNWVLdGl6U0pTOWpG?=
 =?utf-8?B?czcrTEdVTzQ3TXNNSlpMRnJuMFB3TUMxbGRQU0RPQjZaVDBUaE4wandzRkUz?=
 =?utf-8?B?MVRuVlpWeVlTcTZEQWNEMWYzVGF6N1M4WUZacDJ4cWMxVlpqaEVZaWxSRHlx?=
 =?utf-8?B?Q0JVOWk5d25pMmQvekt3eTMvbWN5bXBUUXY5ckl4YXBKZkpKUDBHcXlad0dv?=
 =?utf-8?B?Y3JMaGx6cVR2MGRpcnFpTzFhWVdDSm1yOFdORENPK3l6WEZlYkx3T0dVOWl2?=
 =?utf-8?Q?3TK1bt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB5516.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UVFSVjVFY2VmVlR2b29uRnVzM0dITXQ3eWx4Sm5rSHQ5MVNMbW9vVWFjVG1N?=
 =?utf-8?B?UnNybit3YzRLaGVRUEdzOTQwZUE4WVhFMm9ndVRqeHZuOEJjTTgrR3hRMita?=
 =?utf-8?B?Sm5jZDh0cldBSmFyRW50R29nRE5hcjZ2NjRROU1COUd3TUhXa1RRc2hhTFpP?=
 =?utf-8?B?ckZkbWdPaWlpNE5zNVpVZi9LRUpXcjhDaE1TVU9lbXdYeFJ0eSsyL1FTQzcy?=
 =?utf-8?B?UHlUSFRwUm1Wd0ZvaUQxVThqMUdUV2RWVjhSaUU5Z0NvN1pRUXQyZXNaa05N?=
 =?utf-8?B?YlBuczFVTUJWVzF3dmJKYklOMnJyS21DR1A4bTRISmU5dGg1dG8yc2F2ZFZR?=
 =?utf-8?B?ckk5NkVibEpBOFNvc05aNnFYcXZQdmhQZDhUTTM2QXNwNHQrMDNaa29kbFpC?=
 =?utf-8?B?NDB0bWwxeGo1MllmNVpIUUFXQmwxUjRWdWNQN1p1RVI2UjBSdXllR1I3U05Y?=
 =?utf-8?B?ZjdDSlFOU3NLdTgyOHJNWFY5R3hlekJrb0V4dlhGRTFPYTZWWGRrV1dqenpS?=
 =?utf-8?B?Vml0dmRpL1ZQSkZwV2pTQ1pzeFpFSTRoK1JNZnlOanlYeWZoVnpaNlNZMENO?=
 =?utf-8?B?SGZXTG9odHVYNFgzUUtoMlpkeWVRM2lkMUxzSlFid2VhOHZ1M04rQ1Bib0Fh?=
 =?utf-8?B?Qi9qRm5WSzREby93eS9VZm5iUmN1R0lzc0R2eG9Za1hlaDhQSjBNLzJja3o2?=
 =?utf-8?B?dGJqcjZMdEJ0d3RrNUxmaHRtT0taNEJRSkZ5SnpnSlloc1MxVTFrTDF2NUdp?=
 =?utf-8?B?aXFTUjRabk84YUZTZStrNVBNWjBPU2QvVjVPblF0RWdWYXh3bG1CemFOdkhh?=
 =?utf-8?B?VTBUSjBkRlBIUkFZYlJ2UU9PSk5yMFd0SW5rTmlLbmNuUEtJL2tSejNvZjda?=
 =?utf-8?B?U1JlMTVRbTFFNDlTYkk4WkpnN2MySmVDMVRhcTU0Y0NaMHpIc3lyRmxQYmsv?=
 =?utf-8?B?cWxmVXF1M2pYQ1MrakJOQlBCTXV6REFFaGFMNk1qaDh6REtYa2RJZHIwMTQ4?=
 =?utf-8?B?TmphT1RveXU4b0R2MTZ6UTh5M3E2dW5sclJWTkVGNWgwUC9BN3haZWsxMjFP?=
 =?utf-8?B?UjRmTTN3VktIWHJya0RTbzhVdDB2aEIyRjVoT2VxTmhwL1VOMGdZYjlqajAw?=
 =?utf-8?B?ZTJBeFdXQ1hseEw3cDR4YUp5YlZETTNjWmQ1OHdRanBtdkprZ0xvMkhVbUs0?=
 =?utf-8?B?aVRDWFJ5UEM4aFJFaXBMb002aDN6c29VQXJEWGN4NHJhbnFzWnFRZllyaXRp?=
 =?utf-8?B?ZjFJdjBVSzBQV2ZqQUdDOXNtNlIzckVycXljNFRxQlFpWS8yK2RBUzU3SDFH?=
 =?utf-8?B?dmJxU3NGQmxWRnhNOHVHcFBnZExPenUra2d1OTdUUmozZWc1bS9lendmNjly?=
 =?utf-8?B?MGhPSThDQW5vM1pPazByeVVUaGxCbjNFbjJHQmFNTU1sNG82RmM5UHpRS093?=
 =?utf-8?B?Zmg5SXB6WHlJcVRxVnQya0hVRkoyQVVIeEpmNEZNMkkvM3FVaG5Dak4vTjZm?=
 =?utf-8?B?VTI5UkhXZ3AybFVHei95RFVBN2w0Rmt1SGNtUzJGNURMc2MvOHpMTjZvOW9C?=
 =?utf-8?B?a2FrZWZQOWM4emhXVEtSMUI3VEFWUkpLSkxJY2dnZ3RCdGZwTG50TGxDeXlP?=
 =?utf-8?B?RVZCaGJnODNzV01PUUlBTzRQdUIwcm5VY0puWFJPSUdCd0xLUzFJQzBhVWRm?=
 =?utf-8?B?bDdUc0p2ekFtMHRpMzBDTDJ2NklqcWRRM3lvWGNIZkFsckYxZnRBWG4wRmlt?=
 =?utf-8?B?dUw4blZjd1VNbCtWdVphcmlpdjYzcWpTcmtsNGwvLzZJMEM5ZUU5SGIzTDR2?=
 =?utf-8?B?Yk54WWw4ckxvOWxNWW9CT3JlaDI1NGU3RHFualAwV2pQUDdwS1NNdjRFL0NO?=
 =?utf-8?B?UUxHc3NjWG12bmJOT3Rib1JScVNPNEExSFd3Ry9zbUZLL0lnVWtZRXVjcldY?=
 =?utf-8?B?eUtDejlPWHVHQWRBelhhZ3JVVlBZalR2aWdzT09MZmQrTW5ScEl3WUxaMVR3?=
 =?utf-8?B?TW5hRDgzMTlSQkt2eFg3QWhHQjliOXk3S01YM0NDMmtaT1pUbXFqamU2VlBj?=
 =?utf-8?B?RXZVRGIvV213UmsrbHE2a1RKdVBpNzZqWXNDaURJd3A5b3l1eWxOdHZZZXBC?=
 =?utf-8?Q?AQ0UpzH7f43J3CO4iAvcdREBh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BAB231C3EDD3441B7C33A8985C96F52@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5516.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed55ab42-2d0d-4bf1-e57c-08de21f3127f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 13:55:00.3822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xNidd0J3cLesHKFszI+LZ+PwA9VZPDmqIi46Uaa4KzlZipb6vPJjHMTBP19e8XDM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7411

DQoNCj4gT24gTm92IDEyLCAyMDI1LCBhdCAyOjI34oCvQU0sIErDtnJnIFLDtmRlbCA8am9yb0A4
Ynl0ZXMub3JnPiB3cm90ZToNCj4gDQo+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVk
IGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNhdXRpb24gd2hlbiBvcGVuaW5n
IGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4gDQo+IA0KPiBI
ZXkgUmljaGFyZCwNCj4gDQo+IE9uIFdlZCwgTm92IDA1LCAyMDI1IGF0IDA1OjMyOjU4UE0gKzAw
MDAsIFJlbHBoLCBSaWNoYXJkIHdyb3RlOg0KPj4gSW4gb3VyIDE1LU9jdG9iZXItMjAyNSBDb2Nv
bnV0IFNWU00gbWVldGluZywgSSBhZ3JlZWQgdG8gd3JpdGUgdXAgYSBvbmUtcGFnZXINCj4+IGRl
c2NyaWJpbmcgdGhlIGluaXRpYWwgaW1wbGVtZW50YXRpb24gb2YgdGhlIFNWU00gUmVib290IFBy
b3RvY29sLg0KPj4gDQo+PiBJ4oCZdmUgYXR0YWNoZWQgVG9t4oCZcyBvcmlnaW5hbCAyLXBhZ2Vy
IGZ1bGwgc3BlY2lmaWNhdGlvbiBmb3IgdGhlIHByb3RvY29sIHdpdGgNCj4+IG1vZGlmaWNhdGlv
bnMuIFRoZSBzdWJzdGFudGl2ZSBjaGFuZ2UgaXMgdG8gcmVwbGFjZSAiUmVib290aW5nIHRoZSBn
dWVzdCB3aWxsDQo+PiByZXN0b3JlIHRoZSBndWVzdCBzdGF0ZSB0byBtYXRjaCB0aGF0IG9mIGEg
bmV3bHkgYm9vdGVkIGd1ZXN0LuKAnSBXaXRoDQo+PiAiUmVib290aW5nIHRoZSBndWVzdCBpbnZh
bGlkYXRlcyBtZW1vcnkgcGFnZXMgdGhhdCB3ZXJlIHZhbGlkYXRlZCBieSB0aGUNCj4+IGd1ZXN0
IGFuZCByZXNldHMgdGhlIENQVSByZWdpc3RlciBzdGF0ZSB0byB0aGVpciBpbml0aWFsIHN0YXRl
LiBObyBvdGhlcg0KPj4gc3lzdGVtIHN0YXRlIGlzIG1vZGlmaWVkLuKAnQ0KPiANCj4gVGhhbmtz
IGZvciBwdXR0aW5nIHRoaXMgdG9nZXRoZXIuIEkgaGF2ZSB0d28gY29tbWVudHM6DQo+IA0KPiAg
ICAgICAgMS4gVGhlIHByb3RvY29sIG5lZWRzIGEgc2VwYXJhdGUgZmVhdHVyZSBkZXRlY3Rpb24g
Y2FsbCBzbyB0aGUgZ3Vlc3QNCj4gICAgICAgICAgIGNhbiBkZXRlcm1pbmUgd2hpY2ggdmVyc2lv
biBvZiB0aGUgcmVib290IHByb3RvY29sIGlzIHN1cHBvcnRlZCBieSB0aGUNCj4gICAgICAgICAg
IFNWU00uDQoNCkpvZXJnLA0KICAgICBUaGUgU1ZTTV9DT1JFX1FVRVJZX1BST1RPQ09MIENhbGwg
cHJvdmlkZXMgdmVyc2lvbiBpbmZvcm1hdGlvbiBhYm91dCBhbGwgcHJvdG9jb2xzLg0KDQo+ICAg
ICAgICAyLiBUaGUgY2FsbCBkZWZpbml0aW9uIGZvciBTVlNNX1JFQk9PVF9FWEVDVVRFIG5lZWRz
IHRvIHNwZWNpZmljYWxseQ0KPiAgICAgICAgICAgZGVmaW5lIHdoYXQgc3RhdGUgaXMgcmVzZXQg
d2l0aCB0aGlzIGNhbGwuIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdA0KPiAgICAgICAgICAgaXQg
b25seSByZXNldHMgbWVtb3J5IGFuZCBDUFUgc3RhdGUsIGJ1dCBleHBsaWNpdGx5IG5vdCBhbnkg
c2VydmljZQ0KPiAgICAgICAgICAgc3RhdGUgKGxpa2UgVFBNKS4NCg0KSSBiZWxpZXZlIHdoYXQg
SSB3cm90ZSBkb2VzIGV4YWN0bHkgdGhhdOKApiB3aGF0IG1vcmUgZG8geW91IHRoaW5rIGlzIHJl
cXVpcmVkPw0KDQoiUmVib290aW5nIHRoZSBndWVzdCBpbnZhbGlkYXRlcyBtZW1vcnkgcGFnZXMg
dGhhdCB3ZXJlIHZhbGlkYXRlZCBieSB0aGUgZ3Vlc3QgYW5kIHJlc2V0cyB0aGUgQ1BVIHJlZ2lz
dGVyIHN0YXRlIHRvIHRoZWlyIGluaXRpYWwgc3RhdGUuIE5vIG90aGVyIHN5c3RlbSBzdGF0ZSBp
cyBtb2RpZmllZC7igJ0NCg0KUmljaGFyZA0KDQo+IA0KPiBDb3VsZCB5b3UgcGxlYXNlIGFkZCB0
aGF0IHRvIHRoZSBzcGVjaWZpY2F0aW9uPw0KPiANCj4gVGhhbmtzLA0KPiANCj4gICAgICAgIEpv
ZXJnDQo+IA0KDQo=
