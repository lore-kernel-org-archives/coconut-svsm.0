Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D47433D6D6;
	Tue,  1 Sep 2026 00:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224324; cv=fail; b=UXtCXZ/RXBgWHyWYChpNxg0r1e/EdgKzkFD/aDd+6BJVaPNqAAKCKTWBIXwZmDLbAUIF4EoPFfciv47zokuBh5j6pTid12Ulz5+1AJVxqlXU0NEKnwQJMvJy+avnIv56YpCr1+IzQ9/IHTu62gNozpEf+DEEqBUqkoqWo3gewLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224324; c=relaxed/simple;
	bh=LaV4aJfRojC67+6OdV44XnltwHFlWZEgnzy8Ukonk3E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jDGaSiei/b6b0mKOMIsxovDIoTMKnLmUGDALQDT14Yj5fCPSaB+ky4aoflHDCpVovUhj+y4UftSeHPmfxEd955YXsXyQxHwaTWtM6KvBqtBTGBbjVZsDno+y1UjwSMCfNKEjzL7V8AFncVRixPWrFfha13D7r/Nih7MoSamKmfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k7yrnTeQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Nht376C6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k7yrnTeQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Nht376C6"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VLBlsr2311041;
	Tue, 1 Sep 2026 00:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=h6iF8Tph7QMnKfaPOFFSRCWstyREJymQUQ+qiE3DIXI=; b=
	k7yrnTeQbXZkwEq5txTIpDckVLItheXdTGbGHDD2lbAkMPLLDirBn21bV9WfMnGJ
	pTDsms108UibOqbQQ3mAfo+BqCHAWUAjxfZas7E9Ah0v0Wiobft+InR7LCvqc8U1
	H3F4AGFT0ljbbks0nObyp+1js/rVWl8alGXoncoOo4zatr3/cr5wgAxf5gI1R8LM
	L75sDzdpTgQFiOGKxgm7MvaqG1UXiuSB96zoMkHFTE8jN71nLqKPAzlJiQjvCH5r
	DpyalJnVJoBJeokAPyP+AwZffUJHRGYyrBMm7AcrQ2cgc/fkkIfw0hMBgIP/2LYd
	0YrvJdVrADJNRJ9u2sMABA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbq1sknmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Sep 2026 00:58:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6810swqL014376;
	Tue, 1 Sep 2026 00:58:38 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvdfmmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 01 Sep 2026 00:58:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HedFfXSZh2MZ5VYV1JQmNpMYfLSQnxDZY1c9jVTkuuh7JZaGltIlzqJtax3JM5E90mumJ2RDDVjQPy8l6MuYHPmW2N99t/rI4d0gBGIKvYaAKKRHljKyPGwxwjRBOLibAFN/TCaNEvoCw4gBfvAWl1zwlkyQ0Kw0TiOYqmZTzthTjVSGmCoSYmzaq2hpqkoNfE/yKTxbn59fsAr4I1XgbyIrbbAgMGcUO4jkGa/wyr7HR5duV1rYVTexGSc5I0iHHdx7Ul59LWvnWhh52219x3Rlm25vbrn9amCFywRgPg2RBvu+6M/jjIdcBZhx/SY59WPQJ+xuYbcaJnuWRpkmEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6iF8Tph7QMnKfaPOFFSRCWstyREJymQUQ+qiE3DIXI=;
 b=yJn7EK3brH9pNh9SOxk627bMvwOcJdmqv/2hmAj9f82/+QzY/La5r12f9BuVkMcEVmvboHpXoDz3dXJBs3Hi7Rnb4EjMrhEXEdzpU3PZaZozTAk0bfoxqkzaEOztMIvbax+Un8BDkE1Qnx8C4Rv4CPYl26j4ybfkVV475cxGx/r3i8r1t7qW8hMPLr20i2oFtnqeHffs7zeh6Djw0G9cDhxf3nob07+dpDuFuI1+ZGXWkDqnOIT3B0gsMrBQ08S2bhjfydouHiB7TJNQBKaNdTUWHR2aobQkxbjyvI6ztBUugxYYNQRfG8oABA2z4WDBc+JzbGQ7sNAbRU3+jA802Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6iF8Tph7QMnKfaPOFFSRCWstyREJymQUQ+qiE3DIXI=;
 b=Nht376C6qC1zmf2AfQjrEEgcNXRAMCgIX9N4hDb9dn94ImfDHlTYrRT/s0P1AFbNptTPV0Yzfcdxj6itQYyCmJSE1/Ph5HvDfNI4f5xsKnPFOCzGR+xgEOY9yJjDQbokxXcSCTlgWreEDowpcUnX7OHqTyh1nF4S87i4073ZQTE=
Received: from BLAPR10MB5380.namprd10.prod.outlook.com (2603:10b6:208:333::14)
 by DSVPR10MB997960.namprd10.prod.outlook.com (2603:10b6:8:3ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 00:58:36 +0000
Received: from BLAPR10MB5380.namprd10.prod.outlook.com
 ([fe80::a93f:a5f1:22ab:bd68]) by BLAPR10MB5380.namprd10.prod.outlook.com
 ([fe80::a93f:a5f1:22ab:bd68%6]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 00:58:36 +0000
Message-ID: <cc95e357-00da-456b-a41a-357ddc857d17@oracle.com>
Date: Tue, 1 Sep 2026 01:58:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM: Updated Linux and QEMU branches available for testing
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
References: <apBelv6Ev-lCQ64J@8bytes.org>
 <b1cfe9d8-4f29-42f0-b3ac-312724250d0c@oracle.com>
 <apWcYdRjTeZF5vtH@8bytes.org>
From: Liam Merwick <liam.merwick@oracle.com>
Content-Language: en-GB
In-Reply-To: <apWcYdRjTeZF5vtH@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0158.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::19) To BLAPR10MB5380.namprd10.prod.outlook.com
 (2603:10b6:208:333::14)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5380:EE_|DSVPR10MB997960:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfa2f1c-814a-42c0-2b99-08df07c426fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	XVVk0oDd6RlyE+2RSr7LrrZKSmxawNsb6NBVP9GRv5GgXEpXxZP19M6VE342l0DNs1qOrBgAVWXNTQzniodCSYSheRO4fC2JpshITtZX9/exg+29su7IpCpiOTP27uEZtGpJOK+3GwEkQrm0z+pW85hSFd/53X8va5GBx50HLoBplYiQY3CtXWaBgqp9dKNHvyVj/QXP4MpHgZ0gKCpUOXJT4aR+rAUlhm06bVVlRYn1JlKqFWPsvG25YNfAMmZBVcYyw3Sl50eOQX4I9uN+72wttqB9nXuxQefiWKG5suEeMQ0NxBS0v1uaH+v96LbGW4vKTNCIGObIgqj3ZeCLFDqZ5j4Q6DP/R6OKfDHZ/vAy5GBOBoBiZva1XzNRiPl6MrUfTMpNoF6LFLwutCUxJ/7L8f6QcPFO0fbLHtg7GoTUDUYjvOZSVQHCpBQGbD8BwOTqDcypeSZ+89cmnVOoMarnmkkb/7tr0rw6oSAk0DXhwF1RYs0dR+k1L71mTWYScIQckhcuyXYwgpjlUXLJCOC0G2fGE/Cfggp6BFWOSh8/AeiW6cM4jMYu17H1v3E5Ks+osTjf0gjoqNxrf79TQ4hIrhJsoRZ5sgWZVdNq633A4sYi9PlUWII9ietNsADZRIfCkgo6eyaYmszUJaNi8y9VlmQMMKoAx2FQOfMfXQQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5380.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzZxWXVXeDhWTmIrcGU4eEZ0YkdZY3NMWTJTY2dYQ0orNlprd1FOS3IwVHhw?=
 =?utf-8?B?QWplMmt1OWlmZ2ZEMGZ1Um13SmR2bDJOTU00Qklhb1RoUkVKSFNGS3JOdEcz?=
 =?utf-8?B?RjZwNG5ZTE8xWVlxUDlvRFpzYnBmUHpxeGpLQ2tYTVVYQUtWZ1NTa0t0YXAw?=
 =?utf-8?B?TWFsamFNaXJOYVhpM2x5Q1BNd2cvN0toL2gvS1VuMkFPNFE4bFVCL1czODNI?=
 =?utf-8?B?MWtBVGNWTUNzNzJicEhBeTNhNVlSTFRudXFqcDZaR0s4TWo4YVlraWFtQmFl?=
 =?utf-8?B?a1hBcUxGbWlpUjNSekNZdFVZUTlqQ2xJOStLUlU5R2tqTjJwQXBtcjRYc2tR?=
 =?utf-8?B?T1ZmSHBOTndsZzc2cTZ0Tk1rZUU4QWhRQXRsTFhaWGJVV3NWOEFVejRvaUN3?=
 =?utf-8?B?ZzJtMEVoYmIwcEJ2M25IKzFIdDk4czVuOWRSU0swQ1NpcjRrU1RkYjh2eFlR?=
 =?utf-8?B?OFFrLzJTUEhacXF4cXdKSE1vck82ZDBNc2Zmd3JpZVkxU1QxdEtQZmtjYWpM?=
 =?utf-8?B?ZnYzd3FRSTVnWW1PTGxvb1VyVXk2TElhK3VYSjBGdDdpaXFRSlBxOWxKYVIz?=
 =?utf-8?B?ZU1lQWptSVp0dklrMXJCdC9YWS90MC9Sb1Z2UE9KbEVzSVlWNmxRbWswc3Nj?=
 =?utf-8?B?SzVBUmJNZGZsd2FRc2Rjc1ZpSGkyc2h0dmpyU29JMUNHNjh2WGpHUTJ4Ykx5?=
 =?utf-8?B?eXU0K0Z1bUErZFJQTnlReW1NeWgzYzB3ZVJWN0RCaUQvZm9KdGtpcCtoTnAx?=
 =?utf-8?B?TUJEQ29hVVhJNWVkZHpqUi9XWDhwMTNneHlzMGdZdTRaOXVGWTY4VEZRMGhm?=
 =?utf-8?B?TmhvMldheU1vekJlSmV1OVgzOEVuUEJhTEVTOTNJTi9VdzBOTlkwT096aUQ2?=
 =?utf-8?B?MTYzeU5GUEE4VFc0enJsT3VlRTlGdm1qaEJOVUF3TEdsNHRnK0JBd3JPakRo?=
 =?utf-8?B?bDlUaWpkOUhRZlVBbEhHeCszWXJxVEpsQ1N4MWx1bnFUSHJiUkFYcE8rTVJO?=
 =?utf-8?B?RldPaG56VGZBbm84NzJiTmxPRFFXc01TV0dxYklscmF1NGFaT2RvWlhRbXRt?=
 =?utf-8?B?Um1Gd2gyMFJYM0prZ3labEhFWFpJTGd5VzlzRWd0ek42SElPQ0FIcStqNUR3?=
 =?utf-8?B?QXJQaSthWE9SejRsQy9TRkk5aU94dFhsQzVqaFNjbFU1SDlFRktHKzZNMDRq?=
 =?utf-8?B?LzFKcjhtQ0VWWG1wam82OW12WVBUN2labDNoWnR5c2VGM0dZNHBuQ3M2eGNp?=
 =?utf-8?B?Tm0yMlV4VFR6MXZIMENRcWw0bTl0Ti8zc0xNSm5Cc0draVRLRjVHc0IzT2h5?=
 =?utf-8?B?L0Y3aHdsSitmUkxFNkVuN1VseTNHc1poOEVMUXdYelUvdllreGg2WWdBY2VQ?=
 =?utf-8?B?UzR1K3FSZkwwZkY1NUVDdWh0bkJIM2ZMa2pWTmhha1NQbS9HQ1R0eGl2OTdq?=
 =?utf-8?B?NHBieDBTVFljZWtvQ2pwOW9PWGtYdUN2RjlDRE43MFIyUVM5UkgzU21vU1VP?=
 =?utf-8?B?UlBLc2g1b21VWE5sQkVnTUF0YzdneW9vVFNGWWZaakVWYzdmZDhoeUM0dml3?=
 =?utf-8?B?NG9rNG4xTmJGUFZBa21VbGdSaHhIKzZJM28rRjdYcWN5ekFmcCtiZTZJMWNY?=
 =?utf-8?B?NjUrY1lNODl3ai9mK2IyU2VwZ081KzY3SVNpbHF3TnNCdmRPbmpONnZkYkYw?=
 =?utf-8?B?SWpDTml6czBxeFhHZkxRUEhYeDNNRXBnWGxySWJvcmNzMzFockh3N2ZKNzZI?=
 =?utf-8?B?UUp3WnNvd0VVVEt1L3Uvc3JTTWxyZmZIZnIyRi9DUGZZQzJhZTNOem1WcVlI?=
 =?utf-8?B?anV3UjdUQzByMmtvTXJlY0l4eW13dVBQVmRiK1graGNWcktTeS83M0Y0T1ZP?=
 =?utf-8?B?TG1NaVFGblc4SkkxRkRsK0NseXgyemVmR3dqSFR0cWxYVmZpMkRnL1FHcWw2?=
 =?utf-8?B?RUJkSUdoYTJYUTNhTTlWbS9vam9oaWM0YkowK212b25nWnJhWW9vQXdybHda?=
 =?utf-8?B?aWRYbG5JcEl4OXlSMkR3Ry9zMWNZbjdRaERqU0ZGbmhycmlaNHJKaGNWMnR0?=
 =?utf-8?B?TWpqNkJyRnE4V3FCTW1mL1grOUlnN3d6T0szU044ckpyemR0MGtnc3JnN2lx?=
 =?utf-8?B?MUlmalZUdEFEeGhNOGZ2Wko0UDBRRTBDcjN2eUg2NDc3M3BPM0FVdGMxWUo1?=
 =?utf-8?B?eEVycExjR1I3TFNiM0RhMnlEK1o2eTQ3SEV3cml4Tit4cFBWKzBoZEhZa3lE?=
 =?utf-8?B?L3BpWlhINDVqY2pheVJLWHJPZzlUZEVJc1VSWFRkanFGVnp0TXlSaFM3dzg2?=
 =?utf-8?B?Vk9aNlBYd04vcVhrY1VYeVhyU1pDT1JSSW1uRDFyV1NiNWo2MHQrTzdlUWZk?=
 =?utf-8?Q?3XuLHjhj4oHUeJRU=3D?=
X-Exchange-RoutingPolicyChecked:
	2RzISzLDFsFDH7yPtosn5daxuRcFreJAww9YUTZnoTtfYJmTkPkOZRji0T/fu8tQc7WOQQB5eWVtdbJBTaCd/WVEdLbezudMLfgLVru6yXmJf/e1eSyh42P4lw8SZb6/8cWdiD4hYpcA9smO62fh7xdMm72KjC0iKXLNt7jW0HOmsS9SjGYK4Hx+xmcO4LTVl2IT2EhB/mppveXeJMlmqlFXHebsmHnrUpn8AZsDjXFCgS+rYjrKi/rGhiX+uaR4tbD+v4ah5oecwNiqfPX8ph0hrZPs/N40cwfvdqWvn1Z1YXvCgrdfiLmmsjC4oho3sryj+v/u+H6ctfXtifcsdQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DrQnmSHRd8j3qhGxfXXi/Wkea5etq+tV2Ie4Aj8+FU4olM5dnbcE+lP+R/McVcGcoh9BfudHOhJjw9GaYkSjqV26NNwSaqmmYjut5y2kNMf9idnY1gdd7kFhlunnt/G6FJ5iJwUQz8qHqgZRfyyPoBJqsMSoUmKBDYvAinCYlRZDzSMK/bY15jtadc3OUowiMt6HnUS9DQ64myyqgLKlrVHlFHbl8KDNS7yF8HMciKMxMv56dSvob7OsQXZsPgR5tA0qXghUZkP7MwpFmllHr0WunlHCOaTD6d1NDhQfZCd9bHEkRW4BCHSy2RxTYgBoy1wexlzMds7zBgN/CVrMEl5zSgwnFP9liaU6CtukmqHx6Z9mow+k5kUjJvTr+3Id6nWvx6YChWzUnm+Eao7jyhvb+hGxOap5R/1YEmOCBpPfA43byCcG2U+YQs0r3BJlvP8vN1qGZItRO6QskJW4TErxEIyvW9FeoFInav31AQLB/U02G3PqRR8yo+/E0GCAcf8qWS53W47OzfqSfOD+CF5w3XxFFbHoorBqlnH75OE3lWb9tNHsrureKBjo6jHVrBXT/WWOHK1V2cdgo1qB2jpNZ1UIJNFS6ARWX/Ajqmo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfa2f1c-814a-42c0-2b99-08df07c426fc
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5380.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 00:58:36.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMF2U+lUKzE1n8t8pwsebZNfpVNJwcXsvPL7YTotDxlep4HvTk7TLQItubn9MeXJVsI7sPLaghwabL3GbAD6Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997960
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2609010005
X-Authority-Analysis: v=2.4 cv=Vp0Txe2n c=1 sm=1 tr=0 ts=6a96233f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=fxJcL_dCAAAA:8
 a=NEAV23lmAAAA:8 a=fkjzEZ2C6J5I9qX_XaAA:9 a=PRpDppDLrCsA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAwNiBTYWx0ZWRfX0M1J+5YrtrZo
 7EnefJccKRQnDKiB9Q/p41VyBH2Okt3dCWi3lTREFPJa+aHmG9Vxc+14FywUc43XOP2CSPQU2Dj
 rO8gOMA4QIWWNTY1PHb/tm2gomskLYRJ9wFFa1MV7cBJqNPf/YOEMGMw/48gJ/jS2b6yHgaZgvg
 /sEKv1M9ISFvG8/zvPYWdxryIxt3Sm1LdVOQvTXWrOqOEvhoPfSizSY7ny7pkVDT+7SADIVLnxF
 8rkmSVL+Qu5uXj2ucUUkvvUEMYKlxB/XV7j/MyAcI49NTCVPgu9BvI6T1NIKW2k4OcquCLFIBEN
 /V4pVIqJ81Z3ZDJpT5XMv6zaxYD5Lr9N4u1GqqxM8HyRZndehz59zogq4PolrraivnnKuVadQdt
 kVkF5xtjSGftoMrKTXARt7VmmEm48RGliMf+yuOLVDfi5YXKDZLhfFTCWpVSiWP2h/xUqcvN+i3
 LQpcQK0zBEdxbxpZJdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAwNiBTYWx0ZWRfX52cCY598Dggk
 kWW+xCD8RRqFCrXfgSyfp1pnw493JzS1NvADXJV2d1w4aAbA/cvu+qK4udpXDwASURDUF+SWITx
 cmSIgKZJE7PjbZwf2UTyikPvtWW3VlhkrdZmWdmrbUJfsl5LqRKr
X-Proofpoint-ORIG-GUID: iwi1K-610OW_DJYhzZFT_ihQ3m_ONESd
X-Proofpoint-GUID: iwi1K-610OW_DJYhzZFT_ihQ3m_ONESd

Hi Jörg,

On 31/08/2026 16:24, Jörg Rödel wrote:
> Hi Liam, On Mon, Aug 31, 2026 at 09: 41: 13AM +0100, Liam Merwick wrote: 
>  > > On 27/08/2026 17: 17, Jörg Rödel wrote: > > Hi, I just pushed out 
> new branches for COCONUT-SVSMs downstream Linux > > and QEMU changes. 
> The new branches
> 
> Hi Liam,
> 
> On Mon, Aug 31, 2026 at 09:41:13AM +0100, Liam Merwick wrote:
>> 
>> On 27/08/2026 17:17, Jörg Rödel wrote:
>> > Hi, I just pushed out new branches for COCONUT-SVSMs downstream Linux
>> > and QEMU changes. The new branches need to be used together, as there
>> > have been rebases which changed parts of the user-space interface. For
>> > Linux the branch is:
>> > https: //github. com/coconut-svsm/linux/tree/svsm-v7. 2
>> > 
>> 
>> 
>> On a system that was running the 7.1 branches, I've upgraded the host
>> kernel and qemu to the 7.2 branches and am now getting CPU stalls in
>> the guest (and eventual boot hang).
>> 
>> I'm using ./scripts/launch_guest.sh (and 2026.08-devel)
>> 
>> One thing I've noticed with kvm_stat is that the top host functions are
>> 
>>  Event                                         Total %Total CurAvg/s
>>  kvm_set_irq                                 2304824   22.2     2095
>>  kvm_ioapic_set_irq                          2304824   22.2     2095
>>  kvm_pic_set_irq                             2304768   22.2     2095
>>  kvm_exit                                     626814    6.0      159
>>  kvm_entry                                    626814    6.0      159
>>  kvm_vmgexit_exit                             299778    2.9      105
>>  kvm_vmgexit_enter                            299777    2.9      105
>>  (...)
> 
> Thanks for testing the new branches. Can you please share your exact
> launch_guest.sh command line? Also, what type of guest image are you running,
> something I can download as well?
> 
In a svsm repo, at tag v2026.08-devel where I've built svsm with
FW_FILE pointing to the svsm edk2 repo at tag
db97fa0a4b29 ("OvmfPkg/PlatformPei: Initialize 
PcdConfidentialComputingGuestAttr early")
[ I tried both DEBUG and RELEASE builds ] and qemu is built from
the svsm-v7.2 branch.


./scripts/launch_guest.sh --qemu 
/root/src/coconut/qemu/build/qemu-system-x86_64 -i bin/coconut-qemu.igvm 
--image ./resolute-server-cloudimg-amd64.img

Initially I was using OL9 in the guest but I reproduced it with an 
unmodified Ubuntu 26.04 [1]

Regards,
Liam

[1] 
https://cloud-images.ubuntu.com/resolute/current/resolute-server-cloudimg-amd64.img

