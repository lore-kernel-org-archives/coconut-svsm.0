Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013061.outbound.protection.outlook.com [40.93.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B27F1CDFD5;
	Tue,  7 Oct 2025 18:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863150; cv=fail; b=JsWXWgRw1SS0lc7r50MRV9yNGTFcZ3UUwbmY+zSVzGvpwFQ9nfqpd1Zq76EXdAcQq0svK2nJo2NsFoW7B68g1mW1Ub5MLfGrhJQh/dqB9JPamblRzerr2UMOHU8wobECHuvD1FYC4kI0f6+0kSPvXB1tnf/0mlddCPHKWkHx/Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863150; c=relaxed/simple;
	bh=q2PjIxtUBBccl6EafjhGA71Cuk2pmyLe/7RzdPm/NVM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FLkpcUaX3oaASJ0Gh8f6hPMcZVSCNNsI/8h12SUt66ThPLlXkyT007w9s1YUuff7KPLYVEldri4eO9LwLAGqGFX6bNv3rjQccZnwxH58Jt3qaAu2SPVGWMp8ipAY6ak0fMc5stXH1cxOGnfhpRetu7de1xsG0tyCl2Rxcsd3LYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Njd2P/IA; arc=fail smtp.client-ip=40.93.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Njd2P/IA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oq5KaE6SsazTehSJlP9HYydzRtl9zQYKbNfEUwC5tqjaEQkOfI04xLW/BcvzVTOLYD/PLi+Rp4MOId4uzYpwYfWYCMIVaayETsLi9MuE42bNUs7TJn2dOL+qTwOLlGzrxj2F9JtqFV4hqMFY4WBapO9U9qsWWhUNWNUQ9AJpuqEY10e5dWA/jE5mKvxKgAURdCsRk6M4Lbs9dI9qTgECDB3c7UKIJFOW3MUiSk44Phmj8sOWb/91TmIxLugo7U7W1XZAqMP2av6352skWAB6Gm/Xgxru3eOB3qiXZt2D1Nxea3VTfEwmqEl1eqTaltsgYtDdkkq1HOHciOOLxkf/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2PjIxtUBBccl6EafjhGA71Cuk2pmyLe/7RzdPm/NVM=;
 b=B5Xg8Rx2cSkkaNvUeLOljq5KNT01TZUS3ZJVHakxYRu4PYEL9zxa/XXsXyLf356QM8X/+gORgVEAQddkNo2HXdgs/Fclqfp/r9SU5jJcZxMIBxXT07fImTowzcK05dCau4aNto4mbAjIgcwhD7NTkB4+DXlodb/I6267w8GPLwhTehNWp5l8rqLu3KQpOcO0P3lkSyns+THxmvmCoQKHCMRrDFuz/LYvFX9nDtARa1uYXdU71Dukor9StD1fsA/IRc2lGAjiMO57jDJSlCQTm3YMNv479SlPnGoTYBVVJiu4HLDGXujqBV8yB0tKO9vMqB6k/IwDkAlLQtBVzmb+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2PjIxtUBBccl6EafjhGA71Cuk2pmyLe/7RzdPm/NVM=;
 b=Njd2P/IAPyYKzJsugBbhkY9b3qR3w/WyKF7R1vRbIqPfW//u4HGGDUeZhvzPHcF0mkaiojysozm6FAqe2//Jf3dy1rGT34yegVUfasiYwC51X9IyCK7z1YBLSL3rxUVGx6PSN00FM7oEKgdk+ZDJgd568L7FV5mqAcny/A9mlpw=
Received: from CH2PR12MB5516.namprd12.prod.outlook.com (2603:10b6:610:6b::23)
 by MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 18:52:21 +0000
Received: from CH2PR12MB5516.namprd12.prod.outlook.com
 ([fe80::80c2:1d4f:4a3b:73e]) by CH2PR12MB5516.namprd12.prod.outlook.com
 ([fe80::80c2:1d4f:4a3b:73e%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 18:52:21 +0000
From: "Relph, Richard" <Richard.Relph@amd.com>
To: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
CC: James Bottomley <James.Bottomley@HansenPartnership.com>, Nicolai Stange
	<nstange@suse.de>, "coconut-svsm@lists.linux.dev"
	<coconut-svsm@lists.linux.dev>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, Jon Lange <jlange@microsoft.com>,
	"kraxel@redhat.com" <kraxel@redhat.com>, "Rodel, Jorg"
	<Joerg.Roedel@amd.com>, "Wang, Huibo" <Huibo.Wang@amd.com>
Subject: Re: SVSM draft specification (v1.01 draft #3)
Thread-Topic: SVSM draft specification (v1.01 draft #3)
Thread-Index: AQHcNH8F1L5cqzyGJ0C7KbMVv+DAp7Sx2I5PgAOTkwCAAJfDAIAAwtIAgABHRAA=
Date: Tue, 7 Oct 2025 18:52:21 +0000
Message-ID: <51B44B24-858A-4E63-A490-D172D0C6476F@amd.com>
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com> <87bjmmj4n2.fsf@>
 <8953f72f-edd2-edde-dc43-3782dbac8c16@amd.com>
 <40c872d85e15011784bec546290b22809dfff8e6.camel@HansenPartnership.com>
 <549cf861-50d8-ffab-f03f-c8ccd356afdf@amd.com>
In-Reply-To: <549cf861-50d8-ffab-f03f-c8ccd356afdf@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5516:EE_|MW6PR12MB8898:EE_
x-ms-office365-filtering-correlation-id: cd6256ba-4718-4fd8-f575-08de05d2a5a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGUrNkc0MGZXdkNqQXkvUFFTb0VYekRYM2dQNE80NzdzYmFVNEtkN2lGY0xx?=
 =?utf-8?B?NlFWSUZhY0tjdURYa3lqZFRETlBvbzhMN3hNMGNnS3UwNXVZbllDUmVtSHNF?=
 =?utf-8?B?OUsyY2xjYnJVc0tnaEo1dUo2VHk4Y2FsdlFtcDVFUWUwUW1BeS8vR2RIZWVn?=
 =?utf-8?B?RCt6WE01VGJZbnJsdmZ2RWZDdjRrZmZKeGdxRVkvQ2Y4K0lFSkd3bkFVQ3ln?=
 =?utf-8?B?MURyMFlKcEQ5WnZYMUtwWEpFTjBFWVRVYTlrL1J4NTl5Wmg3RWRWd2FJNFNC?=
 =?utf-8?B?MkF3SWF6T3JrWkRLUDNxWFU2TTBlTElNaFIrS3B0TnBaN0NhOXRwT29HbERP?=
 =?utf-8?B?aVh0VlNPL081d0lPaEt5b0pmT2EvYVNEcEtRd0FjUGRNOUsvWDhhWi9hOHha?=
 =?utf-8?B?ai9rdzR2Zkhnd0pWKzZkY0JNV1l3VnVJV2xGaU5rMG1Oa3VHajRTL1NGaEVY?=
 =?utf-8?B?YnlpbjAvMzVSWWVsdTM1RmQ0YVJEWHVWTGk3TEFUcEgyUVQzYUlEOEdiOGtE?=
 =?utf-8?B?WUpsS1ZuTCswOGRkS2ZGaHVDcFl6R1RuQVNLV0JKVDBKMHRDR2Z5QmZCYXNl?=
 =?utf-8?B?Rzk0UHI5UUdsanVDSldtM3ZxdUxWNTEwU2NSRVlRWDlXMlVJNlo4b1NMQnpQ?=
 =?utf-8?B?WU5mTDVpbmJwVHAwYVBkcTJqdDFBRmk2OUVMdEFJSFhaQm9OangrSVJwb0hF?=
 =?utf-8?B?OWN6eVhoTXdwRlhFeVZtTitqYmhwaHBJNkNzZ1p1SFc0Mzhab2RBcWFWcTQ2?=
 =?utf-8?B?YzhJeDhzalJuczBFNjVuOThUZ0NRQW5NSzFXQ0FaTTUvRGxJMkVVU0xXTzha?=
 =?utf-8?B?bEgySUpHSmlKQXAwRjJUa2lwa0lqbzllY1NvZDU1bmo2K0psY0cwSy9BOGFK?=
 =?utf-8?B?ZmwxSXo5MWppSnFYYzRZSEFidFd2WXFIdlJvejk5SWh6NGtvOGdlVFBEYmda?=
 =?utf-8?B?RnNjVUNNMmlCSGVOaFlzSlRwejdLUk1SS3krZjdSUThVd2lNd2RiMkh1R0Q0?=
 =?utf-8?B?cEtUWHM5MjN0c0pDRWc2NGhPUEZNbUlmWWthak1qcHFEQzQvMUp0ZFg4NDZk?=
 =?utf-8?B?Y2RSY2JWUjhDN3BpQ2ZBL1ZYVFVqVTBKN0hOWWIyK3FxN2V1b3JrMkozR0ly?=
 =?utf-8?B?ZWlxZytsY2E0ZTlsNTNqdldFQXhGemFKT3BTcVFDN0tEZmZieHRMWE82N0h3?=
 =?utf-8?B?SjJPR3YrY2FuN3lXRTgxQzlXU2xFMk9JYkFXSFVlK21EbWdXcmFWMEUvUENT?=
 =?utf-8?B?Y0UzbVFtUk1EL0lQeGU2THRUVDRIUnBYV3MxVWtTWm5neUFtN1hJQjVyL1FD?=
 =?utf-8?B?QXljQmNUbGFJL2JwQWZSdWZ1OFh1ZDFHRDN4SFl3aHBmKzZTSlNjQVlKcnhw?=
 =?utf-8?B?Rm9STmV6WXl3LzlkQUc5UzY2M2JoMiszWGJsd2t5bGJWQTlYbjFKK1VwOEFG?=
 =?utf-8?B?UnRVdFRudmx1VVBoQnBrVm5Id1VOREhwNlB2VEw3VW1pTCswY2FoUVE0bmNz?=
 =?utf-8?B?bVMrbUdEbktFVUpabHJ6UjEwb3FMekxVaFh1ajhLRE9Wblc4ek1QSFhhRUJ6?=
 =?utf-8?B?QkcwSVhiOURYcDNNQnJlaEZiU0RWOFd6Smh1SWVHSmNBNkw0OTJRMkZuaXdx?=
 =?utf-8?B?dDdzVFZLamQrbC9kSjJ3ZG0zVWhnTEEzYUtwaVNoODdNUmh5dTRYeC9GQXdC?=
 =?utf-8?B?ZUNTaG9GNkxDQkpTQWk3ZDBTa2ZlUHJJdDZGNTdHRVJYSmQ4UmxNVlFtdndo?=
 =?utf-8?B?K1dBbTlpNHZkbGVZKy85MVVNRVhoRm5XczBaOUdFWTlFeWpEVEJvaC9sQ1R0?=
 =?utf-8?B?bkVSV2Jhc0JPTUJYYW1rQXR2RnBzS1RwVFp2U3k5N1RSM0xXT0M3aC9ZQ2Rj?=
 =?utf-8?B?YS9Wb3ZqTFRkVzB0UHJUMzhaWkk3d0xVc3R0cXU3blBDS0pBQlhLYjRodTVl?=
 =?utf-8?B?dG42dTB5Q29iTUF2aDllREQ1ejVXdnAxM1dDQnY1ZEtwQ3ZPYTA1WUtRdURn?=
 =?utf-8?B?NWxQM1pKelFFSzVJb3NkRE43Q3cyZVBnUkxtN0lYV1JMK3NhRGNEakluVUxG?=
 =?utf-8?Q?aUO5SJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB5516.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VzNKRkIrYnk1Mk9SVGFENkU1NVNRd0tmZG5FYzBWajQ3WlFoZHlkK0V1aDk3?=
 =?utf-8?B?amZsN096TlBidlo5bENaeFU4Tm1ibkFPVUZIaEJ0UHl0UjdNL056ZjNWZ2d2?=
 =?utf-8?B?a25yeFdaOU1SNVFENXUvd0tlYk9Ec2M3ZnpNcUQ1c2lZeUNTZWFCaVdkdnFx?=
 =?utf-8?B?bWhyRzA3ZFIvNVFwemgyRlFMcVlaMENwdnRnb0hhcGg5ZlFYWkpjUVBCN0xE?=
 =?utf-8?B?bXRLMEtkL1dtTlhkWmx6dlBOU0Y4OFdDeE5ha1Y5aldhWlFWbGtGSjFoTkhs?=
 =?utf-8?B?VlRVQjhQMUJPbnBSZGpSUG1XZ2J2a2FFZjNPYlVXdE54SEhIc1hEcUxweFpC?=
 =?utf-8?B?ZS9NVzFFaXpxVzdYTlFmUFBVRUVtQlJSRnE3aXpsYVhmU3hpOGV6QVpWVEJ6?=
 =?utf-8?B?SGJsMlZGYVNWZ2tJQzhlOTI1NzJOcGFRVlRpSk9ZS1RObVNNOXd0d2xFbzYx?=
 =?utf-8?B?aEhZWWpjSkxadGFyVEZia2MwQmMyaXhMRkNpajZKbEN2MjFQSGNHWXlaTGl5?=
 =?utf-8?B?Um82UzhQanBId3hTMktaeHRxTkZvQTBpV1hLeGV2cHR6ZFp5UUV4bmNFK3lT?=
 =?utf-8?B?TENWcndBK0tiZWlrM3ZPbkdLMHNMam13d3VuUE9aUXIxMTlVbEVWVlpaQVo1?=
 =?utf-8?B?V2Ywa0NXZnBlaEplYVpCK2h3Sk94cDM4WXhHWVpGdVp1R25hRmhJbkJkWWdO?=
 =?utf-8?B?bFFJaGdCLy9LQ3VjZnlnZ2NlK0VMeVhwblAycnBZZkI3UTJmUWNyaDBBUDJ5?=
 =?utf-8?B?UitIeHhmZ1htb01KWHNUc3kweGNaZCtuNkgxazVSZG56RDMwczdtaXI4YW44?=
 =?utf-8?B?Y3c5OGhFNjl2MSsvOVZhd2xQeFBRV2w2aTFPcm56VEtsbEhLaFVwWURuUC8v?=
 =?utf-8?B?TUJtMUdxVVMvYWU3Z3crUWpwcHdPUnh3cGh1MHltR0NweXFZYUl6UHFRWFNN?=
 =?utf-8?B?OTVmdld3ZmVNVW1CS1JtSzhvL1N0eWRwRnRUVjhWc2ZKUzc1Ly94N2d6TVZr?=
 =?utf-8?B?UlByVlpranFQT1R4bDhCalloMkROWUtmcFdJQ0FpcEwrM1RFU3p3dEMxVTda?=
 =?utf-8?B?N1hjYitLTGdvaTNESHBTeTVuZGROVFlGa1lYRHRKOHNtZlhoZjU5eUtiWHhn?=
 =?utf-8?B?eTBIOXAwQVg5SzU0VlFFekQ2eTNCbFdscGZmTUtTSFduR1dmQWloSStidFJr?=
 =?utf-8?B?dDFETFQ3M0ljaWNMTm9FSnp5WkF2L2ZIRDhMZDhSN1dPTDJpb05sQnMzSjVP?=
 =?utf-8?B?cXNDYVBRbUNsdTlxaUo1b29HREcvZmNGc3FlNmRMQXVXNFFMUm1OMUJDN1BC?=
 =?utf-8?B?RkVnN3hMdW43MGk0TzIzVnlua1BjSExVOWQ4eDlnWVU4amZiK3hCYnB1WHVX?=
 =?utf-8?B?NGNMNzBwWDRkdjJIYkN3WFJJcEFUdS9zd1Y1d3d2SlhsY21lQ0MxMi9WTWQ5?=
 =?utf-8?B?NEVPU2JERHlJdlZFNDNBVDFUUnJRaDNmWnhCaDlUTU9YNmF3WDIvMFhZTVFC?=
 =?utf-8?B?SUthaFlDMEZFZnB2emphLy94UGNrWnNjV0ZPcEMrVEVWMk53eHNUd25saHpo?=
 =?utf-8?B?VU5KOUsyeWgrcWJXK1llck44MHNNaXlMd0RBdmMvRnZieGJxaUY0Y2lMNUJu?=
 =?utf-8?B?NDNJZzYxYWpCNGpiTEZjWHk1UisvYjVhcGhrUnZiSTZjc2IyMTZ5dVpSY1pO?=
 =?utf-8?B?L3Z5VFd6RUk1bWh3endkSk1vQlNkTjlrUXdCWEt6OUsxWUdEMVg1azZYZ2tk?=
 =?utf-8?B?YWsvanRvM2FXTHo2VWVWS09rRTdRUE10amZsZFU4RlFkVFVMUnpjb3JuMEFo?=
 =?utf-8?B?RnUxSFpjTFQ3QkE0dktpUE9HQXY4empoMStySG92SVgzbW5BaXFjL29PUGxp?=
 =?utf-8?B?WStOQWNyTlM3VHY2a3IzeU1xNHlBZXJCSjBwMVNZWnY2OTdoVjN3UWc0d0VO?=
 =?utf-8?B?QUxQa1RrbnZzemVVdkFOVkVhak5ubjJVNHI0eXJmaHJEdGYxbThkZnRoMVpY?=
 =?utf-8?B?ZWlnaUVNczBKbFMvajFvZjhFMTJoK292UzN0VUtMcXlyYTZsVURjQUh1c1hB?=
 =?utf-8?B?dG5hWk1id2ZLMWMxZ3pxNmhjSURKMm05QmtGWGIyemM5NlJJSXJIaG1NSHhW?=
 =?utf-8?Q?UUjzrjbRzEtlMwpW3lru66mvZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB76A633C9DB664AA10F33AA85020B1E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5516.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6256ba-4718-4fd8-f575-08de05d2a5a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 18:52:21.3297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TcfGsCF/s96GI/+DGrvJrFqGCpaguKpxL9N9KgAVMdf1OgUkthFK2ewlNuW50Ckb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898

QWxsLA0KICBBZnRlciBjaGF0dGluZyB3aXRoIFRvbSBzb21lLCBJ4oCZZCBsaWtlIHRvIHJlc3Rh
dGUgdGhlIGlzc3VlcyBhcyBJIHNlZSB0aGVtLg0KICBNeSBiYWNrZ3JvdW5kIGlzIGRlZXBseSBl
bWJlZGRlZCBzeXN0ZW1zLCBub3RhYmx5IGluIHRoaXMgY29udGV4dCwgUFNQIEZXIGZvciB0aGUg
dmFyaW91cyBmbGF2b3JzIG9mIFNFViB0aHJvdWdoIHRoZSBHZW5vYSBnZW5lcmF0aW9uLCBhbmQg
dGhpcyBpcyBteSBmaXJzdCBmb3JheSBpbiB0byB3cml0aW5nIGNvZGUgZm9yIExpbnV4LCBFREsy
LCBvciBTVlNNLiBBbmQgaW4gUnVzdC4gU28gSSBjbGFpbSBaRVJPIGV4cGVydGlzZSBoZXJlLg0K
DQogICBJIHdhcyBhc2tlZCB0byBlbmhhbmNlIFNWU00gd2l0aCBhIGNhcGFiaWxpdHkgdG8g4oCc
cmVib2904oCdIHRoZSBWTVBMIDIgZ3Vlc3QsIHdpdGhvdXQgZXhpdGluZyBRRU1VLCBhbmQgd2l0
aG91dCByZWx5aW5nIG9uIGtleGVjKCkuIFdlIGRpc2N1c3NlZCB0aGlzLCBicmllZmx5LCBpbiBz
b21lIENvY29udXQtU1ZTTSBtZWV0aW5ncyBpbiB0aGUgQXByaWwgYW5kIE1heSB0aW1lIGZyYW1l
Lg0KDQogICBGb3IgcHVycG9zZXMgb2YgdGhpcyB3b3JrLCBhbmQgdGhpcyBkaXNjdXNzaW9uLCBJ
IG1ha2UgdGhlIGZvbGxvd2luZyBhc3N1bXB0aW9ucyBhYm91dCB0aGUgdXNlIGNhc2UgZm9yIGEg
cmVib290IGNvbW1hbmQ6DQogICBUaGUgcmVhc29uIGZvciBub3Qgd2FudGluZyB0byBleGl0IFFF
TVUgaXMgdG8gbWFpbnRhaW4gY29udHJvbCBvZiB0aGUgcmVzb3VyY2VzIGFsbG9jYXRlZCB0byBR
RU1V4oCmIHZDUFVzLCBtZW1vcnksIHdoYXQgaGF2ZSB5b3UuIEV4aXRpbmcgUUVNVSB3b3VsZCBy
ZWxlYXNlIHRob3NlIHJlc291cmNlcyBhbmQgd2hvIGtub3dzIHdoYXQgbWlnaHQgaGFwcGVuIGlm
IHRoYXQgaGFwcGVucy4gUGx1cywgb2YgY291cnNlLCB0aGUgdGltZSB0byByZS1hY3F1aXJlIGFs
bCB0aGUgZGVzaXJlZCByZXNvdXJjZXMgdXBvbiByZXN0YXJ0aW5nIFFFTVUgd291bGQgYWRkLCBw
b3RlbnRpYWxseSBzaWduaWZpY2FudGx5LCB0byByZWJvb3QgdGltZS4NCiAgIFRoZSByZWFzb24g
Zm9yIG5vdCB3YW50aW5nIHRvIHVzZSBrZXhlYygpIGNvdWxkIGJlIHRvIGNoYW5nZSBzb21lIHNl
dHRpbmcgaW4gdGhlIEJJT1Mgb3IgYm9vdCBhIGRpZmZlcmVudCBPUy4NCg0KICAgIEV4aXRpbmcg
LSBmb3IgYW55IHJlYXNvbiAtIGFuZCByZS1zdGFydGluZyBRRU1VIHdvdWxkIHJlc2V0IFFFTVUn
cyB2VFBNLiBRRU1V4oCZcyB2VFBNIHN0YXRlIGNhbiBiZSBwZXJzaXN0ZWQgYWNyb3NzIHJlYm9v
dHMgaW4gYSBob3N0IGZpbGUsIGJ1dCB0aGUgdlRQTSBpdHNlbGYgdW5kZXJnb2VzIHNvbWV0aGlu
ZyBsaWtlIGEgSFcgVFBN4oCZcyBwb3dlciBvbiByZXNldCBlYWNoIHRpbWUgUUVNVSBzdGFydHMu
IEkgZG9u4oCZdCBrbm93IGhvdyBTVlNN4oCZcyB2VFBNIGltcGxlbWVudGF0aW9uIG1vZGVscyBh
IHBlcnNpc3RlbnQgdlRQTSwgdGhvdWdoIEkgYXNzdW1lIGl0IGNhbi4gUUVNVSBhbHNvIG9mZmVy
cyB0aGUgYWJpbGl0eSB0byBOT1QgcGVyc2lzdCBpdHMgdlRQTSBhY3Jvc3MgUUVNVSBpbnZvY2F0
aW9ucy4gQW5kIGhvd2V2ZXIgU1ZTTeKAmXMgdlRQTSBtb2RlbHMgYSBwZXJzaXN0ZW50IHZUUE0s
IGl0LCBsaWtlIGEgSFcgVFBNLCBtdXN0IGJlIGFibGUgdG8gc3Vydml2ZSBhbiBhc3luY2hyb25v
dXMgcG93ZXIgY3ljbGUsIGV2ZW4gb2YgdGhlIGhvc3QuIFNvIHByb3ZpZGluZyBhIFJFQk9PVCBt
ZWNoYW5pc20gaW4gU1ZTTSB0aGF0IGFsc28gcmVzZXRzIHRoZSB2VFBNLCB3aGV0aGVyIHBlcnNp
c3RlbnQgb3Igbm90LCBpcyBkZWZpbml0ZWx5IOKAnGluIHNjb3Bl4oCdIGFzIEkgc2VlIGl0LiBX
aGF0ZXZlciBvdGhlciBSRUJPT1QgbW9kZXMgbWlnaHQgYmUgZGVzaXJlZCwgdGhpcyBvbmUgc2Vl
bXMgbmVjZXNzYXJ5IHRvIG1lLg0KDQogICAgSWYgeW91IGRpc2FncmVlLCBwbGVhc2UgaGVscCBt
ZSB1bmRlcnN0YW5kIHdoYXQgSeKAmW0gbWlzc2luZy4NCg0KICAgIFRoZSBkcmFmdCAxLjAxIHNw
ZWMgY29tcHJlaGVuZHMgc29tZXRoaW5nIGxpa2UgdGhpcyBiZWhhdmlvci4gSXQgZG9lc27igJl0
IHNheSB3aGF0IGhhcHBlbnMgdG8gZ3Vlc3Qgc3RhdGUsIGluY2x1ZGluZyB0aGUgdlRQTSwgd2hl
biBhIFJFQk9PVF9FWEVDVVRFIGNvbW1hbmQgaXMgc2VudC4gSSBhZ3JlZSB0aGF0IG5lZWRzIHRv
IGJlIGNsYXJpZmllZC4gVGhlIGludGVudCBpcyB0aGF0IHRoZSBzeXN0ZW0gc3RhdGUgYmUgd2hh
dGV2ZXIgaXQgd291bGQgYmUgaWYgdGhlIHN5c3RlbS13aWRlIHJlc2V0IGxpbmUgaGFkIGJlZW4g
YXNzZXJ0ZWQuDQoNCiAgIEphbWVzIGhhcyBwdXQgZm9ydGggYW5vdGhlciByZWJvb3QgbW9kZeKA
piBvbmUgdGhhdCwgYXMgSSB1bmRlcnN0YW5kIGl0LCBwcm9wYWdhdGVzIHRoZSB2VFBNIGV2ZW50
IGxvZyBmcm9tIExpbnV4LCB0aHJvdWdoIFNWU00sIHRvIE9WTUYsIG9mZmVyaW5nIGtleGVjKCkt
bGlrZSBmdW5jdGlvbmFsaXR5IGluIHRlcm1zIG9mIHZUUE0gbG9nIG1haW50ZW5hbmNlLiBCdXQg
a2V4ZWMoKSBkb2VzbuKAmXQgZ28gdGhyb3VnaCBTVlNNIG9yIE9WTUYgYXQgYWxsLiBXaGlsZSBJ
IHNlZSBzb21lIHZhbHVlIGluIGRvaW5nIHRoaXMsIGl0IHNlZW1zIHRvIG1lIGEgc2lnbmlmaWNh
bnRseSBkaWZmZXJlbnQgYmVoYXZpb3IgdGhhbiB0aGUgcmVib290IEkgZGVzY3JpYmVkIGFib3Zl
LiBBbmQgbW9yZSBpbXBvcnRhbnRseSwgaXQgc2VlbXMgYSBtdWNoIGxhcmdlciB0YXNrLCBzaW5j
ZSAtIEFGQUlLIC0gRURLMi9PVk1GIGhhcyBubyBub3Rpb24gb2YgYWNjZXB0aW5nIGEgVFBNIGV2
ZW50IGxvZy4gR2V0dGluZyB0aGF0IGNvbW11bml0eSB0byBidXkgaW4gdG8gdGhlIG5lZWQgYW5k
IHRoZW4gcHV0IGZvcnRoIHRoZSByZXNvdXJjZXMgdG8gc3BlY2lmeSBhbmQgaW1wbGVtZW50IHRo
aXMgc2VlbXMgYSBsb25nIHNob3QgdG8gbWUuDQoNCiAgIEdpdmVuIHRoZSB2YWx1ZSB0aGF0IHNv
bWUgY3VzdG9tZXJzIHNlZSBpbiBhbiBTVlNNLWJhc2VkIHJlYm9vdCBmYWNpbGl0eSBhbG9uZyB0
aGUgbGluZXMgb2YgYSBwb3dlciBjeWNsZSwgSSB0aGluayBpdOKAmXMgaW1wb3J0YW50IHRvIG5v
dCBkZWxheSB0aGUgcmVib290IGZhY2lsaXR5IHVudGlsIGFsbCB0aGUgb3RoZXIgc3BlYy1sZXZl
bCBmZWF0dXJlcyBmb3IgdlRQTSBldmVudCBsb2cgcHJvcGFnYXRpb24gYXJlIGluIHBsYWNlLiBX
aGVuIHRob3NlIG90aGVyIGRlcGVuZGVuY2llcyBhcmUgc3VmZmljaWVudGx5IHJlc29sdmVkLCB3
ZSBjYW4gZXh0ZW5kIHRoZSByZWJvb3QgcHJvdG9jb2wgc3BlYyB0byBpbmNsdWRlIGEgbmV3IGNv
bW1hbmQuDQoNCiAgIEFzIGZvciBob3cgY29kZSBpbiBTVlNNLCBvdXRzaWRlIHRoZSByZWJvb3Qg
cHJvdG9jb2wgY29kZSwgZ2V0cyDigJhyZXNldOKAmSwgSSB0aGluayB0aGF0IGlzIGFuIGltcGxl
bWVudGF0aW9uIGRldGFpbCB0aGF0IG5lZWQgbm90IGRlbGF5IHRoZSBzcGVjaWZpY2F0aW9uLg0K
DQogICBUb20gYW5kIEkgZGlzY3Vzc2VkIGF1Z21lbnRpbmcgdGhlIHNwZWMgdG8gaW5jbHVkZSBh
IHJlYm9vdCBxdWVyeSBjYXBhYmlsaXR5IHNvIHRoZSBWTVBMIDIgZ3Vlc3QgY2FuIGRpc2NvdmVy
IHdoYXQga2luZHMgb2YgcmVib290LCBpZiBhbnksIGFyZSBzdXBwb3J0ZWQuIEnigJltIGZpbmUg
d2l0aCB0aGF0Lg0KDQpSaWNoYXJk
