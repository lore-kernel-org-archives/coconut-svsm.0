Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF422BE7B4
	for <coconut-svsm@lists.linux.dev>; Wed,  2 Jul 2025 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465532; cv=fail; b=koj98iRyifWfNSZ4z66YUa/6AEfkG5/RTUsnv5Naqys1XG6oTA1HxKEXKcBAh8t00RD0uqH6gL0w+HAbEOtOFP/SZgBjVu6dG14eEwVoIiZWhAyIfKqxzgUjY2tyDST1fqQ77s+qNB+Niv3Ga0ACC6M6Qdu8rUxud6eRy6zk6F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465532; c=relaxed/simple;
	bh=6jLsZ4UXPr48Q3mQeG5f3ZDDed4dNJs9WEd70ESxpbE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SoXnHExLZGnGUYU6JqCp7aNbOP8cx3EiTsS2NDyFc/DdFOuJ7RCCPbqfjIv0Qk8dY8l0/fLtWQgH/qt5Onw5bhk4wzhfYXvFbvzxHwp1Fi2qK1wxx/ziAqUnxmv4KHl44/7vV00Ds5pc6MedWTy2IZAhQd5k4pYjP6SJzdwwxj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=evk9v60J; arc=fail smtp.client-ip=40.107.94.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="evk9v60J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dl4Kc3FqRteVfnEypXGqarBWkbO3CLC3R93Lyzmi3vAfVRCdW2ncT9eFfuNKjpee/R/P+LkBnDge8QU9msrD7ia4NiiJtc11rK2kkbHjO1Yh6YemWSXA8L82kyz6RU2t1QPmFHy2sKWoQf5AyoPBK5/orqMRI9Bfb5y4YBpnBIX9Ri9hCI+A/aKSrrSWKEDUsKvLbCOfTzPEXaEaYRraCMXmROq4nujmbh/ECCxlYRJPIF/7pO9SAdatE7sz7hnAlbrt0IDVCbQJFgpOLsvqRwUxReRqSGcrqZ+jGpctN0rlMwMDt0XyYVBLFRLTbCciH4sa0PUFQ/VucwsWzLC/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lzxgbELsIZxW3LUNLZOkk6y+uTGkhvvSgTCokvIHPU=;
 b=Vcwx4WYrH78QUPgIf1mjVxIst8KRBTp/QncF9PUwYWBs31PobMWniwAm+Mrpm8+VNdf4GxWsb/upk8UYfZH1aI4H+9esXUgErujIFTZnsAfNm6OZl+0cR7CoXFsnaLFMamdWT/zNaklmFAYVPBuIdu31FwAud3Fz2sjmnvY/GCUw/Rsg8sGLmKn0NNB2+FAlhoSttsMt03iqPJ7+GKlI99AsG3amBWCj80H8DmAzB2nB80JIf5QoOWKElSWZNfiqFdgEQ6ylzThQoBU6dQ8x2gpKaMM4BjRMRN839Wuq7h57G1eR8W/TQc4uyoP6OjD2c9YLI65Cruyp4YH3AoRd1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lzxgbELsIZxW3LUNLZOkk6y+uTGkhvvSgTCokvIHPU=;
 b=evk9v60JwGwsm3Pcd4KD3YUZaRnDjoAZs1wA5pfVOs+OPKv7hVQgT3PPjpF7ZlEsKhtWi8BTE9/zP2Qg7bxdagHRcZWQyvZtfi5T+ATEZ64i/ULL9o3htpRcLtEo80BE3ZCH42YY107JQXuOWS39kzbFCwyr8PRLcZFWmlfkAbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by DS7PR12MB8252.namprd12.prod.outlook.com (2603:10b6:8:ee::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.17; Wed, 2 Jul 2025 14:12:08 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%7]) with mapi id 15.20.8880.024; Wed, 2 Jul 2025
 14:12:08 +0000
Message-ID: <1598174a-b4a0-1f98-6a91-3ef01305ff4b@amd.com>
Date: Wed, 2 Jul 2025 09:12:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: SVSM draft specification
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: coconut-svsm@lists.linux.dev, Dionna Amalie Glaze <dionnaglaze@google.com>
References: <fe3a4825-d079-0fe8-3fda-ed16044a048a@amd.com>
 <nlnqim7c6kmkwkuiy3ly3ryxooenf3ypu7ffnmn63c5tlkloei@fepl5g5pnjuz>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <nlnqim7c6kmkwkuiy3ly3ryxooenf3ypu7ffnmn63c5tlkloei@fepl5g5pnjuz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0151.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::21) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|DS7PR12MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 7766006a-0d92-49ba-b3dd-08ddb9726e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clY1SDByaVpiSXMzTVlQS2lFa2lBSlBPYkpxMkxNbzFpMC9nY0RJYTV2MlVx?=
 =?utf-8?B?ZjdMZGlRRFFIa2N3RVhncnpPOFZqOWdkN3BPRG1sR0FucU1scHV3RWZtZVVa?=
 =?utf-8?B?WHBISUMzVlg3STN4WWVMTlNPRlJ1cFFnMnFPN1ZDSWNMdzc5bnU4Q3dESGQ4?=
 =?utf-8?B?TDNEeHNablRJZ0tkTndrazJxMmZaY3JtY2xFQ0ZlUW1ZMnlPVlpWZUFUMW1n?=
 =?utf-8?B?Sy8vL2d2WFFydDNmWUtKMlpSOXdhNVdXV0xVUzNwZkNON0VObG1xRGl3L2pt?=
 =?utf-8?B?SCs1VlRlQ3R2U3hJbjM4amJ1a3d2NlM1OWpSVHdFd2dYKzJtWWdFSUo1aHAz?=
 =?utf-8?B?ZFh6emNjbjJBT1RCVVV1OS9yRll2dklRMjV6d0xOV1BFcjBnR2xPcUkwMmtQ?=
 =?utf-8?B?WWdvaWJiaGc0Q2Z5OFZkT2FrekNSZGNBWWhrY1k1ZDdSOVo0M2VwMnlxK09D?=
 =?utf-8?B?QzRZSDdHaEhKRnl2SmxKZGhFK2xrVnkwZXBHRW8zWER2UzhmTSs2c2haakdQ?=
 =?utf-8?B?OGVTd2dZOVJBTzNuQXlreEZOTVB4bkJ6VUxRcG83RDNzOWxmaGtwQVQvR0dB?=
 =?utf-8?B?Rm9iVmZoMUVCd2x5c25lTEl4WHNSaXN4eXdJRFNWeERoMCtEN3RNQkxLRnFp?=
 =?utf-8?B?L1lsbXk0cTJ5Qm1XNEFDSFVrTDgzTzFyWnVmNE50ZlFlKzNBUFhvdWNHbGZB?=
 =?utf-8?B?RFFGYmhYV2l3RXBXMm9tTk5iYU1NQ25xamNmZVB0SGhNaUFGQU0wQ2VLbUZl?=
 =?utf-8?B?SzJ3NUZoQy9rNFJ6MnY5cnhMQTJZZjQ0dkd6SE0zRmkzVmxrMjh0Rnh3ODUw?=
 =?utf-8?B?VisrY1hZTSttMWtGbUdsTExIeVJoSU1HVkVMdXk1UEdlbWQxRlJTVnVqNHhH?=
 =?utf-8?B?dGlKQWxhcVkzZ1oyTTZodkt0YTRZRngvVTBqN2l4UWVodlhSYnZVUStMbElh?=
 =?utf-8?B?dlpyOGxVdXhSYzdEenRUZ0o0VlkremQvWDArNTBsZC9ETHNGTldHM21wQWtN?=
 =?utf-8?B?RDZSYlFORlVIT05HaTF5Sm1QU0s1blNMSVd6c0hXVVdpYjlZUGFTMWI2d1V2?=
 =?utf-8?B?MWs4dmNZeUZWNUI0WElXNytncElvbWFyNmsvU01IRjU4dloxQi9kWkFPNjJJ?=
 =?utf-8?B?SWYzOWJtVyt2WGRTUmNqQ2lSMG56QXpVcmd2RkN0MEV1TVg0VEdDUGlYZEc2?=
 =?utf-8?B?NXJkTjIzdDRuc0VIaHhXWDltaHhjRzNTd2dzU3Z4ZnI3b0QvRXVxVlR5UzhF?=
 =?utf-8?B?cnhMRm04c0RNUzlrLzVteXl5NTlYS0dFWkpqaEI4NVVIRzBhdVJoaGxxdmN3?=
 =?utf-8?B?QlNSekJxZkExUjlPSXBoM2NtZmJidVdiLzNvUHRQbjk3VXAzOStvcExzNm5U?=
 =?utf-8?B?bkxzT05PbC9uN2t3aFRzYTFBamVJQW5CckNGR2x1dHdrQi9IeFF2QnVHeDBm?=
 =?utf-8?B?Q2lPczJvTjBsZGpTKzFkZFdJWUNIYXVHMGdQejdJdlN3cjFRWms4NFg4MVp3?=
 =?utf-8?B?YnFDWGM4OVdoVkdwbFh2VE1qWXNtMThjMWxLdlQvMTRPSzJpZHhFWUt1UTVh?=
 =?utf-8?B?NE0rZDRWYTI3enRHM2hpSFN1b2srZ2V5RGVVWGVGcmRsN3Qxb2kxRlF6ZTdQ?=
 =?utf-8?B?N1VUaG5wRkdGM1VLRFNsYStWeDhwd0tUOWZkRlMrNmlNbDgwcmo2eXN6VXZ4?=
 =?utf-8?B?eGd5QUhiS0V0RHdDNXBEWEdrY0Rpbk5tQ25mS2RWeHlReHdPZFhRdEJUYkU2?=
 =?utf-8?B?ZnFETkNHckd2bUVMUE9maHlRWTd2Z1JrN2N4USt6RG5JNklvcDJlTElmRnlw?=
 =?utf-8?B?Y2NHYVJSS3NSQ0ZXSm9naGtFcGhseVZYTzBIREh5SDdvTC9IMkVjMXI5RzJ0?=
 =?utf-8?B?R3EwV09pb3RnMENRazZveGd4YzlQT0tYSWJMdGVUNmhHZnJIWGtKak5NMnBi?=
 =?utf-8?Q?XZcURjwKoi4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlEvRTM4dUFRUE1UMkhWY1N6dUJZa0tTRS91Z01MaUN1cGNhSXpRaGFZbUNj?=
 =?utf-8?B?dklNS0FPeXFmRnYzU3pORjRSM3lOVTAvMkZqNm4zcm5qNnlib1dYdERzYmZ5?=
 =?utf-8?B?WnA4dllQQXN3STdvMXFHRE1IVFFqOVM3THFONlVneFdsbHN0bkZjRGxobmlD?=
 =?utf-8?B?Rk90d1hNMzc1QkF5N1dYemdNeVVpUXlJNnl4Ym1sYytNK2VCYnNFSVMvcHgv?=
 =?utf-8?B?a3R6RDU5QndrMWpvM2o0VUJodDdEQ212MDlsVkhVTG5lTHE0bUpiVjVBZzVl?=
 =?utf-8?B?YWNQMm5Xc3BFZ016cjR1cGRtMjBXT3lHVCtYa2ZJOUdDb3BTL0p0RDBYamlN?=
 =?utf-8?B?NG8ySVB0K3U4ZEptUEtQQmJ5bzhzL0dBNFlzQ0hGczUzTUxQekVPK1pScTg0?=
 =?utf-8?B?YUwxQytLTVNFUEw3YklUcnJnSHk2WEVXODhZTXFPWWk2VzV4UVpIc3lXOVdi?=
 =?utf-8?B?TmpKdGNwcDJJVWZMYzRpdjd6NjNNejVmSmtWVThWeENkZjVPK3VXOHJucFZV?=
 =?utf-8?B?VmxwM0pvLzF6MTFEVEVXVlFEVHV0cFUvVjBvWG93UlFqY0dXcmdiQ0tzNFdJ?=
 =?utf-8?B?ZzVZcVNzWHFOS3VzdXdrWTdCejhMTENWdnFVNTRrK1E2ZTFZMzJJUUg2NFc0?=
 =?utf-8?B?ZWZyQzc4dkIvcStqMDhtaDU0cTFTblF5UGo5T0NaTVlKSVpJeFlpMzdtUHMz?=
 =?utf-8?B?elJUZ3pXVUVkVkg3MnBsVXByVzQ1SXR4Z0ZMZTh2VFlzbUxBSGs1M2J2V3RC?=
 =?utf-8?B?WGlLQlVPWHR3STJYQThHL2ZvdHg3a2VoOE1VZ1drRXp5aWlhdndqU3BUd1V4?=
 =?utf-8?B?aWRFaForajhjaWg2ekZUcEludzI4RVVCWllZUjF6Y1JpellHSkMySEJQVVlm?=
 =?utf-8?B?ZUNYRjBESjcyZnhsZU9zWkZGeTFQUWRYblcvR3AxMEc3NWRWb0NvYkdBdHZL?=
 =?utf-8?B?cVVFU1ZHWTJDME1Pck9Sdi9LbGtETnFKVGFnS3p5V0RnbU9aUC9RTXpNYkgv?=
 =?utf-8?B?L1lQbCtCUzFzMzlhNEZ2c010Vm9ZS1FYZEFJc0dOcVp0L2xicHlYK0d1d0FY?=
 =?utf-8?B?NURVOUF2QW12OCtpWkJpS0F5SnpGenV6dWt1L1g0T1RIWWNoNXFHVk9rckx3?=
 =?utf-8?B?VDZVcUloK3VPTDdkVFdxRmhlbG9CN1EvZDN1aXhBRU9BZEdWYWdZQnJqZlBy?=
 =?utf-8?B?aUl3T29WcFVOS3JxTzFGSFAxVndidkFWSFYzak5HRkFQd1BQUjdjQkdnZStQ?=
 =?utf-8?B?QlJxNmNCNHQ5ZXR6c1NVWWpIS3RjWWpmNTVRWnJHZVpBWWl3dGllRjhUd3hK?=
 =?utf-8?B?am1mOVlWcEw0UGUzYVBKSkFORW5NZncvZE9WUEdTSXVDNi9laU8xcW5Gb2Jr?=
 =?utf-8?B?R3VGUkxyb21qWW1tdG92azU2N1pjTTY4aXUwNGZEUjdaN1BQQ0FtbGp1YXph?=
 =?utf-8?B?R25JcHBVSytHOE1hRWpwQkRmb0tKODh1amM0c0t3NXo2NVN3NHJVMytoM1hp?=
 =?utf-8?B?aEI3aThjWHBKQnR5eXAxSmk1R3JlTjhCaFpUZ1lBVEwzeGFlbnRjRWl1UFFS?=
 =?utf-8?B?SGgxKzdEREdBOWY2SlBvZkZueVkrN2xybHBxU2d1N3VDRVNmUDZOcFh5dUd1?=
 =?utf-8?B?NkZQZTY0Si85ejNGYmszZ0pIcnNBK2JXMWJQMmMrYXpjVFkzV1RQUjJWK04z?=
 =?utf-8?B?d2lBanRvNHpRZnNMMmF2ODlnb1VtNWwzem4yeVBiQklVOVlrNWNSWjlFZWhM?=
 =?utf-8?B?ZExTazNNT003aUhxNzB1dlpMOW9WZjRhWDQxZllWUkhhSC9QVmVaSDIwSG5q?=
 =?utf-8?B?ODU2WWRFNDhDNXJhOXdEbys3VUxkNW9IZHZ5VFRUdTZuVDBhUnQyWVU2NjBz?=
 =?utf-8?B?VVpOVjJTRWR2MVF0azhuLzQyVW1IUEZvUDBzY2pXaXZQYVhnelNKdnFXUm0v?=
 =?utf-8?B?WjBsY1pkY09oQUpHUGcvZXlJMzVIYjRpSWwxOE5uZUFFdUlkQkxXL3F6cHB3?=
 =?utf-8?B?N3E4dW4zYVBrS01sK2hDRkF6VzdsVWhqa2t0V3JVYkc5Smw1cjBYK2pVNWd6?=
 =?utf-8?B?YlFNQk9ER1pXS0dQbzNDdnhkOVRMSFJKcVRmNDVERXFoWStLamlMakNwQm5C?=
 =?utf-8?Q?qq81MKe4Jlc9jRPSu/Owf79S6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7766006a-0d92-49ba-b3dd-08ddb9726e2e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 14:12:08.3812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOg1DJqWhv7gfvSd/otCYHMBDU7tqmz9Zl05txOHvSoziWqMevmB7YFDAXd94QLx+1clLLxNYSBLifAol8PP3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8252

On 7/2/25 08:54, Gerd Hoffmann wrote:
> On Mon, Jun 30, 2025 at 11:36:18AM -0500, Tom Lendacky wrote:
>> Attached is a draft specification with the following changes:
>>
>>   - New single service extended attestation request
>>   - vTPM service update for single service extended attestation request
>>   - UEFI Management Mode service
> 
> SVSM_UEFI_MM_REQUEST description refers to *previously registered*
> communication buffer still, which we do not have any more because we
> removed the register/unregister calls.

Ah, thanks. Removed "the previously registered" portion of the sentence.

> 
>>     - Needs references to the request/response formats
> 
> What do you need here?  Links into github.com/tianocore/edk2?

Just something that someone can go to and see what the request / response
format is. Is there a more granular link that describes it vs looking at
the code?

Thanks,
Tom

> 
> take care,
>   Gerd
> 
