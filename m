Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012058.outbound.protection.outlook.com [40.93.195.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98F3DC4BD
	for <coconut-svsm@lists.linux.dev>; Wed, 11 Mar 2026 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773250591; cv=fail; b=fBY79KA/20QLj4L7hOk698ueJh0434RW7bUgbUvb95F7iyqcfEHNKxR7lxp9cqk7A1BfHQSARsOhusHk0Ni9Oa3At6OFOU2gXQ8QuWMMziw6gc/nOA01lYR3SFT0wLSwJDjyWe/faikQf0cRdF0VyMKvAFz66jIykJDZkZjtz2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773250591; c=relaxed/simple;
	bh=PCOPAqN3fY9heuCu3n4CvX+DLo4srfVdgC6ijyjmhuo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nWSGckmqOLjE2t0/0ngYjq60CIt4wLiGCGwS87k1OzUAViq43jl1gN0tYaRexbHrGYG2t9Z6WWPA/+3lptfeEsBqtrajjMDgQa4vUiZKzOVv7lKVt7pLsiVA4WklfXB8Y/T4ft0JaGiBQkYdZ6XIHll/K09PdzH4MUqnjRkv6+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rMIS7t9Z; arc=fail smtp.client-ip=40.93.195.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rMIS7t9Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9kEK1qa+5dB/wCUfXHaip4QhdfA1VcLf+TXX95uuWE49ekbENEO50ZuIy/MffWayNYfOVOpGhYv/Rzsi9CQUkDcgI9301nYVGI/vIs1SAKeaDo64vcz/KC2F/uhfxrA7+DHIJeJ6u9K8akalDiolWhBEAQbtB6a8D3jM9+IkT8cFV0twe4LBp0bUHDMlU+Duys9HVaIQisdihh60Dfl5d8O374IPc+s/Xwwy4sNzflLxL4l4nbBebjhT9anbtDudUemPShj6K6Hs1YACsq69/cSOVGdk+FcYNPMrMuY91SWFmphlNptRtlc9BTgiVj33uTA7EpE3bWIJ0Fmk7Tq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVI2BobDexp6sSs083AkPE1slThlcnB7evWU2ltnBSc=;
 b=Kg5syYvI2/hvtKOT85YErHcSEKsKdWZXnJKRI6m7vvzvqwxNRw67iPy+vHliIDBgwiVZKgoeuO3zzU1z8EBlfpgWE0v5Lax0Z+bPjG/WfUmp9SALcIl1oA7J191Mj31t0RR7GjyJGcbO55qBB5Nn+7mB9bSwNSQ8L/iha1X3mjK+qzbWoBI/IBrFADvpbVwSTHjiCk6F6PZAOoYH8JTIMmAmiIYzNG2QN6/Swt7lGyMBlOEIlD45wTS9fr4VIRJt/vPZKk5Ro4ZwmU7N1tAWhjwR9PAmCoQXsgVUaafRRnIxfuTFJPYcZ8rtgGz6qDoW8U62gCuT02jXDmcRPTw93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVI2BobDexp6sSs083AkPE1slThlcnB7evWU2ltnBSc=;
 b=rMIS7t9ZECVrRR6B0MSz11AYq/r7+wCsigs40rYvQ36JEdlg+nQYhDGAVtH+IdPM8aC/buniVc0wUHUQ4vRNiZRVa4WwJsGu2v5bLxciD75H4i39gatEkgi3sG4wDWfX88L/yHC8f89ZQ6C8i8M9APcaYrz2JuBk3ywqWl74wfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by SA5PPF9D25F0C6D.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 17:36:27 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::f3f2:852c:78d5:9353]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::f3f2:852c:78d5:9353%4]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 17:36:26 +0000
Message-ID: <9f9753ab-1d90-4c0d-a309-f162f929a52c@amd.com>
Date: Wed, 11 Mar 2026 12:36:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Debug_swap in sev_features
To: "Rodel, Jorg" <Joerg.Roedel@amd.com>, Jon Lange <jlange@microsoft.com>,
 "Wang, Huibo" <Huibo.Wang@amd.com>
Cc: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>
References: <a43b6177-1b69-4369-84fa-7a3a596ba580@amd.com>
 <SA1PR21MB64164C2337DEAF85CCE9959ACA79A@SA1PR21MB6416.namprd21.prod.outlook.com>
 <PH0PR12MB788719376187484D48D4C1FD9347A@PH0PR12MB7887.namprd12.prod.outlook.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <PH0PR12MB788719376187484D48D4C1FD9347A@PH0PR12MB7887.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:806:d2::18) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|SA5PPF9D25F0C6D:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ac24e6-1a72-4f96-2967-08de7f94b8d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	U+otjktcFGWx7w+KEGRiYNlwYESWHVeRj21ZE5VTBEisxBy17D+fixUxa6I9ZiL+Y6LNL6HepH/gGfyWbQiIBbw2qVbU10U6lMiZEqkA2AHZvebTAzEVUpFp3t8kOqPl6tVvzFV9YW8DiSLrnK6cC8xM1cn12Xty43LFTZ5BK08eKPITPuWGFpTKOGB8qk/oCR2v8IG8h3dofJ+vIRrAZpa8Yok6lYDPa/10DazyanRi3zceECVwpOQJ8t/zZKebebGRrUKwokCKhzFLd5tVeifUrIX8ywiEVYYdi3Ks+qIG4CkRvd0GpbozuynxRYjrBwReTpRAEBooKFXzHEQCZ28yz7JnEYr2ddgQEN3aGKAZI/r4/rkJ/g5KmYAPwvsglWSqbtsEU+TJA4J/cCL7hBSn3FbYr5Kb5NAYiaSnvjXYP2t+Pv7mc3MspHA3vc02cwdnYyOyXKiV8eEk7RVEJOtmFY6nu4uYitkj5Vboi8IKyeFjMKdUWwYU5UtxFWVoZlD2kNL66u/Xb2E4dO42abDj/CdmHhw8E4LVIPizzXPoimxoW7BIo6OPRqLy6eeofOahBATqslPXOo9BL/OrDAeO8XBFY2pARjubM7qgbN6pzTcXzhyAfauJTZ2JwxrGsd5pi5WWHhidX1UZb9dRxy4kKDeZ5YyRzF+d9dWe3lhs7ddsy4hNwKOoZWeb3+xEC03aHzPB8eNMxjALmm9H/fl3EMIUEj33At3S0+B3KMg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFF2VFd1UnY1QldKM3dGeGRjc0ozdzVFT2ZBWDI0OXc3OEFySDhZcU9BKzMr?=
 =?utf-8?B?L3VIQ0R1QnhnRFNxdTdqTVVNN2gyZEMzcmVJbzkvcW5ndXdaQldFYm0xc3pM?=
 =?utf-8?B?azZVY3hYZHNIQUZzRjF3SmhJRG04bUQxYUtPSWtHU2RoUFAwOXpwL2wrcFZs?=
 =?utf-8?B?R3RMeExjK2ZVRzcvYXpnOXZTL3k4WHpTYmMxcWllWnpBUTcvRnBkeFVQVDdF?=
 =?utf-8?B?ckd3UkMyRkhnTk1SSUhNU2toOEZQczYwa20wNmsyQTVnRmFiYnQ3V29wWnhr?=
 =?utf-8?B?NHgwaUxiaVpqc0xVejBGV1E2eHJnTytHT0lpcVBjQzluY0NGOEZCdFV2MXRh?=
 =?utf-8?B?WEFVUnFyWU5QWVAyZmhLYVJKUE80dlZIVTl4NkdyOUpVeEwxbUVlUEdJR1I2?=
 =?utf-8?B?R3A5bmVOTG5VSGRJV1NMZ25weHJaT1lPdGlHOU1CSmJjanA3TmViRytlWCtO?=
 =?utf-8?B?SVFpTXh2czdpZ2VSdmh2QzJ4aWNiQjNrandQdWE1ZWxNV1ZHV093ZGgwc0t6?=
 =?utf-8?B?bFh3VXhsdGYza1RLMWFWanJDZmhJekxyMi9QeHdhY2YvOGRsY0tjK1hieDgv?=
 =?utf-8?B?aWVnVWlnd3BEWHZuODBFTVc4YmpTUzdGajhBcFBTQWovV1V5QXJhSlM4RzRZ?=
 =?utf-8?B?aEViSERlaWJpN2hyek5jc012MUpLSXArRTZMYS9OWkNRYmRVcDh3aVFkSWdN?=
 =?utf-8?B?cnAydGpvS2x1ZDl6MmFOSDZOQk9OWVhSQXVMRkJoOXFEalRmd0JmdnhNUmdk?=
 =?utf-8?B?Zk1JdnprMEJxRFg3cFJlNkQwZ1MxMi85bGdnMnFCWkJUMFREcURlTlViT1V2?=
 =?utf-8?B?WXo4QkgyU2M0LzdRbUN5ZmM1b2ZMZTlOZnRhbjhLMlJuR0FDT2FxZkxrTjJk?=
 =?utf-8?B?Nk92aWZEMW5mc2JyTG42R1MvbzdHT055RjE1WXFjSFNmN2tIZ25BL3JPMXJM?=
 =?utf-8?B?YjFvcDhFZURrbHJjUlJGb0txQk9BZitLc0ZvalFNQzZ0OVNGQUdVeDRHc1VP?=
 =?utf-8?B?MjhPOTVWeTE3dGlUZXFOaUwxeG16dkI3akxReC9jYzdRaDFpaW9uT1hkejA2?=
 =?utf-8?B?UU1uRlFCbTBYeUpuMzU4L3V4RTFjWmRDWHovRDRZdDNVZm9MejRmdnhEM2w2?=
 =?utf-8?B?VUEyMm1yQ1MzNEhONnJFbGREKzl3UVd2RGQ0dFdOWllNOFY4eEpkdzhnU2N2?=
 =?utf-8?B?clBpNG9MeXB4OUF6TVEyUU53K0JISWhkMXJuVGhVVnpTcVN6c2J4V2dWcTJV?=
 =?utf-8?B?TFgyVXZVRXdZd1J2clVTSCtKK1BQQStJMUthL3g3TGZWMmFWSnp6K2VFck11?=
 =?utf-8?B?NHQwVTIyOHFpR2Q1d0Jtd2JlL29vbC83R3l0M0sxNlozR3hoTWRTR09vQ2tG?=
 =?utf-8?B?MGtnV3hvVzI2S2psMExSTkNLSHhhNUhYaGVyR2Z1Rmk4T2EvQ3gxamRXdWNI?=
 =?utf-8?B?VU03Q2RGbVU3UnFxWHprRmVOTEJJZzd1U2l2d0ZlQXhVc1AxdjdaWFB5TGxv?=
 =?utf-8?B?RVUrWm9YajhNM2E4SGt1VjlhK1FUY2xNcnJwWE5Sc0dZUU1Fc2dOZFR3Q2Ni?=
 =?utf-8?B?K3RuRythd3NWMjRvTWtXeWJROWVKOE85MCtQQ1lncFM0empNTldGZzVTTkJp?=
 =?utf-8?B?d0d6aG5ESVc1S0QzV1JhQjNrRE1EYlZNNUZ5eU9JRlJvbFRaYXhzaXB2V3da?=
 =?utf-8?B?YjVHSzJxTmRib01tOFR4WFM1cnJlamg5OEZMeGY1QUkzeEIvL0hvVVJHV2N6?=
 =?utf-8?B?YTBjbTNmRlV0b1F1b2thbFM1OWp1VUlqaUsxbzh0dHdjbkh5ZzZ2ZjJDeFFU?=
 =?utf-8?B?c0RYQWJmNkM4cmZpT1U5c0F5dHhaamxPNnhEZFBDVEVQSWlGQXVWanFYZUVS?=
 =?utf-8?B?U1JOOURiVXR3YnNGbFVlQXJ2QjhVVXh2Sk85aUhuaVRtMDZCT0JrRXlXVFZR?=
 =?utf-8?B?NGR1NHRRcHh1UGdKYnk4di9kTjFucGRyenQwS1lUeXF2ZFZVbzR2NE42VFlz?=
 =?utf-8?B?dm9sdjFGanpLd0cwalNwMll0eUVrRENueUpUQzFQbWNzcC9wcHhrSTIxSTVT?=
 =?utf-8?B?QkFnRGU5QlpjNTZ0SGpQa1dIMVF2cWpvaGVDRlJSVVFQVHdmVURrN3pac25I?=
 =?utf-8?B?UHpHcDlvSGg2VHgrb01BNTJBMk1vdk1QZW5PNVZwS3luMmh0R3MzYUZXQ1Mw?=
 =?utf-8?B?SUFIM2tyRHdmNzc0cnB3ckxzNWxTUHNLcTdEQnQwSzZSRENhQ3A1RHR5TzZC?=
 =?utf-8?B?Z0Z3RnJZN0hhR2J5SFRkVmVFNFJkY0xoeEI4SkcyMVhITVpNbVVNaXBCdFh6?=
 =?utf-8?B?dTF1aEJnUS9qd3pMcGJjd3A4T1NCVVByT0VDOC9LWmxXK1dEMFVKZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ac24e6-1a72-4f96-2967-08de7f94b8d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 17:36:26.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rj+c0N7mZ7hjFZsf5BTPRZYSRMfmatsrzRzt92jA1UduNI/cT3ar0sWbbFb/yiI9KuEm/CVKOy2o2u7JA9KVCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9D25F0C6D

On 3/11/26 11:51, Rodel, Jorg wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> I think the problem was that OVMF does not expect DEBUG_SWP to be enabled, therefore it needs to be disabled in VMPL2 for now. You can update your KVM branch to accept this configuration (or live with your hack for now until the new planes code is ready for testing).

Actually OVMF does support DEBUG_SWP.

I think the issue is that the VMPL2 VMSA SEV_FEATURES is set with the
VMPL0 SEV_FEATURES and so the VMPL2 BSP creation fails because the
compare fails in validate_sev_features():

	mismatched AP sev_features [0x11] != [0x29]

0x29 is SNP_ACTIVE | RESTRICTED_INJECTION | DEBUG_SWAP
  which is what is set for the SVSM.

0x11 is SNP_ACTIVE | ALTERNATE_INJECTION

Note that the comparison OR's in RESTRICTED_INJECTION and
ALTERNATE_INJECTION, so the comparison actually ends up looking like:

	0x19 == 0x39

which is why removing DEBUG_SWP from the SVSM work as the comparison
ends up being:

	0x19 == 0x39

Thanks,
Tom

> 
> -Joerg
> 
>> -----Original Message-----
>> From: Jon Lange <jlange@microsoft.com>
>> Sent: Monday, March 9, 2026 7:39 PM
>> To: Wang, Huibo <Huibo.Wang@amd.com>; Rodel, Jorg
>> <Joerg.Roedel@amd.com>; Lendacky, Thomas <Thomas.Lendacky@amd.com>
>> Cc: coconut-svsm@lists.linux.dev
>> Subject: RE: [EXTERNAL] Debug_swap in sev_features
>>
>> Joerg identified a similar issue at one point about consistency of SEV features
>> across different VMPLs.  I believe he had an opinion about the right way to solve
>> this.
>>
>> -Jon
>>
>> -----Original Message-----
>> From: Melody Wang <huibo.wang@amd.com>
>> Sent: Monday, March 9, 2026 11:36 AM
>> To: Jon Lange <jlange@microsoft.com>; Rödel, Jörg <Joerg.Roedel@amd.com>;
>> thomas.lendacky <thomas.lendacky@amd.com>
>> Cc: coconut-svsm@lists.linux.dev
>> Subject: [EXTERNAL] Debug_swap in sev_features
>>
>> ( Sorry for resending, had mail issue. )
>>
>> Hi guys,
>>
>> I am working on PoC of Alternate Injection with Planes support.
>>
>> I have run into one issue where the AP_CREATION for VMPL2 fails.
>>
>> The failure happens in validate_sev_features() in kvm as it requires the creating
>> vcpu and new vcpu have the same sev_features, but the new vcpu does not have
>> debug_swap enabled:
>>
>> [2561459.191929] kvm_amd: kvm [675275]: vcpu0, guest rIP: 0x0
>> validate_sev_features: vmgexit: mismatched AP sev_features [0x11] != [0x29]
>> from guest, vmpl: 2
>>
>> I checked back to the SVSM and found when the guest vmsa is initialized in the
>> init_guest_vmsa, where debug_swap is removed, the comment there says:
>>
>>    // TODO: find a way to make this optional so guests that expect debug
>>    // register protection can achieve it.
>>
>> After I commented out this code:
>>
>>   sev_status.remove(SEVStatusFlags::DBGSWP);
>>
>> The issue is resolved.
>>
>> This works as a dirty hack but I thought I should let you know and perhaps hear
>> your opinions about it and what would the right fix be.
>>
>> --
>> Thanks,
>> Melody
> 

