Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622343;
	b=QodT9sTyrTLUbC6DN/p0Rv12CiT3S1c+9C201+kL0KKQlPsnBh17PmAY46kqqvBiL91+
	 NAlQjvonZ7Z7cyaa2R8cxCW0GHC24oEDwZDP+ppqMeUSVLwTV9YZx5SYHem8h9gIJ0GA5
	 9jSV/6084lKxUInqfvhXB206GdQ8TiPto41AghTfnFZgJi/cGnXn+Z3MnEdnEQAOTNZhU
	 VeUGKwUN6o6KjJX9H8RimwiBpt4LQYLIb/DqEq/xaYhDJIUUHyRzwrPO92AW27qYNRkKP
	 N4TnzplfmuEsFhz6ZdHJWdfQr2aNm6tu4Ikdbx6JnVZvmLBP1/lzVgbHOrOB35RC8Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622343;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=9ZuoDNjJsYqTAdu7cRdlPUbD1Jd9yvfGrqXyhtHcNwo=;
	b=brmni2wnV+xPelOR4/Sg637/x3OJ5YgUULXPVRYaWXuVICEdkQdxK6QdXlBZmjed3nXK
	 QtQ/uuSJYEpE0Z6PZAscA0FdlIFQ8pkjnKwdBbqzyBcvIq9GmxKxcqwRd9mnVummWUY8m
	 ZpeBsb9xhIiIwLjYmEYnjn/71L1YLou8MA10CEzok/aoK5V0Jy3YhMeNXsnu5llwWTBLg
	 wkTQRVaGRJknjMVxraByOc80L3/C3fpObQdlZF/ZYAYculJoxgs9Hn9BJHDpF8fjKtTnj
	 /9XzUeIj9o8926Oy0DdT1vAgu+8u8FnVRmEdYjfHzoDbTB1Jiye60xoj1y1yS/49vEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E7D606A6A0;
	Wed, 25 Nov 2026 15:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92E7D606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id CBEFE244EEC;
	Wed, 25 Nov 2026 16:59:00 +0100 (CET)
Date: Wed, 25 Nov 2026 16:58:59 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Development Release v2026.11-devel
Message-ID: <awcFwwnx8TyGlxAk@8bytes.org>
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

The end of the month is approaching quickly - so time for a fresh development
release of COCONUT-SVSM! The 2026.11-devel release is now pushed, tagged, and
marked on GitHub. Compared to last month we are back to a pretty normal amount
of monthly contributions and the release brings some nice improvements and
progress in various areas.

The highlights are:

	* Progress toward Linux userspace compatibility: Userspace now uses the
	  syscall instruction, with Linux x86-64 argument registers, error
	  numbers, and syscall numbers. Standard file descriptors and several
	  syscall behaviors also follow Linux conventions now.

	* PCID support: Per-task Process Context IDs (PCIDs) preserve cached
	  address translations across context switches on supported CPUs,
	  avoiding unnecessary TLB flushes.

	* Simpler CPU initialization and memory handling. CPU startup now uses
	  a common initialization flow with explicit ownership of launch
	  resources across native, SEV-SNP, TDX, and Hyper-V. Memory validation
	  and acceptance code shares page-range iteration logic for 4 KiB and 2
	  MiB pages.

	* Better diagnostics and launch configuration. Early boot messages are
	  buffered until logging becomes available, and terminal line endings
	  are improved. The debug serial port and attestation proxy's vsock
	  port can be selected through the IGVM command line, with
	  corresponding guest-launcher options.

	* Expanded persistence infrastructure. New helpers support inode
	  enumeration and removal, plus atomic batches of writes and removals
	  that reduce the need for separate storage transactions.

	* Dependency maintenance and protocol documentation. Updates address
	  advisories in attestation-proxy dependencies and backport fixes to
	  the TPM's bundled C runtime. The release also adds a specification
	  covering SVSM APIC emulation and its relationship to SNP Alternate
	  Injection.

The changes were added by 99 commits from 12 contributors. Of the 99 commits 26
were merges. The full shortlog is attached.

The next release will likely be a bit smaller, as I plan to tag it towards the
middle of December due to the upcoming christmas holidays.

Happy testing!

-Joerg

Carlos López (10):
      kernel: vtpm/tcgtpm: issue a regular panic on abort()
      kernel: utils/memory_region: add iter_pages_largest()
      kernel: sev/ghcb: use iter_pages_largest() in page_state_change()
      kernel: platform/snp: use iter_pages_largest() in pvalidate_page_range()
      kernel: tdx/tdcall: add td_accept_physical_page()
      kernel: tdx/tdcall: use iter_pages_largest() in td_accept_physical_memory()
      kernel: tdx/tdcall: merge td_accept_virtual_{4k,2m}()
      kernel: tdx/tdcall: use iter_pages_largest() in td_accept_virtual_memory()
      kernel: sev/utils: add pvalidate_page()
      kernel: sev/utils: use iter_pages_largest() in pvalidate_range()

Gerd Hoffmann (3):
      kernel: log with \r\n line endings
      userspace: log with \r\n line endings
      kernel: adapt test cases to \r\n line endings

Joerg Roedel (13):
      kernel/sev: Implement workaround for AMD Erratum 1718
      kernel/cpu: Centralize current CPU initialization
      kernel/smp: Pass owned state through the AP entry path
      kernel/smp: Remove shared CPU staging from PerCpu
      kernel/percpu: Remove paging root staging from PerCpu
      kernel/percpu: Remove context stack staging from PerCpu
      kernel/percpu: Remove shadow stack staging from PerCpu
      kernel/percpu: Remove exception stack staging from PerCpu
      kernel/sev: Keep the SVSM VMSA in a per-CPU key
      deps: Update cookie to fix private cookie nonce reuse
      deps: Update url to fix nested blob URL stack overflow
      deps: Remove the unmaintained pin-utils dependency
      COCONUT-SVSM Release 2026.11-devel

Jon Lange (6):
      boot_params: get debug com port from IGVM command line
      sev/ghcb: fix spelling error
      tdx: propagate EFER_SCE across CPUs
      bldr: fix 16-bit offset calculation
      bldr: fix 16-bit offset calculation (#1267)
      docs: add Alternate Injection specification

Jörg Rödel (17):
      boot_params: get debug com port from IGVM command line (#1164)
      libtcgtpm/libcrt: Backport musl CVE fixes and more (#1253)
      cargo: bump igvm and virtfw-libefi dependencies (#1254)
      kernel: vtpm/tcgtpm: issue a regular panic on `abort()` (#1255)
      sev/ghcb: fix spelling error (#1256)
      Merge commit from fork
      kernel/log: early debug log support (#1241)
      Enter system calls with the syscall instruction instead of int 0x80 (#1246)
      tdx: propagate EFER_SCE across CPUs (#1263)
      Use Linux error numbers in SysCallError (#1249)
      log with \r\n line endings (#1261)
      kernel/task: Remove idle task fallback (#1244)
      task: assign a PCID to each task page-table root (#1157)
      scripts/launch_guest: enable PCID and INVPCID for EPYC-v4 (#1264)
      kernel/cpu: Replace PerCpu startup staging with owned `CpuLaunch` state (#1258)
      sev/ghcb: keep interrupts disabled for the whole GHCB call (#1273)
      syscall: switch to Linux system call numbers and argument registers (#1266)

Luigi Leonardi (10):
      kernel/log: Introduce an early log buffer
      kernel: Install the logger at the start of svsm_start()
      cargo: bump igvm and igvm_defs to 0.5.0
      cargo: bump virtfw-libefi
      kernel: drop redundant sha2 dev-dependency
      block/virtio_blk: use cocoon-tpm for SHA-256 in tests
      kernel/attest: get vsock port from cmdline
      launch_guest.sh: add --comport and --attestport options
      scripts/launch_guest: enable PCID and INVPCID for EPYC-v4
      uefivars: reset the store after enrolling the secure boot keys

Mahmoud Nagy Adam (18):
      kernel: cpu/idt: split system call dispatch from the int 0x80 handler
      kernel: cpu/idt: emulate the syscall instruction in the #UD handler
      syscall: issue system calls with the syscall instruction
      kernel: cpu/idt: remove the int 0x80 system call entry
      syscall: rename SysCallError variants to their Linux names
      syscall: use Linux error numbers in SysCallError
      syscall: add ENOTDIR, EISDIR and ENOTEMPTY
      kernel: error: map SvsmError to the Linux error for the same situation
      kernel: cpu/idt: return ENOSYS for unknown system calls
      syscall: export the raw system call functions
      kernel: task: attach the log to file descriptors 1 and 2
      kernel: task: keep the kernel log out of the file descriptors
      kernel: syscall: keep the low 8 bits of the exit code
      kernel: syscall: fail to close a descriptor that is not open
      syscall: add SysNo with the Linux system call numbers
      kernel, syscall: use SysNo for the system call numbers
      kernel, syscall: use the Linux argument registers
      kernel: match igvm cmdline parameters at argument boundaries

Nicola Ramacciotti (1):
      kernel/task: Remove idle task fallback

Nicolai Stange (3):
      kernel/persistence: implement PersistenceMultiOp helper
      kernel/persistence: implement persistence_enumerate_inodes_sync() helper
      kernel/persistence: implement persistence_unlink_inode_sync() helper

Oliver Steffen (7):
      libtcgtpm: libcrt: annotate intentional switch fall-throughs and fix sign comparison
      libtcgtpm: libcrt: move memcpy fallback loop into #else branch
      libtcgtpm: libcrt: qsort: Backport fix shift UB in shl and shr
      libtcgtpm: libcrt: qsort: Backport fix pntz heap corruption (CVE-2026-40200)
      libtcgtpm: libcrt: qsort: Backport copyright change
      libtcgtpm: libcrt: qsort: Backport harden ar[] with index masking (CVE-2026-40200)
      libtcgtpm: libcrt: Add SPDX line to isdigit.c

Stefano Garzarella (8):
      persistence: implement more helpers (#1206)
      block/virtio_blk: use cocoon-tpm for SHA-256 in tests (#1245)
      kernel/attest: get vsock port from cmdline (#1243)
      docs: add Alternate Injection specification (#1274)
      kernel: utils: add `MemoryRegion::iter_page_largest()` and update callers (#1268)
      Deps: Address attestation proxy dependency advisories (#1279)
      uefivars: reset the store after enrolling the secure boot keys (#1275)
      kernel: match igvm cmdline parameters at argument boundaries (#1276)

eternalcomet (1):
      sev/ghcb: keep interrupts disabled for the whole GHCB call

tanish111 (2):
      task: assign a PCID to each task page-table root
      task: INVPCID before removing PCID from VMR set on drop
