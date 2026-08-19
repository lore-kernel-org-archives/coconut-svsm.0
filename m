Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB3A30D41D;
	Wed, 19 Aug 2026 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787170724; cv=none; b=PJoyheoN0AxfwkLjcEjuHxEc4hF3744NAgBsere66Bb5M8mgcgmCh96UzO6G0Pafo9aZja6ZLyhX+On7fSSMfZ2WiYhxzegSs14waI8yHamspvD/xE/BQwceWJansSQtezEmlajoHSG967KTpSgMAw0DvMNYdQ+Ki+Q14Zp3G+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787170724; c=relaxed/simple;
	bh=URpE2hO8TJ33Cwk/dBq3wB+S44BW1Tq6ZS3FD10g3+Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JESAGcn8jQe97lHHUijA+GIJJrCxlpiD0tPXmeUllSLOyBHyKgUxNxKcV36TeTpV+8WQqVQM/BlsxppG0DEFZKGogThJ7N4fDI4iTq7UkRAT8N+YyadMkXlobbXBiEWxO0glyCuXvXHF0ZM4W6VXjvl/Nl5RvLNCwRSNUfnOiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc500feb47f25f6f8979a.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:feb4:7f25:f6f8:979a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 6E1C0207295;
	Wed, 19 Aug 2026 22:18:35 +0200 (CEST)
Date: Wed, 19 Aug 2026 22:18:33 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call August 19th, 2026
Message-ID: <aoYPgiaS2R2z76yA@8bytes.org>
References: <aoSGHGBalATOojjj@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoSGHGBalATOojjj@8bytes.org>

Meeting minutes are ready:

	https://github.com/coconut-svsm/governance/pull/120

-Joerg
