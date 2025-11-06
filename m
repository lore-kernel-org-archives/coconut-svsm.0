Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011039.outbound.protection.outlook.com [40.93.194.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0FA1DF254;
	Thu,  6 Nov 2025 03:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762400428; cv=fail; b=pgfRo/rLdw3nc7opt4C+1hQ9Zjhvs1scI/HzoZ/S5T5mBBtMSuSQ7BONexo9fk003nULgBUizNAkq6TGu5LTuCtZJX+N/5sOs6I8nQ8/GzM2ciM0GJ3vMbJEu4q4wyjCT+OoEH++HCB6mWf3sFLy2GkfjuNUgiKy1jmcyWDIqbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762400428; c=relaxed/simple;
	bh=+s6ZJpmxynzX6LMNVtJ+PaEmyDz4J9eHFIOVMraiOFk=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QMwh5vYjOiBzzWQ7pQ3A2OGSqEgsH8zFKFFJflE187Mpr6LjLARa6kuzgCnCvHBWL54PdYp9EfGGrwBrTP0AanMix0Mfr0dZPV3GPZHRRABYl65xKqCeFzeTItC6gpBbeqKyQyOy/PABwJRsdWRPHrc/y8gCbwl4tc4fuJ5Ue7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3btLGBNU; arc=fail smtp.client-ip=40.93.194.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3btLGBNU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmwtpJAgFumF3yhm+fFQ3WFRJeWrFvA/WZtZ4HifACoCFC1xEHozKkHrKstLzLOir0N9RUcYN4oFrTPwh/7ZeVVgKPLf32NMg7gNo3KvYNwOtoDMOJ683ObEV9qY9O2JzxFADDw9KWoI76XEJ9mR+L+llfDBcsSXszVfysWNro1C8LjHtkayAVi3pRmwuTFyC9mO84VBhoT071MMOU4YUmBIDffAWK9y9WHCIGDZCzFVAcBuertZSLrovJ8k6PQQWuUe1tw2CeunQ0Qe62HzlV43zEN9pZAUT1LOtjdWXfC8QTe53O9awCSpoWcw2GnLcC6MyCw0AsxTkwVWLmZCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12ZeGXRvAV01nEBa1XrPYdowMSmOQ3JaYHQ/tRDvNVg=;
 b=lTeIwj83CGw+UT7OUxIW80fLfZ/CS8pIFgWiXZXfgjdqgpUxlVc8p+gZIliTer+NT/D0HvLIDiiocWHzFS3qkVQ4oupyRlFaJUZDOfy8svxRVHFqbxOeHVeRnHmydehc9HDMs48vNYGXFftN9HUdhA94cyZKaovk1TEHBA7J14cRGOJSI/haip2EndRPIUpKrzigyJ1oBn+nT9kVXtDtskSg3I1zUb08D+punACX+1o5EQ2XHy8gI0/nwhx87q4AtBxakpL7aCkSx/eSaApIp9c3ML2aJtqgPy+TgBpI48Rwsw0ekszvRY72ReBoJV0UMrtRAIpsBhoN4miE6fjijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12ZeGXRvAV01nEBa1XrPYdowMSmOQ3JaYHQ/tRDvNVg=;
 b=3btLGBNUEA0Xb8Oq8nj/QmpZqzbk9OPPKbRlFfgG9vM/RZvrgUxQxTGHi2M8KwTqVYVwsXk7FilL99VKxEI0OD9yJr3ZfeHHCQDUyKt3UFfQv65o0O9G5SEGIgd0rueZ/q0oChIFf5qKnUD2fLUKTnjwmaCu8CRwwmoqjuQSfJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19)
 by CY8PR12MB7755.namprd12.prod.outlook.com (2603:10b6:930:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 03:40:23 +0000
Received: from IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1]) by IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1%5]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 03:40:23 +0000
Message-ID: <79f2ac24-c716-4dcc-aa56-288a2539013e@amd.com>
Date: Wed, 5 Nov 2025 19:40:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM draft specification (v1.01 draft #3)
From: Melody Wang <huibo.wang@amd.com>
To: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Jon Lange <jlange@microsoft.com>
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "Relph, Richard" <Richard.Relph@amd.com>, "Rodel, Jorg"
 <Joerg.Roedel@amd.com>
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com>
 <e1ff5baa-39d5-408b-afea-79cb398f0ac4@amd.com>
 <466b9735-279d-4353-8ec7-8edc54c24986@amd.com>
 <CY8PR12MB830036BA88DD5997A707ACAB95C2A@CY8PR12MB8300.namprd12.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <CY8PR12MB830036BA88DD5997A707ACAB95C2A@CY8PR12MB8300.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR22CA0003.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::6) To IA1PR12MB8285.namprd12.prod.outlook.com
 (2603:10b6:208:3f6::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8285:EE_|CY8PR12MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b3aa96c-0e7b-4f32-ff9a-08de1ce6375a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHRLUEh2NUlpRndHZG9ncU1DS0FxbmFGbVNDZ0UvTlNlNEhlZzUxdDgxWFBG?=
 =?utf-8?B?SkIzZjdrTkk4WmdqT3AwMHRZTUhjQ1JUb2VYb0RUbzdnVFNwZFllNld3V2J2?=
 =?utf-8?B?TnFPNExsQVQ5RVpLUmJWb2IyOERZRllYYkh1ak5sMzlmYmxUQTNKYkZSME9X?=
 =?utf-8?B?YnhuSjlFdkZRSnJUT2syU2hJMEwzUkR4clVoTWFvZnowb21MYWNWWlJidVlq?=
 =?utf-8?B?elJaK01MZEp2dk53czNUdjFVdlNoaC9UN3BDU091ZUZyOHFsUVBML0Vhanpu?=
 =?utf-8?B?bTlvZlBPbWdRR3ZEdHVVNkVmNk9BU1Y3TEp1WlJjTEw5c2UrT2ZyRko1TVh6?=
 =?utf-8?B?MytCRmFzSGkwZ3k2NlduT0p2Znk5ZVVNa3l6YkRRYnZkTnpIQjRvMFU0RGE1?=
 =?utf-8?B?RnpzMjNVZUcwTGFNK0FSaFlzL2ZYcUVXV21iMjlIZWIxZ0RFWWlsTHV6RVl2?=
 =?utf-8?B?L2p2MllmNDNCczBWZU4yemw2R3JKRWZkWVlhZklOcDdSQ015QXFuak93cGxC?=
 =?utf-8?B?MVdIWEl4RW9BS2FHVmJQejNIOHd0YU9abWxrM2pHTXFZZkVnZTc4REV6cFFP?=
 =?utf-8?B?V2dneGRqWVNTOENOc09pV1NFMG9uOStTK21uZ2FHYTNmaGZhN2MrMXBPOXF3?=
 =?utf-8?B?SUdqcXNFNkpmdVpsQ2JrYnprUnlEOSs3eFFFUUdqa2xqejBHSjdGYWoyM09U?=
 =?utf-8?B?c05yalo3QXBmdlFNTkVMZHdNY1krVTk0K1pnWWVoWk1RblZ1WUdmZ0FLY1Bw?=
 =?utf-8?B?NGtJR1ZBMUJDQ2dHVlpCMnorYWo5RHhwYzMrY1VGdmJDVnBBNFcvMktTOVVR?=
 =?utf-8?B?cTltemVTT0JwY0VhQUJSeW9ReS94SWlkWmsxRTRnYlVQNDVqUXV1SmJMMW9J?=
 =?utf-8?B?enlFYnZGQUNQRXp6QnRWclZaaTlVYU1WM0g2QU40OUdvbzRoR01KTGpSRE5n?=
 =?utf-8?B?WlVwVVRodEtWUVZmTUE1QS9WOTg5cE12UjhVZjQ0ZUQ2UXJJTGhGQmNiMmdt?=
 =?utf-8?B?cTY5Z0NkMG8vL1NNU0xxNVJsR3NiR3IrUEJhTnluUFI2aVUwVUhpc0VqRzA4?=
 =?utf-8?B?Tk1sU2J0TWw0aEd4N052eWlFUFFhRkFlelV1bGFjcERkR1JORlBDcWRQbXdn?=
 =?utf-8?B?OTRKcGVzQXhrU28rQ25HelNKQlVZN1hmckNFL3RIMW40WE1LaC9ZYWRwdjNL?=
 =?utf-8?B?OFdyUnEzS0NMMnlpbHNUbk5QWDVjTlI5OHhaZFB6T1kyU280TWR3anl3dGw0?=
 =?utf-8?B?VVpBd0g2Q3hCZHdkbzRmRUk0TjJGOEhlQWNDQ0VGdVMyVkhna21KUlJSODdR?=
 =?utf-8?B?RmlrOVpNcVRVeTZLMzZEcFArWWk4OWp4ZmF5ZTExRmVwQzRKRmhMbHpHSzBk?=
 =?utf-8?B?b3pmV2huM2ZQSTR4QnNKQ3VMOFVGNDAyQnJhRHpwc1Y3bnJ1R3JGM2RpYkRv?=
 =?utf-8?B?cUp0VlNWd0pYeTJmU3QrUEU3R2JkTjhwcWdSTm9paHJCNWFlbVYwbXV0ZWpI?=
 =?utf-8?B?MkthdU9kWC8ydHpkUjMwTTVrdnZRV1NFTUdXeHhDYzB4d3JBMnpIN1B3dUlB?=
 =?utf-8?B?OHdEOUFKa0I5dzdUcERRYWI2dnZoZjJPYUhmNiszNjR3SndZWUxiakwxV1Bo?=
 =?utf-8?B?bnVyS01Sd2dnQWErT1lhTTVtemp4cTFHYldHeEYxYXM2Mk9sWkUvVVRLVlYv?=
 =?utf-8?B?S1dGUUNtcDBRbzhSMkszQmFyWHF4dW1pQkhtbURlVllRQnc0VDVEZ3phaitS?=
 =?utf-8?B?d2plWjNTSkVVVU4ydExybUNWQko4dUlaWEpvb2RzQzNoenBMcmpLdmJ5cTl6?=
 =?utf-8?B?VitzTVFJMVV6V1lsaW1WZk42WW8vcThTQVQ1YnU1OEdiVnhNUGJnUjE3WTFK?=
 =?utf-8?B?SmlYT1dKejBjczI0cjZuUStsUGdTNytmTmFGcVFESFFkTE1oVEFDY09DV0w1?=
 =?utf-8?Q?H4mfKb0Aztgpzt0AAlNKSPSQId8zUDhY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGUwYThnclVYNEo0M0thQWJTZlArZDNrYlBMK1dYWXJpbkwwL1V6aDFxTFo5?=
 =?utf-8?B?UEZmODRkS0NFSzBqOEhMNmZvSmhCS0xENC9aUVdvRjVvNzcycndYYVp0dFl5?=
 =?utf-8?B?NDJ0ZkVlYW5vcE5mOTdYdC94UUo5eVpycnJRM0dtV2RLaU1OWHRUL0lOaDZC?=
 =?utf-8?B?UHVYUXg5RHBHTzVzejNyZk5yakEyVjUwQ0NoSlJEMDNuOVBud3BLdUxDYlBP?=
 =?utf-8?B?VCs2aTRZdjFGWEpuaDdlZWJsVFVzclA0K2VnanE0SnJGZ0hSVWdZNitZM08z?=
 =?utf-8?B?WFFsTzZqRm5DQ252TzNxUUQwRTJEWWN1OUVtVklPUzI3aHdyVFo1VW9ZK2or?=
 =?utf-8?B?QnllNzJzaVFydHdaWnNiTGJTZGduSVRDWkNoYURjT1BoZG8vSmZ4T3A1TUc3?=
 =?utf-8?B?dUZiaVdDNDNyUTFFZWhyMHJsTEhHVkN1S1d6bTBvRW9wMVVmelc2WmhmY0hW?=
 =?utf-8?B?UlFVZ01pWGQraFg2Z2hkMzZDeGk1ZkNoQ3NINmRQSUMzVytIMExiUzNQVmJs?=
 =?utf-8?B?SHJuSHdzZjQ5N0IxRlpFZG81N0oxeEd3TDFQQXpBeUlkVnlrN3hNWTcwTlg1?=
 =?utf-8?B?Q1hOckU4eXFWYzZDRG1ydUVnWHhGMm03UFJyQ1JtdUxYbFlJYTVadjJ1Y01h?=
 =?utf-8?B?SHYzRnpJd1ZzVXF4Vk9lUUw1QWdqZXZNTnQraThRUnAwVktydFVvYzBTZ0Iy?=
 =?utf-8?B?SCtOL2dLR0toenkyK0dZdWMvMmN0bzF4Ti9JbHhyQ1lRWFhvVm9RcmpiS3ZV?=
 =?utf-8?B?ZC9YeFZFekM2TnlCam9tZ2tqMGI4NXFtSjJCMURCWFdIRHdsdDFkZVFQK2pw?=
 =?utf-8?B?VXdIUkZCN0NkeFFTQlh1SmFNU3NqYVFPMzFoZ2kwZ0N3aWg1M2I5YWxEZk9M?=
 =?utf-8?B?eHQ5Z3JtVEwxWVh1M0c5aDQ1SWkycWdqdm0zZWxVdnBpTjRpN1V2VHdNOXpE?=
 =?utf-8?B?bGZ1ZGJzcWNVRGh6RlRyYkNNN3QxR0ZGNDRYS2xVeEM5U3pDMHlCZWFMbm1D?=
 =?utf-8?B?UzRhSnJxNHR2Tko2WVEvUi83cnUveTh0V283OFdqUm53ODhGclNBM3g2Mzdj?=
 =?utf-8?B?T1lJNWFFcUVxdlZHc0lZMGJ6LzJXczUvRThiRXZ4djR1NTNsam14b1IyR0M3?=
 =?utf-8?B?UkN3NTVqMitaNjNXTnRQOUdqUndLZGc4WWtNdVhwMjRHZTZCTkpVR0dIblBp?=
 =?utf-8?B?V3ZSZEl1eGcvbnM3djVMbUYyQlRDckpzTlJqbFExYUdkYzBrSUJQckRsYkdw?=
 =?utf-8?B?d250VlhYUU8zQXQ5T1RoUWFMbWIwMUxPOGMvVmpxU1AzcTVrZWZ0eTMvQ2Zp?=
 =?utf-8?B?NU9xSkZXdVh5dDZJVEp0cVFQbU1DZzNpV2JvQWlEVThCOFdTdlAzb0pBOW1w?=
 =?utf-8?B?Z0wwTmdNaUxlenpXY0hhTkFkMUhTeWVPUHB6TUgzNGg5WDBmWUxzVzVYUzVQ?=
 =?utf-8?B?dnZra3EybDVPcEtZOHhQSjhEV2dqaVhsRjVSc28vcC9xWHBpcDlaY1RQR1Jn?=
 =?utf-8?B?dWZzTWwycjlZeVlCSWVsRDcrNm9ReXlYN1l3czJRNTREeExQeWJJeEdzNWZK?=
 =?utf-8?B?djA3UDZxdEtOYkc4UW9CQ3Nlb013UWp6ODZDSnhlOXlTMzBSbWNWeVlqTDc4?=
 =?utf-8?B?S3p6WDRXVFliK1pLZEcvaUFqTmZEcU4zSWdXT1EycHhTNHN5Z00xcXljV2R5?=
 =?utf-8?B?VVQ4ekFyRzh1cVB3OWRNYzdERXJDQUpyYlZRcjNaNlBlM25SMEowYUgyWVN1?=
 =?utf-8?B?SkVxc1ZURnBqMmY2ajY5eTA1UjcvSlpZL3NRRXBhcHVoMG1ZTXl3ekZzMHl0?=
 =?utf-8?B?aG5Lay9ZK2QwL2d6VWhDL1o3ZWNUaHB2NFN0bmlzL1U0N0NONFZ6eVJIeHRp?=
 =?utf-8?B?WmgwV3ZwbVlQc09MOXhwTVgybDFudERvT08yenZ2MlNQWlZoUHVJRHg3Q05t?=
 =?utf-8?B?V3QzMEFkMEJkcm5QUlJRSHdZcGFMUXByRHJBU0IxWCtaei9SL05DaWI1cXlJ?=
 =?utf-8?B?bkl3dHFrLzN1Q013MHlxVUE4WVdUUVJvOGRGTWxlZDJ1OHd1Y093L1o2Uk1D?=
 =?utf-8?B?a0N5dU9Ra2lmbXJFc3JzbkVrVTN2L1VvRDJBM3JXR08vYVp2Mm02ZEFBZjFU?=
 =?utf-8?Q?cUkMKhddhY9aZEwhlR2T7ubT3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3aa96c-0e7b-4f32-ff9a-08de1ce6375a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:40:23.1786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0WabV+TmYeZAiTN8kmnQyrh/MwXfTavwOHx4mjx34PfaJ7QWLYL97S/l2ywPGrEKB6Ip12kaWjE5IjoE4f1aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7755

Sorry the last email was not sent to the mailing list, resend this email 
to fix it.

Hi Jon,

As mentioned in my previous two emails, the DFR is no longer needed and 
isn’t supported in X2APIC. Should we remove the DFR from the Alternate 
Injection spec?

Also, the LDR isn’t currently implemented in the SVSM. Should we plan to 
add it, or remove it from the spec as well?

Thanks,
Melody

On 11/5/25 5:07 PM, Wang, Huibo wrote:
> 
> Hi Jon,
> 
> As mentioned in my previous two emails, the *DFR* is no longer needed 
> and isn’t supported in *X2APIC*. Should we remove the DFR from the 
> *Alternate Injection* spec?
> Also, the *LDR* isn’t currently implemented in the *SVSM*. Should we 
> plan to add it, or remove it from the spec as well?
> Thanks,
> Melody

-- 
Thanks,
Melody

