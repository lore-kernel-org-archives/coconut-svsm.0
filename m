Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDBF3F0743
	for <coconut-svsm@lists.linux.dev>; Thu, 11 Jun 2026 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182555; cv=none; b=SMjrBcwoKg/FtsQF6Te76SF0e6okLkKpGT4U/rejykpUnMujimEZspbR+qnYOlfgSBKnMVM1mXXVNJH9GvUccPJVf8aDiprid+M8z616YpkdWRdzGYsiECdGKstfPiocmonK32WhP+2NzDsqEuHIOvCfUAzrq7+oJUPRqPXgstc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182555; c=relaxed/simple;
	bh=J8dYfrtBGrybeGXu0CJgkRuebpjzTYeXes72uoB8NbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SuSSLeS5WDZhQvXpmksyf9lLxdLMo5nYZ95Ffhl4cxDDJX/PrawmvdYKO17QanyrHkAe9/rA3aNUKFOxq6Gmdy0798PxTldp2M9l5X866l4r4PDCAtsKkC89TggnkA3zCb+x/W0k332BYSXLkYqA1p8Lya6ryGJa3aEuMXc4oAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 77B421C0ED1;
	Thu, 11 Jun 2026 14:55:52 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Ani Sinha <anisinha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	coconut-svsm@lists.linux.dev,
	Joerg Roedel <joerg.roedel@amd.com>
Subject: [PATCH 0/1] Support Direct VMSA setting in KVM
Date: Thu, 11 Jun 2026 14:55:42 +0200
Message-ID: <20260611125543.573835-1-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <joerg.roedel@amd.com>

Hi,

here is a patch to support direct setting of the VMSA for an SEV-SNP
guest via IGVM in QEMU. The patch makes use of the KVM feature posted
here:

	https://lore.kernel.org/kvm/20260611123528.572255-1-joro@8bytes.org/T/#t

But it does not include the required Linux header changes, so it will
not build when applied as-is.

Please review.

Thanks,

	Joerg

Roy Hopkins (1):
  sev: Provide VMSA to kvm via KVM_SEV_SNP_LAUNCH_UPDATE

 backends/igvm.c                | 44 ++++++++++++++++++++++++++++++++--
 include/system/igvm-internal.h |  1 +
 target/i386/sev.c              | 10 +++++++-
 3 files changed, 52 insertions(+), 3 deletions(-)

-- 
2.53.0

