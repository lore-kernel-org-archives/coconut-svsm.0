Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795631551;
	b=J9D+H952sDav/l4uBDMJyhR3zgUkdNuyiJGt+D5x4Uf4dnoCpmvPDTEuXA75H5shMFGY
	 ZBUymSc5HzJBbquHhQoxUQQLjBZOXfPblAbccP4QgFokYPRHkNgiVUDG0mxjPpTYNYmfp
	 Vo2PtdRN+r6r/RncmVi8Zz+PlL/HqM8sB0W+DNylOAl3MDXyJrcrdtb151SPRRGVoe3Eg
	 ew7SJqeq0vhV8KsXwN2YqPe2EqtWH8kU+cGUapobMQXir7t72jxhKnbOegIjqm4GBdGVA
	 jJ+qCmRXAqDMZK1zRh5Tr3z9anDV4C8hkCQoKcL9xqWFoisJnbukwxDvdTowhmdDz9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631551;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:User-Agent:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=R5m+yMhAbDD53iw+zX4kvGdXhvjqqgACEQnTavF7Czg=;
	b=Wd7eMCp6PukeF+HF15vqa+evaVrD33gNz1igUfJ7Z2nTsj57TR8Fa5mpVk6evt/3IVaP
	 jE212AFi1M10YXm6u7kccpDb68wc112p1F0wHyEHROPGVkwFBcSOOKejTvErjH5W0qUgg
	 KYrGxqbYVF2Qo91579lGv8Av3Mktawe3RyRfVvAHlxdANc/4ZRcJWiteImCVkVjmh5JBM
	 73Vho1SQOg7hqYtUdC9awpFw1NIhgSD0/PnvIAAJEzsPjfQoqeXUKsaoitOfq8VVcWXjG
	 MuT3MF8eXpJjL/wqu6U8HV/vHk1BCRNdGgu+J8TTLupQ0N6Qep5xDB8MGHR8t3C41Eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zjlnVtr2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.56
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD9C606A31E;
	Wed, 25 Nov 2026 18:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD9C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zjlnVtr2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpOkAMKXE8yK8yk/EpMN26iV79I+HXC7jE8wxPwirsX09TODx0hd391RrTmIkW9HIzvYiRPqt52Rnxatna801pwH3WiBL37yd1eirBc2k8EGL4fYWkBrKUtK1yeKI35ctEz6Bhul6gVYfMum0P58gUYryFw43GwiFjGPGS03MFnoX1ux0s+OcF1yiOouADg2o8rKC8rkuZySPUzkYesZH4yycegnol38yVW4T96BwW534oPgEU7iDX9yAj2VuQPt++NzsSBHP3FVPOnGYvi0KT1xpwZOcG2xB1R3eBobh/iuSVnCtlYh2eGbTluTtWIYeYrplJ4R/caFGr/Rrl0lYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5m+yMhAbDD53iw+zX4kvGdXhvjqqgACEQnTavF7Czg=;
 b=HG4BNvcnCdMcyms7N68yWA0U9ja7l+xWVCrACwoE3AQfaJSDN25gr3td0c1o1E0wdrU5cn8/m4uJXjz7j4hNO6LR2FTz2a1mJirWIEItNCpbZqdOV+M2WF1lVWUJZz/ZHD3IFHT3BsDRzvlJ3DBPrUcBml5MX/6wFRqKGGUZrVyHau9kyW5ynKh4c6U/Nq/W7W2Z3IGTh9rmaNr+PxdZQ7mzCK1Sbkfs1sVuVAezNzt3v7LBejH92WogDZvCjoUrjCuv0PRLD8Rp6MXEqplO3SM53wjpJKCp+NeUHHU5sAqlW4+JH6LOybdzEmqw+2GhYZeOHNG7oKYQLxaz1gXmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5m+yMhAbDD53iw+zX4kvGdXhvjqqgACEQnTavF7Czg=;
 b=zjlnVtr2MwY8JdnTN50iCjkLIiMh8Eqq/3l6H2XN2/gXSFVCoFjtbXx/ezanDrRTIvnLIILRJ2Y43GQaifM85a+wYlkajUBql5POuHd5Tbm1z/WSWw0hCFj+7wJfi0rPIrX+EUZX/rAEIU7o+sVvvl54Hjtix9JBXNaRXGLAL60=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4280.namprd12.prod.outlook.com (2603:10b6:610:ac::11)
 by CH3PR12MB8657.namprd12.prod.outlook.com (2603:10b6:610:172::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 18:32:23 +0000
Received: from CH2PR12MB4280.namprd12.prod.outlook.com
 ([fe80::424a:638:edb:162f]) by CH2PR12MB4280.namprd12.prod.outlook.com
 ([fe80::424a:638:edb:162f%4]) with mapi id 15.21.0639.011; Wed, 25 Nov 2026
 18:32:23 +0000
From: Mahmoud Nagy Adam <madam@amd.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: coconut-svsm@lists.linux.dev,  linux-coco@lists.linux.dev
Subject: Re: Discussion on policies around minimum rust version for
 coconut-svsm
In-Reply-To: <d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>
References: <d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>
Date: Wed, 25 Nov 2026 19:32:08 +0100
Message-ID: <65vkyfqwo92zb.fsf@amd.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::12) To CH2PR12MB4280.namprd12.prod.outlook.com
 (2603:10b6:610:ac::11)
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4280:EE_|CH3PR12MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 363d67eb-4eea-4053-592e-08df4b227220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|261009223027099003|22082099003|18002099003|10067099003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	89DIP3uULd1rS0Y8vGafTqSEd8z2smjdNr7jkh+jVKmA0fCtLm7RibGRtCke1FM6a4UVLyAAZdscHWXHQ0iqtZD4W+fQ+vR1rL76F20StD1TPn3ScZGxH73y/1pBycdVJeUBHCJTMMT9RhOSPxL3RN42NuiZHYOxHNN1KQp1maIv3FVu3LvOAxeoPmbkFXs2gosr0FODFy0HLSAi/HGzTQsL09OaJeDnYXn20noo0sSn3MFO4Qb3W8QPUio0VB9JziimBQWEJlfXn5yHrX2HT3zJTi27DTzPr9mtAziKJY5WdVBoTCRbNOqd+WeAFLg6GK6toM8URGYQrQQG/PytgXnbw3ub8yfqeAcBwTxBGcVKV1fFVXPcbtfXvn/zUT+yE2ADXVxB8/KSkJLwjrCB2SDYM+p5ISGMQVn4nvUZpXdSn5u3vOkRVTn13WF6K09eeZe4eeMXHA1RMfSueXBi3zr7mC0ZXj2fZk6Gd7+u84QEKCO2qQzv9jgPWU9UGKSmVvbJFWsbg68td/1Ai948xddv016tKa3w3HCTxUXUfJc5OJjLquO+bwnqeZhCN99kc4fglTmz3fVwEHJkCDwyp/QGC/OQ25352iPuKF+bJCg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4280.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(261009223027099003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EhVCuEEV2dCRh1EqvHhRQqOEPbin9pxxO1O4leyNh0KpehXLxDrZ5im2qvr+?=
 =?us-ascii?Q?McCzHjgZw2ewNdo74Y1fwAhzuIXnZT6/0BZJgSWuFII0m+7Vu4TsVo4mSaLP?=
 =?us-ascii?Q?JzYUREaxIWhsuKmQFJ7NFijyaQOnK1lhCnbUpz1XeAK2Ke5xeFxQOjOGMu1a?=
 =?us-ascii?Q?qCP4i+sWN12iLmgghGugejuovNlDDJzz5TQ/1bqO4ms744gqqkmXxIO3nsMu?=
 =?us-ascii?Q?QBw9kg3lB3ZvLPmBMFACsNDJ+AocmsDrz6OerFT+f2fOIfh1VPkMpJPV6QRl?=
 =?us-ascii?Q?IA9TLcPAWOLM1X+UEmHDjlztQbhe68G8iaDk/AVHrL6hWx8EpEOud5giPPQu?=
 =?us-ascii?Q?nXVDPxuSxvp9jtsMbplhvdfDuX1YlQTPUW6t1FFqiENPdZPp5bPs21FAdEhO?=
 =?us-ascii?Q?ez9Em1lmAcWJay0ROi6an4PaGJaL30yWUhG+XnMqFilOzuUz3hKJLQ6BSuI+?=
 =?us-ascii?Q?LBfeb8rhvHkD7WC7+5fyv14P9ZwmLd0s0Ojhxu+z/7IHdj31FGdBSP45nL/o?=
 =?us-ascii?Q?VSxI9yqGjs2IpKQaLziaY6ech/ThJ2n8VcTEN1F8y1ykHKoXtA3sIagrcUo8?=
 =?us-ascii?Q?y0NYVr1xs6YTM6dyChUKFBuxw8hxDbpUhTT939/Dv8bo6v8//p3Bc4DS5ycB?=
 =?us-ascii?Q?IGS95VsNSeJKLQiMVOXR4hFpISTpa8TFWCR5bt5dDdNaSXGxEKXKlc+rn8Ar?=
 =?us-ascii?Q?+bNOnI5NzwqZDB2pX0U234ntLDjHzw2cSf7ik65klTWgMeo1meHiDlOI7EPp?=
 =?us-ascii?Q?4xDSVLZOmSM4GYDAksDxbAIUD9qnZkOo6qGWi7+LhW9QUKZJoiEm8sOBoctl?=
 =?us-ascii?Q?j+0RWWy6PfzYMn1O2pKTDNvZ0+g7bbX74VJWIlp6JaZ5hXhA0DwdoQsajAm0?=
 =?us-ascii?Q?26G5kd5845piVJAjrslSMOFb5t4K/eHMoZo2x9rCyKRtr+EVi0e1PlOJkq2h?=
 =?us-ascii?Q?Sc1lr41h/78ksNknNJsZEKNSIn7Bgo5JOuoULkYqisx9P7ayv6vgezuMg1DH?=
 =?us-ascii?Q?YkYYHbvVOLncxL28giiim9vU1hPzOwAVtyRLk9LXXKph1frwsYZdsW1Q50fX?=
 =?us-ascii?Q?3bQo3zo6EClh6ZW941n5j/9X67LUPaICdG1Nb+iLu0fA279+oiRhxaY1+wp+?=
 =?us-ascii?Q?T/DefdLmzwNwcD9+/47cVtuxfn5pOSITa0AU2BiGTDjhGetTtSCg+7z7GSn6?=
 =?us-ascii?Q?l8F6HzMVhcSEBKyxgAOizr1JogUBbqBEL1VNMlMJfSd+Dz0m5Zbrdj4+dYUc?=
 =?us-ascii?Q?HNdEbtsvQQg4Ak1+uYi2RPbrcXmdRvVao5JJwlI05cxFyNd+XiR7pfIDQMqr?=
 =?us-ascii?Q?U3qgjLeaSEOqe3HZdXdnLloF34o+lS9Px0oI0g9GOaGEzHG9YllG66xgphHy?=
 =?us-ascii?Q?xLT7KF/n/aG5Rs9cahexKy4WExRWBjp0MAXmsQVoVPn1BamGpqmmMFprMbQk?=
 =?us-ascii?Q?ItO1AhU+oyPuIrhGg9kgFlF3woG8BfISpkLZQgAsnyCQQUE7p8jI5kgBFpcD?=
 =?us-ascii?Q?72YArb7fawj49ufwMLR52+7xweyDj9uBw+8msv9BNXMaJ/7SrINyHMN9SuDK?=
 =?us-ascii?Q?gWnYI2mxTv7wJgBMAet4oz+39hxPckJpKBsq3sH+s0qDXq3AqW4lNKzEq3EQ?=
 =?us-ascii?Q?9ia60Nt8nNcmkJvY/i4rOnCZE5h7LEmxZaAUqZvuKpeMwz7T5BoqKDRDGVTl?=
 =?us-ascii?Q?33WfMvWHozRFmO4JW5WXclp3Wtj3Mmtm47UpCBSrj2QYOLra?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363d67eb-4eea-4053-592e-08df4b227220
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:32:22.9901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLbb4RKK1zVKFTWldbFrjl3usyBu57vFYtDM/4HZqB88jdzXr44UmE85txAPE43g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8657

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> In the Wednesday coconut-svsm meeting I advocated for keeping this the
> lowest version possible, in line with the way the kernel handles gcc
> versioning, but since rust is a lot less mature than gcc, there are
> more compelling reasons not to do this. However, the situation we
> really want to avoid is moving too aggressively to a newer rust version
> which then complicates actually doing a stable release of coconut
> through a distribution.
>
> Just in case it's instructive, the Linux Kernel actually maintains a
> global and per-architecture minimum of gcc (checked in scripts/min-
> tool-version.sh). The current minimum version of gcc is gcc-8, which is
> way behind the latest gnu release of gcc-16. The last time it was
> actually changed was in early 2025. The driver for the change was x86
> needing gcc-8.1 for stack protector support:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a3e8fe814ad15c16735cdf394454a8bd96eb4d56
>
> However Arnd Bergmann later raised it globally because there had been
> no objections from any other architecture:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=118c40b7b50340bf7ff7e0adee8e3bab6e552c82
>
> You can read the discussion in the links, but the compact summary is
> "does anyone care ... no ... OK let's do it"
>
> I think the coconut-svsm policy should be conservative; i.e. we try to
> stay on the lowest possible rust version, starting with where we are
> now (1.85 but shortly to be bumped to 1.90). However, if any forcing
> function comes along that version should be increased. I think the two
> forcing functions are
>
>    1. Language feature we really need to help with or simplify the code
>    2. cargo dependency hygiene (we need a version of our dependencies
>       which is current with fixes and they may require a newer rust
>       version to keep that currency)
>
> but others may have things to add.
>
> The other thing that came up is that eventually coconut-svsm will have
> to be shipped by distributions and that means its minimum version must
> overlap the build versions that distributions have chosen, so this
> policy has to also be informed by the policies the distributions (both
> enterprise like RHEL and community like Debian and Fedora) are going to
> adopt ... which at least Red Hat promised to think about.
>
> Are there any other considerations people can think of?
>
> Regards,
>
> James


For information, Rust for Linux already has a policy for this: their
minimum Rust version follows Debian Stable's and is raised some months
after each Debian stable release, so the kernel can always be built with
the Rust that Debian ships
(https://rust-for-linux.com/rust-version-policy).

We could generally follow this policy, unless a forcing function (a
needed language feature or a dependency fix) requires a newer version.

Regards,
Nagy
