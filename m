Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833974CB8A3
	for <coconut-svsm@lists.linux.dev>; Thu, 17 Sep 2026 11:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645849; cv=none; b=rutHipTBiEAEbFHYiABKcO1Z+syY8z5bwMAiEdSuG8tSO+cIjB2Fd7FTG3jbWGqILdvx51wPHK/EgTj+zRUoDdok1dNC9pPpNsqDvmQIYccAxxFkeICzgQYqGm1VbV8bWzkv5mI/uVzknjlB8N9LxCvCuAGsNmY2vRwRtt8o8Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645849; c=relaxed/simple;
	bh=11kW5JU5Xj6obRycDbk1mh25ZKeWndXf8bGaVpIRdSE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tDBCuNs6g+45nYGpeJVSLM0YaxTZUB8MONVLgJGQz12wAksxxZUxklhZA8Dtcs6O1D87yoJpm309o+HLRe7b6lzPDaofi05bFmpE6pWVHZEmR48zP+kI+aEcgKPJ8kjHCyztntbyyTWszxj7FBGO3SomNSrlwdxshv780DLnMAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a00d97e11a7b5d1f70d.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:d97e:11a7:b5d1:f70d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E3F7B1C1958
	for <coconut-svsm@lists.linux.dev>; Thu, 17 Sep 2026 13:50:36 +0200 (CEST)
Date: Thu, 17 Sep 2026 13:50:35 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Subject: SVSM Linux and QEMU host branches updated
Message-ID: <aqvQzI_5GRTjzkG3@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

As announced in the development call, I have updated the SVSM host branches for
Linux/KVM and QEMU to the Linux v7.2-based branches. The new QEMU branch is
based on QEMU v11.1.0.

Both repositories have the updated code in the `svsm` branch. On the Linux/KVM
side there have been some updates to the v7.1-based code:

	- Support for KVMs in-kernel IOAPIC with KVM planes.

	- Support for PCI device assignment with KVM planes.

	- Updated version of direct vmsa-setting support in KVM. This includes
	  a user-space ABI change.

Both branches need to be used together because the kernel/user interface for
KVM planes has changed. The new QEMU branch contains:

	- A new version of the QEMU Planes patches, completely rewritten so
	  that QEMU now maintains QOM-representations of KVM plane state.

	- Updated QEMU support for direct-vmsa setting.

	- QEMU now ignores IGVM command line directives.

As of now, running COCONUT-SVSM on these new branches will cause
launch-measurment mismatches on SEV-SNP. This is a know issue and will be fixed
by SVSM PR #1209. But since this PR makes the SVSM incompatible with any
previous host-side branches (including the v7.1 ones), everyone will get a week
to update their host environments before #1209 gets merged.

So please everyone go forth and update your host environments for SVSM testing
and development. If you experience any issues besides the unexpected launch
measurements, please shout out so that I can fix it.


Thanks,

	Joerg
