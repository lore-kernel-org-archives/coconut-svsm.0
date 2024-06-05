Return-Path: <Thomas.Lendacky@amd.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id EED391C3F08
 for <svsm-devel@coconut-svsm.dev>; Wed,  5 Jun 2024 17:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gmh+Tteuz6OrhmSzXqoyz0CkeOHfGpa12bb7FZXfAZ0=;
 b=bGuaEnspZv42Gl9Twgm0aS8b4x7TlW+hYUOI7PC0ja4TZiMY1CiSuwzvAfIsIJjUikGacAktCCkxCG36a0TvPpmtsPhvtG34LGa7h455FnK7QelDfTtC0TTgV+hazV8GucgcErWr/+xIwC1h9YkMofEwg/0HvB+S6h63rL0wDD4=
From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 5 Jun 2024 10:18:43 -0500
Message-ID: <cover.1717600736.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] [PATCH v5 00/13] Provide SEV-SNP support for running
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
By running at a less privileged VMPL, the SVSM can be used to provide
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
    from the SVSM and allowing attributes to be hidden
  - Detecting and allowing Linux to run in a VMPL other than 0 when an
    SVSM is present

The series is based off of and tested against the tip tree:
  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master

  77db0895e650 ("Merge branch into tip/master: 'x86/percpu'")

[1] https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
[2] https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56421.pdf

Cc: Joel Becker <jlbec@evilplan.org>
Cc: Christoph Hellwig <hch@lst.de>

---

Changes in v5:
- Create native versions of local_irq_save()/local_irq_restore().
- Add RIP_REL_REF() calls to functions executed early in boot.
- Fix logic around the return value of the SVSM invocations. This required
  changes where svsm_perform_call_protocol() is invoked to check the
  SVSM return value in the struct svsm_call variable.
- Update configfs support to only recognize group attributes associated
  with a particular item when checking for visibility (don't check for
  a default group).
- Move TSM configfs visibility support from the default group to the
  TSM report attributes.
- Simplify generated assembly for SVSM protocol invocation.
- Remove simple VMPL level accessor function and make the vmpl variable
  global. Rename it from vmpl to snp_vmpl.
- Miscellaneous updates (i.e. initialize variable when declared, rename
  functions, shorten variable names, etc.).
- Documentation updates.

Changes in v4:
- Add a pre-patch to rename the struct snp_secrets_page_layout to just
  snp_secrets_page.
- Move the config-fs visibility support to be group based and referenced
  by an index. Remove the macro changes that set the visibility function
  for an entry.
- Make the TSM visibility support vendor specific via an ops callback.
- Use the rmpadjust() function directly and remove the enforce_vmpl0()
  function.
- Consolidate common variables into arch/x86/kernel/sev-shared.c.

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


Tom Lendacky (13):
  x86/irqflags: Provide native versions of the
    local_irq_save()/restore()
  x86/sev: Check for the presence of an SVSM in the SNP Secrets page
  x86/sev: Use kernel provided SVSM Calling Areas
  x86/sev: Perform PVALIDATE using the SVSM when not at VMPL0
  x86/sev: Use the SVSM to create a vCPU when not in VMPL0
  x86/sev: Provide SVSM discovery support
  x86/sev: Provide guest VMPL level to userspace
  virt: sev-guest: Choose the VMPCK key based on executing VMPL
  configfs-tsm: Allow the privlevel_floor attribute to be updated
  fs/configfs: Add a callback to determine attribute visibility
  x86/sev: Take advantage of configfs visibility support in TSM
  x86/sev: Extend the config-fs attestation support for an SVSM
  x86/sev: Allow non-VMPL0 execution when an SVSM is present

 Documentation/ABI/testing/configfs-tsm        |  63 +++
 .../ABI/testing/sysfs-devices-system-cpu      |  12 +
 .../arch/x86/amd-memory-encryption.rst        |  23 +
 Documentation/virt/coco/sev-guest.rst         |  11 +
 arch/x86/boot/compressed/sev.c                |  83 +++-
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/irqflags.h               |  20 +
 arch/x86/include/asm/msr-index.h              |   2 +
 arch/x86/include/asm/sev-common.h             |  18 +
 arch/x86/include/asm/sev.h                    | 136 +++++-
 arch/x86/include/uapi/asm/svm.h               |   1 +
 arch/x86/kernel/sev-shared.c                  | 457 +++++++++++++++++-
 arch/x86/kernel/sev.c                         | 442 ++++++++++++++---
 arch/x86/mm/mem_encrypt_amd.c                 |   8 +-
 drivers/virt/coco/sev-guest/sev-guest.c       | 203 +++++++-
 drivers/virt/coco/tdx-guest/tdx-guest.c       |  26 +-
 drivers/virt/coco/tsm.c                       | 177 +++++--
 fs/configfs/dir.c                             |  10 +
 include/linux/configfs.h                      |   3 +
 include/linux/tsm.h                           |  59 ++-
 20 files changed, 1596 insertions(+), 159 deletions(-)

-- 
2.43.2

