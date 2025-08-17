Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284D818A6DB
	for <coconut-svsm@lists.linux.dev>; Sun, 17 Aug 2025 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755460236; cv=fail; b=LgybXMe0sFDvTBYHva/IbHFo03X8LMRbi1DHRN3GU5MygNpDvv5vG9LvW7p9+2K5GJMksze83ZzEJJOXC0UW96ClUkLtQAEFpt/nSf6JeRet9CHZs58/G0urXJe0fHVtTz5R7+EDAHCmkbnQTeBP04AWMzvPCKW0dns33vUn1ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755460236; c=relaxed/simple;
	bh=wzMpoek3rBXkv2rK+cnjcJKRF3TvmHPZw4V1t6Z+EzA=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=OZ4S3YlQG/qd1kLkOmzyfOGtQxdjDQpEKXq4WzH5aG1gx/pXukj3LzIy99Ut1o8398pRLBJsUjMPV0mxIUWwNry9ZnAkq/TJMfg9kwPpoeQIBQ3BUlXPpnr/Su6f3fq/Y3GQ3lOaCfHe9wXhAqrK1tD6L67Z+vWbpoSPkSOzdzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d5mEGXlW; arc=fail smtp.client-ip=40.107.93.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d5mEGXlW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F49TPkYAz2SxHxULV8WpZeMhKHzjKFgvvsoBsjuSvyiJKHQFyugeDYfp6UNOX2RyzEda0BSUXoj7Mb+/NgOvzXTIIHaMTRyn5fqTguVdIGcDjXtuykmHmWxEXQrdDwpViNaXTO9nOLbN2Xu0M1v7ZUkrDW8XOQA1ikK3qVxlC7+JcOBFjzVTlkoJEyCm0g4sC2tntjCiG3ANcDiTyrcj/sfG8P8vtfs/9CWjfCo6/wsFtV/CaUDkRPOTnMbymViPFUkIVcuI7R3/dBicnTYHQcFBIiiXsvz/XS8VXVO9dQ4nGBMjT5FDuGpQm12MTonLsLqznVks3RlPDnSmkKrM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mf8l91jP+3kK/swbpSfwWe5iPxvjYSD5B0QCBNqTXQs=;
 b=f0XQCaZ+XLdrAYTSrliOykIufC5DaYDAsOjo8dXjEk5mpX+YkxjvLM6imFx9vwbYF5pi+QTOpS5gAICAg+7Ned/EqnySJHOMcTmj0EUnE0lPlBcsRjpW//6tUKgSPQgUYUaeOZVFlvGHZSYdd4QRynnABw+7uTM9PmmD+f2tyWwFPEqizPm+PqE71TKL2PEstWm13idTBX36fn3bq0bJYORkJudQ+R06j6wcO6SpKR+NrJS+5SKaagqtnXh/esj8MSP+wGf3Gsc32rKTM2HGRf6a257KMuAnhJ9QfhvD2q9MpHlqe7aFsrcm//g0QzSXYi44SRU0j+xfruzmTjOWrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mf8l91jP+3kK/swbpSfwWe5iPxvjYSD5B0QCBNqTXQs=;
 b=d5mEGXlWHIHzCrAjPu6n8WngWg+dvLKcJLQkM0K3iSWDwxjj40ZFCYZBJfp2bof3xD2HUTSHoR6E43g9C4wmBYWfUFRYET+Om7oZLbqktF4ZqHscg4MAasMYymSoVxyPTAlhv8YdEwHX+OavQyu/LEoCX9X8jnC35fz8CZd5c+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19)
 by PH0PR12MB8173.namprd12.prod.outlook.com (2603:10b6:510:296::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.22; Sun, 17 Aug
 2025 19:50:31 +0000
Received: from IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1]) by IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1%4]) with mapi id 15.20.9031.021; Sun, 17 Aug 2025
 19:50:31 +0000
Message-ID: <e0c93748-dcd4-4e73-8355-3eb0478d971e@amd.com>
Date: Sun, 17 Aug 2025 12:50:28 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
Subject: The problem of KVM checking Alternate Injection guest events
To: Jon Lange <jlange@microsoft.com>, "Kaplan, David" <David.Kaplan@amd.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 =?UTF-8?B?UsO2ZGVsLCBKw7ZyZw==?= <Joerg.Roedel@amd.com>
Cc: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
 "Fontenot, Nathan" <Nathan.Fontenot@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::10) To IA1PR12MB8285.namprd12.prod.outlook.com
 (2603:10b6:208:3f6::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8285:EE_|PH0PR12MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 825fc38f-060f-4472-0b4b-08ddddc75265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2htVmRvYk5KRVV4L1NwVWpuN1lLaGYxbVhwMWc5NWNUM1NLTzFUR0ZnT2g2?=
 =?utf-8?B?RDZNOTFBUloxcEFQQkZTNktaemV1N2FKNkpEZDVZZkZkTklzZVlVbDlnclJQ?=
 =?utf-8?B?aEFXNktGaEc4UUhhUDEvRWhEYlo1UGs2cW1rdXBwa3BFdUtxc2hmTHV1QXhq?=
 =?utf-8?B?U3FtbDliV3Z5YkZSbFRFL0sxSTVoLzkrYjdBZTV2Rll0Z0EzVXBqb0NFOFEx?=
 =?utf-8?B?cVFaOXcyS09GdWN0N2VtU1J6ejgvWTJ2MksraE5JWU5vMDNlaEhBSlNNVHN1?=
 =?utf-8?B?NUNlYVNQaElaNU0xQVpiMVh1NVhqRnVFL2VzNHhiRk91NXZydkkvOTYxZFdM?=
 =?utf-8?B?Ym91cWxEVXZEdTJJenBzMVlvZ2lqdTlpRXlQZnVrLzNzZU5peUxnQTVpUytF?=
 =?utf-8?B?SVV6OHZpVVUxODZmOUplZ2ppL3MxdjlhZFI2MU92RVkvRThqb0QySDJCWWFU?=
 =?utf-8?B?ZDl0ZzhuM1dHeEtzVUJ5ekJMUXA1cGJNVWw1SU1pN2NjcU1DT3pnRlkycjNh?=
 =?utf-8?B?OElodzY4WnB1M0llNHFQdkRod215N0UrVW1lSEUxYVdZQkZLRmxhVldqSkdv?=
 =?utf-8?B?OWlDa2lLWWpnSEVDL1VVUnI4T2RSNE5aK2E1Q0NpSnA3WGdRRVd5RTVYZlJO?=
 =?utf-8?B?aEYvdnp4bXZhZkFkWXoxcDdENW1ZMFZzMFZCaFR1U0VxNVVDQjMzTWp0SHV4?=
 =?utf-8?B?QVh0ZnR0NGFJdmRIbWorQmlMNEZTRjRuNTd2NXd0Nyt5b1VuSHE2MjlNSSsr?=
 =?utf-8?B?VnBEWWZMeFRZRTZhMEo4WGdjS0wzS2FldXNCRmtGa09IQ0JwQmI2ZGh1R29l?=
 =?utf-8?B?WDIxVE0yV3BJU21JMXZ3eUxqU0xMdWs0L1IrMm00ZFhsZlhEUmNVNnd1K0RU?=
 =?utf-8?B?Ly9uandGbFpIa05CSXpLTHNRVnZMVUc5aEN1MW8wTVFJaXdzMElnd1pmMyts?=
 =?utf-8?B?TURZYzJZQXh4VUpBVjFFVWNYTmRKcDBCMG55eCtBTzE0N0lCMVJxeDVLSE54?=
 =?utf-8?B?aVlFMS93ZEFsdzlQVUZvZ1BTQ1I4cWRmWGxGVEJmMEN5SUNnTHFJWWVxZnI3?=
 =?utf-8?B?NmM0RUI0WkRib0FleTc2OG9jTDFYMGNaQ0hlWVFwUGZhbG1IVFF3YmthTWk5?=
 =?utf-8?B?Z0gwMENXNStVczZ2K016RFA0TjhmNEllMGQ0NVlHTEdDUEtCbDVYYW5zdHpX?=
 =?utf-8?B?Zk56cWw2MDQydEw3aXpxRnQxM0gvdVFIdGRxZlhob1N1OGpSUGNRZi9DYm0z?=
 =?utf-8?B?K083bUhhZUxWNlk0QlhqdjdHUXYwQ3RwSEtOTEQ2T0dXK09nOVpnWjY1VHFZ?=
 =?utf-8?B?NGIzVnlnTDZvTU05dEFSY3NJQlJHdjlYTWVNWnRYL08xeEhld0M4MGh1YnQ5?=
 =?utf-8?B?eDk1TTlBVUxGeEtRa3ZlNFhLMVNBRHdOUjVwMExnbmJDRERGUTRmdUR5bDVF?=
 =?utf-8?B?Z1JPQmcveTREd3NtZFhBYm04UW9SbURRazB3M0xHNktzTjcvblBYcGlJSHA3?=
 =?utf-8?B?dDliQkJQZmtXc1k4ZkxnNEZFSlhTc3RuL2tjdUh5UHB3ZzI5TDNuaE9aRHQy?=
 =?utf-8?B?ejBubExFRkpKMWFWT2NQWEVBRWhDdndwY25OMEdGYVBVZC9HL0JzN2pUK2l2?=
 =?utf-8?B?SnNsNURoOUxxVDJ2YXlxTWlZMmRpLzFoa2YvanBwektZenFySVpGdnJWVFFS?=
 =?utf-8?B?ejIxRnhMSEZsSjZyN3hVRW1LTmdlV2pzVmprUnh3SWhLL2pUZTAvTmd3b044?=
 =?utf-8?B?QlgyTW9Pd1BzV2JQb0dSY29OWTlia1NjN1VFOElUZTBIVFFDZldmUXNUTzBM?=
 =?utf-8?B?MnpFZk9SMDRMUk9qR3ZLNmdWdklvOE5YQVpmZ20yaVJYVENaVkdTL0xlMFJm?=
 =?utf-8?B?cmd5WGRsbi93MUhIcTNjUFRINXIzZGk4Y1Y0cUY2bnB5VytXN3B3M0FNME8r?=
 =?utf-8?Q?q1jjD1im5wM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2dOckNzREc0MVdHakdZeW1LencvdlFkMHZNZTJYVU9EaWpGcnhNK0tsanRj?=
 =?utf-8?B?L1A5a0RHekFaM1dzcW4vMkpyWVhDeWluY2ZJUWNKYU1ESW41SWtXcUJ4SUlu?=
 =?utf-8?B?NE1rRWF4SzNJZzhTZTE4WWJ4ajJyTVhCYWdyZU1URGpuRE9oelBseTJLRmlv?=
 =?utf-8?B?MHVZTjF3WTJKdkwzT3VKcVd2UVdwU1N0QUxyUzJDQ3FlczViME9ScUg0ZUh3?=
 =?utf-8?B?T1paeFZaT3BkRys2Vk1TaXF0eFc2VkVGRkdXRHJIZjloNmtuQVJlR2xnaE9N?=
 =?utf-8?B?RmJGMW1vL3IySlM1OWVpdFU0V1k5NGppYXRRVUNZZmhLRnRObTROaHcveWZt?=
 =?utf-8?B?WldvM3ZwYUIzdm00YTk0cDYyV0lBQkk4b28rb1QxMVZwQkVXaU8yVm1qTW5K?=
 =?utf-8?B?cnFlT0Jnbm1jNGwxaGhPMkY1SWRyYm1VVU9MbDMxOXM3S29SNDZ2RDllSGZG?=
 =?utf-8?B?K3Nvb054b1VZQ0xEeXhWajBiM2FITk5IdEQ4andoZkRJZXVBSHNlY2I0UURq?=
 =?utf-8?B?ZWxvYWFNWjgwb2h6N3VocUNqUGl6R2JaZS9lUWhqazVsRUZjYWQ0dzlqbjM3?=
 =?utf-8?B?WCtkWk5EVTBLZGs2anlOWWN2aHYrK3JqNGQ0OXcrRS9LUkdXanR5VzQ5ZzN3?=
 =?utf-8?B?MnlxVk9PRitGUS8xWEF0cm1UWHZzSm42ZTZMVm9HUTI0Q0ZhZ29UenRxNi9q?=
 =?utf-8?B?R3drd3JvcDdkVElWcmFwWDZVL1d0VVV4TFFaNm5RbnRyR2l2dUNVOEs0TEU4?=
 =?utf-8?B?T0xka25RNGkydnRYVlcySDZuMjUvNWMwNStUbjltSCtpMGhkOE53UEdvRVA2?=
 =?utf-8?B?SmVUT3hhMkZhbVBzOWE4eU1jcjEwYUNiZWhiS0JYK1JSM2hGT25zQ0l5NnV2?=
 =?utf-8?B?ZzU5VWd2anpvaVpQdGpla2hxcDZWc0pQN1BySk9WN3pOODFnM1ZpZXM4VzJH?=
 =?utf-8?B?SjM2NFAwS3N3WnNhYlJmNWhGbVdzWVhzWld5Vk1hTHZsVGcrK3pvU05xcWY5?=
 =?utf-8?B?QTZKYVVxV1ZyM3o1dVVOYWQwUlI5WHNYVFNHWWhhZWRZaTBrL0tzWmVDNy9D?=
 =?utf-8?B?b01UQjdqVUVYQ3l6K1pPU3daUGFjT3BVY0hKWGZCOFNFRnBFQ1p0NGJrQmcx?=
 =?utf-8?B?NSs5KzJlc2dIdU50azZzVVgrS0w5allvdTRyL1Z5TmhpZ1U5S3hpUjZlR3VC?=
 =?utf-8?B?Q25CeXpCbEkzVXlkRDh2ZGMxWSsrZi9GbzNSWGZuV2FyTWtGN3NWRmYrS2pN?=
 =?utf-8?B?VFdUOG82NW9zbVFKOTkzQlFESWc2SGZveHlrK3d0endqZkNKSkVtN04rcGRM?=
 =?utf-8?B?Z2JvSjlJcW1jVFdZcjZLRm90UTR6K0xmWE9adVpDTzhHaTNGUWVsdEkrSUhT?=
 =?utf-8?B?c1NacjJNcEN3eEN6N0JjSWQ1NTZJWXFpSFlkR3JEeFJLRmFHK1pMVzI0cGRz?=
 =?utf-8?B?Ykd3OEsyWk0wMjJoUmYwcjNXeldlVVJWQTgrUDB5ZitLQTFtOStsY1IwcUFj?=
 =?utf-8?B?b3RkaU5PNzZkNzhXbXpWZlgvMFdYS0tMK3F3eFlpVm8zS1FISEhUT1FVZUhZ?=
 =?utf-8?B?VGtvOENxYjVna09pSEg5UHBsVC9TUnNHZVFnVzI4TG1scnorN0JheXJhWU5y?=
 =?utf-8?B?ZE0wa3krQ0RqMlU3UEh2ZkIxcEJ0M09Eam5HS2NvQU1ZSmpocmxGbmJJbm5r?=
 =?utf-8?B?RW41RmY1Nk5ZQTExUUlSa2pCLzNhTGl1NDFtMk5Hc0ZZWGZPbEpITnY5VVlu?=
 =?utf-8?B?dWo3Nm1kSjVqMVhuUmZYWFpZSmtucHIrMVl3UFpIb0granpOL2VhWisza1kr?=
 =?utf-8?B?cXJURi9HYm4yU2ZWNTBqQlYxN2xZQzcraWZoNlJwWG55QTIyMGgzcGZNeUx4?=
 =?utf-8?B?Qk5kbTZiYWhYekc1R3VDYnh4VXJJM2d4MlFGZFJlaXN4NWsrZ1ZITVpkdlNH?=
 =?utf-8?B?b1piSGJjRnc4OWtwckdEM05DTkNqQVI2MnFkVm9CZnJEeW45a1RVbjdCS3Rx?=
 =?utf-8?B?ZzF1Ni9RazFxZ2xUaE9SQ0tpTjZyM0o2SHpwaVNtTTZNYXpaRlBmRnhobm1P?=
 =?utf-8?B?NVIwOExOUytlUmNtcG9USVVmellWT0FGQnpYZkIxL0YrMDVrVmUrUGdkVVVL?=
 =?utf-8?Q?0jOuypu9j+iD75Xs6Xwr5uTzF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 825fc38f-060f-4472-0b4b-08ddddc75265
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 19:50:30.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4r3m9BPhG8ZeepyFo+iou1ZjeSIr+A3G2691Ie9+9EBzQ5p7eGoH0g5h7dCK6kVwddT7WA0u5HV1hcX8Yw44g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8173

I found one issue when multiple interrupts are being handled in the SVSM 
but I think it can happen also with a single one.

The gist of the observation is, that SVSM queues the interrupt into the 
VMPL2 guest's VMSA but if the hypervisor doesn't run the VMPL2 guest due 
to a lack of pending events - it cannot know that - then that interrupt 
won't get injected, leading to a stop.

Below are the details:

Interrupt 33 and 236 are in the doorbell page as multiple interrupts,

12796.893994: sev_snp_ai_update_doorbell: vector: 236, no_further: 1, 
ai_vector: 80, si_vector: 33
12796.893994: sev_snp_ai_update_doorbell: doorbell after:
12796.893994: dump_hvdb: pending_events:
12796.893995: dump_hvdb: vector: 80, nmi: 0, mce: 0, no_further_signal: 1
12796.893995: dump_hvdb: second_word: 0x200
12796.893995: dump_hvdb:  VMPL IRQs: 1: 0 2: 1 3: 0
12796.893997: dump_hvdb: irq_info: 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00
12796.893997: print_ext_irq_desc.constprop.0: VMPL2
12796.893997: print_ext_irq_desc.constprop.0:  ext_word0: 0x4000, 
si_vec: 0x0, mult: 1, ext_word1: 0x0, counter: 1226
12796.893998: print_ext_irq_desc.constprop.0:  irq_vec: 0002 0000 0000 
0000 0000 0000 0000 0000 0000 0000 0000 0000 1000 0000

These two interrupts will be delivered to the SVSM, SVSM consumes these 
two interrupts, and marks them in the emulated IRR in the SVSM APIC:

12796.894031: __kvm_set_msr: guest: post_interrupt(33)
12796.894036: __kvm_set_msr: guest: post_interrupt(236)

Then the SVSM injects 236 which is the highest priority interrupt, which 
will be cleared in the IRR and moved to the ISR until the eoi is sent 
back from the guest, i.e. the interrupt has been serviced:

12796.894046: __kvm_set_msr: guest: deliver_immed: shadow: 0, 
irqs_enabled: 0, irq: 236
12796.894051: __kvm_set_msr: guest: queue_interrupt(236) into VintrCtrl: 
v_irq: 1
12796.894055: __kvm_set_msr: guest: Mark ISR, queued: 1, ISR idx: 1, 
delivered: 0

After 236 is written into the VintrCtrl, the SVSM will switch to VMPL2:

12796.894067: sev_handle_vmgexit: vmpl: 0, ghcb_info: 0x16
12796.894067: __sev_run_vmpl_vmsa: parent: 0xff445aee23690ac0, current: 
0xff445aee2cb83940, current_vmpl: 0
12796.894068: __sev_run_vmpl_vmsa: new_vmpl: 2

And VMPL2 runs:

12796.894069: svm_vcpu_run: VMPL switch: 0 -> 2, immed_ex: 0
12796.894071: svm_vcpu_run: parent: 0xff445aee23690ac0, clear switch_pending
12796.894071: kvm_exit: vcpu 0 reason npf rip 0x0 info1 
0x0000000500000014 info2 0x0000000001881000 intr_info 0x00000000 
error_code 0x00000000
12796.894071: kvm_page_fault: vcpu 0 rip 0x0 address 0x0000000001881000 
error_code 0x2000500000014
12796.894071: apic_has_pending_timer: lapic_timer.pending: 0
12796.894072: kvm_entry: vcpu 0, rip 0x0, vcpu_vmpl 2, current_vmpl 2, 
target_vmpl 2
12796.894073: kvm_exit: vcpu 0 reason npf rip 0x0 info1 
0x0000000500000006 info2 0x0000000277c1f000 intr_info 0x00000000 
error_code 0x00000000
12796.894073: kvm_page_fault: vcpu 0 rip 0x0 address 0x0000000277c1f000 
error_code 0x2000500000006
12796.894074: apic_has_pending_timer: lapic_timer.pending: 0
12796.894074: kvm_entry: vcpu 0, rip 0x0, vcpu_vmpl 2, current_vmpl 2, 
target_vmpl 2
12796.894076: kvm_exit: vcpu 0 reason npf rip 0x0 info1 
0x0000000500000014 info2 0x0000000002297000 intr_info 0x00000000 
error_code 0x00000000
12796.894076: kvm_page_fault: vcpu 0 rip 0x0 address 0x0000000002297000 
error_code 0x2000500000014
12796.894077: apic_has_pending_timer: lapic_timer.pending: 0
12796.894077: kvm_entry: vcpu 0, rip 0x0, vcpu_vmpl 2, current_vmpl 2, 
target_vmpl 2
12796.894079: kvm_exit: vcpu 0 reason hlt rip 0x0 info1 
0x0000000000000000 info2 0x0000000000000000 intr_info 0x00000000 
error_code 0x00000000
12796.894079: apic_has_pending_timer: lapic_timer.pending: 0

kvm_vcpu_has_events() is KVM's way to ask whether the guest needs to be 
run. It did not find there is any event in IRR (encrypted in the SVSM), 
so KVM does not run VMPL2 anymore even the interrupt is not handled. But 
in fact 33 is in SVSM's irr now which KVM does not know now, otherwise 
it will be able to trigger VMPL2 to run.

12796.894086: kvm_vcpu_has_events: none

So KVM needs a way to know whether to run the guests again - SVSM or 
VMPL2. I don't think we have such a provision in the spec so maybe we 
need something there.

Right?

-- 
Thanks,
Melody

