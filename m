Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3BC17A300;
	Thu, 10 Jul 2025 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752130605; cv=none; b=VUbXBQgwSx8c3hkJ4LJ/2cMKUgbfEIZBV4JXEMe3UHu599X+tTD0yPQKj8bv+BvxTwV+/ynCtM+JJjkuQrAkdglL1z1ZFiqEHSPpZHsYj/8LHKZSbXmaiJiKKnpq1CYiztTTP0xAfnxWcjwNo11t/Oo3MC0vnvZw119tZPCXKsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752130605; c=relaxed/simple;
	bh=tVWmHiZMFvaMH4M9v4u/o2dimwt+cu2+3+CStvsK5vk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odv5FewOQqoTS1eJTl85NCBSkqNYRilHUzVLIKkY86z4uaqAvyRvwTBi8E7Fg9ol4oKf9B47RD7IN75qM+ZoRpeDTkSpy08gJ7ZETDpUKp8BomA8MS6A78NCeZBOs/U+fj3XEQK93qDhWMH0IcjJBJWSRod9U8sPrteVdpB5YJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=jUDI6U14; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="jUDI6U14"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 857274FD74;
	Thu, 10 Jul 2025 08:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1752130595;
	bh=tVWmHiZMFvaMH4M9v4u/o2dimwt+cu2+3+CStvsK5vk=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=jUDI6U14a7yrVXgMZ+7HSUl2mjkb0Vn09Wa5bi2MPe5o4uvpfpV6ItfJqxRmhiIf3
	 VFjP9DociZKzp4E5ZcLuIbegZvP6xAEJ5hL9TOZ8E0k/wqCYf34FFHT0d9SqGpns55
	 1s1vWzM4rHHW5JIW+soDilM/irW7OVFEIcOIlm5w2ta4TNfYl0UjZhoTK9IJELUvrL
	 QaFEwbRrbK4TzOF5nQokBKV7oV7t4m9qQvOfXRUEW3ysU87qOUk+fVHcR7dQNh1sFX
	 uUDqMsY8jP7JSV3C3ZyvfRHpliV7n52U5VLk3oBJlguCjmx89SSGxUcw0ewIq7PtIV
	 qewxIZAvgNiUQ==
Date: Thu, 10 Jul 2025 08:56:34 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call July 9th, 2025
Message-ID: <c7aise4auijfopbk743krcr7toydp37p5wnao6l7bez6sf6xjh@gc235gqus553>
References: <77dsinxz7oc7tfcox2ochbsunpach573cy6pryf7jlndf4hwgz@eqcdwp5psogl>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77dsinxz7oc7tfcox2ochbsunpach573cy6pryf7jlndf4hwgz@eqcdwp5psogl>

Meeting minutes are now available:

	https://github.com/coconut-svsm/governance/pull/66

Cheers,

	Joerg
