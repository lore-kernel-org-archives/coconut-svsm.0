Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD623806CC;
	Thu, 29 Jan 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681554; cv=none; b=nTKGW3+Z3croGGvMhedJzUs3gVMKoJaSfeFDRN/FAY59gsZTYdk6h92esQTk1cfGrXO0MIlGPUC99iSA4P0Wv2ivarjPG/yN3EWvH+K5cbazQtmfWzR0w+axvsWeNs0meYzQvINKC9+Ch2UwOiNArsPEdpCmTZuNJhcd17228eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681554; c=relaxed/simple;
	bh=zkCo6wgSKwdCDWlS3BVqBUXV673+ivkigLq2q+D3N0M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P6aeOQc+uBsbelgaQgl/n+0HBt6pZIeRTFEyBvpB5pwn3/hcdsiZk3q8Ym4osLcQ99+1krFH1AVsFjKt+RKLqcwi1XVlXvzvRJm+ZNwT8TGsP4J6z6jd9Ep9R7mNT3GhuUSe0LXaW0SY5A3kH19irUOVvQacPgruUP0/0lg5YKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=ry8VXefi; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="ry8VXefi"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0E6DC1C09F5;
	Thu, 29 Jan 2026 11:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769681551;
	bh=zkCo6wgSKwdCDWlS3BVqBUXV673+ivkigLq2q+D3N0M=;
	h=Date:From:To:Subject:From;
	b=ry8VXefiMHz2LXiMaZOr2skZC4YMC4oVXFw9PZxr/KB8ZOvzt9gQKvLHf9V0L5I9b
	 NV9MatDKD4gKyXqPD56euhymqNDeuqg2LcGgxTXQoIqkfCw9+Aip9T01LWkSn0X+3B
	 51/EV0JKS23UCIFPkAxqnOwHkRfLfE5vVqJ9OpTjtM1geRnJIFk+g0IsXJga7XRWA2
	 IFmZSrURF+xHdqPR9PeAqAu+TCLhKAttSD6SJ0CNm5SfuAd76G/41/V09tnXb9Nzpu
	 uBvj0MQFomBfWL2zN4z7xxP5MUnBLKRaBDEPXdHG6NM6G3Z+rdbXpRsGyLfKOFgTQP
	 BsWjes048UgSA==
Date: Thu, 29 Jan 2026 11:12:29 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Development Release v2026.01-devel
Message-ID: <hydnyq6jvecrxarddrrfnvhydjk2tm4f25i3zoyuwd7kyffu7i@my454wlxhkb4>
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

The first development release of COCONUT-SVSM in 2026 it tagged and ready for
wider testing and use. This release includes 96 non-merge commits which bring
really nice improvements to the project.

The highlights include:

	- Move to the Rust 2024 edition. This includes updates to adapt the
	  code-base to changes in Rust language semantics and quite a number of
	  updates for cargo-fmt compliance.

	- Symbolized stack traces for easier debugging. When COCONUT-SVSM
	  prints a kernel stack trace it will now include the symbols in debug
	  builds.

	- Boot flow improvements. The stage2 loader can now allocate directly
	  from the kernel heap and build the initial page-tables for
	  COCONUT-SVSM. Once the kernel boots it does not need to re-build its
	  page-tables.

	- A critical bug has been fixed which caused boot failures using
	  upstream EDK2 firmware.

Besides these highlights there have been numerous other changes to improve the
code-base and fix smaller issues. A big THANKS again to the COCONUT-SVSM
community for all the efforts and contributions. The attached shortlog has all
the details.

Quite a few members of our community will attend FOSDEM in Brussels this
weekend. If you are interested come by and say Hi, we will coordinate us in our
project Matrix chat:

	https://matrix.to/#/#coconut-svsm:matrix.org

I will hang out mostly in the Virtualization, Confidential Computing, and
Kernel Devrooms. Hope to see many of you there.

Regards,

	Joerg

Shortlog:

Carlos López (52):
      xbuild: add shorthand method to get component features
      xbuild/features: simply return feature list to caller
      xbuild: use features in make-based build
      mm/alloc: constify allocate_slab_page()
      mm/alloc: check slab size at compile time
      mm/alloc: convert slab const generics to usize
      address: implement NonNull to VirtAddr conversion
      mm/alloc: type slab allocations as NonNull
      mm/alloc: type SlabPage::next_page as NonNull
      mm/alloc: ensure that SlabPage data pages are freed once
      mm/alloc: introduce SlabCommon::allocate_page_slot()
      mm/alloc: consolidate SlabPage initialization/destruction
      mm/guestmem: implement NonNull to GuestPtr conversion
      cpu/percpu: represent CAA as NonNull instead of VirtAddr
      Makefile: build test kernels via xbuild
      github/workflows: call xbuild on JSON recipes only
      repo: move verification crates into verification/
      platform: mark all page validation operations as unsafe
      debug/stacktrace: cleanup argument usage
      debug/stacktrace: do not allocate when printing a stacktrace
      sev/secrets_page: remove SecretsPageRef
      virtio-drivers: remove unused Cargo.toml file
      cpuarch: update to Rust 2024 edition (no changes)
      libtcgtpm: update to Rust 2024 edition (no changes)
      release: update to Rust 2024 edition (no changes)
      stage1: update to Rust 2024 edition (no changes)
      test: update to Rust 2024 edition (no changes)
      bootlib: update to Rust 2024 edition (format changes)
      elf: update to Rust 2024 edition (format changes)
      fuzz: update to Rust 2024 edition (format changes)
      libaproxy: update to Rust 2024 edition (format changes)
      syscall: update to Rust 2024 edition (format changes)
      tools/aproxy: update to Rust 2024 edition (format changes)
      tools/igvmmeasure: update to Rust 2024 edition (format changes)
      verification: update to Rust 2024 edition (format changes)
      virtio-drivers: update to Rust 2024 edition (format changes)
      xbuild: update to Rust 2024 edition (format changes)
      user: update to Rust 2024 edition (misc. changes)
      tools/igvmbuilder: update to Rust 2024 edition (several changes)
      kernel: update to Rust 2024 edition (several changes)
      repo: use single workspace edition
      scripts/pre-commit: pick up Rust edition from rustfmt.toml
      elf/file: introduce ElfFile::read_verified_phdr()
      elf/file: introduce ElfFile::read_verified_shdr()
      build: keep ELF symbol information in debug builds
      elf/file: parse .symtab section
      elf/file: parse .strtab section
      bootlib: add kernel symbol definitions
      stage2: decouple ELF reading and loading
      stage2: parse ELF symbol information
      SVSM: introduce symbol resolution infrastructure
      debug/stacktrace: resolve symbol addresses

Jon Lange (17):
      igvmmeasure: remove SEV features check
      sev: require the debug register virtualization feature
      vc: remove DR7 ghcb test
      stage2: allocate kernel launch info from kernel heap
      svsm: eliminate static `LAUNCH_INFO`
      kernel: remove valid page bitmap from stage2
      stage2: remove heap alignment requirement
      kernel: allocate initial kernel stack from kernel heap
      kernel: free BSP init stack when it is no longer needed
      kernel: alllocate CPUID page from kernel heap
      kernel: alllocate secrets page from kernel heap
      cpu/idt: don't panic on unhandled user-mode exceptions
      cpu/idt: remove unused handlers
      vpu/vc: panic on a page not validated #VC
      tools/igvmbuilder: fix highest VTL for native builds
      tdp: start APs without going through stage2
      virtio: suppress virtio detection when no fw_cfg is present

Nicola Ramacciotti (7):
      kernel/mm/alloc: Remove unnecessary any()
      kernel/mm/alloc: Remove dead code allowance
      kernel,stage1: Remove the explicit rust-version number
      kernel: Apply clippy suggestion
      repo: Update rust version to 1.87.0
      kernel/mm/address_space: Fix conditional compilation in test module
      kernel/lib: Use compact cfg_attr syntax for test inside svsm

Luigi Leonardi (5):
      virtio: put block code behind the new `block` feature
      verification: add missing SPDX header
      virtio: introduce MMIOSlots structure
      block: introduce BLOCK_DEVICE variable
      virtio: integrate MmioSlot infrastructure with block device subsystem

Peter Fang (5):
      kernel/igvm_params: Allow unaligned guest memory map
      igvmbuilder/ovmf: Use (start, size) for regions instead of (start, end)
      igvmbuilder/ovmf: Sanity check pre-validated regions
      igvmbuilder: Sanity check firmware regions
      kernel/config: Remove check_ovmf_regions()

Joerg Roedel (3):
      kernel: Fix nightly warnings
      kernel/vc: Fix nightly warnings
      COCONUT-SVSM Release 2026.01-devel

Stefano Garzarella (2):
      kernel: fix unused `slots` variable
      virtio/mmio: move fw_cfg check into probe_mmio_slots()

Vaishali Thakkar (2):
      sev/utils: Use iterator combinators for pvalidate and RMP revoke paths
      sev/utils: Improve error handling for pvalidate callers

Ziqiao Zhou (2):
      Upgrade verus lib to 2025-12-07-0054
      verify_external: Remove spec for From, Into, and Integer in verify_external

Geoffrey Ndu (1):
      kernel/protocol/attest: Add extended attestation support

