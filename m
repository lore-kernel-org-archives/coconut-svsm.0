Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A673E5A0B;
	Wed, 24 Jun 2026 21:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335311; cv=none; b=o+FWlGC63QfNLOVcStAfebRXD5w7tUF4k1yDPXn0fpGEInKkX8SslEBlAJTjTOarocHh9/lSt9niM/RhRuU7lLm1MNhAE5F4iOQCrLnDDGQvbasoUzc9jik6yMuElPXBYC/lHKAVx//cBFpSTxU65+TDQW9YT/KfYEL0jrPZTp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335311; c=relaxed/simple;
	bh=gbF0Ddglg3PrkK5UYYivcTp+KbrnvPUPgqXiUBBQHIU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXG9btjK3tjY9Z7yqur8vV5yumF7iudCUZw2SM0c28LyP7rLW6Kqx8xmZUJMHSGQ2oXl4tQB3xQ4QTfqyJ4kp1xNprLKLgqcpu88CvQ+wpgnGcIQqgZyObYNqO02eKjNJ3G7XDbUmnjIsTJwWmNKsVtPyZfYoiKP2iz09L56UTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc5000ebbdf2df2b9bc9c.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:ebb:df2d:f2b9:bc9c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 92A5E2045B2;
	Wed, 24 Jun 2026 23:08:22 +0200 (CEST)
Date: Wed, 24 Jun 2026 23:08:21 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call June 24th, 2026
Message-ID: <ajxHKn_Mrhezc9gu@8bytes.org>
References: <ajrYD8ojVpEiQ20D@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajrYD8ojVpEiQ20D@8bytes.org>

Meeting minutes are here:

	https://github.com/coconut-svsm/governance/pull/114

-Joerg
