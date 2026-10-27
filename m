Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098375;
	b=P/sLtvDW+DOPGYJZ2E6pjCbzP6WTVAMOjSAov4Mhhcpp+5/NWoEX7OSzs/NF4udo+2UH
	 ayEcIwfpyy/W1l60bZVJRSnueyo4n+6agEGgq0h1a4Nlh1x2bB7hXUar1PfXPdfr53mdI
	 UNhyJOzJfccObmFEWpLBQ7r7hIU1cEyfLnFhE0Mf7TQhnOepngMihUoNE97jvQVffouGb
	 +3U15H3FBDBeBOYUAqB/k4homBHiGZXMotf3//NgUhbXz2RnQ1zrhimrqIqgqkM4vN4cq
	 XT9T/WTEnB8mlzv60oNeVUj0b+R7lLloicSOzMBw1NLMoRxvK2yJmjTXrBoYv1Fp65A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098375;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=o8F1K2/jIqNA+uVQ9PF8zXJgsC0lQGajgm5OQ5zE4qw=;
	b=uxt7GS9oxC7EEUHQS3/Wlve876Etety1LGwjUQRPYTigNsNHt9WJunm5B7gJ+BJbZZv5
	 MsqvPxrtCF4r7VXLrvlCloncZO3V9C07ELcehtHMdSvSXHLeCIl4V6nK1DThUMwcbz4yS
	 1Anm1hXXWqwnr4ix7boc2D5DWtcfrJVuBjiA26ciPmYIpqHEK/uMlgvPldlZO5nRodrBM
	 h4laKOI0QcjXX+wKSvce/mhG0X99TsknzfBKNObR7d1GVhgiosk8rYEmzp3ZcpVuXUKu1
	 Q6v8E7g9sOq2WPs6QGp0x0gISTrVwb5Ikiao0TNlwBdBNYCM7PoLpY00CXimxmm1srw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65A8606B78B;
	Tue, 27 Oct 2026 10:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C65A8606B78B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a007f96e19db8f88024.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:7f96:e19d:b8f8:8024])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7F3961C7802;
	Tue, 27 Oct 2026 11:52:48 +0100 (CET)
Date: Tue, 27 Oct 2026 11:52:47 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Development Release v2026.10-devel
Message-ID: <auCCf9ScqKH2xBty@8bytes.org>
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

Another small COCONUT-SVSM release is out: 2026.10-devel. This development
snapshot release contains 49 non-merge commits from 4 contributors. The
highlights in this release are:

  * New per-CPU storage infrastructure: Added linker-backed per-CPU keys with
    GS-relative access, runtime initialization, and assembly support.

  * Exception handling: Added GS-base switching on exception and interrupt
    entry from userspace, including special handling for NMI, machine-check,
    double-fault, and #HV paths.

  * Page-table correctness: Fixed memory-management operations to use the
    currently active page table after switching into task context. Added
    immutable page-table walking and reader-writer locking for task page
    tables.

  * APIC emulation: Corrected processor-priority calculation when an in-service
    interrupt determines the priority. Added unit tests for interrupt
    priorities, guest IRQ delivery, EOI handling, and #HV doorbell
    interactions.

  * CPU feature detection: Improved handling of multi-bit CPUID fields and
    corrected C-bit and INVLPGB capability detection.

  * Panic handling: Prevented recursive panics and routed SEV-SNP GHCB I/O
    failures through the panic handler so termination includes secrets-page
    scrubbing.

  * Dependency updates: Updated P-384, crypto-bigint, and Tokio to address
    audit findings affecting constant-time arithmetic and AsyncFd I/O safety.

The full shortlog of the non-merge commits is attached.

Happy testing!

Cheers,

	Joerg

Carlos López (20):
      kernel: mm/pagetable: rename methods to reflect mutability
      kernel: mm/pagetable: add immutable page table walking methods
      kernel: task: deduplicate current_task()
      kernel: task: always get active task via current_task()
      kernel: task: replace pagetable spinlock with RWLock
      kernel: cpu/percpu: store page table in AtomicPtr
      kernel: cpu/percpu: explicitly install page table
      kernel: cpu/percpu: add PerCpu::new_pgtable()
      kernel: cpu/percpu: fix current page table accesses
      kernel: prevent reentrant panicking
      kernel: platform/snp: route GHCB I/O port failures through panic handler
      kernel: cpu/features: allow arbitrary feature presence detection
      kernel: cpu/apic: mask priority subclass if ISR determines PPR
      kernel: cpu/apic: abstract away CPU APIC state
      kernel: cpu/apic: introduce APIC testing infrastructure
      kernel: cpu/apic: add basic APIC tests
      kernel: cpu/apic: add guest IRQ delivery tests
      kernel: cpu/apic: add EOI tests
      kernel: cpu/apic: add #HV doorbell tests
      xbuild: preserve build artifacts before objcopy

Joerg Roedel (25):
      kernel: cpu/idt: Handle GS swaps on exception entry and return
      kernel/percpu: Add linker-backed per-CPU keys
      kernel/percpu: Install CPU-local GS areas
      kernel/percpu: Support runtime CPU-local initialization
      kernel/percpu: Add assembly-visible per-CPU keys
      kernel/vmsa: Move reset IP to a per-CPU key
      kernel/irq: Move IRQ state to a per-CPU key
      kernel/apic: Move the x86 APIC to a per-CPU key
      kernel/apic: Move guest APIC state to a per-CPU key
      kernel/mm: Move the 4K virtual-range allocator to a per-CPU key
      kernel/mm: Move the 2M virtual-range allocator to a per-CPU key
      kernel/hyperv: Move hypercall pages to a per-CPU key
      kernel/sev: Move the GHCB page to a per-CPU key
      kernel/percpu: Move context switch stack to a per-CPU key
      kernel/percpu: Move paging root to a per-CPU key
      kernel/smp: Move shared CPU state to a per-CPU key
      kernel/sev: Move the HV doorbell to a per-CPU key
      kernel/percpu: Move current stack to a per-CPU key
      kernel/percpu: Move TSS to a per-CPU key
      kernel/percpu: Move ISST to a per-CPU key
      kernel/percpu: Move initial shadow stack to a per-CPU key
      kernel/percpu: Move IST stacks to per-CPU keys
      kernel/percpu: Move legacy per-CPU state into the percpu directory
      deps: Update p384 and Tokio to resolve audit findings
      COCONUT-SVSM Release 2026.10-devel

Luigi Leonardi (2):
      kernel: make block and vsock imply virtio-drivers
      verification/verus_macro_stub: remove unused proc-macro2 dependency

Stefano Garzarella (2):
      docs/RELEASE-TESTPLAN: add persistence test
      build: remove legacy wrapper script

