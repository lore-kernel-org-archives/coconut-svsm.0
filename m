Return-Path: <ziqiaozhou@microsoft.com>
Received: from CY4PR02CU008.outbound.protection.outlook.com
 (mail-westcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 8DF652A88DA
 for <svsm-devel@coconut-svsm.dev>; Thu, 24 Oct 2024 22:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NvghneIa6J/fR2gKIEt1WFZNCAVP0WcAoyTwzxZ1HM=;
 b=Du+C3OsNjPp4uQmnSi21TOHmtw+euvFsSCDvVKZLAAKWUeYqZ89wrkNh0wMYjPvaEoD/gGFeVt8g1CzQpdgJPkUkxgfwxjExqHE3tio2/4wpUU7WLHsOBzPCQQU63nbA4TXkPu3fCHrvUfAADvWdwb5Kh1lzHGzbyaC0iG5VlM0=
From: Ziqiao Zhou <ziqiaozhou@microsoft.com>
Date: Thu, 24 Oct 2024 20:04:24 +0000
Message-ID: <DS7PR21MB31003F212E5E794D93E8EA59CC4E2@DS7PR21MB3100.namprd21.prod.outlook.com>
References: <ZxiIIxuWHa_Vs28L@8bytes.org> <Zxn-BvVKj2ZdYWeQ@8bytes.org>
In-Reply-To: <Zxn-BvVKj2ZdYWeQ@8bytes.org>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DS7PR21MB31003F212E5E794D93E8EA59CC4E2DS7PR21MB3100namp_"
MIME-Version: 1.0
Subject: Re: [svsm-devel] [EXTERNAL] Re: SVSM Development Call October 23rd, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Cc: Weidong Cui <Weidong.Cui@microsoft.com>, Chris Hawblitzel <Chris.Hawblitzel@microsoft.com>

--_000_DS7PR21MB31003F212E5E794D93E8EA59CC4E2DS7PR21MB3100namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks, Joerg. The meeting note looks good to me.

-Ziqiao
________________________________
From: J=F6rg R=F6del <joro@8bytes.org>
Sent: Thursday, October 24, 2024 12:57 AM
To: svsm-devel@coconut-svsm.dev <svsm-devel@coconut-svsm.dev>; linux-coco@l=
ists.linux.dev <linux-coco@lists.linux.dev>
Cc: Ziqiao Zhou <ziqiaozhou@microsoft.com>; Weidong Cui <Weidong.Cui@micros=
oft.com>
Subject: [EXTERNAL] Re: [svsm-devel] SVSM Development Call October 23rd, 20=
24

Meeting minutes are now posted as a PR here:

        https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgithub.com%2Fcoconut-svsm%2Fgovernance%2Fpull%2F31&data=3D05%7C02%7Cziqiao=
zhou%40microsoft.com%7C9801c3bc8b244b4b0b9108dcf40194f7%7C72f988bf86f141af9=
1ab2d7cd011db47%7C1%7C0%7C638653534849191878%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&s=
data=3D6HQwKHebBE%2FLLgzT5dQk96u10gSo6TeBJhvqngvjnzg%3D&reserved=3D0<https:=
//github.com/coconut-svsm/governance/pull/31>

If you find anything missing, please let me know by replying here or
propose changes to the PR.

Thanks,

        Joerg

--_000_DS7PR21MB31003F212E5E794D93E8EA59CC4E2DS7PR21MB3100namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks, Joerg. The meeting note looks good to me.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
-Ziqiao</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> J=F6rg R=F6del &lt;jo=
ro@8bytes.org&gt;<br>
<b>Sent:</b> Thursday, October 24, 2024 12:57 AM<br>
<b>To:</b> svsm-devel@coconut-svsm.dev &lt;svsm-devel@coconut-svsm.dev&gt;;=
 linux-coco@lists.linux.dev &lt;linux-coco@lists.linux.dev&gt;<br>
<b>Cc:</b> Ziqiao Zhou &lt;ziqiaozhou@microsoft.com&gt;; Weidong Cui &lt;We=
idong.Cui@microsoft.com&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: [svsm-devel] SVSM Development Call October 2=
3rd, 2024</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Meeting minutes are now posted as a PR here:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://github.com/co=
conut-svsm/governance/pull/31">https://nam06.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fgithub.com%2Fcoconut-svsm%2Fgovernance%2Fpull%2F31&=
amp;data=3D05%7C02%7Cziqiaozhou%40microsoft.com%7C9801c3bc8b244b4b0b9108dcf=
40194f7%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638653534849191878%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3D6HQwKHebBE%2FLLgzT5dQk96u10gSo6TeBJhv=
qngvjnzg%3D&amp;reserved=3D0</a><br>
<br>
If you find anything missing, please let me know by replying here or<br>
propose changes to the PR.<br>
<br>
Thanks,<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Joerg<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS7PR21MB31003F212E5E794D93E8EA59CC4E2DS7PR21MB3100namp_--
