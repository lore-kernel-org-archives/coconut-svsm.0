Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012061.outbound.protection.outlook.com [40.107.209.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF7D36165D
	for <coconut-svsm@lists.linux.dev>; Mon,  9 Mar 2026 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081359; cv=fail; b=DN3blPi6gPhABypLWpTi58UxrnwHMImTCQa9+w78hHlDYdhMRCabeCJVdH4Nbh79AiZKeNe83Wj4T6NHuiz5SAuvVK6CCroxnSENVgK/cmZJhi2CyGJ9Vv8emX+ie1dc99FK5aXglhpOtXu/cC3B6KFEACpDIapCENMUCFaEhxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081359; c=relaxed/simple;
	bh=jYBuewB2WHPUVkyqy+hTFQduSJQ/7ZKRt1CG/B8TG2A=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=fzZoKyPYbVM2eFSnlNq1+ddks7IE1Yr0Pl/2RstS8O5oxNag9D04fsIiKkQdePDwTY+hkIP2vbBdNQULKVXAc1JLe9CbOA8R9IgjS5GXqhX3VxD6V3EE0aB4viBG42IA1qZxZqs4tuMd/31jOPRHY0nzeEYrvTBOj/AHgQVYjOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1H+zb3rh; arc=fail smtp.client-ip=40.107.209.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1H+zb3rh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnqTZnM/2p6+3SXzQXRbf6gQAc3/RnICxGZ7VsWUFwcTbTGge9jxfvblD064Br+vLSNzdmtMy2QHvqqEx5QZ1GngkYt1u1uSAp/he/dWRtrmkHZp5Hm3hub2YMNNtnNFvhJNtgFPuoZxoeOo+RO2zw61RXze56Q5n+XKnisUfM8FoU3VtaDpGsT6790P7Mwvqa6X6d+vLAj53JhJLHdlwclJwkBBa8MN7vTD90gDL5QvUt1louezrVfLHc2EpvOG+IrPc0Ht2zfICCFSUy/f1vKW6sihVrzgKWGAN9Hq5RJg+2w6SGJtFsfu26AqZsc50nuY8r6HMuyBBSPnAm60vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0U88QgNUTrcjLlLK0zDSnlH5h3Vn5hWL1RzPySVd+Ro=;
 b=V0iCMwTzz+SGzd9LpcBhKxJVDxxg7fhIdwuuSqiB7aqzfBsYMzYTbC/h0konaR5AlVNsFWQACTNDEmOeoAH83Ij45nWWYB4tCad6ak3IkCLe41lmf4LSHOkMwDA6Hx5w0h98sN/CCr/xMXc7GUQL6rXeDZAC94uZqXY2FK+xyPSIBVu7MNPgDA917fvFa58orhIeIlWw84v8Dkyv9GHr9g1ym/YIXL16Br1JSABFnHTJQty2WRJMm7rQvjrPEl+k5iZMiHAbQjO4uUOBITdR0ijSaLkajkRhJ+5asZcDIKrFAcd8sWyHH88n1/EZC0m7ghsUDhxk8rqyzizFYJkgOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U88QgNUTrcjLlLK0zDSnlH5h3Vn5hWL1RzPySVd+Ro=;
 b=1H+zb3rh7zq+DCJSKbrsTms72O9HEAfWKjnM69hRwgURYeXfZundbjSlFhDYBQqihWhAJfsGf/SibV5wEwMj/YIKtRXXkarU7bWkleL62O2osBAl0a98DwnD646YGUP6ZlS8O8H06pEUKwnYr5uvkl2yD7WYJOw92X8okfvsAJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 18:35:48 +0000
Received: from IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::6422:db66:8bd:6776]) by IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::6422:db66:8bd:6776%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 18:35:48 +0000
Message-ID: <a43b6177-1b69-4369-84fa-7a3a596ba580@amd.com>
Date: Mon, 9 Mar 2026 11:35:45 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jon Lange <jlange@microsoft.com>, =?UTF-8?B?UsO2ZGVsLCBKw7ZyZw==?=
 <Joerg.Roedel@amd.com>, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Cc: coconut-svsm@lists.linux.dev
From: Melody Wang <huibo.wang@amd.com>
Subject: Debug_swap in sev_features
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a03:505::19) To IA1PR12MB8285.namprd12.prod.outlook.com
 (2603:10b6:208:3f6::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8285:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f729eba-6cea-426f-1a69-08de7e0aaea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	m1+9zFjKbyuzOO6bus3YIbZoKo8lJGvxv143t2aiKvWRsNPNlGD3Vg1+QbmMzaYkWw1SoTbsbs8A9Gqn/BFV9JJ0YqxBcjKhpY4gxU7N9fP879mtMxp70rxznZm6x9FU2laJO5xbpNULxxh2YcIEYKzHoaMrVB7bNFZmUNV1VZM8OH3job9NgWBaxkYMCSjRcG8LuNCASTviO1+QyRSgCK0N3aNeO1LFOYCLywKuE9d76Bl9EDE9cWymYBiGHVj8RlgO75hVB7uZ5GxwcwGVAXMXrAaFs65p/WWpDUKX1QmEWL80hwE85Ta9JLQuerkbh40hDviAAwEondVX1NCRve4rQ6jMwANv3oISHb2rA4BfAN+MGFvigWjt+5X2SjgYMVg/N9hJJkQjIHwUr/NDhde71KE3HHFg/4a/g4Rd5x3vAqH0BXicp5aE2UlZmKBsmOwKL3zcZOdVk35FccjY+WpvHWJte30bFCsKWDtVUPNKnRiDps/he+eS95ZjQ4NqkC4+Z+v68Jks+xUETjGU1Ckd42yozhSME+DtaFML8DWEQolF/cpGcKaoaivf0xcLL8s2y+IHPRrM+NOzJLnNWMzhyQheMvmX0xWzlUnyBXUPV+LA0Mc35cMzN10/xOxzZfzp3Y/JoCo8MsoXUMi9H/yZvomJjn2iON6f/apAMA7kcq5ar/yC11DuCzVKjdg1SZDpIsQrvJLLIMpyG1s2r1BGf9Y7TDGSPgZrQIxFy+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTdsclE5MXA3SVFsRTR2OHUwT0R6OUFZNU9SSXhMeTBDMWVhY2RvK1VDOGRN?=
 =?utf-8?B?TjhycDFtNVpwalFib25NT3lTWkI4USsxcGRZOGVxK1drc08vME1zWW5OQTUy?=
 =?utf-8?B?Q2lCQUJaNXAxbThrTVZVdDdEV3JvNkx4c2Q3R2h1SjUyT21KYTBJUGFqUHJk?=
 =?utf-8?B?bHY3L2xORXZhaExzellKUzAzd1BQUG8rWDFERFFxZFdBVWhyN0RQdzA1b3dT?=
 =?utf-8?B?T2UwVU9taG0vb1RxWXBZZUF4RDF4ZzdsUzVrTzJaYnJNd290c0kwMEUxT0tW?=
 =?utf-8?B?ZEtZWUs1QmNMT3c3U1dQRnczV3N6M1JFTjlXcEZIajJUQkFhOHZQNHgwUitm?=
 =?utf-8?B?VS9vdUdaNTV6bmxWcVBjOEhWYVJBWUFRU1d4cEM4ek5LeEZJcEd1cVlpN0du?=
 =?utf-8?B?b2pwZVVrNkxYNjlxczJGYWZBNXJLZ0ZlTk1Nb1BsSjloejJXWnhSQndPMlR2?=
 =?utf-8?B?Ym5kTzU4aE1oNERtMUJtNE1oZDZqaWFYUUgycFdGeTA5R2FwWENZVEpVUmpu?=
 =?utf-8?B?MXFRb3cyZ05wYkpjMVZyWXplZDV1ai80RUo2d2VjUnUwbU10WHgrNU1FZ0F4?=
 =?utf-8?B?TmdFWkJ2QzAvdFE2V2NlZnVkOVhUcFVJOUdZY3FaRlVlNzRoK0Q0cEYwdHFz?=
 =?utf-8?B?U3gyckd1dFo5OWVDcHJGRTY3c0s0YmdWVWNISjAzVmtrTHJrckRDYkZUcitL?=
 =?utf-8?B?WTJxYVF6RStZMXZ1TWdvMmdDdWpadWY3M0FMYTQ4VlozaUZtTXptWEMyNmNp?=
 =?utf-8?B?UmptN3JPY0UwU3N5aXQ1SG5SdldWdDU2bURGVkpzRGhXOW5mOUhSWEUvbTVL?=
 =?utf-8?B?WW8yMlNpcEJ5N2JZOEFwSmF2dXM2ZDhxWmlYSDZMNG1MOXluZEcrMUkvUG5u?=
 =?utf-8?B?WVFLMDkxVFMya1ExZkJoZHIycnh4SXZFV3RjTW9yUFI1YTlVZi9oeFpyaDM4?=
 =?utf-8?B?T3BQWUdSOGlSR0hVc3Q1SENyZE1aeFg5UTNSbWFHWkdoMHVQVjRvRzVuV1BG?=
 =?utf-8?B?ZzJ3UTd4U3Uyb3ZsbFBCK3dmbzBIVEl1S2pDTEFBRGMycXB2T0k0NlVTcnVx?=
 =?utf-8?B?YjVodDNreVZBYVkwSURQTVQyNEV4cFRidjAxQjljZnR3TjhSa2NmZ3ZqdktY?=
 =?utf-8?B?MUI4QTRMRlQ3K1owTTgrV3lqajNQb2lpdnlvODlEeHF0QkxBYytzbHhyaTB0?=
 =?utf-8?B?WFhYNDhTWFBZdmdET3FSem1xeEhPVkY3V0VwdlZZSXZXa1hKNXNZWHZUU0pQ?=
 =?utf-8?B?cXpBZndQNEg2cmY4WmFLV1htRkFsOG10RFBhYmZsVkhXNW44eWM3NnIrQm9o?=
 =?utf-8?B?UDhWV1ZlNEdBZlF5UlFWdHZRTE5RSFE4NE0wRkFEdVhuYWNUR3IxMW9waFp4?=
 =?utf-8?B?ckJhNmRtOEltKzBhc0FjWnVxdFgrbHpHdWxMdTNVY0llaENXa01BNFZyV1ZW?=
 =?utf-8?B?ZnZFZFBzSTI2UENDKzQ0UjhMWDlIVGM3cjBrMHJVTzY4K2N1L3Y3REh2YTRH?=
 =?utf-8?B?TmdhNGMyS2VwSnpxSlZ5aDFnZkFLakF4cWMyN0IyQ0lzeFR1ZEx2RlRpWTZH?=
 =?utf-8?B?YTlNc05jK3JzS2ZDQWFUWjczS0NlNkU2R0FpMjFUQVdOSXo5QnlidlVoM3Zy?=
 =?utf-8?B?VjVzelg2OGFmOUgxQlB1emx4a0dsd1ZHekZ3eC9rUWpla25wUE94U1dSWkJX?=
 =?utf-8?B?UmxteTZPMWVTbzVBZ2xheXBGMEVpQUtMQXNVY3lDTjBFL3dZcEhYT3BvcTly?=
 =?utf-8?B?NFhiZW85R0thdGRqMzAzSnJTYUdPNnhmd1hmWVFTejFWTS8xb3BaYklJWEo0?=
 =?utf-8?B?NFpReXV3RWh5NEZGUTcwL2dCWnBqOUZkYk0wSVRua2RzWkVGWnV4bE5mNWJE?=
 =?utf-8?B?STNjcnpUSWd5aGowbGlON1p3Yk5iS2svS25VaUEvZ1pNb2F4Q2NmaStscERY?=
 =?utf-8?B?UlFDWkFrTDd6UlVNcFY3RkdSSFoxMVgwTGF2QmVnUVJ3eGVzSDRtTmtScWd5?=
 =?utf-8?B?RHgyL0FuQityU012ODMySktJMU5JV1cxaEwwYUVwbVUvUm9SR1RNVGlyQm02?=
 =?utf-8?B?aVNLWjdEbnNJd1VmSTFjZ3dYUy92MmRTT0QvOHM0WDFFcmV2LzBVU3Bib2Vq?=
 =?utf-8?B?eEx4dWtXVm4rRGhTUUxPM21nQ3Y4dFhYVVdEYmpOQjB3SjJmakFEWlFkMHNP?=
 =?utf-8?B?T3Y5VHp3VXAvWVdCT0FFdXVMRmxKY3FZSHI3SGovMStES29aTUUxbWlDNTE2?=
 =?utf-8?B?V0JtbTJzMU1QejBJclowTFpBVFR3VDFUTWh1aWRvUUg4RTAyQlpwWVhqbTBi?=
 =?utf-8?B?WHBxb3FFaFo5ZUpGdS9UOThweVpXbktTeVUwMFdsUXFDb014VHlzUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f729eba-6cea-426f-1a69-08de7e0aaea2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:35:48.0323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fGBo6vT2vMOPdy1Dw+C1V5Ijr6j2vHEiKw19AcCiYLsrkMI0Pi0CQU3UUYLVZkKQS9sgbVv97OJSedkmW/OMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111

( Sorry for resending, had mail issue. )

Hi guys,

I am working on PoC of Alternate Injection with Planes support.

I have run into one issue where the AP_CREATION for VMPL2 fails.

The failure happens in validate_sev_features() in kvm as it requires the 
creating vcpu and new vcpu have the same sev_features, but the new vcpu 
does not have debug_swap enabled:

[2561459.191929] kvm_amd: kvm [675275]: vcpu0, guest rIP: 0x0 
validate_sev_features: vmgexit: mismatched AP sev_features [0x11] != 
[0x29] from guest, vmpl: 2

I checked back to the SVSM and found when the guest vmsa is initialized 
in the
init_guest_vmsa, where debug_swap is removed, the comment there says:

   // TODO: find a way to make this optional so guests that expect debug
   // register protection can achieve it.

After I commented out this code:

  sev_status.remove(SEVStatusFlags::DBGSWP);

The issue is resolved.

This works as a dirty hack but I thought I should let you know and perhaps
hear your opinions about it and what would the right fix be.

-- 
Thanks,
Melody

