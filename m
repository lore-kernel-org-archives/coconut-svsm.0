Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619731;
	b=KgAX4PCW9UyLHdMXINu1NQ8rzLYShT8HlBNSLb4MN0/hiEUgo+8smSGEuRZNc7KZVidy
	 sXFmBQ+rJWWqJAj1ggSn56nkGik0JYIGptz+vR+ZYcXxD36sUr8C9sAlscF62yFUca63E
	 gfPSHHuAJnw/PdLGJchnQg1fHIzJV0LSntAFvqIssW/BkOW0wvw315o/1+HY5vHswIRdX
	 nmAsilj67Cae49cBcRQWY353qBx5/wJxQeCChWybFI5IdgIl0GLrBTHBh7Lx+8BAsUDX2
	 atpqSnNrBU5+JplbBCnIlwn5cKTT7bGx4tqjghXoaC6Y/3ZUIUxoPpagnKwd6URqbeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619731;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Wg/9BkvVbzjYLnmge/yC5tcnzeQaEmaT35H+5c8S5lU=;
	b=YfH8pRnJs3oq/ExmUS1ywFz02GzHiLFY6QqLjudcmYA7rZSefzvZcpdxxhVG1BRbBcJk
	 LvRQqyiVscV2Moulecv0ENdAmMt0tyhkXIi9bbcJEZT0TNfkz/2U/OrNTNc22zxhthsyU
	 gG6x1wAjtoFcVpgh4BK2bQGwVRara9y8AfGg2tdzK4xUsQgUQiM5+O4Zp+QrrMg7sI9QY
	 JhoxyKoQOOTdHxcxm5y5fNDgUYW22Srn0IjmNTmugPOeWmQr1N8l77fUxJcBJLG4cfc3y
	 H2j1KaIclrhwIFClThZcPrYVjSp70Rh/E9Ey+iutDlxLqR86NwyGdlvJfqi7AqoD/gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F68606A330
	for <coconut-svsm@lists.linux.dev>; Mon,  2 Nov 2026 11:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F68606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.fritz.box (p200300f6af404a0027ad06761c59e6b3.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:27ad:676:1c59:e6b3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5CE3E243AD4;
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
Subject: [PATCH v3 3/8] KVM: SVM: Hold SRCU while reloading guest-owned VMSAs
Date: Mon,  2 Nov 2026 12:41:32 +0100
Message-ID: <20261102114137.1198982-4-joro@8bytes.org>
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

Take a dedicated KVM SRCU read lock around the guest-owned VMSA memslot
and guest_memfd lookup.  This makes the reload path self-contained and
prevents it from racing a userspace memslot replacement.

Keep the lock through VMCB installation, and release it on all lookup
failure paths.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/svm/sev.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index f690edaf8b69..9681ff0aa5d3 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4059,6 +4059,7 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu *vcpu, gpa_t gpa)
 	gfn_t gfn = gpa_to_gfn(gpa);
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
+	int idx;
 
 	lockdep_assert_held(&svm->sev_es.snp_vmsa_mutex);
 
@@ -4090,9 +4091,10 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu *vcpu, gpa_t gpa)
 	if (!VALID_PAGE(gpa))
 		return;
 
-	slot = gfn_to_memslot(vcpu->kvm, gfn);
+	idx = srcu_read_lock(&kvm->srcu);
+	slot = gfn_to_memslot(kvm, gfn);
 	if (!slot)
-		return;
+		goto out_unlock;
 
 	mmu_seq = kvm->mmu_invalidate_seq;
 	smp_rmb();
@@ -4101,8 +4103,8 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu *vcpu, gpa_t gpa)
 	 * The new VMSA will be private memory guest memory, so retrieve the
 	 * PFN from the gmem backend.
 	 */
-	if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, NULL))
-		return;
+	if (kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, NULL))
+		goto out_unlock;
 
 	read_lock(&kvm->mmu_lock);
 	/*
@@ -4117,6 +4119,9 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu *vcpu, gpa_t gpa)
 	else
 		svm->vmcb->control.vmsa_pa = pfn_to_hpa(pfn);
 	read_unlock(&kvm->mmu_lock);
+
+out_unlock:
+	srcu_read_unlock(&kvm->srcu, idx);
 }
 
 /*
-- 
2.53.0

