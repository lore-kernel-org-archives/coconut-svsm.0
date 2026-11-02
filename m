Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619732;
	b=MtbPe0FOt4/+xc0/SiolZIO9uOb3TtiOdOgwve0S6ASDTE4MSAMlfW/7dr+y1hQ8ivA7
	 lOQxI59/u9Gq7Gfy3FJuRR9Ah73c1r81YrYfANBomof1p2wixSrYgOxCbjox4PAsLPEzR
	 ZqP5TqUd7VILESlVX5zao4EQRIABnp76HeD4YTmfloSpIxVFvKJUHDqIKSfFdXYlCbY3M
	 nNCv/F1Zu1pbbVtrwB/espOKAqIAKrK5XeoU9nyai7dYPyav3/I1HpuUDAgGgq6YiTHeF
	 jell7XcWHe3S1FmSzQJ3sWv8zhrK6lb2YKeq1/gJIKZMrNWtXIGMLzSUrX31/OEePWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619732;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ILrEGYwqeOQrqe3Y2iCmMvFOdqDEClS/uMoD9X65bSc=;
	b=V7UzIGA5gkrauKovrz+3wDdA34kQkKEVy21I5WTFn5GDmEp1HI1FOqcGiyNExpB7totc
	 3ltUDVFps+Hby/VvOWVgWkjLGChNSL6P0RQe9/xDjVNHVYkYfouE8hwKnOB3uhtGfCySD
	 04I6xcyKFRRIb1PVubP/x7YrvcezU0UP2yszBSwnEbVWNRuvkS9IcZuGbACir6dKp2deF
	 EM2cdCAw0SFYGIBtmeEFHZ8ICAkrmFOTlkSxtKGQopB5VUueZ25+AnxRjh6k1BVSvg2mR
	 hua8U4YCc8Q3kAmHydqC0Nb8gRR+2LRhYo+D+CGpuXFvlWqAAxpu8esaDs0HqTWqf1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F91606A332
	for <coconut-svsm@lists.linux.dev>; Mon,  2 Nov 2026 11:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F91606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.fritz.box (p200300f6af404a0027ad06761c59e6b3.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:27ad:676:1c59:e6b3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0CF20243ACE;
	Mon,  2 Nov 2026 12:42:04 +0100 (CET)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Michael Roth <michael.roth@amd.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Ninad Naik <ninadnaik07@gmail.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	coconut-svsm@lists.linux.dev,
	joro@8bytes.org
Subject: [PATCH v3 1/8] KVM: SEV: Document SNP direct VMSA userspace ABI
Date: Mon,  2 Nov 2026 12:41:30 +0100
Message-ID: <20261102114137.1198982-2-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102114137.1198982-1-joro@8bytes.org>
References: <20261102114137.1198982-1-joro@8bytes.org>
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <joerg.roedel@amd.com>

Document the VMSA launch-update page type, the vCPU-scoped state get and
set commands, and the VM-scoped direct-VMSA capability in one place.

Describe the ordering and argument requirements for enabling direct-VMSA
mode, and contrast its VMSA allocation and measurement behavior with the
legacy launch flow.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 .../virt/kvm/x86/amd-memory-encryption.rst    | 66 ++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
index eeb0812cb10a..42391d9cebce 100644
--- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
+++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
@@ -542,6 +542,7 @@ Returns: 0 on success, < 0 on error, -EAGAIN if caller should retry
 where the allowed values for page_type are #define'd as::
 
         KVM_SEV_SNP_PAGE_TYPE_NORMAL
+        KVM_SEV_SNP_PAGE_TYPE_VMSA
         KVM_SEV_SNP_PAGE_TYPE_ZERO
         KVM_SEV_SNP_PAGE_TYPE_UNMEASURED
         KVM_SEV_SNP_PAGE_TYPE_SECRETS
@@ -550,7 +551,68 @@ where the allowed values for page_type are #define'd as::
 See the SEV-SNP spec [snp-fw-abi]_ for further details on how each page type is
 used/measured.
 
-20. KVM_SEV_SNP_LAUNCH_FINISH
+``KVM_SEV_SNP_PAGE_TYPE_VMSA`` creates VMSA pages as part of the measured
+initial image.  A request must contain exactly one 4 KiB VMSA page, but the
+command may be used multiple times.  Creating a VMSA page does not associate it
+with a vCPU; use ``KVM_SEV_SNP_SET_VCPU_STATE`` on the intended vCPU file
+descriptor before launch finish to make that association.  KVM treats the
+VMSA contents as guest-owned data, but requires VMPL 0 and a ``sev_features``
+value that matches the VM's configured VMSA features.
+
+20. KVM_SEV_SNP_GET_VCPU_STATE / KVM_SEV_SNP_SET_VCPU_STATE
+------------------------------------------------------------
+
+These commands get or set the VMSA and GHCB addresses for the vCPU on whose
+file descriptor the command is issued.  Unlike the other SEV commands,
+userspace must issue KVM_MEMORY_ENCRYPT_OP on a vCPU file descriptor.  The
+capability is reported as ``KVM_CAP_SNP_VCPU_STATE``.
+
+Parameters (in/out): struct kvm_sev_snp_vcpu_state
+
+Returns: 0 on success, -negative on error
+
+::
+
+        #define KVM_SEV_SNP_VCPU_STATE_VMSA_VALID        _BITULL(0)
+        #define KVM_SEV_SNP_VCPU_STATE_GHCB_VALID        _BITULL(1)
+
+        struct kvm_sev_snp_vcpu_state {
+                __u64 valid_fields;
+                __u64 vmsa_gpa;
+                __u64 ghcb_gpa;
+                __u64 pad[5];           /* Must be zero */
+        };
+
+``KVM_SEV_SNP_GET_VCPU_STATE`` returns the current addresses and sets the
+corresponding bit in ``valid_fields`` for each valid address.
+
+``KVM_SEV_SNP_SET_VCPU_STATE`` sets addresses whose validity bits are present
+and invalidates addresses whose bits are absent.  The command must be issued
+after launch start and before KVM_SEV_SNP_LAUNCH_FINISH, and the VM must have
+enabled ``KVM_CAP_SNP_DIRECT_VMSA``.  A valid VMSA GPA must be backed by
+guest_memfd and populated.  The GPA must be 4-KiB aligned.  A valid GHCB
+address is copied without inspecting its backing page.  Nonzero reserved
+fields or unknown validity bits are rejected.
+
+``KVM_CAP_SNP_DIRECT_VMSA`` is a VM-scoped capability that selects direct-VMSA
+mode.  Userspace enables it with ``KVM_ENABLE_CAP`` on an SNP VM before
+creating any vCPUs.  ``flags`` and all elements of ``args`` must be zero.
+Enabling the capability on a non-SNP VM or after creating a vCPU is rejected.
+
+In direct-VMSA mode, KVM does not allocate a KVM-owned VMSA when a vCPU is
+created and does not generate or measure one at launch finish.  All launch
+VMSAs are owned and supplied by userspace.  Valid VMSAs selected with
+``KVM_SEV_SNP_SET_VCPU_STATE`` are preserved, while vCPUs without a valid VMSA
+have no runnable VMSA until the guest uses SNP AP creation to supply one.  If
+the capability is not enabled, launch finish retains the legacy behavior of
+generating and measuring a KVM-owned VMSA for every vCPU.  VMSAs that were
+measured but not selected remain ordinary valid pages in the initial image.
+
+Direct VMSAs make the launch measurement independent of KVM's selected VMSA
+GPA and of the configured vCPU count.  This gives VMMs a stable launch
+measurement across hypervisors.
+
+21. KVM_SEV_SNP_LAUNCH_FINISH
 -----------------------------
 
 After completion of the SNP guest launch flow, the KVM_SEV_SNP_LAUNCH_FINISH
@@ -578,7 +640,7 @@ Returns: 0 on success, -negative on error
 See SNP_LAUNCH_FINISH in the SEV-SNP specification [snp-fw-abi]_ for further
 details on the input parameters in ``struct kvm_sev_snp_launch_finish``.
 
-21. KVM_SEV_SNP_ENABLE_REQ_CERTS
+22. KVM_SEV_SNP_ENABLE_REQ_CERTS
 --------------------------------
 
 The KVM_SEV_SNP_ENABLE_REQ_CERTS command will configure KVM to exit to
-- 
2.53.0

