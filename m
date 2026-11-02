Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619733;
	b=e14ibXZuskIgPq5PeSQlocdJ8l5iribnjkdp7MKeEE3Tr3mrUY3CGizJyHa48BqbRdd/
	 LcrTJCedfZCLKBd75qMe+LIDEjzYMUVn/7R2ActpWhv7jdmq6xzomJre82xtQK4IJWG3o
	 PmTXRzA/rvNNf8wRVCKBAkYlSmbRvBvHxNF7CfgfqtNmjnwAbsqEG7vVIrH31kmtzBGUS
	 Ua+owDmN+h3H57idtwwGaGFu9++bvtbYocJpr4FtxMXr/tokJj75W4EEBAXrOvKEvKiih
	 7eLjumTeQGH7V7VsmIvgdp+oodxaigil8BPybYX7iUw55TWGrqihZhgfvweUAerOOmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619733;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GLgctw023HMDHXfcFmH1R9I5/mqAyWuaPPQ93qcP8dg=;
	b=SFI3xj6+DyGnmDqump05Sg1kXkObh7KWfjLxfM+PEnwl5Zsxq2WaSlEvlmpvb1EY2/kL
	 qUsnFG8KdflKwhYCpGOGwHu1sSQJtjal886wFu7r+h7bDwhl8cnGrq3iYScm0ikJPZNaB
	 z0q1JLMnQBKouVFaCLWQUUxPZweDTvcE2VarV/zIlh6gaLIyfyhIpN31he9D/gEZ2TwOR
	 4vrR5gBq0rGsxhi5AcxJiPFnLXs0r6RwJAZuGDpbIow+wm4fZIavFO0llpLOsHAP01wyL
	 iMejI+NxbYO/AybsLOBiFuVzeTUAalNH8pikG8WvUt3MIgW/l3HV/GVYU1mi5JewbdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67ADA60A2636
	for <coconut-svsm@lists.linux.dev>; Mon,  2 Nov 2026 11:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67ADA60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.fritz.box (p200300f6af404a0027ad06761c59e6b3.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:27ad:676:1c59:e6b3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AD869243AD8;
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
Subject: [PATCH v3 5/8] KVM: SEV: Allow VMSA pages in SNP launch updates
Date: Mon,  2 Nov 2026 12:41:34 +0100
Message-ID: <20261102114137.1198982-6-joro@8bytes.org>
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

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/uapi/asm/kvm.h |  1 +
 arch/x86/kvm/svm/sev.c          | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 00ce265391e1..f3c389d3c70e 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -885,6 +885,7 @@ struct kvm_sev_snp_launch_start {
 /* Kept in sync with firmware values for simplicity. */
 #define KVM_SEV_PAGE_TYPE_INVALID		0x0
 #define KVM_SEV_SNP_PAGE_TYPE_NORMAL		0x1
+#define KVM_SEV_SNP_PAGE_TYPE_VMSA		0x2
 #define KVM_SEV_SNP_PAGE_TYPE_ZERO		0x3
 #define KVM_SEV_SNP_PAGE_TYPE_UNMEASURED	0x4
 #define KVM_SEV_SNP_PAGE_TYPE_SECRETS		0x5
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 09e1c2da546d..4c659c063be2 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2365,6 +2365,7 @@ struct sev_gmem_populate_args {
 	__u8 type;
 	int sev_fd;
 	int fw_error;
+	bool vmsa_invalid;
 };
 
 static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
@@ -2395,6 +2396,19 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 		kunmap_local(src_vaddr);
 	}
 
+	if (sev_populate_args->type == KVM_SEV_SNP_PAGE_TYPE_VMSA) {
+		struct sev_es_save_area *vmsa = kmap_local_pfn(pfn);
+
+		if (vmsa->vmpl || vmsa->sev_features != sev->vmsa_features) {
+			sev_populate_args->vmsa_invalid = true;
+			ret = -EINVAL;
+		}
+
+		kunmap_local(vmsa);
+		if (ret)
+			goto out;
+	}
+
 	ret = rmp_make_private(pfn, gfn << PAGE_SHIFT, PG_LEVEL_4K,
 			       sev_get_asid(kvm), true);
 	if (ret)
@@ -2458,7 +2472,10 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
 		 params.gfn_start, params.len, params.type, params.flags, params.uaddr);
 
 	if (!params.len || !PAGE_ALIGNED(params.len) || params.flags ||
+	    (params.type == KVM_SEV_SNP_PAGE_TYPE_VMSA &&
+	     (!sev->snp_direct_vmsa || params.len != PAGE_SIZE)) ||
 	    (params.type != KVM_SEV_SNP_PAGE_TYPE_NORMAL &&
+	     params.type != KVM_SEV_SNP_PAGE_TYPE_VMSA &&
 	     params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO &&
 	     params.type != KVM_SEV_SNP_PAGE_TYPE_UNMEASURED &&
 	     params.type != KVM_SEV_SNP_PAGE_TYPE_SECRETS &&
@@ -2507,6 +2524,9 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
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

