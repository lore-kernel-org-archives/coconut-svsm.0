Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023098.outbound.protection.outlook.com [40.93.201.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B911E8342
	for <coconut-svsm@lists.linux.dev>; Thu, 14 Aug 2025 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755190089; cv=fail; b=N3mxHN/KZH8lXAaC3WVGeVRc/z0BS3+GBhvXo4ztqe5qoBJigLV0+ly1r16Efdcbbdrod+ZKmrawAAroU0kVtNhdVBqiJBBKzCTDF6/E8Yrp4b8JDzgz0ubNDIXTiSG0NzjorfT1uwhnfYMNRbG7fBh0tA9l5c+HGWyMYeRIEao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755190089; c=relaxed/simple;
	bh=CsVaiyelNoUfFW/ZkMfd83PdQkcPNDjbawrqjJxZRjE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n9xnratrDJRjlr6Hp6/Pw/rOii0gx67o7msFYY1lkZ/ZVy5A//Ny4jA+OlkFKTNRHngQGhMXtRKrgd4ZuC1m2+I8QAQ5/aUVl2f7um6Xip2JGt6b+vnXvVwbDnwUy48YWgbnHz01O0Hys0qGK7CAHGanAyw4VO7nEQX7+XMId9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=eOzrMenh; arc=fail smtp.client-ip=40.93.201.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="eOzrMenh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUtlkiZ51Cb85r1/hbk34fGXFafu4ID/WMU52tL3XABxSIiVlMs2UaCtihJkmyNOBPu5hPBGIJFtMMDKAqIu3RdyAvw+jVVxnYeQExqM80PX++D43QboBesABJVspCI06br3HousNE97tRsWvzIGdIbBRtNiOZG0oMPfQNA4BBJS0ccf8DyP1DpzoE6yz3xI879a8F8GhfoKoOg9EDdCvuWn2YNV3qkvnwG1mOUgPMAs9MhUOQiiaicSAxtBv9tHV+dazSx0rZd49GekdRY+7CgPMNbh5uD2jL7YQtg14Jw/JZ21G9Fe1gVh2eenIuFVtlz7cYFsvIkoPg+XGLpFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsVaiyelNoUfFW/ZkMfd83PdQkcPNDjbawrqjJxZRjE=;
 b=dPIPwqLx4iHVuXduYovYl/OBknv1Zc9/8ullisnmoZiU5+SroIXxExugqJmOmAHKY7txmu8Hiy6K0iUoeFyha3dGQTfT+jodk8WNkQ+KKRpz/ZDVgb+n/uZjccVlotx4zq3B99R1e/RoYpJ1uqPeb+pHeO2phQPiF/Qj4nDUReZX3LcGFprXNDF/JQphP7ZfhQ35QmVGpb6hLNGuPltgCTPjkrij0vLjYufnmp2v+kr4usqRyYvNUS28P02/W7ADaFWTxc9OuZm8BZBemUpdjl76n/rJJ4iZjNPSmDlHgi8xudBaO+TvnpKILBYXcbxrsDzhlVVUha6+hFiJx1nI8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsVaiyelNoUfFW/ZkMfd83PdQkcPNDjbawrqjJxZRjE=;
 b=eOzrMenhWVC2aWZvYNqYFhtP1XMtoq2tPglrlgFPipt2x+aSscY9ZhfCkg9m5Lc0AwYVRi7J5GxsTrj/Bs/407CHMXGOv64zYPZb6oHIC0F5NQCvS85wLUOVq+ehwyt+Gzm0DXpc4SUiJRbWg0z4MBpON3MbsDc8tpqUs1Rd7k8=
Received: from CH8PR21MB5222.namprd21.prod.outlook.com (2603:10b6:610:262::21)
 by CH8PR21MB5580.namprd21.prod.outlook.com (2603:10b6:610:276::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.9; Thu, 14 Aug
 2025 16:48:05 +0000
Received: from CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d]) by CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d%3]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 16:48:05 +0000
From: Jon Lange <jlange@microsoft.com>
To: Melody Wang <huibo.wang@amd.com>
CC: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
	=?utf-8?B?UsO2ZGVsLCBKw7ZyZw==?= <Joerg.Roedel@amd.com>, "Kaplan, David"
	<David.Kaplan@amd.com>, "coconut-svsm@lists.linux.dev"
	<coconut-svsm@lists.linux.dev>
Subject: RE: [EXTERNAL] Issue in handle_icr_write
Thread-Topic: [EXTERNAL] Issue in handle_icr_write
Thread-Index: AQHcDTCu+KGg9LhvZ0+eO2AD7m61ibRiW/rw
Date: Thu, 14 Aug 2025 16:48:05 +0000
Message-ID:
 <CH8PR21MB5222C4EFDED771DCDBEC910FCA35A@CH8PR21MB5222.namprd21.prod.outlook.com>
References: <cbbb95e6-37a4-43d3-9b93-db1703149bfe@amd.com>
In-Reply-To: <cbbb95e6-37a4-43d3-9b93-db1703149bfe@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d43693e5-6d50-4066-8db7-c2e7e657045e;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-08-14T16:47:53Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR21MB5222:EE_|CH8PR21MB5580:EE_
x-ms-office365-filtering-correlation-id: bf70fa7d-aba9-4199-14ec-08dddb525736
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MHZ0QmJQbFdlcU9yUXNzalJwTnE3TnRoREd5eUF1SHk2R05vb3hkU3FLMC92?=
 =?utf-8?B?OWJFdTRMWjhLSUZOSTdIRmtjaitSckdxOGpFOEt2QjBxQURKSGhlZ1pCTDdo?=
 =?utf-8?B?d09xb1UyWXNORGxyRjMySk5MdEI0SjZrSmxhckVCT2FtNnR5R2RoRXV4Vjk3?=
 =?utf-8?B?ZjFxRDh2M3g2dXRiVS9OcTZCTEJ0QlhGTzd5dUhtQkZSMGVkamJPMUN2M3E2?=
 =?utf-8?B?UTdkQVdXeWYzZHRMY0YwS2l0Q1gwQjFtVVA3OUFIbVhta0lhQVZJa0p3YzBS?=
 =?utf-8?B?QXFRdC9Cc0hHQzdJbjVXZ05Gd2xBVno5b25pTlZlK2M4OFpnTkxDUUd3S3Vl?=
 =?utf-8?B?dVRwTGxudHR5VGh2eU10TmRBYXprSU00Wm5FVjcwa2dTUnc5RjZkOElXS3V3?=
 =?utf-8?B?TEpaYWtRYWs1VTZMZ2I4dDZHanIyZi9PanBXcUhINGNFUjF5ZFg2cVB4WVI1?=
 =?utf-8?B?VElTWHcyaUVNNFV3Vk02TUVTTmpoZnJaN1dwbWJISHRRc2ZoTVA5eEdHcmwr?=
 =?utf-8?B?VHpjRW5kTWM3VEQ3RjBaaG42UExGR3lOOTliQUxXRk5ML242NWhsa09JUllv?=
 =?utf-8?B?aDNCaXVWa2F0aFlYVTJRQ2NJbzVHdnFjamJuT01xSGxMUnhKUHdXVnF1cmtR?=
 =?utf-8?B?Ui8yeGpJOUNNa2hCeGFwMHlXM3pxVXNmbTZJenhlb3JUaGo4Y1FORWpVcnhh?=
 =?utf-8?B?SkNPVzQ0Y05SOEtQdGhvRFNSNkMycXdiYW5LSjAzbjJrSjZCYmx6bDBhWGY2?=
 =?utf-8?B?dGUwQU9nb0IxVFdlUUNsbFNXd2dCM3dLVDlUUjBzaGRYUzNaNkVmSkRWdzdk?=
 =?utf-8?B?NFlZcDlUakZLTi9uTTB1VVVHL0lVK3FQTzVRTXcxb2hNTGJxelYwdjlLM3NJ?=
 =?utf-8?B?VHBPL2pOc1ZnaU9lWk5jZThKOXh4TnpjdURuSm9TUDhSdGxHeGVHQnBwcFlL?=
 =?utf-8?B?R2pnaXN0T2puTzAxYkRzWmxtL29WeDVPb0xyRGpDRlBReWlvK08xNVdiRHl3?=
 =?utf-8?B?YjhEUTVXSTVJU3dsRWovSEI4Vm9vZkFvMmgzYnV2a2pSbVQ5UGlDa2oxUUwy?=
 =?utf-8?B?MTErRmhCU2ZvVzNhV1h1U1lJTjRzQUJMeFpqSmRiRnVxd3ZUZVRrbDBBc0lw?=
 =?utf-8?B?NTRvYkIxejQ4S1JnS3lpOTZqdnh0Wk4rd25mR0NXWXZpbzdoemxMcmlRWUtm?=
 =?utf-8?B?eDlPMXFKV0NvVUpLWStqTnlOODkrVm50TGNWTlQrWmswa1RjU2lqcnQvcCt2?=
 =?utf-8?B?MCt3Njc0VzEvRENRM2QwWGt1V05rREdFd01zc2JSZExyenJYVG0yR0p3VjEz?=
 =?utf-8?B?aHVodEhCUy9INHp4eW5MUnBEd0dUL0FReWlyYUZ2aDVaY1NNVFRCYzRQcHZJ?=
 =?utf-8?B?QnpGNTJFZGM3cVl3TmFOaWlZdXdoenJDVU4zQ1Vibm14R0NNS0lIWk9LcEFB?=
 =?utf-8?B?Z1JBc1NqcWFFNklBazBnN3NCY0Z4NC9xVmJMdkV3b3A5WlZKcE1ZOStSMjJt?=
 =?utf-8?B?azNzSC9xV2FRcmhoZmZjNk1VNW0zUGluMTNZRXllenhlVlVhTzU2TjdZZTFY?=
 =?utf-8?B?T0t1M2lzZzFVbCt1Z0N6dExJUHJwRkNjUjBVNWV0Qm9lTlo3Tm1tWnZJb3Y0?=
 =?utf-8?B?VFB0ZTlUdGFuRmZYYnUxcjF3aVFjbm5mNVBkNVFycnhOK2ZNUTA0WnZ1Mlpp?=
 =?utf-8?B?N0JrRkNhQzRUSmwxYWFzbjBjYjkyZGU5bTBPS3lRTWljU3pjZXU4T0FhK3hL?=
 =?utf-8?B?NjlDQmJBUm83ckV4T3Q4ZzArMXpOdVVmRThtaHZyTko3ZWlsTlhicmxHZWxP?=
 =?utf-8?B?dGdmUEhUKzh6UTFPQkJQcU92S2ZQUlVGa29RWTJuUFcvR0VuMFVWbnhCa3N5?=
 =?utf-8?B?eitDYk9BRDUwRXJKcGVkcmF5M3MzV0x2KytxMmh3KzFGYkVZeS8wMXVNSkdE?=
 =?utf-8?B?UHBKdG5FS3ZUR3ZkeEs4dndENkN3VEFaaVgzZ1JTbG9zMXcweExQR3RKMk5l?=
 =?utf-8?B?VzZrQTFUbnlnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR21MB5222.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFJ2MVdtZU9jeHFCSzk4NDRITy90YkNtRm44MWFLUlcwKzVkMkVtQkppTzc2?=
 =?utf-8?B?NjdDZzlORUF2WEhreTlEdnhTdG4vcDAxVGUyUXROVVcyKzdPbEVHVkQ1R3M4?=
 =?utf-8?B?RElBZSttRFJRTWhYUllYZVBTWnBBVUJzaHFwT1hteEZGbHVvQmRpVkE4UWdG?=
 =?utf-8?B?cmdVek9SUU4yd1VXQ25mRlB6bkh0K0ZnUmMxdTZPTWpnejY3OXFFUCtEeVRo?=
 =?utf-8?B?TE1GUjZxeDZiNHJITFMxL2Znb3loYmhhckw3cG5Kb1A3VzBJR1B5aktqNVZU?=
 =?utf-8?B?US93blloZU9JbG9TUjJ0THpNTHM3eW40UkYvblVoazFXZTV4MEcwUjRWdXNR?=
 =?utf-8?B?NS9WUVV4T1BHMzFKUk1Zb08zem1mVTV6SXhMMENWNG5Ra2hiSkN5TnlZS2c3?=
 =?utf-8?B?YWxpRmhPVUxhVGE0NlZNQVJ2K3ZQREZKNkRyTG9MdTZGSHQzNjVXVFAzMEZV?=
 =?utf-8?B?c2JSTndDOGRrdVFXcklpN2pNRU9TdzFUN2g4dUtBR1RyWVhZdWlyaXE2Ui9v?=
 =?utf-8?B?Vm9Ca0RzTEpndUIyTklmS2xNcUZPWDZwTWY3Y0Yzd21DcGZXVXZQZlZQZ29s?=
 =?utf-8?B?KzdoZ3kxTXYrVHRzbEJ2ODk2dkdjZm9vOWJzVzR0VUNWTmppalBqU2pESG9k?=
 =?utf-8?B?VUMxVWllcG1XdFIvZU42YVl0b0V4aUpkeXdnZ0w0bm5LTmxZdnhwcjBzRDM1?=
 =?utf-8?B?N2k4Sm9pT1JoZzBueDNNQWd4THgvMkl0UFdtZUE5b2g4T2lKKzVvUmJDOXBS?=
 =?utf-8?B?RSs3c2k3WHpPbHAyaE9qTmFlS2drVCtTaExKWFBJcjIreG1JY3RJVUtMTUZC?=
 =?utf-8?B?dHJwcm5rV3Bsb3phN0h6WG5NL3g3SEF3dWRTc3dXVXlvYWMvZEJoQnQyTWJE?=
 =?utf-8?B?ZjNkeldrRjAwWUZsNFBQRS9rTzVGRTk3eWN3bG9SSU5wRWt3YVBQcURnbkhv?=
 =?utf-8?B?dnhURWl3bEsvVVM0MDI5TXpYblhEYTdPZU5XcFZKMEtlc01ibkErQUJ5UnV6?=
 =?utf-8?B?SVNPOFZrSWRxZ1VjZjQ4azlaKzJ4Rzc0RzNMcng3UkZUdmdqdlkzNE9iQS9X?=
 =?utf-8?B?ODhwV3NMbTFsZGNyTjN2dmtuUWFpV0ZwaUVIKzNPLzJjc0pWOWpuVzNwU3ow?=
 =?utf-8?B?RnlGMzhFMVdzTEtqaThTRG1yTU00TmlXQUEzaktaTDZFUWF0QnpCY2FYWUN2?=
 =?utf-8?B?djYyRnByL2NOWGxYV0s4VS9QOW9IdmJUemdCNkUzZzExN1J3bmE0MFVrNzU2?=
 =?utf-8?B?OENhNHJycXFHTnhXUUdJek5qMFE0WGdiTHpQYWlZYVVRMFBFREJrdlBCb1hR?=
 =?utf-8?B?ZXZTQlk5eWJ0MTcrT2hHeHRocitLblR5dWVmVHJ4bVlPVmJRQmpRMHlCWWNw?=
 =?utf-8?B?YjFSak10akRWYTMvbGRGSy9IK1dGcG5OWjZxdXNjRy8xTU0ydVR1ZDM1TVpO?=
 =?utf-8?B?VXFUWFZOdnpEK1piclRub21ONHpDQnluRDNzckZ1UGtrSld3TU82L3hiMGVu?=
 =?utf-8?B?VW5yQURkQ21jbjUxRXBOWXFsQ0dtZjNWWjdxM1pqMXljR29KTVlMZmc5cllV?=
 =?utf-8?B?c1phQXJFOXpuNlBTNks5QnRBTTVNNzUvNjNCelVTRDhFK0xNZFRDdklwT2xV?=
 =?utf-8?B?RzhzRTJ0NFY1bkN5QlcwSFFnbWdYbFhUZjRZcktHZVJCWC8wSy8weVF4aFQw?=
 =?utf-8?B?WERuQWVGWDdkaDlhSW1adS9GTVlKaGt3YzNHMXlEY0NNMVA0ZWJ0TTh5OEZ1?=
 =?utf-8?B?bTdkYnZIYTJBcFlnQi9jK2liK1czVVZUMUUvZHhSOHdteDY1TTZGa0U5VTlR?=
 =?utf-8?B?T1JCREFqb1kyQ0V2ZGNaY1RHdksya1VMOUNDVTBFeUkzRDBGMEpUeGdVMTNo?=
 =?utf-8?B?Uk5INS9Kdzd2aTZ2V1JaOFVxOWJKcTFRVHlKaVpUaFZOL0pXY2FDckgxVlRh?=
 =?utf-8?B?ZFl5VElYSW5Uei9DZ2dhaklaaHY2Q21ueVF2TFFsdXlzUVNYdUxtcGJORzE1?=
 =?utf-8?B?MEJ0Y3BHK3ZPK3Y1TWlKWUNxdnd3RVhsSHFnWm1LQmoxYVFXV0FJaFZ0dkxC?=
 =?utf-8?B?bnl6RTRSWXdBQUhtZjM0Z1pCSUVFOStzM1ZhZkdsaW5XNkJkU09XMDljTEtt?=
 =?utf-8?B?aVZ0R3ZLRW8wd01DeTkrT3ErNlUvTkp4RXRleEJnaExtR2d3aVdnQis3d1du?=
 =?utf-8?Q?lXsWxV/uyEFwilOdINMVYmmuyJICXYhu6kYd4NS7meqT?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bf70fa7d-aba9-4199-14ec-08dddb525736
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 16:48:05.3016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LF8NGmsfWmoiNCn+zL4zZSaLkCDcAFDxQp1sz5AN9+OqBNJ7MZn98Ns8y49NfPQUAbqhXGb2XGMqfnsj7JivEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR21MB5580

SSB0aGluayBpdCB3b3VsZCBiZSByZWFzb25hYmxlIHRvIHJlbW92ZSB0aG9zZSBjaGVja3MuDQoN
Ci1Kb24NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1lbG9keSBXYW5nIDxo
dWliby53YW5nQGFtZC5jb20+IA0KU2VudDogVGh1cnNkYXksIEF1Z3VzdCAxNCwgMjAyNSA4OjMz
IEFNDQpUbzogSm9uIExhbmdlIDxqbGFuZ2VAbWljcm9zb2Z0LmNvbT4NCkNjOiBMZW5kYWNreSwg
VGhvbWFzIDxUaG9tYXMuTGVuZGFja3lAYW1kLmNvbT47IFLDtmRlbCwgSsO2cmcgPEpvZXJnLlJv
ZWRlbEBhbWQuY29tPjsgS2FwbGFuLCBEYXZpZCA8RGF2aWQuS2FwbGFuQGFtZC5jb20+OyBjb2Nv
bnV0LXN2c21AbGlzdHMubGludXguZGV2DQpTdWJqZWN0OiBbRVhURVJOQUxdIElzc3VlIGluIGhh
bmRsZV9pY3Jfd3JpdGUNCg0KSGkgSm9uLA0KDQpJIGhhdmUgYmVlbiB3b3JraW5nIG9uIHRoZSBQ
b0Mgb2YgQWx0ZXJuYXRlIEluamVjdGlvbiwgSSBmb3VuZCB0aGVyZSBzZWVtcyB0byBiZSBzb21l
d2hhdCBvZiBhIHByb2JsZW0gaW4gaGFuZGxlX2ljcl93cml0ZToNCg0KRm9yIHRoZSBNZXNzYWdl
IFR5cGUgPT0gRml4ZWQgeW91IGVuZm9yY2UNCg0KICAgICB0cmlnZ2VyIG1vZGUgPT0gMCAoZWRn
ZSB0cmlnZ2VyZWQpDQogICAgIGFuZA0KICAgICBhc3NlcnQgPT0gMQ0KDQpJbiBwcmFjdGljZSwg
YWN0dWFsbHksIHRob3NlIGJpdHMgYXJlIGxhcmdlbHkgaWdub3JlZC4NCg0KVGhlIEludGVsIFNE
TSBzYXlzOg0KDQoiTGV2ZWw6DQoNCkZvciB0aGUgSU5JVCBsZXZlbCBkZS1hc3NlcnQgZGVsaXZl
cnkgbW9kZSB0aGlzIGZsYWcgbXVzdCBiZSBzZXQgdG8gMDsgZm9yIGFsbCBvdGhlciBkZWxpdmVy
eSBtb2RlcyBpdCBtdXN0IGJlIHNldCB0byAxLiAoVGhpcyBmbGFnIGhhcyBubyBtZWFuaW5nIGlu
IFBlbnRpdW0gNCBhbmQgSW50ZWwgWGVvbiBwcm9jZXNzb3JzLCBhbmQgd2lsbCBhbHdheXMgYmUg
aXNzdWVkIGFzIGEgMS4pIg0KDQouLi4NCg0KVHJpZ2dlciBtb2RlOg0KDQpTZWxlY3RzIHRoZSB0
cmlnZ2VyIG1vZGUgd2hlbiB1c2luZyB0aGUgSU5JVCBsZXZlbCBkZS1hc3NlcnQgZGVsaXZlcnkN
Cm1vZGU6IGVkZ2UgKDApIG9yIGxldmVsICgxKS4gSXQgaXMgaWdub3JlZCBmb3IgYWxsIG90aGVy
IGRlbGl2ZXJ5IG1vZGVzLiANCihUaGlzIGZsYWcgaGFzIG5vIG1lYW5pbmcgaW4gUGVudGl1bSA0
IGFuZCBJbnRlbCBYZW9uIHByb2Nlc3NvcnMsIGFuZCB3aWxsIGFsd2F5cyBiZSBpc3N1ZWQgYXMg
YSAwLiINCg0KQmFzaWNhbGx5LCB0aGUgaHcgaWdub3JlcyB0aG9zZSBiaXRzIGFuZCB0aGlzIGlz
IGhvdyBMaW51eCBoYXMgYmVlbiBkb2luZyBpdCBzaW5jZSBmb3JldmVyLg0KDQpFeGFtcGxlIGZy
b20gbWUgdHJhY2luZyBhIExpbnV4IGd1ZXN0Og0KDQpbU1ZTTV0gd3JpdGVfcmVnaXN0ZXI6IDB4
ODMwOiAweDI4DQoNClRoYXQncyBvbmx5IHRoZSBpbnRlcnJ1cHQgdmVjdG9yIGFuZCBuZWl0aGVy
IG9mIHRob3NlIHR3byBiaXRzIGFyZSBzZXQuDQoNClNvIEknbSB0aGlua2luZyB3ZSBzaG91bGQg
c2ltcGx5IHJlbW92ZSB0aG9zZSBjaGVja3MuDQoNCldoYXQgZG8geW91IHRoaW5rIGFib3V0IGl0
Pw0KDQpmbiBoYW5kbGVfaWNyX3dyaXRlKCZtdXQgc2VsZiwgdmFsdWU6IHU2NCkgLT4gUmVzdWx0
PCgpLCBTdnNtRXJyb3I+IHsNCiAgICAgICAgIGxldCBpY3IgPSBBcGljSWNyOjpmcm9tKHZhbHVl
KTsNCg0KICAgICAgICAgLy8gVmVyaWZ5IHRoYXQgdGhpcyBtZXNzYWdlIHR5cGUgaXMgc3VwcG9y
dGVkLg0KICAgICAgICAgbGV0IHZhbGlkX3R5cGUgPSBtYXRjaCBpY3IubWVzc2FnZV90eXBlKCkg
ew0KICAgICAgICAgICAgIEljck1lc3NhZ2VUeXBlOjpGaXhlZCA9PiB7DQogICAgICAgICAgICAg
ICAgIC8vIE9ubHkgYXNzZXJ0ZWQgZWRnZS10cmlnZ2VyZWQgaW50ZXJydXB0cyBjYW4gYmUgaGFu
ZGxlZC4NCiAgICAgICAgICAgICAgICAgIWljci50cmlnZ2VyX21vZGUoKSAmJiBpY3IuYXNzZXJ0
KCkNCiAgICAgICAgICAgICB9DQogICAgICAgICAgICAgSWNyTWVzc2FnZVR5cGU6Ok5taSA9PiB0
cnVlLA0KICAgICAgICAgICAgIF8gPT4gZmFsc2UsDQogICAgICAgICB9Ow0KDQogICAgICAgICBp
ZiAhdmFsaWRfdHlwZSB7DQogICAgICAgICAgICAgcmV0dXJuIEVycihTdnNtRXJyb3I6OkFwaWMo
RW11bGF0aW9uKSk7DQogICAgICAgICB9DQoNCiAgICAgICAgIHNlbGYuc2VuZF9pcGkoaWNyKTsN
Cg0KICAgICAgICAgT2soKCkpDQogICAgIH0NCg0KDQotLQ0KVGhhbmtzLA0KTWVsb2R5DQoNCg==
