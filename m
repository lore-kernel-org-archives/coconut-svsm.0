Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D7220F52
	for <coconut-svsm@lists.linux.dev>; Thu, 14 Aug 2025 16:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755190415; cv=fail; b=cGG7HVMZng9dEXBni1RBbxrPxo25r+rTSqI/U3bneW3VARZtpilmes+UkMYnDtBXnxEberEO6/E478r8gQaFwJ+JxEgWhp5Z2s/xSKAPWpGvP8z3nHYrTiyUYngGG7upE8XmSUEd9RZDRF+oGVYzmxKvbWImpjJfD9YGpGIjV5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755190415; c=relaxed/simple;
	bh=i81JRoh5i37JBjTultkJAPJ2mNiSdfslSrMWLakdfeE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fp1JqvxF50yFy/GRDC+cqkVGRlqXJCHzn7PQb7YxX9nU6BWwUgrNg6LTYltFM8FaXpz3iPRYDDoG0dlsheP68nuYxsAJ0th5V4IPtBQJXlP8Ub6HdUXZVeX5pq6F8muv7ICtLpDA5IMZ2zAB0xiXy5Sw+uhu8RrOxTzj0zwrLn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rCrCPAtb; arc=fail smtp.client-ip=40.107.244.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rCrCPAtb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzdAuK/08BouzTCaA09OwD0feYEpXSYCvHLdvmBfGQUa9Eh3yWkjQaZykrzJfW8m0WR53nrmIVZdgVJNmwAYsuSDw47MndsPQOR3bw37GS+1fNluoJeH+MCRRAS8TJaoQvsydUuuc34lcBY7541tdq+6R7ah7sG4tq8imEY3EoaxVbPA+jyQseIee1GqsPBgB2kM0p0agtQzBCsHSgfHkyOr0uuzps/Pb0/1smBJtN39SKz8CL12tT8nvFJeH+sf2uIBRlQ86d57U3+LgcGgGul4aeUrZwCwWeSFUfmONGo2WGDgBmtLipH/qvBFsjN9+fM8xT+F8Wy3czcjQS6ZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fOX4/DaCTEg11ov7zD3zC3kvPcBhKs0j8Jhvs/e02c=;
 b=rFO0wyj//MGZbOfDjh6iG4wFhNkJSlj7GrkOQYJprNQ4XFbTgdxyQnzlcQjp2MqS0tZM4iV/U1EGNyOnyl3bFafYb1/i5vt4idxWC6UEZINfCiJzoj0qD0y8dwbAixp5LDCvK+kJo6W6G9CQrYY7+f8uBF9svLWKiE7mJpem8txM7EQ8Z84mUvD4HNnIk3fF4oMrOZhsR5Hk03plni7C8g9trRFzhpPDqqb2hEgscAaeYmJfy+suhs80ML2zzBHY/Vq0HOPq6Zwq4VDv856KrG6QN0dhy+50YkfejRvhfcwKwhm1Ip0au6mKwFtrbSh+s0r8yQUv39YEv6r0ydXbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fOX4/DaCTEg11ov7zD3zC3kvPcBhKs0j8Jhvs/e02c=;
 b=rCrCPAtbv2YxyXSzGMjXSBX+oO88x97nAq7lhhXJoguqXXv29uU4MGIBCqUlNJezVPMgam8fZBtU8fafNDxt1iVjO0QtL9OQPHeTHiqhy6DHLILhneCVxN5DlYnH4XfV5MrE4h3hR/meibtsFgbRGrROz1o6UH1lMHKJ/4dVEK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19)
 by PH7PR12MB6762.namprd12.prod.outlook.com (2603:10b6:510:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Thu, 14 Aug
 2025 16:53:28 +0000
Received: from IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1]) by IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 16:53:28 +0000
Message-ID: <f0cb458d-150f-4c88-b3a5-b77e1d4ecd21@amd.com>
Date: Thu, 14 Aug 2025 09:53:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Issue in handle_icr_write
To: Jon Lange <jlange@microsoft.com>
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 =?UTF-8?B?UsO2ZGVsLCBKw7ZyZw==?= <Joerg.Roedel@amd.com>,
 "Kaplan, David" <David.Kaplan@amd.com>,
 "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
 "Fontenot, Nathan" <Nathan.Fontenot@amd.com>
References: <cbbb95e6-37a4-43d3-9b93-db1703149bfe@amd.com>
 <CH8PR21MB5222C4EFDED771DCDBEC910FCA35A@CH8PR21MB5222.namprd21.prod.outlook.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <CH8PR21MB5222C4EFDED771DCDBEC910FCA35A@CH8PR21MB5222.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To IA1PR12MB8285.namprd12.prod.outlook.com
 (2603:10b6:208:3f6::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8285:EE_|PH7PR12MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9e6be9-f23e-4241-2079-08dddb5317cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTVuVUl2cFZOazZJazRKdDFqbFRFdEhOUXF2SmkxUEFTNmEvTjYxVEdBNXI0?=
 =?utf-8?B?ckMrZE5Ic3pXUjRtVTFXRGFNTGtYdjAxaERLY1JMSVJHUzlGcy9ReXY4TEFw?=
 =?utf-8?B?OWw4Z3F6Um9STUtZd0RBUkZYa0RGNjQ2NW55b2FkNG9FQXM3STRYYlFnRkZD?=
 =?utf-8?B?OE9pdG9zVWRObkswenl1LzlPT3ducXNCMkY3NGlPem9teDVZZit0SUxPbzFW?=
 =?utf-8?B?YmxCRS9ibGZRdlF5MUFSbytuaExUUloxQUc4RkY1ZjBPRy9QaFlUTzM0K2lw?=
 =?utf-8?B?QnhGem9JbjhBU0JqMUpYeWFtT3B3d3RsL0JLRFRLVmx6cDRHczlGeVF5VWN0?=
 =?utf-8?B?QktWbWo0WFpkR3dPVkJOWGFtdzIwOWU1U1pjM2VJM0VlS3lWc1JTZTMxNlJO?=
 =?utf-8?B?WW9FSjA1YnJoQ0NYMmFPVmdHaDhhNFdNZE5wKzRrVVlubnJ2K3V6RUxhWm96?=
 =?utf-8?B?QlU3clc1aHpjL3RDZ282K3Y5N0Uzd3ROUVEvWFB0YUFiT3pSdFpMTE5HMXo5?=
 =?utf-8?B?VDJHb1dSdVZzR2R3cUN3V2UyY1hYZFBabnVVZC9hV2o5cUNmM1g4eHJVQWhJ?=
 =?utf-8?B?UXQ5anJ1ZnhHNkZpT3RUK0YwclRQekhGVzJKc0UvQitVbmhiRFRrb3M2dXF0?=
 =?utf-8?B?d2RVQTBDUVBlUGNrdE9YQlluWG9sZ3lDYm5YVm5JNFlpNzdERzB4UE1pRVp6?=
 =?utf-8?B?QUF0UGk0enoyWEFzNmhDL3ZVKzNZOEI2NnlTUGVrdUtuYVdLTnN2ZkU2NnZN?=
 =?utf-8?B?RlJ2WGlRb3Nib1Jwb0FBOXk4a2NGcXRQUWVtQXkyaHd3Z1lJaHlhbjc5R0Rt?=
 =?utf-8?B?ancvMFJuVDdud3grVHpjcm52L01uUUtxSzNFVDZXTVhLZm1WZTlKR0VIRXhm?=
 =?utf-8?B?OWFTWnViK0xBZ1NkNGlHd0lqbVNJc1d4NXozbmt4SGJHNldGd0FzT2lQNmoy?=
 =?utf-8?B?dnVTNmx6QU43eVVMcnRnVERmQkc5TDdPNmQrSk5rbUdpOE5mOVFNYXhxbUY5?=
 =?utf-8?B?VE9kY0l6MmU1SytQanNnd1k0bGRXeXRaYm1wNEJDYWZtdnY0MFJ3ZUEza3o3?=
 =?utf-8?B?SkV1WWlHWGZTS3FaUE1OMlNrTk12WlBnajlhYlNLUFJGN2hhakFDcHVORWFy?=
 =?utf-8?B?dHdSRVFWSnB3OVoxMVM5b0tXMEtMUmFObktmNGRyOGFiVU1GcUYxc21LYyt3?=
 =?utf-8?B?ckhWZjlIK3NwTEZpdjhQayt4ZlNPN0FHYk05TndGSFFoem1RcU9yTUNsK0xj?=
 =?utf-8?B?RXh5TjkwMFJtNFdmSnpsNllKaFJIeWpWdVNoVHk3R25Lc3NjOGh4Znh5OXha?=
 =?utf-8?B?MzRmQmJTMzB2SVo5ckJPUzJ0SHI0Z3F2RTRlK0JUUG5Fc0hIa29EdlM1SWNa?=
 =?utf-8?B?amhmQUhjU1V6MmM3aURBN3lsNlBoK0s5UjZCa3lTdDFQQy82MjdBR3k2U0k1?=
 =?utf-8?B?cDVZQjcyYlVGVm56dnRhVVloK3ZabWkwY1FCZGhSN1pxemZFZHNrUFRGOFRi?=
 =?utf-8?B?NCt3bk9RbUdpbHYrbHA3K29VTEV2dGVFSzdKcWhOMTAxUTJITmRHWHlGNGYy?=
 =?utf-8?B?Qk5hZjgvWDh5MmoxWFYzZk9GODNmWWhtSnU1VEk3YmJ0MFRLeWtFVk81bVZj?=
 =?utf-8?B?U2ExKzFsSDYwQUdRT3hFQmdmeUN6RjVIN1BDN29BS0laSzAwR3Z2T2pUb2Nq?=
 =?utf-8?B?QklzV3Zob3NyVUdzRXpuVkxuTkN0c1M2cElIM3hrVEpnS0NDSUwrbFZ6eUR4?=
 =?utf-8?B?ZDRxWVgxRW5YVjNUVWFhWnorZm1heitua0IzTWc3cXl0RjM5dEFlMUVvbDRC?=
 =?utf-8?B?UXR0dk51azNRY2pPandXdXdFMW5YS0RUZEduK2pTT1NNbmoraWJUNmZjTWc2?=
 =?utf-8?B?UDNaZ1BWd2V6eWdnbjJBR0xmRm1kaEJYWmJocVNETnVxbHc4bkFMeU9DL0M5?=
 =?utf-8?Q?o6fULvkwoFc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE5WV2JuY1dEZlJJZ1c2YTZYM0xJRkZmSW1EaUR2bFlia3lyN1RoSWVOMW9Y?=
 =?utf-8?B?WkFpOHFvQVhKZUNmNmI5QUFjaTQ5Zm8rcUxYNGhXUU9WeVF1czRMWGxzdXVz?=
 =?utf-8?B?MFY2UjduVDRPcjN2NHdJVXFGVXg4M0dZaFhMR3R2YU1FS0lGdjAySzFmNGJO?=
 =?utf-8?B?RXk5c2w4R2FYdlo3UlB1TmNkTXJUbXhUZFlvcU1lMTVka29uNElKT0hRejRz?=
 =?utf-8?B?OUtPM2VUU3VoUEw0Yi9oZFErVWVVQ2M4bSt4QVFka3lETUg5L0JGeEtvTjkx?=
 =?utf-8?B?UCtMdmdHc01sUHdkRXgwdzZ1ckF0MTN0dHNGQkxvN1VmUHNJcVk0Tk55Um4x?=
 =?utf-8?B?K3VDYlJ5bzFxZTRsMlF6cHNlUEgzcVdYK1JiaXlZbms2d0RsNzlSMEhwbUhW?=
 =?utf-8?B?aFQzdzhJUkVtTUZOVlJTK0pGSk1ha2NZdDdnV2RlSkQ2MHVWZUNkT1RwM1hH?=
 =?utf-8?B?M2lUc1ZiVUpkSE1OMksyaDdnQ0l1NEUrTXF6Q3NoTTA2R29aTDluNzJ5U21r?=
 =?utf-8?B?VzVlVlAzVXoxWVdNby93cVJLdk9FSkZpQzZsekxRU3pJWEdLcHlWSEhscjBi?=
 =?utf-8?B?eHRJeDgvWXQvNUNkWXQwem1NOXliRHo1ejB5bnM4c1hjamNxYjlKMHAzcHdN?=
 =?utf-8?B?UEw4dDlMZThRenlpdWNkd1p2dmRORGF1NGoySGgraHlkRWFrRDcwVFlHQ25W?=
 =?utf-8?B?SWNISDNHOHM0Q3I3ZllZdUFyZnhKeGlzZEJTempabDJwcDVIbkYvMjMranFH?=
 =?utf-8?B?OUV2a2RGcU1kTGtOMTB6Rlc1ZkNlQWJIbWR3a3k0RUdGZS9tcGtMRytCa2Ez?=
 =?utf-8?B?emd4Vml0MklEVmphSlY2bUQ2Z3ppSC9aTDNKZVVLTldLNnJnSmtZREs2QlFW?=
 =?utf-8?B?WUxsWUtSNXpkNWNWbnpoTWhaV3U2RFlSZDlaUzRrT2E0ZCtIS0xRVUhPelBV?=
 =?utf-8?B?cGZUelFRYUNZTFl5V0tGRXJFUmkxTFMxRGszMHExZG1mQm41L3VOeGpNSDJu?=
 =?utf-8?B?NUNua28wRFNOY3BWdjlnTEJ1VXkvWjEyanl2TGFDa1YxL2xJSlRCeUFQWXFq?=
 =?utf-8?B?RkhpbVBRdmVNZHhDYWhOTlZvMGRpdVA4Mjd6QjllUU00dEJMRitCelRDVFRS?=
 =?utf-8?B?aEY0TFRmdVdrbnVhZzFqdGNqdklid1FRNDZseXNrTkRNVHVXZ2hVQUFSaTlQ?=
 =?utf-8?B?TS9TOGFMcDB6TFo5VXIxai9zRHUweDdoSUNRZmJkRzlQU3BrMzlBMDBLVTZG?=
 =?utf-8?B?NTgxdGhyeHRNQ3NsK2pyTFVVVWxGTHUzRitVc3VlTDdGRmliaEJkNlBTOXJk?=
 =?utf-8?B?TW4zOVdOeWY3ei95SFVtVjd1OHd2NHpyNnlCeTRoZVI0N08wZlhzdmZncTcy?=
 =?utf-8?B?SUk3czJtblc2cFl1N2o2THZKM2lCRXZuN08rb0htNnkzaHBVL3lNT0Q3OFpn?=
 =?utf-8?B?ZmNrc21qVWw3dEpRTlUzQ0huRlZGcXVNZENpYjVIN2V6OW4wbExSWjBGSUdj?=
 =?utf-8?B?c2xrZEo2cXZNdjR3L3J5OUgvV09PZnVqVEYrZ2hjZEMzU1g0dWtBMGJabGVY?=
 =?utf-8?B?UGtkZXQ1dFRKYlBLbmhkU0JJdytjeUNMMVNBS1Z2QTc2ZXNZakdpaURZM1Nh?=
 =?utf-8?B?QjlCVXRNMlo3YkxQbmVSY290VDNpM24zcUtPTXcxM2k0a2RrbjVQNkd3M3gx?=
 =?utf-8?B?TDBIZzIwV3ZWNUc4a1p1VGU0UnNSNlRLbE5sYlplOEErdHVpL1ZzVVNIVXk0?=
 =?utf-8?B?RFNwQUdLRFYxNTdoUGdTRm0zTDBIWGdndDFiVm5VL0NIZUZYVjJvdmo1QTRL?=
 =?utf-8?B?MlZ6b2U5d3d4QzJhYWRHMEcxdnZkNmZra0EvQ3I0b0dSbWpzdWNMQlRvOXBD?=
 =?utf-8?B?THA4TjFuSnlJdzJ4bkt5R29VZnd6TzJNZXoxLzhtMml0ajEwVXJWMC8zemNT?=
 =?utf-8?B?emFDS203TnM0NmpHamEyUFd4dHVGbGpXWUVWcW1zc25nNFcrbkFiWFp5Q0hT?=
 =?utf-8?B?SmlkMFpOcFpObktCd3hGaUx4cFlrUjVtalZITUxVRjZiU0oxbmd6eGgrQnYr?=
 =?utf-8?B?Ny9FWVBmVnlzYU5TOHFIZmdhM243bVZ1cDI0UkhISzl3MmJLcGpmd2VFWmdG?=
 =?utf-8?Q?1c3fdrpjbhRKzC/M8oI7mMn5e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9e6be9-f23e-4241-2079-08dddb5317cc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 16:53:28.6677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4xvE2YGsfA9XVd+xLIqy3AoUSVY6duY1NMmnWhOAVEyEMwODoqSkilXnsyJSUEHrfjO19vMFPHID6X0QIRAUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6762

Thank you for the confirmation, I will send a PR for it.

Thanks,
Melody

On 8/14/25 9:48 AM, Jon Lange wrote:
> I think it would be reasonable to remove those checks.
> 
> -Jon
> 
> -----Original Message-----
> From: Melody Wang <huibo.wang@amd.com>
> Sent: Thursday, August 14, 2025 8:33 AM
> To: Jon Lange <jlange@microsoft.com>
> Cc: Lendacky, Thomas <Thomas.Lendacky@amd.com>; Rödel, Jörg <Joerg.Roedel@amd.com>; Kaplan, David <David.Kaplan@amd.com>; coconut-svsm@lists.linux.dev
> Subject: [EXTERNAL] Issue in handle_icr_write
> 
> Hi Jon,
> 
> I have been working on the PoC of Alternate Injection, I found there seems to be somewhat of a problem in handle_icr_write:
> 
> For the Message Type == Fixed you enforce
> 
>       trigger mode == 0 (edge triggered)
>       and
>       assert == 1
> 
> In practice, actually, those bits are largely ignored.
> 
> The Intel SDM says:
> 
> "Level:
> 
> For the INIT level de-assert delivery mode this flag must be set to 0; for all other delivery modes it must be set to 1. (This flag has no meaning in Pentium 4 and Intel Xeon processors, and will always be issued as a 1.)"
> 
> ...
> 
> Trigger mode:
> 
> Selects the trigger mode when using the INIT level de-assert delivery
> mode: edge (0) or level (1). It is ignored for all other delivery modes.
> (This flag has no meaning in Pentium 4 and Intel Xeon processors, and will always be issued as a 0."
> 
> Basically, the hw ignores those bits and this is how Linux has been doing it since forever.
> 
> Example from me tracing a Linux guest:
> 
> [SVSM] write_register: 0x830: 0x28
> 
> That's only the interrupt vector and neither of those two bits are set.
> 
> So I'm thinking we should simply remove those checks.
> 
> What do you think about it?
> 
> fn handle_icr_write(&mut self, value: u64) -> Result<(), SvsmError> {
>           let icr = ApicIcr::from(value);
> 
>           // Verify that this message type is supported.
>           let valid_type = match icr.message_type() {
>               IcrMessageType::Fixed => {
>                   // Only asserted edge-triggered interrupts can be handled.
>                   !icr.trigger_mode() && icr.assert()
>               }
>               IcrMessageType::Nmi => true,
>               _ => false,
>           };
> 
>           if !valid_type {
>               return Err(SvsmError::Apic(Emulation));
>           }
> 
>           self.send_ipi(icr);
> 
>           Ok(())
>       }
> 
> 
> --
> Thanks,
> Melody
> 

-- 
Thanks,
Melody

