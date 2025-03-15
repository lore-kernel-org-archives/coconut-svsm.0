Return-Path: <Huibo.Wang@amd.com>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 88B6945D4C
 for <svsm-devel@coconut-svsm.dev>; Sun, 16 Mar 2025 00:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/aCYeqv4sk34X/t4iwm/EfzA8FAJB71osgEeIPav6E=;
 b=mpxUkbgAmvjWfYT1mrXeWJ7ImDPUZg5/k7fBeabH6Ph3zdiTyCNbEE69+c/KXY82GMWhow0x2/YS1auj62ZIPQ6TlFccDhhD1shpRoxKy7yLPVF1mmWCEU+jXQ3llnYzgGWlrADCv5oiRFmLCEwUyAh0DcF95/NE87jV1vHRI+g=
From: "Wang, Huibo" <Huibo.Wang@amd.com>
Date: Sat, 15 Mar 2025 23:39:33 +0000
Message-ID: <IA1PR12MB8285CF6764F2D64ADD18890695DD2@IA1PR12MB8285.namprd12.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_IA1PR12MB8285CF6764F2D64ADD18890695DD2IA1PR12MB8285namp_"
MIME-Version: 1.0
Subject: [svsm-devel] Missing X2APIC registers handling in SVSM APIC
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

--_000_IA1PR12MB8285CF6764F2D64ADD18890695DD2IA1PR12MB8285namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,

When I am testing SVSM with Alternate Injection enabled, there are three X2=
APIC registers not implemented in SVSM which is within 0x800-0x8FF (Spuriou=
s Interrupt Vector Register-0x80F, Timer Local Vector Table Entry-0x832 and=
 Timer Initial Count Register-0x838).
But they are accessed from OVMF, what should we do about them?


Thanks,
Melody

--_000_IA1PR12MB8285CF6764F2D64ADD18890695DD2IA1PR12MB8285namp_
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
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
When I am testing SVSM with Alternate Injection enabled, there are three X2=
APIC registers not implemented in SVSM which is within 0x800-0x8FF (Spuriou=
s Interrupt Vector Register-0x80F, Timer Local Vector Table Entry-0x832 and=
 Timer Initial Count Register-0x838).&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
But they are accessed from OVMF, what should we do about them?&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Melody</div>
</div>
</body>
</html>

--_000_IA1PR12MB8285CF6764F2D64ADD18890695DD2IA1PR12MB8285namp_--
