Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF20134BA35;
	Tue,  7 Oct 2025 14:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759847842; cv=fail; b=Qh7sYkDi2P2fVHCW7xtvlhuoY1Sv/tY7ZhM72OhmR6+juIBK9L6H6vHQ7BEJGB84LaxVeemm0I5xsVmkh1d1Cq5iFVZt6odDz4q1QrLsEknG3uPu2OWNCwWFVz1B++i8ZMSu8p0oExa851bLV0MQTSwCDsdsdT9lhtJSeyQ5S7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759847842; c=relaxed/simple;
	bh=i5y1NsEkHIzy+zq3dtoa36oCJSfr/7DAI9qTLDGwp+U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=InEOSdu4O2cKx/W1L2EdtTDVaKjpQnPdD/j6YY+co2WQ85x7hbUspzrROReekTLSKYzQhh0wEsC/aFxF8nBwQptYeJGsNzcRGrM2NJKOgaRFoncOA3OqLaX6vklE2mu8c5Gg+L8iZnw2meyO24TfdkvQFDUVIekVvnqyHCJFOuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4odP5Zst; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4odP5Zst"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRvDJ07NdCFbj73juS5o5Ii4E1PrDFXRlijPCPFl5sLQ4/eoYLzgBmIaY0QqgXlpDz1O4253bpA3v7Md36v/rgH3aLp2qJNefny1f9gq1iXcGOsDXNGRajqdg5V2D1cjT7FXCJC3zutsunsvYz7tDTGAhcIbXn49ad/QEgpUWAz1MQB98lSJ4RW6w2z9dNozGR05nA53ElAs+p55FmNRiEY0LIRDt2yQlNx7TgyYVJ8xGxCLid7O8qM+5MXXEzzW5zPFAt0gUnzDOjJsbjAwNqvTCfnQvdF6GVJQvsYgpPz0S1//yyq+jhi2M9gQMLQH5xMbCOXrwDeZcaxmFqyO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1lG9S4nEH2R7BvwSZAwcxo4D5V1uD6iq1XvIWJl+H8=;
 b=orG7Ic8WZUONlCI+xp7B0sQjUpNmEr/Y4t9YjcR3cT/j1qIN0wtfcyNiIM+cEngHiP035cAp1lX0A0PO6FyhEtQ/urDYr0e7anyi+4kSbnhODbxGdBB5zfc/hzTrOPcXGzKFCjRDR+pMzlToR1UM0qR8qdyqTjabE8D4Rjre2colr1dfkxIWzG0m14T8sy5kkKpnGHEVCI9OIWam4mREW5ntcdG46g1XT+cNTWqejDGdHksImmvhZBtW2/Xjj1kOQwcbIQnxmLzWV0tXgqu1BlvHf44akcecFn4B5ATrDMfWc2hCn2F1xyhRnHS+Bjbt7BZ7iB+x87Z7uoXpSyEuQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1lG9S4nEH2R7BvwSZAwcxo4D5V1uD6iq1XvIWJl+H8=;
 b=4odP5ZstbHIXuztK6Wl2EOF6BUsf194QDsfI5l0eLmsdCUPldjNOfw4B+AZcRDLPwdA5YJcDrKF300L4hhEME4Oc0h/8K4qURwJ5nPk45HzNSbI2deOWb89xAdKjPtw0n9OdPPw0O6HfcGLCEuofo46XLPRVI+MCvUczAgbe9o4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by CYYPR12MB9015.namprd12.prod.outlook.com (2603:10b6:930:c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 14:37:08 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%7]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 14:37:08 +0000
Message-ID: <549cf861-50d8-ffab-f03f-c8ccd356afdf@amd.com>
Date: Tue, 7 Oct 2025 09:37:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: SVSM draft specification (v1.01 draft #3)
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Nicolai Stange <nstange@suse.de>
Cc: coconut-svsm@lists.linux.dev,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Jon Lange <jlange@microsoft.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "Relph, Richard" <Richard.Relph@amd.com>, "Rodel, Jorg"
 <Joerg.Roedel@amd.com>, Melody Wang <huibo.wang@amd.com>
References: <39cc8435-5643-4a16-8eb5-5e12f15566a1@amd.com> <87bjmmj4n2.fsf@>
 <8953f72f-edd2-edde-dc43-3782dbac8c16@amd.com>
 <40c872d85e15011784bec546290b22809dfff8e6.camel@HansenPartnership.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <40c872d85e15011784bec546290b22809dfff8e6.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0177.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::32) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|CYYPR12MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bca2e45-716e-438c-095b-08de05aefe33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzVNMHlubjVuVlp1akc3M1FSV0laSDVSUTJmcHI4S1JsaXY0MWR6bXBsZ0pw?=
 =?utf-8?B?Q005VEx1WTYxdzRQZXlqNDVkK1B3QU5KTlVXc3l6d3hQQ3ljZzFacHY0bVlN?=
 =?utf-8?B?dUtleDJxRThkSkZaZVhLTWVCbDd0Z3RvVDkvbXovYUFvTXdHZ2lHcXpzRWJT?=
 =?utf-8?B?Wkx5bDdmdHZ4dlA5czRvdG5KU1pGMUJva3Z2ODRBdmgvSGd4eWtJWTJoSGtN?=
 =?utf-8?B?QXFOeGRNcElKSzYxVWE0aEVxdHRUZVRlVEpHNEt3WVVQS2NkZUdJajVOWHY3?=
 =?utf-8?B?R01lS0lERVpIWDMraDFzekg2ZDJUeUt3OXpZNjlsRUlYUDhyY2J6L3hNRjdW?=
 =?utf-8?B?MDR0WG9JbHZJMWY2RnU2aFJza3Urem9sL2Rnbnl4VW1UVFUvNDlKSm40ZE9J?=
 =?utf-8?B?SWF2MHlsUkpVK2ZsRlBIczVuVVdTWWJ5UzB2WXlIaGVxdDB2RklBckNEcjlW?=
 =?utf-8?B?dDcwZWhNL0UrbmtKamE0U2N6ajRYTkhlaGpuMXUyUTZ3NCtXNkdZRGYxVGwx?=
 =?utf-8?B?V0JQSzFIa1ViMmY1eEN4ZmpyVlJEc0MyK2ZkajVWdUxTRmN0V2JsTVBDd1c5?=
 =?utf-8?B?aDhLdTJWQUtGQWRDU0l6WUh6ZlZXZlk1Z0dmRUVkZEVHT0p2K3VGSGNiVXFm?=
 =?utf-8?B?VHJVWWt2NWhOSGUrdDNLRm5nVXdnMDZWQ3NZL2drOG51QU5IQnZzRHFTVnpa?=
 =?utf-8?B?NUNJdWUyQkJuMVFXbGxld1NHeUtZU1RnV1c1ejE1eVd5WDcycUcwSklaUy9a?=
 =?utf-8?B?aUZWZXdDbU9sNzBMZ05oU3BRNHpleGs4SW5FTERrUERDWkNJb29MVEMyTlpY?=
 =?utf-8?B?dVN1cHZmZGJvZ216czUxQ0pxbEZEUE1YYW5odDNJU1diRWdMRXlWazhsamNk?=
 =?utf-8?B?KytLWHNBcmlXVVZxZHRlOFdFT2piamw1ODdsZFoxMW1acFMvY0ZRbk4zTWtZ?=
 =?utf-8?B?dTV1dnBybXRJZmhKcTFrOXB3RVhIUk9mRll5NC8rZnZzMWY0NlNWYU5GUjcz?=
 =?utf-8?B?V1U2RFNRNXZTTW0zb2tRTXZDU0xhU3h5dXRFMjdBMlYxS0lHbHRDQ2FuNjNz?=
 =?utf-8?B?dGx5Q1Z6SGtDUHZkYmtwbHhJNVRzZ0RUMExmNnE1dFViZzAwQVFmNzYwTFNB?=
 =?utf-8?B?UDM2QS9hcVl0bjR1YmdncS90ajkydEYzUkNtZ1QwRzllT2lhNUVaOTVGTFNN?=
 =?utf-8?B?OVVXeUtCQzJnZ3pPK21xWXlkRGNnOE1SVCtuZjNWaWUycStCQXlabjYrUXVI?=
 =?utf-8?B?V3ZRNFI1a2c0cVc2NjdBR0xxTVluaFd1U0c1QktXY0FCSkp2YXE1YUlzOTNC?=
 =?utf-8?B?cnBVT2Q3Z2g4SThBLytML0lyTm8zYWRLdTJhUjBzWGdLVC9ob083SXcwSUF5?=
 =?utf-8?B?QjVVenpCNzgxbXVlNHNZV2EvVTV5SnpqU0FsME8yZGJSR0QrQlQyd2NaQlRB?=
 =?utf-8?B?YmUzZVZ1bXIvR3lPeWlycS9YUXhiVk1iRjhDdkdKRWpqdkpBS0Y3TjE2M3o3?=
 =?utf-8?B?UG9EQ2orbnhWa0pidG1wejdBeUhpSkY5VFk1T0d0NjVVYlpheXRaOEFVR0VI?=
 =?utf-8?B?M2E2d1RDeng3QjE4MnZJdWs3NlpBaENPVGFJRkxGY3JGOWFWRVY4MFpVUVlt?=
 =?utf-8?B?Qm5FVDZtcS9vY0NDclhWVEtSajNhaVhzUXNhVVlCZGtiMnpWMklSa0RCTVNI?=
 =?utf-8?B?TE1MY3dwTEMzanNQWEU3OUFIQnNiOGFic0RJMlFmOTh1L00rN1E2Y2M2L3BV?=
 =?utf-8?B?WFBsTm9HZGk2cnMwNEtyMVBENlRVTDY3RFZBeHFLbVR1V2FwT3QvVFhMOVN2?=
 =?utf-8?B?K252WnRkbjNSQm9qWlFHZjU3aTc2R3VWOVEyNTNwUHYzalB2SG93TzBpemwx?=
 =?utf-8?B?OVU0L1llam1wM2pzRDkvSGVsUGlIVUowQXZsVmVHLy9qQWxlcUp6eWJsd0Mv?=
 =?utf-8?Q?j0O5OefwcxAK4F7XP6xrhnL2Cw9A8wM/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0lNbFJwejc4WVpSbzRWUGNPYzRBekhEbmFhcTdkUTZYK2xpQ3RZTlUwZHU5?=
 =?utf-8?B?cTd4Qi90U2JtNk0wTVBFYnhaUXdlbUpXc3A3VHNScU5sdGJPRHFoV1RzRzR2?=
 =?utf-8?B?Y09TWmlvNVoxKzZVOGFIWlpaU3NFekZYQ1M0TElZc0NGNkEzMndJZ1BzUHpz?=
 =?utf-8?B?ekpobE5mREdnL2d3ZXUrbFlZMkQ5UGN4MGQzQVp3MmV0RHkrek92NVY4dFZF?=
 =?utf-8?B?THBiRGlQR0hkNzNlMTZDaXgreURITGZVRXM5SWwrU2JVcmVzdDg5VGJpWS9l?=
 =?utf-8?B?RWRLTkk4SEtFY2NsNmRMWExBeFJkSEp0dnJGTjZFdCtDd2ZlSVM5aUFLbzRi?=
 =?utf-8?B?ZUNVZllBdTBWWUliamMzRzNjUXQxemVRUU1OejlhUDhDOFYzNDZjZm5BekFR?=
 =?utf-8?B?SFEvNFlXZEdNT1JXZDcwazVqdGdRdDUycFZpbVVCNWM2dkRnak5YOWZOVHZJ?=
 =?utf-8?B?RSs5b1NTbkNudFdScTBWQ3ZBUUVuMXdkTVgwYUNhWkQ4M29FcktQVHZDUjJZ?=
 =?utf-8?B?SUo5MFE0cjN5R3dkNDRtK01OQXplbXgyZWFjSTVzTDFVdVAvLzlOSWRJcFdR?=
 =?utf-8?B?bmdBcENDVXArTGJYMmFtTEpJQ09HeE5yN2xxWXRHN0NTdFMySmdOZS9ZeTV0?=
 =?utf-8?B?QVBHQzl4a2k4VjhOUWtqenJxcllLRjZOVjlLYnJOR2JVVUxQK0JVdjVPMXp3?=
 =?utf-8?B?VnB6VTZIUGhCSHVFcWUwdkJIdkJMc01UekRPQWJMWU10NUNFZ01ZcnZZemln?=
 =?utf-8?B?TmdPZVJQUHVCQWI4ZE5Oa0hJaG96MUd6TmdlTGdSU3k2bElNRGxuanJFdGly?=
 =?utf-8?B?c3FZWW15S2dtZWFYSm5xWXArZGZJOWorSTJKdFZRMDc4THdFYjVOTndnM0dq?=
 =?utf-8?B?SDkreURKYVVYOUp1ZFZLMk9qSVEyVG93TTlucE0vZUxxZ0RVSXpGSS9DUHg4?=
 =?utf-8?B?eDVHOFdOdDB2aENIMWhWbklxWWt0eXJUZko3VXdtRDd0MnlaZU90ajduTUpT?=
 =?utf-8?B?OGsrcWtwU2ZvYUFHdXp5V2pwN0JwVUsrYzNPTGFkVU9tZzNVWG5Fa1dMZHBv?=
 =?utf-8?B?TFNqRjcyMUVQV2RoV2tybm9UWGUwMzFsekpyVGJGK0g4UXVrTWxmY290NllS?=
 =?utf-8?B?dmIwYmFqTFRnWmgxbzJsSG43Yi85NG0wdjlzemI4MHpObDNueElJYWhsWTRW?=
 =?utf-8?B?TjMxT01OM2RISDBGY0FveXlhWHpKdFBtOU9KTXh5RUtJb3ppYW9ETHhBL2ta?=
 =?utf-8?B?clNXbmxNbGZLUjY4WDRRNHNxR0MxOTEyTm9ITnhHWFpoS3dMOGZYQ1JVMjFQ?=
 =?utf-8?B?MmF3eGdnUGcwN0hnSHZUbExNL1JLQWNYalFGZWl0Y2RDTjZUZW1DUlpZWk1W?=
 =?utf-8?B?MDdmN1RETHIxdzZxdVhmVEVwTFl3TnRjZ2hWb1NiTkdycktmcHBPd2sxNGxq?=
 =?utf-8?B?UnV2UnBscit2akVKN0tnUXFJTStJcEJNZ0MyaVZPeDJrMHNGVmhIdlQrT2Yw?=
 =?utf-8?B?YmQ3TjhKOE9lK25pQTZOUEp1N21ER3hxNnVWSnU5NHFxMjlvTysrUE1TMXEx?=
 =?utf-8?B?Mm1hR0xwOWllenE0YWU2NFNwRndXK0VQUzJEZmdQUXdndjhReGI1UjJqNlpZ?=
 =?utf-8?B?c0czdXpibGhaNjZTOWp4bFBIYVVjbG5NYjVJOEF0UW04WjhhaFN0WGZla2Zi?=
 =?utf-8?B?Qm5hSExPMmhmUHdwalNwLzdQYTNMUjRLb0ZmOVZQZXY1T2toY3RGRThmVnN6?=
 =?utf-8?B?Qk44ckY5RXhmOFB2RnpDU0FHSXBCUW1WNmp4ZXRlOFlFRmI1STVYT0owQ2Y1?=
 =?utf-8?B?dkl0S3krVW13bVFjNkV4WWNBUFBFdVh5eFM2dmFHUmo0bjU4NUNjSlhYZSsr?=
 =?utf-8?B?dmc0d0pxQklyMEplTXB6TlJ4V1EzQUFBOUJTazZrTU9WUFFCL1hiRnBtY3Mz?=
 =?utf-8?B?TWhqcVdOODJQN0I3U2paMVJPYlFuSHdpQ1FETDdEVkVySW9LTUVFbVZUaHFP?=
 =?utf-8?B?bjZiVGxhakJxa01VR1NEdkFJeTkyR1lBbVhUdEhibkUyekwyeFhHNitjaFlq?=
 =?utf-8?B?RFpHeWVBRG5EcnYvSlVmY21PZWxseHNHWGhOOWJWQXZ4VWZWS2FuME1OK2x6?=
 =?utf-8?Q?CPW9fHoKsblCyP8+/nYLm+Wfg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bca2e45-716e-438c-095b-08de05aefe33
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 14:37:08.2184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbSSyTDfsLa6jkCRrYWryn5DD2DcNY3BkRMICVzuoR397KFuXZrRXS4BdZre4RVmhBb2hw5Ow65UyjUzA1e5RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9015

On 10/6/25 21:59, James Bottomley wrote:
> On Mon, 2025-10-06 at 12:56 -0500, Tom Lendacky wrote:
>> On 10/4/25 06:19, Nicolai Stange wrote:
>>> Hi Tom,
>>>
>>> Tom Lendacky <thomas.lendacky@amd.com> writes:
>>>
>>>> Attached is the next version of the draft SVSM specification with
>>>> the
>>>> following changes since the previous version:
>>>>
>>>>   - APIC emulation protocol added
>>>>     - Coconut-SVSM will need to be audited, as the current APIC
>>>> emulation code does not completely match the "Alternate Injection
>>>> Support" specification on which this protocol is based.
>>>>   - Reboot protocol added
>>>
>>> there's an ongoing discussion at GH ([1]) on how a reboot should
>>> interact with the _TPM_Init (think an emulated TPM power cycle) and
>>> that should probably get resolved before making the spec update
>>> effective.
>>>
>>> I'm trying my best to summarize the problem in what follows, James
>>> (CCed) might have some additional input.
>>>
>>> So, naively, a cold reset of the firmware, which qualifies as a
>>> reset of what's called the "Root of Trust for Measurement" (RTM) in
>>> TCG terminology, would require a reset of the TPM, i.e. to make it
>>> enter the _TPM_Init state, c.f. the TCG TPM 2.0 Library v184, part
>>> 1 ("Architecture"), sec. 10.2.2 ("Initialization State"). Quote:
>>> "It should not be possible to reset the TPM without resetting the
>>> RTM. It should not be possible to reset the RTM without resetting
>>> the TPM."
>>
>> Right, the base idea of a reboot would be that everything should
>> appear as if the guest was re-launched.
> 
> In Linux we have kexec reboot, which doesn't reset the TPM, it merely
> carries the logs across without resetting the PCRs, even though the
> guest gets relaunched.
> 
>>> In particular, a reset of the TPM causes a reinitialization of all
>>> PCRs to their respective default values as defined in the platform
>>> profile (constant all-zeroes or all-ones in most cases).
>>
>> Yes.
>>
>>>
>>> At the current stage of the SVSM development, that's fine and could
>>> easily get implemented.
>>>
>>> However, James remarked in the course of the linked GH discussion
>>> that establishing such semantics now would prohibit us from letting
>>> the SVSM measure dynamic parts + configuration of itself into the
>>> TPM PCRs in the future. IIUC, the idea is to record standard TCG
>>> events capturing the dynamic aspects of the SVSM into the
>>> firmware's PCR-measured eventlog (for the firmware event log c.f.
>>> [2], EFI_TCG2_PROTOCOL.GetEventLog), which is quite appealing,
>>> because it would integrate transparently with existing workflows
>>> and tools like `tpm2_eventlog` etc..
>>
>> Couldn't that be replayed by the SVSM into the TPM on "reboot?"
> 
> This was discussed in the referenced issue.  What I said then was:
> 
> ---
> In theory, yes, but it depends on the mechanism.  What we'd discussed
> before was making OVMF responsible for the SVSM measurement log, so we
> could simply do additional TCG measurements into standard PCRs and they
> would automatically be part of remote verification and the SVSM
> wouldn't need to keep the log.  Now we'd actually have to keep that log
> inside the SVSM as well to do the replay.
> 
> There's also a security point: just in time measurements into a non-
> repudiable store have well known and hard to influence properties i.e.
> very little attack surface.  If we do the above the security properties
> alter (the initial measurements are potentially no longer just in time,
> so the auditability becomes more suspect) and the SVSM log store itself
> now becomes part of the attack surface, which is quite a huge
> expansion.
> ---
> 
> I really think the kexec model where the TPM PCRs don't reset and the
> log carries over is the correct one.  And, as Jon pointed out, it would
> also work in RTMR environments which can't be reset without a full VM
> reboot anyway.

I really don't want to delay the release of the next version of the SVSM
spec. While this is all being discussed and worked out, I'll just remove
the the Reboot protocol at this point so that the Core protocol update,
vTPM protocol update and the new APIC emulation protocol and UEFI MM
protocol can get finalized and published.

Thanks,
Tom

> 
> Regards,
> 
> James
> 
