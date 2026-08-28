Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922B43DCDA7;
	Fri, 28 Aug 2026 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920476; cv=none; b=ChKvyNGVZ0oGqFes/wg18uiN9Fglr2QdGC1Cv7ozb1XlJzZS5l/EYmGy1+sO/r+i7S71f/4OHEsGFNeySSgSuqAz70hqWhBfIysefuv09eD8nZzuJv+0A72cP/Bv39v0YmWxkRfV0g4nszRYYxmRJB9bUwm6wNBRXjniIbczNkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920476; c=relaxed/simple;
	bh=eH7sRyB+LzwsPCiJ/Te7a/qWmI6L4dZxZDQCRv0ZQ3U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sEselVUcdPcW/HaFz49u7wNp7qF00/B/iGsOx9TULz5KwGhzaUDWq2roWAw5IzMKbDB7iHHFETymyWgO0o6No0C5Lf3D+Vw2QwgO9KyT0SIsG1n5bI9xO8qn6S6Kg0sUbJ8D55QMyh1q+8NvVgJYsl4gVOuoA5C8Quc/NG8+1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc500e5563a60c846e803.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:e556:3a60:c846:e803])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E190B208433;
	Fri, 28 Aug 2026 14:34:18 +0200 (CEST)
Date: Fri, 28 Aug 2026 14:34:17 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Development Release v2026.08-devel
Message-ID: <apGASdsdel62hae2@8bytes.org>
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

I am happy to anounce the next development release of COCONUT-SVSM. The
community worked hard as usual and so the August 2026 release brings some very
exciting new features. The release contains 118 commits of which 30 are merges
and 88 non-merge commits.

The most exciting new feature is support for vTPM NV state persistence, but
there is more in this release. The highlights are:

  - Added an experimental persistence subsystem backed by CocoonFs with support
    to store vTPM NV state across machine boots.

  - Replaced fw_cfg-based virtio-MMIO discovery with a Flattened Device Tree
    supplied through a new IGVM parameter.

  - Strengthened guest-memory access handling with a GuestPtr cleanup/rewrite
    and fault-safe slice support.

  - Two security fixes:
    - PVALIDATE requests now reject grants for non-writable pages.
    - Improved SNP guest-request error handling, including invalidating VMPCK0
      after unrecoverable send failures.

  - Adoption of the new cpufeature crate to enumerate CPU features.

  - Wait queues now support multiple simultaneous waiters.

  - Userspace components now use the Rust log facade; direct userspace console access was removed.

These and more changes were contributed by 13 people. The full shortlog is
attached.

Happy testing!

Best,

	Joerg

Carlos López (19):
      Merge pull request #1137 from tanish111/cpufeature_impl
      Merge pull request #1093 from osteffenrh/toml-formatting
      kernel: protocols/core: require CAA GPA to be 4K-aligned
      kernel: address: introduce checked align_up() variants
      kernel: mm/ptguards: remove PerCPUPageMappingGuard::create_4k_pages()
      kernel: mm/ptguards: guard against physical address overflows
      kernel: mm/ptguards: keep track of physical region in mapping guard
      kernel: mm/guestmem: rename GuestPtr to TryPtr
      kernel: mm/guestmem: unify write() / write_ref() methods
      kernel: mm/guestmem: check UserPtr bounds at construction
      kernel: mm/guestmem: add slice support for TryPtr
      kernel: mm/guestmem: add slice support to UserPtr
      kernel: mm/guestmem: (re)introduce GuestPtr
      kernel: boot_params: use TryPtr slice methods
      kernel: protocols/core: replace TryPtr with GuestPtr
      kernel: error: translate faults to SysCallError::EFAULT
      kernel: syscall: use UserPtr slice methods
      kernel: test: do not force-exclude vtpm and uefivars
      Merge pull request #1197 from n-ramacciotti/guestmem/slice_borrow_write

Joerg Roedel (9):
      scripts: Add script to run all fuzzers
      CONTRIBUTING.md: Update wording and formatting
      CONTRIBUTING.md: Add bisectability section
      CONTRIBUTING.md: Update warnings policy
      CONTRIBUTING.md: Create a CONTRIBUTING.md in the repository root
      AGENTS.md: Link to CONTRIBUTING.md
      kernel/address: Fix cargo-verify issue
      kernel/greq: Handle all possible send() errors in send_request()
      COCONUT-SVSM Release 2026.08-devel

Jon Lange (1):
      Merge pull request #1006 from luigix25/dtc

Jörg Rödel (19):
      Merge pull request #1173 from stefano-garzarella/release-testplan-fixes
      Merge pull request #1165 from n-ramacciotti/userspace/remove_direct_console_access
      Merge pull request #1177 from stefano-garzarella/fix-vsock-tests
      Merge pull request #1176 from stefano-garzarella/release-testplan-attestation-tpm
      Merge pull request #806 from nicstange/cocoonfs-persistence
      Merge pull request #1114 from mvanhorn/fix/1104-waitqueue-multiple-waiters
      Merge branch 'main' into bump_dep
      Merge pull request #1185 from luigix25/bump_dep
      Merge pull request #1187 from ziqiaozhou/restore-verified-refil-page
      Merge pull request #1186 from 00xc/protocols/fix-gpa-align
      Merge pull request #1188 from ziqiaozhou/fix-ghcb-drop-tlb-flush
      Merge pull request #1189 from ziqiaozhou/add-dirty-bit-parent-flags
      Merge pull request #1192 from joergroedel/contributing
      Merge pull request #1193 from stefano-garzarella/inode-16
      Merge pull request #1191 from 00xc/mm/safeptr-v3
      Merge pull request #1199 from stefano-garzarella/inode-namespace
      Merge pull request #1195 from stefano-garzarella/vtpm-state-cocoonfs
      Merge commit from fork
      Merge commit from fork

Luigi Leonardi (12):
      igvm: add device tree support
      kernel/types: add SVSM_VMPL constant
      virtio/mmio: switch device discovery from fw_cfg to device tree
      fw_cfg: remove virtio-MMIO device discovery
      fw_cfg: remove module and remaining references
      docs: add device tree binding specification
      kernel/virtio: update safe-mmio to version 0.3.1
      Cargo: bump intrusive-collections to 0.10.0
      cargo: bump bitfield-struct to 0.13.0
      cargo: update bindgen to 0.72
      kernel/svsm: enable attestation unit tests
      tools: simplify target cfg in Cargo.toml files

Matt Van Horn (1):
      task: support multiple waiters in WaitQueue

Mehul Sardana (1):
      svsm/core: refuse PVALIDATE grant on non-writable pages

Nicola Ramacciotti (9):
      makefile: Remove broken DISABLE_CONSOLE_LOG
      kernel/log: Remove redundant immut after init
      userlib/test: Reintroduce $crate in macro definitions
      userlib: Use $crate in declare main macro
      userlib: Introduce log crate
      userspace: Use log crate
      kernel/log: Remove userspace console handler
      user/log: Remove console handler
      kernel/guestmem: Support references in slice index writes

Nicolai Stange (13):
      Upgrade cocoon-tpm-utils-common, -tpm2-interface + -crypto deps
      kernel: make cocoon-tpm-crypto dep unconditional
      crypto: manage crypto RNGs at a central place
      attest: use get_svsm_rng()
      locking: implement get_mut() for RawSpinLock + RawRWLock
      locking: implement From<T> for RawSpinLock<T> + RawRWLock<T>
      Add and integrate cocoon-tpm-utils-async dependency
      async: implement busy-polling Rust async task executor
      Add cocoon-tpm-storage dep and wire it up to SVSM's BlockDriver
      persistence: implement persistence_init() to open CocoonFs storage
      persistence: implement inode read + write primitives
      persistence: implement a demo
      Documentation: add developer doc for persistence functionality

Nihal (2):
      kernel/attest: add unit tests for pre-boot attestation
      kernel/protocols/attest: add unit tests for attestation protocol

Oliver Steffen (2):
      Add TOML format style (Taplo)
      Reformat all TOML files with new style

Stefano Garzarella (24):
      scripts/test-in-svsm: replace ncat with a python vsock server
      kernel/vsock: fix flaky double_connect test
      Merge pull request #1179 from joergroedel/fuzzing
      Merge pull request #1166 from n-ramacciotti/userspace/introduce_log_crate
      docs/RELEASE-TESTPLAN: fix typo in TPM test
      docs/RELEASE-TESTPLAN: add install step for verus
      docs/RELEASE-TESTPLAN: add commands to execute in boot tests
      docs/RELEASE-TESTPLAN: replace individual fuzzer sections
      docs/RELEASE-TESTPLAN: extend TPM test section
      docs/RELEASE-TESTPLAN: add attestation tests for vsock and serial
      Merge pull request #1184 from luigix25/bump_safe_mmio
      kernel/persistence: update usable inode start to 16
      Merge pull request #1190 from ziqiaozhou/verus-clean-spec
      Merge pull request #1183 from luigix25/test_attest
      Merge pull request #1196 from 00xc/test/feature-excl
      Revert "persistence: implement a demo"
      kernel/persistence: introduce InodeNamespace for inode allocation
      kernel/persistence: add inode namespace for vTPM service
      kernel/persistence: add inode namespace for UEFI service
      Merge pull request #1200 from luigix25/fix_cargo_comments
      kernel/vtpm: simplify and harden TPM manufacturing
      kernel/vtpm: add CFileBuffer and wire up C file I/O API
      kernel/vtpm: enable persistent NV state
      docs: add security caveats for persistence and attestation

Ziqiao Zhou (5):
      kernel/alloc.verus: reenable verification in refill_page_list
      kernel/sec/ghcb: add missing tlb flush in GhcbPage::drop.
      kernel/pagetable: add Dirty in alloc_pte to prevent future hardware mutations
      verus: remove unused vars in verus spec.
      verus: remove unused spec functions

tanish111 (1):
      kernel: use cpufeature crate for CPUID feature descriptors

