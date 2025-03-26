Return-Path: <Huibo.Wang@amd.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::610])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 5422E44326
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Mar 2025 21:53:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57TgtklYAhBqWHR7MNtLFMeYUdUNk0YmnyfmdPl9LI8=;
 b=q/bfzIp/jLyZF/MvF4T9fps21Iurxr6elnLFKGE6A1OcAxC6pBm3lMBAsaBVuzIdK+EU32rSaBYNz1olUlTfdqyJsvPVL8Oj4aQl4f2ljyw8ZAC7Fd8PdESw8pw63pxOEG1/Rbsz0KDK/NgYSHtbJ1zw9NqS4fbG1fFoHSM93MY=
From: "Wang, Huibo" <Huibo.Wang@amd.com>
Date: Wed, 26 Mar 2025 20:53:51 +0000
Message-ID: <CY8PR12MB83004E301EE93CEFCB969E5295A62@CY8PR12MB8300.namprd12.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_CY8PR12MB83004E301EE93CEFCB969E5295A62CY8PR12MB8300namp_"
MIME-Version: 1.0
Subject: [svsm-devel] SEV-SNP Alternate Injection
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "seanjc@google.com" <seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, Jon Lange <jlange@microsoft.com>, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "Kaplan, David" <David.Kaplan@amd.com>, Joerg Roedel <jroedel@suse.de>

--_000_CY8PR12MB83004E301EE93CEFCB969E5295A62CY8PR12MB8300namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,
I am currently enabling Alternate Injection for SEV-SNP guests and have enc=
ountered a design issue.

The Alternate Injection specification which is a preliminary spec supports =
only the SVSM APIC protocol through a subset of X2APIC MSRs, Timer support =
is configurable, If timer functionality is not supported, the guest must re=
ly on the hypervisor to emulate timer support through use of the #HV Timer =
GHCB protocol.

When the OVMF firmware starts, it is in XAPIC mode by default and then, lat=
er during the init phase it switches the guest to X2APIC. However, with Alt=
ernate Injection enabled, the OVMF in its very first phase - SEC - does XAP=
IC accesses. The SVSM uses a so-called SVSM APIC protocol which uses a subs=
et of the X2APIC MSRs.

The OVMF, however, thinks it starts off in XAPIC memory-mapped mode. There'=
s a protocol mismatch of sorts. With Alternate Injection enabled in the SEC=
 phase, it requires X2APIC. The registers (timer registers) - not handled b=
y SVSM will get routed to KVM, which at that point is operating the guest i=
n XAPIC mode until the PEI phase switches to X2APIC.

One potential solution is to have KVM enable X2APIC as soon as Alternate In=
jection is activated. While we could start X2APIC during the creation of th=
e vCPU, APM Volume 2, Figure 16-32 states that we must transition from XAPI=
C mode to X2APIC mode first.

More specifically:

=93If the feature is present, the local APIC is placed into x2APIC mode by =
setting bit 10 in the Local APIC Base register (MSR 01Bh). Before entering =
x2APIC mode, the local APIC must first be enabled (AE=3D1, EXTD=3D0).=94

Therefore, I am uncertain if enabling X2APIC directly during vCPU creation =
is permissible.

Do you have any suggestions for a better solution?

Please feel free to ask questions if some concepts are unclear and I'll gla=
dly expand on them.

Thanks,
Melody

--_000_CY8PR12MB83004E301EE93CEFCB969E5295A62CY8PR12MB8300namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I am currently enabling Alternate Injection for SEV-SNP guests and have enc=
ountered a design issue.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The Alternate Injection specification which is a preliminary spec&nbsp;supp=
orts only the SVSM APIC protocol through a subset of X2APIC MSRs, Timer sup=
port is configurable, If timer functionality is not supported, the guest mu=
st rely on the hypervisor to emulate
 timer support through use of the #HV Timer GHCB protocol.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
When the OVMF firmware starts, it is in XAPIC mode by default and then, lat=
er during the init phase it switches the guest to X2APIC. However, with Alt=
ernate Injection enabled, the OVMF in its very first phase - SEC - does XAP=
IC accesses. The SVSM uses a so-called
 SVSM APIC protocol which uses a subset of the X2APIC MSRs.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The OVMF, however, thinks it starts off in XAPIC memory-mapped mode. There'=
s a protocol mismatch of sorts. With Alternate Injection enabled in the SEC=
 phase, it requires X2APIC. The registers (timer registers) - not handled b=
y SVSM will get routed to KVM, which
 at that point is operating the guest in XAPIC mode until the PEI phase swi=
tches to X2APIC.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
One potential solution is to have KVM enable X2APIC as soon as Alternate In=
jection is activated. While we could start X2APIC during the creation of th=
e vCPU, APM Volume 2, Figure 16-32 states that we must transition from XAPI=
C mode to X2APIC mode first.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
More specifically:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
=93If the feature is present, the local APIC is placed into x2APIC mode by =
setting bit 10 in the Local APIC Base register (MSR 01Bh). Before entering =
x2APIC mode, the local APIC must first be enabled (AE=3D1, EXTD=3D0).=94</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Therefore, I am uncertain if enabling X2APIC directly during vCPU creation =
is permissible.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Do you have any suggestions for a better solution?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please feel free to ask questions if some concepts are unclear and I'll gla=
dly expand on them.</div>
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

--_000_CY8PR12MB83004E301EE93CEFCB969E5295A62CY8PR12MB8300namp_--
