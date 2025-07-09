Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D692DA771;
	Wed,  9 Jul 2025 12:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752063649; cv=fail; b=Cbq1fD2oWzPSih+WA+/DYYbRi6RrBx/Ti0bvC2Zmyb6REq8irFDd4fnUMDqcZr5NoX6Coo0pQViXTe6RM8D5/zWu97b7pTdoPECRTLW+V7EIYIF5VvaCbBqkqmb6MoZ5Tx3CVptuzagcBtBk5quDGTU8iuax19i10uLJCEXTjIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752063649; c=relaxed/simple;
	bh=DuuJHxXHP5pu7SVHDwKDYG0JkYeydCJREhhV9329Ddc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ts4KGKnf8395t0tLdyuDvJ/wJbWcvtk2E1fVzqIAfqzm3k+lWvriSEWEdY8SWBzFr4GoB2dHSF8Erf2jPAsVeEZhBDotLEy0o1RKhVdlUAF4aQvpauml98I75Ux5FeP8+186Yc9fY5NIvMB/6v/0soNvsOkC5+Hm0YSjBeRFe10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rRDOkkHC; arc=fail smtp.client-ip=40.107.93.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rRDOkkHC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWHyqjfYi1bOkshPA2T5ezeOZTjlKqNSxeT8aTW/Vr407cAdEhsdKJ1Ky1RLeg+30pBhOqA32YihPyAKqhq2PNNvz99Gc+zXBVPJzpo3s7b/+OV/Ug+CbVqjIJJPMK3xLywox6LUsOW2kAr0+ZyLPM2K786LKhvfp7hPWUeWciv0h+RCqv2xdNbx9GueNZno8DqL4OVvl9uvgqYAFgvSgj1q+ZXTfxZabgV+gS1oqD9ekad9EL8FWO3LjBy+ii4eEewDqmYAWc3kO2Fpbp1Pncfy8sYJn5NwTyBAD6lvvhtlRUFHuM5PXH3Nt1eBgznzH4qqkbpiTwY34TKFXNgO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RL1rCkSAmCoJiujlMjGNf7BaYxLLjPjhd14e3BDN8gs=;
 b=aXTN3wborYzBEJiqYY3WHCwwpD/qEMPCObmuOzylTbKd69pZbyHWNY9ip5crhTK6UIbBDvHavcDLkEnRaqYQ2vnHijBgewOUUTDQhQ6ouwjbQEkQ8WktRB+fb49gf3GP9tMVY5St+AnOwr0OjHz8knH+zMeEqixVRTjtAf902D62c73klyHgXuC/rqsrTZ9MfQ/v9hj3FAj/qlblIp6xSAiedCroZw1qjFl8OtweWGCEfiMnXA7QZCRuBFCHG9ixZDiZDu13PexTRkB4KC3b0ioM6j2hyqbqLdpZB36pHW1J/GKXLapoReyXzu9yh45++KUv09fgeml9Hu/EMJrsQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RL1rCkSAmCoJiujlMjGNf7BaYxLLjPjhd14e3BDN8gs=;
 b=rRDOkkHCMqQtZaG5gcklVgMjUVdYMaFE8pcoaviwyemVr2svWzdIuOY1oTF0HL7QDrweuwTbk5MovtXERref5zvtCyeWHMR12+Icusa0o4fsgsQfqm16P6CNFnvBbcChrVociQxEzRJPXxSDDwAqmMqvgEkwuwwEUSa1QwJg2jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB9008.namprd12.prod.outlook.com (2603:10b6:a03:543::19)
 by CH3PR12MB8755.namprd12.prod.outlook.com (2603:10b6:610:17e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 9 Jul
 2025 12:20:42 +0000
Received: from SJ2PR12MB9008.namprd12.prod.outlook.com
 ([fe80::b90e:e459:f49a:b454]) by SJ2PR12MB9008.namprd12.prod.outlook.com
 ([fe80::b90e:e459:f49a:b454%4]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 12:20:42 +0000
Message-ID: <8f73b209-f521-4770-b940-7f6dff3accd5@amd.com>
Date: Wed, 9 Jul 2025 07:20:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM Development Call July 2nd, 2025
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, coconut-svsm@lists.linux.dev,
 linux-coco@lists.linux.dev
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
 <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
 <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
 <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
 <d579919f-6e66-4499-8634-e258af61c933@amd.com>
 <dxk7tpe3sebmv55p2izpwe5nr5esqf7rxwtzzmjio5zmzogam4@mdtstwmhvyj2>
Content-Language: en-US
From: "Relph, Richard" <richard.relph@amd.com>
In-Reply-To: <dxk7tpe3sebmv55p2izpwe5nr5esqf7rxwtzzmjio5zmzogam4@mdtstwmhvyj2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:806:24::26) To SJ2PR12MB9008.namprd12.prod.outlook.com
 (2603:10b6:a03:543::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9008:EE_|CH3PR12MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a6f364-b5aa-4695-2c76-08ddbee30591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3JzOER5ZWtwU0p4L2lXZWorM29lNjZDcUd5SGpxMWkrREZTK215Y3ZCSTky?=
 =?utf-8?B?VjI1UGR6SjZIUWlvWWZNSTJWMVpjUXlJWTlvUW9LWTFmZEJWTytQK0hGc3Ax?=
 =?utf-8?B?QXcyV0d5R2hNVEM1VXlaUnAxNmJIUGhTMktsRWRGQnBCaHVpNDhzZUJTeUps?=
 =?utf-8?B?OFl2U2taNHpUak41RncxM0ZhQWxzN3RFVklWZG9YYllXeC9PYVZNdzZ0WUFy?=
 =?utf-8?B?dXF5SHlsMFZLeFBqUFR3bXdOeUVERlROdW9Ibk5hdEdLQnlNQ1MxR2hoWTJR?=
 =?utf-8?B?YmRQRUFFMlJyMEkvaEVocWlkcVovQ2kzcnkvTDlQRTFrZlNibVoxWVBMdjQw?=
 =?utf-8?B?OHdxRTlKR3lwbVJQd3FWRGduSFd6aHJ3TDI2ZzAyRDdmV0JQRnZDcU1QM3Mz?=
 =?utf-8?B?UjNIS3VRSzBRTFA2RGtvY05GQStUV0lQdW00bE95RWNNYkRDVkJ5M0VoNmkv?=
 =?utf-8?B?QVVMUzVxNlFXWFpwdkdrcC93eDk5U3BUM01VTGwvaVZIb3dMaXhsUG9aZFBR?=
 =?utf-8?B?WWlNMTdEOWd0QWw4VG5WaHRscmVsQjlpaGZDNTBhNjBaMFYvQTFCVHk5bmFu?=
 =?utf-8?B?OXNFS2htOThTcnhWYW1Kdi81MnZ3VHl4dGZoZ0ZBZmlzREtPcjRzS2gxWXR4?=
 =?utf-8?B?M09jVW5nRDhKaDVRdUJUelArbFIxMitXZHgwc2FWeEo0azM1b1JONHpQRDk4?=
 =?utf-8?B?SEZ3MVJHSEZmVk1id1YwZ0ZZbndQUEI0TFJzeHhKV3VZSzlHazdWdzNIYXVZ?=
 =?utf-8?B?T05pbGtFZlM0M2sxWWlCYlBTVjhaWjlEZm54bi9wM3FpZWdLNU9EVU5hQ2ts?=
 =?utf-8?B?MUJVWk9yQkJWTWo3MCsrZXZIeTluWmxXNUpEYW9UM3dpVHhGMHg4U1g1Y0RJ?=
 =?utf-8?B?M1VnQ2p4YzlGUzN2VEZ4YVhxSTJVNU90Rk1FQzlOUWFTWGlCYUxHQ0ZSQjlV?=
 =?utf-8?B?RUNFdXQrU3ltdmI3bHJGc2pzQjRJOFcrYk5jYUlmRHM4NDM5cjFnd1pxRVJi?=
 =?utf-8?B?VHRMTlZ4aThZajJ0d2FLUjBRaGE3U2Ntc2laR1dxdnBCM0tPWm9xaStORjM2?=
 =?utf-8?B?c2RVUEo0S0NMTVliQkl4QVd5eEx0VVcwaS9ycWtyUnVOWUJ5ZThjUGhOeWZx?=
 =?utf-8?B?WDE3K09Cd2tFdm5aSjIzbFhVTjAzRWZ2eGRqL1EwZXQvL1VzSnBLcHQ3TW9S?=
 =?utf-8?B?VGk2MzdIbkh0em1CM1lVT2tOQk5tR05RUU04ZGdzY2hLcStmUG1HTmtwa0tG?=
 =?utf-8?B?RVhpbDFUWURrcWZ5SzNvNG5EY3I2WFEraFVwS2NwN242cjJhZkJZNGRPYU42?=
 =?utf-8?B?eTdYZnRRSjlVbkkybmxyeDZhR0NnNDBIdWpjV3lIbkxzRFZBcXZlVWZ0NjJr?=
 =?utf-8?B?K1VwMHFWUWRqY2NreUdmVm5OZ21uVlY3Q3dDRVlXUHAxbEpwbTVTN1ZQMFAv?=
 =?utf-8?B?VDNlN2JITlVwVDhaVjluVnYxckh4WVBEOTZPTS9jRUtaSXRTbWttYnNsRjAy?=
 =?utf-8?B?WDN1YzJmTGltOXZNcmF2N00yTit2am4vL01ldHVtbnVXazRNR1RNZEpXR2VM?=
 =?utf-8?B?VVFIakkwNkR3czJuczNUTkNwSGRFMUU4Y0ZuZFRxZnpLa3BzbHVjc1V3Mkx4?=
 =?utf-8?B?dkFjUVgreVN1Sjl1ZGN5Y2MxVWU2R253bm9LQmozSzdSZTg5bkNoOW05VUxk?=
 =?utf-8?B?RUNvM1c5eHRHUnUwRTV4ajNaMk5RTFZxMlhYa3UyTzRGUDBEUlZwa1ozTElE?=
 =?utf-8?B?K2FwT0RJbUNZWnlUaUp0VXdvdUEzc0U3dWFZaUdKR0J4U1pyQkZGZ203b2xw?=
 =?utf-8?B?b2ZLdFBLSERhdzhmSXJGS0c1Q0FzcjNKYVBMSU5aV3k2ZFdpdldkYVpXdVdD?=
 =?utf-8?B?ai9raHFUcjZ2OWRWTzY5bnFINlQrelcvZUl4dDRzNWE1UjlWVlQxN09oY3ZK?=
 =?utf-8?Q?gM9NhXfD5SQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9008.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmxjTXpkVkxTY3JUOWowb2RhUDE4L01sZzJuSkRCU21DWU5JY1kxdS92YS9F?=
 =?utf-8?B?c2xXZHlZVldsWC9lZ1drWFdoeU95V2dzRGE0WlNJWkJMalRGbjdBWGdJRVha?=
 =?utf-8?B?Q0FiNEIxTDhqOS9uQk5lNGUybDNkbGc3dDVwWCs5VGoxZXRNbzlOTnVjSkVV?=
 =?utf-8?B?U2ZHdHV1TzZERnVwYXFRZndWSVA2Uk1aV2pFalNZWjErU3dkZnZhS1FOZVdk?=
 =?utf-8?B?NlFmWnV2bTlYRlNXNUJNNUU4R1ltSmZkTGJveXFyZmR1RFppZHdMSWdVT1g1?=
 =?utf-8?B?d3R2bVpIclphRmxXTXJGM1lGWlptaVJNSFJvS0JVTnBidHE5UmpiN0dTcjJv?=
 =?utf-8?B?QmNxVTNnbjd2YzJCaGMrS3dibzM3Y2J0cVFkamVxYU5QcGE1cU45TzhRenhI?=
 =?utf-8?B?WlM5eHQ4QkxCS2NBMlhIcW1zdld4SmJxRlVOSStsWjFPQkNqZlJOSjJyZEhV?=
 =?utf-8?B?YmtwTWtKajBCSTBkT3hPSDJCMVA2ZktrZVl3dWNKc1YvNXNlbW9RQzI2TkNR?=
 =?utf-8?B?WmNlV213UmZpaE5VVnAyZ3FhZjN3TkZQY1RmZUFCcklGM2liWFBOMzZOeldn?=
 =?utf-8?B?Wm1ra3pOTWMwY1hBQXVQUkxCTlNkVXR3dmFwT3RuVDVlbHhWQzZhaXRJUEdx?=
 =?utf-8?B?c2ZZRWVQMTVNMmxCZlZqNTRlRTJyTTFuRDRCRTFKL0M3VVRWdnM2a1ZoSUxR?=
 =?utf-8?B?QWsyWmF4N2tPUE1PSFo0WldhL3MzNGlmVVIxQlpjTVpmQ1NrYzZ0alJiTmN5?=
 =?utf-8?B?UGVlbmEvWEc3WFRZY3RzM2tobGJaUzlMMTk1UTF0L3R6MGl5Rk1yZE5nMExm?=
 =?utf-8?B?K2hMZ0NhS2tEWjF1blF3UmFQTTB0NHJCYllKVml1UW9PeThYNWM5R0NwS2xn?=
 =?utf-8?B?RE50clBtYzhSN1VJNzNGR1dDbW5DcGlyNktsdkp4UGtaTnJQUUduczBEQXVa?=
 =?utf-8?B?VW95MFZGZk1GVkpFMXRyU1NzdXo1TGoxMGtoQTZYdG9aMlVaY1lUMGlkZnl6?=
 =?utf-8?B?OXN5MjYxMGpVeVlNOWVpT2ViaDVvTFc2cllsRmtZbzFZVGlidkRJZDA3OHNX?=
 =?utf-8?B?ajhLeFVubWtRZGVMbENrVVlwb2ozQnlLTHE2SnUrc211YTJmUzZMNUZKODBB?=
 =?utf-8?B?OUlWVFlMZ3lRb2pXbWNDc28vVXdpcHJITXVXRTN5Mit4TWwvYjVVbFowdWVW?=
 =?utf-8?B?d3dzNGNmSHBKTDRJcHo0Q1pKa1BhZjhaODJqOGJuNFNXMHd1VitOcVdQd29p?=
 =?utf-8?B?a2w4VXhHNURZREo4blk5cjFCbldDNmlDNUUxNFVjREE4RzFDNmwxMXV0Zito?=
 =?utf-8?B?U0owRTRFWFcrRDU0MWJiNXZ2dnYwTmZlcU5Fb1hVMk9DR2JUNWNXd0xIYXoz?=
 =?utf-8?B?YkR6QlZLWmE4SHlyU1hXbU1QMG9nWnNHOThnbFc4dW5pNHpkVVNyQ2YrNUVL?=
 =?utf-8?B?Z2xzeG01UWtmS3ZtRGtkUXNFZ1RLMjlib09yamh6QUJyM1hzbmVDck45cUN1?=
 =?utf-8?B?bzdIaEpJSDhFUCszbGJuQURob1pxdXNOL2Ywdk0rWEZIQlBuZTYzdWVKZTM2?=
 =?utf-8?B?dERJR0Mzdk9GKzJtQnBBT2ROWS9MajJlSnlxcFVZN3pDTjhHZjArSnQvMldt?=
 =?utf-8?B?S0wwSUI1bzR0VGZ3M0IwNWJ3Zmg3a1RlakMyRi9qMzdPdkxFYlZvMEFnRUtB?=
 =?utf-8?B?bFNtd0MrSVEvSUpNbXVIN2YxUGNXckRhNGoxZ3U0TWM1SzZ5WC85R3F4a2dT?=
 =?utf-8?B?U2dGNDJqUnlGenBUdmJ0M0UzaWI5bThDZ040Wmpza01DVmNnS3A0M3NXT2lF?=
 =?utf-8?B?OWJYYk9FMjJuZnZmNkt2MnpzcEU5dmxNMFI0TWQ3T3doZEUyOFpUYzNXSWFm?=
 =?utf-8?B?MHlGZzZrc1N1TXg1MWZGNHZFaW95clRGNlUyTitieEtGcE1kaWc1eHV1c2x2?=
 =?utf-8?B?WnpPemxWeHZxclVYM1Q1RXU0Wjd3MjlQMS8wZ1kya0ViWERZUzRncG5ZaFpm?=
 =?utf-8?B?UURRZlN6U3ZsNlJDK1hoeHlldkVxd28vaTlibVhDcHAyU0ZpSDNJNGFLbHhV?=
 =?utf-8?B?NjhIOFFOeXBVd1Z1T2pZYWNSbFYwcmlQSzRzd1FVK2c4alpCWXl4R3ZsZWZN?=
 =?utf-8?Q?lH84=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a6f364-b5aa-4695-2c76-08ddbee30591
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9008.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:20:42.4541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVbMPIrbwUPDzHvwEFMfEwEwo15hqOuThBPx9hnOJPjo5F6/kJ4nKHE6V3JynBLj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8755



On 7/9/2025 7:02 AM, Jörg Rödel wrote:
> Hi Richard,
> 
> On Tue, Jul 08, 2025 at 10:12:09AM -0500, Relph, Richard wrote:
>> Jon Lange should weigh in here... he's the expert on this.
>> But I believe it would need to be dynamic at run-time.
>> Using 'worst case' allocations that might have every page ending up needing
>> it's own page state entry leads to excessive memory reservations. While not
>> having enough memory leads to fatal errors. Being able start with a
>> "reasonable" amount for page state while allowing for expansion later if
>> needed is the preferred solution. At least that's what I was hearing last
>> Wednesday.
> 
> I think it is reasonable to assume that the (Linux) guest will eventually use
> all available memory, and thus it makes sense to allocate the page-state
> tracking data structure(s) big enough to cover all all guest memory right from
> the start.
> 
> This eliminates the need for runtime resizing of SVSM memory, which is also
> only possible on platforms/configurations that use the SVSM protocol.

A "one entry for every page" approach to the page state tracking information might be pretty large, worst case. I'd have to replay the conversation from last week, but my sense was there's a fair bit of information that might eventually want to be known about each page. Some form of compression feels appropriate, since adjacent pages will often have identical state. But, worst case, every page could have different state, especially as the information about each page grows.

But we've stretched beyond my understanding of all the kinds of information that we might want to track from SVSM. Jon and others would need to chime in. For my immediate needs (rebooting a guest from SVSM), all I need is one bit per page... and I was considering run-length encoding that since it feels to me at this point like OVMF and Linux both do SVSM validate operations on large contiguous blocks of pages.

I agree, though, that if the long-term goal of SVSM is to be able to support guest OSs that are blissfully ignorant of SNP and SVSM, we can't rely on the guest OS to cooperate and a worst-case pre-allocation would be required, absent a way to get more from the host OS.

Richard

> 
> Regards,
> 
>         Joerg
