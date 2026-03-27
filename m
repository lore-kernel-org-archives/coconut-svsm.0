Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502A934EEF4;
	Fri, 27 Mar 2026 09:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603327; cv=none; b=OOW10QlxgTTUOHehUcpssTFzC5eDLC6VCWtsaX4iJXaIFIXgqV19qzZhP5GjLJn8owxsiVd6GeCPM0W6BCwikiNK3dL01YlrshuXWIb1m7lp50q2PNGngBt3BnIwG5xocyUznfqZHiD6kxUhNpryckRoCFln1HBP+UYMcWRbJ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603327; c=relaxed/simple;
	bh=vEGZC83rxmW07zHQFknwFo9lKgIJBePeoyZucSBzCLk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rqS1Cn9siBM0okYOX2pJdTU2yOXOCXXfHVzFWAINuYZTaIEBIkiBrSrAoOjl8LwzA9vT2vkS8q9vV9g1zkzPiPuTcLda8MkRnYUJJG75tuYld8DTWn8RSsZYTg7JkZFmfYKD27ho2GX1KnnzOwlPArAmt8jZ0rEPJ5Ev5A+F+ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=i8C9bIC8; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="i8C9bIC8"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AFD971A6ADF;
	Fri, 27 Mar 2026 10:21:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1774603319;
	bh=vEGZC83rxmW07zHQFknwFo9lKgIJBePeoyZucSBzCLk=;
	h=Date:From:To:Subject:From;
	b=i8C9bIC87P9HLSEiaYPCJ+1F8am2Zr1ffDCH1eVBUlz6OnQH7mzXOmPUuVLU/ZS9M
	 ZjXu19d+PXRZLwD/yQ77XtACyj+wZE4hDi6nPbCFc89tbCdJK5/R5nIH/+t/veyNCU
	 BZcYpH216WJFDXeqUraZzIfWSJRlCvpFUQ+CtooAKcQf2fNTEy2vLwi3wjANOML/Xa
	 P6jSYHHjLD0dFAOGHZZ+iU1NrRQU6qPeqr5TD/5+Y9X1nyAaTgETT2wJCdoxdGOTkR
	 tbLxORdib/YD7wy25Ciw2Mm1DV/XFW3gaCGKnNlX8BxM8s6SGYa71YG59y+ze51SjT
	 3CAYBQuXLlZ7w==
Date: Fri, 27 Mar 2026 10:21:58 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Development Release v2026.03-devel
Message-ID: <xmszcrswhbn4testupljhakkakdnofaic2g2ksrnjl35rqix3w@upvt7a2ab4la>
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

The COCONUT-SVSM development release for March is now tagged. It features 48
non-merge commits since the February release, among them changes from
first-time contributors.

The highlights of this release are:

	- More improvements to the boot flow to get closer to a minimal stage2
	  implementation.

	- Memory management improvements.

	- Lots of changes to our CI workflows to improve their security, speed,
	  and coverage.

The shortlog is attached. Happy testing!

-Joerg

Carlos López (14):
      mm/alloc: remove recursion from HeapMemoryRegion::free_page_order()
      mm/alloc: remove recursion from HeapMemoryRegion::refill_page_list()
      mm/alloc/tests: verify error variant in test_page_alloc_oom()
      Makefile: add Miri target
      Documentation: INSTALL: document --no-detdev option
      Documentation: add TESTING.md
      kernel: mm/pgtable: homogenize PageTable::map_4k()
      kernel: mm/pgtable: homogenize PageTable::map_2m()
      boot: bootimg/elf: page-align kernel ELF size
      virtio-drivers: remove enumn dependency
      libtcgtpm: disable bindgen unneeded features
      github/workflows: do not add rust-src component
      github/workflows: run builds in parallel
      github/workflows: update actions to Node.js 24

Joerg Roedel (7):
      github/workflows: Implement security best practices
      github/workflows: Add a dependency review workflow
      docs: Document GitHub workflow security requirements
      workflows/publish-docs: Limit permissions even more
      workflows/manual-verify: Do not use pre-built verusfmt
      workflows/publish-docs: Install mkdocs from packages
      COCONUT-SVSM Release 2026.03-devel

Jon Lange (16):
      boot_params: remove vtom from boot parameter block
      stage2: make VTOM a register parameter
      boot_params: remove stage1 info from boot params
      stage1: remove non-TDX logic
      sev: remove SEV metadata generation
      Merge pull request #989 from 00xc/mm/pgtable/map_4k
      idt: allocate kernel IDT in the boot image
      kernel: enable suppression of VTOM in the SVSM
      Merge pull request #1003 from joergroedel/gh-workflows
      bootimg: map the kernel heap with 2 MB pages
      kernel: simplify memory launch parameters
      svsm: dynamically expand the kernel region from the kernel
      Merge pull request #1007 from luigix25/makefile_cleanup
      workflows: move CI test artifacts to a separate directory
      svsm: fix heap size calculation after kernel region expansion
      svsm: validate memory correctly during kernel region expansion

Jörg Rödel (15):
      Merge pull request #970 from msft-jlange/stage1
      Merge pull request #967 from 00xc/mm/alloc
      Merge pull request #993 from TanyaAgarwal25/tanya/add-nocc-doc
      Merge pull request #995 from 00xc/boot/bootimg/align_heap
      Merge pull request #996 from luigix25/add_missing_spdx
      Merge pull request #991 from osteffenrh/igvmmeasure-error-msg
      Merge pull request #999 from luigix25/remove_sudo
      Merge pull request #1000 from n-ramacciotti/update_gdbstub
      Merge pull request #1008 from msft-jlange/no_vtom
      Merge pull request #1001 from 00xc/ci/parallel-v2
      Merge pull request #1009 from nhandt64/chore/ignore-vscode
      Merge pull request #1017 from msft-jlange/qemu_ci
      Merge pull request #1016 from 00xc/ci/actions-node24
      Merge pull request #1013 from joergroedel/gh-workflows
      Merge pull request #1019 from msft-jlange/heap_info

Luigi Leonardi (4):
      block: remove `VirtIOBlkDevice` abstraction
      workspace: add missing SPDX headers
      scripts/launch_guest: avoid sudo when using TCG acceleration
      Makefile: remove broken targets

Nhan Dang (1):
      gitignore: ignore .vscode folder

Nicola Ramacciotti (1):
      cargo.toml: Update gdbstub to 0.7.10

Oliver Steffen (5):
      igvmmeasure: Report the value of a wrong CR0 setting
      igvmmeasure: Report unexpected VMSA GPA values
      igvmmeasure: KVM check: allow real-mode
      igvmmeasure: Split off KVM check errors
      igvmmeasure: Reformat error message

Peter Fang (1):
      Merge pull request #1005 from msft-jlange/dynamic_heap

Stefano Garzarella (4):
      Merge pull request #979 from 00xc/docs/dev/testing
      Merge pull request #980 from luigix25/blk_refactor
      Merge pull request #983 from TanyaAgarwal25/main
      Merge pull request #985 from TanyaAgarwal25/tanya/use-prefix

Tanya Agarwal (3):
      doc/INSTALL: fix PKG_CONFIG_PATH typo in configure command
      doc/INSTALL: simplify QEMU build instructions
      docs: add native mode instructions to run SVSM without coco hardware

