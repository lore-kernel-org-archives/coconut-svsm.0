Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022121.outbound.protection.outlook.com [40.93.195.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AAE26E165
	for <coconut-svsm@lists.linux.dev>; Fri, 16 Jan 2026 16:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580523; cv=fail; b=bWhAlwOskqu2UUSBqM64w764RmKpacsmgtLAwSd7m8FpbYlQserGzgjoaff2KCNajwQ0AYS1T2AV6APkPGZ5zpBV/sjhHaDmDh3U7EJceTfndDUd0m1nuT/yJ91Je5cZEZzOLX9XZL5/tsXJest1oVHfCBXuQkydVjUOSGrkp00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580523; c=relaxed/simple;
	bh=aYhXFVlbotR8GgZ33KdrVryEZ3iyvtCtIwMGvuVavMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fdqYDhIKs7B6LDodYy+exm370IyJjX6tsvUG/YmpuSrDZynrndvAocxJS7ANk7uWfHBJkR0dtkmCWyhCrJJFe1hGg1G2bmzFOuAYpvBkss7HnN0L3qo6BRtyTEmg4s6FB9/+QrSt00CYMjwBcOpG4w3KOl3vsiMQg/Xy5glKIfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=g+54rIgp; arc=fail smtp.client-ip=40.93.195.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="g+54rIgp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqTz7SJ59dtC8eIgJE9wJF7eePKTMVJtWl4jNKizWkyd7INBjCbhB6cRi9cw2KvhJUMEJxRzVw06S1py4mP83yIuOmzUdzPlTOqUUVVF2q9uhmK+1iCg7l48S3U7JtsYePDzj2Rp/I0A6Q/vfRjNZv6IahAJAm1nNr+qClfT5GDiV4/pKWxtrs9fi3zsEEZu4a6IcMdopLVtDVW1+La2UkLwYSkiSU8IlqILQK6spqWHqwakxJJc7GZY6QSVq7SSqI9Wze36tBjSeJCJe8EWj9pU+Lyr5gezWYXTp9uG39O/ElX1p44OynCy6ulIYxb2NwyqDvK1p11xgU9IIFb/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYhXFVlbotR8GgZ33KdrVryEZ3iyvtCtIwMGvuVavMk=;
 b=StKqBgNBcOXwLFSiu9TEo1fBXOJgZHPRgeEPbl8Ys30YESpxt8QDAUS9MANHuZoFGy78WgabKvDjJcbY49fBKhDLicbPxvM8WlVWxnBQJ0PFAU82NUhrGHtkoRsys5qEdrwGx0E+QKdaLeiFq6haavkPKoIV+AMR8Qex+QueeCR1faWrWSM1B97Uzf2inWUO9g5eCsFX4mv7+7YSngYcwYPgWo53gog7f28vbT5UPZt69NyqImDVwk9vM/jO3g00VxyACSmfP0nBEvuTrwx7LZDxqw3/ghK5dH0WJS0qYJ0ygvw23Tn7tvgSNHEO1yKosaQmDahFV7XMKwvHze15bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYhXFVlbotR8GgZ33KdrVryEZ3iyvtCtIwMGvuVavMk=;
 b=g+54rIgpd+3I9atZ1fQjIPjMpYIua3GuZVsXtTKyC4Dj2dBjHPQgLE95hTRaA6xcKq1cYW2W+pD1zncvs0mzQPk0fjxtzvwJkadUXmyl8Umue555yDgRnAFSYoRamL+IbyRUTWDTQy0a5tRiGVSgT837q1GukGqp5mhmFYG1jto=
Received: from CH8PR21MB5222.namprd21.prod.outlook.com (2603:10b6:610:262::21)
 by CH3PR21MB4645.namprd21.prod.outlook.com (2603:10b6:610:26a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.4; Fri, 16 Jan
 2026 16:21:58 +0000
Received: from CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d]) by CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d%5]) with mapi id 15.20.9542.003; Fri, 16 Jan 2026
 16:21:57 +0000
From: Jon Lange <jlange@microsoft.com>
To: =?utf-8?B?Q2FybG9zIEzDs3Bleg==?= <clopez@suse.de>, Oliver Steffen
	<osteffen@redhat.com>, "coconut-svsm@lists.linux.dev"
	<coconut-svsm@lists.linux.dev>
CC: Joerg Roedel <joerg.roedel@amd.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Luigi Leonardi <leonardi@redhat.com>
Subject: RE: [EXTERNAL] Re: KVM planes branches
Thread-Topic: [EXTERNAL] Re: KVM planes branches
Thread-Index: AQHchvHILeNMmtysHkG2eQTSFHs65rVU+DYA
Date: Fri, 16 Jan 2026 16:21:57 +0000
Message-ID:
 <CH8PR21MB5222CE1C15254477E5B7DF94CA8DA@CH8PR21MB5222.namprd21.prod.outlook.com>
References:
 <CA+bRGFrHnTCTYAR0UjG2vC+AtrJAU2Uy8G_MzVZfOELh11dxsg@mail.gmail.com>
 <ca7e4568-5058-4474-9aa6-c2866dc4d6f5@suse.de>
In-Reply-To: <ca7e4568-5058-4474-9aa6-c2866dc4d6f5@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=b452bf78-ea49-40ba-ac69-97c552b5e6a7;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-01-16T16:13:28Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR21MB5222:EE_|CH3PR21MB4645:EE_
x-ms-office365-filtering-correlation-id: d790e0a3-83d1-4029-229f-08de551b5eef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dTN5U0lWWFFFdTF0RC82eEEvNTdZZzRyQUdURlIvWGxwWjZ4clVReEVqZGRE?=
 =?utf-8?B?aGZBakhYOWF3VVE4YTB0MnBvZ1dlYmVTNmlyK3NHSnV5M0FZcTFQS1BpeTkv?=
 =?utf-8?B?NHcvTGwxMzRuakRTakp0NERMb0UyeU5BY0dLc2gwUm9TV0RGOUxTd1M2Y2k1?=
 =?utf-8?B?OHF3S2JGVUVkL3FENEUrUHFpNWRpMW92eEpUYzJuaEcrY0I4amhqYVlrRjY1?=
 =?utf-8?B?aWVvWHMvY3A0T0pOMk83cTI4ZnFsOUpaMG5TcktqdWlkQ3RiWDlhMHNoMXA1?=
 =?utf-8?B?eVZITHExNGdsUDN2Wk1zTkE2Y3NsdUxZSDAxQ0Z1VlNJZEg1M2Z6Z1JJR054?=
 =?utf-8?B?RVFQdUFWMEYxSjhXV1JNZlhCOHI5aWpQUnp5NlFWRlNraDd6OFVTeWE5Nk5s?=
 =?utf-8?B?aDlCMmJVK3JCbHRYWGFuNS94WjczcVU3SjE2TlhORFBMUnNRWkpyZlo5SlFh?=
 =?utf-8?B?LzdZZlVKa1FubXZYTmxpeEE0eGRxTzRKWjBBYkZHOXphNlpqTVgzWFpvOHZX?=
 =?utf-8?B?NytOZWhNcVlDRHU1UGR6M1JRc0V2dUM0MWpnSExicXExTStvQVRPQWlielFB?=
 =?utf-8?B?bThyenZBeXhHcFBtZUc0d05NY3llanl5cVNJcjF1Mk92VmkrcXJsU1B1dWVM?=
 =?utf-8?B?cFN6UWR6a0ZHZE1jaklZZnRXbkVyZHJjSEVuN0hnS1psOUdMVGc0akJaYnZJ?=
 =?utf-8?B?WHQ5REtlTHJubWNrNFJuc253UDRHdUpzbGJ2TVNSemIwYk1Ld0Z3MXE5cnV3?=
 =?utf-8?B?TENOaEdMdGlhQjJ3MHJqRzU4dnVCN0ZQdWJwR1N1dE9qeFprS0Z6MHNUbS9G?=
 =?utf-8?B?bEh2Ui95VkhQM3B2cGJRMTRWYythNEpaVGxJOTNZNUMzSHdnWWdYMVUxZDEv?=
 =?utf-8?B?dHNsaW5CRWFRMXlwSmZXQnB1ejgzaWZRUmdIN1JvWWlzSHE3WE54d1FlUi90?=
 =?utf-8?B?czNONjlFMEdYTytZYjJIR2dDR3p1Wkhwb1VqRCtqUS80aWZ0clpwTTdXcmNM?=
 =?utf-8?B?YWVvQUQ4V1hzeU93WnV0S1hpN1dnUkxzWTIwK3dXemRtL2lhS0JuWkNYZEs0?=
 =?utf-8?B?WTFVQWU4cnk0Ykd0bUhPL25IYmtnVFNVY0lyYXYyR1psa1dNZ2wxRzRJZnN5?=
 =?utf-8?B?YmZGRjZCWHVQV0pEVjZKZ1l6Z1BxQktsZjJiQmZUQ2ZaTkhNb3lvMVloSlZN?=
 =?utf-8?B?bjEwMitCWkh6bkFuL00rVWk1VmpqZTBBTEJSOGlyNW91MnpBbE04QTdrdGdN?=
 =?utf-8?B?VmJwM2lqdG1HTEh5ODVhRVExTHlIOVQ1dURCRW45NGRDQzlERTlYUFJSZlkx?=
 =?utf-8?B?ZHpjdWxLNFoxbkpxc3Bocm83djJuTGFpbC9mLzdjQ0NUU1F2MTBhQjhZRjlB?=
 =?utf-8?B?eFZjZ2FYbExvekJrRHBzeURTcXFOWlRrV1Vmc2Rtb0dqbWRYLzhuR0lXY1Nj?=
 =?utf-8?B?M0N6SnFlczlvYmhoSE1ObmF0cm9IU1BuaGZGSVFIOHJlZ0ZpUjhyQk9iMklE?=
 =?utf-8?B?NWF0dUpEelQ1QmVQMUlJdzQ2YVFIYTZvWXRTSTJ4NmdlMnRWQ0pJRUIyZDhM?=
 =?utf-8?B?eFZmUUhtbEkyLy93dDVSU250bFhjNG5Va1I1R2RpQUlPb0owa3lwTk1RNzZQ?=
 =?utf-8?B?Y3p2VWk4RlJIclpRQ0p2N0NnT2lOcXZXTjVJeW9QZHl2RlBJMEsrbzVrS09v?=
 =?utf-8?B?dDFvWTE4eDN4eFkvRm1PamFEaDFrTUx4OFFzTGNRSFNvZ1RUa2I4ZmRVcGtt?=
 =?utf-8?B?ck04a0dLSCtsbGhBT1JqTnp5ZzFNMmxhSE1MTTVQelUvY09TZW14OEF3Q2Fh?=
 =?utf-8?B?R3BENWtLLzlJUXBLck5HR2pGNHBYejVibldKNUVmUTNFNHErZ2lGSllwODJJ?=
 =?utf-8?B?Rno1NUQrVFVjaWlnT2pIYTlsVllEd29VWDBlY0MzTUQvREN4RnltcCtSNmxL?=
 =?utf-8?B?Z3lnL3p2THFCa2tYTkN1TVhlVi9zeFJFYm1RclJ6QnpiYzFCY2lRTk1YMTMr?=
 =?utf-8?B?NktHeUl2ckZORnVLeDFucGNNRnhxK0Z4S0YxYnEyMVFEN044N2RCUlMrNVZI?=
 =?utf-8?B?OVBKWnRCYi8wb21mMTZDbGpZdFdKWGpBV2MydkhxN1hYVW1xZE5WenFwcDN2?=
 =?utf-8?B?R29BdHpXNERHcm5scDZsaDJRVzFRRlVaVWMvam03UGxKNGs0MHhSK1BTREtC?=
 =?utf-8?Q?C8cNjz/1zbO+7YfeFMXQBNc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR21MB5222.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzhNNG9sTklkLzBFN09ZOEoxdzNmbGt3T1VLb2RwVHhDVG1YVjZUWkNZSUF3?=
 =?utf-8?B?TjNPMlZHQlFWKzh0UlhKalZ6Vmt0SlFYWFFHb3hiajJBaWc5MEJwOGc3RDEw?=
 =?utf-8?B?RW1QUHN4djlNZEk5U1hZY0tRdURnazhMU0tmVDdKaUVUVXM5cEZZZi9nTDJ2?=
 =?utf-8?B?M1FhVmFUWEZyVXZ6YTQwMmdMMnpncnpockNzZnBPelZGRkh6VjFWRXVxK2NU?=
 =?utf-8?B?SjdFN29USVpEaVVIYnA1c1Qzbk1lSG5LMk1mWFRsRExiYUF0K0V4VUtzdll5?=
 =?utf-8?B?UUdrdTRpR2hwckhVMU0zdVZzQmRONHd0RVY4cHoxT3RIU2xiQ1NUY2hIM1RP?=
 =?utf-8?B?S0pUTEc3bGtnTXYzcHdpSGdmRXJqYjdpNUxYMUNzclR2N0JaeVV3Zk9jWUl5?=
 =?utf-8?B?SW52TG9ELzNhcUU1L1lsNjFESThINHdDaXZITDBTdmZ0ckxBR3RwQWU4Y0p5?=
 =?utf-8?B?YnNYV1VvNm80R0FVTTNYNGFWSlRqMTJYZ3NzUWxSRFZQWEkrR1pQbjlPSnpH?=
 =?utf-8?B?QWROd1BpaC9LTjJjNTNScWl3MFhhbjlFdnZoZ0JZTnlQRWRUS0lWK0pEaDZG?=
 =?utf-8?B?L2xGUVhxY25taVFKdWJVUTFiOUFwV0NwM0gveTdnckxoRCszYmg4d3E4WmNG?=
 =?utf-8?B?WnZPb2xncm5ocFZ4NHZBS0p6ekl4b3RUVG5RWmlveW10OGE4LzE1WUlvdldJ?=
 =?utf-8?B?SFBicXRlNXBrNjJ6REU3a3N3UVhybmNvMkZYeXJzQ1REMElGcHNvTjcwYWlF?=
 =?utf-8?B?dDByeVlRZEVBbTVFNDViMEVDT0FwcU1Zakc4MHNKd3JCcmkrSlpRYnRTMEZI?=
 =?utf-8?B?OUEzeHVCTzBIdVlzaHMrOFM0YjM4L1hSNHRVSmJCbGNNTnZJdE45amhHcHdq?=
 =?utf-8?B?UzFoMnBialEwNjYrS2lmREEvSlNuRXROU0RxNkNTKzhrbG0zc1poeS9Qa1Jp?=
 =?utf-8?B?cEhhS1hLRWo5T2pGOXAyVTRSVkJEcmJob1d6Sk5JU3VxUUt0OHFaUUVwajhD?=
 =?utf-8?B?VlNqNEtSblVIeVZOY2x2Wm10S0E4Rytuelc3NW5UVDNWVS9ZRTFpZE5VWE5X?=
 =?utf-8?B?czh0YlJISjAybW1obEhESkpvcVlGcTc3S3FhVHE3TG16aWN3U0dJUW9LSmh5?=
 =?utf-8?B?ai9iRVdpT0JtNHJPVUlBQ2FaWUk0QWJZT2VRdGpRSG9rdFB2U0svY0VlbUlT?=
 =?utf-8?B?NVZXTXJzZk9HTWxSRWdYSDJzRHN0WnZVSXZoQklvQlhRbnphWHRIb1plOENi?=
 =?utf-8?B?aW9IQ0EvMkJPdForS1AxeC9aMEcwNVFTcWRjTWp6R2RrZVF3UjdCKzlGcHE4?=
 =?utf-8?B?eHpQV2ZXSGxqa2paQ29MbkFldnhVNUlsOHJIM1BnSG1PS1Jjc2ljTUdhS01S?=
 =?utf-8?B?OGlDVCt5eGhxMS8vTmVjS0lUSkx5UHZvbEJNYUJEVmhOWGJ5MzQ4OFlLUWlj?=
 =?utf-8?B?akRvWlFDSHFCMnRhZCtIZzZFM28wZWxnWWtQUFNCZUNja0hHeWRCdWZ1cGJh?=
 =?utf-8?B?Tnh1MHNLenF2ZlNmTzlwTjIyNGdaTFhwc0ZkSHpoWkJ0Q080cnVYeVNQUkVz?=
 =?utf-8?B?TTBnMjFWMk1VcXVTeGo0Tm5UNi9HK0VFSFlHTys4bVFQSUFSblRjSlhob05m?=
 =?utf-8?B?YWdob0JaWUd6eUpkbXlpTEhXUENXTGl4czVNQTdBZXhJTzhNSHZMMHhsU2Zs?=
 =?utf-8?B?RWF5eXZ4TjNVbUpTRm5CTzhKa3cvVW5BZmdsU3ZhbUZvTTA5SHkvMVdiQ3Fy?=
 =?utf-8?B?MmpkOC9razllem9FeEJlVkZBeE8yZzNTR1UzaW5CL0RQd3ZjN1BYVXNJd1Q2?=
 =?utf-8?B?VmEydVFuMTB1WDdrdjhSM3ZoUGpGTnhGMlpYYTVJTTluLzVIL3ZCVUZTS1Jl?=
 =?utf-8?B?Q3lJRnJ6dTd6NVVFVmFlak9jYXFVbzZ6V3JQQUF6N1h4bGNTakI0WGpKeVNs?=
 =?utf-8?B?djhmY3Mzd2ZNbWcwa0t5eW1SMVIyQXFnbzJtUm9DRGN1SDB6bzB5bS9FVFlr?=
 =?utf-8?B?bHlMRWIvQUVaN3Y2Ymd3OFM3dkQxbElraWs1WHg1QWxNaHpPTkIyKzRRQklH?=
 =?utf-8?B?b1F5ZHFaZGl2SE1VcGtBNXFtWFVCNFg5K0dwUmhMYm5JZnZhMy9CekN0Tmpy?=
 =?utf-8?B?UHVMbmpEcXZvUS9LaTcyNGh2L3hsTjFjT1JKOHNUOGozeGdjSUJyQWpidXIr?=
 =?utf-8?B?Z2x6UHM0RTdxTGlmQUQ3WDEyamROVHhEZWJZeUZvRjlQOFZzRCtoWlRzQ2RZ?=
 =?utf-8?B?Z1UyWks0dytoU3MwMEhSU1hoVC81YXNibTNxL25FelFqbVJXNDREby9vRFYx?=
 =?utf-8?B?WmhwVlJxSWxWeTBRUE90Wm0wSm4yZkw3NUZsRWRMS1ZvQytGTm9MUzN0d0tZ?=
 =?utf-8?Q?qls7YScywXNWFG2X6jISnx8E2kGwv7BoMphg+h7P9M7t4?=
x-ms-exchange-antispam-messagedata-1: 09spx4nHru+NEQ==
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
X-MS-Exchange-CrossTenant-AuthSource: CH8PR21MB5222.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d790e0a3-83d1-4029-229f-08de551b5eef
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 16:21:57.7854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 82e/tcK6Y2Xp6nDlr3JX3O3rF9Fmweq9rpCfOmwqDabxjCyme3WDqdUTLOOPZC1CdyS6eymSd4hlURHoNJGz2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR21MB4645

Q2FybG9zIHdyb3RlOg0KDQo+IFRoaXMgaXMgZHVlIHRvIDUzOTYyNDI3MWNiOCAoInNldjogcmVx
dWlyZSB0aGUgZGVidWcgcmVnaXN0ZXIgdmlydHVhbGl6YXRpb24gZmVhdHVyZSIpDQo+IGluIHRo
ZSBTVlNNLCBhcyB0aGUgU0VWIGZlYXR1cmVzIGZvciB0aGUgZ3Vlc3QgVk1TQSBkbyBub3QgbWF0
Y2ggdGhvc2Ugb2YgdGhlIFZNUEwwDQo+IFZNU0EsIGFuZCB0aGUgY3VycmVudCBLVk0gcGxhbmVz
IGltcGxlbWVudGF0aW9uIHJlamVjdHMgaXQ6DQoNCkluIHRoZSBmdXR1cmUsIEtWTSBpcyBnb2lu
ZyB0byBoYXZlIHRvIGFjY2VwdCBkaWZmZXJlbnQgZmVhdHVyZXMgaW4gbG93ZXIgVk1QTHMsIG9y
IGVsc2UgaXQgd2lsbCBiZSBpbXBvc3NpYmxlIHRvIGVuYWJsZSBmZWF0dXJlcyBsaWtlIGFsdGVy
bmF0ZSBpbmplY3Rpb24gb3IgUkVGTEVDVF9WQyAoc2luY2UgdGhvc2UgZmVhdHVyZXMgY2FuIG5l
dmVyIGJlIGVuYWJsZWQgZm9yIFZNUEwgMCkuICBUaGUgYmVzdCBkaXJlY3Rpb24gd2lsbCBiZSB0
byBlbGltaW5hdGUgYW55IGFzc3VtcHRpb25zIGFib3V0IGNyb3NzLVZNUEwgZmVhdHVyZSBjb25z
aXN0ZW5jeS4NCg0KPiBOb3Qgc3VyZSBpZiB0aGUgYmVzdCBhcHByb2FjaCBpcyB0byBzcGVjaWFs
LWNhc2UgZGVidWcgc3dhcCwgb3IgdG8gc2ltcGx5DQo+IGFsbG93IGxvd2VyIFZNUEwgVk1TQXMg
dG8gaGF2ZSBhIHN1YnNldCBvZiB0aGUgZmVhdHVyZXMgb2YgdGhlIFZNUEwgMCBWTVNBLg0KDQpB
bnl0aGluZyB3ZSBkbyBpbiB0aGUgc2hvcnQgdGVybSB3aWxsIGJlIGEgaGFjaywgc28gcGlja2lu
ZyBhIGhhY2sgdGhhdCBpcyBzaW1wbGVzdCBmb3IgS1ZNIGlzIHByb2JhYmx5IGdvaW5nIHRvIGJl
IHRoZSBtb3N0IGV4cGVkaWVudCBhcHByb2FjaC4gIFRoZSBmYWN0IGlzIHRoYXQgS1ZNIGhhcyBu
byB2aXNpYmlsaXR5IGF0IGFsbCBpbnRvIHRoZSBzZXQgb2YgZmVhdHVyZXMgc2VsZWN0ZWQgYnkg
dGhlIGd1ZXN0IFZNU0EgYmVjYXVzZSBndWVzdCBWTVNBcyBhcmUgd2l0aGluIHRoZSBndWVzdCBw
cml2YXRlIGFkZHJlc3Mgc3BhY2UuICBUaGUgb25seSB0aGluZyBLVk0gY2FuIGxlYXJuIGFib3V0
IHRoZSBndWVzdCBWTVNBIGlzIHdoYXRldmVyIGZlYXR1cmUgZmxhZ3MgYXJlIHBhc3NlZCBhcyBw
YXJ0IG9mIHRoZSBBUF9DUkVBVEUgR0hDQiBjYWxsLiAgVGhlIFNWU00gY2FuIHNpbXBseSBsaWUg
YnkgaW5jbHVkaW5nIHRoZSBkZWJ1ZyBzd2FwIGZsYWcgaW4gdGhlIGZlYXR1cmVzIGl0IHBhc3Nl
cyBhcyBhIHBhcnQgb2YgdGhpcyBHSENCIGNhbGwuDQoNCk9mIGNvdXJzZSwgdGhpcyBhc3N1bWVz
IHRoYXQgS1ZNL1FFTVUgYXJlIHdpbGxpbmcgdG8gaGFuZGxlIHRoZSAic2V0IERSIiBHSENCIGNh
bGxzIHRoYXQgd2lsbCBiZSBpc3N1ZWQgYnkgdGhlIGxvd2VyIFZNUEwgZXZlbiBpZiBkZWJ1ZyBz
d2FwIGlzIHNwZWNpZmllZCBhcyBhIGZlYXR1cmUgb2YgdGhlIGxvd2VyIFZNUEwuICBJJ20gZ3Vl
c3NpbmcgdGhhdCBLVk0gZG9lc24ndCBnYXRlIGl0cyBzdXBwb3J0IGZvciBEUiB3cml0ZXMgYmFz
ZWQgb24gdGhlIFNFViBmZWF0dXJlcyBpdCB0aGlua3MgYXJlIHByZXNlbnQsIGJ1dCBJIGNhbid0
IHNheSBmb3Igc3VyZS4gIElmIEtWTSBlc3NlbnRpYWxseSBpZ25vcmVzIHRoYXQgU0VWIGZlYXR1
cmUgYml0IG91dHNpZGUgb2YgdGhlIGNyb3NzLVZNUEwgY29tcGFyaXNvbiwgdGhlbiBseWluZyBp
biB0aGUgQVBfQ1JFQVRFIEdIQ0IgY2FsbCBpcyBiZXN0LiAgSWYgS1ZNIG9ic2VydmVzIHRoYXQg
Yml0IHRvIGNvbnRyb2wgR0hDQiBiZWhhdmlvciwgdGhlbiBJIHRoaW5rIHdlJ2xsIGJlIGZvcmNl
ZCB0byBjaGFuZ2UgS1ZNIHRvIGV4Y2x1ZGUgdGhhdCBiaXQgaW4gdGhlIGNyb3NzLVZNUEwgY29t
cGFyaXNvbi4NCg0KLUpvbg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2Fy
bG9zIEzDs3BleiA8Y2xvcGV6QHN1c2UuZGU+IA0KU2VudDogRnJpZGF5LCBKYW51YXJ5IDE2LCAy
MDI2IDY6MDUgQU0NClRvOiBPbGl2ZXIgU3RlZmZlbiA8b3N0ZWZmZW5AcmVkaGF0LmNvbT47IGNv
Y29udXQtc3ZzbUBsaXN0cy5saW51eC5kZXYNCkNjOiBKb2VyZyBSb2VkZWwgPGpvZXJnLnJvZWRl
bEBhbWQuY29tPjsgU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPjsgTHVp
Z2kgTGVvbmFyZGkgPGxlb25hcmRpQHJlZGhhdC5jb20+DQpTdWJqZWN0OiBbRVhURVJOQUxdIFJl
OiBLVk0gcGxhbmVzIGJyYW5jaGVzDQoNCkhpLA0KDQpPbiAxLzcvMjYgMzowMiBQTSwgT2xpdmVy
IFN0ZWZmZW4gd3JvdGU6DQo+IEhpIGV2ZXJ5b25lLA0KPiBoYXBweSBuZXcgeWVhciENCj4gDQo+
IEkgYW0gY3VyaW91cyBhYm91dCB0aGUgc3RhdGUgb2YgdGhlIEtWTSBwbGFuZXMgZWZmb3J0IGFu
ZCB3YW50IHRvIA0KPiBleHBlcmltZW50IHdpdGggaXQgYSBiaXQuDQo+IEkgdHJpZWQgb3V0IHRo
ZSBLVk0gcGxhbmVzIGJyYW5jaGVzIHdlIGhhdmUgaW4gb3VyIEdpdEh1YiBvcmcuDQo+IEkgYnVp
bHQgUWVtdSBhbmQgdGhlIGhvc3Qga2VybmVsIGZyb20gdGhlcmUgYW5kIEkgYW0gYWJsZSB0byBs
YXVuY2ggDQo+IHRoZSBjdXJyZW50IFNWU00gd2l0aCB0aGF0LiBRRU1VIGp1c3QgbmVlZGVkIHRo
ZSBwYXRjaCBmb3IgTUFEVC12aWEtSUdWTS4NCj4gQnV0IHRoZSBPVk1GIGRvZXMgbm90IHNlZW0g
dG8gc3RhcnQuIEFsbCBJIHNlZSBpcw0KPiANCj4gLi4uDQo+IFtTVlNNXSBWVFBNOiBUUE0gMi4w
IFJlZmVyZW5jZSBJbXBsZW1lbnRhdGlvbiBpbml0aWFsaXplZCBbU1ZTTV0gW0NQVSANCj4gMF0g
VmlydHVhbCBtZW1vcnkgcGFnZXMgdXNlZDogMCAqIDRLLCAwICogMk0gW1NWU01dIFZNU0EgUEE6
IA0KPiAweDgwMDBmNDkwMDAgW1NWU01dIExhdW5jaGluZyBGaXJtd2FyZSBbaW5pdF0gQ09DT05V
VC1TVlNNIGluaXQgDQo+IHByb2Nlc3Mgc3RhcnRpbmcgW1NWU01dIFRlcm1pbmF0aW5nIHRhc2sg
aW5pdCwgZXhpdF9jb2RlIDAgW1NWU01dIA0KPiBMYXVuY2hpbmcgcmVxdWVzdC1wcm9jZXNzaW5n
IHRhc2sgb24gQ1BVIDEgW1NWU01dIExhdW5jaGluZyANCj4gcmVxdWVzdC1wcm9jZXNzaW5nIHRh
c2sgb24gQ1BVIDIgW1NWU01dIExhdW5jaGluZyByZXF1ZXN0LXByb2Nlc3NpbmcgDQo+IHRhc2sg
b24gQ1BVIDAgW1NWU01dIExhdW5jaGluZyByZXF1ZXN0LXByb2Nlc3NpbmcgdGFzayBvbiBDUFUg
Mw0KPiANCj4gYW5kIHRoZW4gaXQgc2VlbXMgdG8gaGFuZyBmb3JldmVyLg0KPiBJcyB0aGF0IGV4
cGVjdGVkPyBEbyBJIG5lZWQgYSBzcGVjaWZpYyBjb21taXQgb2YgU1ZTTSBvciBFREsyPw0KDQpG
V0lXLCBib290IG5vdyBmYWlscyBhIGJpdCBlYXJsaWVyOg0KDQogICAgKC4uLikNCiAgICBbU1ZT
TV0gVk1TQSBQQTogMHg4MDAwZjQ2MDAwDQogICAgW1NWU01dIExhdW5jaGluZyBGaXJtd2FyZQ0K
ICAgIGVycm9yOiBrdm0gcnVuIGZhaWxlZCBJbnZhbGlkIGFyZ3VtZW50DQogICAgRUFYPTAwMDAw
MDAwIEVCWD0wMDAwMDAwMCBFQ1g9MDAwMDAwMDAgRURYPTAwODAwZjEyDQogICAgRVNJPTAwMDAw
MDAwIEVEST0wMDAwMDAwMCBFQlA9MDAwMDAwMDAgRVNQPTAwMDAwMDAwDQogICAgRUlQPTAwMDBm
ZmYwIEVGTD0wMDAwMDAwMiBbLS0tLS0tLV0gQ1BMPTAgSUk9MCBBMjA9MSBTTU09MCBITFQ9MA0K
ICAgIEVTID0wMDAwIDAwMDAwMDAwIDAwMDBmZmZmIDAwMDA5MzAwDQogICAgQ1MgPWYwMDAgZmZm
ZjAwMDAgMDAwMGZmZmYgMDAwMDliMDANCiAgICBTUyA9MDAwMCAwMDAwMDAwMCAwMDAwZmZmZiAw
MDAwOTMwMA0KICAgIERTID0wMDAwIDAwMDAwMDAwIDAwMDBmZmZmIDAwMDA5MzAwDQogICAgRlMg
PTAwMDAgMDAwMDAwMDAgMDAwMGZmZmYgMDAwMDkzMDANCiAgICBHUyA9MDAwMCAwMDAwMDAwMCAw
MDAwZmZmZiAwMDAwOTMwMA0KICAgIExEVD0wMDAwIDAwMDAwMDAwIDAwMDBmZmZmIDAwMDA4MjAw
DQogICAgVFIgPTAwMDAgMDAwMDAwMDAgMDAwMGZmZmYgMDAwMDhiMDANCiAgICBHRFQ9ICAgICAw
MDAwMDAwMCAwMDAwZmZmZg0KICAgIElEVD0gICAgIDAwMDAwMDAwIDAwMDBmZmZmDQogICAgQ1Iw
PTYwMDAwMDEwIENSMj0wMDAwMDAwMCBDUjM9MDAwMDAwMDAgQ1I0PTAwMDAwMDAwDQogICAgRFIw
PTAwMDAwMDAwMDAwMDAwMDAgRFIxPTAwMDAwMDAwMDAwMDAwMDAgRFIyPTAwMDAwMDAwMDAwMDAw
MDANCkRSMz0wMDAwMDAwMDAwMDAwMDAwDQogICAgRFI2PTAwMDAwMDAwZmZmZjBmZjAgRFI3PTAw
MDAwMDAwMDAwMDA0MDANCiAgICBFRkVSPTAwMDAwMDAwMDAwMDAwMDANCiAgICBDb2RlPWM1IDVh
IDA4IDJkIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDU2IDU0IDQ2IDAwIDww
Zj4gMjAgYzAgYTggMDEgNzQgMDUgZTkgMGMgZmYgZmYgZmYgZTkgZjEgZmUgOTAgMDAgMDAgMDAg
MDAgMDAgMDAgMDANCjAwIDAwIDAwIDAwIDAwIDAwIDAwDQogICAgcWVtdS1zeXN0ZW0teDg2XzY0
OiB0ZXJtaW5hdGluZyBvbiBzaWduYWwgMg0KDQpUaGlzIGlzIGR1ZSB0byA1Mzk2MjQyNzFjYjgg
KCJzZXY6IHJlcXVpcmUgdGhlIGRlYnVnIHJlZ2lzdGVyIHZpcnR1YWxpemF0aW9uIGZlYXR1cmUi
KSBpbiB0aGUgU1ZTTSwgYXMgdGhlIFNFViBmZWF0dXJlcyBmb3IgdGhlIGd1ZXN0IFZNU0EgZG8g
bm90IG1hdGNoIHRob3NlIG9mIHRoZSBWTVBMMCBWTVNBLCBhbmQgdGhlIGN1cnJlbnQgS1ZNIHBs
YW5lcyBpbXBsZW1lbnRhdGlvbiByZWplY3RzIGl0Og0KDQogICAgWzI1MTM3OC4wOTY1NzBdIFsg
VDkxNTI4XSBrdm1fYW1kOiBrdm0gWzkxNTI0XTogdmNwdTAsIGd1ZXN0IHJJUDoNCjB4MCB2bWdl
eGl0OiBtaXNtYXRjaGVkIEFQIHNldl9mZWF0dXJlcyBbMHgxXSAhPSBbMHgyOV0gZnJvbSBndWVz
dA0KDQpOb3Qgc3VyZSBpZiB0aGUgYmVzdCBhcHByb2FjaCBpcyB0byBzcGVjaWFsLWNhc2UgZGVi
dWcgc3dhcCwgb3IgdG8gc2ltcGx5IGFsbG93IGxvd2VyIFZNUEwgVk1TQXMgdG8gaGF2ZSBhIHN1
YnNldCBvZiB0aGUgZmVhdHVyZXMgb2YgdGhlIFZNUEwgMCBWTVNBLg0KDQpSZXZlcnRpbmcgdGhl
IGNvbW1pdCBJIG1lbnRpb24gYWJvdmUgcmVzdWx0cyBhZ2FpbiBpbiB0aGUgaGFuZyB0aGF0IE9s
aXZlciByZXBvcnRzLg0KDQpCZXN0LA0KQ2FybG9zDQoNCg==
