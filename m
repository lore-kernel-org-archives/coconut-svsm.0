Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2041.outbound.protection.outlook.com [40.107.96.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB5C222594
	for <coconut-svsm@lists.linux.dev>; Thu, 14 Aug 2025 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755185564; cv=fail; b=rO7GYkUOrb5l7IdvLsCNGfJVwVLvUPiDJO7L6BQlkqq7wpZiELuvX0lJlFsiiY8CjoUe9rrktP/ip2BfE7lcyxyQCLK35KWzKA+dOs82OPBO0ZoleYehq3A7tv+iyI8oyOW+8WOFGrLlN9vsp7/nK1jPiuDoM3ZZYBWFq3S/VKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755185564; c=relaxed/simple;
	bh=RS0/+TTTDa72UJxTYLdQ8n1sIo/Rtkq+DOR/oVzHn1s=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=lvBB1l0JDa5KCqUaTUJNTGoEBQrPTILT+HXJnSgEdTba9OjN8uKQYXu3zszcO/wMhjv9DWM3s72rnmWRN1N8TZAOE+OyFCGWPdFR/3mMUEivr3pimvf+hnrQG7AQ2AsYMj7jYSKPeY0iOnO4/14W7WEyjWnitJofG7HC51Kt56U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yP+6Ln4t; arc=fail smtp.client-ip=40.107.96.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yP+6Ln4t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1W9HXQHKTW10tjZgop9Rwj1OakTuNWUqnzxJkL7uohDnUBPzJ3AasrVJNJFDoGPr3TV4msyE7Mr84oledyLfwUMvMf4zbzCGvMtpUURHqm0hTEOF6KrK2qCV1MJBf2Z5C0bh0excut9azsMM1L1bXM5+NDLBEMc68Ox3EzJanTUlRK8DSZm0dpgoclXUuqsBmThqCR3CxXzv8jYFbSsZYuwoPfWXnyqK46faqZ17sqv6FdolmHLMix2ylepeO8LcE0In1u7XkJKwod3aJIR+0s6zpbEafP93gm1LrM/MwckzJJPgm0BhzsDJXP/Dw5zWAHy2H6ef1cKukDrc82TSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnaNd+dF+sblKg8oQd53IVa2fTX/PDwuhqp2UbmBLsw=;
 b=lCxwg55W/dtJU7gAKb+K8IxVxDgVADqqAIdGGTnoQQiiwnujyH2GAv8ffly/RL+bHtWPewU1n/ZlxP+GtDy4rGMk3/xNyQjkPpBCBi8KSwHppX6kkyv5k9+xQCCVEtNHWbCVH3wgJWsJBMGmnG7USBwedADL8ALxVTnzaQ78KCRr7kYDF/7WjqJRzhSv1Bk0Y6IB4dpqPECIxF0HS6QGE/6vO16uVOYDGzREYZfwMfFrn6YyR0lnLTwTgMR85WYZZWuYf3X3jVj+vWXwbd5+MtKvvH8lEchvfQftzQfelTh/2GUjniAXBkt97kX8O8bLNDHlzGM5LCMPQk48fHM9zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnaNd+dF+sblKg8oQd53IVa2fTX/PDwuhqp2UbmBLsw=;
 b=yP+6Ln4tCAoBc9i/Vs3dehJOxPhH1TgxWJn+7mCcbdpd9sz++gpZGWMt4tcmxjJdxF9UCUyya5DLTHjO+9kba8Yr0+2CBpeGpv7YcLqBfb5kCYiE2o/RwEoHULYFNufhgpHkdd9hq8yaJfrth1D8ohX992p1PdawSwpYeEE6xOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19)
 by PH7PR12MB9067.namprd12.prod.outlook.com (2603:10b6:510:1f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Thu, 14 Aug
 2025 15:32:39 +0000
Received: from IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1]) by IA1PR12MB8285.namprd12.prod.outlook.com
 ([fe80::641e:18ea:bbe:19e1%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 15:32:39 +0000
Message-ID: <cbbb95e6-37a4-43d3-9b93-db1703149bfe@amd.com>
Date: Thu, 14 Aug 2025 08:32:36 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: jlange@microsoft.com
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 =?UTF-8?B?UsO2ZGVsLCBKw7ZyZw==?= <Joerg.Roedel@amd.com>,
 "Kaplan, David" <David.Kaplan@amd.com>, coconut-svsm@lists.linux.dev
From: Melody Wang <huibo.wang@amd.com>
Subject: Issue in handle_icr_write
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0106.namprd07.prod.outlook.com
 (2603:10b6:510:4::21) To IA1PR12MB8285.namprd12.prod.outlook.com
 (2603:10b6:208:3f6::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8285:EE_|PH7PR12MB9067:EE_
X-MS-Office365-Filtering-Correlation-Id: f114e9ba-d1b8-4c23-d571-08dddb47ccfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2FWNjEzY0ltUFVoell1eEIyUVZiMmhHdUZDeUFmL1ROQ2NRMDdIV2MySlcv?=
 =?utf-8?B?bVExUmJGU0NPWWljcWhwK254d0UzaytleExIejBUR1Rod0d5dVNGdlBzSE9P?=
 =?utf-8?B?ZnF3YXlsaVA5d256cjIzOXNYYzZjNmk5eDNkd1VPaS9uRXZ4TnFta0ZadXNE?=
 =?utf-8?B?aWVmZGFaaU1Dd0hJLzZibHVNVTZvcnVDcktGL01raE42NnNiNktDZnRWL25u?=
 =?utf-8?B?R3lIWXhxOFpESlgyNHl6elZ5eFladGhRUGJ1RU44VU5wQjkyUlpvWHF0Sm0v?=
 =?utf-8?B?N1l6VnBPL1B4eTYrTDNiNlFtSEVFUVZ5RzdBMzg3U1RTQjZoTFFXYlV3czUr?=
 =?utf-8?B?Y0FFcnFISWY1NFNRcFVMeTIyZDhoTTBNVXdRMkQrNEJid1BSTi9Ic1VjWEpj?=
 =?utf-8?B?eXgwU1ZpT3B1SFV1QUdyTGxHZHU4d1NUSFVOenhsVzVIaERvZUlwOGtyRXd4?=
 =?utf-8?B?dFV5QXI0bjdiSGxxdzkxd0FyZ2c1b1pxNkY2RUk2eEtDZ0JxNnlGemV5dE5Z?=
 =?utf-8?B?OUJPMTM5MGVVOHV3WTNHaHJEVnJGR0ZiS1FtRndiajFGWU0yemlVbEVoMUQx?=
 =?utf-8?B?cDhLNUhML1dLWndqM21XRzFVd0ltK3F1ZzM5Um5vTW4zdmEwSzJ0bklFQmt4?=
 =?utf-8?B?RWpuMTBVZmNPZjRpZGNQYzRrOHhacVU2SXZXQVdDQ2hGNkYrNi9LTFRrcjFM?=
 =?utf-8?B?TlVIUW1STVpyWmVqcC9VUHQvT3RZY2MzY3ZwVTZ5eVdGQTZMaVhWdW1HMERU?=
 =?utf-8?B?NElOdlM1Nlh5MEl2QzRwc3dRTGtsYjBuY1RPa2I1Y1dCQU9DMURzSngxelMw?=
 =?utf-8?B?VUZtR1FTWnRWTThMaEFic1RjMHQ2SDk0RXRzM2hUclVhUzJoUXpxSThnYURB?=
 =?utf-8?B?c3B4R0kvZlNWWWd6dDRjUm91ZFprZm5Ya3g1SWtXNjhjSGRLcnM2SlZaNFNB?=
 =?utf-8?B?V25zcnkxYnhVbGZiV3V4bEdhVmJLaTZJNlRxeER1TUtiVTE5S1VsTm1yb2JH?=
 =?utf-8?B?eFhPejhhbVY3TU5BdFZoeENCeTMzWE1YSTRSWm1WbDRBZ0lUQ1BldjNjSW1s?=
 =?utf-8?B?a3hIU2dGSkU5VnVvTFpWeWdocXBGZ2ZmVnJQcHpLNWdwcXJhVVlWeGNYT2NL?=
 =?utf-8?B?RmxwSDJMeW0rMXpPc3lZcEJFYzFsam9qR3pRMktEQnZMbkV6aFNvWHVSdGR5?=
 =?utf-8?B?UXlWQzlWbm1KTTFWdDV3NEF3MTIxdUkrck1hTmJ0bTViNW0rV2lzSHdzTlRX?=
 =?utf-8?B?UHFXVVYzQ2lpVWpaMFJMNDE2Tk9uWG15RXZwKzhva1pHQko2aldrcWpTKzgv?=
 =?utf-8?B?VTFZcUZCQ2NrQ0VVRFFQNVkzTjNRZm55Z3RkdDhiMzZuN2lQSnE2RWdFYVJ5?=
 =?utf-8?B?VWgwTFV3akxCaTZqQ0FKWDl1TGR3eDNsU0lZbFBXdjZDTWFMSkFFcG9IeVVl?=
 =?utf-8?B?T3BNL0tYcld3U0g3Y2pOSmY2YmMvQlJJUjBxWXE4ZDcxY2V2MU10aXNnTlpi?=
 =?utf-8?B?N0YrUkIvM041VHpRc3RBWnBzY2d5aUFORkU0RzVLQ3pBcDkranNFUnd3eHR4?=
 =?utf-8?B?WHlyVTJhZ3JMUloybnRvaTRnR0dpZ05HRWxDTXZ6NTlEeldKWDFvZ0JCbU41?=
 =?utf-8?B?a3grUXhMRFpJTnM1L2pMYk9YNFFsZHVFQkM3aFVDTmNkSDRkYlpINGFReGlZ?=
 =?utf-8?B?c2V3MFYwZllFcnRPZ0x3L25tL05BelZUS2E4Mm1Xci9rc01BeFEwenlreEU0?=
 =?utf-8?B?eUZud3FHeGQwWndRYkV1ckthSGZYYTlPZ2pwUGJLYnNqUytTZlA3NDNjSmd1?=
 =?utf-8?B?b1hkZ1EzSUFQUG54ZHltT2I5bVh2SDlZT3lXcWtCdHhsQ3paZXM0emp1alE5?=
 =?utf-8?B?ZHA3K3kwcUVlTmZkWmF0ZGdScS9YNERwNU5jb1lXS0lBcGc4bk5QSk9WZkZ2?=
 =?utf-8?Q?y8Xs+khRUfI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VExDTVpvK2tSOGU0dWhNNjNmQ3FOOVk5QlA1N1dIamdhdGIvbURQUFozNkFh?=
 =?utf-8?B?a2M4T2RBam9lVnJLekEwTDVQaGpsZmNyS1pMdnV3eThzclpyUWY0Sm9HeFVZ?=
 =?utf-8?B?T1QxYjMzb29vR0svTmowZUdJOFRrTkdLWEs2YnNRM3dDK0VFeXlsaDZ3bm10?=
 =?utf-8?B?MjRzYXl2U1ZYQ0Rhc3A4bXJCeTdqODdycFFOWHJ3WEpFK0IxbWdVSHFLVnRU?=
 =?utf-8?B?RXQ3NFd0dG9aMDBlY05EeUtrL1phNWZhNHV4R1dwWkhGdW1ZamFHTmNHUmdx?=
 =?utf-8?B?RzhKMzZUVnZjWkZkQng2VUZPWDMxSUNiSXZhdFFaTW9xNEZTN05KQlUzZlBP?=
 =?utf-8?B?eVAySWd2bnNROFYrOWRKdGE1T290citzanladjhmVFZ5b3pyYjBKRTJ2MkdJ?=
 =?utf-8?B?ZXgvbi9QTTN2bVhNNG9qS0dxdnVTQjRZaFNRaEVTeGhRUHNzOTVaWndkamNE?=
 =?utf-8?B?dnFKT3NSQXJlVlhJWENzRk1ETVRCY3FreEZVMWFqeVlLUFZrUm96cUFOWHU1?=
 =?utf-8?B?eHVqY3JoTWkvUit4aWZKV0ZtWTdzRnNITDZHQ2tJd0QrTE1VVTk3U0ZqUmxP?=
 =?utf-8?B?V0lUY0dTd0p0SHZ3R05BNE1uTXMxNjZna1dxaEdhRGV3MGlIMEd3NTIxRnlC?=
 =?utf-8?B?VDk3RkZkbWluenlxbDc3NlZIN25KRUJhSkZKRjFYbVB6cDluOEQ5a1RURmV5?=
 =?utf-8?B?M3Q4U0dPYTcwUHoxWWtKSlE1R0tWYklrdDhqOUZnMmx0ckRuM1BVNTQ5SlNH?=
 =?utf-8?B?WnZ2eHJaajBiRXQxVDkwSWFvYXV6MW13WUNHSDdNVkJqcTRxeklCdVo2V1U2?=
 =?utf-8?B?Y0lqb3NHQ2lzcEx2dHh2MkwvVm44cFVKOU1SRzA0RUlpc1RLYzgzSWN0YWI2?=
 =?utf-8?B?bTVNVGJrMjA4U2dveTBjZEVVUXEwNHBFeURjalFrb1NIeHp3YWEwcGJKdjVz?=
 =?utf-8?B?ckNya0IwYjYvbURnbWJYZkVwN3ZCWWdwNzJjV21EbDlPcGJ6MDR3cGFCbFpo?=
 =?utf-8?B?NWsrdWJWT3NPaWpXYjBEY2l6Z0xrczJ4V3FHSVNkUjQ1aFVaeFU5UnpZT3Vv?=
 =?utf-8?B?c1QvcnV0OENmcTE4OFhtUE5yK3hOZmlwQUJHY29ydUlSMURLV0NTNlV0SkU5?=
 =?utf-8?B?K1FSTlIvMjMycUxpVXNySC9RM3VacTZtRmRvUmUrZUg5SE5XNDdkTE5tc0NI?=
 =?utf-8?B?WjZmeGdyeFo1bVRUN1BYL2d6MVgzSFdYZGdsTFNoT0c3WUNVZkZvSCttWHl0?=
 =?utf-8?B?RnM2UTRHVGx3SnhKRHBMVElxQTF5bkNQMkJRcndJWTI3Zmo3cGRvaldHSDND?=
 =?utf-8?B?T2haMzJhMW1aUjJYdTVqUEIvdDVCMk1KSjdFMzhWeUFNd2R0Yk5yK3ZlVDVI?=
 =?utf-8?B?SkdCdmxjT3JUVGE0RXVQTk16K1c5ZG5yMmMzY2h1UTVFRUE0amZNSGNWRVVH?=
 =?utf-8?B?UXlYK0d5bU9JU0ErQ0Y0Q0ZJUHdKS2R1b0t2M1hGZW40RUlPZnBYVVVqMmdo?=
 =?utf-8?B?UHVxT2l1d01ETlczUkFTRkRYT1dUSXBLWHlJbDVqVWZ6blN1K29SejQ5M2x0?=
 =?utf-8?B?d1FBYXA1eUNrRU4zYzJmTmlyWkx1dXRSUThnZFlucDBWa2lDNnF1cllKdHMz?=
 =?utf-8?B?cTZTeWcwbFFONGhnQmxjWi9FWTFINllXR1M4bHB2Mk1Ba1VWdzI0bGtRUmU2?=
 =?utf-8?B?ZkRZSnltb0dncGUzd3JGSFJsTTdmbCtFQmV2azFHY05oK2IvNGpaVUJTaXFY?=
 =?utf-8?B?T2x4em5BQkVGRnptOE9INGRNWDdJNFZDUUt2a1lmSFJ5blc0Tk5Icm16QlFB?=
 =?utf-8?B?MmVWSlZXYkxlUngzWHE4RVhSTDd6SlNNMHRpV29scWxXZWp6SXhNaGl6YWh4?=
 =?utf-8?B?Vm5BbFl4MGkwS2J3cTZnY2hDNVhuNlhTL1RYN1FCWWRlQkRaUXkrM1ptaWk1?=
 =?utf-8?B?bWFzVzREUWptR3VHQktwbEhGQlE0SnhIYWtqc2hybU1pMmkvU2t1eVlpWnhS?=
 =?utf-8?B?UXk5VUFtZ3p4eSt5YnpPQ3hRalZDMkpJbnBZTE5QWjN5WGR1L3FqZUM0cDdX?=
 =?utf-8?B?aVhFSjhrWCt3ZUwzSHBCUUpDeEdVcWxxSDVFOXZzSElyQXZHS0kzRDZnUmlC?=
 =?utf-8?Q?hMKuFyMxZNdGBQnb9f+aoC1kx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f114e9ba-d1b8-4c23-d571-08dddb47ccfe
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 15:32:39.1418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCy5nKGlpw78hgIJ/DmpEuvJsDysAh+COvMuYplKaDchB293fwNeAU6/U1i7bSM/0enTQUN7IQPprmpLJ3mu0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9067

Hi Jon,

I have been working on the PoC of Alternate Injection, I found there 
seems to be somewhat of a problem in handle_icr_write:

For the Message Type == Fixed you enforce

     trigger mode == 0 (edge triggered)
     and
     assert == 1

In practice, actually, those bits are largely ignored.

The Intel SDM says:

"Level:

For the INIT level de-assert delivery mode this flag must be set to 0; 
for all other delivery modes it must be set to 1. (This flag has no 
meaning in Pentium 4 and Intel Xeon processors, and will always be 
issued as a 1.)"

...

Trigger mode:

Selects the trigger mode when using the INIT level de-assert delivery 
mode: edge (0) or level (1). It is ignored for all other delivery modes. 
(This flag has no meaning in Pentium 4 and Intel Xeon processors, and 
will always be issued as a 0."

Basically, the hw ignores those bits and this is how Linux has been 
doing it since forever.

Example from me tracing a Linux guest:

[SVSM] write_register: 0x830: 0x28

That's only the interrupt vector and neither of those two bits are set.

So I'm thinking we should simply remove those checks.

What do you think about it?

fn handle_icr_write(&mut self, value: u64) -> Result<(), SvsmError> {
         let icr = ApicIcr::from(value);

         // Verify that this message type is supported.
         let valid_type = match icr.message_type() {
             IcrMessageType::Fixed => {
                 // Only asserted edge-triggered interrupts can be handled.
                 !icr.trigger_mode() && icr.assert()
             }
             IcrMessageType::Nmi => true,
             _ => false,
         };

         if !valid_type {
             return Err(SvsmError::Apic(Emulation));
         }

         self.send_ipi(icr);

         Ok(())
     }


-- 
Thanks,
Melody

