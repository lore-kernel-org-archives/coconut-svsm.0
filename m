Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C583D2AD0C
	for <coconut-svsm@lists.linux.dev>; Thu, 17 Apr 2025 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744920861; cv=fail; b=LpkbvtAkV8LtPbgPL3ITs+u7AtzdXoDKBvfrEfBhzNo/UBPlDVoGR7NwSJ38cXPbLTobKf6KTyt+fspA+jD5lCyFflNzyOTK/O09ceXGzWiFK1OVHvlZg5DjwQ2+mdMu65+oueFjJsV70QkCr/1sNJBYMxrm+bO95XSamEZ90IQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744920861; c=relaxed/simple;
	bh=1fTkFRvkxQ8/Qs85hUketwdjM/CzMJG96avptwSKnwI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fXH4PA9xQK1kyk3Bb631V4BzL5Rs3si75QZ0u1yk+kyay5cjnzxm4GSBqbe/rAwT1mWELeqBrCJ9D0G41xb1jubw6fUu2Qe8r4SE/ETXANnVgCVqaxNhMXTjTPv9jtWHs3I/rCKRf4fhK7UdROo4ysoHT/OoqH2othDTfhgz7oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=afhYaP2P; arc=fail smtp.client-ip=40.107.223.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="afhYaP2P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qejE2GM0ZKEgll9FWq6Lynz2DSCRZE7nU+PPLV1JEiTlf1SArqIQyc5jyZSuPMqxu/n403aCEOUUdSizil6lqqZ7rH2+LVffo7/ngF9pZSCffEFouHl5WRJF3cR8Psns2xrr/LXlMhTVkXi9xN5PYZsmCJ8Xy57M+k1SSazE4di3nOkV+e/8dPtPAFQOHeANfioN/46rWcFlrPKlAj6W9BEzdWEDMBGapCOU9Q9kcYUwqx3+ZAoVlxyzeFmgwW51NUh7r/0smcaRnqzfLNSv60n382mpVddwNmvg7p6Fl0IUGvKXrrusX+IVwAxw5jKzdi8ZXdvJRBS9thkZoqOn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzzGyMYlLzt/C83198yvqUUGncONsi5eRE/R4A1/tdk=;
 b=FT1NhAnDpbvH45b4L18BiH2rzZO4giT78h7+fr6ynig0JZ0bI+yWY+FjZQwgYmTCQCMEyOam0Pgo3QJTZDGDjiSaWWiQlwl0fhfuKBOlcuVrqDCZ4aVmZ0UNt8lZOiGtKQTfV0Aks6PKVgjC6mTQAaj0aKd7COHwL1mIj/C+qP00WMKjVU4Plpk60Bj7/tBptLrWRR0n7fxiEvaPj6fp19G0ymynyKIIwLx6tGlhtNqWtNM5SUI00LiYADtAduyoZdgEieBQsJi3GOk4umsH5HLNcDgKUU48sXIrUZhHisyuS2qlZNQByayj20XXrWx/qAMuwV830utZVQ2whChxFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzzGyMYlLzt/C83198yvqUUGncONsi5eRE/R4A1/tdk=;
 b=afhYaP2PHT0K8LmGy0lIZNv0UMLAwRypPIC1snpzVxPom7TmovY1bNkTt1SY8W5nDTIj0CCxKUBfWMLVv8XCpbM+9FeKey2W9J1ck0pARW6dN6hNQDCWpUsxOtdwhnxL+8aw7577+5nfR20/Hf8H8oim0ASsxQTvqIvUv5SVbr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by PH8PR12MB6843.namprd12.prod.outlook.com (2603:10b6:510:1ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 20:14:17 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%5]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 20:14:17 +0000
Message-ID: <06e71552-c890-1577-8967-4d44fb8bdf6b@amd.com>
Date: Thu, 17 Apr 2025 15:14:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Potential project on implementing AMD SEV emulation in QEMU
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: coconut-svsm@lists.linux.dev, svsm-devel@coconut-svsm.dev
References: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0094.namprd04.prod.outlook.com
 (2603:10b6:806:122::9) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|PH8PR12MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e6452e-3f46-4aab-1a5b-08dd7dec6e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHFWV2JzY2xYN0xZMnBkVk8rbXU4UlJDNTVVS1RaUDhWSzRUMUdBS281MG0r?=
 =?utf-8?B?TkJzM005QnNsQ0YzeUVkaHQrZlY1bU0zbmMzZzFGbUdsZDJ2blR4UitDZ2hq?=
 =?utf-8?B?c2JZaGhYWUpxRUtad0paYStVL0xKR3N6eEwzVnU1aTZTbGQyK0lReVdTUlI0?=
 =?utf-8?B?bVNwdSs3aHF2UGtMRXZBL1Fuc0pSRTNJeVJKdGR5MXlCTllCQ2N0QjJJcUFk?=
 =?utf-8?B?amh6V2xGbzlpZ0VqOFROZi9kU0hsUnZiQ1RNbENTd0MwbHltNjJGUVlycDQ2?=
 =?utf-8?B?VUVnS00xQm55dkVVL1RZWXRkVlFPZm9vZzBtb2tqTEpBL3NDM3ZRakVlZkw4?=
 =?utf-8?B?QlJlSTR5c2hOZ3M5MEl5cGtVMlFlZlJBcTVmbXoxVHhrNzdhc3V6WTJZaHd1?=
 =?utf-8?B?d2w3c0dNdDZ2U3FLVldwclh4MVJobVRFRERrNHRaZE9uUWI2TTZjL0NZMko3?=
 =?utf-8?B?ZWluZldpTkxQN2ZRS3hkcWNMdkE3dXdVT3lsYlhNYW9OQXJMTGpyK0Y5elk0?=
 =?utf-8?B?MWlBZGlGVEpEWUlZVkJNTmU5QXllcUE4OVZZSDFxVjNlbHpvTU05Qkg0aTI0?=
 =?utf-8?B?MnBzUnNHUnFmd2I1bFpDWGJJZmF0QzNxdHZ3bVI5T2VURG5rNDBNS3ptcncv?=
 =?utf-8?B?YXhhcnc3alhNeHpGT29pYzZJWUlPYVdGVnRVY3F5RXdHYVpzYVRSQncwS09z?=
 =?utf-8?B?Q3JSSnVna3FZNmI2SmhzTkFrc1R5cUZleXlBenovL2w4YUwxdUNTUkRMcWxk?=
 =?utf-8?B?WnZ0NmNNZVV2bjF5RCtMN1ZEVDJIL2ZoaEZ0SzY4QWlNaG5aV2pnUkVjZWNB?=
 =?utf-8?B?VkI1QkFnT3dBQ0Y0RUlySE96RjMwSjE3dTVkUUkrNFhXMzVCdGYvZnlYTzZI?=
 =?utf-8?B?NXQ1Rmt6MmdTOXp1eWhVOHo4Ymt3UDRUWm9nM3gxcm41SjExY2pHSFVDbjVs?=
 =?utf-8?B?bjNRbi9HbzYyZUEwc244d0pkUSt4cUFXU2JFR0hiaEFMejVoNzlKS3prRDFk?=
 =?utf-8?B?MW5Edk9oWEV0QmlTTGtGWnlSRW9wWWhIK2xrNThjVFkwUjFzUjIwNXpja2RH?=
 =?utf-8?B?b1VQckYzRFRIOUdNRWhRcTA2UzZBeWcvQ1Q0d3pGUWFtanpldUF6cUZwbGFL?=
 =?utf-8?B?RkJpeCs0MXFQamZOSmNqV1pXenYvWGlZVDd6aDczM0FhUDBTMUF6QTZyVWZG?=
 =?utf-8?B?ekU1QWRZZTNkUnV1WjNhOUdpK2tEQmtFQTZvbnlMOVIwVDAvd0tWODRDWGYr?=
 =?utf-8?B?SU1BcGZZK08rd1BQUUtaZzEvQVM4dCtkKzgycktRWUVpVTdoZGpHeko4ZGVX?=
 =?utf-8?B?MFZ2dGdIQW9FYW83YnJ1a3IySzgxeUN5MHdFU3o2dCtpVGRwRFZBdzhuakFT?=
 =?utf-8?B?ZXhzaEUvVFdJU2JFL3k1SjNiNy9tNGFER2IrYmpma201OVk0Q3JSU2FRMXJK?=
 =?utf-8?B?WStiWXBpSTJpdUhDWFF4Ykc4dEFpbkM3WmErM0tVWk4rSmRLR21vOWtTL2FR?=
 =?utf-8?B?V1h1K0JodVlsZDRJVGUxMGJhT0JZSElsYWs2dnJXWUtqWFFLaVRXZm5RNjl2?=
 =?utf-8?B?Q2lGRVp6bjhlM3dOL1pPUUlxcTY3T1FpQlA4QW5yaDk0L0N5TGRjL3F1UEFl?=
 =?utf-8?B?MEMwZ2swMllrZ3VDYmk1NFR2K3VDTjFWQy9WcnR5MmRkWGIxY3hoUk5EUVNt?=
 =?utf-8?B?aHVOTFp6TSswb3gwQjJOOGlTMFlJbTF4emJtY21wUlNxRmdJNm1Ld3ZYdU1Z?=
 =?utf-8?B?SmRYbE5qUnh3d0U3ODkydVh5US9lU2Z5emZuTmFLcFZsN0VWckxKS1ErY3Jt?=
 =?utf-8?B?UGhtUE8xZjBaSmVXSjNFY2t1bUF0ZEtkSXJNWTk5bkhISWhEUFRUekJxMldz?=
 =?utf-8?B?Sk42RDlEY2cyTGUrTk5LaVhrWVhNU3RvOUlYbURRS3ZYa0dNTzhlQklkdHBa?=
 =?utf-8?Q?dROYTPrMVZs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkRRaC81S1oxSnFWZE5XTTB4NTdJczdURHd6QUhOcko5M1ZWWDRtOGpuWW5U?=
 =?utf-8?B?ckpORk1ZWkFaSFJPWEZ5UW11MVlUdG1WTUFhTE5pZUdGenp1WWNPd2Z0T2pi?=
 =?utf-8?B?SmZSYlVYUjNkNUFhdHh5OHBiekxxaUFNWUdrRWlNZmxUM0w2TGpPN1d1ay9w?=
 =?utf-8?B?Z1JyVDN3MG0xOFpQTEhUZjRTVDhJSjR6SjMwNktRaGx3M0RCcUcwMUZlTUhk?=
 =?utf-8?B?ZkRKR3p5alMvSm40eWtBOGZGcGZEMGFNRVJkUHlvNFVTekJUeEx1ckMwTHZJ?=
 =?utf-8?B?U0JTQnhvdzFVUFNIMHBuZkhpRkhHeWh1T1FIckpuMmZndWJianpaeDFVSXNH?=
 =?utf-8?B?b0N6Y3VGbTVJSFV4UmZjNk11T2MzT3BDL1NCY3dZZ1VuQ1QwZWtZaGdmV0Fx?=
 =?utf-8?B?NWprV24zVElrRGQxd0t1TzNJcE1WdTRpOGUyVW1rTXNRZlZnUDdLVUVUQXNl?=
 =?utf-8?B?RE1VckNocm5YMGNTcmswTFJwL3MzY1lXRW5QeDZCL3MxV3lURjRmK3FmMTky?=
 =?utf-8?B?RnJVTWJkSW1RUU5DdzBaTmdtTVNiZnd2andEYVRwVGFpSTlYZTI1ZXJIUWRu?=
 =?utf-8?B?OHNqMFBwZCtRU3d4b3pnN0E4RXZIajNQRHkva2hkdEgzRDdGWDlqeG1PcTht?=
 =?utf-8?B?QWRTS2JacE1nRUtRVWhDQXFNSDJFNWpkVmNoNG1XVEl1MDVaZThFVTg0TXM4?=
 =?utf-8?B?bVZMRzlGc3lQeXZ1U3JLVkVXbktLT3V2endVUklzcE9BUVBrSzl2SW1KUThp?=
 =?utf-8?B?U25peEF0bDQ0Rmtha3JhTjl0VlRBTEZRWU5xUGJnQlM2QVpSVWpKTWhCVmEr?=
 =?utf-8?B?dFBjaVlNeVkyYTlaZjBtY2VjWWZXZTdldk1zZFRXeFhvZXl0NmZmSDg4bjJE?=
 =?utf-8?B?dktmQk9zWVlPSzZ0ZUtrVWprQ205VEtrVXdnU2xJWmkyMGNLa09jNG9JNXgx?=
 =?utf-8?B?S0MzeGpEOVBKUnM5YVRZTExsQVI1UitKa3Z4QlA3dHhkZ3RNSXI0aHBhU2hM?=
 =?utf-8?B?bHBBMzAwNCtpRFJJNngwcVUvUGl4RXpVVHZoRUc1WkJWQnNpby96SWpTZFA4?=
 =?utf-8?B?aVEwUlhhYXliR0IzSlV3UlVvMFRlNElRbXpPQVlXMkdZNHdodWtPMXZ6U2sr?=
 =?utf-8?B?OGs3TzFUTlNXVjE4c2YrbzRlVGVWSHloS3puOHo2aTl5YWdwbTg3R0dna0pP?=
 =?utf-8?B?TnlsZCtXNXc1U0pPRzl2UlZOYUw2eHdNRk43ek5USDhTanFCWjVhcVFBOXZ4?=
 =?utf-8?B?dWNRY21HTU1BRXdyUlpWbEVMVTB1VjZ1a3dZenRLRTFiL1hyQ3hNbElXTlZt?=
 =?utf-8?B?TjU5MDIzaFpBcEdlQmhQTlpJRWQvaUFucUpqUUI5Z0pXdjhTazlWbzVBRVM2?=
 =?utf-8?B?c2t5R3lXMHlucEFZRFNzK2J0WitRV3FsRXZjNXFjSjFhbTlnQ1kxeGVscFVJ?=
 =?utf-8?B?Smo2OEtweS9GRjN6Y3Z2cHp2L3N1U0owZzlXWTBwVzl4T1VCL1R3UHlrN0x5?=
 =?utf-8?B?dDRSVUtxMC83TnpKSTVQd2MwclJ1akVrdGVqN2gxb0lrdG9QSXBkWm5LR3Rk?=
 =?utf-8?B?T1FjVUNCdlJrdzFaWGdNOERCZ0dnUnRkOCtmc1o3bTBCRGdzbisrb1NEN2pa?=
 =?utf-8?B?Rk91OGtTdmJzQ1Q5VjBxN2J2eWRJUnFRTnlvZmwvRTRBVDBlWTE5aDFvMm9r?=
 =?utf-8?B?NGRPZG9MamlNVjk3TWFKT3NPRE0rSHhaRmt1S1VXK0tjSkNKakk5c1B4WHg4?=
 =?utf-8?B?ZHoxTXN4SDJyQ0luVjUyVWt3YUhJQWs3R0pRL0c5aE8wcUpJOVc2Y0ZTQlJx?=
 =?utf-8?B?NzhoSzJYc05BTnJmekNrRFRkK3p4bXNWbHZaQVhlZm0remN2VFhodGtOdm00?=
 =?utf-8?B?NXkrblZaNFRNNzVkNGtBNnlMdEE4VnBsUkhmbkh3R3NpMXluY2FTUzRCRmpJ?=
 =?utf-8?B?bk5uaFdGc1FIc0RaZUJNZ0J1ZTZ4WWhidzlxMmcwMEx1N2JuOUo4eWcyUC9J?=
 =?utf-8?B?b1JTS2tPbFdLZFRaa1gwM1ZjRFAxQ3FlWks4Nnd2djNSb0JjNldEcjhXSjBa?=
 =?utf-8?B?dnVHdkd3N2VpQUE3ekpVcnMyZ1JGSDdwV3BIMzZrcWtkd3F2RjdPcUI0dWFL?=
 =?utf-8?Q?IhzgZCnYHNkgbVcI3oCbsuJhY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e6452e-3f46-4aab-1a5b-08dd7dec6e26
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 20:14:17.1921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxXDYib0sjAAQeTrJ4kS92zw5d/k+V5G+rgVQIL8ie5FGwdVLpNoxUcNB6/GEztmvMWrFm64dQhVn5R+wnVX0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6843

On 4/17/25 10:26, Stefano Garzarella wrote:
> Hi Tom,

Hi Stefano,

> yesterday in the Coconut-SVSM community call we talked about a
> potential project with the University of Pisa to emulate AMD
> SEV/SEV-ES/SEV-SNP support in QEMU.
> 
> Joerg rightly suggested having a step-by-step approach, supporting SEV
> initially, as supporting SEV-SNP directly might be too much for a
> master's thesis (about 6 months of work).
> 
> We wondered if you knew of any attempts already made in this regard,

Nothing that I'm aware of.

> but especially if you think it's a feasible thing.

Anything is possible I guess, but I'm not sure what it would take to
accomplish that. Attestation would tell you if you're on real hardware
vs emulated hardware.

Thanks,
Tom

> 
> Suggestions, ideas or partial works that can be reused are very welcome!
> 
> Thanks,
> Stefano
> 
