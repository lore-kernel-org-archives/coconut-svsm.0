Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 327351E260A
 for <svsm-devel@coconut-svsm.dev>; Mon, 25 Mar 2024 23:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwWIXREHGcY1lXHm7F6cXK5K+IHL6Jp+VSHGKCm0Lw0=;
 b=z9IciR6vtTLW3kabTygOE20VKAwwFP3wnq/90+zMtHCnIP2JQVH8eWgGPs9wT9YgugVra3HMRd4ItpjNf1UYi8qRms6wz0h0BfYPToEiSvowGpft7QBuqw30+4/ymtdIlea7VZAj2Yr7iM1LE5hRbIusluYQ+rTLKBWIb8c9ra0=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Mon, 25 Mar 2024 17:26:19 -0500
Message-ID: <cover.1711405593.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v3 00/14] Provide SEV-SNP support for running
 under an SVSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"

This series adds SEV-SNP support for running Linux under an Secure VM
Service Module (SVSM) at a less privileged VM Privilege Level (VMPL).
By running at a less priviledged VMPL, the SVSM can be used to provide
services, e.g. a virtual TPM, for Linux within the SEV-SNP confidential
VM (CVM) rather than trust such services from the hypervisor.

Currently, a Linux guest expects to run at the highest VMPL, VMPL0, and
there are certain SNP related operations that require that VMPL level.
Specifically, the PVALIDATE instruction and the RMPADJUST instruction
when setting the VMSA attribute of a page (used when starting APs).

If Linux is to run at a less privileged VMPL, e.g. VMPL2, then it must
use an SVSM (which is running at VMPL0) to perform the operations that
it is no longer able to perform.

How Linux interacts with and uses the SVSM is documented in the SVSM
specification [1] and the GHCB specification [2].

This series introduces support to run Linux under an SVSM. It consists
of:
  - Detecting the presence of an SVSM
  - When not running at VMPL0, invoking the SVSM for page validation and
    VMSA page creation/deletion
  - Adding a sysfs entry that specifies the Linux VMPL
  - Modifying the sev-guest driver to use the VMPCK key associated with
    the Linux VMPL
  - Expanding the config-fs TSM support to request attestation reports
    from the SVSM
  - Detecting and allowing Linux to run in a VMPL other than 0 when an
    SVSM is present

The series is based off of and tested against the tip tree:
  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master

  4e2b6e891aae ("Merge branch into tip/master: 'x86/shstk'")

[1] https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
[2] https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56421.pdf

Cc: Joel Becker <jlbec@evilplan.org>
Cc: Christoph Hellwig <hch@lst.de>

---

Changes in v3:
- Rename decompresor snp_setup() to early_snp_setup() to better indicate
  when it is called.
- Rename the "svsm" config-fs attribute into the more generic
  "service_provider" attribute that takes a name as input.
- Change config-fs visibility function to be a simple bool return type
  instead of returning the mode.
- Switch to using new RIP_REL_REF() macro and __head notation where
  appropriate.

Changes in v2:
- Define X86_FEATURE_SVSM_PRESENT and set the bit in the CPUID table,
  removing the need to set the CPUID bit in the #VC handler.
- Rename the TSM service_version attribute to service_manifest_version.
- Add support to config-fs to hide attributes and hide the SVSM attributes
  when an SVSM is not present.


Tom Lendacky (14):
  x86/sev: Rename snp_init() in the boot/compressed/sev.c file
  x86/sev: Make the VMPL0 checking function more generic
  x86/sev: Check for the presence of an SVSM in the SNP Secrets page
  x86/sev: Use kernel provided SVSM Calling Areas
  x86/sev: Perform PVALIDATE using the SVSM when not at VMPL0
  x86/sev: Use the SVSM to create a vCPU when not in VMPL0
  x86/sev: Provide SVSM discovery support
  x86/sev: Provide guest VMPL level to userspace
  virt: sev-guest: Choose the VMPCK key based on executing VMPL
  configfs-tsm: Allow the privlevel_floor attribute to be updated
  x86/sev: Extend the config-fs attestation support for an SVSM
  fs/configfs: Add a callback to determine attribute visibility
  x86/sev: Hide SVSM attestation entries if not running under an SVSM
  x86/sev: Allow non-VMPL0 execution when an SVSM is present

 Documentation/ABI/testing/configfs-tsm  |  69 ++++
 arch/x86/boot/compressed/sev.c          | 256 ++++++++------
 arch/x86/coco/core.c                    |   4 +
 arch/x86/include/asm/cpufeatures.h      |   1 +
 arch/x86/include/asm/msr-index.h        |   2 +
 arch/x86/include/asm/sev-common.h       |  18 +
 arch/x86/include/asm/sev.h              | 114 ++++++-
 arch/x86/include/uapi/asm/svm.h         |   1 +
 arch/x86/kernel/sev-shared.c            | 345 ++++++++++++++++++-
 arch/x86/kernel/sev.c                   | 424 +++++++++++++++++++++---
 arch/x86/mm/mem_encrypt_amd.c           |   8 +-
 drivers/virt/coco/sev-guest/sev-guest.c | 166 +++++++++-
 drivers/virt/coco/tsm.c                 |  99 +++++-
 fs/configfs/file.c                      |   7 +
 include/linux/cc_platform.h             |   8 +
 include/linux/configfs.h                | 111 +++++--
 include/linux/tsm.h                     |  13 +-
 17 files changed, 1442 insertions(+), 204 deletions(-)

-- 
2.43.2

