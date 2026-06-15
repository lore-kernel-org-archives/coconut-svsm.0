Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD27331EBF
	for <coconut-svsm@lists.linux.dev>; Mon, 15 Jun 2026 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781536324; cv=none; b=S07sF3+qsynKikC5fNKlba2e6ZlFcQv6WTnHu9ODglizLu3MvE2GBE0oyiOEIzlTsZyvFo2yOiruwD6QP5BvrIXL/YAtgQDqJ51canoZI8K2J1oawlfplkVlTjV8gdWYPn1MEO0pIqxzjdRDW/5CkZABNKq8oBR4yHC5I37RPBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781536324; c=relaxed/simple;
	bh=v7TF+sifwWP4TAcwv4/1xzi61ZwYcTHqMev11uJRnSA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GAoyXzmViSrodO/y7zHi3SfiQffmxjd/ASk4royS7qzfYZV4tAz5mWD0d7XuiRvDtogcp2Y/TosMOTbjruGn0YF+qwc5W0Kwdojf+dj20ZM4UvXpzeN9FCdHFrI0PtIwbeV0HgBO6+WDY99xRryNrOxaT5AXRbs/JmK1PNS+KFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8B7E5201C37
	for <coconut-svsm@lists.linux.dev>; Mon, 15 Jun 2026 17:11:55 +0200 (CEST)
Date: Mon, 15 Jun 2026 17:11:54 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Subject: KVM Planes Branches
Message-ID: <ajATgJlCiOvKbCr4@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi all,

Now that Linux 7.1 is out the door I rebased the KVM planes patches and
prepared the updates for our downstream Linux kernel and QEMU branches.

For now I pushed the updates to separate branches for everyone to do some final
testing. Later this week I will update the svsm (Linux) and svsm-igvm (QEMU)
branches which our documentation points to.

The code is here:

	Linux: https://github.com/coconut-svsm/linux/tree/svsm-v7.1

	QEMU: https://github.com/coconut-svsm/qemu/tree/svsm-igvm-linux-v7.1

Besides the KVM planes support these branches also include the patches to
support direct VMSA setting from the IGVM file, so if you run test-in-svsm with
these branches the launch measrement should be correct.

Note that there are slight changes to the QEMU command line required. The
-machine specification needs to additional properties:

	kernel-irqchip=split,device-plane=2

Without either QEMU will not initialize or the Linux guest will get stuck
during boot.

So please give the changes a final test and report any issues.

Thanks,

	Jörg
