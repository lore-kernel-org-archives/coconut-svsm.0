Return-Path: <Huibo.Wang@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::628])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 3EBF74827A
 for <svsm-devel@coconut-svsm.dev>; Tue, 15 Apr 2025 17:17:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wriSEz5Kaypyk/4dhqu7QujpN3zuwhM8HYb5mcA1r4=;
 b=Jis2NskzVEBrdViz8czpQBZZSs2atC91/mgTJSTX1K5g7+Nad0gwXEQVPZkzJLOoRDOliI5j+tAIHkV+sFbYA0JFs8HOhhxntULPmQdRbfkDjGbju0mJQ1o+0NzWuxS1ccikOCpo9yLT4UBQt/HSMm9KYQBOoEsOqNNzo0TIjGA=
From: "Wang, Huibo" <Huibo.Wang@amd.com>
Date: Tue, 15 Apr 2025 15:17:00 +0000
Message-ID: <IA1PR12MB8285E6DDDE56B6BFDE7D2EA495B22@IA1PR12MB8285.namprd12.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_IA1PR12MB8285E6DDDE56B6BFDE7D2EA495B22IA1PR12MB8285namp_"
MIME-Version: 1.0
Subject: [svsm-devel] Clear the guest busy bit when Alternated Injection is
 enabled
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

--_000_IA1PR12MB8285E6DDDE56B6BFDE7D2EA495B22IA1PR12MB8285namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,

I am currently working towards enabling Alternate Injection in Linux and Co=
conut SVSM.

When I start a guest, I hit a KVM internal error - VMEXIT_BUSY.  In guests =
that run with Alternate Injection, bit 63 of the encrypted VIntrCtrl field =
is defined as a BUSY bit. On VMRUN, if VIntrCtrl[BUSY] is set to 1, then th=
e VMRUN fails with a VMEXIT_BUSY error code. The BUSY bit enables a VMSA to=
 be temporarily marked non-runnable while software modifications are in pro=
gress.

When KVM is trying to deliver an interrupt or exception into the guest whil=
e a VMEXIT happens, then the busy bit gets set in the guest's VMSA. So VMPL=
0 needs to come in a re-inject the event to the guest.

To solve this problem, the HV should not wait for VMEXIT_BUSY.  If it sees =
that EXITINTINFO.V=3D1 on an exit and Alternate Injection is enabled, it sh=
ould invoke VMPL0 to clear the busy bit and then ask to switch to run the g=
uest which will keep running the interrupted interrupt/exception.

The question is how would we like the communication between HV and SVSM to =
look like when it comes to the HV letting the SVSM know that the guest's bu=
sy bit needs to get cleared before it runs again?

For example, should the HV explicitly set something in the HVDB page indica=
ting that the SVSM should clear its guest's busy bit or should the SVSM its=
elf always check the busy bit before running the guest and clear it if set?

Or any other, better idea?

Thanks,
Melody


--_000_IA1PR12MB8285E6DDDE56B6BFDE7D2EA495B22IA1PR12MB8285namp_
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
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
Hi,<br>
<br>
I am currently working towards enabling Alternate Injection in Linux and Co=
conut SVSM.<br>
<br>
When I start a guest, I hit a KVM internal error - VMEXIT_BUSY.&nbsp; In gu=
ests that run with Alternate Injection, bit 63 of the encrypted VIntrCtrl f=
ield is defined as a BUSY bit. On VMRUN, if VIntrCtrl[BUSY] is set to 1, th=
en the VMRUN fails with a VMEXIT_BUSY
 error code. The BUSY bit enables a VMSA to be temporarily marked non-runna=
ble while software modifications are in progress.<br>
<br>
When KVM is trying to deliver an interrupt or exception into the guest whil=
e a VMEXIT happens, then the busy bit gets set in the guest's VMSA. So VMPL=
0 needs to come in a re-inject the event to the guest.<br>
<br>
To solve this problem, the HV should not wait for VMEXIT_BUSY.&nbsp; If it =
sees that EXITINTINFO.V=3D1 on an exit and Alternate Injection is enabled, =
it should invoke VMPL0 to clear the busy bit and then ask to switch to run =
the guest which will keep running the interrupted
 interrupt/exception.<br>
<br>
The question is how would we like the communication between HV and SVSM to =
look like when it comes to the HV letting the SVSM know that the guest's bu=
sy bit needs to get cleared before it runs again?&nbsp;<br>
<br>
For example, should the HV explicitly set something in the HVDB page indica=
ting that the SVSM should clear its guest's busy bit or should the SVSM its=
elf always check the busy bit before running the guest and clear it if set?=
<br>
<br>
Or any other, better idea?</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
Melody</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
</body>
</html>

--_000_IA1PR12MB8285E6DDDE56B6BFDE7D2EA495B22IA1PR12MB8285namp_--
