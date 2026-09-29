Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C30345725;
	Tue, 29 Sep 2026 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685525; cv=none; b=hbEWR/3LHrs70p67jIGVoX50WS2saFEynCXlVhNEwEv2YXsTWsnH6z4hpmc1j+6N1XMzo5Zifol2PH0gd/euVc4rXZw6uWIBd7yVkBGcLPm+QdEaHEvhDWDsU3RMn5Tf0BEhOa0GsDd0AhkGSd31zZgOcVJAs6tKh+lk2toKoLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685525; c=relaxed/simple;
	bh=XDfw6WUAVAjTXD5dBWuPQZ0kUlTzAwpWOkpxJZ3YQzU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DlqnTw4EwZzWbsM4FPmj9wBumi1Gyi21G64AB6da2xg1E7SmcDa0qujXlcIMAiZfvaf3m5c1H8fwhTWrg36CksqSmyfRKkDcZ9bj99fEdC5rDQgN35ZJ/hsHKBDu7tn7cwPxpg7CXZ4T/cVuglClotEWe3Vgj39Y/9HE8zuDxN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a0026677be519f5933d.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:2667:7be5:19f5:933d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D3FEB1C1958;
	Tue, 29 Sep 2026 14:38:35 +0200 (CEST)
Date: Tue, 29 Sep 2026 14:38:34 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Development Release v2026.09-devel
Message-ID: <aruxSrrApQiYeTJY@8bytes.org>
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

It is the end of the month which means it's time for another COCONUT-SVSM
development release. The 2026.09-devel release is now available and turned out
to be a smaller one. It contains 35 non-merge commits with 50 commits overall.
Shortlog is attached.  Changes since 2026.08-devel include:

 * More resilient attestation: SVSM logs attestation failures and continues
   booting without a secret. Persistence initialization is skipped in that
   case.  The attestation proxy now logs failures and remains available for
   later connections.

 * IGVM loading changes: The IGVM builder places the VMSA in the kernel address
   range for QEMU, and the measurement tool accepts that placement when checking
   KVM images.

 * Memory management cleanup: Page table walking and allocation paths were
   consolidated, mapping guards were unified, and the Hyper-V hypercall code
   page now uses a managed global mapping.

 * Build and developer improvements: CI now detects a stale Cargo.lock
   reliably. Workspace lint settings, test type diagnostics, and contributor
   guidance were updated.

 * Installation guidance: The instructions now cover cbindgen, the current OVMF
   output path, and the one-time reboot behavior of fresh cloud images.

This release marks the end of the transition period to the updated Linux 7.2
and QEMU 11.1.0 host branches. With this version COCONUT-SVSM will stop working
on the older branches (including Linux 7.1 and QEMU 11.0.0).

Happy testing!

Cheers,

	Joerg

Carlos López (15):
      kernel: mm/vm: make VMRMapping generic
      kernel: task: consolidate TaskKernelMapping into VMRMapping
      kernel: mm: consolidate VMMappingGuard into VMRMapping
      kernel: mm/pagetables: use PTEntry methods to consult flags
      kernel: mm/pagetable: unify set_{shared,private}_4k()
      kernel: mm/pagetable: convert Mapping into a struct
      kernel: mm/pagetable: unify intermediate PTE allocation
      kernel: mm/pagetable: further consolidate PTE allocation
      kernel: mm/pagetable: unify page table walking
      Documentation: CONTRIBUTING: add PR description requirements
      kernel: hyperv: map code page into global shared range
      kernel: locking/spinlock: store data as NonNull
      kernel: locking/spinlock: implement RawLockGuard::map()
      DEVELOPMENT-PLAN: Remove items which have been implemented (#1223)
      cargo: update Cargo.lock (#1224)

Joerg Roedel (4):
      DEVELOPMENT-PLAN: Remove items which have been implemented
      igvmmeasure: Allow in-kernel VMSA for the KVM hypervisor
      igvmbuilder: Place VMSA in kernel range for QEMU
      COCONUT-SVSM Release 2026.09-devel

Jörg Rödel (5):
      Merge pull request #1182 from n-ramacciotti/protocols/reserve_ocp_number
      Merge pull request #1204 from 00xc/mm/pagetable/pre-selfmap
      Merge pull request #1201 from 00xc/mm/vm/guards
      kernel: locking/spinlock: implement `RawLockGuard::map()` (#1218)
      Put launch VMSA in kernel range for QEMU (#1209)

Luigi Leonardi (15):
      aproxy: fix log message
      aproxy: remove unnecessary clone
      aproxy: move version to a separate const
      aproxy: introduce logging via env_logger
      aproxy: don't abort on attestation failure
      kernel/svsm: log CPU vendor after buffer logger initialization
      kernel/svsm: extract attestation into run_attestation()
      kernel/svsm: do not panic when attestation fails
      docs: document new attestation behaviour
      test: implement Debug for all public types
      verification/verus_macro_stub: remove unused extern crate
      cargo: inherit workspace lints
      cargo: fix deprecated trivial-numeric-casts lint name
      kernel: remove unused rustc_version dependency
      cargo: update Cargo.lock

Nicholas Renner (1):
      docs/INSTALL.md: fix IGVM and OVMF instructions

Nicola Ramacciotti (1):
      kernel/protocols: Reserve OCP number

Stefano Garzarella (9):
      Merge pull request #1198 from luigix25/aproxy_improvements
      Merge pull request #1211 from luigix25/fix_log
      Documentation: CONTRIBUTING: add PR description requirements (#1214)
      kernel: hyperv: map code page into global shared range (#1216)
      kernel/svsm: gracefully handle missing vsock device during attestation (#1205)
      cargo: fix some clippy warnings (#1212)
      github/workflows: fix Cargo.lock check
      github/workflows: fix Cargo.lock check (#1226)
      docs/INSTALL.md: fix IGVM and OVMF instructions (#1228)

