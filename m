Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6732376EB;
	Mon,  6 Oct 2025 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759776423; cv=fail; b=qlBaa6wQwwfMgLqmNKhkFGE+kLRd2b2uQauMLcrmCwNjuPS2ufsxGFlJfhJNFVxXxQSQ51GtAFE4M1pJ33KKsEV6EZ7ZukBT0p0Z+fGaoFf9fbofs61om55IY0LIF8Zy3YYNFnOGaWKGHrBXC1LJUIErwkRXH9dqbTdIPFtrJk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759776423; c=relaxed/simple;
	bh=eC5UQO0pJWqc2w8ALWj8j2YNhdY5W2XpGj0pEWPcsa8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XqyzzfygpB0hFPW+MZHaMTPs2gS1YZfwovRk5cW+thAWOKJfjiJZChCnvAoZDijF57tJ3Hh7vbuVmVMJRpf051j5SctJUzzt/xsAtQdpck/fnuKocEYrYfOhmI1OQ2rHo+bh7h0OrkNMfB1ch1M8ppDUBkO/g9h0khJVjWzViu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qfXGLUv0; arc=fail smtp.client-ip=40.93.196.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qfXGLUv0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1G5lyTuldqCl+HbOcUHTPZDxSFAH0hWUF4g/GE4PcN5gy0OG9ItFe9g8i0ABWh9cxeDPtInfxydkyBhDdEAhgrQrHbkQ9xGztkeneK/vhnRFJog6iUz+dTFdkIAyI1mmdy9zHRIrZJFfcuHSMcAhK9Z4snCD890YZDaQ/QO52NdGI9Oek+4i1pEGflT2lMq48OmtXmSVu/2Bn4A9bGbYDNmp6zk1Ua/r53w2s+NbzusG/VuxMccmE5M7t+8OCMBCBywdN/+vXnw4Cw8ts6HkjvD5/G57nUyOeq8deoJI4V87o5/YAx6vh3KxSI/CxOiUTnqahMBYUypJG/8hLHP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eC5UQO0pJWqc2w8ALWj8j2YNhdY5W2XpGj0pEWPcsa8=;
 b=V6jxckjAEL0hHE6Ga1RWv9g+rbXSf6Px5LdmqoclXIPi7lPp9lioS9OKXHHtyTzrjL2NMBF1Ae9sVpvRqrs2AVwQt4h1Na+8/TTwegXyPRwFoZZEARJrtAqSEzrc0KtVJmICaKaw8c+/yEhbjK+ahzwsfTk4z4+MgPh78CiWebXM8qCXuvFRBloKREub6icZP6HjNvKBNXgh8SES74MLNBJJq0zOERyapbd65si9MA6NO69Nso9aNSc0e9AqlWybowgcM8aHdHOi0wPtI36EP2AH5FC4qbsTXiFaSxVsy9ef40uWruEaef4d/y/BGvaIasb8eUlcCTvE8KdeGeJbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eC5UQO0pJWqc2w8ALWj8j2YNhdY5W2XpGj0pEWPcsa8=;
 b=qfXGLUv0BH+JPvQpyqwHmDm2N+J+9Iyrv/Fdygq0xubeE6FadCVowyrVndu2av+3WvdwQcgfhOHwGoQGdlGED42URWytafqtuo1iLyoZDTOKU2HvMH+ZHAwQ47QP2Y01A+2UGXTB5LjsvX4V29VGRsdec3a9h7HxFLstAp5flgc=
Received: from CH2PR12MB5516.namprd12.prod.outlook.com (2603:10b6:610:6b::23)
 by PH0PR12MB7488.namprd12.prod.outlook.com (2603:10b6:510:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 18:46:50 +0000
Received: from CH2PR12MB5516.namprd12.prod.outlook.com
 ([fe80::80c2:1d4f:4a3b:73e]) by CH2PR12MB5516.namprd12.prod.outlook.com
 ([fe80::80c2:1d4f:4a3b:73e%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 18:46:50 +0000
From: "Relph, Richard" <Richard.Relph@amd.com>
To: Nicolai Stange <nstange@suse.de>
CC: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
	"coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Jon Lange
	<jlange@microsoft.com>, "kraxel@redhat.com" <kraxel@redhat.com>, "Rodel,
 Jorg" <Joerg.Roedel@amd.com>, "Wang, Huibo" <Huibo.Wang@amd.com>, James
 Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: SVSM draft specification (v1.01 draft #3)
Thread-Topic: SVSM draft specification (v1.01 draft #3)
Thread-Index: AQHcNH8F1L5cqzyGJ0C7KbMVv+DAp7Sx2I5PgANdxACAABpKqIAAKX4A
Date: Mon, 6 Oct 2025 18:46:49 +0000
Message-ID: <E93D874E-27CE-4C09-BED9-983E2FB55B71@amd.com>
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com>
 <523D9120-05D9-41D7-98CA-FD6DBF199748@amd.com> <877bx8knrg.fsf@>
In-Reply-To: <877bx8knrg.fsf@>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5516:EE_|PH0PR12MB7488:EE_
x-ms-office365-filtering-correlation-id: 3d47d368-8cbe-4a68-6394-08de0508b5b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MXZWbGJzOE53NlFsZFVqcXkzMTBRUWxYUEowOTMwcmF1Y1pPaFZ3eGdPN2dt?=
 =?utf-8?B?Wmk0WWcybVdUOFpuMnNCZEVDbnRHb1BFTGxqNGoxalNlVXBqWHpZRGUyTFZ1?=
 =?utf-8?B?YisvYmFjNndxdk9tVFRLTFg2T3JiK1FSbEp6bmx6bWt6KzM4bndGaWJnVkdl?=
 =?utf-8?B?MUl1ak1weGQ2OG5lM1J0YVpOTXEwdzQ1U3IzMHBsRFZIOTZGMVJhZHg5RGdZ?=
 =?utf-8?B?MzFlRFJyQitsaEJhc2xYZTBsTFZyU3JnY3ZDSzJxejh2RWV5bmhNT2g4RFdQ?=
 =?utf-8?B?R09GWmY4SWlwM3VrcURqaHNNcWx1SEZhaGdSTmZpRXZnNllmWXF0Vld3Z2lh?=
 =?utf-8?B?OTZsVW04RUJWOVNSQ0pQQ09Ua0NDa3pZY1pBcVBjVkdpS0ZFZ0pGb0hxb3lK?=
 =?utf-8?B?RVNucHVJQkdWZURYa1RYbzM2NWpQMjBNUC8xRjhIR2RFc011VzhjcnB0aEQx?=
 =?utf-8?B?aCtxN1QzcGlIZVZYcWEwTGFzeVpwY0hqUFJqNVV2Y2FWdDBuRG9aMGNmSU9H?=
 =?utf-8?B?eDRQbWVwQUo2UVNXWlczaXpvSEZYb21IYncxTXZ1QUo4OTNqZFBLRlZ1S2o5?=
 =?utf-8?B?dFpPczZnbTFmUnRFT3ROTUtRT3ZYdjR3YkFXVnUva3JuOHNrNmduUjNMaHZ3?=
 =?utf-8?B?alBZZXpBbVNtV3VtcDk1Zm02WCswR3hoTk1xb3czSVhpeC9HK1cxVm84VUFu?=
 =?utf-8?B?QVBob1VBUWhDY1NpOUxRRXQyUjluQkdkamdGZzFhUS8vQ1RIbkhLTWZ4ZllF?=
 =?utf-8?B?MHBadGZ5bEwvb3ZhUGNudlFybzdyK1RMT09kR0ZmWjFRYVQ5ZUF5NHl3Q054?=
 =?utf-8?B?MlIwL3NZQnJpSno5b09hSzJaMW8zeitwUlBhaXBiQitzQ3ZNQ29WOWZtanQz?=
 =?utf-8?B?UGZscG91Ti84bWRUK2tkelJQUUR4OGRuemhwMVdkcE5kRjZweGhNMkVzc2ts?=
 =?utf-8?B?bXdKYmEwc2owV1NwVnhGTTNBNzFqWjh2NVp1bHBscHVtVFQyVmM1ditNZXdU?=
 =?utf-8?B?YkVXQzFHVlc0NHc1OWdPSXhxRnZsNjFXN00rMjlsbVdNM1Yvd2tjMHFYUG52?=
 =?utf-8?B?a3E4eDZmNzEyMG9OajAyY2x1RnNyRUlLQ21JbHlFQUwrQnZPaHlCekY4Ym1r?=
 =?utf-8?B?ZVdack9FajRHUUl0NmYzUmdqckN0RjQwc3ZaWk5NZWViL0R4ZS8rRG5PKzVY?=
 =?utf-8?B?bFpYOTdBQjlRM3V3WFlBZHR5Q0Q0TWVqNDhMU2tBcjZCSEZEU1ppMjhzRmhl?=
 =?utf-8?B?RHVwOUppb0FMbCszNVVQNDJ4UUtVOG9YZHdJbmpOdFNIY0h6N2IzNGVKQyt2?=
 =?utf-8?B?MC9yTitNenExbDZoT2FkalJpTVhISi9IbEt6SUd0d2dNb2tIR0QvVWpmZ0lQ?=
 =?utf-8?B?ZDJLbXpIZkJMS3c3OGQ2TTlFTjQ0M3RwWWdOemljTGhCb2hwT0FWVmdIdEpH?=
 =?utf-8?B?LzAyMFhXc3UvZTh5TWYxSzdoenNvWVZjOUU4N3gwNVliOGJWa0NKL3JsYXNv?=
 =?utf-8?B?NEJRYlN3WmhSU1B2OERwUDR1NDV1bmhTTWo2WkdvMlBLZ0ZQckFWYWM4d29h?=
 =?utf-8?B?VFZabjY1Mkg5SmpBN2czRUF6YjBHdG0wNTFucUFkZTZCY1pVWVFydVJ0MTl1?=
 =?utf-8?B?UWx6NXpZTDJkbHYyQlkyd09BWS9Wa2FTMmhOOHlaSGtDVUNkVlIyVkgxNmJF?=
 =?utf-8?B?VzJHNjd4Q2UrOFF0S1JNV2JPbjlLdE9ObnR4ZE9GSEhxeGg5dlhHVCtHVDdR?=
 =?utf-8?B?MDlCT2dUck15OGUzeEpnam0xVzI5M3FSRjBCdFZ2TDE2SGZ2RFRHNWpSeUpM?=
 =?utf-8?B?RDh6bC9KeVRpeGVRTjltK2k4NG1OMUJJRFJMZkVJdDFES3hPSmpFQktHWkl4?=
 =?utf-8?B?OE1UMk1wRnlpRCtYYWxGazViSWRKUWcyRVJkWDRUT2M1dEE5bk1QK3RQaERN?=
 =?utf-8?B?czBMcWJ0TWQrYVVjMUU2WU1aYVVxOGVFV21SYlg1YXlwOUtjbWVGSGtaZ25w?=
 =?utf-8?B?Q04xeDQrWmJDTVBRS0s4emZpOHUyclMxaS9VeDdOKzNYMHYyS2FpRCtjM3Iv?=
 =?utf-8?Q?/COb6z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB5516.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFRXTmRLaU1wV2VJSkxGUC8xVFVwbFF1WVlrY3hETkZlZktJbjY0TGpxWENi?=
 =?utf-8?B?T3BXRkFXQkQwNm5JMDQ4bDFEc21HRmdSSUFaNlJmUmFsbWovL3k4bEx5RUU3?=
 =?utf-8?B?TGhTczJLQkhRUmRhekc0VWt6RVpHQXRkdkNjMnVod0owM3ExZGhQQi9veDlL?=
 =?utf-8?B?aU9nYjdIbFNBaU4wenkxcmtLZ3Y5Ni9FL2pVQ3BaRjF6LzFYSWZIK2V3MHdy?=
 =?utf-8?B?UVVlN1dKOUowSC84RVFERVJocW5VS2ZJeTBJM1R4eVo2bHBLNG5SNHBCMEZu?=
 =?utf-8?B?aUFrZCtJa2JTRk9YOVJjVmREUlhvd0Noc1NuUXU2eW1vU2dvbHFQTExqS0JM?=
 =?utf-8?B?V1hrVXdWR1BLYmRndmdPZzV3dFN5S3k0b29GYmVMSlY1ZmJTL253R00zOUwr?=
 =?utf-8?B?V1l6V29xdWQvUkFxL3pwV2sxK3VNZXpkbjZyeDBBUXFyYTkwcjRZdmZvVFpR?=
 =?utf-8?B?YTEyZCt5R2tXVWFXc1lqSlhya2YwN1h1U040QnZhcEp1dC92cWt2OFNXMCtS?=
 =?utf-8?B?RzNDdElJV0FnUW9BOVBvUVpCWTZkeG1HdDFoYjZPWWVGWWpqSkhaamlqRVZl?=
 =?utf-8?B?cGFtckVVK2hyVlMyTHVGdEorSVFQZEwrLzN6Y1Y1N1JHdjQwczlYZlErQWVl?=
 =?utf-8?B?STIvQkduUTFEN3ZuVGk0TVpzRzFlQ2pERzVrYk00bFA2LzBRK2lpUzVCN0l2?=
 =?utf-8?B?d2dCK095ZC9xS2NDM3BOV2pEc2lpdWhadktXWENFYUhWN1kvTnlpMkxtRUdX?=
 =?utf-8?B?S2tnbEJRQnQwSjlBQzJOT2lEM2lnL3dJUVUzT0tuN1pGWm1ndUMvT09qa0F5?=
 =?utf-8?B?RmlkNmZtT3Fjc1RJei9Ca2ZYdVdsOWJPWEVEVFZ0d2JJWnMvbFArNitCM3Rk?=
 =?utf-8?B?aDNvakpYNHo5V0plL21tc0VYQjJVVWZzUEhPZXBDNS9BZTE0YUNjWkRFRHNw?=
 =?utf-8?B?T29DTjEzQjNNaVJqNW1oUFZNWVBNbnRjalNwSytoYmZ6OU9yU1lvWXZoYy9o?=
 =?utf-8?B?blNrUWdhZFdXNEEwUUdONzNYREljVFRCejRNdTQ3K3phNmJDa3phdHJOOTdY?=
 =?utf-8?B?RDJLSzBTR0hIcVBETnpaTE1WTkF5TzF6VXcwRkZhVkh4YUFmdlZUSzQ1R2VW?=
 =?utf-8?B?MnBRWWRCN1VUQ2pLTUZJcFpoN1AwRUVXRTNyRVpBdG40Rmg2dzcxWTNBQlA3?=
 =?utf-8?B?WFI0ME1mYmhkMWYyUTUzKzdnOVBRU3poY2YxVFVNVkdwT1Bwbys2YWo3SDJU?=
 =?utf-8?B?SkZGRlo2UkJvM004VVBZOFJTSW5WZUowQ3Y3VW5RdVRXeEh1RzNBMWgxTWhC?=
 =?utf-8?B?QndNMU9vRWg3ays5UjBLUkZJK1YvRU5IdFdyeU5sdExIZ3pPdXA3WGZ0dWhH?=
 =?utf-8?B?VmlDZEFwTzU2ckFIa1laRGlGRVJiRmtmZzJNeHBXL01DSy8ySUNaN2x4Nmhv?=
 =?utf-8?B?TjZERllCVUo3a3dXV1VPdHFLSVAzcSs3SXFPL3hlbU1obFQ5ajFHOEttblBZ?=
 =?utf-8?B?bmR6SURscUNaNEkwUHg1QWlHMHZCVnFlaVpGTzJXYmx4dUdXaGNBMWtxdzVO?=
 =?utf-8?B?bUhCWU4zMEo2UHptTWNqejU5UGhpd2xBa0RPbVkvTkNsMk85ZG9SM0JldDNR?=
 =?utf-8?B?cjFISUhSdzltanZWNFFUZHBIbmR0aVJBU3ZyMEdpSFBQN2s0Y0JacU5odmpE?=
 =?utf-8?B?c0did2pkem93S28xTWRXS3B3cDMvZFJRSjZ1V25jVFZxdnFnc0dXV2NFWWhQ?=
 =?utf-8?B?Mzl6T1psNW1VK2Qzb0Z5aS9XQWdIT05vUE9RcVh3T3U1aTJpNmpLcENpVkto?=
 =?utf-8?B?c1hpUmpRMkNidW5lc2dhZzlsbFJEMUs0elppeWtERExMbWp1emxzZEorVVdj?=
 =?utf-8?B?K2UwYlVuYWZWV1lNRmFlUzh1eGpVcUdQQjlUZGl2SHhqeDFiKzRtZ3hlNDYx?=
 =?utf-8?B?VWk3dVJUVjIzdHI2akpDWDBvLy9pTVpjT09xYkpRd21JR2wvQ1BxWm1PWnZB?=
 =?utf-8?B?TGt5bms4cFFJYlFzVmlWS2lJbmVHTUxjY0daL1JSdUpBS2xMZlFXdFNPQWg0?=
 =?utf-8?B?MW9ZWnhpeXA4Yk1pakl6ZlZ2RU40cDZpOWZEVzNmNGg5RzB5cDZ5T3JuUlBO?=
 =?utf-8?Q?vS3lgNEzncj/snJSTck1+UgPw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D105195638B7164EB6FD7139758C418A@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d47d368-8cbe-4a68-6394-08de0508b5b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 18:46:49.9271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kOmgQT65vOYyWgofFytEVruXaAlElc0LoH4uhGR2P0mrGJGFTDHIVNwBjwGuErWm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7488

DQoNCj4gT24gT2N0IDYsIDIwMjUsIGF0IDExOjE34oCvQU0sIE5pY29sYWkgU3RhbmdlIDxuc3Rh
bmdlQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0
ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1dGlvbiB3aGVuIG9wZW5p
bmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KPiANCj4gDQo+
IEhpIFJpY2hhcmQsDQo+IA0KPiAiUmVscGgsIFJpY2hhcmQiIDxSaWNoYXJkLlJlbHBoQGFtZC5j
b20+IHdyaXRlczoNCj4gDQo+PiAgICBJIGRpc2FncmVlIHdpdGggdGhlIHByZW1pc2Ug4oCcdGhh
dCBlc3RhYmxpc2hpbmcgc3VjaCBzZW1hbnRpY3Mgbm93DQo+PiB3b3VsZCBwcm9oaWJpdCB1c+KA
nSBmcm9tIGRvaW5nIGFueXRoaW5nIHdoYXRzb2V2ZXIgaW4gdGhlIGZ1dHVyZS4gVGhlDQo+PiBu
ZXcgUmVzZXQgY29tbWFuZCBoYXMgZmxhZ3MuDQo+IA0KPiBqdXN0IHRvIG1ha2UgaXQgZXhwbGlj
aXQ6IEFGQUlVLCBmbGFncyBhcmUgaW5zdWZmaWNpZW50IGZvciBpbXBsZW1lbnRpbmcNCj4gYW4g
ZXZlbnQgbG9nIGhhbmRvdmVyIG1lY2hhbmlzbSBsaWtlIEphbWVzIHByb3Bvc2VkLiBXaGF0IHdv
dWxkIGJlDQo+IG5lZWRlZCBmb3IgdGhhdCBpcyBhIG1lYW5zIHRvIHBhc3MgdGhlIGV2ZW50IGxv
ZyBmcm9tIHRoZSBndWVzdCBpbnRvDQo+IGBTVlNNX1JFQk9PVF9FWEVDVVRFYCBmb3IgaGFuZG92
ZXIgdG8gdGhlIHJlbGF1bmNoZWQgZ3Vlc3QuIEJ1dCBncmFudGVkLA0KPiBnaXZlbiB0aGUgY3Vy
cmVudCBsYWNrIG9mIGFueSBkZWZpbmVkIG1lY2hhbmlzbSBmb3IgaW5qZWN0aW5nIHN1Y2ggYW4N
Cj4gZXZlbnRsb2cgYmFjayBpbnRvIHRoZSByZXN0YXJ0ZWQgZ3Vlc3QgYWdhaW4sIGl0IHdvdWxk
IGJlIHF1aXRlIGEgdGFzaw0KPiB0byBkZWZpbmUgYWxsIHRoYXQgY29oZXJlbnRseSBwcm90b2Nv
bC13aXNlIGF0IHRoaXMgcG9pbnQuDQoNClRoYXTigJlzIG15IHVuZGVyc3RhbmRpbmcgb2Ygd2hh
dCBKYW1lcyBpcyBwcm9wb3NpbmcgYXMgd2VsbC4NCg0KPj4gSXTigJlzIGluIGEgY29tcGxldGVs
eSBzZXBhcmF0ZSwgdmVyc2lvbmVkIHByb3RvY29sIHRoYXQgY2FuIGJlIGV4dGVuZGVkDQo+PiB3
aXRoIGFkZGl0aW9uYWwgY29tbWFuZHMuIFRob3VnaCB0aGUgY3VycmVudCBzcGVjIHNheXMgdGhp
cyBjb21tYW5kDQo+PiB3aWxsIGxpdmUg4oCYZm9yZXZlcuKAmSwgSeKAmW0gT0sgd2l0aCBoYXZp
bmcgdGhlIHByb3RvY29sIHNwZWNpZnkgYSBtaW5pbXVtDQo+PiB2ZXJzaW9uIHRoYXQgd291bGQs
IGluIHRoZSBmdXR1cmUsIGV2ZW4gcGVybWl0IHRoaXMgY29tbWFuZCB0byBiZQ0KPj4gdW51c2Fi
bGUuDQo+IA0KPiBZb3UgbWVhbiBsaWtlIGJ1bXBpbmcgdGhlIHByb3RvY29sIHZlcnNpb24gdGhl
IGRheSB0aGUgU1ZTTSB3YW50cyB0byBkbw0KPiBzZWxmLW1lYXN1cmVtZW50cyBpbnRvIHRoZSBU
UE0gUENScyBhbmQgc2F5IHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2YNCj4gInN0YXJ0aW5n
IGZyb20gdmVyc2lvbiBYWSwgYFNWU01fUkVCT09UX0VYRUNVVEVgIGhhcyBiZWNvbWUgdW5kZWZp
bmVkLA0KPiBwbGVhc2UgdXNlIGBTVlNNX1JFQk9PVF9FWEVDVVRFX0VYYCBpbnN0ZWFkIj8gUGVy
aGFwcyBub3QgaWRlYWwgaW4gdGVybXMNCj4gb2YgZnV0dXJlIGludGVyb3BlcmFiaWxpdHksIGJ1
dCBkZWZpbml0ZWx5IGZpbmUgYXMgZmFyIGFzIEknbSBjb25jZXJuZWQuDQoNClJpZ2h0LiBPciBz
aW1wbHkgYWRkIHRoZSBfRVggY29tbWFuZCBhbmQgbGVhdmUgdGhlIGV4aXN0aW5nIOKAnG5vIGRh
dGEgbW92ZWTigJ0gY29tbWFuZCBpbiBwbGFjZSBmb3IgdGhvc2UgZW52aXJvbm1lbnRzIHRoYXQg
d2FudCBzb21ldGhpbmcgbW9yZSBsaWtlIGEgcG93ZXIgb2ZmL29uIGN5Y2xlIChhbmQgYmFja3dh
cmQgY29tcGF0aWJpbGl0eS4pDQoNCj4+IEZvciBub3csIHdlIGNhbiBtYW5kYXRlIHRoYXQgdGhl
IHJlc2V0IGNvbW1hbmQgZG9lcyBub3QgYWx0ZXIgb3INCj4+IG1vZGlmeSBUUE0gc3RhdGUgaW4g
YW55IHdheQ0KPiANCj4gVGhlIG9wdGlvbiB0byBkbyBub3RoaW5nIGlzbid0IHJlYWxseSBhIGdv
b2Qgb25lIElNTzoNCj4gMS4pIFRoZSByZXN0YXJ0ZWQgZ3Vlc3Qgd291bGQgbm90IGJlIGFibGUg
dG8gcHJlc2VudCBhIGNvbXBsZXRlLA0KPiAgICB2ZXJpZmlhYmxlIGV2ZW50IGxvZyBmb3IgYSBy
ZW1vdGUgYXR0ZXN0YXRpb24sIGJlY2F1c2UgaXQncyBsYWNraW5nDQo+ICAgIHRoZSBoZWFkIHBh
cnQgb2Ygd2hhdCdzIGJlZW4gZXh0ZW5kZWQgaW50byB0aGUgUENScy4gVGhhdCBpcywgcmVtb3Rl
DQo+ICAgIGF0dGVzdGF0aW9uIG9mIHRoZSByZXN0YXJ0ZWQgZ3Vlc3Qgd291bGQgYmUgaW1wb3Nz
aWJsZSAoYXQgbGVhc3QNCj4gICAgaWYgc3VwcG9zZWQgdG8gY292ZXIgdGhlIGJvb3QgZXZlbnQg
bG9nKS4NCj4gMi4pIFRoZXJlIGFyZSBwb3RlbnRpYWwgc2VjdXJpdHkgaW1wbGljYXRpb25zIHdp
dGggZS5nLiBhIHJlc3RhcnRlZA0KPiAgICAiYmFkIiBndWVzdCBjb250aW51aW5nIG9uIHRoZSBU
UE0gc3RhdGUgb2YgYSBwcmVjZWRpbmcgImdvb2QiIG9uZS4NCg0KSSBub3RlIHRoYXQgVFBNIGlz
IGFuIG9wdGlvbmFsIGNvbXBvbmVudCBvZiBhbiBTVlNNIGJ1aWxkIGF0IHRoaXMgcG9pbnQuDQpB
bmQgZXZlbiBpZiBpdCBpcyBpbmNsdWRlZCwgbm90IGV2ZXJ5b25lIHVzaW5nIFNWU00gbWF5IHJl
cXVpcmUgb3IgZXZlbiB3YW50IGl0Lg0KVGhlIFRDRyBtYW5kYXRlcyBhICptaW5pbXVtKiBsb2cg
c2l6ZSBvZiA2NEsuIEnigJl2ZSBzZWVuIGEgY2xhaW0gdGhhdCBJQk0gUG93ZXIgc3lzdGVtcyBz
dXBwb3J0IGEgNjRNIGxvZyEgSnVzdCBob3cgbXVjaCBzcGFjZSBkbyB3ZSB3YW50IHRvIGRlZGlj
YXRlIGluIFNWU00gZm9yIHByZXNlcnZpbmcgdGhlIGxvZyBhY3Jvc3MgYSByZXNldCBvZiB0aGUg
Z3Vlc3Q/DQpGaW5hbGx5LCB0aGVyZeKAmXMgbm90aGluZyBwcmV2ZW50aW5nIGEgZ3Vlc3QgT1Mg
ZnJvbSBwcmVzZXJ2aW5nIHRoZSBsb2cgaW4gY29vcmRpbmF0aW9uIHdpdGggdGhlIHJlYm9vdGVk
IGd1ZXN0IEJJT1Mgd2l0aG91dCBhbnkgaW52b2x2ZW1lbnQgZnJvbSBTVlNNIHdoYXRzb2V2ZXIu
IFRoZXJlIGFyZSBvdGhlciBtZWFucyBmb3IgdHJhbnNwb3J0aW5nIHRoZSBsb2cgdGhhbiB0aHJv
dWdoIHRoZSBTVlNNLg0KDQo+PiBhbmQgbGVhdmUgaXQgdXAgdG8gdGhlIFZNUEwgMiBndWVzdCB0
byBkZWNpZGUgd2hhdCB0byBkby4NCj4+IEFsdGVybmF0aXZlbHksIHdlIGNvdWxkIHNwZWNpZnkg
dGhhdCB0aGUgY29tbWFuZCByZXNldCB0aGUgVFBNIGFuZA0KPj4gUlRNIGFzIGlmIGl0IHdlcmUg
YSBwb3dlciBvZmYvb24gY3ljbGUuICBPciB1c2Ugb25lIG9mIHRoZSBmbGFnDQo+PiBiaXRzIHRv
IGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0aGVzZSAyIHNpbXBsZSBwb3NzaWJpbGl0aWVzLg0KPiAN
Cj4+IEFueXRoaW5nIGVsc2Ugc2VlbXMgbGlrZSBpdCB3b3VsZCBiZSB1bm5lY2Vzc2FyaWx5IGNv
bXBsaWNhdGVkIGF0DQo+PiB0aGlzIHBvaW50IGluIHRpbWUuDQo+IA0KPiBOb3QgZm9yIG1lIHRv
IGp1ZGdlIHVwb24gcmVhbGx5LCBJIG1lcmVseSB3YW50ZWQgdG8gZ2l2ZSBhIGhlYWRzLXVwIHRo
YXQNCj4gdGhlcmUgaXMgYSByZWxhdGVkIGRpc2N1c3Npb24gaGFwcGVuaW5nIG92ZXIgYXQgR0gg
aW4gdGhlIGZpcnN0IHBsYWNlLg0KDQpBbmQgSSB2ZXJ5IG11Y2ggYXBwcmVjaWF0ZSB5b3Ugc3Vt
bWFyaXppbmcgdGhhdCBjb252ZXJzYXRpb24gZm9yIHRoaXMgd2lkZXIgbGlzdC4NCg0KVGhhbmsg
eW91LA0KUmljaGFyZA0KDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBOaWNvbGFpDQo+IA0KPiAtLQ0K
PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgsIEZyYW5rZW5zdHJhw59lIDE0
NiwgOTA0NjEgTsO8cm5iZXJnLCBHZXJtYW55DQo+IEdGOiBJdm8gVG90ZXYsIEFuZHJldyBNY0Rv
bmFsZCwgV2VybmVyIEtub2JsaWNoDQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCg0K
