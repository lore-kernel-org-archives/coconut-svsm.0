Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B678309F0E;
	Tue,  4 Nov 2025 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762296977; cv=fail; b=DfM2mXyRLgGefnstsXHupXO6vTVw6M9OzyWTcCMrDu//2+nUoqXZF02E/Xzd504Zp9+cT2xyW7gyrO2gzFgCNGc3VlMzJART1OyFj062O6SCxpmReNcMGmmVu34AwvChujecfHC08mlNNlAPydohmyEQ+R2D5n5S4rJ8DDRN8WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762296977; c=relaxed/simple;
	bh=n2Jrn/NkpSYI5DDjWOTY0pKXsJ9rRG3sXATnnNmXSuk=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dmSzj15LEBQkM9bJB7grjcfusgcR48Cajqfiv7gFB0vR/kiwmT95W0gvR79TbZochEueP3Zt2o0+zrBUOttdRIw66/Sg7EEwcE3bqvSKCtGarBjTzBynzSviFaY4NoJr9x+K8mHVdsktmYi2XgA2ahKplREx7TroSiihDanDQ8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X6zoHkOU; arc=fail smtp.client-ip=40.107.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X6zoHkOU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa1dV2vampzohYpCYJlNvul/Uu8DbBOKdGCkD9ZL3u7c15R+wBtxEPZNhkycoczQ+syNakmnGHi00mqlCHY4P8G172vZ+h/ChynRYb4h02N038x5C4EQuhRdqu36NU+o7NRD7YGswcdEp6YMygbij9fqJM/hJ/Z2o2YHRDrZJpbwA4/GNaCrWTmaSNTd2+G4oQX9U42QxD0V+PYc65Cyy+ddfVUJOf1pH0BI5Rl6UnKAR0WCO8lrfPcoge25zQYoK1qKqvk8ZvDedRrmMiqU0E0LsIl1A92uhg063xiKtaq0QGAPucB5giWEeKw3jl9XM1IGOtZNNQc9OIe+LVN+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYcbENxhPQbQaUGWejjxiBvCEmm6157+ciIR1NOGN8M=;
 b=Rib+DInOiw7zPvCRayOBbyK4VI2fAr58dlFrqEMp7554bpPgzP11zCNPoCNVUtQ2WLrhE1/dp3Ay3hptFTXHBC62dvnGuttx+GroKYTFOXWyEzQ+BaeanTrfGauxe9ROmWzT8TE8+G/VRy3zz2yvF1/WfWKuki0+NjjpB8MsDW9cxq5yYnpyj+63s3nZFM9smpZ6a5IEjAT9aaYqFK7Yp95WlYBItP0SlgbLeYbuCOgEYsqvjP6/OdJD0Pbe8cyN0egkN5ZTjcwyGeUKMvn0vCYyyzrJI/cZMiW5fuyDCogvmQrkTyPsspmpDipJUzBDrXj7MpQf/xN34X6YlmfxqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYcbENxhPQbQaUGWejjxiBvCEmm6157+ciIR1NOGN8M=;
 b=X6zoHkOUP8VG6ak5O7rOS7YnogpHR9Bbi8qLOFxEmjkVht0Nl+yxdumIVs3GMB7CYaTcyv/1cT0ZxwMKGNJYPR/QlGFreSFMyCote4x93B0mNlMy7nQ2NNrGwbBNV8j2/pHXYefZqMONMinpnuWtyUTrZ1KwnIlo2bjRo6FW+rA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19)
 by DM4PR12MB6565.namprd12.prod.outlook.com (2603:10b6:8:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 22:56:13 +0000
Received: from IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1]) by IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1%5]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 22:56:13 +0000
Message-ID: <466b9735-279d-4353-8ec7-8edc54c24986@amd.com>
Date: Tue, 4 Nov 2025 14:56:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM draft specification (v1.01 draft #3)
From: Melody Wang <huibo.wang@amd.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, coconut-svsm@lists.linux.dev,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Cc: Jon Lange <jlange@microsoft.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "Relph, Richard" <Richard.Relph@amd.com>,
 "Rodel, Jorg" <Joerg.Roedel@amd.com>
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com>
 <e1ff5baa-39d5-408b-afea-79cb398f0ac4@amd.com>
Content-Language: en-US
In-Reply-To: <e1ff5baa-39d5-408b-afea-79cb398f0ac4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH2PEPF0000385F.namprd17.prod.outlook.com
 (2603:10b6:518:1::6d) To IA1PR12MB8285.namprd12.prod.outlook.com
 (2603:10b6:208:3f6::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8285:EE_|DM4PR12MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 421a4314-5586-4bf1-e425-08de1bf55aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qi81SmxUaGpTQTdmemIxZEt2eU1IcG1PQzM1d2hBK3d1UGo2UGN3QVVVeFZm?=
 =?utf-8?B?QVZjeEhKc3oxbVdDNUdUeXNoaFZ3bDNXNVMzbmZEQ3h3a2NETVAzaFZMcUhV?=
 =?utf-8?B?c2llVloxdVpBRXIrWEZmZGZPQVhFQklYSUZiRWhSZGY5Ym5saDRVbnd3ZlU5?=
 =?utf-8?B?TjhVZXVMRXNoaEJvZkUxdkgweEJXVklGNUtUMHZPZUFpcGZKZ0trejJDcHpp?=
 =?utf-8?B?Qmk0M1FBS3ZTY3N6czFhMzJHTkI4aHBNQzhPQVdsVjd3UUV2L2tuaFFGZ0Nj?=
 =?utf-8?B?eWNUdlNvZFhEbnZRaG9VYi8zVzlObTZxNlZOM21NeVpnb0tObTlubjlsWWVx?=
 =?utf-8?B?MmdYTGV3ekcramhyZ0tNYm1Xcmx5VkJ1dUZ6Y3R5a0V1Ylg1ay9sazJMUGw3?=
 =?utf-8?B?ZUF6ZmZQV3puQ0lmSk1qQzI1M0wvdjZKMnZEUmJGakhnUUF0UVA4aG9ENU01?=
 =?utf-8?B?Tkw4eHRRSlJkd01SWEo2V3Z1c0dxVEFUUGQvblg2VHdCa1BwNUdZVmNJWXo2?=
 =?utf-8?B?Ulh2STZ4K1UvOXV1OEFRY0puVHlyclRPT2VWcVZVUHVQUUJla0YzMWRiOGhs?=
 =?utf-8?B?dHVnRS9GUUplWnhISitUUGNCV1ptc2NPekYvRk01bjFjM2FzbW9PMCtIQXFF?=
 =?utf-8?B?QmRrQ3FsdGw1OWVNb21TaTQzK1U5OFVSaW14Nmh6eE45TktGVitQbllCR2tV?=
 =?utf-8?B?R0VRLzlCanBxZHQ2eTU2N0g2bGpSUWdZOUtuZ3JJekdod05taHozQkJoZDNJ?=
 =?utf-8?B?V1hCNHpiSGxaZ3puUVRkdDQ1V0pVOXE1ZnVEdnA1MUFuTnV0TlJtaFBPdFpy?=
 =?utf-8?B?UXQzb0NQbndMNStXU1p5bnMvVHg5SUp0SVNZS3VOUjBNYmVtSmhTT21nOTFV?=
 =?utf-8?B?YTBDTlhwZVYvTmpvdW1nUmVLSFZVd3lsMmd5dmI1bUZYSkV0b0N3RVFGdXEx?=
 =?utf-8?B?OFFzUGZLVDJkSzJlNHRaRXhVRjZlVytMRFp5dXVXejh4MS9uWjZESVBMd01R?=
 =?utf-8?B?RThub1BLdUFtODExZlZSZHRzdDYrelZtd01yYzZjdGt2cWpxRWlja20wMEY0?=
 =?utf-8?B?UHAzWnpibWtCVHd3ektjd3lqTmp5bXR4MGJXYlgxbDdYMmtZUTFPT0NjRFdD?=
 =?utf-8?B?MDRtbEs0K20zTWZUYUd3R3VBVjJBOFFjL2V0L1BPUHpCWERQOG5ubG4xYkd2?=
 =?utf-8?B?Z0lqdkVnMW5VYkZGMG4yQlVxS1ZyS0RjMlBWZWF5aHAveFgycUlGRnI2Y1A2?=
 =?utf-8?B?K2lxNzc2bjFIVFNja1lwT1JyemtyQXVIK0dhRGpCSUl0eDlIcytpMXc5UHpq?=
 =?utf-8?B?aCtzWlJZS280bnpGTTVQRXppR3ZzbTdXMGJBcEFmVitDNHJ2RVh2V3RkQmFE?=
 =?utf-8?B?Wkp6ZlRaQTJHODdPVDkrTTkrVjVwNDBvSVhqa0g4RkljMHpVbTJOcHVONXZV?=
 =?utf-8?B?NUtBeHFKTWo1MTN6Zm9VNlMzY0ZKYUNhcVZaUHpmb1g1elpRZExISCt2VDla?=
 =?utf-8?B?VWVveDNwT1N5OTRpRmVxSGZKVG1JYXljMGExTGZYb080dW9EdE5JVmFOL0NV?=
 =?utf-8?B?UmI5WW96c3RQZVNkOE5aRFZEcjlidm4yMVFqaThBbDdLUmlsWENlUlNWcjd2?=
 =?utf-8?B?c2NVYVlNMjdvajdTSUIvdzNPdFFmWklaaFowSnB5ODJpMlUxS3lxMDg2V2FH?=
 =?utf-8?B?QlBxWEMwOStGWFhUd0p0Y0xnQ2Ryd2VoOEdPaHF5Q205bnFSb3VQUWRpcUVx?=
 =?utf-8?B?MUFmTHVZdU5mS0pnSVJReHI0aDVIdy9hbEhtVytvS1dvcktiZEd3SFB3cndV?=
 =?utf-8?B?ZmNmaitaMGxMTHhvV3NRbmg4UW5KNmthWStvSXQvcy82U1cxb0VOeCtKSjNs?=
 =?utf-8?B?VlhDWkFGMGNmWjlVT21VbDFXSXZ4WVZuNkpEdkNkVVgwQWI3V3pMYlNPOWl6?=
 =?utf-8?Q?nOII7ftFlUdv5fUBzz643WvnV/Mp0e4n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkhrSEpNSTlvN21mbHFDVDM1OUM0TklNcUdkTXhKYjBYUnRwSHNLZmw5M1JI?=
 =?utf-8?B?cmd1bnZUUlp4K2tvb1BMRVNpZGxwcVJSRXNIK1MwelZYaGVvK25JbmJRd0o4?=
 =?utf-8?B?WUF2SWlJbWFOdFhUT3FEQ0xQakhSUFlMcm5qL0E3b3FBVHl6TTZ1dmhUZ0Nn?=
 =?utf-8?B?Rmg5S0lHaUp3ZzYyS3NVblFBckcwZzI4TnVicUt5enllZkhIdTc2ZWdQL2xX?=
 =?utf-8?B?Qkg4dFUxTXQvWmUxWk9CSWJKRmRScDB4MlMxZS9LM3lQZHUwRThmQW53aGNt?=
 =?utf-8?B?T1FEbEtPSzEvWUVhbmx6OGZPY3RhdnhPQ25LL2J4QnVDS0Y0S0JTRmdjeDIr?=
 =?utf-8?B?WHdRVkN3QTJBcDdCc3YzQVdMcWNqRmkwbDVLakJ6cCszS0lyTmJCb3NlWTJV?=
 =?utf-8?B?cjBqL1lxcElTaFRjNmdsUEMydnRBcyticlBXYkswNGVVVGl1TFhXT3F0ckVX?=
 =?utf-8?B?eWd5WEJiRFk0S2phdGplYlJUdUtXUTNqQWwzeVgwUjQvUlgvaFJacWhUQ0hL?=
 =?utf-8?B?RndlWFdUMEttOU5ISGxpNnJHOVoxcTVaRmdtWU15d3RZUDBpWk45c0JrSlNP?=
 =?utf-8?B?bks1SkRXTGpKM0dpZFpWV0pJRlVGZmdlY09sWU9YRnV0YXo5eCt5N2dtKysr?=
 =?utf-8?B?cjZxcEdsa1pjU0twUldOMFl6b3FHcHI2NUJERkZ4VlJhVlBnbCtEc1NwVmhQ?=
 =?utf-8?B?c1J4elVoYmI1K004SFR4dWtWZ2NTbmFhSFdzMXgwcDM3V2VDZUFKMmtKc1dD?=
 =?utf-8?B?ZWQ1MXQvOVRTNXAyUFRYTnlvb2pYalNXZEFPaGZVSWNTNGVhMUZyUTFGQWtk?=
 =?utf-8?B?QmhlcEtCVlEwY0RCajZOcWg5dVlTbDY1bjRsNGs3RWprTnJ0VTFieHZ4cGtW?=
 =?utf-8?B?SVZEYk50cFdvalljVTVGVEV4OXJlNUVmajZDNS8vcUI3Zk54ZHVYSXVCNDZC?=
 =?utf-8?B?ZzI0ZzFURzJvVXkvYkIzZHQ3ZG5DY25KRDhmZGtTNWdFdlFTUXRXU1g2NGtV?=
 =?utf-8?B?OE81dk9Majdkc283NzAyVHFybytSQ2xkeFJzVnIwRDdLMktoa2NvVm9BM09y?=
 =?utf-8?B?ZTdlYTgwNGR5NGxKMTlaYmN3Ukk3cVZzTzh5VHBwWkZISEM4L1NTNHB1VEEv?=
 =?utf-8?B?bTU1YzFvV1VXZndaeWJWT25QQ1k4OU1yNjBONDU5M2pJNDgwS3hmU3I3MGQw?=
 =?utf-8?B?djd1dFdqS0FQVmx0WFUwZXdJeUV1SzhvNDBwMGRGcFRLRzJ3eG1ZZDJITzlt?=
 =?utf-8?B?U2YxeGZBWklJbkNkSnJHQ2pla055akJEa3Z4Q1ZkTG1rN2k1NU96bnIvc01N?=
 =?utf-8?B?TWVPOUtxenVXaS9zb0RhOFdWMjM1OVVTQ0YyaWFYK3FxTFc5WXNhU01VZ1hq?=
 =?utf-8?B?TjMzUnlhb0NLZ29vMGh4SkFSRFgxNjBNZ1NycFQ1aVFiamdqR2M3QjliTWFw?=
 =?utf-8?B?QnJMYmlaYWc5ME12SytiN2F1TVhBR2tJRUswVkxnNVM3cnl6QTVNam1qZW9a?=
 =?utf-8?B?ZmZTeHhEWURHMkR0WTRTME1iZDRXSlVjcEVzTGJENzZyZGV5UFZsK0J0WVhk?=
 =?utf-8?B?QXlRSFdoWVR4K21qTXNycDR5YmtwLzJaUkxlc0QrNE91bWpLazFGSERjWk9D?=
 =?utf-8?B?V3ZheW8yVWxzWXVVSkNRQktZSWRWVmN6MVhOalp4SFI4Rko4Q09xaFBLYmkz?=
 =?utf-8?B?S2dNTkEwZTVEa2dXcXU0cEpJWEdKVW12TUJURS9WdGJCZTRDbWxtc29tSmpP?=
 =?utf-8?B?VFJLbkhZOVlnaXVUb0kxK21sdXFmV1FUcnJoeGJJbXZOa0JLclZKTzZJdDNT?=
 =?utf-8?B?WjdPeU8vRlY3SWJyZWVDUXZ0V2NqNk9XWnNaZXo4aFMwb3grcWp4c1RoOXcy?=
 =?utf-8?B?L3g4S1pLSTREeThaRmxLSWpCaElsaFVmcVllR21CK2xwS0l6WFpPYk1IV1NC?=
 =?utf-8?B?K3RaczhLZzRWejJyS3ZtdEZEbGMxcXgyNWdGbXNPSkNXOGdoakd6UFdFUmtS?=
 =?utf-8?B?dmxzTVhLUEhiUlJkQlNCUjdVTkV5TkJnbldoRWNKL3ppUStFUENtYzdkbjRv?=
 =?utf-8?B?aEhBQUl0czNaMnYvZktWbzgzOWFZcnNnSDY1NUdWdWpBZStGeUd6S0xMUlY0?=
 =?utf-8?Q?wH1EBhVFw+6E6CEUVkgpdLzp8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421a4314-5586-4bf1-e425-08de1bf55aa1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 22:56:13.6977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHjoRAJ2sr8r9VTMTlhKcUDei8r1jPa82F5Hxhs8078jMYhenrz4CrGjtCfy0y3K+b2i1CtTsWspdzeHGC9YzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6565

Hi Tom,

The Destination Format Register (DFR) is no longer needed and is not 
supported in X2APIC, so that answers my question.

The question still remains open is that whether LDR should be supported 
in the SVSM.

Thanks,
Melody

On 11/2/25 6:28 PM, Melody Wang wrote:
> Hi Tom,
> 
> In the section 9.1 SVSM_APIC_QUERY_FEATURES call,
> 
> "The APIC emulation supports the following APIC registers:"
> 
> The Destination Format Register (DFR) is also mentioned in the Alternate 
> Injection spec from Jon Lange.
> 
> However, the DFR and the LDR both are not implemented in the SVSM code 
> now, so the question is : should we remove the DFR and LDR from the spec 
> or should we implement these two registers in the SVSM?
> 
> On 10/3/25 9:01 AM, Tom Lendacky wrote:
>> Attached is the next version of the draft SVSM specification with the
>> following changes since the previous version:
>>
>>    - APIC emulation protocol added
>>      - Coconut-SVSM will need to be audited, as the current APIC 
>> emulation
>>        code does not completely match the "Alternate Injection Support"
>>        specification on which this protocol is based.
>>    - Reboot protocol added
>>    - Core protocol v2 update:
>>      - New flag to allow fallback from 2M to 4K during 
>> SVSM_CORE_PVALIDATE
>>        when RMPADJUST/PVALIDATE return size mismatch
>>
>> Please review. If there are no or only minor comments, this draft will
>> become the next version of the specification.
>>
>> Thanks,
>> Tom
> 

-- 
Thanks,
Melody

