Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B8927FD5D
	for <coconut-svsm@lists.linux.dev>; Wed,  2 Jul 2025 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464634; cv=fail; b=YEPyjuvX7xuPQeu58QFyzawLElpjgtaCHhXLwSHf0rPs3IleWDjoGkCKc5pjsDFzHPeyESDogj6N+g5OxGsDLiTxI1bshSK626fh9hHcUQzSLPR0Rg6zCs3bXzsXbKwCkYPLR3FpklJjC3fVJ3huMuHARCuM27NtQL7WStRBS+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464634; c=relaxed/simple;
	bh=HgY1F+cvOVDZ1aue/9QUPq7n0M+GXPeeyywhulLK5uw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rtT3gIKGxdEe252BE8ynIKXEPyPxhfoqHQiB+Gae1MrnXEoPj34X5C7n0WNCsgqkEs6vAK7TzU5/WNK6Iabpy6vVfvn32H87KtzPhucvEQ18hRdtKfLbMcBbQQCaHW0SK62dcfZhMB9Knr1Lw5pmNFObvaW4jsRKIeSfPArOxo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JXXuBv/g; arc=fail smtp.client-ip=40.107.236.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JXXuBv/g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxPzmGxFHPgKU8fJLucL+N83ewFTR5IQNwhvBF8aw0qbDH+fbDEgZdto8OJEMiO3bavdiAqDvaTNHzhYjq9mVT4Ct7NaCfccIzOWK8yaq1rgTJNdxNh+WiPYGHyS1VfhgLjUkm/y7PmhvNJ4ZGXmrFPzsjVR8kFoT+XiKsQ0X/yWKx8uFOd8UeXLWCPQidbCYbxxRMrGcng+MTRTNnRxzSEzgXbc7q92UhyedbYv45ncDAYOlnx+b4LLSH3bv+UGKG5YNVSpUIH5Jat8HZTmHwAvDBvQxl5hfrKGJU951wJ7l8KmnBrT9ET4w5a+NbRSbHfjy4h8rRJY31WWhwfHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/m3AHpcAsFs1R+uKCXqceP276IKiBrX2P32pFuZnUFU=;
 b=FaFfx4VxrtlyCpwsn5xDLtY4BMnv7tPAljjsE+bLPuZDqXrV/Q2Qp2aiuHOVWFplOWxFrYnpGewuW1Ee6Vad0BAzoASqz0kNWtUaK1Z8lUaP4WeLp3ZCUealgSEvYk2Wi6OruQzr2E2dqyQjB644yiXJLWDSuQjshBu/cdnQVBg+uJGh3mALflRLZG9g1hT3TKJjkGolQq89ycehlB/vD7ZPy7Gb98EwoixarsDUvr22ZA9aMt0ZxuWNvET3yJFdFCpMdVyMHqtkU6IvBqqiaJ1/bz+L19tFc65th3fuUzSYegd6K/opXbm6aCWSU2P1bHc6ofVTh59ji9YT+Cyo7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/m3AHpcAsFs1R+uKCXqceP276IKiBrX2P32pFuZnUFU=;
 b=JXXuBv/g2p9bEzHxBbJ+UG9aoCjJsOhNz6Zr5U8+5AWgVZX8y+akkh21xntmaJzgX694Yw19Zh5qtx+Gl0nUpg9oVvGbNG6eVoC/0D1ToUX2R9/CE/IX3fbPZYrvHIj/dLDeEsJkH912iSCKfGB6+0D0IPBlCB4vNOD+tBoFDRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by DS7PR12MB5789.namprd12.prod.outlook.com (2603:10b6:8:74::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 13:57:10 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%7]) with mapi id 15.20.8880.024; Wed, 2 Jul 2025
 13:57:10 +0000
Message-ID: <03fe930e-eca0-ae62-1490-1ad6a27d3687@amd.com>
Date: Wed, 2 Jul 2025 08:57:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: SVSM draft specification
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, Geoffrey Ndu <gndu8086@gmail.com>
Cc: coconut-svsm@lists.linux.dev, Dionna Amalie Glaze <dionnaglaze@google.com>
References: <fe3a4825-d079-0fe8-3fda-ed16044a048a@amd.com>
 <CAH6wD8WM3Zk2uy=nmaPgZ7LKuFSpNfYc7W1tuQJSnWQF=vN0eQ@mail.gmail.com>
 <gs37rpeemichi3wsaujsutjclml5vykenia7iytljiujumdfny@zknvphjyax6w>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <gs37rpeemichi3wsaujsutjclml5vykenia7iytljiujumdfny@zknvphjyax6w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::25) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|DS7PR12MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: a67b7e83-119c-4be8-b6a7-08ddb97056b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXllME50UFFlM0IrWTlncE5xVm1PUWgzOGpMUEFTTlVYRzFsZklwM3MwMGNX?=
 =?utf-8?B?NkdmaUZGV2JCWlpnd25ad2xTMXVuNWV5bWhMeDN3SVp2V2JncXlJaUlhTFYy?=
 =?utf-8?B?WE1jNWkzNEMvUXN6U1FTZzNCam1iTHJDZDkwbStDRkJrKzE3WWhIUE5rOUsv?=
 =?utf-8?B?QnZ6NnZ4WnNqTGxrTG1IYTM5NHB5ZGM0dHFxWXJwcFoyWG9SMGowWFJDdUxB?=
 =?utf-8?B?cytNOXRJaGVOczVOUm5rZzNRenNYKzIxcVREWlJEdENiMmNaWUYwcXY4ODNh?=
 =?utf-8?B?RFVXU1diQjZrU0l2bVQxNWtUQ0RpUU9IN3RWR3BXbDMzQW1UOGo2Z2g4bDFx?=
 =?utf-8?B?MFhPc3lBOERzaEthMHdzQU9aSHlDSjQyakw3Wm1XSk9vOVlmY3pHc0szdzMy?=
 =?utf-8?B?NUlQRW5lK00xYVE2bWVRTldIS3NOVVJqMlhlVDhBNDc2QnJrRERMU0R1N2J0?=
 =?utf-8?B?VFoxSkEzUHoveFFxWkpoYkdQNGx0dTYwM0ZOcWlQdzlaZnpDMkpsMTM5aktR?=
 =?utf-8?B?bi8xQ2REUUNyb3hHVjdjN1J3L1BPOFl2OVR4YzV6ZktrblR5RFRjMnQ2ejhn?=
 =?utf-8?B?ZmlGajlxOGM2Z3BhcGQ3MmptaTl4K1B4NDJJNWtkbXNPaStzYzVWcWpOQ05x?=
 =?utf-8?B?L3NBSFVnZVFURVlNUUc3QkFDNkY0dVRCSmplMWpzR3l3am1LVGQ2eHcrSzBX?=
 =?utf-8?B?VzhRMkV1NGk2dEt0eThVVmEraWJSajJZNjJYWEowWmluclJpc25ocXJ0eXJx?=
 =?utf-8?B?Szl4Tkk5bDFjNDVqUldEdjl3WXVXclRVVXZVSnFaYlZyTkFod0lHQkN5cGRl?=
 =?utf-8?B?YUp3MEVGVmY3WlVtQXFoSzVGRnBaVmUxZWlYUTNZemkySGlqd21Jd0Z6bFg3?=
 =?utf-8?B?UGdVQis1SXo3dCtqeVdSRS9HU3NMVkEyNTZLK2dmbGhGNnBBNU02VXh5UnFI?=
 =?utf-8?B?ak9FcyszQXloemlXUjBPRnlseDFaR2dnZE52Uk1SaFU1Z0F5VGdpcFBUWWdo?=
 =?utf-8?B?TGdidU9hMlhUV3JXaGNRMXNJSE5qS2RFK0JpNTBWSFBSa2Z4S2dyMm51VHpO?=
 =?utf-8?B?ZU45UHBjTXdMZ0F6LythaVptV0hqMWZFdGh0NGlSd3lGZm9GUUFyL0QrSDQz?=
 =?utf-8?B?a0QwcFFCWGoycjc3RmlDanNVUHg2VncvR042a1FOTWc2cytmVkhRUDVGVkVw?=
 =?utf-8?B?L3VWa0xQVzZIK3NLUTJ1Q0wyVk96MkI2NEt4KzlvVUNwVU1naGV0dENjWkRX?=
 =?utf-8?B?UnBZVHBrbHlvVE5WYXZYdUIwQi9sQndhZ0dSbmxHeHgwbW9zbEI4UzlDeGk0?=
 =?utf-8?B?SHhRZzIwU3VraytFcE1YRlVlRXJQWGJ3NlRBOXR3c2ppSnQ4WTdwZUhTL2VW?=
 =?utf-8?B?R3orMUVtOUFkNlVtWUtFeFJreEN5THRsNUlWZVlHdGtrYWMzbmhKSUQ5MVBh?=
 =?utf-8?B?STJXSThWZDhOaUhRTDFKZktPdDUrZHpnVUdNNDQzUE8zMW9qdERyUjd5V0po?=
 =?utf-8?B?VDd3NlNTdFJPL1QwM0pxWVRQem1VbXIvSEtuSXh5cjBKSGhvdzlQYzgyaGFl?=
 =?utf-8?B?aXhJNDZ6WmxYb2hWZmtISDIvVXRld1Nhdk9uY0J2TzVXQUVLbTNUeVEwb2JF?=
 =?utf-8?B?R2R1ZXBNd2RuYW02bUNxZFAzRVVmYjdRK1NRb3NrSVJDTFhSZHU2UTNjU2U3?=
 =?utf-8?B?bDRDT25LdWNaV2lheklYM1d0ZC9YaENJZnlYcXNyNTRWNGxvQWorL2FqYTVr?=
 =?utf-8?B?WnA1SHFmK0pwcGxRamw2cEh2eGpPdStCckh1TitnU0hEa0g2ZUpCYW4yRENl?=
 =?utf-8?B?QzhHT1dUb2thQ3JlUXlvSlVlbWhieHlmVGVPc0diY2FCLzFRbVpISCtxbFN5?=
 =?utf-8?B?U1BEcWE0bFJNaUhCaGRJSEJEWEd0ZDBiaW85QXJ5MUVTVitnRzdvZmNGVWhx?=
 =?utf-8?Q?BFnWhmPuOSQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alVPK0hmbDJNNlBubDdrRlZGVklQTHJqMndUSy9tVzRzZHdRTDFHMktncHZZ?=
 =?utf-8?B?a0tRZ2tNVlpwV3ZiWW92LzZ1MkxBMEVEcTM3Tk5taFFNN2tEbHEvc0Ivb0FC?=
 =?utf-8?B?WkEvVGxKdG95WGh3MVNGRWdkUXE4R2pGbVp0dUpRSXlxeWY4M2hGTUYyRG9o?=
 =?utf-8?B?SXBhZHlNczlSMFFSTnNaYVRWSWxvVERieXF5OVMzUWFaaVA2aEZYbXhacjlt?=
 =?utf-8?B?UzY0RTNtWnJ5MVJPRG1oZndoUWIwaGJKOHRUeEIwWWl4alRRWlAxOUJIeDJP?=
 =?utf-8?B?WkpkbWNVTFhraFJlcmx6U2RSYlBGY3pmSEY2WUVuSUgxcU5McVo2Y1BYSDFm?=
 =?utf-8?B?TW5YR2prM2wwdHJPR2lQWUdkVEc5WkNhdUszUjZILzVSeGVibUQ1NmMxdVVH?=
 =?utf-8?B?b1NWaDk0UEpQNzBad1ovcVNlMHFraGRleDdGaVZCbjZmUzBNNktpRzkrUFU3?=
 =?utf-8?B?Ukx3ekhIMUx4YjRIWXRNNFU3VjdrRmNHckpsNHE0WkFyeDZ3c2FINi9jQUlC?=
 =?utf-8?B?QWhFYmY0eUlKOHZiZEVlalB0eGNGUmVzeElDZ09qUVlhMDNla3ExK2o5S3ky?=
 =?utf-8?B?cTNkRXpKWVJBVDdxbko2dy9qTXNkOHpjUFkramJFZG1jWUZsSmY0TVpXVExO?=
 =?utf-8?B?U1VMamF1UHJ6WmM0Lys2OFRLdFN5L0ZyYTBUK0tHcktLSnBIUTJYRVJ5dU9D?=
 =?utf-8?B?Yzh0YnJZVmc1ckFZd2R0bjF0ZVFsSlJkQTBjTDJZQ3d2cmROT2xoK0dBb21u?=
 =?utf-8?B?bnozK1E2RGkzRmhNQXZ2UWpNQ1FjTnhEeXVFK0VLa0czVkcwZjFCNkRlK3NM?=
 =?utf-8?B?OVVwTGJ1cFNVNlZOOWxEODI1elVINEpvVko2TUllRFlHTUZENkRzV2RFaTZU?=
 =?utf-8?B?WFZxN21ERXozQkYzOW9LQUpMaGZPTm5vbG14dmFxbnVEOUk5ODUvdkZDeGgv?=
 =?utf-8?B?cGFmb2FKS2hjNjdqVHlkYWc1MG9PNk1kbmZmQVIxTHF3LzlrLzVFZndsMldQ?=
 =?utf-8?B?b0lOUi81OG4xV2p3ZkpwL0NVMTFibk1yUEJoZ1JmTkZnY0NCbkNXWjRsQnNX?=
 =?utf-8?B?WXcyeEFya2F6bzRSa2tLL2JKdXFoUU5Ua3UvYVd2SU43S2NzcGhqVk1TTmRL?=
 =?utf-8?B?RWdoTDJmVGUxaSttTDRpMmc1MVVPN0p5NjVra2VTelJReG51a3RyRFhubUFX?=
 =?utf-8?B?SGZFRGppYUI0aUNrQmRtZHJqOUNjcURLYk5rN0VMUXFJWlAyZ2hFdFp2VHRi?=
 =?utf-8?B?Mk1sb0tvOTNkM1lrS2RWZ3JLWURGMUR3c2QzV21ldWdFK3FJMk9UNUcyQmhJ?=
 =?utf-8?B?cGZpcmpYelZpWHM0emdFZ3hxL0ptZFplalplOGtvdE9kVnFQaWk2UC9heGp1?=
 =?utf-8?B?aHdaMmJGdURqaGpMMWN5SXVJdjd5VjZ3K2JtdktoZlN4OFNuMmhWSDQ5aytF?=
 =?utf-8?B?WDUvY3ZJOEpsdytENVZLNmZOSFFHOHZOK0k2R2JlK2NZNkNDSjJZZTh1TFNO?=
 =?utf-8?B?SnJSRk5kNVBOM0VvSVlwcllYR1Aybmt0b0E5aS96VHgxOGNnUjVpWHNBL3VD?=
 =?utf-8?B?b0ptYWNSaXZhU3dVZy9sR3VMSm9MT3J4d2JISjNnQ1MraGRJOHFyOUwzTzZ4?=
 =?utf-8?B?djcyWlIrM1NnazY5MnM5L0txV2tJNUdLWlQyb2pQQ0dmcnpwdjE2QmhUcTlm?=
 =?utf-8?B?QkxhZlUyZjFKTS92MXdySWFqakJvc1puWnE1NDF5U0tXc01BdkxTN01VbVVC?=
 =?utf-8?B?aUkyLytFTU5vcVpQbkZVMlNNZThiRGFyZWNIR1B1djVoVUZ0c3FXYzlEUnpM?=
 =?utf-8?B?cFlIclpXckk1NGdVblBNVnhkeXM1VHJ4bDlVSGFtTTBjSTRnT04wSVAxZHdz?=
 =?utf-8?B?K0V1M3JvM25wOWVhclpGUmVhMG92bTRUYTQxZXhzekh1MUl5cTNHbHBSeGRz?=
 =?utf-8?B?MVU3UWVtZXYzYjErV0pQL0dKN0RWZld0SnFUTUJyUDlwTGU2ZFA5dUdCdERX?=
 =?utf-8?B?UEZLRzhtU3IyM1BLZFF1cmtDcDNyN1p6Wit6anNnNHIyYW5FQXpRS2djSjBz?=
 =?utf-8?B?b2NLZHBCaHF2dUFVTFJrU3Zua09hNkpiUi9QbXNsbW1QcUM1eEtiODNDYzl1?=
 =?utf-8?Q?Eg/X+Ey3h2+zUYM+Sd9bJPqmR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67b7e83-119c-4be8-b6a7-08ddb97056b6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:57:10.1048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMxKg8WOmQcgeb1snOUNV2uk5G1qO5DVZKZrpBbgzC9c5RKlHU3vFzdGBSEgfD4vukj8PvPeikCQ0+QXu/CMmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5789

On 7/2/25 08:51, Gerd Hoffmann wrote:
> On Wed, Jul 02, 2025 at 12:40:55PM +0100, Geoffrey Ndu wrote:
>> Comments and Suggestions:
>>
>> * Bit 2 of Flags (Table 23):
>>
>> The description for bit 2 is, "Secure boot databases are updatable by
>> the guest (db/dbx)."
>>
>> Does this also apply to other updatable Secure Boot databases like
>> Platform Key (PK), Key Exchange Key (KEK), and Timestamp Signature
>> Database (dbt)? If not, perhaps allocating one bit per UEFI database
>> could enhance flexibility.
> 
> One bit per database is not useful I think.  They all should be treated
> the same.
> 
> What possibly makes sense is have separate bits for enrollment and
> update.  "enrollment" means the guest can set those variables if the
> system is in setup mode (i.e. no keys present).  "update" means the
> guest can update these variables with proper pkcs7 signatures.  The
> later depends on crypto support for the signature verification, the
> former does not.

If there isn't any objection to this in the next few days, I will update
the spec to add a new bit for enrollment.

Thanks,
Tom

> 
>> * Confusing Statement:
>>
>> The following statement is unclear:
>>
>> "If a database does not contain any data or is not present, the offset
>> and size for that database must be 0."
> 
> I think this is a leftover from an older version where 'db' + 'dbx'
> where added to the manifest, which is not the case any more because the
> uefi firmware measures them into tpm pcr registers anyway.
> 
> take care,
>   Gerd
> 
