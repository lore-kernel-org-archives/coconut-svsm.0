Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C10272E61
	for <coconut-svsm@lists.linux.dev>; Wed,  2 Jul 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464460; cv=fail; b=ClvXS8lRPTr2w84iynkMKX/dAYt7PqVhXYOvL3IcnDqkkU0VStmOUYGOHq/5v1WHk6ZrUI2Jhu2WwLXGsJ0SqE/EWB7Kf9lWBOIi9E5FT2pulzefGXWYlr0hVktb1fnJUZISsWEoPz2dADkNXVZPrFcuXx7LP2LFUQgo/PYOFzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464460; c=relaxed/simple;
	bh=2PkBta128cH4Kn2aAoiRMZH8Z8l5QVNTgdRHVzpWiy8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pfESFmVnOv+m7DZdW2AxNjzGL5vpVYbj3wH8+IY5otqhry/jhJ0uFGHWWGhXqF+YgUe5S5unRhKPLk6mDqnrGl8ew0Aa0AOfBnUwSaaQK843KohSwcQEcNPGfbVeaGnTYmhiYkbicGfeINOS0pFkMrlQBtL8zHpOYmUGH9h8BlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N9awGcnk; arc=fail smtp.client-ip=40.107.95.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N9awGcnk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cF/u2ulisotv6znsXXpwPP+Hw6KY4n3o6LoO0wRqaAXxBZBeP0yD9SDTuO+vAi5iH101lxsNgmUbY1Ppv1qUuAKKhNrRr88fYxu50MqCV5zz7ZKOOydYIC+o0j2B1xgrfQe8RSzkCU7voi0Qan9uqD0y7UndaM2Em0HYp7fyzr/VrqtlKiR8mOPmGxkgv9em/fFvpe26wE3KIAcQGdDx+rMjNwd8n9CMwq2w+Ck69nILUJRIe4fzK6CPKgXLJRJjbK+8rLZDI0yscJTmksyhv9MIUWjePlD68fMhPuBkFwStAq0s40i9UPRspBzFkkDo4ZIBbPhuk6HKslrCwqwURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGL5+mkvZ51cNub7fBHO+50p0xJzGVIHyk35p2HqjQw=;
 b=eAcTUQTMNIaZRyxbRsp/5FJ0xeHtbDka7FnkJ5qDaSPBqx8iir+2fCWq7b6U+CGIBd1P9Px2DuQgpb075DuzXaXQ/TsoOQ4apMffuvaWiSi1IuLEVT7cv2B9MS1QLaar3BCr+YbQsQmKpBAALQzH9Kibu7m41ivnh+yOUcLhvlZc8mqTykGYpqH6S08MaQCxu6LxEiLTNsDfZREhC3k3rD/qx/Rn2GW0/ypCZCnB6UTHpGjwwHucdDBQx6RlWFaoK0D0wHINFrgxJoU5SCJ3BH2Tuu4jjWddBTyhhMHLo1cEJP5oVxAOyHBgOe9qtwdUbVPqK9S3wfESJhFIxXlF5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGL5+mkvZ51cNub7fBHO+50p0xJzGVIHyk35p2HqjQw=;
 b=N9awGcnkBK9pESx5cY+FPcYhYjCgFdWS62bdpkDAIDs65iY3+Mk0BlKC+sb52uw+Xe0i5DrzAzqJyA/A9Nv4dWtt6/6RHE8j9ZgPr3MpmybQgtUdGc/uVXffj0AN6UjZQj68UTuD9j1qVciubrlo3j8r5jcdjJxihiJU2NV+cZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Wed, 2 Jul
 2025 13:54:14 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%7]) with mapi id 15.20.8880.024; Wed, 2 Jul 2025
 13:54:14 +0000
Message-ID: <d5e3421f-311b-b5ab-67dd-7fb1b970e103@amd.com>
Date: Wed, 2 Jul 2025 08:54:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: SVSM draft specification
To: Geoffrey Ndu <gndu8086@gmail.com>
Cc: coconut-svsm@lists.linux.dev, Dionna Amalie Glaze
 <dionnaglaze@google.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <fe3a4825-d079-0fe8-3fda-ed16044a048a@amd.com>
 <CAH6wD8WM3Zk2uy=nmaPgZ7LKuFSpNfYc7W1tuQJSnWQF=vN0eQ@mail.gmail.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <CAH6wD8WM3Zk2uy=nmaPgZ7LKuFSpNfYc7W1tuQJSnWQF=vN0eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0193.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::10) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a3a3fa-43f8-41a7-fec7-08ddb96fee01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTVtSmxGVnRQSDJDcndRZGFJSkYxZXpBemdWMFhrQkIwMDFUL0xWdFRsblp3?=
 =?utf-8?B?d2VGS3VjczdsQmE5NExBUTJMQzNlV0ZHMGpocDJCYlVndjdsYjhCV1p1a0p2?=
 =?utf-8?B?bDhjbmt1YzdYZUdaY2NacnAwbFVhbmZKaUtUWVl5aXBDWXByVnd3K1djMU1I?=
 =?utf-8?B?aDN5Mld3Z3pNempqVlFiZS8yZENJTmwzamIrSVFDeE4zRkhuZ2ZycmR1QjFW?=
 =?utf-8?B?dUNrbnlBMHNSL2oydnVCekhnZkVoZ29lRjFWeXlnaUVXNnhWcS9obTZveGlx?=
 =?utf-8?B?dWkxaEJRam9sUHIvRGhIam5XUkhNdmJiejR2WWpxaUF2ampOSXAzSFhZdW5W?=
 =?utf-8?B?ekh1NUE0d3cwWjFzVjdxQk9ZV3ZvdUFmQjlJdGtweFBxMUZvVkVySVd6aCtj?=
 =?utf-8?B?cDRGNzBlQ0p6d0l0TnFyWFVTR3RzRVlUYm9wNFpRUkNMT2RFMUhjdG9YQlo3?=
 =?utf-8?B?Z3EvMEVVamdUR1E3OU5tRk0ydSs3WkJ0VHdxYlgwZndYc1NQWGpiNDIzM3Az?=
 =?utf-8?B?d0pKOXJseXZzYkJNK0ZvSHRBVmhWaklEUmo1SVU1V1pWUnI4NFQ0bEtRM0V2?=
 =?utf-8?B?MlllTDRKNmhEN0dnNXZMK0dBeFVrWjhrOWsyT29PNGJydVdzUWVsVnNmUW5l?=
 =?utf-8?B?OFF6MmxpNGQ5ZXlSQ3pLeHNUTlVGVExlZm1WLzc3ZEpSNHVuM0k1SHdMRm5W?=
 =?utf-8?B?WXBySzI2NjgzV1d0N1dUeks4dFdsK1lWc3VERlpFZVczOVhHZ2xwb3VpS2ZY?=
 =?utf-8?B?SEZLbFNZSnU1MlFzRHhsdXFKT0F5WS9lWW5Gb01ldDg5cVVoZDJnK2wwRlE4?=
 =?utf-8?B?TDdRb2lLUUdTcHM5dnl5ekFTeWJvbzI5SFRKTWNYeWNnOCs0T0d1aHFmK0pp?=
 =?utf-8?B?S0V2ZG9JQUswS0ZzKzdYNkVOUDFBcTRic09iSzlWUTFyYXRxTXo3MzdWNEdv?=
 =?utf-8?B?aXdUQVZEMEswK2toVVQvZ012NUxCVzlvMVF6TFdMTGdqY1FDc3FKRUNVbFBS?=
 =?utf-8?B?UDYydkV2QXE2V0Z1S0ZNb2l1WXJMZEc1Z3ZGK05keW5CTkVyandqQVhlbmZ5?=
 =?utf-8?B?dnliTTdCS1daTEtHcERLWjU3czJuN2p5VGg1REovT2tWTEZIQnVWTnpjbktV?=
 =?utf-8?B?c2hodHcvZmdvWUlXTG9zMXYwT0o0WXRBMDJIR2IxVWFRMkV0S2VnRGo5WHVu?=
 =?utf-8?B?Z0FGZTdkdy84K2xxSG1pRzdJSnh5YlFEOTdOQjdNVFM1dXhpQXArczBYOFlB?=
 =?utf-8?B?dlNNaWQyaEdnd2txNWs3Vk9aOFZpTTduUytqelJsNkhkSlRzb2xrcUlSelVD?=
 =?utf-8?B?bGloRkYzYXBDQWU3MUtra3pYUitpOVhtRHQvY3d4bUVYVUVENHkzaVo1Yjkz?=
 =?utf-8?B?RXVFYmlSVU50akppZlRkREdmZE9jcXYrQ2toNjhnZEQ3NHhQTkU3QVF4UFpq?=
 =?utf-8?B?aE1zd0h1bnA0M1ZnM0ZwY3RiWTVzTk5zQlB3K2Z3VGZPVi9OUmpwaGttUGNm?=
 =?utf-8?B?cDVuNmkrTjU4cG1pNWZUNVozMHBXQ3pjUmhUME96TnBFMGE3WGJrVHhXZFNZ?=
 =?utf-8?B?aUpOUXNtNjlFSE1zRVhic0h1U1VuUDU1UitBb0VudzRrWG15VVdYT01wL0ND?=
 =?utf-8?B?ejFwQkF4OEtrS2hUMzJkaVFxOU93U3F1RGhNblg5K2JvNE5DaWE5WVlXb0tK?=
 =?utf-8?B?QmxTcENROVc1ZjFxTjZ0OEd1YU1FTkkwV0liVklZQ0t6TmZBRTZYUEZnaWZP?=
 =?utf-8?B?WG9ESHhwMk5LUUJpbm84R1JwN3YrZFVjTDhnODJKS2FNKzY3eUJKSWRoL3Az?=
 =?utf-8?B?ZmtMR2diSVQzVEY4K253SWpBdHdtZmR5b0RWYk5CREVDWlVMU3NFNVRXWnRJ?=
 =?utf-8?B?bmtHQStDMHdvNm12NXdOV0JhaWRhQnVWSDFmMGlGbU02akE3QnJoV2wyK0dO?=
 =?utf-8?Q?ACjQIuc+mIQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWhJQ3FBeTU4QnhPd3BHb1AwbkNiU1oxNVpvNW5oeHVtalRhcldyM2dORU5M?=
 =?utf-8?B?K3hPWWdoV2tlVXo4Q0ptM3paYWljUnB5dVRrQVBxdExUSUppTnYzYVFOR2dx?=
 =?utf-8?B?eG1raHRMYm1NU1Zod0RHV3RjY3lxekExZ0dKVlZLR1QzZERkTEhUaWtLYlE5?=
 =?utf-8?B?akdTOVl6dVRxeUh3VEZ5SmhBMlBOYmtITkVtakcyck1pTHNSQVpuVmxsRlA1?=
 =?utf-8?B?aFVTais5cms2VWM1ZUtEQlJZdXJJYm00TVE5QjJ4TkNWcXZ5TEZxMUxyMHZQ?=
 =?utf-8?B?WGF3TEFHdFB0M00wM0FOY1R3NWlHMVpCcGtmWnduUjBsK1Z1M3NySUQrMlpJ?=
 =?utf-8?B?Mnh1R0dSdnhjN2FyWnkxR2JmUFZNeWs1bUwrajhjb2JNRER4LzlkeG5HOTNn?=
 =?utf-8?B?dE1mMGUzQjZsakJaLzhQQlhmcVVEOGNUZEpGM1dZWnowa1FtZmRDNFN5YTMw?=
 =?utf-8?B?eEpXRXZUQm1JWjd2K09td2JyNjRCZXlwVlM4Uzc0TEphVlV2ekFHdi9GL2tR?=
 =?utf-8?B?anIxbUd3ZlBmVVlQYnRQcExqVFJKUElPZXJtRi9waUR6N1NkSCt3UFJEOTZZ?=
 =?utf-8?B?UWVac3kzMGF2MDQvR0FnMW9tZ2JUblpDNVNqMzJuK3JrNUJYOTM1dm1Hdkcv?=
 =?utf-8?B?K2RHdkk1Q1V4SmRmTTFOT1l5SzVxMERXK3hkTGhkYmdRTWpEQmo1S1dxakp2?=
 =?utf-8?B?MGU1eTJyMW5GNTBCMTN0MFR6d3N5aTRkdklaN2FFYWxDelg5OFdPcmM0T2s3?=
 =?utf-8?B?aFhpY1pIaUZLMXVHZWVxNG5hdEc4aGMxSVdmV3pyYWpTTjB2TFdNeVRnLzAx?=
 =?utf-8?B?TjhWNVNEZVJ3RTY5Q2hhRzVhNTRZRklTT3JFdWMxcFgvN1U4T01DT3B6VUJZ?=
 =?utf-8?B?K1ZGdFRpYmpTWmtmSkxpdlNDZzZnQ0hxSkN5Q2hYaW1vdVplbStLZGV5VTNj?=
 =?utf-8?B?NDJ6UDhHMHcxaG5VRndPakxjWFhWOUdpWm02UzlrdC9mOTc3ZEJiTXVGUVFs?=
 =?utf-8?B?dzNmQ3VlZ3VNSGRWK08rUldtTWxuaXZVSE8zWk9NZTU4bGxHSGdEVXBsb0Fr?=
 =?utf-8?B?S3ExMjVlTTlTbngxWFFRQW8rbFJvMVB4dzBFT1lzMlNuNW54b0s0LzQzRXdx?=
 =?utf-8?B?TE0vMWNiNDNhMWp5ZGN3MkE4S1l1RThDcUJqa3NPWXVGUDVBRDBqK0JjUUhr?=
 =?utf-8?B?dFB4MERidVBwQ2pzcFFqUjVaUEc0LzZEZDBHdWUrU2pqd25HZkQ5YXhvaU42?=
 =?utf-8?B?NFBlRDE4dVg2K2orZ0NVZUFMSGM4VG16N3BTWE96ZHhITEpXTjRFVDVZUFBN?=
 =?utf-8?B?Z21WRFh2Q0plUDRDdXNNblJsUlhuWTNYaXNBSDVRSHZHdnE0eDFnM1R0VnB6?=
 =?utf-8?B?VzFDbmJiZkw1c3VQVkViaTJJOTJxWXNzQWRvUlQvSnlNKzhwZmpXdGgzc3BR?=
 =?utf-8?B?T2c5RWNZbWJ3alcwN3BZNjJrVmlaTWxaZXdNdDZzL0VGcGU2RGNuV1lLUXUv?=
 =?utf-8?B?Uk0zZ3NsU3djalhSNkJUQ05ubGtOdlpsV0tMWUNkN1c3NlBRbEhOcytDZFZ4?=
 =?utf-8?B?STh3cnVEZ1QvN2JEb1Z6V1lYTFhNL0doaHRMU3pqUDZHaTdtdHdZcU1GaDNw?=
 =?utf-8?B?cXMweXdoUjlTOWFrYjM3bTMwQ0NCeGNnYWJ1L2VMcWRvT3FvN2JSS0Z1ekFQ?=
 =?utf-8?B?UjNxUFpyQWZCMUc4UEhFVXZpdGF2R0NBTEd1VlM4V1MrTUgxV2lTeXVUL3VO?=
 =?utf-8?B?NXg3VHNlQWlld0lpbzVtdEE3Mi9BRlZEL0w4bTFlc3poSmRnbGI3MHVWeUhO?=
 =?utf-8?B?UVlVeit0enJTb3hTNjI5cTYvTUpQekVhRk04SXdMc2VOdUlGKzU0Nll4dUFi?=
 =?utf-8?B?VEhPbXVOaVhldldSNndGdWF6TGpMTVcxREo5YlpKYTJUaUZpTkMyOFlSOHFu?=
 =?utf-8?B?bURjdTdudk1IYU1jeHJneDkzUStaS0NSYkV6OFh3V0ZFbTc3SDNFVjlOdXpG?=
 =?utf-8?B?bFFRUjJ3R2k2QlVzQ0NOSGJRb3NIczF2amF3aXByaVRaUnVWSFp0Z094Snly?=
 =?utf-8?B?MmlFQlRvSEpyVUp2aHcrVU1vZHpCbGh3dEFQenBJLzg1WWZnZnEwTVhESnBt?=
 =?utf-8?Q?hAFz2HgNGgH+hZFDABEhPtza8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a3a3fa-43f8-41a7-fec7-08ddb96fee01
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:54:14.4566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DX1Ngc4nX6mNE5WyDjnJqpNOHkPRS0AwrDGC7bSJGidxSX/2nAyv4wXJX9rzFf2omEAE4khHcozo6xCZ7Zh+4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740

On 7/2/25 06:40, Geoffrey Ndu wrote:
> Comments and Suggestions:
> 
> * Bit 2 of Flags (Table 23):
> 
> The description for bit 2 is, "Secure boot databases are updatable by
> the guest (db/dbx)."
> 
> Does this also apply to other updatable Secure Boot databases like
> Platform Key (PK), Key Exchange Key (KEK), and Timestamp Signature
> Database (dbt)? If not, perhaps allocating one bit per UEFI database
> could enhance flexibility.
> 
> * Confusing Statement:
> 
> The following statement is unclear:
> 
> "If a database does not contain any data or is not present, the offset
> and size for that database must be 0."

Ah, forgot to remove this statement when I removed the db/dbx from the
manifest. Will delete this.

> 
> My understanding is that bit 2 is meant to specify whether databases
> are updatable, not to define thier sizes.. Could you clarify this?
> 
> * Typo:
> 
> There is a typo in the text: "Secure boot is enabledn." It should be  "enabled."

Got it.

Thanks,
Tom

> 
> 
> Geoffrey
> 
> On Mon, Jun 30, 2025 at 5:38 PM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>>
>> Attached is a draft specification with the following changes:
>>
>>   - New single service extended attestation request
>>   - vTPM service update for single service extended attestation request
>>   - UEFI Management Mode service
>>     - Needs references to the request/response formats
>>   - Placeholder for the APIC emulation service
>>
>> I just noticed that Dionna is now looking instead at adding a new
>> manifest version that would return a list of the various forms of the
>> storage and signing keys. This would eliminate any kernel changes as the
>> caller would now just request the new manifest version in the attest
>> single service request.
>>
>> I would prefer this as it would eliminate the need for the single
>> service extended attestation request and support for that within each
>> service. For now, this draft specification has the original changes
>> requested. Please review at least for the UEFI MM service, if the
>> direction is to move to a new vTPM manifest version.
>>
>> Thanks,
>> Tom
