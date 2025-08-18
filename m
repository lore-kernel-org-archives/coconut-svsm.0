Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2081.outbound.protection.outlook.com [40.107.212.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC9315781
	for <coconut-svsm@lists.linux.dev>; Mon, 18 Aug 2025 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531957; cv=fail; b=WWOBruLVbO2GQGuaG3WAclii4/E9XlG/8BEBRwmC6YX44Twn3dW6NzB6NPovKIIEd99cDToMXv2ktO/BO6t7imxnCGDtIKmYSk9j1tHzQXPhGB5B1kfvcAOkttWhjk8XJfynuN1LuGyn7LtN0FYKC1tazS8/raM6EtPY6cZvyfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531957; c=relaxed/simple;
	bh=eMNVNn/e4/CKoUPY4qGYWBjwFJEvKpKaLN+tuwpmdS8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eufDITQtlOhAL+eWX+76CEFOeT5e1aJXmZx8CNr7U6AUoEo23/5+W3a2kdhSmtf5p4Vqu+2TOVWjQa41U9kDHaW1PmR65I6wsuiYbNka0hkq4jkyR/aArgHr8UtKRBj6K9JdCaL9NGEL/WL1JHg9zyG/uGm8IJo/HljI1RW4CIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SfLpbF7J; arc=fail smtp.client-ip=40.107.212.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SfLpbF7J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWalhAiJFlaQo7ilkRGLd7jkMpzDg835mQorxp6q//59h5HzDf5RHCrMmEywLTVb7bJ4xfMPikI06IZKw6SQfFh/eenXDrfoE4FPlMuNPSyfyBVt0ZE98l9uotfPFnPVzAjSUKEILRnqMQRZ+Fpx3TszScmVcm1tY4xwzzmgzD59D75NeumnkhWNlRiUvfsfQGjRXkK6kxcGNoV6nWph4hH39eu4ASWTjYmbf7dK0HdBvhatuH44a06lQgbvKTr9jDw5ZFWKJu7Jqs2Ea/eKQpwdI6RPjXRRhZL8vElNpe1bwk5KRXdEBnr/0bgAemrMfjFZIfROYFH2BCWeoH7rAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ARDjQNGo3rxj46u4qAgA7W1qtZk78AompR99SA1roQ=;
 b=F+Awc3lwF2SQjL4AODm4pirJ7753lUH5HrriPE/eEVO1TPNHOiPONIK0gI9HuXUw5A0ASogo/p17Y6NnVIxwM0foRfjL5cC8KwrSotO2IojYduVQM7ujaMfqpvt8nlsqAR7o/aa7wDFaahxmAQ9qc07tW4muwiYfD7PdZwbbYL3rHm5bNMF2wBgSmNtEg2w+1jUqZ7PM0W9vZp/aFaMH9nuXtFYG3vo/Rcb8CyO7IBxOKUAYuLKsg2X13qH8Ezz+p5CBrj+U0q17HXwDgN0MpRc8Nvi+fF0w4i9KQEfvKPD27ILY3/bJlf+V0iOjcI+BOoVBCjTogYPni2kmIf90jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ARDjQNGo3rxj46u4qAgA7W1qtZk78AompR99SA1roQ=;
 b=SfLpbF7JJYGapRg9HvcjoP6P8UUwgR7/7lKg00j3g2PddFzdJkwQpR11kYxusou7y51COqP2nDsQI6+yXhKoQy7yuDbbiF8xTeIQnMm04APSgIYjLwYaWL8OMfFDYectS/nr6Hi3znc+uqwcrkmlnjtn3rz+YuvTTHL0yUPY7EY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19)
 by MW4PR12MB7466.namprd12.prod.outlook.com (2603:10b6:303:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 15:45:52 +0000
Received: from IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1]) by IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1%4]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 15:45:51 +0000
Message-ID: <3c58fc4c-af09-4e02-9371-6a7d63c98649@amd.com>
Date: Mon, 18 Aug 2025 08:45:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] The problem of KVM checking Alternate Injection guest
 events
To: Jon Lange <jlange@microsoft.com>, "Kaplan, David" <David.Kaplan@amd.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 =?UTF-8?B?UsO2ZGVsLCBKw7ZyZw==?= <Joerg.Roedel@amd.com>
Cc: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
 "Fontenot, Nathan" <Nathan.Fontenot@amd.com>
References: <e0c93748-dcd4-4e73-8355-3eb0478d971e@amd.com>
 <CH8PR21MB52220DBF67143C85CACC483CCA31A@CH8PR21MB5222.namprd21.prod.outlook.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <CH8PR21MB52220DBF67143C85CACC483CCA31A@CH8PR21MB5222.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::14) To IA1PR12MB8285.namprd12.prod.outlook.com
 (2603:10b6:208:3f6::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8285:EE_|MW4PR12MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: b334e944-b297-4084-c02a-08ddde6e4efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekZVSm5Rdy80WnZTRlRKTmNnSjgxS0ZJNHQ3bHd1STdjUy9PSU9SSExERW41?=
 =?utf-8?B?N2hPdUUwQ0Z3WWZua1I1VHZRNTdHZm1LZmJYQ2F6aWlwaWhRZklrMEVVYTRZ?=
 =?utf-8?B?NnlFVWIyL1pFNFVXdkdkdGMwR2x2MmVwejVRWnFIOTBzTjhOLzExVS9EZG5F?=
 =?utf-8?B?LzFvMmFuQS9HR1pIeHNTS2xnOWtIQUs4MjY2T2NkMnJmMVQ5eGUwdS9WTkhh?=
 =?utf-8?B?NkN0blhFVWZJY3M0S1d3aFVIWkFOU0M4N09CVnRsOHdqV280MlVSU2J6ZGVV?=
 =?utf-8?B?K0lTV2U4aEQ0cXNqKzVJeHJMai83QTIxa1h0ODZWVHliWXphUnA5U0JBZkNC?=
 =?utf-8?B?Y0kraHhkUWpkS05ZN25GZ3ViRUxpLzF6Mlk2OVhibUMxSjVGMlF1L0MvQ2V5?=
 =?utf-8?B?Y3pSY0NRQ2JaamVGcW5qQVZBMVdMZHVIdGQ0NGl6TFdwQ2V4YzVwcmNjcFBk?=
 =?utf-8?B?Zi9qdUV0ODlVQXlyWUpKYldjSTNjQmcvMmpLNXY5SXRhRlZlRXZyQm9KaGpK?=
 =?utf-8?B?Y3U0RmZmZXdtL29BcXRFWnFJNXNqdVBSb0JnTTZVc1pEYTVlamFrbmJxOHZm?=
 =?utf-8?B?MllJQU0zK21tWHcxZ0hzZXVuNzhmK2ZPbU1Hbk9JUEI1QlBVVjhxU0ZNMFRi?=
 =?utf-8?B?VmtvRm02Z29xUTZ0RXJPeFB1L3pXZVYxa1M1bE9WLzJlbHVEUXJCYmFsdEpF?=
 =?utf-8?B?RXkxRlBjY2Rzb0taY0RGdTJ6THdqWW9WVjdnM3Y2VjR6azltVFZUM2pUZFFw?=
 =?utf-8?B?QndySjFqWExuLzhSNU82TDB1K1VkRXpwRDFuUEJzZGxIMW03TXE2czRBTGRO?=
 =?utf-8?B?bXNoOXlqZ2FyZzN6dlY0M1RLNmRhTXh2QXZXRld1L0hGaGMybnZrcWtORVNP?=
 =?utf-8?B?bGFjQ0VEenU2b2QvWHE0Q1BIY1Z5UHpOVkQzeU1DRWN4bGtuaU5uQzMwSWJN?=
 =?utf-8?B?SXRGUnRiYnpJSnVoaER6YUFpU01GbWZNNmp5KzQ2V3RZUGJvR0lNUDI3aWo4?=
 =?utf-8?B?ZDg1MDBjM1ZVNFVUTGx4aVdVNldNNlprZ0FyY3cxNXZXYkNLeHpSdGJsSmI5?=
 =?utf-8?B?cWtUbEJWR0MwQUFiMWNzbnZ4THNuOU51VU5aTFlyWCtMYTM0blE1TXdtODFz?=
 =?utf-8?B?YmhpNllhN1Eva3FPbEllcEsvVkozS2pUOUZoNlEyR2Nya1E1bU9mL2p3QUFE?=
 =?utf-8?B?blRIbXlBdXBuY2Y1SGFvVDNPV3VVN1RsUFJ5Z3pHUFBld2F6bnovaHUyaVB4?=
 =?utf-8?B?MmdkMkJBNWFac1B2Zk4rYUZMYkNVY1NFeHE3UWlyckxhaXdYUXJVb1UxMk5L?=
 =?utf-8?B?bGxOampibmY4WXluRHZIcUp3VUgxLzhBSmFELytHdW1vcnpHcFFrR3lWV3dv?=
 =?utf-8?B?aVpIaktqMlFiUTFKaFkzSExZMTQvaVdYN0lNRkN1TERJNGVvelN4OHp4cEJs?=
 =?utf-8?B?ZkttbUozSXI5MS9JWVVJaXh2RWNFb0t5dVVpbmc4QjN6ZWg0b0Q4WVloTXli?=
 =?utf-8?B?UTNQK3cxdCtaaU81TWRmcTZsWUZNOHhSSjl4c2kyZDNIWUQzcC8vOE95cXV1?=
 =?utf-8?B?NmVVT2M1OEVETVM4QnVaTmo4U3dRMFFqOUk0YnRMOFI5cm9zU1BTdC9DTnhi?=
 =?utf-8?B?bVpLQ1IwRFJKQVpMU3J2K1lVWG1wR09LQ1M2VTJpSXhXUnNWbThBcDgwVEVI?=
 =?utf-8?B?RmNCSGtOUitJejNZQ0xUb2JrbDNvM1c1ZEFEeG15V2tra1ZUREtyNXZ0Zktl?=
 =?utf-8?B?RXJsTHEzT1UvSFVhYk10UkFocHdwOUJKS2g3OVpWd3RTdllGSlhleFhZc28w?=
 =?utf-8?B?Yzk5N1gxRjJQMEZlTmNSaXpFWEQ5RTQzaGRDS21aMUJhMFJCU1lJaE1zRm5C?=
 =?utf-8?B?VDVsWGxBQ3Y3bzdsWjJJOXhVMS9XeWdGL0pOMmFmbkRJNURxL1k0ZkpQdXF6?=
 =?utf-8?Q?lbQdV5tze6w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uzd5OGV0K0JqYTROUWgxQ090bUxnOVVCRHZ6TlpmZEJRcmVCNXpRaHFod3hl?=
 =?utf-8?B?djlDWEtVKzAzZlJaMVpZMjNpN21XY1F0YS9UbEsvS1AwcHNTajA5T3BrdEkx?=
 =?utf-8?B?M2djQ1Y1UTBHZ2lNb3B2YVRkQUUrYkdaOUNYUTVaTVkxdWJNRFRKTWpHRi91?=
 =?utf-8?B?T25DcFVXR1hUMkczVUQyRGFzVUNKUUlzS2s2eWh5dTR2UXl3bDFKZW91VVhn?=
 =?utf-8?B?RXRYWTROL2ZxVlBibHBCZDVwb1ZQa0JGYm4waTY0emw2dUJCd0t2RmVDaHdY?=
 =?utf-8?B?SVErUzUrUXNHcHdBYXVGbzIvaW5TSzRhNGwzR0J1M1RyNGo1ZFRCRU51SmNW?=
 =?utf-8?B?d1g0aFVrUGNCelZjOVFPZ2RHd1ZkRUYxNGFWbWErSHV1Mm0rTlV1N091LzFI?=
 =?utf-8?B?NU5zOGQxTGdoZ3NtR2xiZFFvV2VRTFg3aTIwRHFUWmIzVTBJWDdhL0dQQlR0?=
 =?utf-8?B?RGRTbU5XL3czSWpzMk5qOUFBaUdkQ01BdTRYUnRqUzB1NDlJR3JaZGJ0KytK?=
 =?utf-8?B?Q0FoaDFUYmpOUmw3blhnQjJPU3pzVy9oZ3EzWlNuTVBBZHhLbkhGTUJJUDl2?=
 =?utf-8?B?VUhPQ3ZOVG9JMFFlbXNEVjFqbTBNUEJZNEd6SGJFQm8rR3ljWFBjV2MxTHVy?=
 =?utf-8?B?Q1orTlJsYlpkQkNxTXlJcWlmRWVkZE0yZ1BOTVY3Ky9NKzMvR2ljKzJSb1dD?=
 =?utf-8?B?Nnk1YjVJeldXYkhjOStsRGY2V3NrdzBHZnhMa0xaampRWW9ja0RlZE13MkxC?=
 =?utf-8?B?YkhpTmRmOW9pQ2NiakRaenBFVHFiaDU2cGJ4NjdKQUZsblptRG9iQWlzdXkz?=
 =?utf-8?B?cUd6Sm1hOWxBWlRqN3IzWTRZVEVEb09GN1RXcEpmeXplVDFnWU9CWkhvQ09k?=
 =?utf-8?B?d1ZtVFM3ZHQwMTYrV3ZhZmJKN29jSWxYRjArYlpFOVhBbGJCWXFaTm16YXdF?=
 =?utf-8?B?bC9jSkdwZDE3RUNaTmxBQkcrK2pDUVp4Ujd3aW5Ld1M0RXNvK1NpVWl1NlNa?=
 =?utf-8?B?RDJqbVc2ZGJ3YVNaUU1pZnl2eVBLN0N2bzhhR1ArZkFaMzFZaUtub1puNGFO?=
 =?utf-8?B?R3NCSWl6c0h6c0wzVW8wdHV1MG5RM3daZ2tXb3czN2w5Mk82WTJJMFhRSytU?=
 =?utf-8?B?VVVWQkNZSVR3R0tUaDIrUWJsQk5kb3d1Z2ZmNC9JR2RNaDcyZlNjM1ZGQ2J2?=
 =?utf-8?B?SGJDbS9oYXlFTkF1TVFyY0pQRElxUkRwM2U0RlY0aVdCWkErSkkxSXFyQnhG?=
 =?utf-8?B?NlNIUlJBY3hKZzgvKy9mRXBDWUVaM05nSVFPN0NYQnB2Y0ZRNjdQSTVuR1VR?=
 =?utf-8?B?eGNBZDhrNHB2T1VPaEUxaFdIYXZWTGdLTnVZKzNVZTNGOGpjMFpSUkhBWWtC?=
 =?utf-8?B?cVFGMUhjQm1RVllUcUlsamFTRmMyYTVXUGdYS05rc0JIT1pvRUpldjFpTDVV?=
 =?utf-8?B?UElSSDhPbXFNdEY3d2c5aVI5WWpxVHI2YzZIcUVUWTVldDVMOG5JWFdVTjJy?=
 =?utf-8?B?QTJNSHRFVWx4cE1qVU9RMXVrTjNFOW9wZEhwMFhMaW4vTVVmU3BNVWpSQlBU?=
 =?utf-8?B?SHp4dG93Q3ZzNEVNRDZKc09CaEZhRkVRbkhLcXduR293TmNhaDZlU1FqbjJU?=
 =?utf-8?B?alVWZi9hTHRrUytoNS9MdEUxbU9zRjZxeU93KytCTUpxR3owNkt1Tm9vWGVJ?=
 =?utf-8?B?MjFLWnFOcW95S3VnVHpTRisxMHQwZCt3Q09pcTVEdktGUVJtK0ZOcGFzQWRL?=
 =?utf-8?B?cWJXVE03V0owNmhrdTEzTWI0Z3JvdGJOVnFoRWZNUmtTKzlUNmVDSnpUTXNk?=
 =?utf-8?B?UmRkM3NieW5rWGpJWGxYM20wa0NXRDRtdkd5c0toeU9tbHpGVnhzL0M2VHBX?=
 =?utf-8?B?N0IveCthN0tuL3NtNktPc0ZUTEZEbENzMjJ2MVE0L2ZNSHpTdkJBNGplRGJX?=
 =?utf-8?B?bHhiZEJPMFFrMFdUeDRDc2x6K0preHpEdFN6UXJFMVYwZ0FFQ0FVMVV6WXRy?=
 =?utf-8?B?aEpkSCt0eEhic0lqb2FJQUl2czkzMGVCblBkRHQwUDRGNGNyeDIyTXFXMjZt?=
 =?utf-8?B?Y3hSOUs5ZmhuRGVIdmY5a0NpQ24wMnB2dldDUFB3THd3STZ0MTdDYitUWW9r?=
 =?utf-8?Q?ozcBjUs6vKymhgJKUfZ5rBP3P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b334e944-b297-4084-c02a-08ddde6e4efc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:45:51.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VwFqnjrTVxdN7Qv2Nmfnt4u1qYsQQB3DDnQJPe4tinqBXZtX/LGEpRJlzEU4Tp+txQ19ds9z11ede1ivNdoKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7466

Hi Jon,

Both interrupts are targeted at VMPL2. Vector 33 is IOAPIC device 
interrupt, and 236 is APIC timer interrupt.

The problem is, I think, not multiple interrupts injection - this is 
just one of the incarnations.

The problem as I see it now is that after the SVSM injects the interrupt
into VMPL2's VintrCtrl, and SVSM switches to run VMPL2 but there is no 
injection happening.

I can see in the traces that the VMPL2 guest runs a couple of times but 
for some reason, the interrupt in the VintrCtrl cannot get "recognized". 
That's the only way I can express it because I don't have anything more 
concrete in the traces - it is just that VMPL2 runs 3 times and that's it.

And after that KVM does not run the VMPL2 guest anymore due to a lack of 
pending events as I explained in the previous email.

Thanks,
Melody

On 8/17/25 9:52 PM, Jon Lange wrote:
> I'm skeptical that you can ever make any of this work without the planes implementation in KVM, which is still under development.
> 
> Your example scenario is not clear about what vectors 33 and 236 mean.  Are they both interrupts targeted at VMPL 2?  Or are they interrupts targeted at the SVSM itself?  Or is one interrupt for each VMPL?
> 
> Targeting interrupts at multiple VMPLs is exactly what planes is supposed to enable, and without planes, this is impossible.
> 
> If the interrupts in your example are targeted to VMPL 2, then I would expect this to work because all of the injection required is performed by the SVSM up front, and thus the VMPL 2 state is fully configured in the emulated APIC.  When VMPL 2 executes EOI for the first interrupt, then this should cause the SVSM to execute (since EOI is an SVSM call) and SVSM should trigger the second interrupt as part of that processing.
> 
> If the concern is that a second interrupt arrives while VMPL 2 is executing, and that KVM doesn't know that it's supposed to invoke the SVSM for processing, then this is something that requires planes.
> 
> -Jon
> 
> -----Original Message-----
> From: Melody Wang <huibo.wang@amd.com>
> Sent: Sunday, August 17, 2025 12:50 PM
> To: Jon Lange <jlange@microsoft.com>; Kaplan, David <David.Kaplan@amd.com>; Lendacky, Thomas <Thomas.Lendacky@amd.com>; Rödel, Jörg <Joerg.Roedel@amd.com>
> Cc: coconut-svsm@lists.linux.dev; Fontenot, Nathan <Nathan.Fontenot@amd.com>
> Subject: [EXTERNAL] The problem of KVM checking Alternate Injection guest events
> 
> I found one issue when multiple interrupts are being handled in the SVSM but I think it can happen also with a single one.
> 
> The gist of the observation is, that SVSM queues the interrupt into the
> VMPL2 guest's VMSA but if the hypervisor doesn't run the VMPL2 guest due to a lack of pending events - it cannot know that - then that interrupt won't get injected, leading to a stop.
> 
> Below are the details:
> 
> Interrupt 33 and 236 are in the doorbell page as multiple interrupts,
> 
> 12796.893994: sev_snp_ai_update_doorbell: vector: 236, no_further: 1,
> ai_vector: 80, si_vector: 33
> 12796.893994: sev_snp_ai_update_doorbell: doorbell after:
> 12796.893994: dump_hvdb: pending_events:
> 12796.893995: dump_hvdb: vector: 80, nmi: 0, mce: 0, no_further_signal: 1
> 12796.893995: dump_hvdb: second_word: 0x200
> 12796.893995: dump_hvdb:  VMPL IRQs: 1: 0 2: 1 3: 0
> 12796.893997: dump_hvdb: irq_info: 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00
> 12796.893997: print_ext_irq_desc.constprop.0: VMPL2
> 12796.893997: print_ext_irq_desc.constprop.0:  ext_word0: 0x4000,
> si_vec: 0x0, mult: 1, ext_word1: 0x0, counter: 1226
> 12796.893998: print_ext_irq_desc.constprop.0:  irq_vec: 0002 0000 0000
> 0000 0000 0000 0000 0000 0000 0000 0000 0000 1000 0000
> 
> These two interrupts will be delivered to the SVSM, SVSM consumes these two interrupts, and marks them in the emulated IRR in the SVSM APIC:
> 
> 12796.894031: __kvm_set_msr: guest: post_interrupt(33)
> 12796.894036: __kvm_set_msr: guest: post_interrupt(236)
> 
> Then the SVSM injects 236 which is the highest priority interrupt, which will be cleared in the IRR and moved to the ISR until the eoi is sent back from the guest, i.e. the interrupt has been serviced:
> 
> 12796.894046: __kvm_set_msr: guest: deliver_immed: shadow: 0,
> irqs_enabled: 0, irq: 236
> 12796.894051: __kvm_set_msr: guest: queue_interrupt(236) into VintrCtrl:
> v_irq: 1
> 12796.894055: __kvm_set_msr: guest: Mark ISR, queued: 1, ISR idx: 1,
> delivered: 0
> 
> After 236 is written into the VintrCtrl, the SVSM will switch to VMPL2:
> 
> 12796.894067: sev_handle_vmgexit: vmpl: 0, ghcb_info: 0x16
> 12796.894067: __sev_run_vmpl_vmsa: parent: 0xff445aee23690ac0, current:
> 0xff445aee2cb83940, current_vmpl: 0
> 12796.894068: __sev_run_vmpl_vmsa: new_vmpl: 2
> 
> And VMPL2 runs:
> 
> 12796.894069: svm_vcpu_run: VMPL switch: 0 -> 2, immed_ex: 0
> 12796.894071: svm_vcpu_run: parent: 0xff445aee23690ac0, clear switch_pending
> 12796.894071: kvm_exit: vcpu 0 reason npf rip 0x0 info1
> 0x0000000500000014 info2 0x0000000001881000 intr_info 0x00000000 error_code 0x00000000
> 12796.894071: kvm_page_fault: vcpu 0 rip 0x0 address 0x0000000001881000 error_code 0x2000500000014
> 12796.894071: apic_has_pending_timer: lapic_timer.pending: 0
> 12796.894072: kvm_entry: vcpu 0, rip 0x0, vcpu_vmpl 2, current_vmpl 2, target_vmpl 2
> 12796.894073: kvm_exit: vcpu 0 reason npf rip 0x0 info1
> 0x0000000500000006 info2 0x0000000277c1f000 intr_info 0x00000000 error_code 0x00000000
> 12796.894073: kvm_page_fault: vcpu 0 rip 0x0 address 0x0000000277c1f000 error_code 0x2000500000006
> 12796.894074: apic_has_pending_timer: lapic_timer.pending: 0
> 12796.894074: kvm_entry: vcpu 0, rip 0x0, vcpu_vmpl 2, current_vmpl 2, target_vmpl 2
> 12796.894076: kvm_exit: vcpu 0 reason npf rip 0x0 info1
> 0x0000000500000014 info2 0x0000000002297000 intr_info 0x00000000 error_code 0x00000000
> 12796.894076: kvm_page_fault: vcpu 0 rip 0x0 address 0x0000000002297000 error_code 0x2000500000014
> 12796.894077: apic_has_pending_timer: lapic_timer.pending: 0
> 12796.894077: kvm_entry: vcpu 0, rip 0x0, vcpu_vmpl 2, current_vmpl 2, target_vmpl 2
> 12796.894079: kvm_exit: vcpu 0 reason hlt rip 0x0 info1
> 0x0000000000000000 info2 0x0000000000000000 intr_info 0x00000000 error_code 0x00000000
> 12796.894079: apic_has_pending_timer: lapic_timer.pending: 0
> 
> kvm_vcpu_has_events() is KVM's way to ask whether the guest needs to be run. It did not find there is any event in IRR (encrypted in the SVSM), so KVM does not run VMPL2 anymore even the interrupt is not handled. But in fact 33 is in SVSM's irr now which KVM does not know now, otherwise it will be able to trigger VMPL2 to run.
> 
> 12796.894086: kvm_vcpu_has_events: none
> 
> So KVM needs a way to know whether to run the guests again - SVSM or VMPL2. I don't think we have such a provision in the spec so maybe we need something there.
> 
> Right?
> 
> --
> Thanks,
> Melody
> 

-- 
Thanks,
Melody

