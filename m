Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D8A51477A
	for <coconut-svsm@lists.linux.dev>; Tue,  8 Sep 2026 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863628; cv=none; b=pqiwWGCTH0wBfP+RTjbJS3CPcMfTlZRJ5sw22Jn12Ehbk9pc6kE9X2TkkRD6HK/Fi7/KmirDm8qLT7VyF2PTKW5eAIDfgkWMGgSeC98HQM2NNxGOhfIiObFa8409fRqDwbjPxvytiLZyjNzpPEHTNpRL2Q8+2X4mBUnXvBIWdIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863628; c=relaxed/simple;
	bh=nsTlQFKo9B65dB4GKQVwXYlmzVfgo6eTQzt5hCII3GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNOUCuJc3o3W/egoWD9t2ltL0JG6IsWHueSv5T2l5rv/ZSYT9xo5cjMdC3R3zDriDMepNOUj/9osqAU1afMDYcAgWSaydoHPjSHd859Ua9Bn/icPynS+DuAjs5bQ21rDAGH98X2PJYZrQ7vRC5v2RZZtcrauosz2Ja8N6cH/hfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.fritz.box (p200300f6af085a00d84fb33a51badfd9.dip0.t-ipconnect.de [IPv6:2003:f6:af08:5a00:d84f:b33a:51ba:dfd9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A57A020A1DF;
	Tue,  8 Sep 2026 12:33:41 +0200 (CEST)
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
	coconut-svsm@lists.linux.dev
Subject: [PATCH v2 5/8] KVM: SEV: Allow VMSA pages in SNP launch updates
Date: Tue,  8 Sep 2026 12:33:35 +0200
Message-ID: <20260908103338.427254-6-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908103338.427254-1-joro@8bytes.org>
References: <20260908103338.427254-1-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <joerg.roedel@amd.com>

Pass the firmware VMSA page type through KVM_SEV_SNP_LAUNCH_UPDATE.
Only accept VMSA pages when userspace has enabled
KVM_CAP_SNP_DIRECT_VMSA.
Require each request to describe exactly one 4-KiB VMSA page.  Allow
repeated requests and keep VMSA creation independent of association with a
vCPU.

The VMSA's VMPL and SEV features define its execution context.  They must
agree with KVM's VM-wide configuration.  Before passing a VMSA to firmware,
require VMPL 0.  Require sev_features to exactly match the VM's configured
VMSA features.  Treat the remaining contents as guest-owned data.

Assisted-by: LLM
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/uapi/asm/kvm.h |  1 +
 arch/x86/kvm/svm/sev.c          | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 1585ec804066..69dcd044583f 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -887,6 +887,7 @@ struct kvm_sev_snp_launch_start {
 /* Kept in sync with firmware values for simplicity. */
 #define KVM_SEV_PAGE_TYPE_INVALID		0x0
 #define KVM_SEV_SNP_PAGE_TYPE_NORMAL		0x1
+#define KVM_SEV_SNP_PAGE_TYPE_VMSA		0x2
 #define KVM_SEV_SNP_PAGE_TYPE_ZERO		0x3
 #define KVM_SEV_SNP_PAGE_TYPE_UNMEASURED	0x4
 #define KVM_SEV_SNP_PAGE_TYPE_SECRETS		0x5
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 5a282aff04a8..7a9ef1bc54e9 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2346,6 +2346,7 @@ struct sev_gmem_populate_args {
 	__u8 type;
 	int sev_fd;
 	int fw_error;
+	bool vmsa_invalid;
 };
 
 static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
@@ -2369,11 +2370,20 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	if (src_page) {
 		void *src_vaddr = kmap_local_page(src_page);
 		void *dst_vaddr = kmap_local_pfn(pfn);
+		struct sev_es_save_area *vmsa = dst_vaddr;
 
 		memcpy(dst_vaddr, src_vaddr, PAGE_SIZE);
+		if (sev_populate_args->type == KVM_SEV_SNP_PAGE_TYPE_VMSA &&
+		    (vmsa->vmpl || vmsa->sev_features != sev->vmsa_features)) {
+			sev_populate_args->vmsa_invalid = true;
+			ret = -EINVAL;
+		}
 
 		kunmap_local(dst_vaddr);
 		kunmap_local(src_vaddr);
+
+		if (ret)
+			goto out;
 	}
 
 	ret = rmp_make_private(pfn, gfn << PAGE_SHIFT, PG_LEVEL_4K,
@@ -2439,7 +2449,10 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
 		 params.gfn_start, params.len, params.type, params.flags);
 
 	if (!params.len || !PAGE_ALIGNED(params.len) || params.flags ||
+	    (params.type == KVM_SEV_SNP_PAGE_TYPE_VMSA &&
+	     (!sev->snp_direct_vmsa || params.len != PAGE_SIZE)) ||
 	    (params.type != KVM_SEV_SNP_PAGE_TYPE_NORMAL &&
+	     params.type != KVM_SEV_SNP_PAGE_TYPE_VMSA &&
 	     params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO &&
 	     params.type != KVM_SEV_SNP_PAGE_TYPE_UNMEASURED &&
 	     params.type != KVM_SEV_SNP_PAGE_TYPE_SECRETS &&
@@ -2487,6 +2500,9 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
 				  params.type == KVM_SEV_SNP_PAGE_TYPE_CPUID,
 				  sev_gmem_post_populate, &sev_populate_args);
 	if (count < 0) {
+		if (sev_populate_args.vmsa_invalid)
+			return -EINVAL;
+
 		argp->error = sev_populate_args.fw_error;
 		pr_debug("%s: kvm_gmem_populate failed, ret %ld (fw_error %d)\n",
 			 __func__, count, argp->error);
-- 
2.53.0

