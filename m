Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28593DAAAE;
	Tue,  1 Sep 2026 23:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303672; cv=fail; b=jhDYig/OcQVJ13iCfupGKK3qb59+dcuPgCl3QdcshRjf9CeUNgPXGUKcsdlsqmlnqiwEySCBE1UdRbkqatQQ79f+JD+/oNaAyEggHjN7C7EVZkNEjMlV7VPdmVB6wkYKOdRdVdhD6XpoLXFK/nhNO9U9iqi+GavtxZWP+sxxoxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303672; c=relaxed/simple;
	bh=R0t9l59ZrlsybcY0Hx3Vy87m5s5fx8Jmd7xaqZfDiVs=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A4ZtQMKqHipGLpEmKdhKPx/N5q+S6gND39uw8T0r8snm29jBHUyF6gzvG+5hZ2/x12dDM8bjsOKjiyGsE3oNkxQFD7CMU7hlmvsHHKr59mmtFJWoLWHSrZoZclPghCHF2p291IJQeC+AX2e1DAXeSL+db6hsc1kmU4EjmWW/1xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=etXHKYoh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iS7YNnrr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="etXHKYoh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iS7YNnrr"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681L4LH54024238;
	Tue, 1 Sep 2026 23:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=TqQ+hdR6fTVFLMGaFDZPNmjdriLNC+xLtSHX83TqDhk=; b=
	etXHKYohELJftvoRVxzQjTJ/NTCcx8F3/jhHGLv8kex3mfeD4/YAU8LrK2sxLRr/
	cf7EeyMzQc/D7JtFrhQJAA/ekWSaz5PlmWH64kVAq+JKT87rLDlRWBXXJg1oEXts
	hC0fDhl6qmCBDcPnUQMNQF6Mna1lNVq3vaXZW0GO81Vt6/tiZl2t264I3auew1x6
	o/5CswW+UAMIu7pY1cZZGktLVZVFYZ3Edy1kC1tOa9URpq6e9DPQaWthqSznoF6p
	MGX5PaxS4i17Zj73TnxT/R3XOEPjEDgtfTh+uEMLKKo9dIG+UZN59WyvXf/8uwBD
	z6t97DsxUOOgnuquS1DOBw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbp72dsrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Sep 2026 23:01:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 681Mo4Gk009462;
	Tue, 1 Sep 2026 23:01:06 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvev8nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 01 Sep 2026 23:01:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmiwQ49a8y+5mkEVkEMR3v4E/EBuswmVVKERRxzmmR5CWjetySmXDFsSh/MgsxVOYbetz+Ewm3tRv6zKqFevjAe1wBjEF8Phrd1b/99LrTNWbRGX3UPDKQ/9U3r4Fl1AhWVHPTg80+G1wVuYOHSAjAlhokFWKasczVFqHBfHQLAxXdiQTOjevlcG/O0XItIEJ3S/jOB9d547fH2iJOMQlYBocMKhRAlSQl9BzhB1yMhrFLZ0A9sz31RPPGOPkgNSIXw2fXo84tkjdtxMPH2Y0e9Bwx5PVLRhUy+KINXgRhJJYbSeXx4TeIjVYFJMsS5LgktZXcH2hkhyC4o04r8W4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqQ+hdR6fTVFLMGaFDZPNmjdriLNC+xLtSHX83TqDhk=;
 b=F4W325LjEKoxYqrF+JM1KcST4SecfirMBVTJcJQ479zJEe0jCkGnPApFJu3PS/i+Ah/uKqNNze2GYBStcA4FuYZH7/4VZ7YUoBBAUWg3gCEaUT6Imsu3ZyIklfbTEuLfwKqHvQ6+kL61wn2ITaknbziJbfZ8BbfVCz1gerNv4hKpcrqy1R499Dn8m51jpMb2pL+ZotgF3jR9Z0umI4GXqj0SDf8geMXqnPUoQvhpczG2Bj+RwuEYVUEnZ4SdmmHmjsvpbzcyKt7V/YVML9N+C0+Lf+E/lBnJGmX1ALMiKUpDW2Ith7IrJoiEex/a2Ry/hXn9sSWtpYSPutd0PPYtHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqQ+hdR6fTVFLMGaFDZPNmjdriLNC+xLtSHX83TqDhk=;
 b=iS7YNnrrZipMUXNLiZMzKi3cWhM+bBAUwLQQKQ2D9lqOe0bp2d/+aWfVsP9n8qIR6nruH4wQtPSAtR2G5QrFRD8AKAFOSLa1dY70eGN/O9KHUncyq/jJ9wSp2LUDrDBv59jf+FoWuWARsY2c6hLu47e8TJYiJLq0nTcZqbdGBfc=
Received: from BLAPR10MB5380.namprd10.prod.outlook.com (2603:10b6:208:333::14)
 by PH0PR10MB7026.namprd10.prod.outlook.com (2603:10b6:510:289::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 23:00:58 +0000
Received: from BLAPR10MB5380.namprd10.prod.outlook.com
 ([fe80::a93f:a5f1:22ab:bd68]) by BLAPR10MB5380.namprd10.prod.outlook.com
 ([fe80::a93f:a5f1:22ab:bd68%6]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 23:00:57 +0000
Message-ID: <091149f3-c278-4699-8f8a-e99ab0e548de@oracle.com>
Date: Wed, 2 Sep 2026 00:00:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM: Updated Linux and QEMU branches available for testing
From: Liam Merwick <liam.merwick@oracle.com>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
References: <apBelv6Ev-lCQ64J@8bytes.org>
 <b1cfe9d8-4f29-42f0-b3ac-312724250d0c@oracle.com>
 <apWcYdRjTeZF5vtH@8bytes.org>
 <cc95e357-00da-456b-a41a-357ddc857d17@oracle.com>
Content-Language: en-GB
In-Reply-To: <cc95e357-00da-456b-a41a-357ddc857d17@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0355.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::8) To BLAPR10MB5380.namprd10.prod.outlook.com
 (2603:10b6:208:333::14)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5380:EE_|PH0PR10MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d077e4-f887-4da5-1e87-08df087ce20e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/DEmWOdBflT0CzgkGZg3Oioh/IgRZZ4F7viDyPVTqdhgTJZCoEl+D/f7xNcEU8sLBTAWeDp1vfK5v02Yfv4Kb7bH7UYXT4R6HmBNZxRU/Qxl+xlVgAxvM3bPua+Ve8pAIiWCxOvQI1iEAIOQuWuTcmM5QCLMTMHeB7P5O/COJKxCU1A9Gm/ZLR92RHBqSFoBLZp1sh5Iv+mrwDWuHIYyNq7Mbe4y8VYR5MuCj+D7QwxtUXupY31YTu8n+AiMIJWKq3GwAh/c50XXzxmovk3Oi4NkVkjM6FMjrtdNgUa8Si1Q6JE+jGBT8Q2TRlDL5n15f6KbhtIq4PFu2kwlp9HM6gf1Icdz+cdXinHNorn3o2Gkc7BWc/6K+XcDhcOmT9FTgP8QNCRB1FFLL7XGqEtivt67GHWCoqDGdM3V7yhuUI92Klkuhl1D5gvZi85zYXSv9TCpE6sJtfedgHZYlXWDYz2QZ4UoUBsmK7fVPAEmacAF1GNxd0qSCAOXFymvjgyAuZBgymBhO+T3+bjx9pw6jToT2vvz/VaE2AzhKvzeISoBAk0un22dQUxrbRbcLhMvHQmnRZJuKOxO0EOL+rSH0bWmNS70VolKq+3GiiJFyQqky1gab/QTxZztHKTE1kwAKa6HfEFDqAQjeslHWg5JnU6Al1VOBb5JAwVNo9hDrpw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5380.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjVCQ3pJN0QzRTQ2TmZVeStRd3NpNHJHTDZJWldjNVhXL0dweXZLakVsbjlD?=
 =?utf-8?B?aXBsTktDd2g2VXRYVFNhcXp2cHdyMGEzSkJtUndKMWFIVWRsM2ZMYk5maGFY?=
 =?utf-8?B?QVBEZ3hDeVEyNTAxdk1henJIUy9vNjJDc2RkRElVR0RoWjdLQVkyY3hxMDZk?=
 =?utf-8?B?QkxMbysvdkhGeU9xRWJMZExmcVhUVzAwaGNoMjlJelQ3QU0vVlVNOTFXK0k3?=
 =?utf-8?B?Q3pBRnNnZmx1NXZDZ29oY0tlZ0VhU2s5Kys4empsc3ZLRU5qRVQvRlFYVDlI?=
 =?utf-8?B?Z203a2hqWWh1Q1RpYVpvVjdRU212d2UvOTBtd09nbTBvRklLY0xsdTVsN1Jy?=
 =?utf-8?B?RTNQUWNZVEdYbzkzUDVoZjByZTErOTZYVHIyNmFYMnNNaWVuOGF1VUc2NHlv?=
 =?utf-8?B?Ulp6dHRQajdyUzBleWlQcHIwWFdwY0dQaHVRL05vYXJwZ0tSVzhkNE1Mc05p?=
 =?utf-8?B?ZGo2RnhxNFdDWWcxWDhvd0I0ZjBISlBRTkJaUHRFVnUyUXVDcGREOStJMWVy?=
 =?utf-8?B?QnFKRDM2a2Q4VmdQcjA5c2ZOQkhUUU92by96Z09sNXdXK3hmWkNwazlYTXNv?=
 =?utf-8?B?VXV5cjNwbWVubWlkSExRSG1uNjNkUm1WYU56OSt6aDBLelltS0dZeFR3VkNF?=
 =?utf-8?B?NXEvV25wQ1VMbkVwTU9DK2FId3RHcXZhcnZnTXZ1bFpIOUltVktpWXBWZjNo?=
 =?utf-8?B?b3pYNXljSExGK2F5U1h1QjhzNkVvV2srZ3hJK3RHc3lCL0syNWFCN3hZYjdF?=
 =?utf-8?B?OUFVZHZHN1lOY3hVVkFQaHZqdkJwSGdpMHdOanZIdzlWd3djZWZ6c0hrcFRP?=
 =?utf-8?B?YkZvYXg4SmpJY0pxNDBqb0Vlai9CRWJuWWdlVE1jYXZiRVpCSXpnMlpQc1ZS?=
 =?utf-8?B?RTJWWi85SG8rRUU5Snc5MzZ0NGlBWEcxakNGSytVV0JGUGtwT21la2d3ckk0?=
 =?utf-8?B?bElCRVhjMENxMU9YY1FuN1Blamk2WEEvbkNsNUdKRTN3a0J3bWJIVVhRZEtt?=
 =?utf-8?B?LzdiUllXNUtqTkFYWlhPM0lJUkdQeVRvbUx2Z2VnVHJuckRlejFPWEdPRGdM?=
 =?utf-8?B?ZU56TnAxUHNQQXZXdDA3V1ZnWDVReWs4OGROamV5UmQ1aHpUR1ZUSHJpdFRX?=
 =?utf-8?B?TTZIYWNrOFhVUDNQbkc3Zmc1VEhhTTFHQ1NHVSt6dTZ2QmI2dTN0OUVBMEpk?=
 =?utf-8?B?OG9QSHZnNm5NMFVIdnU4aFdFYitWWW1majF4cVpqQWlkaTFGWTA2Mnd4TTFY?=
 =?utf-8?B?L0t4WFZvbnRTazFFeEhNNk4wWlhqc01jV3dLYWFhOXRGQms0VFVYWE56cEk2?=
 =?utf-8?B?SHhoSW5vVzJnRlhKSlE0VzR5WWUwV3FhNWxCalNhNTE2Znp5SW5CMHdkWFp5?=
 =?utf-8?B?UXZWWDFZMC93TFFINnJra0N2a2RnS0YxZEQ1anZoeVV5TWFOUG85bnlVeVpV?=
 =?utf-8?B?OXE4cVd3UUlEblBnWEZXTC9OWGJwZ3ZEazVlb2FBSmZVNFVCODdGbVdkWllj?=
 =?utf-8?B?WE1mY3F5dFdIRWhnQUNqVW1VajI1c3N4TkFrU1ZmT2NCM3B0dGtMU3Vrb21T?=
 =?utf-8?B?SFUxN0poVTRyemF3dk5CTWQrdnhHbHpXQU8xMXRITHBLVXdJbnAzS1ovT1Iw?=
 =?utf-8?B?c2hDYTdOL0MrUXNIVWoxWFVleVZSS1hSOUpZa1BKS05XYkE1VWYrcVNpUnVw?=
 =?utf-8?B?RTZpTERycHJPYWdaNC9iNmFFZ3NPbFBCTjJCd2ZmTDlJSTFTREM0NDNxWE1m?=
 =?utf-8?B?c0ZtY3hYRW1TY2cvQTZwR2VWMCtSNjliOVRtMlJxUG1nbGx2QnpKMnVmVjZ5?=
 =?utf-8?B?Zk0vVldTdUtJNGpXbnY0YVZjVFdvSEJ4dEYxWGUwVTRXclBqTkFSZlM2dWNv?=
 =?utf-8?B?c1lzSm9sM0ZOOVl5bkNlVnBtYlplV2U1WC9zNGVsVEtpWmRzamtCNmNPcUdF?=
 =?utf-8?B?b25Zalo4OXpWbFFOUkxMTkxQbVpWQ2ZUWTF1RmJaK2tKTGdnbjdOL0dWekNw?=
 =?utf-8?B?aWZhcEprd1lnaE5TOXlDdGhDWGhZRUNqbHhwSnpMeVFIbGdkdEtwSGFHRlli?=
 =?utf-8?B?QWNxVndRM3EwQU55bzg2WmZqd2RKWGI1aW8zZ1NtT1pzYzVWOExTc0tzS0oy?=
 =?utf-8?B?RGdaTDRsOUlHUkdJU3ZlcUIzNDY1K3hWWWY0Zng5MVdPdnpzdmhCUVNIMXJ0?=
 =?utf-8?B?T3FsWHp3bHplb28xT2N6YmxycnZpTXJyOVNNWTFJRXhaVTI2dUJXUmVYNUxm?=
 =?utf-8?B?Q0ViRGxXRHJ5K0J6eUpRUWpDdzdLNWxoSHAraW5iV1hNUlNkSXBrdVJmOGUz?=
 =?utf-8?B?UFFMRGpNNnVZYkg1YVNRSmdSclhaRWxyT0hMNTZrUGNoNkJsWlVnQ2tjTTlw?=
 =?utf-8?Q?c+8AXOCRtXnsi3iQ=3D?=
X-Exchange-RoutingPolicyChecked:
	X9fDOf+sBhGXEXbGVPh0Ixvf87F8cWv70kJizBFD9oNPMaOuXTzPpDbJTKksEnBd5BO2bGQRmNcG+DMVVZLW26Afui1Ot/qxvwmr5crI31WmdqFSgAFRpqs4u5ebiK1I8JoY2065vn7Nj+ShiegiqzXBn7HTYd33sCda0prp7B7T01qFKzhniigOOxgPehxfvZo6Ej+dIHXOEPeFDpNIeHPjeXYa3bgaIJwtz6P8Byl5CMLBeGDuLwmXpiAqgKzRojmHdiNEPSkCU/X2h2rvTM2p7x2vwZdlSSx8L+6jIuFOueTNPvqw1DnGLqe+lhT86CqTS5ICgn1GV8v6IBzlZQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t7D9mdinLI3g1eizSYrgMsg0HUpkNKsA4RZUkAaKAxBrU4ar1Xv7BBiENrRIbqEKB1mXpJyitbyhpC9IznQMY/ZO1kHsKJGHfAKheJSFBS28obDzqEJm80/UYgb3MarW9fYjKCSU62wm/eR4eM58juC0kQogplvPPJw64HD1GoE9E7c68ab6bciZLr4jwUvpvb6RTu1OdeaSaLys0TlpeVjFhFAlzPjur+yKYT5QsOyXhYee/Rv7dN0DPOg38gDtW2BXSKGDO0oJSUTim3IrxLj29Lt5KZ0Bl+KXwmycHthBhPIzYuAzn8hrpnORmRot8QmE3WmAKeRjDkKcoKVgtGuce5l27DsEXpUeENnSI9A8fzlwEmgkjmyDlzy49GjM85S3Z8kizux7OXTGSqfVlqh6i1QH6QCvEZve7R5etb3T59SD1yVAUTsdJj8VaxIyVuN69I2wrVIiMBLAnLuP0QsbL59WcgfZy08h/mQq1AKaX8joq0PH+tqwtQ/EsxtqzZIzqdNI/vByihN6clUC818jS+AMbjFR0BjWfYzOj3t7/3iTMYderNjiEMyqAQlqPLlsotqCDoI99IWs5T2LP5IjRhrbmtek8aiqmzUEhlE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d077e4-f887-4da5-1e87-08df087ce20e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5380.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 23:00:57.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCY0Jqk57tEcqIWK9efSrJkj8Vi46obc+cJBeG54+mVqsdktU3R7QnOCgN7mTEtV2hZZHq0l0EoMGxUBtAVJAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7026
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2609010200
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDIwMSBTYWx0ZWRfX0ktY6GPzen8X
 TC3lgHJPnqM9cMfbJbDnv1Si78Qi4afj04sdgsA1r/7M24O/6cssEwxWvHoIGFYwWJoPkLDStbz
 UbG28H6ixSSGoZIot8TFDm3Rz6e6ZdmGmolrYlmUJ79gtP4dzkcn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDIwMSBTYWx0ZWRfX8PoO7m6OGTRS
 wBlCjua4oBt9xV9Puu8C9AC9d8ZC/e8r9GCAE4g/qOvCjtzC/NIKxGULNElhtO8QpxD728S8c07
 8iCIe0Zz6RDJ2dZ53qKPYfRkV/w3hp6rD8eDNGMK0jLGksqMtDzZ+CMUAp3vv7s69wnyFURyTJR
 I37yXArr9ccWEy58CCTnyB6nMfykEZ3+90150OfAGbGFe3xDDsxA1doJVLxZPScLXcWDtkzWsUL
 JAou690vQNRlqCwCLI39ZN2jpjSAhu60WT6rtusbHVkomEq6D/rTwKpfKu0umMGlR41ELJNxe1/
 LXqi1fT2GEElWGTwATJ1zG6YRXMzZJwhAJbeOlnFb5vjqeifd4hOEZ1qSMuQpb/yCJmlDHIQdoX
 OU6feQPOY8s0Odyhr1PmIcfvnHBOF7qPQLGnhS12h4LrHCQGA8ctB92CGsGWPAOUb1BDAve3iGE
 xkUI3PeAjTatLwRZX9Q==
X-Authority-Analysis: v=2.4 cv=G7os1dk5 c=1 sm=1 tr=0 ts=6a975933 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=fxJcL_dCAAAA:8
 a=NEAV23lmAAAA:8 a=8Pt4wtQBsACzOfZlUUUA:9 a=PRpDppDLrCsA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-GUID: bK55A-3NS3SlgBsV53A4zEICMyVlt37w
X-Proofpoint-ORIG-GUID: bK55A-3NS3SlgBsV53A4zEICMyVlt37w



On 01/09/2026 01:58, Liam Merwick wrote:
> Hi Jörg, On 31/08/2026 16: 24, Jörg Rödel wrote: > Hi Liam, On Mon, Aug 
> 31, 2026 at 09: 41: 13AM +0100, Liam Merwick wrote: > > > On 27/08/2026 
> 17: 17, Jörg Rödel wrote: > > Hi, I just pushed out > new branches for 
> COCONUT-SVSMs
> 
> Hi Jörg,
> 
> On 31/08/2026 16:24, Jörg Rödel wrote:
>> Hi Liam, On Mon, Aug 31, 2026 at 09: 41: 13AM +0100, Liam Merwick wrote: 
>>  > > On 27/08/2026 17: 17, Jörg Rödel wrote: > > Hi, I just pushed out 
>> new branches for COCONUT-SVSMs downstream Linux > > and QEMU changes. 
>> The new branches
>> 
>> Hi Liam,
>> 
>> On Mon, Aug 31, 2026 at 09:41:13AM +0100, Liam Merwick wrote:
>>> 
>>> On 27/08/2026 17:17, Jörg Rödel wrote:
>>> > Hi, I just pushed out new branches for COCONUT-SVSMs downstream Linux
>>> > and QEMU changes. The new branches need to be used together, as there
>>> > have been rebases which changed parts of the user-space interface. For
>>> > Linux the branch is:
>>> > https: //github. com/coconut-svsm/linux/tree/svsm-v7. 2
>>> > 
>>> 
>>> 
>>> On a system that was running the 7.1 branches, I've upgraded the host
>>> kernel and qemu to the 7.2 branches and am now getting CPU stalls in
>>> the guest (and eventual boot hang).
>>> 
>>> I'm using ./scripts/launch_guest.sh (and 2026.08-devel)
>>> 
>>> One thing I've noticed with kvm_stat is that the top host functions are
>>> 
>>>  Event                                         Total %Total CurAvg/s
>>>  kvm_set_irq                                 2304824   22.2     2095
>>>  kvm_ioapic_set_irq                          2304824   22.2     2095
>>>  kvm_pic_set_irq                             2304768   22.2     2095
>>>  kvm_exit                                     626814    6.0      159
>>>  kvm_entry                                    626814    6.0      159
>>>  kvm_vmgexit_exit                             299778    2.9      105
>>>  kvm_vmgexit_enter                            299777    2.9      105
>>>  (...)
>> 
>> Thanks for testing the new branches. Can you please share your exact
>> launch_guest.sh command line? Also, what type of guest image are you running,
>> something I can download as well?

Another data point. The machine I encountered this issue is a Genoa
machine. I did a fresh install on a Turin and another Genoa and those
do not reproduce the issue - the latest SVSM branches work on those.

On the problematic Genoa, switching back to the 7.1 based kernel/qemu
combo works. This machine has been running SNP/SVSM for a while so not
a fully clean config - it could have accumulated some setting that is
incompatible but I don't see anything yet in /proc/cmdline, etc.

Regards,
Liam


>> 
> In a svsm repo, at tag v2026.08-devel where I've built svsm with
> FW_FILE pointing to the svsm edk2 repo at tag
> db97fa0a4b29 ("OvmfPkg/PlatformPei: Initialize
> PcdConfidentialComputingGuestAttr early")
> [ I tried both DEBUG and RELEASE builds ] and qemu is built from
> the svsm-v7.2 branch.
> 
> 
> ./scripts/launch_guest.sh --qemu
> /root/src/coconut/qemu/build/qemu-system-x86_64 -i bin/coconut-qemu.igvm
> --image ./resolute-server-cloudimg-amd64.img
> 
> Initially I was using OL9 in the guest but I reproduced it with an
> unmodified Ubuntu 26.04 [1]
> 
> Regards,
> Liam
> 
> [1]
> https://cloud-images.ubuntu.com/resolute/current/resolute-server-cloudimg-amd64.img
> 
> 
