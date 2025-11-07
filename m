Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11021107.outbound.protection.outlook.com [40.107.208.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28ED30F92A;
	Fri,  7 Nov 2025 21:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762552531; cv=fail; b=OoGjKpTb+zyzEJ1/xbzXQ8c8crBf2PwWA3X7+QbnmlxybJXpFSplIccIAmZuVx4DzcdGD5/qiSUMcel0uVDinOoJv++CPhb5hv9RSjEgRdZyVQM9qP4YuFa6cxd806vKqe4fHzcha4uC/eovE4z5ngnu+n46LxkLSKcekvs+As0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762552531; c=relaxed/simple;
	bh=yjk2Z3B7yaisuOVlGQlB5T4zEyLhDwmsOBnkCM4oE/g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fTOFMXwxwjj/X4grY3EHiKm2pS+i+BfQpHUxflxRtmi1vaE+CV3UfxSbq48AwT/9Lv4Oa+nLjKHfZadiM4tX61rk8Sm3HlHhdwyqkfcfrqF4sULein61jhxK78wDsL4etrmW/VmedOZw10W3wULhmgDsdz10aK4OxlDVgGI/fXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=D48bSCcP; arc=fail smtp.client-ip=40.107.208.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="D48bSCcP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZSBEl0jW++SxF8/njuWtJHeLKon3bJs81F2+wZU1KAD30xxwQiKu6tgZ/P+YaqIu5olZePC66al0aAFLcZ82LZK/aWJRnwfgGVJcQoYXGsJA6+SWxoW7KXuN4f4bcoIYqBpi5TekDRmt0z0VecrjSFrptThXcwOW8ZIIB+csXeXWKquJKc/63zDlQcermJZe3hpOtg6eKiDbMpave8KvgybI/El6s/yf9AoFuz366cxb8A1yKbs6hMSY9Jjm5HG0vlKH7y5D0jFcPoaYzzH7SeOjjxu7eM20VPOAwarNz+U0iq8aeGCIRYB71+e2yjNUt3+FDnplvqB0IUgHGjE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjk2Z3B7yaisuOVlGQlB5T4zEyLhDwmsOBnkCM4oE/g=;
 b=OX/FoCihL2CJ9K3OwoYubmGtTfZmtCFdQ/qJ9HoH+VOLvjI8Oj9YqWYu+pcR7dTMv268h0xdMPSVyVRTxtxWJZdXbWLtz7d7lVDlcPkBdkMh5iBQYeC9Yg+eAiTeRdKq+RNKDbVbVcOyDIlcLl7L72A0vjru/JXkmsZ0zf0RF6FBoGMjcwUHu6E4yW+nwHarNDtfB+EolxLssmJrIdhbbish3kbuaqOQfhpmh88CDP/VAgFMKi1+Ty+jWldTXkUpAvBqJrGC1kMnCaD2eVd8XbBIyoTFbUeWEDYjFvDbHDIMeo9LeoaoiMbCLam9eE9Rac/o1YDyqQkQPg1bolFGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjk2Z3B7yaisuOVlGQlB5T4zEyLhDwmsOBnkCM4oE/g=;
 b=D48bSCcPvmTDoP4qCudNOo5bkpMXZkNRID9Ur6ghN3s7bNVmj4ZqfdUKME2Pyxbzkv4/3L54GIzbU94OiafXL2xhKnvJOagYuqz7ulSu/W7apg8DQVa2rKD4Uq/rdsiVb7o/LWDuX/j/i5y2rt+0RDSBtO0UD7zERHXrpccoYrw=
Received: from LV5PR21MB5210.namprd21.prod.outlook.com (2603:10b6:408:2f9::20)
 by LV5PR21MB5305.namprd21.prod.outlook.com (2603:10b6:408:306::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.8; Fri, 7 Nov
 2025 21:55:26 +0000
Received: from LV5PR21MB5210.namprd21.prod.outlook.com
 ([fe80::d42f:b201:a5ae:ab0b]) by LV5PR21MB5210.namprd21.prod.outlook.com
 ([fe80::d42f:b201:a5ae:ab0b%5]) with mapi id 15.20.9320.000; Fri, 7 Nov 2025
 21:55:26 +0000
From: Jon Lange <jlange@microsoft.com>
To: Melody Wang <huibo.wang@amd.com>, thomas.lendacky
	<thomas.lendacky@amd.com>, "coconut-svsm@lists.linux.dev"
	<coconut-svsm@lists.linux.dev>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
CC: "kraxel@redhat.com" <kraxel@redhat.com>, "Relph, Richard"
	<Richard.Relph@amd.com>, "Rodel, Jorg" <Joerg.Roedel@amd.com>
Subject: RE: [EXTERNAL] Re: SVSM draft specification (v1.01 draft #3)
Thread-Topic: [EXTERNAL] Re: SVSM draft specification (v1.01 draft #3)
Thread-Index: AQHcTrnJYyb0vchIdkakaSWJnAUj+LTlALIAgALCoxA=
Date: Fri, 7 Nov 2025 21:55:25 +0000
Message-ID:
 <LV5PR21MB5210A260C5CC8885A38A0E26CAC3A@LV5PR21MB5210.namprd21.prod.outlook.com>
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com>
 <e1ff5baa-39d5-408b-afea-79cb398f0ac4@amd.com>
 <466b9735-279d-4353-8ec7-8edc54c24986@amd.com>
 <CY8PR12MB830036BA88DD5997A707ACAB95C2A@CY8PR12MB8300.namprd12.prod.outlook.com>
 <79f2ac24-c716-4dcc-aa56-288a2539013e@amd.com>
In-Reply-To: <79f2ac24-c716-4dcc-aa56-288a2539013e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=3a209061-e3e8-438b-b75e-a26748664f31;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-11-07T21:49:28Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR21MB5210:EE_|LV5PR21MB5305:EE_
x-ms-office365-filtering-correlation-id: 029aac66-f024-457d-d699-08de1e485bc2
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZWhwOWdLWXBGY3RLMEtsSVpzNTB0cVlqLzZBSW5oVVEwNEovakVkZzRBL0FK?=
 =?utf-8?B?dDd4cngrTlNCQm9oeURFVUZZUjhOSW8vblYyN1pKVGFjd0FEUXVrMGJSS2ZN?=
 =?utf-8?B?b2pPeHRmSXN0UHljWFJsM1NmcXhNWlgxZzVPY1kzaEErTVZWQ3BWL1MyYURJ?=
 =?utf-8?B?SW5Mdjl6bUF2OU4vc1g2ZXFraWJ5a1lUakg0QytUYXlWNGZjMG1ibGxOR3hy?=
 =?utf-8?B?d0VIRllnVWtwZEtpVS8wNk0zOTI2akJoejNnejJKdWxJNmVTNlpHV04vVVJZ?=
 =?utf-8?B?K3o5NjNMNlcwS2Q4ODRGK2VOcWdpa1A2QlFVRktmdzlUNGgzSTQvVHFpWVFT?=
 =?utf-8?B?U3ZybWxNdmpTdHNKQ1VZcTA3bkdPRzJCZThVQ3ZNSEtqK2xlRGY2ZHFZaFNq?=
 =?utf-8?B?S0cyd3N5WVIzTWdPaUN2c3lweXlXd2k5Z3JQeHNxYzZvZk9JTHJIVWN0b2FN?=
 =?utf-8?B?bHJabG5TcDVaZ0RVZjdWdG96Y3lRNDlHVXNROVlCbTljUitvd2xReU1iU0Fo?=
 =?utf-8?B?WW1RM0d2RXBxbkZBR3liU0FUM0orUkhPb1FXaFpkWmRVSkpzWCtESTAwTHZu?=
 =?utf-8?B?US83c0JFQ1dVYWpLRzBnT1NYQnZ4OEozS0RtWFdYN1dwaE9BL3hCdnp2M0xh?=
 =?utf-8?B?UDlQU0ovQ3VtS1RsWnBNT2o2U0M1RUd2QXNBbnFMQ04xQm8vdFE1UWd6Ylow?=
 =?utf-8?B?ZmxOSnI4NVl0YlQvTFNIdm5sR0FYNitLeUJvMEFKclROT1YwUjNwT1RCSDJP?=
 =?utf-8?B?VFBTRmJYNjV2eHFpZUo5VlViSXNqYURqMjZEWWduUE9ZbTZmZHZONFllSXVB?=
 =?utf-8?B?czlobkdHRldHeGJZVXJtY3NPVDRZTUcwaDM5Nm0zanVITkZaUnRRT1F5VkdI?=
 =?utf-8?B?MWtxVWdPcmplWGppWkQrYVlxUzAvUkoyd3pDWlNqMHdwZytSMlJIRlZ0TThl?=
 =?utf-8?B?QTBiT01YaTJQYXFsM0k1QXJuRFJNS0tVa1h0YXVSa3hRV043L3cwSjVqeEpm?=
 =?utf-8?B?NGw4OW5oRTFjQy9iYzNmWVJPRFZXOUY3aHE5MWx4Tm1ZUG1wdS8ySUdrMm5V?=
 =?utf-8?B?TjZraHluVCtSNFhtbkRLZ1BMQVNKWXgrK2hRUFNMZi9pSjU2MTNCRE5DZGc3?=
 =?utf-8?B?YVVJckZreTBnbkZDNlorVGd5WG9IVm1JKzV0Kzc5T2kzWFBIYTRxRlVhTFNJ?=
 =?utf-8?B?SVFnRnJwcGQvZnRtK2hzRzhNRjhoRGY2cStXeCtJa0xYZ0YxVURlTnJaOFNj?=
 =?utf-8?B?djlJRmE0cVF3QzZmNjdYdHZEU3p2VW9mMk1hNEl5WkJUekIzTjNaelVHQm0z?=
 =?utf-8?B?VXlDVGF3Ykl2VHRmaFNFZ1BPMmg5ZmppUEgwNmkyRG5BT0NWYkdOSnJDbDI2?=
 =?utf-8?B?M2Jzc09SRi9nRDhVajJUdzcxeXlUQlBzRWYydzFxditUWnJBQUw1NDRqVmg1?=
 =?utf-8?B?aDBTYTZmY1c2YzEzamFvNUhiL214am95bmRiYW1IelJUZVFuakoxOEM4bDM1?=
 =?utf-8?B?ckFMaVY3YWM1bUs4MlNSWXlsVDVsT096RkgwOFhKdTZEQ2wwTmFPeVEyUVMx?=
 =?utf-8?B?Q0Y4aHpFNWs0Y0NwWlhBT1NKQTdKdlVOeEc3TU9BanBjK1VRL0VGeEVrRUMv?=
 =?utf-8?B?V1Y5KzdISEhQSDJrT3RhdEtpaitmSGx0MG5YN1pvN3IyeUowU2d2QXIvamJL?=
 =?utf-8?B?OTNrWFdwVVFKWkhlSEI3MUN3MkJQZk1UQmdweWEza1J5K21vRVJvaGo1R0ZJ?=
 =?utf-8?B?ekpaWjE5YjBKWlpCKzNFbGZoVlZJSWNnK051YzdjQy9zK3FyeHc5L2taWm43?=
 =?utf-8?B?dGtoei80NjE0d3ZBb1RLb2RnanNOZlg4N0VjYVZqck9OUkdHdXpyY3VvOU5B?=
 =?utf-8?B?MHF5cmVRRUc0M1ZpckxHR0Y3TFVWUU5BOEJCekRXMHRWQ21qVEsxOUJqUCtr?=
 =?utf-8?B?WUdtZjhFaCtiVGM0d0dLc2VBN0Vrcm1IdjV1cU1OUlFvdCtjZjEyOXJJZk1S?=
 =?utf-8?B?NEoxb0FUbUtXZDgzZkJJYWxvOER4WE53azAybDFvYkoyQVdxbS9rbU5RR0JI?=
 =?utf-8?Q?ZT3nKX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR21MB5210.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TG5lcFFMdlJlcS9EZWRGY2xxanYwU21XQWNOeVVOMHZOUVhzOW1OQms2Z25S?=
 =?utf-8?B?V1RJQUNJb3RrUDBuZCtqV0tjWUovTWRnWXYydDdhUjdOMWNjMy83V0ZTZng0?=
 =?utf-8?B?WUdjTFdCSC9YT3ZkNUZhL2cwaUx3Y1d1OGJ1ZGdLdzVyOHNuSTFFNExLaUx2?=
 =?utf-8?B?anZNbS9sMlNWR1Bhc2FrajZKeFlqYW1zelRrNW42MUpiZ0pRSVNlb0FaTlZ2?=
 =?utf-8?B?RXNvdmFWWERYRHNiRWtsd2VFazFWbnJ0MFg2MittSVhuWlJYS2tkY2JYb2dF?=
 =?utf-8?B?ekhaU3dTNkpuRFk3VzBIL2toWTBsUjdZLzdZemZweGZTN2FEU3dUakhON3My?=
 =?utf-8?B?WUVyUTBYQ0VtSzZyVEQ2bEgzN3N6cWlOUXl6UlZQUWxKLzNkdTRPT0dFTUNx?=
 =?utf-8?B?OFFjQm1od0lubG5ZSHF1YW9jc2tFZURjMFM0WEVCekhEMTcwZklIRmlucWFm?=
 =?utf-8?B?N2NrL0o3TlFoT2JGem10Z3RiT09QQ3VGVmovcnZVM3c0elB5NHNock1NeENH?=
 =?utf-8?B?ZUZCS0RHdVRTU1IyWmpzekV4WHhUMGpYbitlTjB6SXhqVHZvZTlRdWt5TjBY?=
 =?utf-8?B?eU9VNndtcFY1TEZ4R2RLYVdNUGRzb2RZci92blhWMEcwYmxsMWZNRFpvc0Fk?=
 =?utf-8?B?dDBHL1NMZHNvZFlEOWg3SW8zcW84Q3B6bkN0SWlBNHRNcDczV3BpOXN6dlhC?=
 =?utf-8?B?SE9temJGbllXWG00dWl5U3pHUzdIQjlBUzU0YktkRW5vSC9GRkc5T012cCtB?=
 =?utf-8?B?dWRoZG1lMWZkOTk5d0FDT2VHN1hzQlQyRVg1RDl0RDFZMEJ1RkZ3OEZRUG83?=
 =?utf-8?B?NFJXWUhjZDA0UkVzNDZkZFovWG5hY0R4QVgzVjdBV2FSdnRKcDJ1d1NYS0tz?=
 =?utf-8?B?bWVxdmNJQkpQWklaeGRmTVJKak9DTVJvUkM2eUIyVkFscEdyUXVNVlJaN0tQ?=
 =?utf-8?B?eUtuSWpDK1pFWGVzT2lPRmV0ZGNjZ0hGd2REeU54Sm82WEdrb1RQZHltOCtR?=
 =?utf-8?B?R1cvbjlEZnNsR25SYm9ZL09jQ2VrMHpjOEhpOVJKWDBtWHp3UG9OdDZPK1lY?=
 =?utf-8?B?UXMveHBPOWNUTG43VXFFNC9jMytwSmpnaU9uSW05bEdNamU5b09uamtXL3Nq?=
 =?utf-8?B?ZlNzMEZVMXhvbE1qMnNWZUtBR09IbDg1RDNkdnVLWXJxb1NjKzFRLytYby9n?=
 =?utf-8?B?aWVnQWhiTDhYZFBpV3ZKKzMyQ3VFQXBFSnlQSWl6alJpbmdwRXRhS09sQml2?=
 =?utf-8?B?MTdsWDBxWU5rZDJGMzk1cHNsclpLSEc0VUJRMFVVR1hkWU9udStqNm43dG9V?=
 =?utf-8?B?T2Q1R2ROaFBJTmlyS1o0ZzErdk9Ja0FTN05GRkZlOW9KOGdVdWVUMDRaWWxX?=
 =?utf-8?B?N01teEtTZDlmTFpmZW1ubXJKdUJvZU94emNMQjNTWTVXcDg3U3g5RnF1a1NL?=
 =?utf-8?B?Mi8rc3kyOE9ZNU9OTjFKaGRHMXJzdEhUODNTUkNJRVFjd2VhaHpkK0VVaXVF?=
 =?utf-8?B?ZlVSeVJmUjQ5eGJSQkRBQUpya1Q2cDFOK21relVQRSs5czR2bnZSeE85MEd6?=
 =?utf-8?B?L0tLWXdrMGFGSThMaStqRGlVZ1lUNHJ5V0ZuMmljYlV0QktaMkJBRkFabVl0?=
 =?utf-8?B?MEdkaSsxaVpBZ3N2TEVlRlA2WGNTb3UrTFZNdE9nQTlpcHlZWGZZektydDNy?=
 =?utf-8?B?QzB4bDE1dnNZMll0ZmZpNHBScXJnZ1NOUFM0NGYxNHlMc2dSMDdqcXlyR3Nw?=
 =?utf-8?B?TTVTNkkwVXlFcm0xbVpqNDVvNEY5MS9UU2hQUjdWK013Yk40UUJoV3RLUHRZ?=
 =?utf-8?B?TzU3U1dad1lVQzBmZjV6MXNOZjRjaVFkMWV5aGRzeFg0WDk3M0lyQnh4TzFF?=
 =?utf-8?B?SHVHYmxNRFNiY2pvTkYxVnoxZ3ZRZDd5VEE0TEpWcGU0Mi85bklSR0Fnb0ha?=
 =?utf-8?B?NEZHczBROXh4dUVRVGhDdFZOdSt1YWt4Tm5VRXVZcGh6Z3JFSlpkVFB1cGdC?=
 =?utf-8?B?STdkWTR0NFVSd0tHMk1DMzNhdkpoWFdNMFJNeEFjdW5IcGJqMm02dnpmL1lM?=
 =?utf-8?B?TWRHbVdKSzdPb0x0RWRKbFpMTXRQQjgzNEQyaUFmeHBCSWlJanpLNVNQdXFP?=
 =?utf-8?B?K0xlMFlmT1UyQ1piU0lmZnd3YmQ2ZUVsYnBHTGxENlpoMzc5SGpsSmNGejUw?=
 =?utf-8?Q?G64HzHtHX7kuzoJW/Ukn9ddVgHfTxhbevbkVoUcrtnDL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR21MB5210.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029aac66-f024-457d-d699-08de1e485bc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 21:55:25.8660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S08kHmsTdmE4XTGKZvL3kPqdEqWtQYunV+akTqHodbIoIHn1NbtkANND4QyZCCJE4n6splHZRwECg33aDmIB7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR21MB5305

SSBhZ3JlZSB0aGF0IHdlIHNob3VsZCByZW1vdmUgdGhlIERGUiBzaW5jZSBpdCBpcyBub3Qgc3Vw
cG9ydGVkIGluIFgyIG1vZGUuDQoNCldlIHNob3VsZCBwcm9iYWJseSBpbXBsZW1lbnQgTERSLiAg
RWFjaCBlbXVsYXRlZCBBUElDIGtub3dzIHdoYXQgaXRzIGxvZ2ljYWwgZGVzdGluYXRpb24gSUQg
aXMgKGl0IGhhcyB0byBkbyB0aGlzIHRvIGhhbmRsZSBJUElzIGNvcnJlY3RseSkgYW5kIHRoZXJl
Zm9yZSBpdCBjYW4gc3VwcGx5IHRoZSBjb3JyZWN0IHZhbHVlIG9mIExEUi4gIFRoaXMgaXMgY2Vy
dGFpbmx5IG1vcmUgc2VjdXJlIGZvciB0aGUgZ3Vlc3QgT1MgdGhhbiBoYXZpbmcgdGhlIGd1ZXN0
IE9TIHJlbHkgb24gZ2V0dGluZyB0aGUgY29ycmVjdCBJRCBmcm9tIHRoZSB1bnRydXN0ZWQgaG9z
dC4NCg0KLUpvbg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWVsb2R5IFdh
bmcgPGh1aWJvLndhbmdAYW1kLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDUsIDIw
MjUgNzo0MCBQTQ0KVG86IExlbmRhY2t5LCBUaG9tYXMgPFRob21hcy5MZW5kYWNreUBhbWQuY29t
PjsgY29jb251dC1zdnNtQGxpc3RzLmxpbnV4LmRldjsgbGludXgtY29jb0BsaXN0cy5saW51eC5k
ZXY7IEpvbiBMYW5nZSA8amxhbmdlQG1pY3Jvc29mdC5jb20+DQpDYzoga3JheGVsQHJlZGhhdC5j
b207IFJlbHBoLCBSaWNoYXJkIDxSaWNoYXJkLlJlbHBoQGFtZC5jb20+OyBSb2RlbCwgSm9yZyA8
Sm9lcmcuUm9lZGVsQGFtZC5jb20+DQpTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBTVlNNIGRyYWZ0
IHNwZWNpZmljYXRpb24gKHYxLjAxIGRyYWZ0ICMzKQ0KDQpTb3JyeSB0aGUgbGFzdCBlbWFpbCB3
YXMgbm90IHNlbnQgdG8gdGhlIG1haWxpbmcgbGlzdCwgcmVzZW5kIHRoaXMgZW1haWwgdG8gZml4
IGl0Lg0KDQpIaSBKb24sDQoNCkFzIG1lbnRpb25lZCBpbiBteSBwcmV2aW91cyB0d28gZW1haWxz
LCB0aGUgREZSIGlzIG5vIGxvbmdlciBuZWVkZWQgYW5kIGlzbuKAmXQgc3VwcG9ydGVkIGluIFgy
QVBJQy4gU2hvdWxkIHdlIHJlbW92ZSB0aGUgREZSIGZyb20gdGhlIEFsdGVybmF0ZSBJbmplY3Rp
b24gc3BlYz8NCg0KQWxzbywgdGhlIExEUiBpc27igJl0IGN1cnJlbnRseSBpbXBsZW1lbnRlZCBp
biB0aGUgU1ZTTS4gU2hvdWxkIHdlIHBsYW4gdG8gYWRkIGl0LCBvciByZW1vdmUgaXQgZnJvbSB0
aGUgc3BlYyBhcyB3ZWxsPw0KDQpUaGFua3MsDQpNZWxvZHkNCg0KT24gMTEvNS8yNSA1OjA3IFBN
LCBXYW5nLCBIdWlibyB3cm90ZToNCj4gDQo+IEhpIEpvbiwNCj4gDQo+IEFzIG1lbnRpb25lZCBp
biBteSBwcmV2aW91cyB0d28gZW1haWxzLCB0aGUgKkRGUirCoGlzIG5vIGxvbmdlciBuZWVkZWQg
DQo+IGFuZCBpc27igJl0IHN1cHBvcnRlZCBpbiAqWDJBUElDKi4gU2hvdWxkIHdlIHJlbW92ZSB0
aGUgREZSIGZyb20gdGhlIA0KPiAqQWx0ZXJuYXRlIEluamVjdGlvbirCoHNwZWM/DQo+IEFsc28s
IHRoZSAqTERSKsKgaXNu4oCZdCBjdXJyZW50bHkgaW1wbGVtZW50ZWQgaW4gdGhlICpTVlNNKi4g
U2hvdWxkIHdlIA0KPiBwbGFuIHRvIGFkZCBpdCwgb3IgcmVtb3ZlIGl0IGZyb20gdGhlIHNwZWMg
YXMgd2VsbD8NCj4gVGhhbmtzLA0KPiBNZWxvZHkNCg0KLS0NClRoYW5rcywNCk1lbG9keQ0KDQo=
