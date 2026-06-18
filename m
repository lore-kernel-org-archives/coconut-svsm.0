Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C33A3AF64F
	for <coconut-svsm@lists.linux.dev>; Thu, 18 Jun 2026 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772145; cv=none; b=Lvtl6ocZsGX21CyPMM9uAiO0H4MULRypsdUvzhLuJyosO7SGnqHqBYmwpe79Hsr8Bv3QDP94TffNzw9Tsu6WcrKvGPpGNHTliKcIa/Ubm3Bu896Iytyp9wg5TQiuyD1cKhmOoMOZNd3dhoqkLKfc+1aGrULlJr/v0+R9qFOLgeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772145; c=relaxed/simple;
	bh=EO1RXDAHZtyghyRyy8e0OOhuyL3uaK/qNWF1grblEpk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sEZTGlfbYcTDhC4dKVYNhyqhE9ediGcV9oiM3nc2C8KJvasWAQOg1efgkjQoe/dr+lkLCoZj55q7pX/b9LvRzbqlVBlfGk7JK4Ow4xG4QVkuyQFLZcE0nxkwlsOgflrRmq5lHgJo2xY7wAMv7kB1eHNJAKbKluA50/dbU+IeaYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc500a35ba3a3f639f009.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:a35b:a3a3:f639:f009])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 392CA2029E0
	for <coconut-svsm@lists.linux.dev>; Thu, 18 Jun 2026 10:42:23 +0200 (CEST)
Date: Thu, 18 Jun 2026 10:42:22 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Subject: Linux and QEMU SVSM branches updated
Message-ID: <ajOoz4rSlvWZX-1x@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As announced a couple of times I have now updated the Linux and QEMU branches
in our SVSM downstream forks to use the KVM planes patches based on Linux 7.1
and QEMU 11.0.0.

The new branches are at:

	Linux: https://github.com/coconut-svsm/linux/tree/svsm

	QEMU: https://github.com/coconut-svsm/qemu/tree/svsm

For QEMU the svsm-igvm branch works as well, both (svsm and svsm-igvm) point to
the same commit.

Everyone is urged to update their SVSM environment with the updated components
as they bring support for features the SVSM will start to rely on in future.

Please note the required change to the QEMU command line in order to get IRQs
routed correctly. The -machine parameter needs two properties:

	-machine q35,...,kernel-irqchip=split,device-plane=2

If you encounter any regressions please report them either on Github or here on
the mailing list.


-Joerg
