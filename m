Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3623C16CD33;
	Mon,  7 Jul 2025 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751896232; cv=fail; b=QcCzcqhIju9tTYPDOIXCXPrvtOMcL3MIfY9hBCJRbvDdPKq8/Bhs5AmSgciy3+SvihE1bktqd2oxIaG0hTTwnkjhX9LeUkLXEqAFeTCWtagNGKE2XgNC4bB/LsULn36aMc5GaUm7IYcmpxsjk46XKph1AR4E8Ach+zn+sjx1kKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751896232; c=relaxed/simple;
	bh=4IqpfPoNtazJ0onQjueFpl1tjcIkc66oBBf71fAVss0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u7TasYiNf7jpHImenasejohe8gXBkh/7rCO8kt/9FTxYP9YpNwQ7CaHdkQc0xR/rt7WH10fVpyWUhLGZUodaQYK0fZ7jTxk10zqA9dnfynzLm+e/B/iy+YLUaGi05DGueju0rJsb1aalNpXCpiCX0nYezvl17iiBMBiefnRsHQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rftEWxFJ; arc=fail smtp.client-ip=40.107.236.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rftEWxFJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpJmeHXnG9wjCnfJiZ/Rk1W1CoNTOV0KLKqhLPrmNTdLqXWj1mEF4Ig/vftVcmpBL8Qh2xQ1CApcicnj5pdFM8k7By7vXZTvRzPagJoJ6QbJqwyNjWQBD5Ky1Ed3DwcifZYq2oS71pqizVq7jwIpeBv/s1gTiYZUIzluSakPQ+JgwYJq1JVdFgJMED8Lc3zshx7kxNOiXp8/SjmTPVAZCuxm8lYgpOQdFDxNaFQpC+v71xDHOM4jJJnsPRmKrjvmlhRuIQusoJ5IjJ34Mx/OyqCPQmPof1KA+DtnvQppCeperDR8CG5QGMPYnZXioCcIAUMEaBPF1+6Bp0G+D96lDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+wA+aE+yKrrxXway8iTSKKYFhxCUqIPk0E1ecB6/Qs=;
 b=PesHcl/xrQlpPKbzaTGWDaV/Tl/66GceoNMFrH6y8rQSsM2aviW+fqhLv4WwmPu/ubRevhcaB85xSCANbAJ59uS8TyV41c7bphw0YIuuwSrzkioTuU8pf5mGgM4XZ59+UWqpbMA8RxEeb6Pzo/cnv8xVufsRKbcuZ5SHpaa+TbUHRwsiasj11OSJIWUR2cE8Mif5BUsCvrvc1wD0HBDJEfxXZ0J2lQBp50r8QhXhgJj6yOZjqVSaDHpc0Eavm5VJY3fyi5620+4a9dr1rJlmxN9r25pxMe2rF+4TCQ7BIPh8f5REpjkQXg43Y1cRIJ7xzEE2DG5DYERpKVOnEm5X+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+wA+aE+yKrrxXway8iTSKKYFhxCUqIPk0E1ecB6/Qs=;
 b=rftEWxFJMHTMmtFDt9/IfELLcGzmdweqYaCuwMsV+JtkeAsGdKzbclHZes8u7FMNMwwf6TcwJhEmdOcKVUJFaaHwULh6rkwtEn1JntPJ+GbK6F4uTRY4lQTynI1z+scGInNCuOiVgRyl2TfgVPZYzxL0QccaRDbSpdU2jC3Vaig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB9008.namprd12.prod.outlook.com (2603:10b6:a03:543::19)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 13:50:26 +0000
Received: from SJ2PR12MB9008.namprd12.prod.outlook.com
 ([fe80::b90e:e459:f49a:b454]) by SJ2PR12MB9008.namprd12.prod.outlook.com
 ([fe80::b90e:e459:f49a:b454%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 13:50:26 +0000
Message-ID: <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
Date: Mon, 7 Jul 2025 08:50:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM Development Call July 2nd, 2025
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
 <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
 <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
Content-Language: en-US
From: "Relph, Richard" <richard.relph@amd.com>
In-Reply-To: <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:806:d1::13) To SJ2PR12MB9008.namprd12.prod.outlook.com
 (2603:10b6:a03:543::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9008:EE_|DS7PR12MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c81e6fe-11d2-4c70-b18c-08ddbd5d3a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjBNS0YzcThYWmltc1JBN0Vkb1dXMWFZOEZEaTVCQ2pFWUZpK1Y1MHBlUk1O?=
 =?utf-8?B?emFwWEFSSGw1R21oeUIwVXdmRFF0TytyRGhWaEpHck1zNHFjdXM3eHZHTk9p?=
 =?utf-8?B?bjlXbjdWd3FPcEk0eEMxQTRTOFJ5NGpIb0VoSXNIZ1ptVnFZWTRVbVN5V0hv?=
 =?utf-8?B?QUFYTEg0c1FQdmhsWlNYM0Q0WUZlbzJWUlJZTnkwa2ZFWlFzdUZRVVcvam5a?=
 =?utf-8?B?bGVyd2tPaHVBa01OL1dRaVZvK2ZVdGtPUGtiNE5KMWZXK0lyOHRlSjBFTDMv?=
 =?utf-8?B?SkxxN1BvOVE0N0ZveDVEYTRQUFZwcTJJRUlwS1VjWjQ5bnU5YnBhN0RZOWxJ?=
 =?utf-8?B?OFFRYUJNWE1HeG01TWsyRXMwRThjYzEzMWs1bG50UUp6MTRsT0FZcm1XQVBO?=
 =?utf-8?B?L0U2eW9wbnFVd3dvbUx4WmdHVldMSW8wdlMyYkd5c1VyTG5PRFhPSm11WmpX?=
 =?utf-8?B?V0pzSElNUWJOZkJLZUY2QXFwZFN3ZG1jSlJxaG8wY3FQQUFyU085ajcrdDlG?=
 =?utf-8?B?VzR4MnVjRmV5eHBXVUYrYTdMN1A5cnJzc0c0T25aN041OEZFdUluZVVoeVZD?=
 =?utf-8?B?RDA2Tlo1amM4djdlQWFyV0xPSlducjV1RjZYU29SS2NtVnZBRjFDNTJXc3A1?=
 =?utf-8?B?WFlvaEhQS25CTUd3MGpXeHRWRjREc3Q2S01rTThpYVJRN1FQR1ZXRjl1Y3Ir?=
 =?utf-8?B?OUJUWGwzWXNsQlpVUjhYckFmWkJkK1RhK2lVcndGaVdWZi9aM1RCK0JnMkEy?=
 =?utf-8?B?RHFteTFWamNPck5KZTZ0MUVMaDZpMGFIVXZ2b2JxR0lwVUkwcHhBWWFCaHBQ?=
 =?utf-8?B?T1I0MFliR3k5N1gwTk1IekdEdVFJSkpBUFFFL2dmMEhWRm1QdjVEa2pXM3Bm?=
 =?utf-8?B?c0dJM1pCcGNsVkI4U0hLZExlejVxWWxRK0RmR1kxT3ZVRzJXZ0pUSURMNHZK?=
 =?utf-8?B?Ym9EcDVQZlNIRUZ0MkpqRlhVMGtqY2NpK1dlUjVkRTdpblc3SE5rMGZWSmtv?=
 =?utf-8?B?Ny9JS08xWU5oTEMrUWExZlh0UlVUV2MwWFJVbkNEQWpvL3BpWUxHYmhrQmxo?=
 =?utf-8?B?dHpMSGVoTzN1ZHZ5dDhoWlZpQzdXcEhmZkd5ZTZWT0t2M1VuS1BHMzdCejgz?=
 =?utf-8?B?Mll0dmk2WmZNYnJVQ2lxaDRzbTk5Y0dJZUVKVURqcXZyaDVLRUh0WkZmRVJr?=
 =?utf-8?B?bVI2Ulo3SWRTZnljNWJkZ2hCbVRwYkgwUFlaWXcyMTFkUmdOUFRRN0dVY2Nh?=
 =?utf-8?B?bkJua3Jua1BuYXMvVktrRUZlWFFCcHZXTEZTbmlIOGJKM1l1SXJFVnhjTFNI?=
 =?utf-8?B?cVZFOU5RRjhwd3d2VVhYZUhkb09BR0ptZDFjYW0rUkV6dzV6eEIyNjhnVEZo?=
 =?utf-8?B?M3JqSy9yY3FMMHovR3lNcmZYM2pLK0R2OHMzUHN4WW9aWWlVNklQamNyZnZ2?=
 =?utf-8?B?dE4zUkNkTW5xeUJsbkp6b1pJUEZ3Z0lyU2MzL3RmTGErMzFOMUx3eU9SUUZL?=
 =?utf-8?B?OU1Jb1U2YXpxNkdxeDZBYjk0K25iZnN0N2FZVjhaOUppbUlHQzg5OFpWL0hr?=
 =?utf-8?B?eVZvTGFEckdudmliT2Q1REUvYXY5bXp6bEljREpiYWxHeCtYVWVRUmVPWkY2?=
 =?utf-8?B?QkV3aUlPNHVsSmtTRmlreDZaSnpHK0tFWmN1YVkwZFl5UElyazRkVU5VNTFv?=
 =?utf-8?B?SzhNK0FRcllsQkVQSmdndG1KL2trNDFOdmgzNUJITGI1OXNudk9hNGtKaXh6?=
 =?utf-8?B?MjkyS0M3OUhTZ01CQVpmR0d5dWpKYmZWa3NqUUw0dlNnU1dnOUhPVEJodWt6?=
 =?utf-8?B?QUFMQlpaZjlzb3NkTkoySVBnUklrWE81YVhtSER5QlZUeDl1K0VKdmd0Yldy?=
 =?utf-8?B?WlNwaStBSHBFQW5HWVR0RG1Xa0pGQ05RNVJaM3dDZ2ZuSXlXQ2toQkJqSVV3?=
 =?utf-8?Q?VibOVnmC4ls=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9008.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXZYSWxCYUFJTmxXMWVzb3N2RjZsNDFic0lPRGRLNkw1UVZ5bkF5N29vb1hN?=
 =?utf-8?B?SCtZYXNJVmk4bEF1YWF1NmdKOXUvY3oyTnZQVGRIUmM3Ti9XZE10MEtmQW43?=
 =?utf-8?B?MTJEdlVSQTZtM3ZZb1RqdEVsRVVQTDl6akxCem1ia09yaE84VzNHZ2o3S3RO?=
 =?utf-8?B?MWZ0Mk1VMlh0YVJaUDgva0xuV3R3NXdlZzNhM1QrWkpYeFN0S1FIMjRPdXE0?=
 =?utf-8?B?NUVRM0tjaHlLUktMMmlJWEo2SFpMeVQwaU1CRERFdXdEMzlBWVZQMmsydzdK?=
 =?utf-8?B?VS9vY3hzRVJwTHpmWXZMWk5VMGtZRk5HdUdLSlNFRlVaa01SR1dtaktiNFBy?=
 =?utf-8?B?MUl4Lzc5Y2JHbU9mTnlTWGhLMzdhVjUxZ0hrZlpNeFhiNis0Q2pPYytjbEc1?=
 =?utf-8?B?NGNsUDhmSUVTTTJSRldWZnpsVmRZMXBvZE9qSVVMNmNyU0lMZ3R1U1BkVWU5?=
 =?utf-8?B?b3Fpdkg0VlRabG9yOWVDOU5nUDJlcysxNkhrMzNZNk4vVXFUZVJJbHFlb1k1?=
 =?utf-8?B?djZNZWZrOXlEV1JsRmRKa090a3lzcUoyRE10S0lTTVBjejBqbkJ3OHlvUEdM?=
 =?utf-8?B?d0dvVHJncDBmM2lQYUZnOWd1RFlEcklPcFBQRDVLRDczZGNteDgzN2JobFFi?=
 =?utf-8?B?bU1VL1lRMGxaODRNVUpxU1BiQk11T0tBMy9Hc3pLRk05Si9jdlBQOXNPc2Ix?=
 =?utf-8?B?NGxQWk51QUc2TEI3cDE2VFNWNVZlMEVmWmtaRXNBY0pwT24xWVg3dStuUGdu?=
 =?utf-8?B?VzlXMjcvcU5NTkhvZGxaZFEreHVsQzF0cGtYZVA2aUdiM0t4cmFXckxOdnhv?=
 =?utf-8?B?WFk5QjMvKzIvZGZ5R3ZYY29vY0E0WkRRM1Y1cXArbzg5U2IyZC9MT0N1cjNt?=
 =?utf-8?B?WnFuTHdBclZmbVVnODhvQzZrVGp3ZDY0clVkSmhCdnhYakRLVU9BRWpHLy96?=
 =?utf-8?B?SHhTenVYcEtPUVlpeHhWV0RRRXdEOStDa2k0aURIT3U2K1JWWlQwNGV5alpy?=
 =?utf-8?B?U0hBeTU4MWF1Q3hkaTZjWVJ3QlgvcEdQZGYrQ21nV0RJK2x2WHE2Z3l0R2VJ?=
 =?utf-8?B?NldKRVh1eXlWZWd4MWE5d2VIcFR2eHllaTk2bGVPZGMvc1NuTTZhcTk3RG5h?=
 =?utf-8?B?RWFTd2ZybG5NM3JwZTVGc2x5K2RaeWg2dWtxemp0d3R3R25vbTlqVDU4K0VC?=
 =?utf-8?B?TXI4dlJ4dnlMTkpmRTQxT0NQemZBVkhhK3hhWXByUDZCL1NLemlyZlJFT1h2?=
 =?utf-8?B?U3pwLzM2MTE3Z0Y4b25lVHJRNE54UzU4YVBPR2l0cW4zY2FZdzVtalZiZHUv?=
 =?utf-8?B?Um1OdDdQNDFGQVVBb1g2VzFPYzluTGk4UUZqeVNkNXdNNjEycFRRM1VpUU1M?=
 =?utf-8?B?Nlp1OUh3azNXcExHMWFpTTJpdWRBUXlzZTFmdWV0cUVhYkJ0UzE1OUUraTFS?=
 =?utf-8?B?WVV1MXZ1YzUwZDFJaHVxNEVJNGd2c2xZdXdLOHdZcUpHTjlJc0R3QmYxZDdM?=
 =?utf-8?B?aHVmRHZKQS93dW9sMWRrWVpQYTZxcVZTV213U2IydGRGNm5jU0N3N3VVdW5M?=
 =?utf-8?B?bGdWMEFzdmQwSnRkWXcrblZhRDZzUE4xSmg0L0FoRWpIZ0U2c21TbUwyTVlN?=
 =?utf-8?B?clV3Z3VsZmRwZmdwM0FLeHJScFJhOGE2NjJTOXYxUUJ5OGJ1ZS9zVS9rY2JC?=
 =?utf-8?B?Q1FjcXZSZGhZVGR6NGVRbU0weFYwVFUveHNtenVtSFdaek5VT0VsMG8zd0dS?=
 =?utf-8?B?WUY0a28xMlBVYUJIcDFvazlOdmVHOWh3dERpWGg0WnpJWHNXMGdvRW9lNnFp?=
 =?utf-8?B?eW9lSWUvdlZ1ZkQ5QmdTK1JGNjJtSnc0d1NwZnpwdkxYb29MSHhqaFdKbXhD?=
 =?utf-8?B?K044Y0xJZDdrQzNDYlR1K2ZZU2QwbFhXTjhZamg2eFh0dm02ajhUdXFlN0Zz?=
 =?utf-8?B?N0hibzJpN1pGb2pxUHJZaWVxajBORVlhYnhYV1oyUXY5N3NScWhjZUpZdlN1?=
 =?utf-8?B?L1QxZERSSVYyZzRQaCsxNUxDSm40ZG41V2ZodWN4bjVvdG8zNVI2azNzcThL?=
 =?utf-8?B?em92Yy8wY0kwOFZNOC90OVplcklxV0pBbEFuT253T1FwbDl0REEwVGFuVXIr?=
 =?utf-8?Q?leR4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c81e6fe-11d2-4c70-b18c-08ddbd5d3a21
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9008.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 13:50:26.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rnf2kNELgMV5rCsuxRiws1TSIV4a5MevM5aYh9rEevZfK2rOhcbtkfBh6jhpwDdc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504



On 7/4/2025 11:39 AM, Jörg Rödel wrote:
> 
> Hi Gerd,
> 
> On Fri, Jul 04, 2025 at 12:36:07PM +0200, Gerd Hoffmann wrote:
>> On Fri, Jul 04, 2025 at 10:12:03AM +0200, Jörg Rödel wrote:
>>> Meeting minutes are now posted:
>>>
>>>     https://github.com/coconut-svsm/governance/pull/65
>>
>> <quote>
>>   SVSM deciding its memory needs and informing OVMF. Peter Fang started
>>   exploring this, but it's not trivial and will take time to establish a
>>   good protocol for memory consumption and handoff.
>> </quote>
>>
>> What exactly we are talking about?  In the call alot of the discussion
>> centered around tracking the state of pages, and it wasn't totally clear
>> whenever that was an independent discussion or not ...
>>
>> From OVMF perspective I don't see this as a big problem, assuming we are
>> talking about static allocation.  The memory discovery code is designed
>> around e820.  Typically OVMF simply loads the e820 table from qemu via
>> fw_cfg.  But there are multiple ways to get the memory map, when running
>> on xen or cloud hypervisor things are handled in a different way.
>> Adding one more option for svsm surely is possible.
> 
> The idea is that COCONUT provides an IGVM memory map to OVMF, which takes it as
> a base for its memory map instead of the E820 from FWCFG.
> 
> Longer term it would be great to fully enable OVMF for IGVM, so that it can
> also consume some of the ACPI tables from there instead of FWCFG. But that is
> future stuff, what we need for now is the memory map.

As I heard it, the concern is that maintaining page state in SVSM (not OVMF)
will eventually require SVSM to have access to a dynamic amount of memory.
Right now, AFAIK, SVSM has no way to request memory from either the host or the 
guest.

Richard
