Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022117.outbound.protection.outlook.com [40.93.195.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3673253F3B
	for <coconut-svsm@lists.linux.dev>; Tue, 20 May 2025 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759082; cv=fail; b=ZH7Sj1yFI4O52aI7yy/PRCfUaglSuGpXg4hzSDYAKUbniqfkKnPTluYJBKxgkC298z7asCunA1ON9v8JgPtMKeRr9RvBbRQ1TDqmjhtSc4yEjBRXtmIkmhHpVt/15YT112JNioNFNFEkixJx5hxKjo+6/MafqJKOXjCTF7yTUHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759082; c=relaxed/simple;
	bh=4ow47A5/MwruZ2m8ZGxcLmEkuzblVWITcN6MghHxkaU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EjllOccZvqv9qlx0xpyo1YhbKskkP+y5sKZgukydZ/z7et/tWSqSiXkRll+5P//wrl/JjhHX17LZouSqYQ91dF7JGKpAaZulqRNOXO/knNsbA1IO+3h/XKQLU0ugdybHkOyaOO+5hRpMcV4BC5j3UVI/tlf7qlznFV1WLLm/9Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=EJVSgPml; arc=fail smtp.client-ip=40.93.195.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="EJVSgPml"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wH3O70X+7MYp/2Wwq/b+R6dvcvpmbyFUUJtf+L4mBJzbOpQ7Lqzya6ZZUlvjMzGNKCyp6lVQTqlSHoCVXhKSkA9mC1mk9IyIGBX08fWMEM4m4nBZw0rNLeeJi1JZGzNJe1CtySvfGbFLfjWWyii3+OrEkJdKiT7J3K0tAAMgC3EUp+Ajf/MphyrKIWS6m/Vs4di1l72jrguTa+ilFhDc8hzw0Jp0n3HaEdxHH33RA+yO9Dl5L2RhOkBwT4HFn26bLwJRLzU62zsFUpQ94nwIqMzoJTmbvpTsxfTBSx/R2b2hBKa4fXCWKm2R8e+XX8jtIqM3GkBBwWqtnziasiAwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfVfwwqQnjBoPJEurlTMZeq+2r0ZRQdCtf7YCSlr/NE=;
 b=mkGfjHE1GHIoRa+B4nMfkakY+1evtPx3bjLjCHaZqxeYwv6Qpzd2DMm1GvOmBUBGduaoaDZLNzhydmkIAD0pdzqrntHxUKICjdLlCEnLIg/e7ia/hlsJGpoycK93qtObxDN6cQvV5S+H2CVgaLCAu5fxDyEokOxN3RgJUZRqvuBRQvXY6ly6favb5OIVP16IhciXvcSEiaHeP4w970CYf1eBPsj0NeHkrNpKf7nwF7j8JEdxb8P988L4tUaQsA/OUJdh4l4eYnoHXyYI5IDhkX1vi5QjI19anEAAjgzgi0oxSR68RUlMo/ovPweM0UcCcBg7eiMwkpmxiWbTvVUw1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfVfwwqQnjBoPJEurlTMZeq+2r0ZRQdCtf7YCSlr/NE=;
 b=EJVSgPml6OP+mRJKERuyVPQr+t6ongdFgpMjgU6Szxfrig6TN7RI4v5Ic5DpSlL97dDCxHT+YLDJTjZoUmESZ4ACipLUsrDVhnq6JVUdgyRKkAipfXGCnRkGZq9fcF+8OkQE2aUr9HqV6FcfS0sgVSOMjLfxju2+nslMydX/0xs=
Received: from SA6PR21MB4303.namprd21.prod.outlook.com (2603:10b6:806:419::17)
 by SA1PR21MB4000.namprd21.prod.outlook.com (2603:10b6:806:379::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Tue, 20 May
 2025 16:37:57 +0000
Received: from SA6PR21MB4303.namprd21.prod.outlook.com
 ([fe80::e19b:11d0:630d:d6fc]) by SA6PR21MB4303.namprd21.prod.outlook.com
 ([fe80::e19b:11d0:630d:d6fc%6]) with mapi id 15.20.8769.016; Tue, 20 May 2025
 16:37:56 +0000
From: Jon Lange <jlange@microsoft.com>
To: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>
Subject: SVSM Development Call Mar 21, 2025
Thread-Topic: SVSM Development Call Mar 21, 2025
Thread-Index: AdvJpWPUydwjFKpoS9qzML0cXTMlug==
Date: Tue, 20 May 2025 16:37:52 +0000
Message-ID:
 <SA6PR21MB4303E6F5DCCE81434A10304DCA9FA@SA6PR21MB4303.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=c2a4e911-b9aa-468c-8929-f8208a46861b;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-05-20T16:36:29Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA6PR21MB4303:EE_|SA1PR21MB4000:EE_
x-ms-office365-filtering-correlation-id: 02f8a731-ed9a-463a-27df-08dd97bcacfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6LviROYKpTI7TrZHNLu3G1FQ1ILpbd0V9SeXG686k1leA3K1B5D/c+vt01ce?=
 =?us-ascii?Q?Updjh7IndD9P4sR1IfYPw4wBxEmAX8V6ceAetQJEAiqSYAzxNAMA9iyscnfz?=
 =?us-ascii?Q?OSeJhRm44tBGwjIUEWVLXPlKGpW0NhkH2PQ+Hy2GNAh6UH0RrzhS3NlZdbxf?=
 =?us-ascii?Q?g9k0W7r54fPEdRmlIxcAqAu5cOBuupiz42AmppWia3uQQ6Iq2l6n/PqMVMYY?=
 =?us-ascii?Q?tJZHJJftXgfTNiQJVOgeBZADlQS8kkjzzv5qZS9O0ejpIPrObmPq0JzT7tax?=
 =?us-ascii?Q?vRptJHyzcq0OxsyEUzBX/jj5tzzMrsA+wMKBDs4TcsyWGMvX0NuyqhV28+H+?=
 =?us-ascii?Q?AXwKnfUvulZLevnvnsSyTZcMFb3fgjfQePYocFwJvdWdFi3uvCbf2su/9H7n?=
 =?us-ascii?Q?Z4yojG4KKUz1IMlC+ul9BMHRvSeyQ3UWrEzdOth8yHW6eQ8HfB2oUwXU4ikz?=
 =?us-ascii?Q?/0tbQxdJ2d5FlLFu/sLM6WAjKkq+e7ep3Z+N8hS1LklwwSm/ujCcPig9759C?=
 =?us-ascii?Q?C4JT3J5vmqqkuQaw4VHljJAb38Igc85EZKNTlIwy+5r71TW/MqnzJriZ15sf?=
 =?us-ascii?Q?4PJANWfYMfAWS2OwL5HfZhQ0uXpfWBDulpzFKzAaN+m9WUcx9VN9R1BCRvxf?=
 =?us-ascii?Q?H1weLFG3+bUwGf5nflbwj1ZVJwj19D3nGLu4jWmVZ9CwINuNEx4R0aOJR9vt?=
 =?us-ascii?Q?WsHue2yDE/W6ldaT6ZXbNueHq74mxhzct9H6r2wCcLIqQ/vP1tVP1DlXL8od?=
 =?us-ascii?Q?wsJUvvlMVuYAZAuqqe5Un3rFe28BFjZ9lFNIprfdSLIC1N2XqADH6+9Mm/DE?=
 =?us-ascii?Q?hRMqbVdMh4V0lM/vvq5xfwRmGGe/A0bC4SIonRtFdASGRh8+lDemctPHHkGw?=
 =?us-ascii?Q?wqD8kh/xpd/xrAC6o0DpWZX3X84bnAH4zMfZlFyiZ34Pv1brgIOGWZA9K0EB?=
 =?us-ascii?Q?6C3sGHjSrB1ooMulsVla5Oa16OYLgQIxJX1etYw/vn6rLyVvp3t6QVGcMPJY?=
 =?us-ascii?Q?sWr4BUzCLkfV1ri3nHn75SmkN1q5nL1PJxsfU6Pl3WJYBL8qlXyA9apQ/INI?=
 =?us-ascii?Q?WspCKCFgAN6Vf0Ri2Y4lBPlnlBwbBuOhxMbdshlagxF77gxhXM6vqc2EksPx?=
 =?us-ascii?Q?KK+9vQhLiUx9vzT1rDMuxNx1Iilvxqgm25Gk8mqRGwKQ7Zt9nckgFR8awTo3?=
 =?us-ascii?Q?C01Z4aN0tMWT7exPpoZ3EGWxMdlsIUqeKZExx7AxIAG3ErHLX1qI12uRCtAn?=
 =?us-ascii?Q?SceY/zc/WD8uz4RnoltmbtDwmoezWWbKfesC9+Qa4PElN+FW1OuwRS811hHZ?=
 =?us-ascii?Q?QzuukNcDgkXqNsW3VNAyUw0ApRg5t7cgL263uHs2+XXuy/iFEWRa05JQCpEJ?=
 =?us-ascii?Q?W4uVUEy4HlBEaAFXRK1Q0LZjvt66JEN2WGaKmQOGB26QbFVTco6il2jLbT0o?=
 =?us-ascii?Q?jpX0pWEqz48=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA6PR21MB4303.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?E1/oDtmwnbxsUHr+9vVTVgNNCECicR/NS+W4l7UFNTcfS9iaCqepy/j9FDvX?=
 =?us-ascii?Q?IDEcK+oCWV8gPWOnDMiUUDrJkjmmH/AhGe2n6PAZHqDH/ErsJOdmsDFOObHd?=
 =?us-ascii?Q?k/+sJ0HI0m9EExAcBRbzAvMHXX9z7kUQAjEyDlVs+pxRI9tCWLUqnVrlKXUE?=
 =?us-ascii?Q?9iXmn+gfG1GOvdZoYsF1iwFtWwNd4di6ap0F37AudI21uQsMsXWLWyU54yig?=
 =?us-ascii?Q?KtKzVyUxewJDXrhzLCJQp/wXH02ZBXqcXRcQQLssbvmhDu10i/pRlKKCp2/7?=
 =?us-ascii?Q?4d9ynw88a+3I9ndSmG80sp75m+9KCiDIzAocuLMVUa+yTsl9Sv/LijjZ+d3H?=
 =?us-ascii?Q?gGSc5VWEDyMERsUsSMiAjR7iOPOlMw3V9afTsu1buDAMW3vZ4SoP2mbPYdT2?=
 =?us-ascii?Q?GxI3fu/5nKy2Nb6Lhd5xi5ZlxVwFSFQ/dyQgMEnla2sygEYo/ezWvcrN8tNj?=
 =?us-ascii?Q?XfiuYe22M5Jf5V/ijwBqcogXHSQAa8uoAsWTXaqgmUpBv9Ph7GMghBf5UAQF?=
 =?us-ascii?Q?YMTSUHSLYi2giNCpZg9OBpFQ0H3kDkH3VBF2XeOnKHQGcakyHnKoZBt5y/5m?=
 =?us-ascii?Q?6lOYmi8fkJ2duj+8HPVkh7phwLssommFwBZ4o03kguHxfq7DzBOkolsyjCfH?=
 =?us-ascii?Q?EX4ZKdqW4goRUqNor1BM0HSnDx6Al2ZMnvieo2yzTffFypG4elJlLky4nB2Q?=
 =?us-ascii?Q?elr6dPKjEQkNOELdNNhn7j5a8d5Gto4FtS3D5E85buUorOs+pKuTGbaRkUfu?=
 =?us-ascii?Q?s5Xejh8+5IE+S3+VQn7eVCpBDRYtA/tqxH8BzXyfrq7YQmi68sdj5zTgV80g?=
 =?us-ascii?Q?kKoIO07MAoRrTMYkjahC6KNZnTidBFv1QOSq4CATDU5dRCC0a1gXkpTfQhx5?=
 =?us-ascii?Q?tdB/e/WMvu6KzT0G8rJtMf4xSbX2byr2AzHRoS6rwoOqCAgL2/1o+3arpnd0?=
 =?us-ascii?Q?AuQ+SmE68pasTV5bS8/+fCMEp3VvBHcGhKV7BTd8K7fpGmZu0NqjSZ5wlgpj?=
 =?us-ascii?Q?LRt/BPdwPXPZ0tW2qen0pF/heuHwm+bfgWaRzC3X3wNsL8VhqEGNvHeC3aG3?=
 =?us-ascii?Q?hmFRXboZaWbpH1J3vP3NYFFZ98gGreF+qgnkxaNFXHRRTLVOr4n1tFOeZg/P?=
 =?us-ascii?Q?F2QhUbgixTrJr/ixkANZJM4B4khA+2WzEUyT9YpjPZT+R7Y3GeovJ8wR6qWi?=
 =?us-ascii?Q?V0yoD1nLNo58zLboQjv0LomiBGnCdtxJR5rfJ58ayolgwTq9zKEcZQa+LBOI?=
 =?us-ascii?Q?pBnhz8uWCbOL/LxO/kYFTUCZy4B+wCoSVVrAUGqAImKiusIK0oncWvGSb1D5?=
 =?us-ascii?Q?kT6DUwWPAaTxBgrqGBes3E0Wfe2uKXyzvAb6AaFq/f/ubkDnbnN7OHGWV+XF?=
 =?us-ascii?Q?lFOxqlkJPzWBjW4928ID0Tl5kNDu1wR4jPpFDALgE4djjEFoX2HVdMBAMQxK?=
 =?us-ascii?Q?nXxn6215w2KW+D7PmZqxBOv7pY1Q2HJdUiNyhfH/WEB/ygGfzwzhaBCsH8GJ?=
 =?us-ascii?Q?oA9b/u1ONfKns1LcRMhGZaAnYNeZjU1IgEdNzun6mcttOeFryo/LWyOgckSr?=
 =?us-ascii?Q?k7enhigzlPD97Rx4DZ8ITUF9TgpG96AbbvUi7m835nDN8jg8aKIIHR371hWM?=
 =?us-ascii?Q?hhT338Sr76wAp+4TTYJI7z9e3aVlTjUpjbIKffzhXM7Z?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f8a731-ed9a-463a-27df-08dd97bcacfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 16:37:52.2557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WkPwZ5KOv6H99SORmMd/i3kycYDSPTT4gYxHcQ14m/whu3k/IeeJlkHjPAaFJ1+4Zj7lnq1v5/JcLjycTuwNdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR21MB4000

Here is the usual call for agenda items for this week's SVSM development ca=
ll.  Please send me any agenda items you have in mind or raise them in the =
meeting.

I have only one agenda item, which is to discuss any open PRs or issues tha=
t anyone feels need to be addressed within the next two weeks.  I do not ha=
ve a specific list of PRs or issues to discuss, but if you send me specific=
s in email or raise them in the meeting, then we will be sure to discuss th=
em.

Details of the meeting can be found in our governance repository:
https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:
https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=3D=
week

-Jon
