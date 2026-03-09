Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6148349AEE
	for <coconut-svsm@lists.linux.dev>; Mon,  9 Mar 2026 18:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081567; cv=fail; b=r/7I7kImUXmZsoriVJ06ejGHjKEkRcJEip8J0Wp8XFEXJZPzG/9ZNFyxcPM+U6uMLEF6RS1bvwlY2Nqv2+lL6AjMjVM9tYaZRoD0X6a9c+l/N75Jq3GqsWCPA+CKzENrIM7mEfcagEG63LSIA3lzfgh0AQD/qTKZFQLuYJl779I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081567; c=relaxed/simple;
	bh=IJty3T2V84l7ZlRecADMxv/FoX2s845dXyikNbGtHFw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jov9Ea7aMuheObl326DA/zLka7tCKCssalG34Xz1Q1HCaLAbPd4lQFTj5K/m3RAVwKLGl1yamxuzSNu3++66kkRwlOcvAjGvyGNtASlZ+ZmGDpBFtBtWzb7XRl1OtNCPtM9mJ8Hng8wNH9Rjahag9ZrJNcusyZBytOhunzZel7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I2dQSF9B; arc=fail smtp.client-ip=40.107.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I2dQSF9B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbfSGBi65vLoNHM1F6Ow1/oszRHF0WQ2GbXY4+aDfhb37sh9mmaDiZVvPI4xP+eqFLVxS9tuRyNBq6NDDC7cIy/fViVzynFtMJ6DWyow8qSpHrUJ5ksE2EMwU/TLyk+X3+kUILGTYpva2QEzn9kMy87l8UIxysNlAsRx0W7F19Wpb3k5LSBp+SkIIo5ILdTcIaqrpvRY+LZUMMwluIJjkZqZUMnP5mfFKVtxOVtjjke+GzLdOyidnXP+ITvT43hi+dvma8Amw0MxKpklbfRfMRH1vTEFb4UrFbqs7w37gti24tYv1Y/FVOyvUIHqmBf8ffJH3s6Y44Ps6Mz6Ev+qhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggx8w+BejejLGwkDMkh0kLIdcZaSM2TuY0sOeXv/3WU=;
 b=u/hi+2wUMWM+2NbW56q0Wz20tc5+X/TZho+HaozcrImWaFZ25HFgUlhsggf+JyBGKOQ/4EzY9zUpVwRpJ6o1lnwxppCAYGSQ2AYaXoy3xJzzkGi4qcbhYAHA6LfrsjUIDiHrdCiIidCgj8qewK4Zt3aZWoIGXs9rFPlk5LPA5yJ/+zYchTSgGqrmbRL5nrROtxVWWFM9F42q/rSSJkG2dA6uQKYmsiLgVobzP2RS3J1Ri9HQAcv4NmLmcFVRbo2s5dXrx+1TXhTle7NYu9j7guf2uttDUiBNNRMjbCFuWbrEt5kLZXGwonAee6TPBbjjynd9zM2WlPf8vSarUMN7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggx8w+BejejLGwkDMkh0kLIdcZaSM2TuY0sOeXv/3WU=;
 b=I2dQSF9B9OLkeU9PLkhrgdc49wGszW24PNqRFVccHUSw5Ke9EUILCOwoiGfR4NkJ6IojMkIRLuo1AAw6PRtZOJ8A9OaJLHTA3k63X6W1lUu1RTsnuWVMViCovopj0qYOAQW5aeLzZQvgYNIEQ2of/aXVgj++R1LGsODgdiHLn+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19)
 by DM4PR12MB6301.namprd12.prod.outlook.com (2603:10b6:8:a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 18:39:24 +0000
Received: from IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::6422:db66:8bd:6776]) by IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::6422:db66:8bd:6776%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 18:39:23 +0000
Message-ID: <2b04a2cb-7c1d-4932-81ab-eaca96d9a752@amd.com>
Date: Mon, 9 Mar 2026 11:39:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: Debug_swap in sev_features
To: Jon Lange <jlange@microsoft.com>, "Rodel, Jorg" <Joerg.Roedel@amd.com>,
 "thomas.lendacky" <thomas.lendacky@amd.com>
Cc: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>
References: <IA1PR12MB8285C686560A91EF644529919579A@IA1PR12MB8285.namprd12.prod.outlook.com>
 <SA1PR21MB6416E7DC85158A4FBB52EB98CA79A@SA1PR21MB6416.namprd21.prod.outlook.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <SA1PR21MB6416E7DC85158A4FBB52EB98CA79A@SA1PR21MB6416.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::15) To IA1PR12MB8285.namprd12.prod.outlook.com
 (2603:10b6:208:3f6::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8285:EE_|DM4PR12MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 31dc119d-156e-44c3-53d8-08de7e0b2f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	cb6jx6WhGgkg84rEnLD4u2QVW2IMKcz3W9Nr2O5OKgVfBByKLpFulahxBbl0c0VlNezaVVfitOqbYN60JLsnx2tFf5Zzmrw822yFtGFac3NVhdcgqPpUAdYyjo5Ou3YFBNfEdc5pIo8XKh728PRgzZEd64DDs+B4u6rpERawXoGDoaeXg4Sf/2TRclyIEhvCRm3wlT5YiC+SjDhXznUZ6tpamHVcBDhF1fuqf35gwSJvKM1q2Pvgr2S2TPPSjf56ghRhNWhldRhs7aF6Msrqh1ZcUh8HNmpVpQzRZpmxkIDOni7OjzGqZ9I76LuXW3iFyo25K5gr15bgr3+c5qxOIQp8mAqhkUA8nDvQvdcPC5qH1DK2Blhqn9K5izMQ5dYn4LCYJQdhOfoW80kD7Y7sXwPPWNJ55SHoKXmfKR4nyX1iIVJouRaZ3t/B0UlCh76XxuIqOhU9H8O11qR7q1szXZhT8tej0NW2ot0rvLlgiXcYuThYQ3c0JMF+y0BGKtDuORNbueJGm1dBUva6jm/1TvIFNnwqaJm7i+Fvc98LSEvBvYzd8GG6rhb/eFWs9TuZsTJ+cITD8fZHiOml/fih2CWPMiKS0a8ah+r0qtNQ85Ta/4GCPEBm8xCc+m/YUh6h3TxYbbBlG2qNsO+8lwVwXZCbubU1AiKDwCVScBtDJ26HTziO+7CrR403KtpffL6EmQHx537kQQYR90dkpA4fHRl7hlaVuCjHgMCBXayhwJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmQ5S1I3WTd6TUEyL1djMW1lVStxWWlLTWRKeFRqMmNieXZFV0xrSXliRlpX?=
 =?utf-8?B?Wm5iL2JCajBIc1hPYSsxUisvQlZDTFVJajlZTVZvOVlIOFg0U1MyR1ExeTZz?=
 =?utf-8?B?UUYwd1FHeTJuYVI1dHJIaHQ2ekYvdU82MlBBcEdpS2NsS2lPODhUZldjQkZt?=
 =?utf-8?B?OGFrelgxMEZRNkl5dkN0ZW1DMGtDRGp5Z2tZaFlnMlIvNlRXWmpHTTMrV1hY?=
 =?utf-8?B?Z0hlSGhNY2h3T24vU1JaSDJPMTlWcExHcHJOMnZQUGJGR2s1TnZrU0JncTVU?=
 =?utf-8?B?YXJvOUVKQm5ZVVdJVE51SW5OSTRGWDJjZUl0bDVwTUdKOGVDOEMvWVB3VEZL?=
 =?utf-8?B?VUk5aXpzbGxTMG05Qk56NVoxbDB6cTh5QmtvTGx4UllCZEhXZ3RHbERYV2Nq?=
 =?utf-8?B?MFpFbm1PbXVBN2Q2cTR6UkFyRTNna1ZkYnNFRmdNWHNzb05ZZHZKWk5aMkh1?=
 =?utf-8?B?aVZQTC9SM0JZeU9mUnlTdTZJcEZobk96eTJib2xJS0Rjbmh1b0xkZ1VUOXNN?=
 =?utf-8?B?NW9wck1hNGR5TDBzTnluQWtrQ3lYY3VzSlFadThUYjJzRHVHSG04bmhHbXhH?=
 =?utf-8?B?MW5wZy9EOTU5ci9xVUNkQ2dFWWVUbFh3RHMvZldKNWJqS1NaRHRFTUhSWEZL?=
 =?utf-8?B?cEpPT0RaVnh0MVl1SGJ2RGZCSFIvVWMxOERsbGRDSkVVVjgzRUl5SWljN3Zz?=
 =?utf-8?B?bUt3LzF3ZVVnbkkzY2xKbkY3OEJUKzh0NWZVbk4rb2lwUVpGUTlCSi92TzhD?=
 =?utf-8?B?clJkZk14ZjRmbks0YVJIaUNXUnVUU1FrY1BIeUVyUnlneDJpMEIvV1Y4dW9j?=
 =?utf-8?B?UXhVM3IzbFRYc1pDY0o3R0NDWFlvZ0pMdGUrbnRGWW8xaG9iZmRuTlJESnNu?=
 =?utf-8?B?cjdCSUp1aVFwL1RibzJBQ0F1enVvdmFNY0NGL3hwWGRGVW5kMm5wTzg5dVRr?=
 =?utf-8?B?QS9ONUd6VHkweC91YVlsd3phNXQ1Qnl6QmVqZkNJeWZna0I5Nm5hVkJFV2dH?=
 =?utf-8?B?UEJwM3gzdGFaUUptTFhDNjd5M04veURSQUpmcDkrWldRbWc1Skl0bCtiYXRU?=
 =?utf-8?B?WmZNcGI1VWpYR2s1ZkpodnF0b1JMK1RoalRhYWt3MDBkLzhubVRnVEVFTHhq?=
 =?utf-8?B?dUhiNHB0bjRoT0dRb3U3MEl1MzN6NUJIcXpuOUYyVEUwcGJ0VUh0cXZMOFNt?=
 =?utf-8?B?eVZEbEhydnE2bUpVaHZ6Ym5QZ2o2VWFtTmNMOTZGN2F2WEw2T0xwM1EvcHEy?=
 =?utf-8?B?aVU4MWM2Z0I1d0kxS1ZLY0VDYXVuMGZIOCswUVpwMTkvanFOOFpBTThhQnhq?=
 =?utf-8?B?YWlXM0FiVEJrdXd4dWZ0bWdqVzNsVzF3MGs1R3V5dE4zc2kyQm1DejBPL0hl?=
 =?utf-8?B?b3VEZ2QwS3I3NU1pZkYxTWJtTmJ1d2VtbUxEL2tIbmlLYnhhTXBJSVg3WUJZ?=
 =?utf-8?B?TzRJTDNkcnp4djlMdFYvSHpXL1N0ZWYrNjR2VDY5MDhlQ0dNTENoNWIwZ0FY?=
 =?utf-8?B?Zi9idSsrb3JvdEtNYlp0a0dGU2M1MjVETDQyZDJRL0FkMFV2Mm5iY1F1TDgy?=
 =?utf-8?B?ZVZaNVJSclBzbEtGRmE4Mnp4TWNzTm9zcDR2TE9JZkJDSnhCdjhIdTJweS80?=
 =?utf-8?B?M09uYVNmcmNIVCt0Qm9wUGRURWdFVTRlY0lrd0RpMjBTTzdXTkpnQmozNVBG?=
 =?utf-8?B?U1lGN0lYRjRGdFhnMC9iLy9QVzV3L3Q1ZUJCbVVlOU40VGw1MTZNald6Ylhj?=
 =?utf-8?B?Sk9rRGpweGZjS2xORGJLZWk3aTRucDBtak1PRmlNRmJvV0xtcitDYmtweEEr?=
 =?utf-8?B?bGhpR2lxdWZtWlRsVmg2V1QrWWVvaFI2QThvams2aEQ1bElpSWRQbXJpMEpp?=
 =?utf-8?B?SjViaGRMVVBVSVQ5SGNWOTltc2k5U3oxUE1BYXBFWmJZUnk3SVRBZG5qQlNh?=
 =?utf-8?B?NC9Vc1ZyeUdJMTFINCtCUkV5Q3FEWm90VTNoYjArenhxR1BFbnJkSVZGZU1I?=
 =?utf-8?B?Y2V2OTNvdXlqVWJtdk00Q1lKbFRPUXh6MmV0bWNTS3RNTStOc0RkeCtMaFRz?=
 =?utf-8?B?c2hrdEhpeUE5c3VEOTR1QnFRVzE2dHhqbDVrQnZWTkpPZWFBZmo2QjRVMTZZ?=
 =?utf-8?B?MGtuSDl0RlU1dkFkd0dlaHFjWWwzcFc2aFRTUS9DWDlRdmNHdmNocjRjSE5H?=
 =?utf-8?B?amVGSXNHVG1HdjJpMWJhdFI0N0lKSGxDK3U2VWFrN3E3QWlDaGpySDlKM1V2?=
 =?utf-8?B?NFJ3TmErSFN3T0hxNUg1MDRKVmhLeVJ0WG1wSWpraGpZNWlsNDZpUytVMHU0?=
 =?utf-8?B?RkhaMEFDTlQ1ZjJKM2dMZVh6ang5aktVNVhZU1F4R3pKWXlNTlJ0UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dc119d-156e-44c3-53d8-08de7e0b2f5b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:39:23.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUV+8n7yP7YUESD3n0l9orPn2OLRybrH1j+mPt6/ajzdgO9ixmg/1dx6Dw5V3K6ALWzw2zpS/8qoo+7NyUz/bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6301

Hi Jon,

Good to know. Thanks.

Thanks,
Melody

On 3/9/26 11:35 AM, Jon Lange wrote:
> Joerg identified a similar issue at one point about consistency of SEV 
> features across different VMPLs.  I believe he had an opinion about the 
> right way to solve this.
> 
> -Jon
> 
> *From:*Wang, Huibo <Huibo.Wang@amd.com>
> *Sent:* Monday, March 9, 2026 11:31 AM
> *To:* Jon Lange <jlange@microsoft.com>; Rodel, Jorg 
> <Joerg.Roedel@amd.com>; thomas.lendacky <thomas.lendacky@amd.com>
> *Cc:* coconut-svsm@lists.linux.dev
> *Subject:* [EXTERNAL] Debug_swap in sev_features
> 
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi guys,
> 
> I am working on PoC of Alternate Injection with Planes support.
> 
> I have run into one issue where the AP_CREATION for VMPL2 fails.
> 
> The failure happens in validate_sev_features() in kvm as it requires the 
> creating vcpu and new vcpu have the same sev_features, but the new vcpu 
> does not have debug_swap enabled:
> 
> [2561459.191929] kvm_amd: kvm [675275]: vcpu0, guest rIP: 0x0 
> validate_sev_features: vmgexit: mismatched AP sev_features [0x11] != 
> [0x29] from guest, vmpl: 2
> 
> I checked back to the SVSM and found when the guest vmsa is initialized 
> in the init_guest_vmsa, where debug_swap is removed, the comment there says:
> 
>    // TODO: find a way to make this optional so guests that expect debug
> 
>    // register protection can achieve it.
> 
> After I commented out this code:
> 
>   sev_status.remove(SEVStatusFlags::DBGSWP);
> 
> The issue is resolved.
> 
> This works as a dirty hack but I thought I should let you know and 
> perhaps hear your opinions about it and what would the right fix be.
> 
> Thanks,
> 
> Melody.
> 

-- 
Thanks,
Melody

