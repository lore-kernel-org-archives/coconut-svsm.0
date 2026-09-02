Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40033480DF0;
	Wed,  2 Sep 2026 13:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357298; cv=fail; b=sLRYNWIlT1VT4u/wf2kuH59zO524s6sk/JlFIcmJypDIvBDyfOkUP5e14X8bFpr14tToxTv2C5H4Uoqwv2WG8kanZmjlR5X8YgJeFuxuY014dab1oXSHWnsbcCEUHmU3nV29N+RfPLQER6xx4GWWzXJrzc/DHU3OU2IcWmjmcaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357298; c=relaxed/simple;
	bh=cnS/3GY3uQNSvwzj6Yds9iV856Dfe2UoYor9rkYUGuA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RRokDuSg+wQ7NGsuUnYze4CYMR5FVB/1tEZR7h0MERu/pikPrlDd+2+yJXwGj9a+aXS/G8RPl81sZqxyhVlOhzvsn35DCqPmtyfmk2h4U/slZBhqch+c2dTkAzSsSdHwRvFaKRaqtqW1ukIltYwG33xv3D9SIJzZxURqsKwOl54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JUeWXvQ4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GbdtzPIo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JUeWXvQ4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GbdtzPIo"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682DlCcN2621191;
	Wed, 2 Sep 2026 13:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=QiPFU8uHlL0pnlxjDOOjmG/GSyis7Cqywopx1JWFuSo=; b=
	JUeWXvQ4CELVKixrETgJk9dZ7Eeyaa5KEAbGYD0/skMGuaZdEk1nQ3t3HaZN/Eww
	f4MLPWFMBFOmWp5VYVXE4fxVZX3DSL337rsHuF26nPh5IhvCk78HrhxRX8w9YAQY
	fWPNWu9a2kVfEaxKelXLvjcSvu5m7gTLW6GW704MGlXH74LK4qPcJYZrIoJhz2X4
	rhz+rH80sVZ19w9ejAi7cmAPmOiIwROyc1SfIHxx6avRSk8GEpAJhbLv1IABU7y9
	gvchovuCd4GgKs0qsx3T91elHpiLA7hwfd8tUImoaNTRY2Yth6a0RfSPYL1OfHAQ
	FdnYbGv+tVfh/i5xCWBcHg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbqa7px1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Sep 2026 13:54:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 682DoYqF008153;
	Wed, 2 Sep 2026 13:54:53 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012023.outbound.protection.outlook.com [40.93.195.23])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvs9sx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 02 Sep 2026 13:54:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wa9t3QSyQvtwtR1PFjB5P2OYtC5Un7DW8BssTSafd5LwvhXgzfEHG3OeCEiaVUiqRQXegDklUJyLcraZZfv+TRKXs+ND7xW8eDfREWPlOaq3yOi+Xhx1WMx/sQr/tlMECVhv8kv+MP9RY7NgwdZb3gqrScfk17BoELK+mGjdk20y7F6vRgs+YG/0lNx1PMMfY2rEIJErqOxB05DFmwCiqA0AeTFsUMhtaUS+V+NB0fYP6J9g28rbCj2kEw68wYQLRtQI/MMYT2PNUp2k6hTCwX0a+/0tfOOkJOnZpsYuuVnNNnXDx4m9aspghFJcNMe7v5S0KzsNWI186hGkbe1HEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiPFU8uHlL0pnlxjDOOjmG/GSyis7Cqywopx1JWFuSo=;
 b=NefNNyiDBk4yqMwxqYFLqLX/StNP56TDsEnPaFroHby2zw33ZInyUZts0mhY4DoFX6NsvgWWXc8VxVWgP6SAn/YUFIXUsCjlD0g/PJ5qsWPkyP/BUougBPcvWOTt3tHNycfG1cM0OwOASF77e15FRzQRtGc2zL5NamrM8w4aTqChwAL+Q/dIKf96bJWsvhsy5MmfMXw/4uII6zI996+/QRSTXALWTRvGw0lSDBnijw22gttDmVifNTfH5vbM/K9zZog/+WUDRqqXJm3lh/J0Gog/nW5+BjjM/qghA52Ky5QSy2VOUxwMQJxfqb7Co0f9Ca9YeeXU5lmJ1+1K5Za+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiPFU8uHlL0pnlxjDOOjmG/GSyis7Cqywopx1JWFuSo=;
 b=GbdtzPIoL1p5/c+tyYI3+UHpPHYSH7amXP7QchEItAItN6rEucJ/tbSILg9U6gs+mBzNu9fi+XhqLx/yTufuYaTf99g4HHSNOD7MhfAjSsyLGiJ5C24jynUzqnTMGPBpO0EjT2FbbIKj+NL/G7AX8riDlQDOBVxVwvLxF2z5qwk=
Received: from BLAPR10MB5380.namprd10.prod.outlook.com (2603:10b6:208:333::14)
 by DM4PR10MB6230.namprd10.prod.outlook.com (2603:10b6:8:8d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.10; Wed, 2 Sep 2026 13:54:49 +0000
Received: from BLAPR10MB5380.namprd10.prod.outlook.com
 ([fe80::a93f:a5f1:22ab:bd68]) by BLAPR10MB5380.namprd10.prod.outlook.com
 ([fe80::a93f:a5f1:22ab:bd68%6]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 13:54:49 +0000
Message-ID: <8bfed259-d508-46ba-8604-283359f01d52@oracle.com>
Date: Wed, 2 Sep 2026 14:54:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM: Updated Linux and QEMU branches available for testing
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
References: <apBelv6Ev-lCQ64J@8bytes.org>
 <b1cfe9d8-4f29-42f0-b3ac-312724250d0c@oracle.com>
 <apWcYdRjTeZF5vtH@8bytes.org>
 <cc95e357-00da-456b-a41a-357ddc857d17@oracle.com>
 <091149f3-c278-4699-8f8a-e99ab0e548de@oracle.com>
 <apfpXc1bKIG9dCwX@8bytes.org>
From: Liam Merwick <liam.merwick@oracle.com>
Content-Language: en-GB
In-Reply-To: <apfpXc1bKIG9dCwX@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::15) To BLAPR10MB5380.namprd10.prod.outlook.com
 (2603:10b6:208:333::14)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5380:EE_|DM4PR10MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: f0603446-0a21-4914-5582-08df08f9c147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Czgq08B64lpuP8Jo41bVXjiJ3+my4lKsVP59jSi06YleBjbMeslfmDiJZpSWMnlgqmDmgK3v0GqI+gOg4f3X4uQFs6FbqcEC0y+jJMGwaQWDRmweAMPVu/yvehBrLt0RTwMVouKwLp6/mpipWuxV/eprk7zNdE9a8Dd1u8ddPioEQWdBzobtGMPq7bolU/s6d5kv0fcwAMmKl/eWIik/mueQjX9Z/BsI+lgZcxKOmBnNIOGW4kggrDbxJZQ0UpwC/2ciJS+fmsoySdPqg4pC3mjLInEk5xzmDT5Te73Pkfn57LnYoxx0t5uw5dT7zT223z5xuCPVtaR0CIPbycEra/nGvHKMDO5Logiw3OSw23xO7pT7sZFU6JNVrR9t8kWnODitS19C7dnRHUQ2AJTJOWcadfa7FLH7/BOBbMlLNhGCbef/qhDySAIjkxh7NUfb4MUIo0ehDAF8IQcq5ifq1vpdmOXhix2tPMxgCv7PA3+5CLLv764IOZtSzlI011udrbDjCwwcGcTSOSuQMG9sAUxgNDXaD/ynZS1wJSYnms9j+swO+RmsAX/19ZM5dur5ZHwa0NFqYIoj8BoXjqXuLIoMRFe36iuv5yz/q05KlCaPlbED2NCZjwjU6TMTTnDdIdviQtGm2rjXm7+pGiFywOsroGmFL80NuS3y9Wx7Yt4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5380.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWQzeXloUHRURWNUVkVEcnpsVVRMaFFNemJmYTBZaXRlY2dDb3ZmSFNuSU1y?=
 =?utf-8?B?RmVlanJQY3BOK1k3Tm13ZXUzSDhwZVArdGNWOW9sK1RtT05GK3V1TEd1eS9F?=
 =?utf-8?B?QmVyWnVxTUdhVHZVVFBkK21XYzFtLzhxSElMaWEyVmlLSmdhamppMW1pYkRn?=
 =?utf-8?B?L3I1RWYySCtNUjZBVUJmajdWUHRRY0UwaVM2UEVwOTFFV0tLYXNxelIwdEIw?=
 =?utf-8?B?N01GMGo2S3JBUUhQQTA2VFNuSC93dlloZ0dMWktpczVaQ0ZER1ZZejkwTUp5?=
 =?utf-8?B?WERwMlpyUHZTL2VzQy9XV2NaKzR6UkpFUzc4dUl2SndwOEU3eE1yYlkxOVU4?=
 =?utf-8?B?Y3lsSjlCaTRhQW9MR0RpRm5PR01BMkx6YTZTU211dWFURW4yRFpidlZ6U3Z4?=
 =?utf-8?B?d3Z2VGxyUHFyUUxYeXhNelNGaktVSFd0MkcrQ0lEcGpueVNCYXd6R3ZNR1l3?=
 =?utf-8?B?SjUrRWN1T1FCditNUGhHalJYSGtVa1lBUnRJZDhseDdvUzVBU1lRKzhUdG50?=
 =?utf-8?B?ektzU1p1cnd0SmRjWHB5V2tMUVd1d2dQNGtPM0YwZkJ5WXppQmhGaGpZeGpO?=
 =?utf-8?B?K043ZnUwRkV1S25JSWtUSjhRa1JCeUVVWFdaZ1RiR0syM2NhbVpFTHh2RkJP?=
 =?utf-8?B?OXZLQVRXU2tzeUVMa3IzcEdoT1FCNGxZYmtHNmduaW92aldCWlFqUVQ3WW1h?=
 =?utf-8?B?WjlUOHhvSWFiMlV5dWYxclNEMVJVVWdGMUtlMFhwY3hCblpuQXVlbWFhR0NF?=
 =?utf-8?B?S1pseXQ5OVZPZ1Rac1ZWVXBOVjNoYXJiYzdOL1JpSXozRExPeEpHN0Y1Vlh6?=
 =?utf-8?B?ZFVhWG05c3FTTk5XV2JQcVBXRTNFYjRBZkxWN0V5T0lJZFZxazJKOFMzRzNw?=
 =?utf-8?B?WGRZK0ZOVjNqM1p2WFhTUlJqWGU3S2p6UXc5WTk4aVBmVG1NUEgrai9KZVlo?=
 =?utf-8?B?K0dicHRQdUEwSVVYRSsvRTlXeFpiTEcyU2dSZFZQc3JSMGpyZjF6NFE1Smwz?=
 =?utf-8?B?aml2NFd6NlNMUHFjQUhraTNFS0RmaDVNUEl5a0phTUZkcVNEUGZycVBZZWVn?=
 =?utf-8?B?YitrQVZ2M0x0MjBkM3JDMzZxaFlobWtaZHREa2tDUlpTclcxNG9JcDVFbk5t?=
 =?utf-8?B?OEZTOXhIWkhhRElENWFJNEltcVl6QnRxc1ovZ2N6R1pWT3hHRW45Y1JyU1Rx?=
 =?utf-8?B?ZlVYeEp1NDJ1eFBMTXkvZ3FwYVdOQ3JZSWoxdVAzNCtnZUFBK0ozTGtyR0ls?=
 =?utf-8?B?a0NXK0RWRnYwRm9BWkpPa3psSWU1RnlQM3pSNEJ2THVOZHBNVjU0bk9QWXJi?=
 =?utf-8?B?c2cvOHg4cVVqQlUvNWNoRUxlNnQ5amdTRkhEa1JrK1VUWFliMVluUFAybnh1?=
 =?utf-8?B?V3BKM3hLcERpVjV5S3crWUpQamFjU0pERW9TSmxzU1BsblRabXRKY0xja3dR?=
 =?utf-8?B?UndiUnRyQ2VkalB1Z2wvLzdOSkhEZHRTT3k2bTVkbmpnbUwwemFMNWF4QS9Z?=
 =?utf-8?B?OVJRVDIyMElKRWREdTdyYTF4dGV4cFptOG1WWE5LaGZYdDJoQXBvNWFMUEFw?=
 =?utf-8?B?cHNIY2huL0pzRFdhV2QveVVyR01YMXFPR2V5WGYvNkFGREFlOVpHMlhUbnBj?=
 =?utf-8?B?T2pJQlpjUzNkVXZzMlpiZ0p1SmlVank4RkdoOTZQbjNNTHl2Y1NlRk4zcEtH?=
 =?utf-8?B?bkI1TmpSY2djdG05dWJLM05WVHBQTnZpdGV5cVRRc21QK0ZwUXdGQ2NuRThY?=
 =?utf-8?B?Q3RWZDVGMmVMU0YvVWFQRjluY2FyN2RxdmVpcjdOQzN1NDIvUjZLNXlFckYy?=
 =?utf-8?B?SzhXeGRYZzBJSEFMdXE3TFE1elR2QkhoNzFqVWIzbXJoOUgwM2pwZ2kvcjBm?=
 =?utf-8?B?WXdJVzRVZlFzZEpYTGd3OGM0eVUySVliUENJYW1zL0I5eDJoZE1ZTkliMDdH?=
 =?utf-8?B?QzJmZGJ2K0Z2NCtLeXRoOStxYU1GS0ZYbVhGbExleG9IWnRkd2ZZTDNkNVdR?=
 =?utf-8?B?dWY5blBnazFFSnpZS3AzSkZVK0NVU0MvaEd4RHEvakxpcDFpTVFrVitWckc3?=
 =?utf-8?B?UTQ5SjIxdGhMd0N3dXBmekpvTFgvRDNLdzdtbHkrdXd4VmZVRVJsZ0FlQkRp?=
 =?utf-8?B?ZDJnMW8wcGZiZTFjU0IzRmZQSzJYNGMvcUVqUUtPcVc5akhBa1YzTjZaaFM0?=
 =?utf-8?B?cVhTcGpITDVjMjl2a3dObGlRSEFRMUpLNDU5ZSt4ZEVMaEhyTVdSU2lqTHhs?=
 =?utf-8?B?aTFVT1NHMHlxTHd6YWJVcVJGTGRIdGpUcFh3UzFKWk92bkpkdnJQeGl5Y25X?=
 =?utf-8?B?Ujh5NStUK3JHeW5rOThDU0NRZU1sV2tSaUc0eU5USkxVY3B5UnMvQ2VOSlpv?=
 =?utf-8?Q?WsiDCekSWPhrPHBI=3D?=
X-Exchange-RoutingPolicyChecked:
	LePisDc3dNGMyWgWtINC1ZYMdqSMuwF4NSGSROwZscnr4G9/C9WEd+LoxPFF0wygh0rY4JQDqI9YZ2jZMuKt/+tOtiGMexxQ0IuSr5mvSTbmpyiGufR0o2ooVL86su/NmDIcsErvT+gXNeMyZcUQ+dzIh6EoOFnZItQlWFqDS4AIjv08wk2mmCeBKb1I1oFz8KQEJhvrs/vnWjGyVrU8td0GNbprYU1lgJLpOK2FNwk+Ejmkmzvn+IeK86OdEx/ilDcn9fi13CVsOwpSWpPiSZf4YBhLjd8WvNZdF5Z8EgcMT7Xuswa3NdYX0GLoxorU8HumcsnpRNJNoM7317DwZw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hgp3C76GDsbcH12+aOqTc4NjHIDEeaJh/8mgdJCn7PO+0spLiT/gzFGW2dWrAQ5udnlpTDj7ylG5MBTQIiLuPzGjGDn/IejFOBN/lT+prsYLUFiztr72M5DtZO6lySZZV8w2epP1M0ZHQHMPiUlOQpLKO1gQ8IO9zDsC7jJjgqrluka4bX5qqVDytHxPolbXpQ4zdCk/Gr7oLAbeg/Cr1Qh2tKTesI1QWqouYTqDzZxO8LW35/DlsJTk2P/C56FLbCCPR32cA8cB0N6HyKZvdWgnBYyD4DkLtrZ4bhtio0vHIZLslKQeOYfs5tv/wylCs1KdMb9OfA6wOeL9+kwiGQOZNg5sl4mQNNN6rxy02mFVdp1OLC4qHcKMlVn4xj6/orc2fHZm2N9aRoAVKK81Vr/LGHUgd+39+IOfRre+lfh22v6+Fzsqzk3TQDbTD3+pK1Pu25M5DOFHkVmcfuzb5uyrkp3kwVWo+ob7LYHUiH8wqIQXr96oiMDeniAbb2gRQ9Ba2P3Y2cNwghhfKuTDuAAce6ryhACUprg2bhLoVa0YbQ8mvPW3GPOrkLa1H9LbWqHuUxs2Xm1wLWIrcNrPz8q2+A3uDZnrKaXodt1+5VQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0603446-0a21-4914-5582-08df08f9c147
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5380.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:54:49.4493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uxx64fAJIWnh6wSkTsPWQAyLCQWNUsgDK0IYv/9syG95m9Yapqqa7+/7TJqtldyxapSwxoE0sa5zcGlBihDMKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6230
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2609020123
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfX7NTfkcMeHmPb
 gApgpdZcT2t/9FZn2ZfUFgo5HXcEsiSNM0GISQre3nhuDT8R5VD7yRnYjtwNWhC2YTxYW6vFXVU
 AYIN8xWTUL3AW6qJr2nfdrax6jk7OqIKpDOgj5f1GMwusmwjHQXp
X-Proofpoint-GUID: RoYX3dtgi51VJqdxJiLsDnUGC-mfEz0K
X-Authority-Analysis: v=2.4 cv=DPu/JSNb c=1 sm=1 tr=0 ts=6a982aae b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=NEAV23lmAAAA:8
 a=TFO0qObFzeKTNJH1o0MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12101
X-Proofpoint-ORIG-GUID: RoYX3dtgi51VJqdxJiLsDnUGC-mfEz0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfXyoyTAzMErCQj
 4bGmVKhJnIG5qCAaiB5T+je+c6QXMf8tv+Q9bygAt/gbshQ2B20i72T5JmzmnZ6SLCbLoi1Mduz
 +9ZG6wFGoRDVvXMabivwncC0q3dw8vPceks/07WboDggDNVAEqzVJOT7baRmvU2qOJ36TU/GAZG
 Ef65bWMZ6D2XxCA9/udNVijJ3ZvB2Gh4N1HlzpxyShJGBJ6NaN8t+PFI/CjW9oLsGP88Np1H+oB
 D74yR/S7EDv/ckABt6kjGPQKCuN5Z04xcGDEnufnXAsy6kvfdS/L9HCoZtzfqhtz5QyWCJaQC29
 JR8tKm6m7o38GFiUw5ARd0sSUmYz6vhVcqYMQS77Sh7cs32IjbjQlbOcY17gtFLm7NcAJTnosZf
 ZAPpHiqMNujYUuKUZJhNMr6G12GLFBhaGwbbn76mW58i6q8y24PAaCriQVkVGqO4wLMjspB1/g+
 ihTx9hzP6GJmajL9Rti02u/gk21BrKkbfd3PYUss=



On 02/09/2026 10:18, Jörg Rödel wrote:
> Hi Liam, On Wed, Sep 02, 2026 at 12: 00: 54AM +0100, Liam Merwick wrote: 
>  > Another data point. The machine I encountered this issue is a Genoa > 
> machine. I did a fresh install on a Turin and another Genoa and those > 
> do not reproduce
> 
> Hi Liam,
> 
> On Wed, Sep 02, 2026 at 12:00:54AM +0100, Liam Merwick wrote:
>> Another data point. The machine I encountered this issue is a Genoa
>> machine. I did a fresh install on a Turin and another Genoa and those
>> do not reproduce the issue - the latest SVSM branches work on those.
> 
> I pushed a fix to the svsm-v7.2 branch of
> 
> 	https://github.com/coconut-svsm/qemu
> 
> Did you test with this latest version of QEMU on the failing Genoa machine? For
> reference, the HEAD points at commit 5c1c05b2c3aa0dd1248e0cf58e401626e30887f8.
>

Yes, thanks. With this QEMU fix everything works correctly.

Regards,
Liam
