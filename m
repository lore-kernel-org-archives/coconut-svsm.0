Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5262521C9EA;
	Thu,  7 Aug 2025 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754553137; cv=none; b=HgLTvxqKCGcgHBR7N4CVoHwcM4VcbZiopRrLc+aJASWoJ9/ShSCdlGt5q9Ide1moagfbs6NR4ofq59i5Dxj9ITG6t79c4ZmgBCtxFHMzkyKF6I7vCBjUr8SMme6cre+vsnOdPDY1kDZxri502dYTU6201dclnXBT5FiNcQpscws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754553137; c=relaxed/simple;
	bh=CitrF9CAkLYwEfWlZmTBCZl7MWSNm+CUCbRTlfv3pmA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pJijfIYBTQeWjyfiNO6GkzpF8y28Db+kqjmmhWIigId0C59DliCPqTvUFRxILci50RYWwA/Zo1Lx8Yi4bVpqLYr2fHF53N657vZXFfXT2hh3XElefqPfr1AJInhTkhEB7l21InYmNGG6G+BJ79EqtgSGUhAq2vldQTXpaRAuaaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=v7uNhjJ8; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="v7uNhjJ8"
Received: from 8bytes.org (p4ffe1b02.dip0.t-ipconnect.de [79.254.27.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 10B085213C;
	Thu,  7 Aug 2025 09:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1754553134;
	bh=CitrF9CAkLYwEfWlZmTBCZl7MWSNm+CUCbRTlfv3pmA=;
	h=Date:From:To:Subject:From;
	b=v7uNhjJ8YlUjcVYjQ/KdH+GXuTzcMXLHh8LZw3011q1uoROEeAnPZ/X0YQlnqlcYc
	 zyj7Uf0eTfsUv3+tx8Q6PV379iqek0ZP71w7A9v5jD1iQGit/nE4b7AC0Ac+B5zMa7
	 1Cg4rkD2AXGOvHQ19KdqruEW8ssj83fp8U5GmdzcPLw2yWAnntDNt15gNOGLIhBiDF
	 wLSgtpKLPKxz4t0BbzvaWkGIdKFW6/cgOvCQyfj519yZUag45QaCYjsoJbSMRjouEy
	 ZCJwX8OZ77DgZ7P8DWTdhDcewnUA/y+dMTbvEEB3stGaXs/PJuLT5mB3PYejkK2sk1
	 BR0lOBdbuLIcA==
Date: Thu, 7 Aug 2025 09:52:12 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Release 2025.08-devel
Message-ID: <txdtxjzpioitxh432unomvcw7536azb6mkqule6urfplx3jziv@tycmnc3isvtw>
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

It is my pleasure to announce the first development release of the COCONUT-SVSM
project. The project has come a long way to get to this point, from now on a
new development release will be made each month.

The release can be obtained by checking out the `v2025.08-devel` tag in the
COCONUT-SVSM repository on GitHub.

While there is sill a lot to do, this release comes with a considerable set of
features (incomplete list):

	- SVSM Core protocol support.
	- Ephemeral TPM-2.0 support.
	- VirtIO-Blk device driver.
	- Guest request driver for communicating with the ASP.
	- KBS attestation via host proxy.
	- Formal verification.
	- Multi platform support (AMD SEV-SNP, Native, TD Partitioning).
	- Multiple hypervisor support (KVM/QEMU, Hyper-V, GCE Vanadium).

I want to thank all contributors and the whole COCONUT community for all the
effort it took to get to this point. Keep up the good work!

Thanks,

	Jörg
