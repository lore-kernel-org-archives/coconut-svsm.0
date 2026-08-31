Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF903D3339;
	Mon, 31 Aug 2026 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165691; cv=fail; b=A0og+Kntd5w4bYf7WpdnIldFT6lvWyRqbAdqZnh9q8ueoyxw2XEEmDIo0phNJwuDHHIHwVhcSTmBWoGPX8CKHc/tpybiDiPiYPhCfS47wcF+CQ3vPmIAfIvzQu5GXsZ9EPIusy6VHlhcm0nNiXOjon+TeO4SJsfjRKj8I364fSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165691; c=relaxed/simple;
	bh=lEuFu5KNY7vdMPySVAwVL9+wTQeiNCjyeHSfvIzAVKo=;
	h=Message-ID:Date:Subject:To:References:From:Cc:In-Reply-To:
	 Content-Type:MIME-Version; b=fzSmFXh+JfW5GS/g2DXHSdCLWwhRzeMXlyEpCflxa92wqcjHRwpf//+iy7Axag5mR3E9TtXN8JLy5EylDfL9BvT8Gg+N7W9K5+NjLLAexvmxKqagzEFMPt9/FLGFlJAtlVZHHbmy6XELtK2pc0ol4mi3eCKadhpLQN537SciuHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Benvjl+A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dcgvt38M; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Benvjl+A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dcgvt38M"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UNdS78123307;
	Mon, 31 Aug 2026 08:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LbKJQ3bX774tuRrYiRwGa5leODm3lM4sdu7fW+eGXzs=; b=
	Benvjl+ArNSSk3lhA4pyIupgOEPGm+lqxh+OFCBXS1HAIvqPfgRj0Gwy90jW/1KH
	q6xnO/qZD/sqnAP2LqAgWXRpgZq4mPMtz5PSMWd0plUYz8/DlNb8tYzceGyGtAYk
	AhhSOCLL/mmmErb/ywewM7tNuXFbpZN2aAJmH3SYZuh63dyCfgunO1O3CQAp+R9R
	o5pyeeuLCW+zl542AevGCUSZ7cD3loKafaMJjuKW5sep0QFDzbDuL3ADDkLdsSv4
	tsYd4MsKieoyuvrHizcp1x/DdVih5hr4fUOOqNbP30/EbeMXcY0fpWvUIQeKjERI
	ixXvjkmgWzz571+EODZfhA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbq1sj3y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 08:41:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67V8e7UE019594;
	Mon, 31 Aug 2026 08:41:20 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010031.outbound.protection.outlook.com [52.101.85.31])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvcrp8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 31 Aug 2026 08:41:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4kCyU/1dyDh5S2ljx88OYh7OTc43UQV892hbwWYvXkAPYDLtsTlBYz6NDxpwCTfmsainGir1cVlYQhzfcIoAbPBXr12RWlWas1RTHpgLlOYBF7qhRaIphQDZjLBguUWlQ2j+v5XMDcv0OcKVSe/HfxjAYXJbrIwG6UtMa9etiW26yul5OIYNM9aB4Xde5BSal8j246Due46VtODFmF7Gs6Q4Hac4HxaAkPCaYLlWQtkM6v1myyz9K8w6RQuLjB6WKPYTF43ndJGw+fpc42osk7Z/zygg7nrAnB1Bj1KPEK7Kl701+YQZY3gxqZ2VshgTZb+XVQeLfkC6UJp0DY7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbKJQ3bX774tuRrYiRwGa5leODm3lM4sdu7fW+eGXzs=;
 b=TQ3hf8Jj8FkYB1UL+GRQR8X/asQPjEe1C8u1TTIfJjw7h98c7mX6yJw7weGk97ercroxRinoFbS11G3Wt5oiQB9ZBqMi6uMN35RshRRE/C6XM02RsqaHOkys8l0dyGuLTCXU70wbazvue/Jy7d8yoCBxZIcL+j+gOjiqb8ipqpFIrop77lggzeTEzW8Jkkd2n//EjAOKu7CvndNYxKAfNVAYRHFBuam5nrUW7WerSp37Dze2UKnAUJVN02rpehjdzCpl/MA68bhA6aRDy1nM6pvOdG56r5vvMQRY9F2cTFTrHn4RDpUQEQOclLQT370QEn/qDCSqBKaWoHW2wTkEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbKJQ3bX774tuRrYiRwGa5leODm3lM4sdu7fW+eGXzs=;
 b=dcgvt38MDw0mvpXx6aEPplggDZ1RUbNxRGvmOwqy3BsAxY8tGnQ77iAJL8SpbBbWOSU9NLS2rm3YWfvqAPJUW8F1EEbE3MXyqHzj+fd7fEnZIrJDl2JkfqwKQZFpApjyUMkeyhUcveJEOJK3+gEPRQuh6kq/gB46kXp54FAnvVE=
Received: from BLAPR10MB5380.namprd10.prod.outlook.com (2603:10b6:208:333::14)
 by PH7PR10MB6060.namprd10.prod.outlook.com (2603:10b6:510:1fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 08:41:17 +0000
Received: from BLAPR10MB5380.namprd10.prod.outlook.com
 ([fe80::a93f:a5f1:22ab:bd68]) by BLAPR10MB5380.namprd10.prod.outlook.com
 ([fe80::a93f:a5f1:22ab:bd68%6]) with mapi id 15.21.0382.007; Mon, 31 Aug 2026
 08:41:16 +0000
Message-ID: <b1cfe9d8-4f29-42f0-b3ac-312724250d0c@oracle.com>
Date: Mon, 31 Aug 2026 09:41:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM: Updated Linux and QEMU branches available for testing
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
        coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
References: <apBelv6Ev-lCQ64J@8bytes.org>
From: Liam Merwick <liam.merwick@oracle.com>
Content-Language: en-GB
Cc: liam.merwick@oracle.com
In-Reply-To: <apBelv6Ev-lCQ64J@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::9) To BLAPR10MB5380.namprd10.prod.outlook.com
 (2603:10b6:208:333::14)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5380:EE_|PH7PR10MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc332c9-2861-4388-15f6-08df073b9f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vQQ5l4LzpyC/AAQn1CGKCsNYu+aBC0+FEYyX1z9m+5U+g8Rmgu7TAoDaIXaclggs6xiHaXvyCfMaMkkNQt3lLhos7do0wgSAzv18mfACvAUCeK5DSCuSRb5B5/CzREzQCYw96ivuAZq/xkAUuZnBHSvkSRNNiWH2h5BnVtc88Et2NpedCKdvtcAwwMg4C7QiVLuS4sHgqzjbWnlEXtQyO49swOTTvVbvH7IF2WFvAWkojh1pGRv3Kg7dyXhBBwMg6VOGSYygI7GxfE2/61+WzR9GPuuG2kpH3hMa67uwONvM9UrpptT3ZdbJgSIB3ECpt9ujviumwArSc2PoKaD0AL4LPGq+UldUZfJrhUnLGgqChyOGiStdqD5il7n2fJ0NzdhD3r4tdwjJA5xEcMD4JchTEGQmpWnQhN1V5HfscdtqshKTHMgXK1gdri32j8S2iuZ4kJLEHiewWVbKHgqWsdWJ8U/RIc00nuHaxpC+tGlWUKHKF6DhBoLK+dmUaHCdFqR97pY/6hsObu263VAshW6Fuqgo7e/8kFjh2INsJRLJIUkKOtI8M1B6x2jH9NEMAT9oJIHUcf8OvUKxjKx1EC9NrFIOm/Qt/NVamdSP7wWGU4aBeYOZOtXO/b95QQziKVxFTBz9/MMqfEsUILwJu6Fs6gDWpnOAaXLjXEjVEmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5380.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjF0REtaNmJNYitzVEtNUi9zOFNjT0V2TEpOOG0wYkpQdTBoUERyTWUweHFY?=
 =?utf-8?B?THhYUnZ4VVhXMm5UeWsvRlowWVplQVE3VkNRMXdPWW9zSC9xUzFkdXlwWGph?=
 =?utf-8?B?d0djMjVicHoyVFJGdnZsWklMY0FJcnRCdTcwY2lGUEZ5S0FwUW5tZzN3Zk5j?=
 =?utf-8?B?ckhDaHlJY3ZKQ21qRyswN2ZxbHQrK2F3VXJnaTBYZjBqemxmbGwyTlpMSE5J?=
 =?utf-8?B?VGRyVU1CVk9wbHBjZzAwOGtaMWhNdlQ2ZEJhVStnM3FvajFYWE9Ia0crUE94?=
 =?utf-8?B?cFVHcldDUGZoQUgwZStBSTMyUUt2dXh3ZFVWYnVRL09MN1VjUE1rblFEUlB2?=
 =?utf-8?B?RmVnTWRndEdjMmlGbkdWK3ZscnJFZDJXbnhFL1ZXcWJOQmh0Z3BlLzE1dTFR?=
 =?utf-8?B?TnhyTTVNY2JJNng0S1V0Zy9TYmEzOHB3dnl5Y2RsTU5oNjV5ZFFQNnRMWlh3?=
 =?utf-8?B?ZTFIUlR2N09YR29CMWxQMzRCQnM2MHNNZEt0cndwQTlrNUlQVDdzcmVqK1JK?=
 =?utf-8?B?WFFvSkdKVjd0UUVzbE8rRlRRNXUwbFY3VDR6bmZhUGZVZkk4RC93ZDNVSEl3?=
 =?utf-8?B?ZGJoMWVCQjN5dW1NRjZvazhhRHR5OHp5bFAvbEl0d01sOG40QlFobklqNmxo?=
 =?utf-8?B?U2RBYnpTOWp0ZkNaWUV1Y3B5SDN3dDhEYzVUMFFtZTI0SnhnSHI0SE03KzRm?=
 =?utf-8?B?ODhFWFFYVlIwOEkwbHI3Mk05ZzFzVXF2Z1RndGVPMUxRK3h1cnJPcFEwZXVZ?=
 =?utf-8?B?UWlKTjBFT2txVUpIanMvQVBtRkYwOSszQXQ3cU5yM0s5Yml0dkZ4ZlN3QkQr?=
 =?utf-8?B?am9EblNnY3Q0OVdzZnRzbDdwZk5VSlVmcU0zOWNPUy9zcEkxM3kyam5VVFkz?=
 =?utf-8?B?b1YvUlExdklSdHo1dFZVQXF2MU9SdnIxVGp2UFNOSndzQUxtbjYwLzB0OHNO?=
 =?utf-8?B?VEJMNHlCZ2laZlk5TS9VbWZHbnhDS0ZKWUhDd0FicDIwVmJtRTlhMEp6bTA2?=
 =?utf-8?B?UXdMY0o1MXFpWHFweWNSR1NGV2VPMnY2bjMzeW50aGU5Um1MeWJCa1lOMnFx?=
 =?utf-8?B?ZlhsU1RXZmVrT0dCY3FWU3JQMlpNZkFkL1FFc1V4Rm1FTHk1NWZSUWppRjNa?=
 =?utf-8?B?NzBWZzMvcmVwSWczK1Z6cFM0UzVtUTRiZmlwbzQwRTg5aHFhSzVMZjVES3Zx?=
 =?utf-8?B?NDNDMGltNFo3eUladkJFeDg3aUNWMDlmS2J2MUErVUdTTTVZYm9rOEt1Kzh0?=
 =?utf-8?B?aU5nZTBQL1pST2hOTm9NVzFsUFh5WjdlVWR2elA3b2xkUWpBZDAyNjRoc2NS?=
 =?utf-8?B?ckJKMTk1TFlxbElPckFJTHVrTWVSUGpDMlZQQ3FURmlldmFGYkdsYWlvRERk?=
 =?utf-8?B?aWJVZHAvQWJZRUFBbzdxa21TbGEvMXZ0VFBNdnhJS2k3TXhScERGd29paHla?=
 =?utf-8?B?N0lEbWRPcGRTc2xmdlppOUx0ckpVNEpWeGlJYTRMUEw1b1NXTjJXQWFiUUxX?=
 =?utf-8?B?d3hkaWc5MzFjVFhjdzF0U3ErUUkwNWM4SEo4M2U2L1d1ZUgwK2tCb3l0eVBM?=
 =?utf-8?B?eFV4UFNoclVGUVdyK1RHdEhzQ0FQc0RkQ3BFelpIaHBPYjFWQVErSHZ4azZK?=
 =?utf-8?B?NzVVeXpYTlQ1bS9wVEZ1bnNqcUl3NndWQm5pSWc0RXIwUG5XelZDNnR4ai8r?=
 =?utf-8?B?bGJlS2xsYlFnU0htMGljUnQ3cGs0cGtLWnB6eVRWYnpsRk5JcGVpRXVVSWw0?=
 =?utf-8?B?RDBDb2pBdDZrekdKOEdzSXJvRHhCNjFtY0NhTndNZGlLOXdrOGR6aEZ1bjJp?=
 =?utf-8?B?dzQ0K2Zhc0lwVWxBbFJMbGRjM0tWL0tyNXE4SERSbnl6VFVWc3BJamVqOWo2?=
 =?utf-8?B?bTRBRGMwU1RKL1FYZm9TYmNYYmJXd2JVellFdWdKN0RWNEVZSk1nZHdBVEJL?=
 =?utf-8?B?bExmdnZJdmgraUxvZUtzRnBLNlhEQ0JLeVIyTlk4TlZTb3dlRzlaTVAyMm10?=
 =?utf-8?B?UFpDVEZsS1Jrd2FrUG5XYmR4MU5xTm9tVnoyOG5mOHpDWHpURGtuZXdudVha?=
 =?utf-8?B?aGRUKzZ0UTJTK0pVMEpqdzJ5TEF4Uzc1ODJlTkd5VzR4VTMrdG5wSTJPTWNS?=
 =?utf-8?B?a0RCN0JIZmZCaHBnVENtWVJBSEZ2YlAwamtFQmhhRUQvLy9xMmpoRldOOEtt?=
 =?utf-8?B?QmpHTlVUaFoyNW9MTDhVVTN0eDlVRWhVV25nc1JLREh6dk5vblcrazNMcGs5?=
 =?utf-8?B?RmRhdElLdm5nN0dlcTcrZ1FHYXUwL0dTUG92VVc4QSsweEg4amJhaTBISHRD?=
 =?utf-8?B?eGR4RGQzaGVrWW5EMURZd0UwM0k4Tk5ycllCQTJXeHdpcVpzelBPcm1ESkg4?=
 =?utf-8?Q?KjVLnRdFqv38BpXY=3D?=
X-Exchange-RoutingPolicyChecked:
	gWnUuimk7eOO1Amuzdn1+VYkR7kQbJiRAy1P9FVa4fp0hmVGyNCTZtL4bWq+5H5xhmN97CDHLO+5GcXQhn/L3KwYbrTtvZT4mbqvuPU6UDWeM7JRYCL/8UtE7o6dchLL87AG+hxBWsrmdQoY0u9/RIx2iQVJ3fR43FxGskj+ifsLfj4QagYcIKBo69znLNTDnhQuJhKJTikNvRhBRedlz0f16DwqFKIhX6VQYU4APOTIsyp3J1FriZCkK72akXppxeLzMScvojTnbixA18geihAJTKMQaqcQ/W6P3vgoO4n0/L/XgR0n8XNy5pspqzr3wYToHfQQCgOQaUKVu7fKog==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	evWAQGLHQkXy3gUI03VzMMkzncX+tHPd/owsMwdc56ch2JsIE8QcDaWjbNZmVmUvETi9PpPK2Br3liV+FE/bLKFf4T69nqrBvat9F2lGQv4cJiRMJyjjNuSiWaKUNSMg8omFEWfTNNHFU3o/3CZGsMrc+t9GLo9SQG9l0/OEA0WDc5Cua/XB5sFtCimcjBeMpGs7n/cjN/68XBPksKtYr+D9x8pKp7a8JZgBYxQxdj/xD+rXTAbjjTGI0tLg1rmDUPZ6TLPsBgpQmYyAlSR5ld9aT4yz7/gd07LUJcycw7Nebwi3vjUCXNM237yfXxuO5vDCnGK9JVHCB4QNZmsj1DMAekiLVETbji1DJziOcXFg7soK4uQTxzqdZB1Xo0oEJlC8jBlbwAqbz8q3FdbrWuJ91QEOKIgBhKabmlBv1O08vw/cBQeDi9qmXKbfU9nKN/JGNqeIwBRZU6nzuNcIqdNsAnbnzsCUT6Ijwsrd0+zD4iA9dJ7W7sUZcmqipbjqtzFuhMU/ABxvz7VBWf/Vb8mFYIaK3wZRiXm4qB0QS70M0tpsfinBcn5sy9zcwYkGQmN7wS7y3mqiOZ13U3KFX5OvqZ525yP/o8K7bGg0UiM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc332c9-2861-4388-15f6-08df073b9f4b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5380.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:41:16.7973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RULejMPkXD8RpZY4PGY/xs8yvBe4zlQX4EKSItFb0t+9EzCII8MunHHFiCM4eEmNmuoSpenvatzJ4sYDq8Bcyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6060
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608310074
X-Authority-Analysis: v=2.4 cv=Vp0Txe2n c=1 sm=1 tr=0 ts=6a953e31 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=NEAV23lmAAAA:8
 a=lCAI_TF8MS3fePEP-7wA:9 a=PRpDppDLrCsA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MyBTYWx0ZWRfX0zI6IevRTE/I
 Y6sUpUGcEOZncFKj/IJ5XYjCUueqpJFlWltlKR9kjiaR6bBGAX0dB23MU3MDVaEZc0wm8t/1Pan
 l+AWyvkeWs5sSifs1BGuSj9uQfwbO85LolN0LoseaxBP3YSqPS85W1ZVmS3ltJoT/Md3tsfKdet
 mszWRxltwEjY8oZAceCwsjal/ZLG/aFtVbUpRUMmEqx6fCSWSF5XcvmpLIU09rWGuLs/6DLz3Sl
 VtvSkpDfMnTS1+AnKhF0U4IEao+IY3uv//RK/rJoLulaHENVjncRh30pdO6obWM5bs+zO4EOo9S
 xhMCr6cswMSVqN2InsUR8tSZzvl0PWAi919zubGOGpXLEiDmsSliOO7baY3yhUZ78R8Xjlp2QSu
 SYAgmtIVXgoGRl7EcLDBgQQt67XtyGcTVRsH+5eWinMGLz1TrC2nyMxmZR13NEfdstBFZ/bCwBf
 pIrj5JYyksUIieta5Pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MyBTYWx0ZWRfX9CgF8sZOjnbi
 9nZsOufbB0id6ccxajtxUudRjyJM/Y/tzabgasysak+8MW9R1AC6CR5xXFeqnknd5Q3qgHLoRHS
 mfgTg4XE21IKTjZprpllWsE1gfCtb5lNroqbSCilfx1NaChv67kX
X-Proofpoint-ORIG-GUID: jo_JmbLbgoxn6NAwyE2bfkDEe6OyS_97
X-Proofpoint-GUID: jo_JmbLbgoxn6NAwyE2bfkDEe6OyS_97


On 27/08/2026 17:17, Jörg Rödel wrote:
> Hi, I just pushed out new branches for COCONUT-SVSMs downstream Linux 
> and QEMU changes. The new branches need to be used together, as there 
> have been rebases which changed parts of the user-space interface. For 
> Linux the branch is: https: //github. com/coconut-svsm/linux/tree/svsm-v7. 2
> 


On a system that was running the 7.1 branches, I've upgraded the host
kernel and qemu to the 7.2 branches and am now getting CPU stalls in
the guest (and eventual boot hang).

I'm using ./scripts/launch_guest.sh (and 2026.08-devel)

One thing I've noticed with kvm_stat is that the top host functions are

  Event                                         Total %Total CurAvg/s
  kvm_set_irq                                 2304824   22.2     2095
  kvm_ioapic_set_irq                          2304824   22.2     2095
  kvm_pic_set_irq                             2304768   22.2     2095
  kvm_exit                                     626814    6.0      159
  kvm_entry                                    626814    6.0      159
  kvm_vmgexit_exit                             299778    2.9      105
  kvm_vmgexit_enter                            299777    2.9      105
  (...)

Are there any new kernel boot args needed for host or guest kernels?
I've confirmed that regular SEV-SNP guest (VMPL0) still launches OK
with the same components. I've also tried dropping the last

Regards,
Liam

FWIW, sample guest stall stack.

[ 1230.794758] INFO: task kworker/u16:0:12 blocked for more than 122 
seconds.
[ 1230.796595]       Not tainted 7.2.0-0.svsm.6.el9uek.rc.x86_64 #1
[ 1230.798135] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 1230.800083] task:kworker/u16:0   state:D stack:0     pid:12 
tgid:12    ppid:2      task_flags:0x4208060 flags:0x00080000
[ 1230.802818] Workqueue: async async_run_entry_fn
[ 1230.803993] Call Trace:
[ 1230.804646]  <TASK>
[ 1230.805250]  __schedule+0x2b1/0x6d0
[ 1230.806178]  schedule+0x27/0xa0
[ 1230.807014]  async_synchronize_cookie_domain+0x125/0x16c
[ 1230.808354]  ? __pfx_autoremove_wake_function+0x10/0x10
[ 1230.809708]  async_port_probe+0x3d/0x60 [libata]
[ 1230.810923]  async_run_entry_fn+0x34/0x140
[ 1230.812009]  process_one_work+0x196/0x35e
[ 1230.813054]  worker_thread+0x1af/0x330
[ 1230.814039]  ? __pfx_worker_thread+0x10/0x10
[ 1230.815144]  kthread+0xe3/0x120
[ 1230.815982]  ? __pfx_kthread+0x10/0x10
[ 1230.816956]  ret_from_fork+0x1ab/0x270
[ 1230.817961]  ? __pfx_kthread+0x10/0x10
[ 1230.818949]  ret_from_fork_asm+0x1a/0x30
[ 1230.819973]  </TASK>



> Hi,
> 
> I just pushed out new branches for COCONUT-SVSMs downstream Linux and QEMU
> changes. The new branches need to be used together, as there have been rebases
> which changed parts of the user-space interface. For Linux the branch is:
> 
> 	https://github.com/coconut-svsm/linux/tree/svsm-v7.2
> 
> For QEMU:
> 
> 	https://github.com/coconut-svsm/qemu/tree/svsm-v7.2
> 
> These new branches bring a set of changes and new features:
> 
> 	- KVM planes patches rebased to v7.2
> 
> 	- QEMU patches rewritten on v11.1.0
> 
> 	- Support for KVM planes with in-kernel IOAPIC/PIC/PIT/RTC
> 
> 	- Support for PCI device assignment with KVM planes
> 
> 	- Use of version 2 of the direct-VMSA patch-set
> 
> The last point deserves closer attention, as it will lead to a breaking change
> going forward. The new version of the direct-VMSA patch-set requires a valid
> VMSA GPA to be passed to KVM. The currently used GPA (0xFFFF_FFFF_F000) is NOT
> a valid GPA.
> 
> For now QEMU will fall back to legacy behavior when it finds an invalid GPA in
> the IGVM file, so everything keeps booting as ususal, except that the launch
> measurement will not match anymore.
> 
> This can be easily fixed in the SVSM and I have a draft-PR open for that:
> 
> 	https://github.com/coconut-svsm/svsm/pull/1209
> 
> This PR moves the VMSA page into guest memory for QEMU, just like it is on
> Hyper-V. The problem with that PR is that is breaks all existing Linux/QEMU
> combinations, as they all have strict checks for the VMSA GPA to be a
> 0xFFFF_FFFF_F000.
> 
> My plan forward here is to switch to the new 7.2-based branches after everyone
> had enough time to test them. After switching there will be even more time for
> everyone else to switch over to the new downstream code. And only after that we
> will merge PR #1209.
> 
> This is not an ideal situation and I'd like to have avoided more breaking
> changes. But in this case I believe it is justified as avoiding this needs ugly
> changes in the KVM direct-vmsa patch-set.
> 
> With that in mind I wish everyone happy testing. Please report any issues you
> might find so that they can be fixed.
> 
> Regards,
> 
> 	Joerg
> 
