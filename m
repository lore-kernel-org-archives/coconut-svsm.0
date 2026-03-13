Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DC034B1AC;
	Fri, 13 Mar 2026 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398953; cv=none; b=YBCfVL6KMw5ozrrBIQwUdc0iY4o2UUc0F1+oZMPJddg79rzDSScbQTQvmHMV+SO3lsvrfbNeeRFOMoHa4ZPdTI9bAoxKQPQFBAjC8OPmEDwozL5C5+6vAfaBoBRcZUU31jv6bh/Rygk+ngkL9RlK/+DpBbTMj/ot7zV3gVV5Khs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398953; c=relaxed/simple;
	bh=f1vlby8IepCE6zMqXtz5XmFhmdjBRd/wUtjNIzvqj4g=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elaieqa+uBxMguuCAz2INEQjdibt+8jLmSJryrebh+qKISkIF4OYqYGr9vdzDNsJlhIXYpb73Ffc5UHsDIvGIBqT8kRjP/WuzwL6tYg6xW+pf+XQ4G05jBGw2NO7A76B/tBEXeOK3Z8KHvnQlfgoFLWUwOvZ9oCGt1WqJqWhBhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Dyy12mvY; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Dyy12mvY"
Received: from 8bytes.org (p200300f6af1d96009e24f893febe622b.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:9e24:f893:febe:622b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5776A1A4829;
	Fri, 13 Mar 2026 11:49:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1773398945;
	bh=f1vlby8IepCE6zMqXtz5XmFhmdjBRd/wUtjNIzvqj4g=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Dyy12mvYn7KHjEjWwdklZE7GJM+5P5nXxR4selq5Wmz8uxpur75IXyVSVIbvv6ne2
	 M28lmzGPclPNUaMkextyllk2zQsI251HwcUNXLW8MuyS6XoJ3mIee8d25Tv+zPQET6
	 nLPa5hf9K6IFRM2UTH8UDNoeG10iTmfloT3Pj1AfZNNyjyHdkBJYiy2lUNqUVRqKSt
	 Pi/gyKbJ0WBG+zv+YX+Mp//12vd/HFuPFd5Ckthr97RvGNX362OO4KJcRZxR7Ceg7O
	 OJMaqqr1aVEj7F7uY+ngrL7hGVwJwmiZegTjLYbRv+ADI02mOj1ySQQVwam1RcCJD6
	 Ply5oTWM6QJZQ==
Date: Fri, 13 Mar 2026 11:49:04 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call March 11, 2026
Message-ID: <oppeoroxsrwvfmgc3m7f6fovq7xztxwdkei4fjeyfbew6zkoqu@bogesz5wdfgu>
References: <ete4u42tzmawocptkhibgkv6tgg7rlqcpncdutnk36qtpdejcz@cxhur5ib7dzz>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ete4u42tzmawocptkhibgkv6tgg7rlqcpncdutnk36qtpdejcz@cxhur5ib7dzz>

Meeting minutes are now posted here:

	https://github.com/coconut-svsm/governance/pull/99

-Joerg
