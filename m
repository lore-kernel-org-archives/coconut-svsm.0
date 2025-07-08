Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E92714883F;
	Tue,  8 Jul 2025 15:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751987538; cv=fail; b=tQZXN2a58XR2gLm4+oID2l5oDHgxWfC/vlbXehU4izyKyfB2/i0yWaAvynrbA5KY2Aap6ZB4QJ49WvTu2yEmyva+Dyd+xx1DNRA9WstuJwSIOEZQMRrFUo/jDFrDwh4m15odJPlyBtyHsOLCfjK97YEupwvSYCYN0JXdyN0BQtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751987538; c=relaxed/simple;
	bh=IwANTajOCx93qKfwqeGhq9uwIuaPSmLp+zEZHcBpwr0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H0mym0xx2sq5sgvFx2pxrZSCDnSAxwf0MzpgS6SQr68QpdWPfUWy3cn2S99qjJiT2DS4TGSsKePo3c5N0dDIdqmniJ+kXg3uiq03ePeQ1+SOW4OFMh91mNl966XMO/w6bxCRcXZEhaouQpyHLmw7WJSO16r6LPPpK7HtnuTe9tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3ureaoJx; arc=fail smtp.client-ip=40.107.93.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3ureaoJx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aa2g9VqZnhzj4/RUlI3w+ZLt31AQwGyunP6RV2B3M7CQlluSTTkYwzk+q7G73y4IbpiMs4cS+Vu26cRUbrP9cXGXJM+FdUG/q7M7ZWtyV0ETE3hsL+2QEjzAvvss6YrRz7UJk7q1KX6wKc9VbwUJbF6MzdApilV9fY/+yrYCczLP6U+Eica7IbSueFYrrd9yi+BuIRsNZUsox6HHcGPD8EsgLc+KO2E7ggK6nE2/nb17I9pzsb1aiAu7w1/WMz3cg7SSPH11/3o3t4E4MkG2Nc+b0QVv3VchIO0v4ymK1ZuWGSVEmVDrhYBqDUY3lOarJgsas/3mQb4Md56D+bSP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcZVL9bsxEuFFNZHlRAl/9AAwaz+O6c16fK5w1eKYmQ=;
 b=qhnE9IAP4Qmp430k4GyUSP+baXb/M5L7x+N0rG1T8GInwbsjez70SdrikH1WrVxVKtv4FSLbyDIgrzZ9cMGYoKhgWEZIxy13GjIV4uQ/zrMWWKDozyJjLHqw1RUqk98u/CW1fE65X0leAw9T+TK2ZfHSCTY5MMvh1RAMEqiYZnBiby7naZOM0f8x3xr9fLRRd4JHJRbQMn1URVo8a4dcW90V+DQx/yefbqIBFUC1vYopimgk6bROLG/T/n12crqKMDPUbLmhRbc7G6UhtM93ajnmBEvg/p9NSSF1V+H1DJ2JooHXtRo9GOrjPfNSpkThPUaSqrV54mMu48ei8KArUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcZVL9bsxEuFFNZHlRAl/9AAwaz+O6c16fK5w1eKYmQ=;
 b=3ureaoJxvPApSL/+QJt4Cey1hwXCtgUniOjs1q7CnZfmEdzTmjf0W6h+QZAdIfemWEWOI+WKQLvA1+LIaZEu6PpObJzJ2qtKrVC9NspmRGCaCWWf0Bse1jaUuUKlB+Y7FFQgBD52pByj8ifKaYr3zRpt/FQ8RzcGjWNBeHPuv7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB9008.namprd12.prod.outlook.com (2603:10b6:a03:543::19)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 15:12:11 +0000
Received: from SJ2PR12MB9008.namprd12.prod.outlook.com
 ([fe80::b90e:e459:f49a:b454]) by SJ2PR12MB9008.namprd12.prod.outlook.com
 ([fe80::b90e:e459:f49a:b454%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 15:12:11 +0000
Message-ID: <d579919f-6e66-4499-8634-e258af61c933@amd.com>
Date: Tue, 8 Jul 2025 10:12:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM Development Call July 2nd, 2025
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
 <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
 <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
 <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
Content-Language: en-US
From: "Relph, Richard" <richard.relph@amd.com>
In-Reply-To: <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0035.namprd08.prod.outlook.com
 (2603:10b6:805:66::48) To SJ2PR12MB9008.namprd12.prod.outlook.com
 (2603:10b6:a03:543::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9008:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 75969f9b-ec56-4d90-dbf8-08ddbe31d020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW12Zzl0MnNyUithK1dUd2Q3aEcybTZzeWRLaTBweHNyTHArRmxBeGZjdWJp?=
 =?utf-8?B?VENNT1ZKV1dqWHFEUnNLRkd3Mk43VjJTUlRFSUZjT2FBSlRrWmIreVdtNFdQ?=
 =?utf-8?B?TlIzdE5sODdtd29VVWF2cWdBQkZESkhDckY0V1FxMHpRVmRYY1VQQy9KcUtO?=
 =?utf-8?B?cDNhcWgxaitRaitiMjliZkE2ejllQ0hveStQdE9jaXB1dmtwK3VtUkQ3TnZ3?=
 =?utf-8?B?RFo1V3ZQaEplcitOUXRaT0lyaEx0VWZIbmpaMXJXQVJLcEZ0Zk1SdFZ0Rmw5?=
 =?utf-8?B?Um81U2tHL0pjakpaSW5oUjFNQXFseGlCTko1Z3BJNlJuRzRPWlQ5OWRRK3h5?=
 =?utf-8?B?TzExR1dYUFFaUEsrZ3pYaG1jenVPbFR6VFZuT3l0emkyUjJkaEtNL1ZRS1d1?=
 =?utf-8?B?K2FIVStQYWNJc1loTElOejZYK2swd2NyaEd2Nkh0UUdERVYzbFdqdjQxWGNG?=
 =?utf-8?B?Und1VHVjbzVFWmR1blB4Z0NISGMwbERsRDJ3Yk1rSXdMWVlpai9EdjFjcm1F?=
 =?utf-8?B?VWkwNTU1eVFuek4rcHZ3L2kvM3VmMFZvemFGRDVLRDNuV2lIY1lEM1pKdmlK?=
 =?utf-8?B?Q1A5ZnJDRU50Q3N2eC9XSXYwNis0ZWQ3ZCtBdjRIOU4yekRTbTd5SlB5ZFF0?=
 =?utf-8?B?OW9GR0lkU21mSkZJbEYycTBtTnpVMHZDSWJzcXJHdGpjSHVvb2NpTWxPOWdB?=
 =?utf-8?B?TThkUmh4dyt3Y1RLSjJXYmdYc0lFTndKV09hN1Nhb0NpeUpMU3hyUU5nYVRY?=
 =?utf-8?B?d1F0cEU5VS8veDhUMmNzcWpWUzg1OGxxN1Y1aWRNSTRqNFo3dXpibDhTNmp5?=
 =?utf-8?B?VWZTRElrdythYktVU3l4QW1aQWx2MW9KbFN0b0RFL01sNEZMbkpjQlFaVkVr?=
 =?utf-8?B?NGdYaFZWVy9NKzZlQm9MVUJwZGh5aVNRWU1IWWI1cVA2Qk9FRGNKa2lIaTV2?=
 =?utf-8?B?VjcxbzN0SENETUVzRGFNdlVvT3Y5UkZ3RzBQRzM0SExISHlVTFYvODR4UWMz?=
 =?utf-8?B?QWg4UFRBRGQweGp0TmpjYUo0UWdCbGVZT1ZCMEV3VjhraVJneXRVd1ozcUxU?=
 =?utf-8?B?dHRBNXFOQUZrclZLSjM3b29CT09OM1ZZNnhsQ3k4Z3pqWmx2cWJ4Q05PS1lM?=
 =?utf-8?B?aWJ3ZFgrTXZXblBVZnBBRStGRWYwWDVKeUZqbWpucjYxcXlBdDkwS1I5dXkx?=
 =?utf-8?B?UXE5eUg0ZXRMUFppdDNURU51dXkyQW9sMks4NlZ3WmxVWFZYNzFkNTRBczlJ?=
 =?utf-8?B?SVFQbUtXYjlTbUhwZWFnbHN3TEFSQWdsYlVPU0FUOWUzcTY0VTBLd0RmamQ3?=
 =?utf-8?B?bWVuMkJKSmNHZTVkbDFVeE1FQStGRXlBcURienhpcFNnV2FScWdBeVNoMEhk?=
 =?utf-8?B?RmhVelJGMkxLdG5PUW4rZzh6OXU5Z09wZUN2RXNwNXluRlFiOXFFRUJhY1h3?=
 =?utf-8?B?MWQwWkRYcEI2N1lvK0hsMFVNRTlMSTNsR3A2R3RMNUxkMkJ4bHpxY2s4MVgv?=
 =?utf-8?B?bHNKRkhRckhOOHYvS3ZPL3VZVkF2cTdJSDA4UnhjeEVzclJaMFZBbldjUHR1?=
 =?utf-8?B?L2VGVHZEVE1sQmhHSEZUc1I3YkU0V1JGMGNFeFIyN3EvekxKbEhxbUl3OWFE?=
 =?utf-8?B?M2g3bm5SaTY2Y2NVanoxSTMrc0ZBZ2E0R2pUTzZEODUwWlJsUDJxWHZocms1?=
 =?utf-8?B?bzRGNWdNOXBMTFFFY3NOT3VPZ3NNV1F0WXV1WUxBUStOOXZXK1BCUUNMdEIw?=
 =?utf-8?B?RXlMRDFTTnFONVg0WDlKcEZFK2kzNTBRak9oZy91ZWVFR1lvNVIvdllyTE9h?=
 =?utf-8?B?d1FYZnp1ZForRlNJY1c0SDBIdkdMbjlLRjJodTA3TUlqVEFBL2tjM0UvUEZv?=
 =?utf-8?B?SmUwYlVZOU5kT3oyQXFLdDRIaXdCMEYxZzFDTWlteXlTM1N5RFhFanBkZUxK?=
 =?utf-8?Q?soRs5MCR944=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9008.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3pzTHNDY0Q1NVRsclpza2ljeHU0TmdjZ2VzMmJ4L2cvZlJpV1pnWXZ2SVNC?=
 =?utf-8?B?Q2tDZGhqVGNVVjR4UTMyNFlnTTc4L200eS9oZnFyTUs5UGtEMU1qREJlNzEr?=
 =?utf-8?B?dWZQVFJNTU8zdkhsa1ljUXVhYTl2U0xaQmpNalg1NDBxRGF2aENyYUZ4bHFM?=
 =?utf-8?B?UHVTb2V5TzFOVDNlM3FKK2l6ckErQnN6aCtvUU1TZ0c5UHdWY3dNRVI2dmR0?=
 =?utf-8?B?Skhtbm1EcUdrVWs4ZXhvYlRlTmpxMW50ck9va2NCS2pTaU5UTFlLUXhsdUlo?=
 =?utf-8?B?S2xiTE1RaHY4ZzVtVHMzRE9adnh3dEtBT1N6MXpvRG5iMExWcmo1YlZBNG5W?=
 =?utf-8?B?UmxrWk9ta0RXa1d2MG11UVN3SnRNeEJmNk1GdGdkRTQyaS9LeUNZWHEraC9D?=
 =?utf-8?B?YmJIdkowQmxoeEg4Tnpnckt0dWxuRFlUNXYrT1N6amdxOG9DekpKSHZFWXkx?=
 =?utf-8?B?WVVDdHZhZUhZZDUxUU9MS1dVMGFDK1RGeXBmdFBrSDBHZHdraHVvTlhFS2Iv?=
 =?utf-8?B?TUx5aDB5eFFEMEVJcXJhVjI1cW9EZktlZ0QwYURlNVlGMDBEQjVFRlF3c0dQ?=
 =?utf-8?B?blRpMmFWR1JjakhhSUJ5M1Y1OEpMcmNoc0p4WjQ0L3kyT1MvZ3hJVUowUVZ2?=
 =?utf-8?B?ZHFFcGlOdktlNk9KMzRBSWU1K1lmQllyUHE5T0hiVWIybG8yUWNCQ2FiYWdC?=
 =?utf-8?B?RzZMcTcvc0hnS1l2cU5JT3RwYU95NjFIZlFiK0ZWM2ZFM3N5U3NUZ2VpK1Ux?=
 =?utf-8?B?OGZHeXdZcEhzM3dHVjh5SWUwbC9PdzJ6SnVLaUxHdUZuNGg0cGNXSTRQY0Jr?=
 =?utf-8?B?RFNRblZaSklVVnRPbFJqQjl0RUpvOGljN2NudkJ1dVJuMktCUmVTU0ViNzJP?=
 =?utf-8?B?NTFjMWsrMUxIejZtVmpYT0hrT1ZsbHBYa2VBSzk2ZXp4QktSOUpld1NOTDdz?=
 =?utf-8?B?ZXl6aE5IYTFyNzQvSG5jNmdVTE9RaGZDM2VyZlRXTStlSFdvR0lyTkgxSDBN?=
 =?utf-8?B?WDhTVXUyL0pTbXZxbk5XdTZ1RVplR3hPcTNRbFpZc0RCRFpwQVo3cU1zUDJD?=
 =?utf-8?B?a1JPWmpOSFhJSDE0Tnp3NVUvdThab2Y5WlUzRkJGUVgxQjVDUTBQSkE3VGQv?=
 =?utf-8?B?LzFETDJ0eGpmUnhCaHA2V2gxMU94dThEakVlSkIwZ29Ja0JVanRYemxkOWNW?=
 =?utf-8?B?emlrc0lhbHVIbDdDTkRnT2FQTnVVRk9hMnFqMUpjTm92cXhHTjZGejVKaE1v?=
 =?utf-8?B?ZmVNYWtsandjclhMNGNacHpIM2xtZXNaSnRHZ29OMUlsTVA3OUxZcVRxKzVC?=
 =?utf-8?B?UlhCaFlWanlnek1PTTdJdkhzMUNUbFJUcDZyWTNKN3A2NnZQdWpkcDNLRzkv?=
 =?utf-8?B?cHZ1VDJzamcwUk04a2ZnU1hyL25VTjhXejM0a1NkNzhOVmlhZk1UM0ZMNVN6?=
 =?utf-8?B?NVQzRGVKWEk3OWMyOVBqNGtZVlRVZ0pCeXExSXl6bCt6TWkrek12bjZ0eW9Z?=
 =?utf-8?B?ZTBGMGhRTWlLT3pPMS8xK0Z4TWdOU0ltMjkrd0hHM2tTVkJzTVZHaFFoSWVB?=
 =?utf-8?B?MjRTVmhYVW9tRGIvK3NIWHVPaTk3SmFWRkZ2ZGlXRHI3eVRseXhqUTRFd1pW?=
 =?utf-8?B?SFY3ZC96cFRRZ2VvVDcxTlliTmsyVHVwQUtrSnl5cTNEN0dOQmR2WGswLy9T?=
 =?utf-8?B?N01yYk92Z2x4TW54bVdORGl5Mmp3LzBZSUV2d3lYWlNHdzFjL0YzbFVLaUc2?=
 =?utf-8?B?RTdJeDUxekRXYlBuUDlJTHo0N0JWYjRKMVptTy9ieTR3bWVFeXdISVRiUVNZ?=
 =?utf-8?B?Wjc3MVJRU3VmTXZkSDRhNkRNOFgxQnVwMzQ0MlVQL0pYci9oTlpxRjBNckY3?=
 =?utf-8?B?THlNUHQ2U0IxRTVsUHJaVUp3VGprZzlRQ3VsZGh0bEdhZ0NyRW5GUFNqMndQ?=
 =?utf-8?B?bU95SGFxSTBhWDlUbnpCVlFTM3JmcDJNMTQ4aDZJODZIM3lneE9JcXlMaDlj?=
 =?utf-8?B?Q1FQaFBOUlBqK1pWS3lWN2FIcXBYMVQ1VTIycURSY1NCR2ZBdWFQNWFKVGhE?=
 =?utf-8?B?eGsvUUwwcmVtZXgxZDA1ZU83eUc0TlJVV1NXKzNER0d3a0dNTFlucXFuNHF2?=
 =?utf-8?Q?eooa+JDVpD+27fiyaCnKwiesb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75969f9b-ec56-4d90-dbf8-08ddbe31d020
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9008.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 15:12:11.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWA1H88Q9rYEvpLm1REm9KnhjyDwZvsVqfkEymA82ZNNyrXcBq6qvhjEngonFB8p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949



On 7/8/2025 9:12 AM, Gerd Hoffmann wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
>   Hi,
> 
>>>> From OVMF perspective I don't see this as a big problem, assuming we are
>>>> talking about static allocation.  The memory discovery code is designed
>>>> around e820.  Typically OVMF simply loads the e820 table from qemu via
>>>> fw_cfg.  But there are multiple ways to get the memory map, when running
>>>> on xen or cloud hypervisor things are handled in a different way.
>>>> Adding one more option for svsm surely is possible.
>>>
>>> The idea is that COCONUT provides an IGVM memory map to OVMF, which takes it as
>>> a base for its memory map instead of the E820 from FWCFG.
> 
> Should be easy on the edk2 side.  As mentioned the infrastructure to use
> different sources for the memory map is already there.  Also OVMF must
> do SVSM calls quite early to accept memory, so doing SVSM calls to get
> the map is no problem too.
> 
> The interface should be usable without allocating memory, for example a
> protocol which returns one entry per call so OVMF can loop over the
> entries using the stack only should do the trick.
> 
>>> Longer term it would be great to fully enable OVMF for IGVM, so that it can
>>> also consume some of the ACPI tables from there instead of FWCFG. But that is
>>> future stuff, what we need for now is the memory map.
> 
> ACPI is a bit more tricky because today the process is that OVMF goes
> setup the hardware, then qemu goes generate ACPI tables matching the
> setup, finally OVMF loads them from qemu.
> 
> But as far I know svsm does not want enter the hardware initialization
> business, so fetching the tables in svsm instead is not going to work.
> 
>> As I heard it, the concern is that maintaining page state in SVSM (not OVMF)
>> will eventually require SVSM to have access to a dynamic amount of memory.
>> Right now, AFAIK, SVSM has no way to request memory from either the host or the
>> guest.
> 
> I assume you mean dynamic at boot time?

Jon Lange should weigh in here... he's the expert on this.
But I believe it would need to be dynamic at run-time.
Using 'worst case' allocations that might have every page ending up needing it's own page state entry leads to excessive memory reservations. While not having enough memory leads to fatal errors. Being able start with a "reasonable" amount for page state while allowing for expansion later if needed is the preferred solution. At least that's what I was hearing last Wednesday.

Richard

  i.e. instead of the fixed, 16M
> allocation via RequiredMemory IGVM directive svsm estimates how much
> it'll need and takes the required chunk of memory from guest RAM?
> 
> Once OVMF gets the memory map from svsm not qemu this should be doable,
> svsm can simply mark it's own memory as reserved then.
> 
> take care,
>   Gerd
> 
