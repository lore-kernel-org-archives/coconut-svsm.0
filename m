Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED3126E6F2;
	Mon, 23 Feb 2026 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771855315; cv=none; b=Qi53ECWn6UWsnRQqkMBBrgp+0ngQqrP8p6+0J1djZs+PQXS9r4pMR2dlYQKW/eDQiM9UmkFPcgVMupYe0nMVadjENfqX/mVZgKdvdrhAU5G2fj4IPi5q2PDoTGs8efQA/JbCBVF1dZjaoChAsWvcgDH1nVnIT4rft2t/4scdshA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771855315; c=relaxed/simple;
	bh=whMfs96EkcBNOCotqQyvPCsXjFajBGf9S0zgIYKTsg8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pGlfxDtzW6uwKKv6Vj834MjzXD1g33gBLlTHM7eTYwbE9zCxgjuKgmfD6mW16qgxI15VkG8jMjYQGmTtZ2a8OWmfFKqUtiJrPGYvXbgtHiJ3EFJrl29DdtGSkmAxl9MHbYTyWfUXABr6c8jyCUF/27sDljx+ziEnw7DA55zfTfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=lP+dkm/n; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="lP+dkm/n"
Received: from 8bytes.org (p200300f6af1d960066913c0d0a78b42d.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:6691:3c0d:a78:b42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E31F31C1EE7;
	Mon, 23 Feb 2026 14:55:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1771854952;
	bh=whMfs96EkcBNOCotqQyvPCsXjFajBGf9S0zgIYKTsg8=;
	h=Date:From:To:Subject:From;
	b=lP+dkm/nlDH6lC+b3oXWjyEqTasq5fCYDX6SHWj+F6LIeXNEW26smGqJ4CAmM9TI9
	 yIjQDzmTdJJNLPpmWr1WLpkXh3124cjmgOcuUR6dpfGDx+deQEVTKknT7KTHz2qK6i
	 r5u60mkN30tWTzXj71o+Cfw4xMoIfy3W6ZEsz4xXAla2CKxEr/A9E+MFCF7lZxB3DW
	 BZMrEybzz76fxiGJ3nGSC/A5tyDeecP/rugPH2NcwfxRGSFMFsob7M0PXHAxfDvxTR
	 1P3SZZacc+IFo7qT2zB7UPSXgXQa2Z9e4lKavasJT4u9VkDpfN818CLq4cOQjiU/B9
	 xCqScUwf6cpfw==
Date: Mon, 23 Feb 2026 14:55:50 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call Meeting Minutes
Message-ID: <6t3gblkbvzj57gp64thmqln37hfmwxuwwbunnpgpaut6p6b3z6@guo3wr7besmf>
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

I pushed a PR with the meeting minutes for the SVSM development calls on
February 11th and 18th:

	https://github.com/coconut-svsm/governance/pull/96

Please review and sorry for the delay.

Regards,

	Jörg
