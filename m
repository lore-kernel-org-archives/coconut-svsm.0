Return-Path: <jlange@microsoft.com>
Received: from CY4PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 3B3D942DBD
 for <svsm-devel@coconut-svsm.dev>; Tue, 18 Feb 2025 22:01:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W3Bdd6sIpLlRCGE9i2wNBiPO2MhaCvdq1v3ozvM4eI=;
 b=d7HJIWXiuASs+WCO22bNfDKP2kFa9QD2rdoempkIjSfARrqjlMJ8uNxi00WuYIsDOSJzcwGS767/NxL+qVsYlwHVZbN419m5dYHAPS/UAa7153xzqa1UbYJDOoykYaQgEAHDmLW/sMThCtXxafpZ4N0/DX4Ee6WORS18AsQ79ss=
From: Jon Lange <jlange@microsoft.com>
Date: Tue, 18 Feb 2025 21:01:48 +0000
Message-ID: <SA6PR21MB43030CD1BA64F4A0CD9C48C5CAFA2@SA6PR21MB4303.namprd21.prod.outlook.com>
References: <CA+bRGFprMx2s6scqXgjdrDUG2JOz0ybp6Srx0g1kp2ahSCoJuA@mail.gmail.com>
In-Reply-To: <CA+bRGFprMx2s6scqXgjdrDUG2JOz0ybp6Srx0g1kp2ahSCoJuA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] [EXTERNAL] virtio-mmio base address: fw_cfg vs IGVM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Oliver Steffen <osteffen@redhat.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

The fixed parameters in the IGVM file are intended to communicate informati=
on that is generally hypervisor-specific, not information that might vary f=
rom one configuration to the next on the same architecture.  For example, H=
yper-V always wants diagnostic information from the paravisor to come over =
COM3, so we select port 3 for the serial console.  The same is true for mem=
ory layout, use of vTOM, and other information that is specifically encoded=
 in the IGVM parameter block because Hyper-V wants the same configuration e=
very time.  This makes those parameters somewhat different from virtio conf=
iguration.

There is a set of unmeasured parameters that can be passed by an IGVM loade=
r.  The only example today of such a parameter that is used by COCONUT-SVSM=
 is the vCPU count.  The philosophy behind unmeasured IGVM parameters was t=
o allow the loader to pass some set of information that is needed to get th=
e guest far enough through the boot process that it can use a more common i=
nterface to query the rest of the hardware state.  In the case of running o=
n QEMU, I would assert that fw_cfg is the primitive interface on top of whi=
ch everything else is built, so exposing the virtio configuration via fw_cf=
g is very reasonable.

Note that the Hyper-V hypervisor doesn't use fw_cfg, but it's also unlikely=
 to use virtio for many of its virtual devices (those would be enumerated o=
ver vmbus), so I don't foresee a compatibility problem exposing virtio via =
fw_cfg.  Until we can identify a hardware resource that we believe must be =
common across hypervisors that do and do not use fw_cfg, I don't think we n=
eed to define something else.  Let's wait until we have a concrete use case=
 before we deviate from the interfaces that are already supported in the co=
de.

-Jon

-----Original Message-----
From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of Oliver =
Steffen
Sent: Tuesday, February 18, 2025 11:05 AM
To: svsm-devel@coconut-svsm.dev
Subject: [EXTERNAL] [svsm-devel] virtio-mmio base address: fw_cfg vs IGVM

[Some people who received this message don't often get email from osteffen@=
redhat.com. Learn why this is important at https://aka.ms/LearnAboutSenderI=
dentification ]

Hi all,

In last week's meeting we talked about communicating the mmio base address =
for the virtio driver to the SVSM via Qemu's fw_cfg interface.

This is easy to do, but now I am unsure how we want to handle hardware info=
rmation in general.

Currently, the serial ports for logging, gdb, etc. are configured via the I=
GVM file.
The address for virtio-mmio is not really a different thing. Shouldn't we u=
se a common approach?

Using the IGVM file makes these things part of the launch measurement and r=
equires rebuilding the file if anything needs to change.
Do we want that? Or should it rather be a run-time configuration?

Thanks.

- Oliver

--
Svsm-devel mailing list
Svsm-devel@coconut-svsm.dev
https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
