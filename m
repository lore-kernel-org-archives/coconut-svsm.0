Return-Path: <Huibo.Wang@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::60d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 3BEDA46A8C
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Mar 2025 23:21:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xYj4tZhyaeyY45qPLql1O9QHQsKdXW2WpwYeNsR3AY=;
 b=ZWxYfPA4MMAU8bhjwcIA+VTProkPNclzPM2W+KrGbOyIBrasxTF0WaoIlGr+Xu5zS4HYXCuJyDx1zRBoxOqVKF17tw+BivXYZrLvF2S/McpTr5M/P2osp3qXrdXjubmNxI6TlFWaUZflRQnk0Eo4K5rw2NEeB8y96qXDDrHZShc=
Message-ID: <4732241e-b706-481b-a73a-01ef77622d8a@amd.com>
Date: Wed, 26 Mar 2025 15:21:02 -0700
MIME-Version: 1.0
Content-Language: en-US
From: "Melody (Huibo) Wang" <huibo.wang@amd.com>
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] RESEND: SEV-SNP Alternate Injection
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
Content-Type: text/plain; charset="utf-8"

Hi,

I am currently enabling Alternate Injection for SEV-SNP guests and have encountered a design issue.

The Alternate Injection specification which is a preliminary spec supports only the SVSM APIC protocol through a subset of X2APIC MSRs, Timer support is configurable, If timer functionality is not supported, the guest must rely on the hypervisor to emulate timer support through use of the #HV Timer GHCB protocol.

When the OVMF firmware starts, it is in XAPIC mode by default and then, later during the init phase it switches the guest to X2APIC. However, with Alternate Injection enabled, the OVMF in its very first phase - SEC - does XAPIC accesses. The SVSM uses a so-called SVSM APIC protocol which uses a subset of the X2APIC MSRs.

The OVMF, however, thinks it starts off in XAPIC memory-mapped mode. There's a protocol mismatch of sorts. With Alternate Injection enabled in the SEC phase, it requires X2APIC. The registers (timer registers) - not handled by SVSM will get routed to KVM, which at that point is operating the guest in XAPIC mode until the PEI phase switches to X2APIC.

One potential solution is to have KVM enable X2APIC as soon as Alternate Injection is activated. While we could start X2APIC during the creation of the vCPU, APM Volume 2, Figure 16-32 states that we must transition from XAPIC mode to X2APIC mode first.

More specifically:

“If the feature is present, the local APIC is placed into x2APIC mode by setting bit 10 in the Local APIC Base register (MSR 01Bh). Before entering x2APIC mode, the local APIC must first be enabled (AE=1, EXTD=0).”

Therefore, I am uncertain if enabling X2APIC directly during vCPU creation is permissible.

Do you have any suggestions for a better solution?

Please feel free to ask questions if some concepts are unclear and I'll gladly expand on them.

Thanks,
Melody
