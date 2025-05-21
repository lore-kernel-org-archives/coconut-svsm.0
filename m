Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11022109.outbound.protection.outlook.com [40.93.200.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FDA70830
	for <coconut-svsm@lists.linux.dev>; Wed, 21 May 2025 16:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.200.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747845428; cv=fail; b=ADOptpKNBpOc3robBRo8IFBi14EbLrlUMvHxE67JizitM8+JoRUDCtkpsIWHm/gGkUjj4a5Lwxrdynbf7ljyXbpUH9eQ5dNcLL+nQ5ue5FDeg+zlhytEUDUVWiE9MuF3sTbmjPUMxkJ9oKlR6EEUjQz6pxXGcVbHnzsz0X11xfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747845428; c=relaxed/simple;
	bh=yzqql8R8nxytIzfhVldV6siinx0fgMWzG7AfGQ6BMFk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o2c58BOlK2jKd3gjtqHPGm7AMGIg8J1n/qL7Oen2q0Do/wct3zBTQzwjKgT9nmMv78kCoed81a/RsIOwgLAeRPk7DLEaCgZThtyq6araVKWDTNiph6UL/LFIkK2vpfZ05N+HG/v8DOYGy+SG6XGtjIJE4y1dS7mzw+JUUpmG7TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=fiD/mAzv; arc=fail smtp.client-ip=40.93.200.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="fiD/mAzv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzbywYo2/oFAaqcquu9K1y3TlSOd3WqjJSc7WBg3NRdV54XMTH0YqD1TlAzWGUF7sedW5udff+bA3x+FPSuTtEUDDI8dezkXADyAI6X+JNxcYRkSJ0RT8ac4HD6e8B0sMKcdqA+MiakeUEbqvjaUTqXI9xPXg5EN9r4wCZkiQ+SsZU/8eJT3JKL9CbeTdflfHB2qH0tW8SjYhdNyKs7xCrSaiHCriaU7vVZn5hxiBSCUpCzt+cXSANvrx57BJAILB2X/9WEEEKPOSKIpaXkeTyIcEEv6kBoDi5MOmaTWWJ3oFZS1gh2gynDtH5xVVgvyEaUsnqN6Jz8qWZqTmvPdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzqql8R8nxytIzfhVldV6siinx0fgMWzG7AfGQ6BMFk=;
 b=DavWpAHsYFQ/bYB2dmzJP+Zd5J3JNBky+MjE0TobOguRovN7qewp8W5TtWc/Md9dI7QSk6MShpsj2Jq3ZoAW4h0qsyTo/P7KLR6DlK1B1VkSzJe0rga3MAWAUYAlN1YBwXlYFP2nAj5OQ7I05P7ZxT6Ybv99TRukvv6F4B+u3RH2IgCz0F+WbB4+FzY2cvHzaCURYa504AQrRafv62ISCXW4DsKvN2AuA4KXwBfB2UgL6fTlCxTAjTsa/1M5IMhC/6iF1+TbguJMI5IfBGgxBBDHIsTnuV4/v7bFjvnO2CXA91sPXHtj+mWULjU6Ceod3h1iZrZ2ZzNtbCNiZhz3LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzqql8R8nxytIzfhVldV6siinx0fgMWzG7AfGQ6BMFk=;
 b=fiD/mAzvCEOBGzuCfhftO2qo6ElsMdbgqykz+EjkOtjVAyrNl9AXLEcM3q3TRm5OIN9l/73288Wc+R1b7glqkzmF7dtDqKpF/IuR6qsIgetfK6nZ6uQk4w9UNJx4gQkHHIpagvJnAwEvhznlpAllYb1ZtG3icg1hGcVgTMXxvtY=
Received: from SA6PR21MB4303.namprd21.prod.outlook.com (2603:10b6:806:419::17)
 by SA1PR21MB2019.namprd21.prod.outlook.com (2603:10b6:806:1b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.5; Wed, 21 May
 2025 16:37:03 +0000
Received: from SA6PR21MB4303.namprd21.prod.outlook.com
 ([fe80::e19b:11d0:630d:d6fc]) by SA6PR21MB4303.namprd21.prod.outlook.com
 ([fe80::e19b:11d0:630d:d6fc%6]) with mapi id 15.20.8769.016; Wed, 21 May 2025
 16:37:03 +0000
From: Jon Lange <jlange@microsoft.com>
To: Adam Dunlap <acdunlap@google.com>, Gerd Hoffmann <kraxel@redhat.com>
CC: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
	"svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Subject: RE: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation
Thread-Topic: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation
Thread-Index:
 AQHbyNL2fLP0DEpoMkqZQ9dnXoitdLPaG87wgAFkw4CAAC/FQIABQseAgABSjYCAAAPmEA==
Date: Wed, 21 May 2025 16:37:03 +0000
Message-ID:
 <SA6PR21MB43036655054213620D451C0BCA9EA@SA6PR21MB4303.namprd21.prod.outlook.com>
References:
 <CAMBK9=YfWzsXqhav8d8-cLtn6RKLBKY4PN2FCHwjCci1Mi-fhQ@mail.gmail.com>
 <ifj4skreud33emq6apcrmp6s4na5nmwsncrxkozaicg4xih6il@5kqf6yjt3tsy>
 <SA6PR21MB430341F8085E6F0B004B865BCA9CA@SA6PR21MB4303.namprd21.prod.outlook.com>
 <nnijlaq5y6a5fvydo4vohgjefci63puwckhcrtgi5yec3tmbql@xjuuvnjyypqi>
 <SA6PR21MB4303A1AE51FDC2CC8A83A779CA9FA@SA6PR21MB4303.namprd21.prod.outlook.com>
 <3molncndmeeajso7cuyhx3cmt36wsx3lvsqurch54htvf7ngal@6e67qqyfbtk6>
 <CAMBK9=YnAv9kGCrF3uZj+u4KdA8yDHs21Oo67sZM=G0KQJ8F-Q@mail.gmail.com>
In-Reply-To:
 <CAMBK9=YnAv9kGCrF3uZj+u4KdA8yDHs21Oo67sZM=G0KQJ8F-Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=b4f489f7-cc59-4c66-b6e9-a403b6ab9c47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-05-21T16:30:04Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA6PR21MB4303:EE_|SA1PR21MB2019:EE_
x-ms-office365-filtering-correlation-id: dac4d0ab-7c8b-403e-41a2-08dd9885b7c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1VXNE1JNzN5dzBxMjk4cWFIeFBNK0grRGJwd0tCL2Izc0xrVzY4MkQwTDcr?=
 =?utf-8?B?Y21xdDMvSG9rbUo2WmZsWUlVR3R0Z05sekY2ZUNpNGR3SEFjWmpyNjcrdkpQ?=
 =?utf-8?B?dU1PMGFHSWVaK29vWEowOUQzSDNabWk3VytkakpEanNlYzJIbS92SGV0ekM4?=
 =?utf-8?B?b0VoelFCZTZhUUFvTW1jMHZ3aUtSY1A5YUR1bUQyalI2bEVGMDlVTE9PQ2Y5?=
 =?utf-8?B?ajA1QlFEWWo2dnp0WDZObjhVeTU4SFUzVlp0cDRKV3JlbkZZVnFwUWdhcFFE?=
 =?utf-8?B?UU8rWVdaUmN5UEo0Rno4dlFkWXY2Q2ltL1F1R1AwVXhLV3hkdE5RMFZQaGR4?=
 =?utf-8?B?ZFJESVRTdXRuV2lkSGVEa1FnNS9OQlpQS1NqYitBQ0R1ajgyQ0FBNUVqREZU?=
 =?utf-8?B?OXRNUVhVTVFkSllhd0twaFJMMXhMdEVhNHA4VEZLeFVUU2tXUXhKWW9rd0xE?=
 =?utf-8?B?R3NzazB1REw4c0I4T2VlaHRRbXBOcGhXSjhRbFc5UlBVaGhOWDAwcnJyNnhu?=
 =?utf-8?B?bC85LzdldTNISjZVcFRPRW9RcjdTRStjTDhITlRkY083eW95RW9rSnNUZDZK?=
 =?utf-8?B?OXJ0cXROakpGWVBBbkwydE1EKzlBT2ovV3RHL0tmM3NaWExSdG9iTmI1Vnhq?=
 =?utf-8?B?U1dXaEV3N291VVRid1QvaTRnd3AweU1hYnJHVVV6cXk3cS9mbmJxLzEyZzQ2?=
 =?utf-8?B?cXdqVGdacWJtc0p3QUJDQ1FHc2U2MEJ6YzdFRTgrUSs1SFZXRmNUdU5rUWhU?=
 =?utf-8?B?c2RjQjNHczlxNXlJVlRONmw2OU4vMElEUmFreU9JSm54UjdoMUpzMnNhak5F?=
 =?utf-8?B?MEZXMmZRYVpFZTNLbjY5UlNrK1lnTkNBMUtIaGhNZGhSc3BwK0NKSzJoTjFz?=
 =?utf-8?B?NW1iU2tXOUNhRzdMVmNrL3F5dTNlSnF2ZnA1WmJEZVRuT3c3SnJMS05nMXpj?=
 =?utf-8?B?Qlk0NyswSTNjYWtjaGtDSzh3OXdZdjVFZmRVdmNVTnllWFRKZDRaVWlxQjBu?=
 =?utf-8?B?WFlTQWJMVFgzRmVhb0c1a0w4UUdQWjFJcTEwV0FTYXZQT3dKZysremR6YXVB?=
 =?utf-8?B?bjZhRm9kczVvVVZtQnlTaE9qU2J2cnpvWEhRN3VMdW1ydlFka1RXMkpkUTZ2?=
 =?utf-8?B?Kys1QzU2ZC9UcXRocng5OGYyM3hrdnhhVjhmbVlmODd5WEREMXpVajljWDMz?=
 =?utf-8?B?cXdwbkNQcllQWnNvVjJVb2p3eENROFl2NnE1Z1J2U2JBSlRObFVMRldEWTVj?=
 =?utf-8?B?WFNtY2dVeFlxMTVYdEQyQXZ2dmE5UDdyVTVGeDVRYnBqMUlRWjIwNmJja09y?=
 =?utf-8?B?U055RTJFTE1iSFRlUHRuek1rd0RTbFBkWGY0ZkMzR1lqU2k0TEYzanp6dUtW?=
 =?utf-8?B?dEdwWktsZWdIUEFJV3ViU2VNRVNyWGZINmNmOXQvUUMxSlcvUi9RdUw4MmlP?=
 =?utf-8?B?OW92cEpiSGhlRnpuMzRQazBuRnl3RGk3WU8ybVhRRkhYN2ZSdm93UC8wUUxZ?=
 =?utf-8?B?RmJDUjFFb0U3R1pESnJsbnNzWjQ4UnJnNTBvZUE2ZjI5N2llRXpGeGRoSWNC?=
 =?utf-8?B?TWxLQzh2RTlKYytPRTF5TlBuR0VzVkcvQloxdllmc0Eyc2NGc0Q1bDNnVnJU?=
 =?utf-8?B?Wm5KZkpVU1ZBMG5EK2N3eUVMYVU3c0lJTHNNUkU1S0FQVTAwRFI2eC8vbzJv?=
 =?utf-8?B?SXRhcHpKSW04UUprZU02SEJZSmUvY2p3TjVTb0pmUmFrZzQ0S3kyU1gxUkxn?=
 =?utf-8?B?bm5wdGJCTjFSd3Z0MERNUjIwaU1JR2pZRjBvWTI5U0tRNmpBYnFNc3Iza0V4?=
 =?utf-8?B?T1h6YUJlbjVOcnJGQkVMWk1URWlnUTJvOVY1bGRyRkVNTnJ6WUU5M0lXQ3dX?=
 =?utf-8?B?clg0QWRkZ0hUUklVNWFqeVo0ZWdVbHNTMEpidzlLVi9lVGlmcVY3eVdnTUt2?=
 =?utf-8?B?YnB0VlJiQjhsUnpFNG1EU3ZMWmRPNHk5RDFpZ0FaMy91T1RwZWN2bGFhTXpP?=
 =?utf-8?B?NU5hVHd4blV3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA6PR21MB4303.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXl6b2RCZDdDMThVRWZ2R0dLbFpSN3BDbHlpSlZOVGx2bnpaUHZsdEdZSU0x?=
 =?utf-8?B?dEw4UEhmaHJPeVE3WW9NaWdjUU9Temx1RFhVb3dCY0lwaVJ2UG5PcE5Cb0Zz?=
 =?utf-8?B?cEpMUVRWNExySVlSZER4N3REcTYrZVpDa0IzSFZWTFl5UHF5dlU3WFFVUFlN?=
 =?utf-8?B?ZURmVTc5alFHR0dmbldKVWhFeFVmb2N1bzNqT0dsMW9BclRrYytRWVNCWXY5?=
 =?utf-8?B?L3BHSFlDYWxXVjlWemhLek9VS09teU9JbUlIeFVNbTlzZVJRbmlQVjVtL0RU?=
 =?utf-8?B?b2xnTHpKM2JCb0pETDl6RlUyM1ZUT0VkcmRId2hqZy9QRWdBdkR2aEFsMFpq?=
 =?utf-8?B?eGhSOHZrVklCZFJFTmFFOXh0d2FTS1FBWjU1d0JGR2dna0w0VXFnSkcvYWU5?=
 =?utf-8?B?MWZaT1ZEQ1VrOGRtYXpLOVVqTFZPZnNoUVQ0Y0JZWWRNZFJqRmhNL2ZWelZr?=
 =?utf-8?B?b2Z4aVArRGhtN1JpNy8wZk9iTFNWdEhSdDlqYnlnaTV2NWxJUkZXMWMxdXVm?=
 =?utf-8?B?Y0RYM1lmcWRpTTZ6MDhPS0FGdEd3TEExS0JITHRHNUdQQ0R4TVRicGVodng0?=
 =?utf-8?B?VW9lUEV2THRIdFB4WDN5bHpvODdDUzNkRis2Y2tKS0tQN0t0RHJJZFlRRDNM?=
 =?utf-8?B?NTdGRXJIV205cTduU3pMbWY4b2lMN1dVbmxyTWl6V2dXYU9xNnVsbVErSXI4?=
 =?utf-8?B?cFM4bFJKRVZiaHpTdGhyWVdQSk01NTlYdXkwSUxEMHROTWN1Mm9RZjRlalFM?=
 =?utf-8?B?dzNCUWtvR0Jua2pCRVdhcnRhRXZwbi8zL21ocUZrNVpPM0tWOFJsT01KVEFh?=
 =?utf-8?B?R3NzMndKVXNEVWlvOVplUnJsRFdsdWhhUGRISWdCVWhLQjVZTmFxNlMyZ3hV?=
 =?utf-8?B?eVlYWTFiV2pvVGFUb3FFQ2JEc0NLM1ZNYXh2QlJoUmdXTkg5U041dGtJMStx?=
 =?utf-8?B?cEE4QXR3WFpuTHpxNUF0VzBoc0VBVFQrVkszN0hoV0RRTEIzNE1meExKS2Vl?=
 =?utf-8?B?ZTB2WDRqSUF4L3o2M0d4NExyUDFiVUxSQmtJZWpUUG5QT1IzMmFzaUZyR29J?=
 =?utf-8?B?R1JjR0JuM3hraGk0ZWVRVjVBa2NocHI4R0NNQnBkOUdCb0U5cmprMlUwdkpz?=
 =?utf-8?B?U1hHSXNZckFEYlg4SGl3WS9mclRraDVSMy8xN1I5b0RsZXdwd0gvbFV3SDdo?=
 =?utf-8?B?MzBxK1RuTFltbnlRNlJraXRwdWU4SzNodXdGV0p3MkRwR25GYmpzcWxGMUVG?=
 =?utf-8?B?djVabXRLVm40QzZEbjI4VVVETDJGbmlWN0RKL2JqNVN3R3JhU2xuR1JLbWIw?=
 =?utf-8?B?ZkxXVEU0NjBHMHl0UUhmRlp5WFc4c2d2ZG5lNmc5d3NJcm45ZnZuczFzL0pp?=
 =?utf-8?B?QU1aUnN5QWx2RmFJb2tPVkpVOTYzYWhwSjQ4bU53SVFyTzVIb29pS0JYYks1?=
 =?utf-8?B?VXlhWlQ1azJYb3Joc1ZXdnZaTERVanNldzFwemRLRUtkWUhRMi9PV1ZFb2xQ?=
 =?utf-8?B?YUNUdlFhR2tqazJyS2dHblJGOURnRVZ1VkZ3ZU9lR2s5eHQvVHRyd2tZUi8z?=
 =?utf-8?B?ZmxEdW5TaXJvZ05wUzBaUmlEOUVJM0dRUXBCS0dhanIyTFF0U013Mmt2a2Nr?=
 =?utf-8?B?b081VW9IdDkyQmwvUWVKengzbU1OWWVRMlYvN2RQN0RBazQ1RWlRREdnL1g4?=
 =?utf-8?B?bEg2VGt5RTE0aUVTbERDVnB2ZVpqWTk0VVpyck1Cb2RYWi9XVFRqQXNrM2hI?=
 =?utf-8?B?YS91QmZPUGp1azZHVEJTQnNRRVVITUlPcjl1NE94Ujh6QjJaeSt3QjBaTVg0?=
 =?utf-8?B?V1JZRGdoMlBQZzJpanNmUlFmUXh0eWJkMkZKa29tOWd6QnpJellOVStCNVlX?=
 =?utf-8?B?cFI2cW9DMVJuV3BZQ0VtYThGWFdTSEhVdGxTdk1uNm80L3gySmY5dnR5WDhl?=
 =?utf-8?B?b3NzTHBhaU1JcjFvdCtaZ01scFgxZWVuRWVGN0dPSWVBNGowbk5iZzVhYWdP?=
 =?utf-8?B?S2RIQmdmWXc3UWFzcm9keHpGZldvaWx5ZTJaQUVTM2FjUW5jcUR5NmkrU0Jw?=
 =?utf-8?B?NUxJMUtUTlkwdmlaVDAyQzMvelFydmxyZWkyRDdZUU83Z2w3SkFyb2trMXcz?=
 =?utf-8?B?YzRobEVHTTFWNTNYR0V4aG9rNkxHdVlKaXcvb0J1RWpvMzVOUndlQmFSOG5C?=
 =?utf-8?Q?oEnF4cXGqlKi5lF3up5ksqpIGZREsH5AeKvyOPQlgZZn?=
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
X-MS-Exchange-CrossTenant-AuthSource: SA6PR21MB4303.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac4d0ab-7c8b-403e-41a2-08dd9885b7c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 16:37:03.7120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EczHrAO9ANinKLTwXQB38S/oOghGLRbwjBAaHeus2vW+QO5U4HFmuqtb0rLeRs1YnfEeWd9UsQTWmQUOWFHHeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR21MB2019

QWRhbSB3cm90ZToNCg0KPiBJZiB0aGUgZ3Vlc3QgYWNjZXNzZXMgYSBHUEEgd2l0aCB0aGUgYy1i
aXQgZGlzYWJsZWQsIHRoZW4gS1ZNIHdpbGwgcm1wdXBkYXRlIHRoYXQgcGFnZSB0byBzaGFyZWQu
DQo+IElmIHRoZSBndWVzdCB0aGVuIGFjY2Vzc2VzIHRoZSBzYW1lIEdQQSB3aXRoIHRoZSBjLWJp
dCBlbmFibGVkLCB0aGVuIEtWTSB3aWxsIHJtcHVwZGF0ZSBpdCBiYWNrIHRvDQo+IHByaXZhdGUs
IGJ1dCBpdCB3aWxsIGJlIHVuYWNjZXB0ZWQgYW5kIHRodXMgZ2l2ZSB0aGUgMHg0MDQgZXJyb3Iu
IEkndmUgc2VlbiB0aGlzIGhhcHBlbiB3aGlsZSBpbnZlc3RpZ2F0aW5nDQo+IHNldmVyYWwgZGlm
ZmVyZW50IGJ1Z3MuDQoNClRoaXMgaXMgYSBjb21wZWxsaW5nIHRoZW9yeS4gIElmIHRoZSBPVk1G
IG1hcHBpbmcgb2YgdGhlIENBQSBwYWdlIGRvZXMgbm90IHNldCB0aGUgQy1iaXQsIHRoZW4gdGhp
cyB3b3VsZCByZXN1bHQgaW4gZXhhY3RseSB0aGUgYmVoYXZpb3IgdGhhdCB3ZSBhcmUgc2VlaW5n
LCBiZWNhdXNlIHRoZSBPVk1GIGFjY2VzcyB3b3VsZCBjYXVzZSB0aGUgcGFnZSB0byBmbGlwIHRv
IHNoYXJlZCwgYW5kIHRoZSBuZXh0IFNWU00gYWNjZXNzIHdvdWxkIGNhdXNlIHRoZSBwYWdlIHRv
IGZsaXAgdG8gcHJpdmF0ZSBidXQgdW52YWxpZGF0ZWQsIGxlYWRpbmcgdG8gdGhlIDB4NDA0IGVy
cm9yLiAgR2VyZCwgY2FuIHlvdSBjaGVjayB0aGUgT1ZNRiBtYXBwaW5nIG9mIHRoZSBDQUEgcGFn
ZSB0byBlbnN1cmUgaXQgaGFzIHRoZSBDLWJpdCBzZXQ/DQoNCi1Kb24NCg0K
