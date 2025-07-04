Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35C6309A5F;
	Fri,  4 Jul 2025 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616734; cv=none; b=hmwSQ7iWP96NfDqNRiKjcmtG80eIhGJX7pejWSrodC4ff4CldVhjdsY9Rh1O7jhUelyy4ZjEqEtdtzoV5GpXmUwTQr8tlzABUpTkYoor6wyhj7AsbjrTlk9256qWZ6oWBVlE3rAguwwzFrshuR7psILgTC4qyhPrNTOgtyuc6EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616734; c=relaxed/simple;
	bh=fviJiUBQGEX0eBqQ7ZWhEkYapOKCHvtu5FcfUFEiSDc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwoE0ZpzgRvk96sPTHdEOFU2gg3GyIecSeS8BpqdhsEOtJbOOUcjPEXrdgncTgmy3UUhIs3ij5r8Vd0PbDeJpgVmKHtXgZGF4hZOdwUJ/IjR8nlNEeBfmROW7I3xXYgV2hGTLNrFMjn37cMmzeoeDKTY8u6tUQKM8ISo/j7kB+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=QxnX3d9C; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="QxnX3d9C"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7E42B4D68A;
	Fri,  4 Jul 2025 10:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751616724;
	bh=fviJiUBQGEX0eBqQ7ZWhEkYapOKCHvtu5FcfUFEiSDc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=QxnX3d9CsGGhaTaLWsWEpreDLhPkN6wS4hA7d7Au9MlG/QuEv3pOIoSw3l46GmoaY
	 VEH3YRNamJB4Y9YsmDjnzthWYVkHh3If0DJzvzwo0VnW+zp1xsVXblSTy52J4y1wQO
	 fHjUCVaWfi357YvGsGny6OlW0E4E4zghz1YzTVQWvXS4zkIYCqE5mzDiRUyDm97dJ6
	 Tz8zEbBThIgqRU9TgcUeOXzvP0vbHs494OylT+ef9rrQL5r98IuG+DByjZQH/cp799
	 B/9vk3Hdk8PwgXbEJPRUWnlX5pB8uxc0rnKHpYzhypeN/FvwGzH/09NpbE7TOLvMJw
	 iqVTuVgrVId0w==
Date: Fri, 4 Jul 2025 10:12:03 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call July 2nd, 2025
Message-ID: <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>

Meeting minutes are now posted:

	https://github.com/coconut-svsm/governance/pull/65

Cheers,

	Joerg
