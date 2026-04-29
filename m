Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E908B3F54C5;
	Wed, 29 Apr 2026 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464238; cv=none; b=KAAxMtQplbrB7BcyONusRFjheZ0y5RPmARyRThrpSDZxjN2f5fsjbWsiAtEDycXH8MoU1pBWxZ6yL9ysNyVxDDmNfCUFG8JOY8QGFB70q4ZTdLU/cyPElp0tqgSeFT027aA2xvzZwWzfFxI0Ay/NWCBzJjWkCLQXQsQWbfb88Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464238; c=relaxed/simple;
	bh=/v7eMW8DkGJ2WLiPctslO0+rRvKUv5BvXFMSo+bAxOU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+dnWBgvuE8+8Lmfd3DA8EsNwI5fPcKFEM8fzx/VskY9QNRrY0aInFRdMysrCW1oBPwgW+B33+64aL1z7pccpARtz45y5J8sfi2re2nM7NTX2Rm8o8MpuGE/4NfO02MFEVCFE44RRProAmQL/8xCQ5+SCx8LAq3EfI04yNaWFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=FRj9TsMK; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="FRj9TsMK"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 663932007C1;
	Wed, 29 Apr 2026 14:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1777464235;
	bh=/v7eMW8DkGJ2WLiPctslO0+rRvKUv5BvXFMSo+bAxOU=;
	h=Date:From:To:Subject:From;
	b=FRj9TsMKf1O3hOvoA1zDe7fmzlXn/s3tCydriW7ceixp2ovVVjlJBxoXeDxonjcae
	 hlBlVbP1a95JlFnhdufmTZDEIrziBjqFep9pZUKS7gbyiZM9Al2TQoAQJk/L6NBy0T
	 V+LnRzsRjQkro5o8UlS4HJDseNW6vUezSk//Y8pA+LLmUxDY6WsFGB+ofxVkwo7r7q
	 H1F3e1Qo2PPytkRCeECFYAYReEEN7L/nN0dGOk/JwLcBOMQeFSB8utnS/X5QZp7hwY
	 qVblqv7ZGXyqcsyGKzWGUAhau9dT7C9WcR/RFL3wyZi9IW9/VhzeK8XEEzixmOFoI2
	 nn26t7CkvjPgg==
Date: Wed, 29 Apr 2026 14:03:54 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Development Release v2026.04-devel
Message-ID: <zfncgtcusdbgfa55ny5gel6nxey3umhm7m5klqmqspun5onaay@lj2h4tqqqlhg>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi all,

It is my pleasure to announce the COCONUT-SVSM development release
v2026.04-devel. It features 75 non-merge commits since the last release, the
highlights are:

  - Added initial VirtIO-VSOCK support in SVSM.

  - Reworked task scheduling and execution control.

  - Refactored virtual memory and page fault handling.

  - Added support for partial TLB flushes, including range-based CPU TLB
    flushing.

  - Updated the IGVM/stage2 boot flow.

  - Expanded kernel test coverage, including compile-time layout assertions
    plus simple stacktrace and symbol-resolution tests.
  
  - Refreshed documentation, especially around attestation, installation
    requirements, and debugging guidance.

All the details are in the shortlog below. A big thanks again to the
COCONUT-SVSM community for all the effort in driving the project forward!

Best,

	Joerg

Shortlog:

Carlos López (32):
      kernel: debug/symbols: fix symtab slice length
      kernel: debug/symbols: add a simple symbol resolution test
      kernel: debug/stacktrace: add a simple stacktrace test
      kernel: cpu/tlb: rename TlbFlushScope::flush_all() to flush_all_cpus()
      kernel: cpu/tlb: allow specifying address ranges in TlbFlushScope
      kernel: cpu/tlb: support partial TLB flushes
      kernel: sev/tlb: strongly type INVLPGB RAX
      kernel: sev/tlb: merge flush_tlb_global_sync and flush_tlb_sync()
      kernel: sev/tlb: hide helper TLB functions
      kernel: sev/tlb: support partial TLB flushes
      kernel: cpu/tlb: expose partial TLB flush functions
      kernel: protocols/core: flush individual PVALIDATE entries
      kernel: sev/tlb: add additional inline assembly flags
      kernel: tests: convert struct layout tests to compile-time assertions
      kernel: mm/address_space: const-compute temporary mapping area size
      kernel: cpu/percpu: initialize vrange allocators in initialize_vm_ranges()
      kernel: mm/vm: remove Mapping type
      kernel: mm/vm/range: remove mapping in one go
      kernel: mm/vm/mapping: remove incorrect documentation
      kernel: mm/vm/range: make VMR::virt_range() return a MemoryRegion
      kernel: task: remove unnecessary unwrap()
      kernel: task: remove unused Task::handle_pf()
      kernel: mm/vm/range: always populate page table as part of #PF handling
      kernel: mm/vm: make handle_page_fault() take &self
      kernel: mm/vm: rewire page faults
      kernel: task/mm: ensure VMR addresses are VMR_GRANULE-aligned
      kernel: mm/vm: check VMR invariants upfront
      libtcgtpm: do not link libcrt for userspace targets
      xbuild: use workspace dependencies
      packit: update to latest commit
      xbuild: use packit as a library
      cpuarch: add CPUID page accessors

Gerd Hoffmann (1):
      libtcgtpm: remove libtcgtpm.a

Joerg Roedel (1):
      COCONUT-SVSM Release 2026.04-devel

Jon Lange (12):
      bootimg: implement `Error` for boot image errors
      igvmbuilder: use `Error::Display` for error messages
      stage2: build boot image in igvmbuilder
      stage2: remove secrets page from stage2
      svsm: validate lowmem in kernel if not done in stage2
      igvmbuilder: define abstraction for IGVM parameter layout
      igvmbuilder: make stage2 optional
      task: remove lock around `TaskSchedState`
      task: enforce mutual exclusion of execution
      task: add task termination test
      task/schedule: modify task rescheduling
      task/schedule: permit scheduler callers to disable interrupts

Luigi Leonardi (14):
      kernel: introduce VsockTransport trait for driver abstraction
      Revert "virtio: remove vsock support"
      virtio-drivers/socket: apply clippy lints
      virtio-drivers/connectionmanager: track connection established state
      virtio-drivers/connectionmanager: reject operations after peer shutdown
      virtio-drivers/connectionmanager: add `is_local_port_used`
      kernel/vsock: introduce virtio-vsock support
      kernel/vsock: introduce VsockStream
      scripts/launch_guest: add vsock to launch_guest
      kernel/vsock: add in-svsm tests for VsockStream
      Makefile: fix clippy with CARGO_HACK
      kernel/vsock: fix SVSM crash in VsockStream when device is not available
      Documentation/ATTESTATION: fix wrong protocol and path in example description
      Documentation/ATTESTATION: correct wrong parameter name

Nicola Ramacciotti (8):
      docs: Move debugging information to developer section
      docs: Improve debugging guide
      docs: Clarify gdb usage
      gitignore: Avoid tracking gdb_history
      github/workflows: Update some actions to Node.js 24
      github/workflows: Fix cargo audit installation
      github/workflows: Unify and always run both compliance checks
      github/workflows: enable vhost support in QEMU build and install netcat

Nihal (1):
      github/workflows: cargo audit

Oliver Steffen (1):
      kernel: Verify ACPI table checksum

Stefano Garzarella (3):
      kernel/ghcb: add missing register offset assertions
      docs/INSTALL: update guest image requirement
      github/workflows: drop explicit checkout ref in PR workflows

Tanya Agarwal (1):
      Actions: add SPDX header check script

Vaishali Thakkar (1):
      igvmbuilder: remove obsolete debug_swap CLI options

