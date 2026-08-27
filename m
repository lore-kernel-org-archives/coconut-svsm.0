Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED18748A8C2;
	Thu, 27 Aug 2026 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847432; cv=none; b=EmGOM8bYU9ccpvDtz4vEQ8Xq5wV2jklpJgSQxhQ5WfVhGntkU4G/HOhsjoXVp5iOBjW+1I0tLmYtvUgvfeBi4EDJqppOXWYcnHUMDkt721Vjd0gqmgLAvPR7FeO4x/e22tARuwPp2md7DRTbBo7uBk0KRSX6M5QuDsrWoI5H4H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847432; c=relaxed/simple;
	bh=/ob929Hp69XSZ16f42E+ObKfQKLnFjgz9T4zp2Oce/Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PRz4wJVAiqHNsBXuWsfbSZgZF/PdwNjattu7j3bHeZjkTsU7amMV/kRfjIDtVpTY5Fr4vgBpbTVrQlVQMj8VeoiAkF2WVaSoUCl9XeCt6wtKWDJuzYPDNLY0/6vPYrQrGjqhnJuDO0M9yzBq4PTk7KtNdAICIhnJzyYfqYZhD0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc500429df5589d5a56bc.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:429d:f558:9d5a:56bc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5C12F206254;
	Thu, 27 Aug 2026 18:17:09 +0200 (CEST)
Date: Thu, 27 Aug 2026 18:17:08 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM: Updated Linux and QEMU branches available for testing
Message-ID: <apBelv6Ev-lCQ64J@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I just pushed out new branches for COCONUT-SVSMs downstream Linux and QEMU
changes. The new branches need to be used together, as there have been rebases
which changed parts of the user-space interface. For Linux the branch is:

	https://github.com/coconut-svsm/linux/tree/svsm-v7.2

For QEMU:

	https://github.com/coconut-svsm/qemu/tree/svsm-v7.2

These new branches bring a set of changes and new features:

	- KVM planes patches rebased to v7.2

	- QEMU patches rewritten on v11.1.0

	- Support for KVM planes with in-kernel IOAPIC/PIC/PIT/RTC

	- Support for PCI device assignment with KVM planes

	- Use of version 2 of the direct-VMSA patch-set

The last point deserves closer attention, as it will lead to a breaking change
going forward. The new version of the direct-VMSA patch-set requires a valid
VMSA GPA to be passed to KVM. The currently used GPA (0xFFFF_FFFF_F000) is NOT
a valid GPA.

For now QEMU will fall back to legacy behavior when it finds an invalid GPA in
the IGVM file, so everything keeps booting as ususal, except that the launch
measurement will not match anymore.

This can be easily fixed in the SVSM and I have a draft-PR open for that:

	https://github.com/coconut-svsm/svsm/pull/1209

This PR moves the VMSA page into guest memory for QEMU, just like it is on
Hyper-V. The problem with that PR is that is breaks all existing Linux/QEMU
combinations, as they all have strict checks for the VMSA GPA to be a
0xFFFF_FFFF_F000.

My plan forward here is to switch to the new 7.2-based branches after everyone
had enough time to test them. After switching there will be even more time for
everyone else to switch over to the new downstream code. And only after that we
will merge PR #1209.

This is not an ideal situation and I'd like to have avoided more breaking
changes. But in this case I believe it is justified as avoiding this needs ugly
changes in the KVM direct-vmsa patch-set.

With that in mind I wish everyone happy testing. Please report any issues you
might find so that they can be fixed.

Regards,

	Joerg
