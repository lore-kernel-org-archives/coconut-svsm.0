Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9852E0935;
	Thu,  2 Oct 2025 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759404554; cv=none; b=jK/2OBJdDXx8Drt49UF4lYrXi/foUzMvYl7GdUCPXJ29fhnRf5WEFDGSeSPH4gFYmVBTmrnTBbrkRowkC91ZKvolag4Gu24K1mGJh14knRZX9ARWFXf4oaiMqESDhjVTpBiZ5+QrsNLuHI7FyDFZAOQYe4kfs+3NBusot3bR608=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759404554; c=relaxed/simple;
	bh=dRLs8Z0f1sx//hLcXpG95ClJHOojBn9qofNNDWHa1C0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEwHXK4KiQ6YXb4JF87IhAqJeIwKZpc/3kLRHyCXAFXz2u+XF8LnKben8eFj39BErEI6/aEHwlD+4QihP6CbgUde17eQI4X/ln78fNl3KCuR+1wsSGASI2NQcc510AQw7SYmYGPn55ZPRePPMXZeuub/gSwTSGlBETvgg9gSB48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=QyLXnKH8; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="QyLXnKH8"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 063B256BF9;
	Thu,  2 Oct 2025 13:29:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1759404549;
	bh=dRLs8Z0f1sx//hLcXpG95ClJHOojBn9qofNNDWHa1C0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=QyLXnKH8smF7DsWMxaIZ9n7VnPOFj+13bS64X2NkTuZYMEdUU7QAIbKFgnOMuLQWA
	 pK2kUBdJ7ufejO8oXiqDZk/pzaLKyHdeOyUt6/RmMjm+zOgPXqfiJI7u/AmlMxyXnr
	 KoNhc/ctW+qgS1kOVQc0FWUCZNa9wMYRlBoJ156LFqrlZWvrhFSUg3WxU323FxVaOX
	 4vkbnXN/EiRzc2HMQUZ8Up0tt/7N06WbkDWOje+4vObgPA6DqnTnLbfe4UW1jgLCTV
	 I4/SesWhjlpDzTa8+3kf+atwro9BttBFLOGhfWiuElinfaeTWJlRqhw9wwAkXwed2r
	 kmOIr1lbDvKmA==
Date: Thu, 2 Oct 2025 13:29:07 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call October 1st, 2025
Message-ID: <jm74nkmksw2fhc2wtqrcwbawe3gozdjuik6ooccuxpz56o5h3q@n4cksz5ecfk3>
References: <gix4cnzw7ws6ajzd723k5u5y4fexqnwyuhmp2a7ccgejeru62o@y3lyqiq7ayog>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gix4cnzw7ws6ajzd723k5u5y4fexqnwyuhmp2a7ccgejeru62o@y3lyqiq7ayog>

The PR with last weeks minutes now also contains the minutes from yesterday:

	https://github.com/coconut-svsm/governance/pull/76

Have fun!

	Joerg
