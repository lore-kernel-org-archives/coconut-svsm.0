Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013015.outbound.protection.outlook.com [40.93.196.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8C035CBD7
	for <coconut-svsm@lists.linux.dev>; Fri, 12 Jun 2026 11:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781263571; cv=fail; b=FpfL55NcNTlfTScn4yFrwEnHCetvhWRr/pJZnL3x9rI6jt37s3yWQIYZXvR9Q0aR1EGM1ITbOvjjfB3T1JgfWvcjx2GGSgkSfJaxxWjKZ6yrZegGnNX7WwcP1I5mUL50NTvUw5BPtM/2c2GvTwLaZbyNWjSIXoFgfb5l2342AAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781263571; c=relaxed/simple;
	bh=yYMsvRFpwbRroxuKo+8BNe+dmxC9KgH4j0a0S7PlWh0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G8Xk36uBRfEJGH1LzzPiXXm6AKAPyy4qAzkPnQFi/NU8pqIzy5951cCK/RKm99aiddFDpLh47nbgGy8C/jVvbXEZP9GBLxX9Rc8E4Nf+YvNFA2WAku3gknLRAZ+6UxErP4zrzCSi/yk5WuhRCOWILmxdFdEU10J2LoAePoVwtls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vs33dqeI; arc=fail smtp.client-ip=40.93.196.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vs33dqeI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xl8cKujn0qARqya+jE4EO6lAhg29z/yNuciW+vvUgeW86IdFuGuZVYwh8LjUdB0KJZJK74JTYSvFYr6mmKIFc6k9SPp0eidgD1hp9J8L7MJ4sCvV69E7vrnEBoCdw/v1oQVI/F9IgnWJsAIy79z1jxIH/7Jgoin+BeHPDPSgjZIWk06i88YkkpeWNpr0cX/RsSaoWNMTfL0TTGiZvj1U53hvXGJ6d6K3ckzo82nsKvxRh3502nclze+B+77X00OcJW6g/RcfRKOtHK5hiWETg9gcoFZG0h53sCMIQT9/iNxEjv3ufBNmeLGJKYTS6OwWSPzqAUW2rUhI0axrGMOf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNntz3DFupiRIjYSJYuHCrpmj4Y/crotnfSLaY0NA8M=;
 b=y0VF7ZH2uBYUvb+jFe+VN8lJq4pqNa0CQ3F/S2qZbffcDiJ/CLuaxQApWYUw6s8cZYYbXgIeTevydrVN8D0uOLL/wdC5l742HI19KSZ7gFmpHifPGDoTBG6a5YMNHznDt+IOD/r72ydzIFQ4fHBv12b75kROJ2kM0pqegiQRq+4TnDWeoC+Cvo26Qbrf7vN9QIcBDhENtL3HQOpLRf5EMUWUs9QWR6EnB8X6Fhv9Vs7h9nwlkLVrbcW3+qdAEX5IW8ziAzIGTNoHCLrMKiknxLg6NZkvYf+0ZvE88xAuO36B7bmnpmJq0+gLUWY2FCuHzJVDE8cktu/xCWfkUQKR9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNntz3DFupiRIjYSJYuHCrpmj4Y/crotnfSLaY0NA8M=;
 b=vs33dqeIhEzqh6CxTISeZgcYBUDHL+AqsN4QxLoTJAzqyxz/eLYz3fG0lluKeUX+2KCryrNrznckAddLtHUj2g2EN+8TMx4Nyh22Xs78DI2rgX9TSFlwDkNv69mAKaDVVq6hhvLxztjDtC4BE+qJ3iixvuh7kcQX034aEywH6O8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY8PR12MB7433.namprd12.prod.outlook.com (2603:10b6:930:53::22)
 by BL3PR12MB6523.namprd12.prod.outlook.com (2603:10b6:208:3bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 11:26:01 +0000
Received: from CY8PR12MB7433.namprd12.prod.outlook.com
 ([fe80::faae:d638:bdc9:4bf6]) by CY8PR12MB7433.namprd12.prod.outlook.com
 ([fe80::faae:d638:bdc9:4bf6%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 11:26:01 +0000
Message-ID: <827337b5-f9ae-47f6-9a58-898a5ad656e5@amd.com>
Date: Fri, 12 Jun 2026 13:25:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] sev: Provide VMSA to kvm via
 KVM_SEV_SNP_LAUNCH_UPDATE
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>,
 coconut-svsm@lists.linux.dev, Roy Hopkins <roy.hopkins@suse.com>,
 Vaishali Thakkar <vaishali.thakkar@suse.com>,
 Joerg Roedel <joerg.roedel@amd.com>
References: <20260611125543.573835-1-joro@8bytes.org>
 <20260611125543.573835-2-joro@8bytes.org>
Content-Language: en-US
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <20260611125543.573835-2-joro@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0315.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::11) To CY8PR12MB7433.namprd12.prod.outlook.com
 (2603:10b6:930:53::22)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7433:EE_|BL3PR12MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: bb617c27-0d59-4302-24ff-08dec87561a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|22082099003|18002099003|4143699003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	MH+uQ2O6pfQUWjWvNRHWVmHZkArEXNXig42x4EHzAZ5NM8xeIpFqTGj96Uh4ha6UfG/BvciOOpPvFZ9Vvr3bmAmthdgppkxsjeVLgZD4xPlZJ/oMZdXnmqX1eIZv1ULOUfg5y9apQ4eCkc9blBicXLxW5DYLHsY7VyAmnkNgfLzNjLq/B+d6cJ+o8nzmAyQCVj4yMagfj7GlSlPNicHS4d8HXdECdOmKNDCFITagDqj86d4JRlgaz3sBrGtNOGrbCSxedH/+higUZsFY1dt3L0fWgk72apqFacmMUEBrWg+yQGroCq0Vh2+VnY0CEUgYgQqBU8/lc3Ea2ignlifK8ycMB6BJdOxbv4oPsCckblmiTKEFAJLGW8DBu1YYuHGjtYqwTDN6wuIF9pt5VT6PtY8lBI3g4PXm4ODH5jYRUhlhXNXnrHTj3J0GkiaxMkdeJ0BoijTTti5hH3w6ncLKutMeA6xU/Z7yJMMhLkjOGmempZQiZAb1GHlTmkmOu/L7JFfHSbr1cGtcEWSu4hQA8nhF/JZP9qckiuca+/v6TzCMpcfKc5hfscFR1WNHUvlE+RAmJBwHWxva3K97ZyqCgHhhahsbDIyVEggGrYYkdVxmDbzJMk3yK+51KDdtl6zBBZk7PMcpsM++ZPciS+r5wCTQLNxAD3TcsGqS9gtWSEEf39nclUMU1ob/p4Rad7fq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7433.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emhxMEx0VHd5NXV0VE1qT2JpZGpybjhMQkJEd3RncVlKODBFWkgzbGQ4UU5v?=
 =?utf-8?B?L1B6RnhxdVMyQlhMU3E4YlNyMzAzRm1EbFNKekNCUVBhd3Q5Z29wM1cvczI5?=
 =?utf-8?B?MXd4K0tJRUUwUTUxY2F5Y1crNHlLK21zMUd6bVBGeGs0L1FxUG5BMEY4UldI?=
 =?utf-8?B?THhuS09pL3NZQk1MVi96WjBNQkdjcXJDWWJCR083NkF3R1FxZDZCZWx1S0l4?=
 =?utf-8?B?a0xJY3M5bEduRmEyVjJrNjd5a1FIWFBmY0Q5MHViZHZRWlEwTlpaVjIvNkxR?=
 =?utf-8?B?UHVYMlJNdjhwUlIvbzBxSy9pa0NNRnl3TUVpWmtOWXdoUURGSmNiZHV3OWNy?=
 =?utf-8?B?azdwUHI4d0tQRmFvaHdKUm9GOWoveHUyekt2QzJESVUyMnpnRWlPL21DTEo4?=
 =?utf-8?B?c1F4MXhmeWdQZDdoTUdJTis1R1JNMGt4NXdWalN1SXVoMWgzeVd1T1pHRXBW?=
 =?utf-8?B?TWZIVFkwWUZUNW10M3loY2p4eFRNTTVsVnc2OGtRM29lY1d2Y2toV2FvNHM4?=
 =?utf-8?B?N21JSFVaQnJOWmxDMTR1Ni9vL2tSN0tpOUJ6UmM3Yjl1cHF1Snc0MzcxbGZJ?=
 =?utf-8?B?TEtVTFk5ZDlkMWw2WHJ4Y0xxT1ZJcWxQbm55SHVlL3BHcjFOR0ZzeUp2L0pV?=
 =?utf-8?B?NVhjZnZBbFBNMDRkVldnWUxyeURCRWhGb3hYdkIzOVV6bkNIVWlxbUZROXRD?=
 =?utf-8?B?cXplWVlYOEc2L3ZtTjVvd0hub2RLQjVTSGhzVURFbDBidzVxMkxYYUdCcjdW?=
 =?utf-8?B?NjRHYnQ5UVAvRTUxMHExNEpXSjAzSmJmdXNTeWZLaFNzTlJTam9XalZ3Z3VR?=
 =?utf-8?B?anpyU2FINFBIcG10R1I4VldXeUxqTFl6UTY2ODdkMk1GMVlicTYycGx1eTRT?=
 =?utf-8?B?djE0WElia0hneGVQbzdlKzNKUmxXYXQ5bDRkSUQybzgzN0ZRWWR1a1pjSHBq?=
 =?utf-8?B?SlorUnZidTU3am8rajJtL0hQUHFiMVJJbjN4RWVFRkxCUDZMTjBBd0V4cVhn?=
 =?utf-8?B?b2dRK2FqT3J2QXpDaXhteVowUVIvL2FROVZDb0oyM1BuUTh3THcwMDhvbnJF?=
 =?utf-8?B?UWVNM0tRY29tcjhDMWo0SHJxTUFRUkluL3hlQW95SnlSSndRMTBGOU4vZFRE?=
 =?utf-8?B?Y2QvL29ZZHl0YSt6WFhMWVduYVBpK2hSK1MvTm9zcS9HQTNHdjcwQmcxdk9E?=
 =?utf-8?B?SkR3cGRieU03MGlmUGZDcFdiZWYxV3NxUE5QWWNPbllsWllEMlp4M2F6UEow?=
 =?utf-8?B?RnpucmpDeVB6Nk11dTM1WnhqVFMveEp1SW4zKy9KV2I1VHV4U0h6MlVWUUox?=
 =?utf-8?B?RHBOUnJnYTYvYXpDZDhhaVdMck1MZUIyNzMyc1hXYUE0MVNrQWpmMjBuUS83?=
 =?utf-8?B?MFNVYkpxaDV5Mjg3Q2w3bVBVVnhQRkIyY1g3SGsrdGJIQzhnTlVUMEZnR0ZT?=
 =?utf-8?B?UUhQWHRxVkFFYnlFSURJSVN1MWR5RXhWaGJsM0ltVlppOFhacnZ2Mnl6ZW5P?=
 =?utf-8?B?S1FtRjBUV0lLekhGUklXNlVqbUdtTWErdjlQSU5MMFE2NE5YOXFsWDlpbVRa?=
 =?utf-8?B?TzFFZHRhMlVDTDhFZHBWRi92Rmp1TDBJTnk0TjIyTldKbDVISEhCWlhGRjdY?=
 =?utf-8?B?OVZQRGlJNVYrMnFCZXVsOWZoTG0wcmUzMVlkS0ZkMCtnTk5EM0k5UkF5b1ZC?=
 =?utf-8?B?c2F1aFhOdVB5MDRXWW9KMlJDUkZOWFZvQUd1RUFYNFp6WTZpSGdHZXF1S2tH?=
 =?utf-8?B?WktrcFhyNFhSM2drNFVhL0o5cmQ4VWtVYW4wUUhEQkpYUXpDa2doRk5RVGQ4?=
 =?utf-8?B?NCtMWnRwSHlsNFlBdFRRWVdteXVCYWZkMGliVzdqUTA4Qm4ydWlmYTFhMTFS?=
 =?utf-8?B?SFhxNWw1S3BVZDZpWGNXeGN2NWtBRXo0VUJXMG5iT0EzeTR6QVFKamthSVYw?=
 =?utf-8?B?aC82Tk5zS01FYnBGZFkreWJvMU9uRjA1NFdrVHJpenY3aVMxelc5RUFxRXFR?=
 =?utf-8?B?dnBLMmhlNnJibHVOZ0IvUzNKN1YrR1lhRzBteXBzRmdiQ1RncFl4RXhKMk9i?=
 =?utf-8?B?blhhUEJLM1ByeUJnUmg3N3FYTWdRU09objVFTzhDbGJqUm96eGR6dTcvVCtG?=
 =?utf-8?B?NUhiZEoraHNsaW9XR1BicW5uV0ZMbmQ1bTNkdUNmUVBMR0dteFBJR2tWNE1K?=
 =?utf-8?B?aXoyY3FLVlZnMG5kMU1DNk94dVhIeDYyY1MvYjFkVThxZmx1Z1I5V2JiQS8y?=
 =?utf-8?B?Sm1iL3VQNmVZNkdyRUdEV09nU3ZCZEtHNDVGeFZkeFhwQlNIWTNUQ3FieldI?=
 =?utf-8?Q?uaZEEBJ8c2LAFB2f70?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb617c27-0d59-4302-24ff-08dec87561a0
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7433.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 11:26:01.0378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hr9TuUiKeeL0swIhhQ+a8FS/I8tTAPgsKFAthP0MzsdvaxcdRfrWrnpeuOUei02P7UaK/+UdURGw+HsuG62lLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6523


> From: Roy Hopkins <roy.hopkins@suse.com>
>
> Previously the VMSA could not be set directly. Instead the current CPU state
> was automatically populated into a VMSA within kvm as part of
> KVM_SEV_SNP_LAUNCH_FINISH. This meant that it was hard to ensure the VMSA
> provided by IGVM matched the resulting one in kvm.
>
> KVM has been updated to allow the VMSA to be provided via
> KVM_SEV_SNP_LAUNCH_UPDATE. In this case, kvm does not perform any specific
> synchronisation during FINISH and the VMSA is guaranteed to match that provided
> by QEMU.
>
> Signed-off-by: Roy Hopkins <roy.hopkins@suse.com>
> Co-developed-by: Vaishali Thakkar <vaishali.thakkar@suse.com>
> Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
> Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>

Not very familiar with inside of IGVM format. Overall patch looks good 
to me.

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>

> ---
>   backends/igvm.c                | 44 ++++++++++++++++++++++++++++++++--
>   include/system/igvm-internal.h |  1 +
>   target/i386/sev.c              | 10 +++++++-
>   3 files changed, 52 insertions(+), 3 deletions(-)
>
> diff --git a/backends/igvm.c b/backends/igvm.c
> index c347d0c17e..07e6db69e2 100644
> --- a/backends/igvm.c
> +++ b/backends/igvm.c
> @@ -425,6 +425,8 @@ static int qigvm_directive_vp_context(QIgvm *ctx, const uint8_t *header_data,
>       const IGVM_VHS_VP_CONTEXT *vp_context =
>           (const IGVM_VHS_VP_CONTEXT *)header_data;
>       IgvmHandle data_handle;
> +    uint32_t data_size;
> +    uint8_t *region;
>       uint8_t *data;
>       int result;
>   
> @@ -432,6 +434,16 @@ static int qigvm_directive_vp_context(QIgvm *ctx, const uint8_t *header_data,
>           return 0;
>       }
>   
> +    /*
> +     * Complete any other page processing first to ensure measurements
> +     * are correct.
> +     */
> +    if (ctx->machine_state->cgs) {
> +        if (qigvm_process_mem_page(ctx, NULL, errp)) {
> +            return -1;
> +        }
> +    }
> +
>       data_handle = igvm_get_header_data(ctx->file, IGVM_HEADER_SECTION_DIRECTIVE,
>                                          ctx->current_header_index);
>       if (data_handle < 0) {
> @@ -440,6 +452,21 @@ static int qigvm_directive_vp_context(QIgvm *ctx, const uint8_t *header_data,
>           return -1;
>       }
>   
> +    data_size = igvm_get_buffer_size(ctx->file, data_handle);
> +    if (data_size != IGVM_PAGE_SIZE_4K) {
> +        error_setg(errp, "IGVM: VP context data size %u not equal to page size",
> +                   data_size);
> +        result = -1;
> +        goto exit;
> +    }
> +
> +    if (vp_context->vp_index != 0) {
> +        error_setg(errp, "IGVM: VP context vp_index set to %u - must be zero",
> +                   vp_context->vp_index);
> +        result = -1;
> +        goto exit;
> +    }
> +
>       data = (uint8_t *)igvm_get_buffer(ctx->file, data_handle);
>       if (data == NULL) {
>           error_setg(errp, "IGVM: No buffer for handle %d", data_handle);
> @@ -448,9 +475,21 @@ static int qigvm_directive_vp_context(QIgvm *ctx, const uint8_t *header_data,
>       }
>   
>       if (ctx->machine_state->cgs) {
> +        if (!ctx->only_vp_context) {
> +            region = qigvm_prepare_memory(ctx, vp_context->gpa, IGVM_PAGE_SIZE_4K,
> +                    ctx->current_header_index, errp);
> +            if (!region) {
> +                result = -1;
> +                goto exit;
> +            }
> +            memset(region, 0, IGVM_PAGE_SIZE_4K);
> +            memcpy(region, data, data_size);
> +        } else {
> +            region = data;
> +        }
>           result = ctx->cgsc->set_guest_state(
> -            vp_context->gpa, data, igvm_get_buffer_size(ctx->file, data_handle),
> -            CGS_PAGE_TYPE_VMSA, vp_context->vp_index, errp);
> +            vp_context->gpa, region, IGVM_PAGE_SIZE_4K,
> +            CGS_PAGE_TYPE_VMSA, 0, errp);
>       } else if (target_arch() == SYS_EMU_TARGET_X86_64) {
>           result = qigvm_x86_set_vp_context(data, vp_context->vp_index, errp);
>       } else {
> @@ -911,6 +950,7 @@ int qigvm_process_file(IgvmCfg *cfg, MachineState *machine_state,
>           return -1;
>       }
>       ctx.file = cfg->file;
> +    ctx.only_vp_context = onlyVpContext;
>       trace_igvm_process_file(cfg->file, onlyVpContext);
>   
>       ctx.machine_state = machine_state;
> diff --git a/include/system/igvm-internal.h b/include/system/igvm-internal.h
> index 7f131c4d03..3ac0447e4d 100644
> --- a/include/system/igvm-internal.h
> +++ b/include/system/igvm-internal.h
> @@ -67,6 +67,7 @@ struct QIgvm {
>       unsigned region_start_index;
>       unsigned region_last_index;
>       unsigned region_page_count;
> +    bool only_vp_context;
>   };
>   
>   IgvmHandle qigvm_file_init(char *filename, Error **errp);
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 9dde972c11..af4c0156f6 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -1171,6 +1171,7 @@ snp_page_type_to_str(int type)
>   {
>       switch (type) {
>       case KVM_SEV_SNP_PAGE_TYPE_NORMAL: return "Normal";
> +    case KVM_SEV_SNP_PAGE_TYPE_VMSA: return "VMSA";
>       case KVM_SEV_SNP_PAGE_TYPE_ZERO: return "Zero";
>       case KVM_SEV_SNP_PAGE_TYPE_UNMEASURED: return "Unmeasured";
>       case KVM_SEV_SNP_PAGE_TYPE_SECRETS: return "Secrets";
> @@ -2597,8 +2598,15 @@ static int cgs_set_guest_state(hwaddr gpa, uint8_t *ptr, uint64_t len,
>                                    errp) < 0) {
>               return -1;
>           }
> -        return sev_set_cpu_context(cpu_index, ptr, len, gpa, errp);
>   
> +        if (sev_snp_enabled() &&
> +            kvm_vm_check_extension(kvm_state, KVM_CAP_SNP_DIRECT_VMSA)) {
> +            return snp_launch_update_data(
> +                    gpa, ptr, len, KVM_SEV_SNP_PAGE_TYPE_VMSA, errp);
> +        } else {
> +            return sev_set_cpu_context(cpu_index, ptr, len, gpa, errp);
> +        }
> +	break;
>       case CGS_PAGE_TYPE_UNMEASURED:
>           if (sev_snp_enabled()) {
>               return snp_launch_update_data(
