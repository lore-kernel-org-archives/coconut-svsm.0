Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010052.outbound.protection.outlook.com [52.101.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CFA26058D;
	Mon,  6 Oct 2025 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759773410; cv=fail; b=ArLEuqsEFaRiV7m0Ve5mS67BhumPFL0ekmltQr6nMSLeCQ6YaMIAGC+nG43DiACqiHH6A1tIQK6dtm6VCANVJcvoTsGs24zFbeEtbo+uAH2EWgvyAYdcA6xOYT50720SaXDhadJC+FW3a2pSAznJg5dYDrwTLncngrfJDZv/l10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759773410; c=relaxed/simple;
	bh=3OUcp5tyiJP9bEiMEOoD9Far+SAZlqg4uZJGLO+WkIM=;
	h=Message-ID:Date:To:Cc:References:From:Subject:In-Reply-To:
	 Content-Type:MIME-Version; b=spLAhSP2rjKtToYGq3r86Ll13bilrPpVAIXsBqRV0NQcaKsqexbRdJ5kNhDeYnq+CL93FiZWxYkTzvcctaIl57rXggxwzYnHxV3hQ+XFVfrKNumAZZb1uko7+FLMgDUNnr+IvxM9AfW8/QULhr7c5cFx85D96my/t5rVameCQq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g1+StCd2; arc=fail smtp.client-ip=52.101.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g1+StCd2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVNAp9Os31FNIjV5E+pExUE2/LIhkkJClUXojGzZP/aBbDRWP8hFoje/MYwXRDDUkl0uJMC2xjEio38KT10ZkDytFv1+pL5Rxh1wSmnFB5s34nmuoZ4dtvBXDmTsd836LAVH5hdKD6l8p04aKSwCsZzyO8chWi9mpQkHa3LfjyCnE/Ii8XpMWlbK9NHFV+qwRGaLZuDXnv9KCCDTS+9+T/MWwHlcb+g6bJ8fN3ZAWYJx0v+74dfdPGI8lhPxCTN2luMncvLiWygcJAk0QBZMPX18OlRlnNHkguNeAEfFyDXuUMchBj6ycHkYja9oOx2FkW6bfU3d+j46TNjHefepIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rZQCZFyKDmol7GR4tVf5zAQHAIp/9MW2STMkKPiwOw=;
 b=GldPBEBMORTbgiJFAh1hFhzXIWbqBqtP6crnXNFN3rImqxnvTFQOTGG7fAh0Jcw1+C+8LABu2Ym+LXplV2fY2Dikv+ox3VaBFX3R9ix7pPNECwGiAFHYbM2n4wyHl8GQhnE4D2GFnvOUEXmuLGDJChcncBJXXGThCzk7Or4hiJ6Hw6VW8B1LGRZ4XvlBmJi71Op++3oQQ0vVBfZiHqb+1oHeJYr50UJJLCdsIeki/5VQQBDX3P96lJC+pMDEy3wy7u68InSrk4w8ba2ei87E5aYpyrCklhu6kq17IWm+FrURVWkvMFcxwfHiJGo52f3xLt3NOQOWcdnnOyP3vn1oWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rZQCZFyKDmol7GR4tVf5zAQHAIp/9MW2STMkKPiwOw=;
 b=g1+StCd2DBo9rEbVFyr7Nsd4gF37FSbqPSDoPl/EfvUwYKQb/TSO9NsTvy6Z4IDQkXm5A8d4G6MHn0DncTThDN6IiW6orIqFFDi1L3uYSR5GngmQUkY4Nx9Tbo2Np3NWDhTztysYvOz2eR5K8CsdJ6dPx8MMZQF9AQLjOY+ROi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by CYYPR12MB8922.namprd12.prod.outlook.com (2603:10b6:930:b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 17:56:40 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%7]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 17:56:40 +0000
Message-ID: <8953f72f-edd2-edde-dc43-3782dbac8c16@amd.com>
Date: Mon, 6 Oct 2025 12:56:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Nicolai Stange <nstange@suse.de>
Cc: coconut-svsm@lists.linux.dev,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Jon Lange <jlange@microsoft.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "Relph, Richard" <Richard.Relph@amd.com>, "Rodel, Jorg"
 <Joerg.Roedel@amd.com>, Melody Wang <huibo.wang@amd.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com> <87bjmmj4n2.fsf@>
From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: SVSM draft specification (v1.01 draft #3)
In-Reply-To: <87bjmmj4n2.fsf@>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0090.namprd12.prod.outlook.com
 (2603:10b6:802:21::25) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|CYYPR12MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9e2014-d2ca-494c-925d-08de0501b3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVpLSTR5NnRjS09TUE5uMUJWazdrVFZWZFBGa2VsQkFmZ0lZMVBOYzJYdmNP?=
 =?utf-8?B?RkNNdTE5dWVsb2lIUE5SbGZnR1BDVmd6S25sKzdxNjh2V0lIUUFEQjlRSlVr?=
 =?utf-8?B?NHhZVUlTbEgyeGUrVWNnK05lRm5jRWtpSHo2QTlMVkx0QzhaK09hd0ZNL1Jj?=
 =?utf-8?B?dFFKQ1ZtbWJUVFZNbFU2VHdKVlhObmJiNVVZK2QzeHpGVDg3MVloc2dtVm9J?=
 =?utf-8?B?aTA2bzVUcEJSYUF5THZGNWhJZWhaS3RCY3JJS0o5ZnFmbkRNVHZoRll5dUQy?=
 =?utf-8?B?Z3pnZHFtekdub1FidE92MmNPditiOGJ3Z2lmalZ5ZTV2eHBFZlV1YW9XbE5I?=
 =?utf-8?B?Q2VVeFpPYk54ZnZjYkxnMUVPYzQ2WnhhM2ZXTmNCUEc0dkd3bzdudnZUUTM1?=
 =?utf-8?B?dEtLSStudWJvaHNycWZRMjVraFNhWHlLQ2tpSkFVbTlzOUJTcWhPTDlwNDZB?=
 =?utf-8?B?WmovaG5vWHBpVmRNRzJEaGF4U1M0WUpYR0E5YnZtNjhYd3QzTlBRaHNNZWox?=
 =?utf-8?B?VXJFSnJMUzJiQkpULzlNejlQMEdYanljU1JaalpBWWp5aHM5T0pGNFVaTFBm?=
 =?utf-8?B?NnV3NXlvNkRzcmRMMy9YZjVaemlIUytJS0JFcGRtbTBXV1lPM0NJUVVwZW5B?=
 =?utf-8?B?eEQ3RVZuMVhmTUtGckd2OVJlTEVTMlZvWUZXK3VYczZNdGpBYWZzdkdFWS94?=
 =?utf-8?B?aTJ0dGQxM0NRMGx1bUVHNktyTlFWS0NCU1hqQnQ5VWk3NVlQcEZKRTJ4U3Jx?=
 =?utf-8?B?NHBnbEJKWGJ6R2ZvVDdpMHZVc1RZQ2hMczNsR1ZEaEtUaTJ1RXZEaHcyZ3FW?=
 =?utf-8?B?dnc3VlJjN0dld04veGFRbHl5aCtIL3lDSzZLZGdBQjhuZ3ZKQkM2WktCMmsv?=
 =?utf-8?B?azlkNjZEMjJRbzU4Z29sTXAvKzRVVE9sVG5MZ2FKeE91ME9BZUtuMk1XT0N1?=
 =?utf-8?B?R1Y1OHZSVnFJaUgxTlc0WVp1c0pXeHV3aW5JOFBQODhDM1kycTh3bEJzZWkv?=
 =?utf-8?B?NUZhSFB6TTdyUGNLZUkvQ0pSNnFYWUk3cUxXcmlxOUxYOURSeEtNY0JyKzZn?=
 =?utf-8?B?aU9UeXZvelBhRk1lMk14R2Q4aFczdVlvS1RGSzFMd0lHZjhVZVNRVTRsbmV6?=
 =?utf-8?B?WkY5SmtZa2UxaGpSTU5nSXR4Q1pNWTJlZEFMTXNrT2JHZ2x6ZGl0R1Z6RzlT?=
 =?utf-8?B?NDIrM2xyVXRTR3A3QXZuTG9BSUxpdVNXMnVkdG9zS2RBRklPdllwOStOQTR0?=
 =?utf-8?B?elh4ZVNLeUVSQ3VFNzBuVTNrMUJpNjJyYXpFMExUNyszY3huN2VieG84aHY4?=
 =?utf-8?B?YkZ5ak93QnNBOFpEcmlhV0F4Rjg3N3hRTDNjUXdSaUNFMnpwdEZXc04yWUp6?=
 =?utf-8?B?cjRwbGRRbS95aHZMaEdzaDZVbVNlOEZLQ2RuY2J0d1dxVVJOYVN4S1Jya0lz?=
 =?utf-8?B?dUs3bW1rbDJQVWozOXlaakt5QlJ5MVBBcHA2QzZiSmdYZnBxZmdtOENXTCtp?=
 =?utf-8?B?MlFSMWpGUUxRaDFXaEJEVE5Kbit2bHQ5STJjL04rNVV2bVFOMEJaaG1MK3ox?=
 =?utf-8?B?TmRTUG0rak1DOUdJaml5SzQ0U2hoRTJMR0l3c2YvTDBlRXEwREpYKzhYMWhS?=
 =?utf-8?B?RlArSzNHYWlJaE8xWllQUk11VElCeEZ1d1FYTVJQQ1EzMnZSTUVoQ1V3cEpB?=
 =?utf-8?B?NGx3ajdxS1ZKWFBFUlFUbkE1WDVZZzFDem1GVGswV3BKZ2FVRnNqc3FoY2lW?=
 =?utf-8?B?aXdYT2Z0K2hHMlBPampHK3lvRGtUMytUaHNsWGxRRWZOU0Z5WlJER1N4cVRu?=
 =?utf-8?B?V0RybjRFRGFtUHV1Y0ZiL2xZOWM1YmloY1NDVU5rUVJEVlRzVTgrSUVCQitr?=
 =?utf-8?B?bVp0K3lweFQrSEhxN0d0eENJSExkMnpPb21JRllIb0lNN0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXJkMEtpYlhEQ0FnMzYwMHpmbVlGWC8zREx0QkovclZ5Q0YzR3BXUkppRVBq?=
 =?utf-8?B?b1duTC9BWEk1UWtjbnB0VUlSenlIVnhSSkVSdmFrQ0Vub2NYb3BWZjd0ZEVE?=
 =?utf-8?B?NVZFQ1FMVDAxT3hVSUVLQUlCK3gwY1o2S1lxbGszOXVxZHIwQk1IUWNNSmJh?=
 =?utf-8?B?NW5CU3NKVGJ6UWNDVE1BeHRaNkxOV1BXZGJ0NVBtLzVab1NZblRWQVlOUENT?=
 =?utf-8?B?QzVHRWFTV2ZYOWVxditGUENGOXRERnNYK1lmcnlYZmJ1Sk5jOUpiSEZNT0p6?=
 =?utf-8?B?VkxRLzQvcG5XQmt0N3g4Y3UxemlQeU5uUXhMTlJXb2RrZjh1L1FNUjM5RVJn?=
 =?utf-8?B?WGdWb3czWDAzQ2FIOHpsV1N1RmpkMElsR0JwWEwzYlNnZmlJc1QyY0l2OFhB?=
 =?utf-8?B?V09hOTJmNjB0MmYwOElmcTNsdFNyTjNYeldVQUdBT0dDSDNzSDM2blRqVDEx?=
 =?utf-8?B?S2tsMnVtdzF1OFBBdWx4NGRKbDJZU3VqOHE2aFFSTUZQbTQzalNUUDVwZURY?=
 =?utf-8?B?RlhyNXV4UGh4YlRqNlFybGx1VlZnbktvZ3lHanlqdWlMaWp6UGEzVzh6TjZT?=
 =?utf-8?B?S0JrMy9LUjVPMnpNSUkzN2hYdmhBd2ZFWU9EOVJWZDhiamx2S2FiNGR0UlYx?=
 =?utf-8?B?eEM1aTFkZlg0N0hha3MwbW14d2FoZjcyYnR6bnBVYVRVb1BxOVZTT1Y1N2lw?=
 =?utf-8?B?eXRRV2FKL1JSMkFGdTQ2WXA4VW1SWmc1TDMvMGlHU3huclhWbnQxVmdiQVJm?=
 =?utf-8?B?aDZ4bkpzT0RYdHRMRlBtZXdFTEFPV2E4UXY5aE9VNzJudGhmbzVIdiszTnNF?=
 =?utf-8?B?bkhIZXJqTjRhNmQrOEExYXBiczJmUDB0S0NxV0tCNFdrTEM3YlBLSHZsc2hr?=
 =?utf-8?B?aEwyeFdlNjNvTUF1SlY5RmNvK1pyTDdQTzJYeUpEckdMcXZjdE5mRFZNZ0Z5?=
 =?utf-8?B?U1crTGt0QlJkMlZBZENGV29zOHAyNUN4a0l0dlpwSkZsT2FDcGhkU0RSL3NL?=
 =?utf-8?B?c2RFZktCVnYvTytrR2plalR1c0lKVmQvMjJQbGRid2dMVnMvVDNEb3M1WTc1?=
 =?utf-8?B?a3Y1eFRCVUlQMExXMGVUOWlqSGlJRFR6VTgyUXZIa2ZaU3hzM2Q3RWp5VGlm?=
 =?utf-8?B?YTd4RFQ4UHl2cTZaZi9DRERRR0xNSmhlVnRVQWMxMFB2SjRzK0tURUUxRHp2?=
 =?utf-8?B?eFVsY0JwWTY2S3NpRy81TVdBWWIva3VLS29SVlVreWtXNGFUbXlkWVlrMjlF?=
 =?utf-8?B?RWwydEdSbnA4d2FXdXRpRGE5L2dsSGtjbnVJekRscUQ0MDZ3TVdtUDFjeDlh?=
 =?utf-8?B?SWNzV1ZSL1NnanFla1VIZ0ZLY1ZUdXV0U05SVWhQbSt6dDBXeVNpNndISk8x?=
 =?utf-8?B?U2JmMTBuZHJBdTRQcW5jaGlWSUJDdmROcnBYWm05NHpOa3NTRlptbWlSSG0w?=
 =?utf-8?B?dUQwR05RRDZHM3M2S2pFemVOZkQvWnhGbXdzcGVGcklNMG0rZG52dHFZZENH?=
 =?utf-8?B?YmhuZHhkSWs4d3dscTlpMkdRNHZrbmpDcVVhYU92UXdwNktER3QzcVBlYXds?=
 =?utf-8?B?UjU5Mmp5ZnFmRWtjWWN3ZVhGUzRCdGhyWUFIQ1ZUc3ZtdDlEVEhySGV5czNh?=
 =?utf-8?B?UzFwV3VCeFNrcWQ2V0QzZ05wcXBlSDVJbEFTTEkyd0FFdkI4Q0p2UUwxSWh4?=
 =?utf-8?B?SDF6ZXNDZFBCakFyQnIwZlRjTGYxaHdUYS9hK09iV1gvbDBUTXRYU1QrVDQ1?=
 =?utf-8?B?cVlON3pZQUNrZnlreG9YQVg2OXB3ZXlWUnRCQmZtOUQ0VUdRYTErcVdSQytP?=
 =?utf-8?B?TmhDVGlqdHhBaEZ2Z1lpUFVnNHVuWEdZZkQ4WnYycEdvVEI0MDN3N1R1NUtS?=
 =?utf-8?B?Z0VwZ2xieFZVLzdBWWhvRkVJWC9aa2NYaGg3VjhWc2lDcWVGd2ZqM09pQnAy?=
 =?utf-8?B?WjEyNXBvNlhzZ3F6dnBNdlgrT2lkUDB0dGNvYjRjV3lFdGJ3VUdtOWNWd25W?=
 =?utf-8?B?aTF5dkwxcHdUZ3piSlU5NXcwVEtEK3lnYXY5cGIxWUcrUXIyL3Y2V2Q4cng4?=
 =?utf-8?B?WXkwaS91U1dkQVRxYVdIZWRHaGlqa0g2c3RreHlwM1NnNDl4VkdSdHpId0lT?=
 =?utf-8?Q?BwUBauTOptDglJdscPcKJwdRv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9e2014-d2ca-494c-925d-08de0501b3e2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 17:56:40.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uxLfW16ISuX6lKH8/UhayEgsY29yA1m6erFw/K3TFqDfwXfDm/Tl69b0Xknn7TE6FKOAvS3bEPWX3bbon+FNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8922

On 10/4/25 06:19, Nicolai Stange wrote:
> Hi Tom,
> 
> Tom Lendacky <thomas.lendacky@amd.com> writes:
> 
>> Attached is the next version of the draft SVSM specification with the
>> following changes since the previous version:
>>
>>   - APIC emulation protocol added
>>     - Coconut-SVSM will need to be audited, as the current APIC emulation
>>       code does not completely match the "Alternate Injection Support"
>>       specification on which this protocol is based.
>>   - Reboot protocol added
> 
> there's an ongoing discussion at GH ([1]) on how a reboot should
> interact with the _TPM_Init (think an emulated TPM power cycle) and that
> should probably get resolved before making the spec update effective.
> 
> I'm trying my best to summarize the problem in what follows, James
> (CCed) might have some additional input.
> 
> So, naively, a cold reset of the firmware, which qualifies as a reset of
> what's called the "Root of Trust for Measurement" (RTM) in TCG
> terminology, would require a reset of the TPM, i.e. to make it enter the
> _TPM_Init state, c.f. the TCG TPM 2.0 Library v184, part 1
> ("Architecture"), sec. 10.2.2 ("Initialization State"). Quote: "It
> should not be possible to reset the TPM without resetting the RTM. It
> should not be possible to reset the RTM without resetting the TPM."

Right, the base idea of a reboot would be that everything should appear
as if the guest was re-launched.

> 
> In particular, a reset of the TPM causes a reinitialization of all PCRs
> to their respective default values as defined in the platform profile
> (constant all-zeroes or all-ones in most cases).

Yes.

> 
> At the current stage of the SVSM development, that's fine and could
> easily get implemented.
> 
> However, James remarked in the course of the linked GH discussion that
> establishing such semantics now would prohibit us from letting the SVSM
> measure dynamic parts + configuration of itself into the TPM PCRs in the
> future. IIUC, the idea is to record standard TCG events capturing the
> dynamic aspects of the SVSM into the firmware's PCR-measured eventlog
> (for the firmware event log c.f. [2], EFI_TCG2_PROTOCOL.GetEventLog),
> which is quite appealing, because it would integrate transparently with
> existing workflows and tools like `tpm2_eventlog` etc..

Couldn't that be replayed by the SVSM into the TPM on "reboot?"

> 
> So assuming we do not want to preclude the implementation of something
> like that in the future, the question is how to define interactions with
> the new `SVSM_REBOOT_EXECUTE` protocol command.
> 
> From a high-level, AFAICT, we probably would have to
> a.) Convey all or a subsequence of the eventlog to the relaunched
>     firmware. If a subsequence, then that would have to contain all TCG
>     event records relevant to the SVSM's self-measurements.
> b.) Either do a "partial" TPM reset, making it to re-enter _TPM_Init,
>     but keep some subset of PCRs (*) at their current values in case the
>     full event log is conveyed, or do a full TPM reset and issue initial
>     PCR extends from the SVSM corresponding to the to be conveyed log in
>     case of a proper subsequence.
> 
> The "relevant log subsequence" option is technically feasible in theory,
> but would require the SVSM to keep a log of its own events for the
> replay at firmware relaunch. James, who entered the GH discussion with a
> suggestion to hand the full log over with some mechanism resembling the
> one from Linux kexec warm reboots, later on mentioned some drawbacks
> with the approach of having the SVSM replay an internally stored log at
> firmware relaunch, please refer to [1] for details.
> 
> I myself don't have an opinion on the topic, but as a hand-over
> mechanism for the TCG event log would likely require support from the
> newly proposed `SVSM_REBOOT_EXECUTE` command, I wanted to make you aware
> of the pending discussion.

Maybe we need a QUERY command to determine if REBOOT is possible then.
If we add/have dynamic measurements but they can't be replayed back into
the TPM to present a "fresh" boot environment, then the QUERY command
returns an indicator that REBOOT is not possible.

Thoughts?

Thanks,
Tom

> 
> Thanks!
> 
> Nicolai
> 
> [1] https://github.com/coconut-svsm/svsm/pull/808#issuecomment-3361113788
> [2] https://trustedcomputinggroup.org/resource/tcg-efi-protocol-specification/
> 
> (*) Which one is not clear to me yet -- the obvious candidate is PCR[0]
>     and possibly some more, but there might be interactions with the
>     H-CRTM semantics, which require to initialize the PCR[0] differently
>     depending on whether the firmware issued a H-CRTM measurement
>     sequence before invoking TPM2_Startup() or not, c.f. TCG TPM 2.0
>     Library v184, part 1, ("Architecture"), sec. 32.3 ("H-CRTM before
>     TPM2_Startup() and TPM2_Startup() without H-CRTM").
> 
>> Please review. If there are no or only minor comments, this draft will
>> become the next version of the specification.
> 
