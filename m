Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6795028643C
	for <coconut-svsm@lists.linux.dev>; Mon, 30 Jun 2025 12:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285386; cv=fail; b=jasKvRlwqjp/TA1OOBfOlnmHhbZhbbLigNdr5895Z5D40vS0X7J7vYoVJI8n8QlNYGkVivI9E+IgMuKWFb2tUgIBMZFG/SH1J3058e/H9dnVAbUGsroKY6dVfrM2I6zxhtR+tbIDEVtkaELWIMiD2p5q0/HkiW0KZuwCOVUcFXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285386; c=relaxed/simple;
	bh=9OnaBB2+CUR0ZrW1scKSWUUA/F5CPBNuothmNr2osQk=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=actbyUfREcYkDPYOEdk4EUx1TKTRsytMJYtlVYl6vqeMR1FDK0uGVVpVrkwenM1zWG75HSkM5l/11C5c06gJnjLwoMSMPpdIVe8kjAP8G/88vQluIoc0BHrsknK5X87fTeaM+eWaQSJ5Ji5EAt8nU7SG7HHCbXR171XTxjhnEeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dD5BP2cI; arc=fail smtp.client-ip=40.107.212.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dD5BP2cI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyohnDda1ctVtZ7vYov45QX/BZSzPIoQt+lPtSb9b2Bzl7rarHsHEqiDhyjvetlP37kr4m5iBm/V+SAhPf4a6aiM5DkZCPpPTlqfPqrkJADU7wxZSJDTjUJnp9Zj+L0XrlBuqxEik8iWcF5EAnRbKfpzK25JJ+pbm8ih3BzOnIsPJyBpgrdUxvSEgSyon4lVh9WZHpc1rw3yVcUbsfjXmnBm0597V71c7N0o37DhKqO6VNtB+mUAPGvJ7gmTQl6x41iELpeEjLWWCR9lpVeTgx6iCSf26zp233ViwE7z4yVc6G9MHb0J/ueZM9vMTs8NBbNfV/LDTfgoAJrZzBtVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdS8ld+N5meZkNWq0GaTAhAixWb/h2/8b1m6/X+tfo8=;
 b=NJBpD4wlRgkozj+SV+0YQNdCFwA976fw5ltEJ1ydqwb4y0TJG2ahp1DE0zgPLyPP3tRfO5Z1iAqdBbbwAFuB8NkZPdsa11a4Xa+oUsRiVHJ1WK6swGrEMin84PyMiaQ64G3y9xEj3jU4jnsm5q1YXbeXBhhaBdWQS82aXCi2TpCfvlBqeZD4E9swTx2XPv+YKgQSNgCFmIiyb7txvJ9Bqxv7+xtQSpZGmy8sjZd/FHqkV7OzzO72paaBKTZO6tzKGJ6j9qGFcxfvilKSVOWJxPezTL7TMSj9NniFgVpjRvUarpIb/AoUfYcnlUqHdtmBCpeeQPL5oF2RHCq5lGKRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdS8ld+N5meZkNWq0GaTAhAixWb/h2/8b1m6/X+tfo8=;
 b=dD5BP2cI/gckWSq0qlHZENUEHjHAoLYJ4ZVT7GDFtJTOqqb/cYTpVlDyFHnlKUyj8kaK0vdPysHHuINsGGZrTp20hGGu9g+q5+rE7QPlMYwuulYgle9F31IDOh/VO5rVFxsSeGPgkV9umjb7W5UkjzosXjybj0akfk44UQsCUsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8189.namprd12.prod.outlook.com (2603:10b6:208:3f0::13)
 by SA5PPF8DEAB7A29.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.35; Mon, 30 Jun
 2025 12:09:40 +0000
Received: from IA1PR12MB8189.namprd12.prod.outlook.com
 ([fe80::193b:bbfd:9894:dc48]) by IA1PR12MB8189.namprd12.prod.outlook.com
 ([fe80::193b:bbfd:9894:dc48%4]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 12:09:39 +0000
Message-ID: <232c21fc-33d9-49cc-ba82-fa02e5a699d7@amd.com>
Date: Mon, 30 Jun 2025 14:09:35 +0200
User-Agent: Mozilla Thunderbird
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Subject: Re: Steps towards live migration
To: =?UTF-8?B?SmFrdWIgUsWvxb5pxI1rYQ==?= <jakub.ruzicka@matfyz.cz>,
 coconut-svsm@lists.linux.dev
Cc: thomas.lendacky@amd.com, sgarzare@redhat.com,
 John Allen <john.allen@amd.com>, Joerg Roedel <joro@8bytes.org>
References: <DAXD0VKXZ7KH.2WNLX124KC7HZ@matfyz.cz>
Content-Language: en-US
In-Reply-To: <DAXD0VKXZ7KH.2WNLX124KC7HZ@matfyz.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To IA1PR12MB8189.namprd12.prod.outlook.com
 (2603:10b6:208:3f0::13)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8189:EE_|SA5PPF8DEAB7A29:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e5e1a9-758b-426e-b06f-08ddb7cefd1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVNwMmorL3F5dlZjOVF5UVhxVzZVTTNEa2FHaC9NaDI2U3huMGVycGdiUzlZ?=
 =?utf-8?B?OXpYSmJLWC9PUENnVmhFS2E5dVFrcU5DRGFKa0d3eWNHdGptQmtURFZieXFo?=
 =?utf-8?B?RUNjSWVPZjRESFNZeE1ITVhIeVVlLy93YkJXTlFmU3RYWUo5aUx2d0sxeGpE?=
 =?utf-8?B?U0hLRzBVSWFjamYzMHZ0aXE3WGpPenJSWEpuUWdmVzhZeGUzQ2JsbWtMdkto?=
 =?utf-8?B?dmZGbVNmajI2SWx6ckViR1VZd2xJZy96N1FBdUNOajB0TWhDME5HeVdFc2s3?=
 =?utf-8?B?dVJKZUEvYmViOFJ3SXBFZC91ckdWYUFMVDAvRUxWM3g4Q25DRm1wNm0xbXdK?=
 =?utf-8?B?NHZFaGdXa1RpL3BlUHZOdEd6cDdXM1M2N1RGa0dONFpudWNQdGlLM0FvY21K?=
 =?utf-8?B?RkRUcENodzhPWDlCZlFxVlhMU2tCd2hZTHRTYi9tWDJDY1pEY0hkMTVsaHFz?=
 =?utf-8?B?Y09hbk5qMy9TRXMrNHBjR1dDMEJFdlFheFlibXFLanEwVTZMaFNmcm5SU1hJ?=
 =?utf-8?B?NWRmcWM5d1hNYVJwT3F6RzNyaDhhUzQ0ei9sK2hwL2FSdXdUeDUySUo2NTJp?=
 =?utf-8?B?b0s4Y1BqbjRTRzUxT3Q1aXM1bVJETTNRcjZuU21ndEtZV2t5MXR1RVplUGFp?=
 =?utf-8?B?Wk5IWGU2NDVoNlNXK2ZXcFZyb0dmTVZUYnhhYS9Ta0lRU1FHa0RPR085Vldn?=
 =?utf-8?B?dXA3V2FRWEhmR0M3OTJGZWFBU0lRdnIyRk5kTjAvM0taeG1OaHZqMEpaTlRv?=
 =?utf-8?B?K0lxMjlJbVU4RjQ4MElGd0twRHRrbktLSFhOOGJtMnhIYXhNV2c0NktxbnBD?=
 =?utf-8?B?Uml5aCtNV05sWVVFWHB3Z09ITytYaEF3QWhQc1VXVmFzUUJiODJCL0xtQUZK?=
 =?utf-8?B?YkJSd010MmtOSzZsbmhYSzFBaDkyUkJSaXU1Q2dSSm95Y2dWMytTRzF1alo0?=
 =?utf-8?B?WklOaHRLcVJ0cXBXUkdLL2JCRDYrRjJlSEVya2lLNnIxS0sxaExSUHdKYmMr?=
 =?utf-8?B?OEV4aXhjY0dRcCtITTlIQlpDOUR3Y2tLMmhGaVp5MXEwOWNjUUJQeUdJU1dn?=
 =?utf-8?B?NXF4NS85OGxnNEpZYWp6THVQUFJTMjU2UFlTWXNlOHNMZGR2STZIZHdLeEQ0?=
 =?utf-8?B?SlRpNU96U2VVWXRnbFZnMWw3VGtLckZUdFRKY1FUc3UxWW5qbzVsdmJnbFYw?=
 =?utf-8?B?QjliTXJmaGhRQzZ1bHJEQ0JYelNhdFJvQlB2SnRSSW1Mc1JkVFVkdHdXd2NE?=
 =?utf-8?B?cEFNbm41NURtSm1LZDJpWVJGa1psTk5JbWw5Ty8xTnFSa2ZWcnJHbGZrRU56?=
 =?utf-8?B?UDRnNDFYcjhuZDdDZzlPcUpMVDFGb3dPSnRMVFFEUzhmeE5OdUZuRmhNRHlY?=
 =?utf-8?B?R3lMZjZaempCVEszalVsNithQXlzbS9ORW50Z2grTXB1VEtwLzd2ZW8vVURB?=
 =?utf-8?B?SG5ua1RYV3NVdHV3ZnpwSjFlSUdGK3RLa05JT2dZcmFPZjIrMzRDUTVnUHNu?=
 =?utf-8?B?MHptUmYvemlYTVR4c2l0bzE5UTVEZnBjZFp2RXdNajRNa3NOUzY4MFFuRFlM?=
 =?utf-8?B?aS83UUY4WHRlaTF6SlVoTmlHM05ybFBiNXhhZUpvcjdzUCtueUFuTWVKcmMx?=
 =?utf-8?B?YjQvSzQwWDlWcGVhZmcrWWdHaS94Q0ZRT2hTUjdnZ3U1M3JRRTRrRG4rS09D?=
 =?utf-8?B?SCs0U0NFZFRPVDUva29nNEVSb2toaWIrNkFWZTBLMWYzY2tYODE2NUZVVktE?=
 =?utf-8?B?UTZxb3JleDUrL0VER3phVC9BUSt4RWFJSnRJa2NITEwzbG9rQWtnSFlodnJq?=
 =?utf-8?B?OTlzR0R0SWlIVE83Qk5qYkh5dHpkaXlCdUJJYWdldGpNeXNpSHh3dVBYbkVl?=
 =?utf-8?Q?5ie5JUCQKvnMJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUo5K3V6UTVkRUJ4YXF0T1gwQ01MSkpTLzlxSWcxZmwvRERhamZNZGE2TERz?=
 =?utf-8?B?Q0Z4eHJSMUZrT0YwWmc3NFhkN2EyVG5kMlRZOWdpNkMyemxGTTJPdDNSSGtp?=
 =?utf-8?B?VkErSWR6ZUN2N1JLSEt6UzFwUytZbUl4Z2Vob3ZjMC9DNzg4aktPSDhHTkw3?=
 =?utf-8?B?ODR0T1pRd3gvanFZczk1ejY0OFpyb29wVVBBcDZRZmliQ2hrMU9iN1krRnl0?=
 =?utf-8?B?dERnaDZTRWQzZTZEYTl5aStDQ3V5eG40WUF6N1grZVpNT0l0LzlzbDNSTVhY?=
 =?utf-8?B?Y3N3b2J6eFQvTCsyRFRIUjBsZWZidlhnTWhQMk1lejhia3ZYRmwzWjRIQ2JJ?=
 =?utf-8?B?V3F0Q25TSlhYUThIcWFIVUhkTktHNmRCZWVBbkF3SGtoa2JWclJldmpwbWM4?=
 =?utf-8?B?VkpJQ2laWmFray94Z3o0TDZTdVk2Wm4rRnZYYnZUNDg1cGtGaVRZLzJSNzBu?=
 =?utf-8?B?dXlmeXJvMkczTk1NTW8ydWRhampxMjJCeUI3RjV1a0lCYU00MkFzZVEwTEh0?=
 =?utf-8?B?b3hsUm1FelV1cmVkQ01yN2FaYnNMOUxGQ3N4cFFSYmd5eExMQmxFaVV1OVRr?=
 =?utf-8?B?OGtwNjNscVRGOHE2TmJrZzhoUUZmTXBrYmhDam5Lb0dFUFpwSzNGYUxjY09P?=
 =?utf-8?B?OU5HL2tIWVVCa3hQTStrQXdsT1o2OHAzTG92d1U1WmlEbSs0SzNBeitoVXpE?=
 =?utf-8?B?d1QxMURRakxoM2wySHBuY3NKTlkwb0s4U1hWMXB4SHJpVnoyb3JBaGQ2RlpL?=
 =?utf-8?B?Q2pWMFhuVThOUEh5NGp0NVl6MnpGais3Mjk4WGIwWFRrcFpqNkNFQSsrWnNM?=
 =?utf-8?B?c21CS0ppLy8wb2VPZ3FCS0JQRm11SDZZNjlRMVRhaVZWblFFMHEyVW1qbHh6?=
 =?utf-8?B?VE9vSDB4b0NieDRlL2Z5QmpkNVB0UGxzMFRjSnFSRkRYUGtndWUzcEQyNzR4?=
 =?utf-8?B?NldOc3NKNXRneWRHanNiZkNQTENJbyt3ODE3T25qWGhWcnNTWjdKdTd6Skgv?=
 =?utf-8?B?ZmdOUytKUGx3Zk9OclREWWhWdWNPb1FKaVJ2eFg3bUVOMnBkSjhGV1VOQWdu?=
 =?utf-8?B?QjVvVEthWEF3aEE2Y3cyOXFXWG82MlNnYnJDVEJTV3ZSQ2FrdzdUTDZHZWUz?=
 =?utf-8?B?OWFCbWpZM2loS3EzMEN4bzFNcmZWZlFsMjhLZjRlNmU0am1wSUhYU2hQVkVy?=
 =?utf-8?B?TnMxMkZQa3ZEQkhubFBVaEh4K0lJYlNyeUJDK29wN0N1QzcyejIwYmk1WUQ2?=
 =?utf-8?B?azFnNVRsVUF4azZYTm5sSXpLbERHN2pBMGY1L1krWjZtU21YZkpSbUFrLzRN?=
 =?utf-8?B?dnRydXllQ1VXd2ptOWdXMVM4YUJvb2c2TmdoSnlDejkwZElBYlhPck9XNndE?=
 =?utf-8?B?R3pyN3BzdW9yNnI4aEhFU2Y4TGljbDhLS1JrQy9BN0NIRnZkQ1lZRXFrUkNL?=
 =?utf-8?B?MkwrdHdpSXcyNDgzd0tQTzRQV3BjUnlyNlBJck81bG00RWJ6R2ltRGt6T2tF?=
 =?utf-8?B?MWZoRWR2blAwME5XTXNnUU5KRjQrbWxtQUNXYXVqbVNYVHpVMGM4eWJXNGRk?=
 =?utf-8?B?MStrSDlqU29wNExSOVlsa1ArSTgveFI3N1dOSlBjNmx3QVAwNldwS3NXdHZq?=
 =?utf-8?B?OFR1NHZBeldud2tVdUo0T1JBQUpiOG8rWWJXdXZ3czRsNU9rMXZYSSttSlNo?=
 =?utf-8?B?M0ZvOElFUzRTNHY3SGUvanBSSm1jL0VQKzg2bGpONDY3TlBWSGUwZnRFWHdT?=
 =?utf-8?B?NVNDOHUvRkR0RzBPeHdUK3IyWGMyeVdNVDJaemNnd1lHRS96aHdXUkI2WWF1?=
 =?utf-8?B?UklsUnBRZDdKTkY0T05QVTlKaGpkclUwSUQ2dGR3VVNkMHd4MFNmd05RUFBn?=
 =?utf-8?B?UG5QRG1zVitBeEpOMWZrWmhnRjFEUEFLWVJBTFZrQUVsUHBMbWRNclVweXF2?=
 =?utf-8?B?R0hYNDQyZzlmamwrSGZMc2RzM2dTU0plQWxMK2VZVEN5VzkyemtKT1Nsa0hx?=
 =?utf-8?B?Tkd5d0xMcTI0QS9oT013cG1EeW1vVEpFcVFSZlMxR29odUl0RytTOWJ0SThE?=
 =?utf-8?B?UWZiUHArRkxONzQwa3A0SUdOaDcwbVRLTkwyV1Q4Mzk3RjVMYXh1M01HcDZv?=
 =?utf-8?Q?5tSMtWQka6n1+JYlFzj1arqda?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e5e1a9-758b-426e-b06f-08ddb7cefd1a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 12:09:39.6624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjFl9v4PwhF8m1tUlnGpHdQFXSMbUUomVTmYFrgHzruzzXS+h0xFMaNBwq8EN9HtRHCRLwI7PHS9Hl52/TWAZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8DEAB7A29

+CC [John & Joerg]

Hi Jacob,

I briefly looked at your code. I have some questions below to understand 
your design more. Do you have a comprehensive design document somewhere?

> Hi,
> 
> as mentioned during the last SVSM development talk, I am currently writing my
> thesis on live migration of confidential guests. With this email I would like to
> start a discussion so that the same problem is not addressed multiple times

Ofcourse. That's the reason we shared our design in the kvm forum talk 
and asked for collaboration on common components (open vendor agnostic 
problems):

https://kvm-forum.qemu.org/2024/SNP_Live_Migration_KVM_forum_2024_svDwxa3.pdf


> independently. I also welcome any feedback to make the code written useful for
> SVSM Coconut (not only for the thesis). Development is done on machine with
> SEV-SNP support. I made a pull request with the SVSM patches[1] to ease the
> discussion.
> 
> Here is a summary of progress to date:
> 
> All validated guest pages can be transferred from the source SVSM to the target
> SVSM. Currently, no packaging (no confidentiality) is performed, but a hash of
> all transferred/received blocks is computed that can be compared to verify that
> the channel is working correctly. Also, the main migration function of the

Any analysis on algorithm you plan to use for this? IIUC you are 
currently sharing the hash from source to destination? Wouldn't the 
'aes-gcm' in [4] will do that in addition to encryption?

> source and destination SVSM is busy waiting for a signal from QEMU to start
> outbound or incoming migration.

 > > A single shared page called MigrationPage is used for data transfer and
> communication with QEMU. The migration page contains two registers and a buffer:
> a status register, a data register, and a data buffer. The status register is
> used to signal a change in status (e.g., migration starts, migration is
> complete). The data register is used to signal that a new page has been prepared
> in the data buffer by the provider or processed by the consumer. The roles of
> provider and consumer are switched between SVSM and QEMU on the source and
> destination machines.

This looks like a communication channel between Qemu and SVSM. We are 
re-using few bits in per CPU ghcb page for SVSM <-> host commands 
communication.

I can understand you are not using additional vCPUs. All this can be too 
much work for guest general purpose vCPUs.

> 
> The QEMU patch[2] implements communication with the SVSM migration handler and
> block transfer from source to destination. The idea is that creating the
> communication channel is all the hypervisor should do, the rest should be done
> in SVSM.
> 
> Current plan for the future in order of realisation:
> 
> (1) A function that puts all hosted vCPUs (except the migration handler) into a

[...]

>      spinning state. The hypervisor is not trusted, so the SVSM must be able to
>      ensure that it is not running any vCPUs. For this task, I consider two-phase
>      checkpointing[3].

Can you please elaborate more this.

> (2) Migrate the machine from the source to the destination with all vCPUs
>      stopped by the function from (1).

You mean black-out phase?

> (3) Secret key establishment - though about using [5].

We need to tackle this problem. A probable collaboration point, maybe 
coupled with attestation and migration key sharing.

> (4) Package the pages - authenticated encryption using [4].
> (5) Dirty page tracking.
> (6) Move the SVSM migration handler on an extra vCPU.
> (7) Start migration handler on signal instead of busy-waiting loop.

There still are other open questions at more granular level. Can discuss 
those as well, once I go through your complete design.

But at higher level, I would like to reuse more of the existing 
functionality in Qemu for live migration and use SVSM for memory 
packaging, guests memory permission setting at VMPL0, and live migration 
sanity related tasks.

Best regards,
Pankaj

> 
> Best regards,
> Jakub
> 
> [1] https://github.com/coconut-svsm/svsm/pull/745
> [2] https://github.com/coconut-svsm/qemu/pull/23
> [3] https://ipads.se.sjtu.edu.cn/_media/publications/sgxmigration-dsn17.pdf
> [4] https://github.com/RustCrypto/AEADs/blob/master/aes-gcm/src/lib.rs
> [5] https://github.com/nihalpasham/static-dh-ecdh

