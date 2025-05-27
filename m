Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D917194A45
	for <coconut-svsm@lists.linux.dev>; Tue, 27 May 2025 17:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368341; cv=fail; b=fL5LnJW05XrgjIMzw3NKH87P6FzU0CUJ2sIeIGYwKzVQBC5pAt69vErFuKTZFpDX8QyJmzjYHWqcGHYYqqJGWhnNsj6Y0p75Zm48+UAI20RFk9qSV92fk6O3cr2FzjA7KKz4EZr+Df+hEx+NbvnIzyVaQvNRVUWXeZKrr5bB4tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368341; c=relaxed/simple;
	bh=BHvd/MblyDhyVhCp5N9pJG3fawKSojvem+zlUR0kKPQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=je9/ji+0A2zJuHqmAz7CTL2WRB7vU9W7EpvhVeFPIq/wH1ghSFsmUYoA1G9hdPhhMVftULFvZMQjfigUCbIMmAVbxb/wC6rL/KfQppGIwn+oQb4LrQgRB5u8UB1Fb+Y7BRP9xGNS1LklXZYRzhwHOrY2j73Ajzu6Cb+KTN7b+ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wPPTc8T0; arc=fail smtp.client-ip=40.107.92.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wPPTc8T0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSEOKucjgaSq/Axa1KqEJfJVdnP9p3mBn71o5Ub94nKfSvGjW0cTSkMOYFzXnpzOQe2/a7xvngDOC2N6VGG9g/SWj2AcTILA4Z2oHZNSPEcGp9PbdyXzbSH5dHvRoazItWhndrsmDvdSkQMRvLbfqp485hthxOZtJyux5WQyLB8sz2Zh7A9YS1r4I2q5lVjNDBzqBNNIvuLhgLqWlNQxDD6wEr6Gr7vo5+bX6z7AD1/7omFthFX97iPRpuZp3e67/UhB4/FvN6V10fIG/L0mjpbZT24gW6IYw7WFhtJQ3F9Bu2jDkj0nPduWtF+ZMKKZtg4dn2bMfnyaHgMrtZgtLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=An8el57tL0IScqDoWkfZQz0/wpCBiV54kO9f9Vb3+Q0=;
 b=DJndTWDGnHXIBx/L4ZZnoWIqxNiTRbdE5p9WDi+GLCn7TSA1jbjbN8LA8Pmy81cpbFUaRDB3tro0kidNuXjAohhjHfE40zIhiF0f7LafBx9OuU03VqzRtiSBT22Aeg6n59Ke2g0KU6hd1N3o9tckmTYqr3uZyD6ilftPzbJ7kDudd2qs4wCTzgpVDkl3JTKTP/6njWmyu3fIULYTQwG6KwdhoKXa6SjakhwC66H6bcQ6m0dmGUH9F1hcYWEcC9vHBJqbkdDjU2f8CGtEeTwgqPE+4wRhp91dKTLB2L2na3oMHCGi1a4F8B9Yjveua7KPynVdLcIY6kiHdQx/tm+clA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=microsoft.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=An8el57tL0IScqDoWkfZQz0/wpCBiV54kO9f9Vb3+Q0=;
 b=wPPTc8T0PBIBiU21LEx7eKLf4u1kK5Vctqh/9ZzP9m01s51IG2QXFn14eznL7+3XcMCGlZoGv43TcPsy/y7tq7/U5iUeJvf9oYbt25v4+hdWKrj1K6GZJL33pQTUVhamv04pqO4n4B0tgrxGb27/XamV+1RlOmCLdSKvlWoEtEw=
Received: from CH0PR03CA0224.namprd03.prod.outlook.com (2603:10b6:610:e7::19)
 by DM3PR12MB9435.namprd12.prod.outlook.com (2603:10b6:0:40::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Tue, 27 May 2025 17:52:15 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::6f) by CH0PR03CA0224.outlook.office365.com
 (2603:10b6:610:e7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 27 May 2025 17:52:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 17:52:15 +0000
Received: from [10.23.192.59] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 12:52:14 -0500
Message-ID: <8dee65f4-24eb-4f33-ac85-59e1101c8a83@amd.com>
Date: Tue, 27 May 2025 10:52:13 -0700
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Alternate Injection related questions
From: "Melody (Huibo) Wang" <huibo.wang@amd.com>
To: Jon Lange <jlange@microsoft.com>, "Lendacky, Thomas"
	<Thomas.Lendacky@amd.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
	<coconut-svsm@lists.linux.dev>
References: <cfdc763b-2c6d-4f80-8fa3-ed8d07994021@amd.com>
Content-Language: en-US
In-Reply-To: <cfdc763b-2c6d-4f80-8fa3-ed8d07994021@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|DM3PR12MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: f5843b61-dbee-420f-d38d-08dd9d47376c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjJYT1VCeE5CMlBBcEpiSnJPeE4zK3g2d1hXRFJEMVQ2Q2d4OTdRMithZ2Ux?=
 =?utf-8?B?UVVkMVNiS2ZlbjJCYld4MVRnYjl0WHIwUEtDZU0vbm04MEhONE1LdEhzTFNB?=
 =?utf-8?B?L0RkM3hGNytHeG1qVi9hQ1hTYld1ZFl5bGVEcXdUR0oySWczbStCVzVuL0xF?=
 =?utf-8?B?MXZpRDl2UGhMSDJCTTBtVHJCY2NSTTdYWFBDY0oySnYwRVIxSEk4SFZTeUNj?=
 =?utf-8?B?eDA2d0hDMVh1YVNwUGkyNzZOTmJza2gvUCtvZTJNRW9Ca0lUOXZJRnY2bmRl?=
 =?utf-8?B?QU5YTVRjVDhMaEhITXVyWVl0eU5MbjJmSjIvY3RjRFVzcm9BK2pWYWIrZkZw?=
 =?utf-8?B?Z0dOdGoxRXIxN1phRldyM1RtQVVBL3BNNEtDY3hVUlBRUUZjcjFiVWFtUGcw?=
 =?utf-8?B?SjBraGhISTFVL1ZOT0ZHdk16VnN6UWJEbm1hWWtXVmY3WjRSMER4bTJZMTYv?=
 =?utf-8?B?S0p6WmJ6c21RSkdxczc1ejUyNkRodldpYTJtQXZQVVZqcTZUOGJySEt5cWhH?=
 =?utf-8?B?blZMem5jZE1RWmlaWXkweFdWVktFQU5DTnhHK1RqamVINi9Obi9RYlhNbEJ6?=
 =?utf-8?B?aDlSb2p0c1dVSEJxazNQZkRIaStTaGdrWVF6NlVDRHpiWXNmdmZJR2xBQUR2?=
 =?utf-8?B?ZmhrNU5paWhmRzdFWDlCVVJFNHN0a0hZUWt3czZIQjQ3QzAwTjd3SStxNUlo?=
 =?utf-8?B?cmM2dStPS3ozeXlkc21uZGxHSzByS3ZNd3BlbkhCTVEzNHJ2MlJQRXdKbGs4?=
 =?utf-8?B?Z0dIM0VSWWJYVWxWU0dGaU12NmtDcVgyd0NIc2hQT0xFck9nSnFMVGdqalp4?=
 =?utf-8?B?MEpmSk56WWtrZVpZNkh3OTE3OUQ2cWlwczNhK20yU3NqNXRSK2JIWVdPRXdG?=
 =?utf-8?B?U01IY24yVU54eWlOd3NTZHduOUZ2OG5TL2RyUnhpaWZmQjBITFZSWjM0bmpn?=
 =?utf-8?B?R05LVFN0OGxZVHhPSmZObXJIMmlLUE05RVZYMDdVWUlhMENCZTJnZVVQK3Jv?=
 =?utf-8?B?U05oMzFZVEFIRm9IZjlWb3d5akdRZGVJUXdvak9zbnVzb0dscGp2WkFzVFho?=
 =?utf-8?B?OUpqMTBMa3VPQ0poS2Q1WG9kM0ZJUEtzeUh1YVRhUVdYY2tNd0ZzZjdIUkFO?=
 =?utf-8?B?ZEpNS3gyZHlWSFVvSDRIa0VpbjJHbEpxTFlEN212YzhNM3FQWHRSdEtmNmpu?=
 =?utf-8?B?OVlWc0lFaEpsaFVTb25IL0liR24zeFVnMTF6dWZZdjRzNCt3UTlFanVzQVNK?=
 =?utf-8?B?UlE5Z3BFeTZUbmM5dzhOUDBzTW82NmVTU0Q0RDdJb1EydXlvQ1R0aXYvOTc5?=
 =?utf-8?B?b0NVQlpjSTJjOFIreU9BQkJQemF3ZGlLWXRIMDFHTXg4VGk5Q21YQVAzZndn?=
 =?utf-8?B?SlVhS2RhclZCTnRtRzBBNE9ZaWtrdHlRc29QU01ZOHArZGtDNE5xSVpXUWIw?=
 =?utf-8?B?YWZFTmhrMVZSQzg2NGNZbTlmQlpLNmxnNFgzK1ZydTVFYmQyOTBuVjdCMmhy?=
 =?utf-8?B?Yk9CV3N1c2ZkQmRCdjcvQmxndWo0SWlsNDlrcVBobzJQNjZqVUxhQk1QNmFU?=
 =?utf-8?B?ZDJKZ25lajZXelB1WHpWR3oxMFZIdTZlU3FjSEJ6bng3OE16dDVrV3BVYkwr?=
 =?utf-8?B?dUtKU1BaeHkwZHRXVVFYM0JoaUI0OEpna05ha0FUNlIrWUNsR2RmRGlERXVy?=
 =?utf-8?B?b3BoR1BTU2M2b2xaRU9LeE5KR1pCM0hqYmpYNDhvVExibGZWTzVKcHRpcVpD?=
 =?utf-8?B?eWkzV011WnJCdGhOcjhQYmFvYjV4aU4vK0hiWmsvR0JLYzlIdENnaUl2WGV5?=
 =?utf-8?B?cURWRmtXZGQvcDBkME5KSUNSTGt0V0JlVEdHaDNKZGtlZUJiOWFBeVEzamhq?=
 =?utf-8?B?M3V6Ulh0TnhENUxBS2dNOUNLYW5aRzFCRXZCTEUrM1RQR1ZwbzZEVUdjNmls?=
 =?utf-8?B?d3FCbWpJVS9FSDVxYVBiRUtjakJ6c3NDMmhWWlpUVStoN1hTSEZLaVUxMzRS?=
 =?utf-8?B?MFB2VVZyV3d3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 17:52:15.3796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5843b61-dbee-420f-d38d-08dd9d47376c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9435


Sorry for re-sending this since I had the wrong mailing list in the previous one. 

On 5/27/2025 10:39 AM, Melody (Huibo) Wang wrote:
> Hi Folks,
> 
> I have a few questions, can you please help?
> 
> I found that when an #HV arrives when interrupts are disabled in the SVSM, the #HV handler will postpone the #HV, but the postponing simply returns.
> 
> Who should re-inject this #HV again?
> 
>     postpone_hv:
>            // HV gets postponed
>            popq    %rcx
>            popq    %rbx
>            popq    %rax
>            addq    $8, %rsp
>            iretq
> 
> Is the hypervisor supposed to re-inject the #HV hoping that interrupts will be enabled?
> 
> How is the hypervisor supposed to know whether a #HV which was postponed, was actually handled so that it doesn't inject it again?
> 
> In SVSM code now, the SVSM will read the doorbell page for extended interrupt information without checking even there is a #HV coming in. Why are we doing this? I think this needs to be triggered by a #HV handler instead of reading the doorbell page automatically. Right?
> 
> I have one more question about gdb tool, "https://coconut-svsm.github.io/svsm/installation/INSTALL/#debugging-using-gdb". I tried to use the tool, but it does not work, I have enabled it :
> 
>  "kernel": {
>        "svsm": {
>            "features": "enable-gdb",
> But not able to make it work. This is the log: 
> 
> $ sudo gdb --ex "target extended-remote /dev/pts/4"
> GNU gdb (Ubuntu 15.0.50.20240403-0ubuntu1) 15.0.50.20240403-git
> Copyright (C) 2024 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
> Type "show copying" and "show warranty" for details.
> This GDB was configured as "x86_64-linux-gnu".
> Type "show configuration" for configuration details.
> For bug reporting instructions, please see:
> <https://www.gnu.org/software/gdb/bugs/>.
> Find the GDB manual and other documentation resources online at:
>     <http://www.gnu.org/software/gdb/documentation/>.
> 
> For help, type "help".
> Type "apropos word" to search for commands related to "word".
> Remote debugging using /dev/pts/4
> Ignoring packet error, continuing...
> warning: unrecognized item "timeout" in "qSupported" response
> Ignoring packet error, continuing...
> Ignoring packet error, continuing...
> Remote replied unexpectedly to 'vMustReplyEmpty': timeout
> (gdb) quit
> 
> 
> Thanks,
> Melody
> 

