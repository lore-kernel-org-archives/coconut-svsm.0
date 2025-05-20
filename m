Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11020136.outbound.protection.outlook.com [52.101.85.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4902750F8
	for <coconut-svsm@lists.linux.dev>; Tue, 20 May 2025 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757851; cv=fail; b=J3aPFyGJJWPG0oHoUvRw2jFH4MU246Z5d/h1deimfoRDllWerpqDVwTw9WBrbN4T5Ufbgjr3e5MHzynS/8hxC6hr/QM76qcOQHGRaohruf4ifUPvl2HLr9NVXRifwrsaO95uj5/CaX0hM+h+HhCVKYjtUFc6PgL3rCuqS9ItkO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757851; c=relaxed/simple;
	bh=1ZtxbxSdIzCxJD+PVCh+RWGYGTsy17vb1yGUtoRsTfs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KbCcgsw7A+FYQk/WCnH0Os4yUCZGlJB2STlF9Td1WQlaJD8sWvdPdBdYxHQ78KCNmJbiBGE45yFuBOF8vkTWMr96Plvwbyy/J5aAUKZhHA7/XL8l05o7++FUdNgdBAImdwNUWeKlp486gSscZR756mgmxfV0QoGu9u0hVGS0PCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=QUkpdb/g; arc=fail smtp.client-ip=52.101.85.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="QUkpdb/g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FV/Xf2JjPXvdRv4/XaF+fxxpuimXpIEJhgIz/rTMRqnHvGZC1VkDea1Ga+q1T0/CVVxMEyYYppXWOJGmc9H4g7z8y7ThIrbf2MVT+quMj335bdEm9m8opx5owwCe8DNSu8lNrvXKz569W9B5VP6nmNH3RT/l5LA4aWMc2jGRtr8DNhdCU9XOafkzpb8XZRMSqZRr+dvM17a7RNpdaWmogkAT/uAgg3jrAummMQDQr1LSdfVWjXxwPxK/bloM8LevcVODwPAAJguruOMaJ5e5VeJD15+d45F49LP+y49Ag4sj543CrAVmecUU3vX0+XAmj9mbIOVIcxtdgCN7ou8LbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIDSrVsSnM0TraDmMoNdtTTxA8GWnqAPqhK6REgPQjs=;
 b=FSggGr0QiZCwhBEnf60/LCJ6fygCvBjb0qSrUN9hpWHx+YovJZHNIA463BgoBkA+egQWsBwYryKTYmnxc5A6boQxB+moGDjnkAVK2RaUGU/x18Y0UqOLuTj2BB9ucJia3peaAYmSzqG7ZiRKWURahGIcwGH+Xc0N1VCHHuBaAOz7X/HS7B7q/8i50WR/zzgmtsW1hE9EgWcXSh/lr1P3RY0ZOHagDSSkTnIJWmxNx3c4XC9ylBKcmqCtP+MOc9Sg8SG9HjkZx9oHlwPwN9JWzANea5084jR/4JgYiXcuIpnyWtGo+NEXgDTQE151DW/O2wwpzA9V4mLqWmycw0Vccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIDSrVsSnM0TraDmMoNdtTTxA8GWnqAPqhK6REgPQjs=;
 b=QUkpdb/gEe/KSLZ/5tTAET18+e+nB76aHfhgYOkcF0jrRYc1n+UjP4fENtK3O8Ha4oBSb3KGyFPT6vFz9s6cTDtmFEIfwRBjzkjXUhDq/+Q6xp0DPtPm7tGdXfMLmjTwwP8AMSATAbriQi37A6ZrIpftzDlknCRd1bWNYZwnYV0=
Received: from SA6PR21MB4303.namprd21.prod.outlook.com (2603:10b6:806:419::17)
 by SN7PR21MB3908.namprd21.prod.outlook.com (2603:10b6:806:2dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.5; Tue, 20 May
 2025 16:17:27 +0000
Received: from SA6PR21MB4303.namprd21.prod.outlook.com
 ([fe80::e19b:11d0:630d:d6fc]) by SA6PR21MB4303.namprd21.prod.outlook.com
 ([fe80::e19b:11d0:630d:d6fc%6]) with mapi id 15.20.8769.016; Tue, 20 May 2025
 16:17:26 +0000
From: Jon Lange <jlange@microsoft.com>
To: Gerd Hoffmann <kraxel@redhat.com>
CC: Adam Dunlap <acdunlap@google.com>, "coconut-svsm@lists.linux.dev"
	<coconut-svsm@lists.linux.dev>, "svsm-devel@coconut-svsm.dev"
	<svsm-devel@coconut-svsm.dev>
Subject: RE: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation
Thread-Topic: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation
Thread-Index: AQHbyNL2fLP0DEpoMkqZQ9dnXoitdLPaG87wgAFkw4CAAC/FQA==
Date: Tue, 20 May 2025 16:17:26 +0000
Message-ID:
 <SA6PR21MB4303A1AE51FDC2CC8A83A779CA9FA@SA6PR21MB4303.namprd21.prod.outlook.com>
References:
 <CAMBK9=YfWzsXqhav8d8-cLtn6RKLBKY4PN2FCHwjCci1Mi-fhQ@mail.gmail.com>
 <ifj4skreud33emq6apcrmp6s4na5nmwsncrxkozaicg4xih6il@5kqf6yjt3tsy>
 <SA6PR21MB430341F8085E6F0B004B865BCA9CA@SA6PR21MB4303.namprd21.prod.outlook.com>
 <nnijlaq5y6a5fvydo4vohgjefci63puwckhcrtgi5yec3tmbql@xjuuvnjyypqi>
In-Reply-To: <nnijlaq5y6a5fvydo4vohgjefci63puwckhcrtgi5yec3tmbql@xjuuvnjyypqi>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=0bf6dffa-9dea-431d-a09c-c178bd814080;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-05-20T16:05:23Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA6PR21MB4303:EE_|SN7PR21MB3908:EE_
x-ms-office365-filtering-correlation-id: d2141181-9fa1-4c89-bae0-08dd97b9cfda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4rLu6bYfbMeCXYOaPVd/O+OWv0N8bCuMhAKbK7SXX2M2WMqmGaWjXJvpcuRh?=
 =?us-ascii?Q?k+9r2zd19BhpmN39TSbOAovtrfG0h7IkkpJee12oLebGS03osthsMDHECVIa?=
 =?us-ascii?Q?qIgMieB1lqtJOCyEf8GYyikx5g/DSHiNVqzwJhDEvKN7RYNneULRVHeC19/u?=
 =?us-ascii?Q?6zb8Qklit78ePOKhZTQYiKqpQ9Y6zRlqxrHumd6WEBzywuGCfKYFp65T97yD?=
 =?us-ascii?Q?TurBKSugeecdPQVuEJ5bCmQGyD45sWFG9P7atN9wmMaARz4o/LpFBhiac1wy?=
 =?us-ascii?Q?xo4ih3tll0vjDtszanTqACmGfw2abXr5ZH055qplg+7KMa4pvQzdOPfO6Qgm?=
 =?us-ascii?Q?gDLU0XJMtFo5o9CEVnm+RDcR4NPc++RfnGyMBRWrzXZfDwOiArv+nUdbzaIc?=
 =?us-ascii?Q?lB3XyXoCRo7R8Ly0/NvwZ7ghmUmajwAWSbR/zwmUXJBRGUxnPMr/pVSuxpy5?=
 =?us-ascii?Q?6QNte9Cgem74V4Idm7zvEz9bNBIDwikLXMtAoKic/J3kgJl9IO+3X05rMF0E?=
 =?us-ascii?Q?DFqDfD26Kc6fow8miDQPqGCI0zXUn8dUQTd5v3W8LaaSeI/9BPm9kPtgUOEj?=
 =?us-ascii?Q?rrU9uvlBS/JDr5mC/wWb+flQKctjs1ukZ1QgmqNldFFaBzFitan2TpG44C/p?=
 =?us-ascii?Q?boYwwrrkVp2EqlErlVQlSx0zwBmyPyrQMxLf8NrsgLDAMNH1AvFEv93Qvev8?=
 =?us-ascii?Q?0QOZjjl2+EPrPi0eYthQZhVoibwiq8Qcw74Ptx5Gd2RSE9HPZdr1ov5cpDVN?=
 =?us-ascii?Q?0cLBPdigMMFipNPIzED5SWjVTumC7jU9qKDG088ctkFYco+ks1CFKvJmRgEb?=
 =?us-ascii?Q?f9yyYrFvCRxkIfCl+1Elv2yXsSMnxZY1WaFrCny8bnmEzkt2wl6AX2NNmjJh?=
 =?us-ascii?Q?Qt+apU0WQ8i1uZujmllfDQ1BHQ0b4+lGLRSxMrDE9tXlGJqe2F5c6MU34PLP?=
 =?us-ascii?Q?+koSZgRQnGkx2Lcw2QdW1MTLGRkmLXDER8xCbUmYvp86VZy9ZPWJUiLLV0GM?=
 =?us-ascii?Q?uhUb0Bv4ek7ql+iGLacHgIPa+jisHWq9McdxC+cLTAE7wgzC9SFkzSYJcuvk?=
 =?us-ascii?Q?+2LctITy/nTT5Nh9AMFxU50KMxyfqyaz1uWf4WYvskHxUHDRIsTGhFV3adrj?=
 =?us-ascii?Q?qA5I3jVJ0HQd9+kVBE7j+c+nS/vyyvf0/vQCVzk5XG3uVOqcEc4EQz+F4Zhh?=
 =?us-ascii?Q?Y3janZ5sR82rUec9eZ86hND40OKVzvMGKgtPiN5yavywvniuKOBokirTJXNV?=
 =?us-ascii?Q?zbzX6QHx4bZYKhi4fEMyqn/2mNzTCxzcwwVLj77zYrsKmzGywUpqiZxp4ync?=
 =?us-ascii?Q?FlgJ8cQzsC6FGgc4YnPSWpUNYKJrUgT7LI8tDqMcL1oeA6US784RHEYTPTu3?=
 =?us-ascii?Q?gDbUj3vynN9LxM1mrJNtdKVQePQRQtjHh8Nt9IbNvVBu7+1jl4r5cthR3ST0?=
 =?us-ascii?Q?U5FGQicHxO+haAbZwfmtx51kM0vhDSdujye9gQNJUtHulprxyi5kUQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA6PR21MB4303.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rwwilZ96jqZqra4CverTxRV5OX9kHUYcfaDb7zjfSSam5vetYIeq9aNmkYJX?=
 =?us-ascii?Q?VdQKJjIHbotQuMAjFSXtX02qmLHP3y4vMaS2H+bSx/5MgWcgt62ihM8rLsYQ?=
 =?us-ascii?Q?kHx/vVlZbMLeQYCG2YT4GrIf3t/CmAMVL+ovWqnLOAkiEQ/M40XAse6sgjK9?=
 =?us-ascii?Q?WV2pWXEzs5laVt80N93Ih+PK9TdDuwZmiCsTt+AJ6lFhgIYRSIMheBemxd2i?=
 =?us-ascii?Q?A8G4mUh8ePAZk9atvMMvYKpaeG1NSJTeggM3KKmcoED7KOsKxiRZBxLX4ArJ?=
 =?us-ascii?Q?A6bMRo8DjIgrJ4Ucz7R1IqcSAJ5LnfT2H3PDgvSZ0biv4HciXuu8KR8I8Nrx?=
 =?us-ascii?Q?HL8KnVblEh2IgUUY8DhJsWfWgr08hqiMHmxMzH95EWS1YTOXfyDrJuFWzdLm?=
 =?us-ascii?Q?ZDXNX62ZKZM7FI/CRJ+b/6sHZKvG1nVEEyJ5CVDdVHl9mLUskqI2StqR3sIX?=
 =?us-ascii?Q?IxfFQt+h1Eq0WBq+0d5mEy27KWqN7sXr1aC2iJjEiP38KkZaEWFg+A7bySX/?=
 =?us-ascii?Q?bI+ceq1JOjqtooV/HqUVjuzXgdAQw7SXUBiVoJtOsL1cx0rbgIAGpoBwT0CH?=
 =?us-ascii?Q?oeE2To4/P+2LlCsvj7YpdO4hIOsYF9C0GG1Pbdz83XvBWaxzuLZiaekRmrLk?=
 =?us-ascii?Q?sLacXSdfuoXZNx0k/f11ae0QSc50dnYNSEfHXiRN6/4mXuJAUSZpuSr9xvXN?=
 =?us-ascii?Q?yIF7yWViUfwuORy20cVMrpQg+5iymrrHJkMtGo7UddxGV8S6IgKV/3q7Fshn?=
 =?us-ascii?Q?5IaU7wl+MRuHmpSpVB+2RE0gMOVZGavnijeasDlDW9ZQv2iD1c+jcMR/aH0T?=
 =?us-ascii?Q?FFhmb+IVmdIQo9XFpHjpajHMieRJ+JGpeRJQX3QcZh8VA5XcteMaEVH4uho9?=
 =?us-ascii?Q?bZl1PpWCeqKKjcyPaIL0wf3jKgI6BfAX0flAXztV8r7pRpwXFzWQL1vmFr0q?=
 =?us-ascii?Q?PnAFdylkxcazbznsGBjZa/3MTlRB6N6ShgMauF70YCiwhNxZbInpTPDJGZmM?=
 =?us-ascii?Q?6B7ZrhM7SieI6rhfvmus9XV4mxnc6CUFd7IpStlxcUjYFP5Xv1JhW4GZF6re?=
 =?us-ascii?Q?I/t5ilkaYm9RUbKY+iTRef9EbK/kHTvMySOPiRVlKBK8OGwus5Gz9r1ycA9E?=
 =?us-ascii?Q?sSsyq1vNjH2XVltr5BTVwKTAJRaveA3NdZhyrW/VKfPtg9h/OqOGN52r/W5Q?=
 =?us-ascii?Q?8vER2l9j4vwb61GWDX550XMbg7lMK2wgUCHm+Gk1/dC+PEutHWYkOb7HI2rr?=
 =?us-ascii?Q?svSadjfc39z6aatS5Rik5wdUxIpHtmYipp3owdl/Jj0kyBrOMuHb35qaazxC?=
 =?us-ascii?Q?+ppAcVQBT4FcQUg4S4p5bhaKqHKF3+Le7VIgenMdFivuLtgBhsU5Z25EcrrG?=
 =?us-ascii?Q?yyu0djmSfpcxhMkTNLiwER2iHKXf0Blw/hv4ZPZ0bBZDSFiW0D5moGlOjShW?=
 =?us-ascii?Q?7d9hA1s8Lqzqkjp8Lc53xgUlJXFuF8N5Ox47yGy2FUT/JJDTL5Zdk38lqHa8?=
 =?us-ascii?Q?jiG8jGf4dhFiigu+DufcqadtvQGjbgIKsHJG1Z4WDn4l1YVbQdaUUHlKY3ka?=
 =?us-ascii?Q?QVamRebm9wn/mp0EYhGy04PQAxli8Pnvw6mH2Bof9bw2/w/zJGTU5AAkeOhQ?=
 =?us-ascii?Q?xO6N2Ht5q9nvoXTEhec9dXexftmSGJe9xzYyd1NPJoQf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA6PR21MB4303.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2141181-9fa1-4c89-bae0-08dd97b9cfda
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 16:17:26.7941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2fVzaZda+TuTFPLft2id72YyQE+XKS1jqic6/PQeswZxESaXdcB4kW3kcvIZdhAII0XBEgoz1a39QuOep872Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR21MB3908

The error you are seeing indicates that the page being read has not been PV=
ALIDATEd.  Unfortunately, the #VC exception won't tell you which GPA is fai=
ling, so you'll have to do some debugging to figure out which access is cau=
sing a problem.  Because the exception occurs on a MOVS instruction, you ca=
n't even be sure whether the page validation error is occurring on the sour=
ce address or the destination address, though it's rather unlikely that the=
 validation error is occurring on a page owned by the SVSM itself.

I cannot guess why the GPA is not validated in this case.  The calling area=
 address is established by the SVSM when the CPU is created, so this specif=
ic SVSM call cannot be specifying a bad address (because it is not specifyi=
ng an address at all) - unless this SVSM call is the REMAP_CAA call.  I don=
't know whether it's possible that Linux is issuing a PVALIDATE request to =
the SVSM (remember that all PVALIDATE operations must be performed by the S=
VSM) to revoke page validation on this page.  I also don't know whether it'=
s possible that the specific flow you're looking at involves the VMM decidi=
ng to remove the physical page associated with the CAA's GPA and to replace=
 it later - this would result in a non-validated page being present in the =
address space.  If I were debugging this issue, I would try to get some deb=
ug traces of what PVALIDATE calls the SVSM is issuing and what page removal=
/insertion operations the VMM Is performing so you can narrow down how this=
 GPA is winding up in a non-validated state.  And of course, it's worth ver=
ifying that the GPA being accessed here is the one you actually intend, to =
see whether there is some other issue that is causing an incorrect access.

-Jon

-----Original Message-----
From: Gerd Hoffmann <kraxel@redhat.com>=20
Sent: Tuesday, May 20, 2025 6:14 AM
To: Jon Lange <jlange@microsoft.com>
Cc: Adam Dunlap <acdunlap@google.com>; coconut-svsm@lists.linux.dev; svsm-d=
evel@coconut-svsm.dev
Subject: Re: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocatio=
n

[You don't often get email from kraxel@redhat.com. Learn why this is import=
ant at https://aka.ms/LearnAboutSenderIdentification ]

On Mon, May 19, 2025 at 04:07:49PM +0000, Jon Lange wrote:
> Gerd wrote:
>
> > Well.  Linux relocates the CAA page, and I don't think there is some wa=
y for UEFI runtime services to use that.
> > First because UEFI can't figure the address of the Linux CAA page. =20
> > And second because linux wouldn't map the CAA page into the efi runtime=
 service sandbox anyway.
>
> This is why MSR C001_F000 is defined in the SVSM specification (see=20
> Section 4.2 - Post Boot).  UEFI runtime services can read that MSR,=20
> which will result in a #VC being delivered to Linux.  The Linux #VC=20
> handler should resolve the #VC by supplying the address of the CAA=20
> page.  This will enable UEFI runtime services to obtain the address of=20
> the Linux CAA page so it can make SVSM calls.
>
> It seems that Linux would have to map at least the #VC handler into=20
> the UEFI runtime sandbox because there is the potential for UEFI=20
> runtime services to cause other #VC exceptions, which must not be=20
> fatal to the execution of the UEFI runtime.  If Linux must do that,=20
> then it seems like a small additional step to map the CAA page into=20
> that sandbox as well.

Thanks for your hints.  Got that mostly working.

Mapping the #vc handler is not needed, I think on exceptions linux switches=
 to kernel context anyway.  The instruction emulation needed a fix though s=
o it goes fetch the faulting instruction from efi_mm context.  Mapping the =
CAA page into the sandbox (aka efi_mm context) is needed indeed.  It's done=
 already for the ghcs pages, so I added caa there.

Now svsm calls from uefi runtime actually land in svsm.  Progress!

Next problem is that svsm reading the caa page seems to fail.  The code doe=
sn't get past the calling_area.read() call in get_and_clear_caa_request_fla=
g(), and I have no idea why.  The linux kernel doing the same thing with th=
e same caa page works just fine.  And given that svsm uses its own page map=
ping for the caa page I think it should not matter whenever the call comes =
from linux kernel context or efi_mm context ...

debug log:

[SVSM] ERROR: #VC handling error: Insn(DecodeOpCode) [SVSM] ERROR: Panic on=
 CPU[0]! COCONUT-SVSM Version: a7c20912+ [SVSM] ERROR: Info: panicked at ke=
rnel/src/cpu/idt/svsm.rs:319:13:
Failed to handle #VC from kernel-mode at RIP 0xffffff800021faf8 code: 0x000=
0000000000404

stack trace:

(gdb) bt ctxt.frame.rsp
#0  0xffffff80001dea39 in svsm::debug::gdbstub::svsm_gdbstub::debug_break (=
) at kernel/src/debug/gdbstub.rs:173
#1  0xffffff8000129d13 in svsm::panic (info=3D0xfffffe008000b010) at kernel=
/src/svsm.rs:398
#2  0xffffff80002d65e0 in core::panicking::panic_fmt (fmt=3D...) at library=
/core/src/panicking.rs:75
#3  0xffffff8000195ee1 in svsm::cpu::idt::svsm::ex_handler_vmm_communicatio=
n (ctxt=3D0xfffffe008000b4f8, vector=3D29) at kernel/src/cpu/idt/svsm.rs:31=
9
#4  0xffffff80002db9cc in L64 ()
#5  0x0000000000000000 in ?? ()

context:

(gdb) print /x *ctxt
$3 =3D svsm::cpu::idt::common::X86ExceptionContext {ssp: 0x0, _padding: [0x=
0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0], regs: svsm::cpu::registers::X86GeneralRegs {r15: 0x0, r14: 0x0, r=
13: 0x0, r12: 0x0, r11: 0xfffffe008000bc90, r10: 0x8, r9: 0x40, r8: 0x1, rb=
p: 0xfffffe008000b610, rdi: 0xfffffe008000b670, rsi: 0xffffff0000002000, rd=
x: 0xfffffe008000b670, rcx: 0x8, rbx: 0x0, rax: 0xfffffe008000b698}, error_=
code: 0x404, frame: svsm::cpu::registers::X86InterruptFrame {rip: 0xffffff8=
00021faf8, cs: 0x8, flags: 0x10096, rsp: 0xfffffe008000b5b8, ss: 0x0}}

exception raised here:

(gdb) disas ctxt.frame.rip
Dump of assembler code for function _ZN4svsm2mm8guestmem10copy_bytes17hb74c=
e3bae1bdb91fE:
   0xffffff800021fad0 <+0>:     push   %rbp
   0xffffff800021fad1 <+1>:     mov    %rsp,%rbp
   0xffffff800021fad4 <+4>:     sub    $0x58,%rsp
   0xffffff800021fad8 <+8>:     mov    %rdx,-0x58(%rbp)
   0xffffff800021fadc <+12>:    mov    %rdi,%rax
   0xffffff800021fadf <+15>:    mov    -0x58(%rbp),%rdi
   0xffffff800021fae3 <+19>:    mov    %rax,-0x50(%rbp)
   0xffffff800021fae7 <+23>:    mov    %rax,-0x48(%rbp)
   0xffffff800021faeb <+27>:    mov    %rsi,-0x18(%rbp)
   0xffffff800021faef <+31>:    mov    %rdi,-0x10(%rbp)
   0xffffff800021faf3 <+35>:    mov    %rcx,-0x8(%rbp)
   0xffffff800021faf7 <+39>:    cld
   0xffffff800021faf8 <+40>:    rep movsb %ds:(%rsi),%es:(%rdi)

take care,
  Gerd

