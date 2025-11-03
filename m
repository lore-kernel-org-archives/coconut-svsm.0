Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5254158DA3;
	Mon,  3 Nov 2025 02:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762136903; cv=fail; b=dn1v1QdAc+78DHWqbH2iMgYpQRdUrn8ZmGgOo+2bbRAC/YdDe0eJ2CIyIlphRSFK1iGKbYnZKMcF6+rE/gkHQ64C/KoYIbtd/HG4N3XEOcavaxinHRk4V7ehZvjFL/8/w5Bavu9U+AmOh1FHESGsD5/1idvSJB3/o79GM3UuEvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762136903; c=relaxed/simple;
	bh=63A5BNHUqrnnMwHsMTJDCS6zn9L0i5vJWbJqi+pq1l8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AQ4y4EIDWjuCx75gz9fBiYqXlp2xf1AilJ97wPGPn7uZh5yosrwue+w1C4SClsZP4PdUzVSMxO4eyvMZcZH2EjuMZ77nOQYOz/f9QQchyVDLAACoXRu6kK/3yW/C7gjfGUOMRLg78iM7tLZfEIzGrVZWtSaFhECRvPkmOC3AgKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kQ+UqHHR; arc=fail smtp.client-ip=52.101.46.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kQ+UqHHR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3iZ3ovcIRsvvpygkQ7JHYOYrohzUsDAoyCzlekActUsUgzb2f8aBSuZxW1sDOLurkcQemS4CtXNGC66zS8OPEVI9pbGaHs226Y/C6V8EQgA1J4k2QqzvSB8g3GbIzhONxHwBS00CEfyXMew6kWbe7/koUc0m/pREQr9nbqan94RS7Q6bLbO7NFX6wxorwUavZ3HLTlVac3f8dY+fsyrimlQVBmqnNzgZ8PPC4mydZlaEPoHZdEPOk94wrzE6pOa5sMt7I5385PhKXFKDDBVlBBqV8EtGYWsZKrlBqPZOWEVKtIn6d4yQPVLZpdOKH3p4OjFQoVRPSEXO9DfTaQekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsE09NcsrfoBgxhVdf2szx5e7WXvXLfQnwl1vEKcYXQ=;
 b=Xr28drFmX6KObGZ/NYKsPn0YhvFqraRclR6zjSs+5+3em/Mi0/GvglAG4n3utASDs9kzIe8MA56t0lyVZ+vcWGeTMDPdbuHR4S747/eyUZYzj9fOhbdBaPPYGYFVgHdMY1Ou7dItPapW+i+PaayLKJFHakTPF8YgQb3fkDtTBQwOHVhqw3d7vkeVG9fWfxVRTAZgFKJqcteqp1UCWlPkGM7vko3ffqJGdNxREiwJODrSw4hrUErtRm7sjXugEgOmmxZPH1pU2JZz0Js0+9vQmLM1K9J0TfBJHHscrdzdaeSsyBA7h/mm9mlvGd2p21YQq7Vv1H2c6FKR8BdknYzBvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsE09NcsrfoBgxhVdf2szx5e7WXvXLfQnwl1vEKcYXQ=;
 b=kQ+UqHHRXOUhls3mFTmqdSXl9/JWUNdniFOvL1TH3USlxA2wNGXVxElBpBRGTuuaENp68sQQuqwmZAXpfbqHR1qMG9U/muwvvFw+Nlw/+QaVz/K5O7qEiKBL09pEmdocxW87KIW5G0exfqVzPahj4SpfrZtkkxyMhlbczmIiSVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19)
 by IA1PR12MB7734.namprd12.prod.outlook.com (2603:10b6:208:422::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 02:28:19 +0000
Received: from IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1]) by IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1%5]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 02:28:18 +0000
Message-ID: <e1ff5baa-39d5-408b-afea-79cb398f0ac4@amd.com>
Date: Sun, 2 Nov 2025 18:28:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM draft specification (v1.01 draft #3)
To: Tom Lendacky <thomas.lendacky@amd.com>, coconut-svsm@lists.linux.dev,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Cc: Jon Lange <jlange@microsoft.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "Relph, Richard" <Richard.Relph@amd.com>,
 "Rodel, Jorg" <Joerg.Roedel@amd.com>
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To IA1PR12MB8285.namprd12.prod.outlook.com
 (2603:10b6:208:3f6::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8285:EE_|IA1PR12MB7734:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5a0b0c-1ffc-49cc-d4e7-08de1a80a6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0MrSHFkSnFpY002VG9mYmJRVjYyemVkRlZhcDFHbHBKR1AxMUZGNW1TdTJH?=
 =?utf-8?B?UFl2U3hrQUxHNTFiVkR4c1NpMUl2cGovUitUUW16d213L25kcmhJZ0VXdmNC?=
 =?utf-8?B?Q3BUK0E4VDljVmxpUHkrcHJ4UlptTnVpU2ZLMkw2VDRWWjUzVDU2VXNPdm8w?=
 =?utf-8?B?Y1BZTXgyUGpUK0l0U05ocmRwQTBEQkxCQUhWWml6VU00MUlrR1M1T2x0S1d6?=
 =?utf-8?B?VlNlaGlqYmxvWnc5VmtaL1g5TzJHWGQvTTNPMmY0bFdPcVBhTWRaTmZGWVBX?=
 =?utf-8?B?endQMTViWWI5ZEZZd003UUNzNFJQbmRnUnhKNDVEVSt4S2tmVXBRd1QwVjlw?=
 =?utf-8?B?bEhPNWpBS3dHV0hjdWkwdVY4R2EzZXdteGVQQ1lPQWlHeWlPTTVaK3hNNENH?=
 =?utf-8?B?ZHg2REN0ZDFYZk9qV0xzN21kTXJ3RHJGbzVuSGlka1RWWDc1UUh3K3lMZnVv?=
 =?utf-8?B?aFUxbGJBKzJvUkhWMG1RT2htMFUrNHFidTFkWmhHTHhPVlp6SkwwTHM4aEk1?=
 =?utf-8?B?dTFKVStEZ2Q0dm8vdTNkZTk0VUFwQ1FyZG0vVG1sYmVvZVY5ckQ4MlJ4TUJk?=
 =?utf-8?B?Z0Q4WVdkSFFRUXF4TDJQNzhHU2gwSmFBRi9ub3F6MlFEclpOR0JyckJURDQr?=
 =?utf-8?B?bzY0ZmZJV083aTBvMXNrTFVtRDZPSElheEJjdjFwNHhCYS84RE1pL1BGbUM4?=
 =?utf-8?B?WXhpZ241R05kOEd3cmI1MzhXVTh4T2gxSktOVkNuNVNLQUp6Y2NTZmdhU0ZC?=
 =?utf-8?B?cTJZd1hxMFRiTndOSXZpRGJCK0ZyV2M0aE9FeU40SDRrREhqK0hYOWtxT1Bi?=
 =?utf-8?B?T1Y2dkdlcGlzOWZnNEswMHY5N0dkZ3o1dnhFTG5SWUZsKzhSeUhrUDNRNGFq?=
 =?utf-8?B?SlE2QXd1TFRPWTRiMm5Da3FPMFpacWxKV0xGdnNQSXhEaE5wNXUzWEwzZU1n?=
 =?utf-8?B?Vk5QRlJWa2M2M0ZJU01NMmIyQ3VvLzNBcm1HRTdRMWxya05raDZkSFY0SGt2?=
 =?utf-8?B?dytKYkUrQ0pqVDdnQUNCdjU2bnd0V0d0b1B4cHpPTGVwNWdwL2s0YWVEK1hM?=
 =?utf-8?B?RVJZSlRuaG85MFM1b1Q1ZWljRWEwQ1dUZVJRYnBVUHZRNUloRTVYNzlBZGRi?=
 =?utf-8?B?Y1B0aC9BTnAxaUdBcUwxMk1jY2NCdnYxeFNzNm15cmZVVE95aHhucUtDUG81?=
 =?utf-8?B?N2sxRHJQeVZrZ3lRWGxtOEVyUVhKaGthY2ZDV1BuVWRMeHgwNGxIMkx2a2FU?=
 =?utf-8?B?djVOZGxid3IvTG5GL3J4YUt3bDBnTkxCM2k0UGtDNFc0SnYvK2hCcGFldlZV?=
 =?utf-8?B?OXJyWk9hY0JaaUlRQWwrS3l5OTJmWFFkNmgzb09PUDMrRlg3WUYzbU9hVXJE?=
 =?utf-8?B?S25wQXpCdmdVZ1pvLzJ2cFgzaGpMQ3NqakRaQkVjS3JzdEpsbmhwbnF2Tkg4?=
 =?utf-8?B?K3o4ZWZiUnlKLzhVdHFsQWlQelVDRjJNQTJiQ3V4SFZSVmJFVVFXS2g1TFJ4?=
 =?utf-8?B?WkVCRU44WUY0K3dqb2g0WHBlemtKcWgyeHk3a1ppaS9ueTdXR0JsTEpHaHhy?=
 =?utf-8?B?UDMwcUVZT1VvWitRbGNlVzJlSWoxQjFFdWFnWGNjRHN5aEdKdkpCbE5aZ2RL?=
 =?utf-8?B?bFZmeVl3Q1IrNzRDOHpOcE16S09keWkxQU5DSGk1NWNMVXlieUFYOVdXSmE4?=
 =?utf-8?B?Q3ZIZlJVamp1TnJHRitvR1IwSm9mcGxzM0hFZ3BCSE9YdFNaZnE4UUVGNmZW?=
 =?utf-8?B?S0Q0VFUzWFlCeDdXaEpwdDI1aE9WaXFtQTVyakZpdE9UTWF5RTVHaGRyT2RO?=
 =?utf-8?B?YTVIaHMwR0hxNWtCQXI3YkNldk1TTjZmREJMY2pRMU1VcVhnUXcra056aGVH?=
 =?utf-8?B?YSswR1plS1BUc0tYOW9EVW9zNHAzOTByWGg1YUl0c1N5bEt5Z3BEQnhiTkVu?=
 =?utf-8?Q?foW4kQsV3nXNMbfyV/UtjPos/K/JIS9b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0RYcHlScTluODB0dmJ1SGtlZ2xyUDQ3dGVEVkNJUTlrKy81SE8yQkRwUzJJ?=
 =?utf-8?B?cFNIQWt3MkZmVTVWSUN4S0JsaUJTNG10VTlDRTVPWVVicnVOQzlaazkxZHVW?=
 =?utf-8?B?bzVTeDNwWnUyYlJGTy9Qc3llRENoOEJXVUUvN0VLQ3NhNkZSSktyQVdBOGda?=
 =?utf-8?B?WWJIVkFoV1N4QnF2SzdFU0hSMFNaWmVHalM3QjhoazRzSnpndmp0TjQrMi9z?=
 =?utf-8?B?dlV3dHdRNVNGQ3ZFV05ON245UGxJNjYwM0hiNjFsNkxML0NwMlQ4RVRPeDR5?=
 =?utf-8?B?bkVwWmhObGwrWWFydVRSQVlGeDE0SE94d2R1OUZXTVg0eHVoNStZZFZIb2ZP?=
 =?utf-8?B?M055T3RzSmxxWC9WM3NTRWhrQU9GZm5UZElJM2hpbDh5dUVidUUwQTQrMzJT?=
 =?utf-8?B?Uk9LTnl3WHNHUXhpdTNBam5qN2k3cDQvcGJzcFJJanp4elRtUmp2ZVd6MWZ6?=
 =?utf-8?B?NGVqTDRtNnkwdTI5K0pxdy9LUlo5T0pWU0N0ZVE3SnBPTHpla3RoQkpKMFQy?=
 =?utf-8?B?M1lNdm51SXBUR2hiYjd6dUJGc2tFZGl5a0hwOHZqZVU2TG5KYlNwc2JpSE9S?=
 =?utf-8?B?eTBHWk9jd1Z0ZjdUY3Vtb1U5QUpiV3R5SnJFOFQvYXhEVWF6N0RJMVYrZHd2?=
 =?utf-8?B?NkZrVjlCMWp1TkMvc08wRXdKdnM0K1JLTWFoeHdzZUtDUVBBMlIyNE0wc1lq?=
 =?utf-8?B?UWFiRXA2MEFrVDk0cVhLRDRodFUyT2pTeHRvZk42QldZTi9IcERIMitmaXl2?=
 =?utf-8?B?ejJZT3Vab0JUTUE1bEkvdWhTT1BmeGJHdDBGQ3d5YW5JTEFTUlZUdWhmWUJJ?=
 =?utf-8?B?QVV5eWVvbTdqaHRJcGppY3BqdHBtZld1MktPOGNxemVhbU1ZZ3dVQi9pRWVI?=
 =?utf-8?B?TkRvQ3ZMSUlmdHVqQTdSdkdHMXYxdTdqczRsZ1RlRTNYV1kydTRxZGg0Z2V3?=
 =?utf-8?B?N1dOd1NDVVZyRXBiWUtmYXAzN2F6TkczOWlzd0U2cXM0QWVGVHF2eDdKR1NK?=
 =?utf-8?B?V2JZZVNpQ3JLZkIvYjZwT0JOLzNSVHdmVVRhNDN2YzZWUWM3cjVMend6ZTdo?=
 =?utf-8?B?WGN6R3l5b2U5bWNKNzBpK2JkSTkxTHplVzdlWGhuRFRJK2RmbHNUMktMbnlm?=
 =?utf-8?B?MUNudE54ZUxMencwb0NIdUV5OEt6WFNlbVhIQ0lHUmEvaDlVbDUrTys2Q3RD?=
 =?utf-8?B?UnFiWGZKT2J6YjdZVkVncnZDbldFb1d0a1cwcWFHOTdkN3Roallvd1V0TS9J?=
 =?utf-8?B?bHVNUjQrbG55UWl0SDdicDc2WVkwZ1BYd1M4eWh3WERIZkp4VTlpVW1mVDF6?=
 =?utf-8?B?ZVBIYXkyL1V3dUpxejh4QVpZUlVtZ3ZoN3F3Y3c5SnNmTmlrd0ErMkpFemxk?=
 =?utf-8?B?eittTzlLYUk4dkpRM1M3NUI3RHlkNTkwSFFjYzRrLzE0TlBycWFXeFNQcHhm?=
 =?utf-8?B?SEE5YnRlOVd6dHJWb3NKbVlTbDY4R3cra0IzcmVLTllrVEZuUjdiZlkyd2Ra?=
 =?utf-8?B?NDRWNnNncWNMS2loSWZrMlFnREc5RkFENW41SzMwN1M5dURON1kxdGNqalk5?=
 =?utf-8?B?SS9Ma29wY3E3NlJVclN4OEduWVJUR0JCWVhQZlRwS3pKUE1FK1hzTXpHYmhL?=
 =?utf-8?B?dlkvemMrazV2V3FOcis5NkxYZXlVK1dYMHZwd0JvOWtqbVQyTFNyTlVCS1Iz?=
 =?utf-8?B?NlVIanMxU2FOdlNGVkpmUEZheGZLaUYrMldMVm1leG1Dd3ozSjgyMkZOWm95?=
 =?utf-8?B?aHQvTDdCeFNvMlpaSTkrUGxSZ1Vtb1NQaGdHdURUaWpZSVplNHBZMG0rdzN4?=
 =?utf-8?B?MHdzL21mRWdLZENyYWc1eFBaRTFXbk14VzM3WFZVMDFPWjU1MFRVNDVtTnlI?=
 =?utf-8?B?bFdMZHN2TDM1RHJVYWZoditvZUVBUFh0bjhIbXprVW02cHJBRFVGNmJJYVk1?=
 =?utf-8?B?RG01WjlCRVNxa1lhTSs4blJwQ0hPY0g4THg3RGY5c1NOekZpSmJ0RkRIdHQy?=
 =?utf-8?B?V3QrRVNoT1RpeUp4eDl4R212eWpLWjNkR3JMc0ZUbnVheFppaERQRlY2Zmx5?=
 =?utf-8?B?YU9TQXBGRldxaHpSWjNyZ3RLSFdsSXRGNCtEVTZPeTJlOXl0aUdCbk02azl5?=
 =?utf-8?Q?ugxZB0zPsoVkx8jwtMezd0S+l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5a0b0c-1ffc-49cc-d4e7-08de1a80a6a1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 02:28:18.8733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZdON6oftZg5JKtgbswvzdWh+GamlYEsXpGBwx8oheIUlAud4ruJk7C3Uc5BD46T6CaImPcIsey3wTzY98U2MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7734

Hi Tom,

In the section 9.1 SVSM_APIC_QUERY_FEATURES call,

"The APIC emulation supports the following APIC registers:"

The Destination Format Register (DFR) is also mentioned in the Alternate 
Injection spec from Jon Lange.

However, the DFR and the LDR both are not implemented in the SVSM code 
now, so the question is : should we remove the DFR and LDR from the spec 
or should we implement these two registers in the SVSM?

On 10/3/25 9:01 AM, Tom Lendacky wrote:
> Attached is the next version of the draft SVSM specification with the
> following changes since the previous version:
> 
>    - APIC emulation protocol added
>      - Coconut-SVSM will need to be audited, as the current APIC emulation
>        code does not completely match the "Alternate Injection Support"
>        specification on which this protocol is based.
>    - Reboot protocol added
>    - Core protocol v2 update:
>      - New flag to allow fallback from 2M to 4K during SVSM_CORE_PVALIDATE
>        when RMPADJUST/PVALIDATE return size mismatch
> 
> Please review. If there are no or only minor comments, this draft will
> become the next version of the specification.
> 
> Thanks,
> Tom

-- 
Thanks,
Melody

