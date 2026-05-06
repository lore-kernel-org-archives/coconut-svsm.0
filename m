Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A750261B8A;
	Wed,  6 May 2026 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063751; cv=none; b=VWQ/dgS5XibCjxPJYfAHm6vy8AXqjlJlDt5D2tSGXf6VZGFF+Sr9IGy23b8MtKzg+VgJBTO5loXNfXE/CPTo+Bz127d6Uiou+az0vEwCKrQigfgWMOm1+Ot50xfNiVA78CgNn6++I5K1SrlyAL5kn6MdKI5WmKV1KO2dEHUdpak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063751; c=relaxed/simple;
	bh=u/LscrDotJu6f3GpH5NwI2+ZfWdwUV71NUoxkye742k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYALSNS0gPf+0CM/wgSZljQfcLG5PXQjs2OOKLXTSD7GrBUo/xK07P9WTbx1757ab04pftEpEYTHsi6t+fCk3KvfkeghZo23YXSXXehHUs46n/NxLFNXoJmflEvp4ujrHJp39886LMKeq0IFDs+BF1JJTKrzc71PobMa9FCM6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=GRK70dAe; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="GRK70dAe"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id ECA0E5CBE8;
	Wed,  6 May 2026 12:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1778063748;
	bh=u/LscrDotJu6f3GpH5NwI2+ZfWdwUV71NUoxkye742k=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=GRK70dAerrhu6isbjynKt1f4OEUTBpfRhGr/o1l5HZqP32EuRVAgpv8oSDm8Gn3JX
	 KnOxFlXdZ6PlWwLkKYgjcy+CeD49A2O2LKpoDtjtu7qslVUB4TJ3yRt6XsDXF2yrB3
	 W3lUpAvdbQB0gwIBkXtUkywVcoV4H/APyGPD4IySGGQb6XprmmLGnptNUNm3MIOEw1
	 UifKvcKigqZtG2DOptTVIPyikTgNBD93qNteX8NrJNmf3wettRqWZkL+S4qgzLQo4V
	 dvAmdYW6wV8oRylUaq8bQlWfASDa8vrDAsB4sVjXtTS+qHMQBydD81cTe9J9fADHhV
	 48WmPpmkujLZA==
Date: Wed, 6 May 2026 12:35:46 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call April 29, 2026
Message-ID: <bkme7hqfalqqalcaxth36djng6bfzljn6dscsreyorozqjk32m@2ffpkiflbyyv>
References: <j3qgor73sx536uzabgyrfadoj7xznc4ir2pj6tbyimn7aqpiki@m5hzafmcng7m>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j3qgor73sx536uzabgyrfadoj7xznc4ir2pj6tbyimn7aqpiki@m5hzafmcng7m>

Meeting minutes are now available:

	https://github.com/coconut-svsm/governance/pull/106

-Joerg
