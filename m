Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228003B6362;
	Wed, 29 Jul 2026 05:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785303639; cv=none; b=ArXLsZlYCqyYb+qs2X2HeYGvQO6K8uwSNBBHAcvUAuZ51nav2bdHj0xEwx0ucD7Tr+r2EGBnSwhmHvRHY9SmedbhI/gq769c6kNZUy5mcne/PscCh3PvNgeIsrzyWmKWsTP2Vet0q6EhE7vY0noM/3TCPuVYB4JfdMx/Z5xRDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785303639; c=relaxed/simple;
	bh=iSKW+ely5f1v3UWV7H9Bma1VLaf89Vjy8vuohlnkczs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cqwe86FUS3SVpqj9j9GAhG0QuQ4alGkzgpKRLaP4ZI2/WBcN1yPcQT3ePRqiw6Sml7D5qspMPXI1o554oCW22D2KVJvztg8a2/CcIOBRrd6RQJ7+aciZAlgty+ZJhA658TZiIpKKXctJhLzjRvCbxKAfKQdtGWV4vqOLkgLHGrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc50076d79898b4e226b9.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:76d7:9898:b4e2:26b9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AFC7D2409E6;
	Wed, 29 Jul 2026 07:40:35 +0200 (CEST)
Date: Wed, 29 Jul 2026 07:40:34 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Development Release v2026.07-devel
Message-ID: <ammSUle7wmSyyblx@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

It is the end of the month again which means it is time for another
COCONUT-SVSM development release. The v2026.07-devel release is now tagged and
features has 33 merges which brought in 88 non-merge commits into the
code-base.

Some of the highlights are:

  - Added a new kernel log-buffer infrastructure, including per-task log
    buffers, a userspace syscall path, userspace print redirection, and basic
    log-buffer tests.

  - Improved task execution and lifecycle handling, including cleaner
    kernel/user task stack initialization, ELF parsing in the new-task context,
    non-page-aligned ELF segment handling, and task termination with exit status.

  - Strengthened attestation handling by aligning SVSM_ATTEST_SERVICES behavior
    with the specification, simplifying report generation paths, adding
    guest-conversion helpers, improving transport error propagation, gating
    serial fallback behind attest-serial, and zeroizing sensitive
    attestation/secrets material on drop.

  - Added userspace test support through a custom user library test runner and
    a new user/uapi_tester crate, with test-in-SVSM now running userspace tests
    after kernel tests.

  - Improved virtual APIC support by allowing enable/disable control for all
    interrupt vectors.

  - Reduced unnecessary allocations across filesystem, ACPI, request handling,
    and debug test code paths.

  - Updated Verus integration for newer finite set/map behavior and mut-ref
    support, with related verification fixes.

  - Cleaned up build and CI behavior, including QEMU branch references,
    bare-metal package handling in the Makefile, linker flags for bldr, rustfmt
    edition configuration, SPDX pre-commit checks, and target-name
    normalization.

  - Added project guidance for AI agents via AGENTS.md and documentation, plus
    a documented release testing process.

  - Removed stale documentation and duplicate README sections.

This cycle includes changes by 11 contributors. More in the shortlog below.

Happy testing!

Best,

	Joerg

Carlos López (31):
      kernel: protocols/attest: spec-align SVSM_ATTEST_SERVICES request
      kernel: protocols/attest: unify get_attestation_report() branches
      kernel: error: remove AttestError
      kernel: sev/secrets_page: zero out VMPCK copies on drop
      kernel: enable `zeroize` feature for aes-gcm
      kernel: crypto: add SecretSlice::new_sized()
      kernel: attest: zeroize CEK on drop
      kernel: attest: zeroize KEK on drop
      kernel: update aes-kw crate and enable `zeroize` feature
      kernel: mm/pagetables: ensure progress in PageTable::unmap_region()
      kernel: virtio/hal: remove virtio_init()
      kernel: debug/gdbstub: do not needlessly use Vec in test
      kernel: acpi/tables: remove unneeded allocations
      kernel: requests: do not use a Vec to store modified registers
      kernel: sev/hv_doorbell: treat NoEoiRequired as a single field
      repo: add AGENTS.md
      Documentation: document AGENTS.md
      Merge pull request #1158 from n-ramacciotti/readme/fix_double_doc
      Merge pull request #1075 from MelodyHuibo/configure_all_vectors
      Merge pull request #1163 from stefano-garzarella/clippy_default_followup
      kernel: fs/filesystem: reorganize file handle locking
      kernel: fs/filesystem: simplify RawFileHandle::truncate()
      kernel: fs: do not clone task name on stdout open
      kernel: task: prefer Arc<str> over String to store task name
      kernel: task: allow passing owned binary string to exec_user()
      kernel: fs: remove unnecessary allocations on Directory operations
      kernel: fs/tests: remove more allocations
      kernel: fs/init: remove unnecessary linkage of alloc crate
      kernel: fs/filesystem: inline RawFileHandle into FileHandle
      Merge pull request #1170 from 00xc/fs/locking-cleanups-v2
      Merge pull request #1172 from 00xc/remove-allocs

Joerg Roedel (16):
      Documentation: Document Release Testing Process
      aproxy: Update anyhow dependency
      kernel/task: Consolidate user-task stack initialization
      kernel/task: Consolidate kernel-task stack initialization
      kernel/task: Do stack-frame alignment check at compile time
      kernel/task: Consolidate kernel- and user-task stack initialization
      kernel/task: Align kernel- and user-thread launch process
      kernel/task: Move ELF parsing into context of the new task
      kernel/cpu: Re-write shadow stack initialization
      kernel/guestmem: Fix label position in copy_bytes()
      kernel/idt: Handle kernel page-faults to user-memory
      elf: Add Copy + Clone to some structs
      kernel/guestmem: Provide zero_user_mem() function
      kernel/task: Handle non-page-aligned segments correctly
      user: Remove custom linker script
      COCONUT-SVSM Release 2026.07-devel

Jon Lange (3):
      irq: assume the availablity of interrupts on all systems
      clippy: allow `new_without_default`
      Merge pull request #1159 from luigix25/fix_clippy

Jörg Rödel (12):
      Merge pull request #1148 from luigix25/fix_rustfmt
      Merge pull request #1133 from 00xc/sev/hv_doorbell
      Merge pull request #1147 from tanish111/fix_pre_commit
      Merge pull request #1128 from n-ramacciotti/task/save_exit_code
      Merge pull request #1150 from msft-jlange/use_irqs
      Merge pull request #1146 from joergroedel/test-plan
      Merge pull request #1160 from n-ramacciotti/xbuild/fix_target_name
      Merge pull request #1162 from msft-jlange/clippy_default
      Merge pull request #1153 from joergroedel/task-exec
      Merge pull request #1154 from joergroedel/fixes
      Merge pull request #926 from n-ramacciotti/feature/test_in_svsm_userspace
      Merge pull request #52 from vsntk18/svsm_log_buffer

Luigi Leonardi (12):
      rustfmt: Add edition to rustfmt.toml
      kernel/platform: allow unused_unsafe on __cpuid_count call
      kernel/attest: change Transport lifetime to 'static
      kernel/attest: propagate errors from transport construction
      kernel/attest: gate serial fallback behind `attest-serial` feature
      Documentation/ATTESTATION: update transport documentation
      docs: remove stale fw_cfg ACPI path override instructions
      Makefile: refactor bare-metal packages into a variable
      Makefile: exclude bldr from workspace clippy
      bldr: always pass --build-id=none linker flag
      github/workflows: update QEMU branch reference from svsm-igvm to svsm
      virtio/mmio: account for page offset in transport size

Melody Wang (1):
      apic: support enable/disable for all interrupt vectors

Nicola Ramacciotti (12):
      README.md: Squash duplicate documentation sections
      kernel/task: Differentiate type of exits
      kernel/task: Introduce exit status field
      kernel/task: Introduce termination with exit status
      userlib/console: use `$crate` in macro definitions
      kernel/filesystem: Allow non empty root during tests
      user/lib: Introduce custom test runner
      kernel/test-in-svsm: Rename test harness main
      kernel/test-in-svsm: Move exit from QEMU out of test runner
      kernel/test-in-svsm: Run userspace tests after kernel tests
      user/uapi_tester: Add new crate for testing purposes
      xbuild/test: Replace dashes in package name

Peter Fang (1):
      Merge pull request #1118 from 00xc/mm/pgtables/minor-fixes

Stefano Garzarella (16):
      Merge pull request #1136 from 00xc/attest/zeroizing
      Merge pull request #1139 from 00xc/virtio/remove-init
      kernel/attest: add try_from_guest() to attestation structures
      Merge pull request #1156 from joergroedel/anyhow-update
      Merge pull request #1120 from 00xc/agents
      Merge pull request #1130 from 00xc/protocols/attest/spec
      Merge pull request #1152 from 00xc/remove-allocs
      clippy: followup on allowing `new_without_default`
      Merge pull request #1155 from joergroedel/elf-fixes
      Merge pull request #1161 from luigix25/unsafe
      Merge pull request #1168 from luigix25/fix_doc
      Merge pull request #1149 from stefano-garzarella/attest-try_from_guest
      Merge pull request #1169 from luigix25/fix_ci
      Merge pull request #1151 from ziqiaozhou/update-verus
      Merge pull request #1167 from luigix25/fix_mmio_size
      Merge pull request #1095 from luigix25/disable_fallback

Vasant Karasulli (12):
      kernel/log_buffer: Introduce line buffer
      log buffer: attach log to task during task creation
      log buffer: redirect log messages to log buffer instead of console
      log buffer: add syscall to write to log buffer
      log buffer: redirect user space print messages to log buffer
      log buffer: add tests for basic functionality
      console log: Add a feature to control console logging
      log buffer test: move log_reset function inside tests module
      console: remove unused symbols
      log buffer test: wait for task to terminate
      log_buffer: drop enable-console-log feature from syscall
      console output: keep it enabled for RELEASE builds for now

Ziqiao Zhou (4):
      verus: upgrade verus version to include the new mut-ref feature
      verification: fix bad #[verus_verify]
      verus: Adapt to finite sets and maps
      verus: allow(unknown_automatic_derive) to remove warning in Verus.

tanish111 (1):
      scripts: align pre-commit SPDX check with check-spdx.sh

