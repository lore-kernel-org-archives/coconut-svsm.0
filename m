Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A8372613;
	Wed,  9 Jul 2025 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752062665; cv=fail; b=kdeKZk+DoZBj2qLBczR0UxuAhz/DojyseDlsEX8FfS4Y8fK5iccPqx4agUbKwK+jdmIV2UkwoqwF1lPNnjfS9Jgj2R+iQQLEPGaH2Kvz8BZS4cmBAeEXZiIsjN2pQn7x6ouDzVnjpwJj75v9kCLkWcpiz4IWLaNyZCgvn9u9tKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752062665; c=relaxed/simple;
	bh=P+S25NgiPndC7aW/dMdH8FCtkugJKp1v22J0y6GOOAI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tN4LcZ3qUmaxSjUhr1wFxwkz2Wn9kbpLCM0c7CsN9QGN0lFJxZWeceQ7Qn7GpOn9r54jJTatXadu3O+j0Y+LfDWt83KcTK0OzGMxQILhsKS0rAm2M4dGDrDwGWs+JUmncs9WNrHU8PpT1TOHSAfI8glP619D+aU/kpbirls2lOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UwU+fwpr; arc=fail smtp.client-ip=40.107.95.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UwU+fwpr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Leqq2sHAOiX9XGTQanAcrpu3HnFCoTgIfRiY0Zl3tdT1azY2XfK+ZL3KEruMSegIYAwZ3V5PkJP8F4TqM+xKvPZ/eRo6J0LHEjm1nurS9Bf9MfuNaC1gH9O5xrvS3BeEJEYUQbvF09RMvPbE09geXB4TQptioUakXCE7TFX36btIJ+pz7oCMIRsfJkg+ZSfzPP2Naw7H7aoADAyfJWATbLhW0DgjkuDVxz6d4rhASP/NFjhU5DnMhWlfwFMn4qakyIBjYo+0X27+mcmT4fHl0idtzMfXJNT8FxepoD38t3H9wF8VJEjZGhwNm2rfogRk5O0Gf63nRm27SjuTqWfBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pktywAln7OwZbHyv0x0ac1IfGmJ/pb3J+yQgZMPsoUE=;
 b=iNg6gPZXsZm9qEGJ/anA4krgUNj7HfK6h9C6hvxNxzXA8elXYpWT8kWUkmRhF9ziRK79RsJ6UVfBZyEDt2b+4FoPs/gWSjdrlO75ZmlwPHeBQujbTLUhv2nkppdwc/jOyZYaCrKvuu8MgGxCcdbhmruCzt7cu1bhpSXVJuRqXjWq96OUzBF5YZ0r7VnlVNkB2V6JVOnZmhbyfi1OeDBbPoVVrAK8Hs42H7gbUDKKwIi2liW1ursmoJFSgFpvUIHmbJodqjCYC9VDwQlm5uSzEbLub0xDhRwgCGNqzBjfdQmylK7+x1MqfqI1v4jh0k8NitYnick9eNY+4oyr7I3RIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pktywAln7OwZbHyv0x0ac1IfGmJ/pb3J+yQgZMPsoUE=;
 b=UwU+fwprpfl5HRY30NH3wK1JaSz9hqd4sO9hqc1GnSapo4RggNrmYRRNkmqUnoLqy7Fgo1pMvtHrH4qmWkSNyvZcCRzYV+7GzBTxI+ctY8PRG4jzDU3dEtqGdSwKSFXkpxgfR8caSan79ZSqizmh2bt8VeuGqRkseIL5N6Cxg0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB9008.namprd12.prod.outlook.com (2603:10b6:a03:543::19)
 by SA5PPF5EA4322E1.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 12:04:18 +0000
Received: from SJ2PR12MB9008.namprd12.prod.outlook.com
 ([fe80::b90e:e459:f49a:b454]) by SJ2PR12MB9008.namprd12.prod.outlook.com
 ([fe80::b90e:e459:f49a:b454%4]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 12:04:17 +0000
Message-ID: <6f263fbd-3049-4961-bc23-25d74396b48c@amd.com>
Date: Wed, 9 Jul 2025 07:04:14 -0500
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
 <d579919f-6e66-4499-8634-e258af61c933@amd.com>
 <aq6225hfazqsbqgx6fhj2klst52wdfivfa6xj2ost65sg5fq2r@4yoqnv2tp5nm>
Content-Language: en-US
From: "Relph, Richard" <richard.relph@amd.com>
In-Reply-To: <aq6225hfazqsbqgx6fhj2klst52wdfivfa6xj2ost65sg5fq2r@4yoqnv2tp5nm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0097.namprd04.prod.outlook.com
 (2603:10b6:805:f2::38) To SJ2PR12MB9008.namprd12.prod.outlook.com
 (2603:10b6:a03:543::19)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9008:EE_|SA5PPF5EA4322E1:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f87662-6115-4d1a-d901-08ddbee0ba82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTRiSzBjbnphcC9JUlV4SU9IbU1KYWZ1RWQ0THdjZ3JJSzkzVEdlekR0ZTVY?=
 =?utf-8?B?WGhvWVkxUmVHV2I3ZUpWMjU2ZGZiODVZdjEzSDZmeXU0NWtoWFMwMzhQRVRz?=
 =?utf-8?B?cXZiQ1N3b2lsRlBDeERWVGZHcEd2TU1ITFBiT1VkaDliK1MxQnFieFBhT0Nh?=
 =?utf-8?B?TXp3SDZSSHl0UDdrS0ZkaXBkMFp6R09PL0Zld2htc3Y2NGpyRUtqSWh2SGl4?=
 =?utf-8?B?dVdJVzEvZVNHK1ZJNWZBdWgxSDFFY0NhR3ptNEowbDhzdXdKOVc5bGVHTWFK?=
 =?utf-8?B?QktsYmZQVSs5SDRoSkxZY3dmK2Y3eUd1c1M5SUFvaXZ4OXBON1YvamZJZzZX?=
 =?utf-8?B?TlBIWDNHdnhWczlaK3hJNDB2dERSWGtNQis2RWJXRnlWOVpsYWxSZnRsQ1dh?=
 =?utf-8?B?NU1tQ0pOWnBaaXJXajRuU2F5OVN2S3ZvSU9GN2l4anFiMXVEK3ZkYkU1azR1?=
 =?utf-8?B?cmQrbGIvNVEyM0RWdzdKbXo4UE5GQUllVW4reGg0Lyt6K3RiODBwZW4xYnVG?=
 =?utf-8?B?TUlTT0VkRmhFdmlGR2lrS3M1WnRGQmhQRlYxaGw0VDIrVGR0Mit0c0tIeXh4?=
 =?utf-8?B?M1RUTll3SWxJbER6ZzN1b2dVUURNUWVpVk90MkVEcU9ETS9NMitJV0UyOXJw?=
 =?utf-8?B?aTRNUDYzUVBsNEtSdlB1YUE4MlZBQlZFTEZIN3lORU9xbTFSTHlrUlhndGQx?=
 =?utf-8?B?NHMydVp3Y1NqQ3VXK2tNcFh1U2JmRWFvaEI3UXFHVWxiazVkWFpONXg1VVhr?=
 =?utf-8?B?ckpJdmlCVnd1MXpxbEdYM05iSmo0REZ1QWNzaUVVbm9jcytpRnRzTy9sNGxw?=
 =?utf-8?B?a1hMdURaQ0ZCMVlDd1loVTZ4TkVHM0xpdXZOY3NmK3FZbFpESFBVZWFyM3hM?=
 =?utf-8?B?M2JGazRVOFQ2aHJDTXFGTWhMbkpBUUNKalJoaHJRckJIQnFCOWpubGpPZFEz?=
 =?utf-8?B?eitWSG5PWWExT2FVRS9STHQvMGJDWjRoaUtLV0NnWEkvS0xIUU9VOXRoMEdr?=
 =?utf-8?B?aDFFK1p0MVJ4bjJtcDF5SGRTZlk5NG56dThZQkk4RjdKSU16bFFEU29sOWt1?=
 =?utf-8?B?Z0wxL0d4bDhEOXNRVGllRHVla0s1cnd4TEZCQkpwUlRYTlcyZU5qL013VVQ5?=
 =?utf-8?B?MkJsZnVqekZRa3VXQmY3dFNQeVdLZ1I0aTJhMVdzV2xFeERrR2pnd0VVWjNn?=
 =?utf-8?B?RnEwWTlKc3lya0RWM1ZBdGhxR0pzc1NwNDJTZHFHWHJhSERQYkVQbytOT2J6?=
 =?utf-8?B?TzBQMDE2MVI2VXVqWERxMnBuZURXVjBmMDBxWFFjaXlZa2NNMVdmQjVGNlRS?=
 =?utf-8?B?TnhwN1ZSelBUeEd3UG04a2c5djZZU25Bd0F2M256MlVkVng5ZFRERkg3ZldP?=
 =?utf-8?B?b2ZaQTJ1QlpJRGRFelBEZWl6NmZmeStWK2RCR1lHd1FWZko2UURGVHZDSThV?=
 =?utf-8?B?TkxQWERqeVpuZlJTbTk5OUtrWGRVZkQrV0JNVEhwWVpuWTBidnNyZGhWSWNK?=
 =?utf-8?B?bFF5Znhtd1gzbVNkaU03c25QNFFyQzRRZ1BTdXEwK3QxT3daNnNvUFljZjEw?=
 =?utf-8?B?a2lKZUZCSjVrVjAwc3cvL0Q5eUxkRzVsUlFjUU9DOHRHaG5BSGRGMkNQZ3pM?=
 =?utf-8?B?V3NtWmE2dGhFM0tNUFBuUGgrbkdyWmMwZzJER3I2cUh3WFRzRHFncjllQ0pz?=
 =?utf-8?B?Z3lEa2hsd0xIWjE2aWFsQXdyaFN6alJRWlJ4WHBpd0ZtMEE5WmY5dU53dmJn?=
 =?utf-8?B?UXNaZmhtOVAzQnRid1pNQzJjeWcrZEVXaDdlc3pTVDhITWY4ZWtYNTZVTHRZ?=
 =?utf-8?B?STNwWUNoSWxJTVFwOERWLy8zSGs0R2U3dU11R2l0WkVobnJhU1BiVkN0WEpF?=
 =?utf-8?B?clNmaEhNeGZqdHdWMkdPNkpyTmUyVndZeXdMdE14UFRxemJCY2xvS3JjUlBy?=
 =?utf-8?Q?vJYgjT4w0f8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9008.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDlRQnVIS3dlTWQ5cFBwd2lyOUJVdnNnYzE5ejZ2eGk5ZHVhSEdBd1lkZS8w?=
 =?utf-8?B?R3h5UU9nd2JkdFJ0blU5REc3eUxtS2VrQlFuOGhiL2xhVVViSzJJUWhsQ0hw?=
 =?utf-8?B?ZkhITmxNUjJ4bUE2WDUyVnN5ai9ENW42c0lCeXhjbHBYRmN0MFpNakZKTXlL?=
 =?utf-8?B?SWVHRUJjdk8rY3JuSlBGS2JOU0ZuNUpodW1DcEk3Tk1xQ3VZeHZ2clY4bXQz?=
 =?utf-8?B?aThFUDluMUF2RzZqVGNBclhqMVBmY0pZSGZDdlVteXZ3ZlpBTUFCekpxWjFr?=
 =?utf-8?B?cmVqcDVNTVVZeFFkOUFzSUl2NW1RY1duNmUzT3htcnlVcDY0NGlXSDR5ZnNY?=
 =?utf-8?B?UXBDczU1UmtjeGFPSVFiQWg5OGVhcHZoTjNlQnBxczhnZ1ZIbXNCd09FNUNu?=
 =?utf-8?B?aVExV0dLcElCWklwMmI3dlV4elZQTGhCaGk3Vzk4RktwV1gxYk04NEFHeC90?=
 =?utf-8?B?enZGVjRpSmpwOFZGdCtsb3oyNVpBRGVsZXJzY2d6aVpPRTNVUCs1b0pRdzZG?=
 =?utf-8?B?cHJLRGNEbDFZRjNPR1RZb3FxekpOczlMM3dYVTNIUWNVRFkxL01lUzlrR1ZE?=
 =?utf-8?B?VFlyc2xtbUJRcys5Q1V6TVhQRGI2SEZaMUlLRm0vVnh6VWMxSVJhazhzSU9U?=
 =?utf-8?B?QTBMQkgvczdNOXV0RWlIUU1sbm13ak5GTlFwUndMNmd2R3VLVlJFb2VIVVlX?=
 =?utf-8?B?TEtURmpGdjdTY3RyL0FRbGxQOHZVN3hHZkhQeHc2dExkaGp5SDlLdFlKTFJE?=
 =?utf-8?B?UW9xeVhTaDdBQy83UXlsUDNYeC9xNm14eEJxSW5EUFQ3MWpNSStvQkJHSTZo?=
 =?utf-8?B?bXFvbVkwSEFSVi9CKyszMHZFY2l0MmpuRjF6dkwzRXVrb0hHODhHUG5SWTRG?=
 =?utf-8?B?ZWJzOERGM2pkaDY5eFd3d2h5T3VhcUtkQWlmNHlYNWFiZ0hzNk83QStmK2dO?=
 =?utf-8?B?b25LU0lUMk52c3RmOVNyUm1CYjRHay8zTDZpQ0pLUzNjYXlacUhrWnZkdGFB?=
 =?utf-8?B?bXJVOG1QV1d6VHFWeTBRV25sZVhHcTZ2V0JJdFFJdzBYM2UyNkRURjZzT3dT?=
 =?utf-8?B?T3RDSm1IaEkxZ29XcFdIMDZCY2dvcDRWbWJ6YTdZMW5HUEZDUnMzRElDb1Jy?=
 =?utf-8?B?OURBZ3ppZFNIS0JqbEZkRkpRbFJPMXp4N2dqTlEvb0NBRE41NWlIb0xycHds?=
 =?utf-8?B?alNLUmNUbkdqOVRVM2NocTdhY2s5NFd0V3d0U21VQ1dIZUI2U3dHS2RoN0JW?=
 =?utf-8?B?aWVsdmRzRnE1akdKQ2xqN1RkVTNyZ2FBYW9WWW5mam9Wdmw2MW9HcjlwYU1u?=
 =?utf-8?B?c3ordDBOcTRqcXlETDhZUktSTUtxaTFjb1RaZWVDZTlnZ0lTWW5BTlMvU0NQ?=
 =?utf-8?B?WERSblBSeEJSL0VNL2FvOE5Ra21pR2FJNnUvQnlLVGlWeis5UUpMVHBxZG5L?=
 =?utf-8?B?dWdjUkMxc3BjN2NUYmpvc2ovd2VKQmFSZ1ZkblJMMjQ1aXphN0tZdVFuM2ND?=
 =?utf-8?B?bHVPdWpOc3pLUG4zN1lWMTFOWk1TWWVmazJLeGtpd3p2cVlGbkdJTGJ1SWJy?=
 =?utf-8?B?L1dSOVB5VThkOFljRjk3bUNQZjBndjA5VkpYNzRUNW9EUWg3TU5ta1NDdURm?=
 =?utf-8?B?N2xiQXVqNHBVdWdjYnR4T3ZpRjNDYkR1Y1hxbDNpU3dEK2hPYTBkMDRYL095?=
 =?utf-8?B?ek43c2lpZjBGNUZRamRIZUkyR1M3cEd4cnlZbDNIa2tsZXgxMjd3anI4V1NN?=
 =?utf-8?B?TEZXaGsvVmhoZFBGakNoeFIwRDQ3TFVMM1dsOXQzUmt0SzRrVWE1aTArWUxr?=
 =?utf-8?B?MnNxSlJPSVdXUFhFbjMzZlhaMFZwWVZucEl6WldoZjYwS2IrNlE2TmlRT3BG?=
 =?utf-8?B?WUpiK2pLTzQrYnhjNHhqdFhaRmFKZTlJRVFtbzNhWVoxaUpucVVMUUU3MmE3?=
 =?utf-8?B?R2pqZUFUeGpvaG9UYlN3a0J6YWdLS3VoLzRWUjF5dEFHQzdWYTlWdkEzT1Ey?=
 =?utf-8?B?dzdWV05zeWxPWTBBMHpQbGhKU2k3VmdKYTZuamIxakg4NUJRNnd3REdqRGV6?=
 =?utf-8?B?ZDl0WHN0VzA1cWEwM012akFVanEweGxOT3BSbHQ3RTgzMDFQMVo5OW9VdEJX?=
 =?utf-8?Q?WpBM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f87662-6115-4d1a-d901-08ddbee0ba82
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9008.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:04:16.9403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhvnS1lOV/QVKVrJcb4xV3jixifzOyDtKylmTffMZuK2cI1wonuP/s2gUGhDyDzb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF5EA4322E1



On 7/9/2025 4:43 AM, Gerd Hoffmann wrote:
>>> I assume you mean dynamic at boot time?
>>
>> Jon Lange should weigh in here... he's the expert on this.
>> But I believe it would need to be dynamic at run-time.
> 
> i.e. support for SVSM_CORE_DEPOSIT_MEM ?
> 
>> Being able start with a "reasonable" amount for page state while
>> allowing for expansion later if needed is the preferred solution.
> 
> What events would trigger the need for expansion?  Would OVMF (which
> typically would run for a few seconds at boot) need to support that?
> Or is that something only the linux kernel (or other guest kernels)
> would have to worry about?

I doubt OVMF would need to worry about it. It feels likely to me that whatever "reasonable" amount we have SVSM pre-allocate would cover whatever page state transitions OVMF might create.

Richard
