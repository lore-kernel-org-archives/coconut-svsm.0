Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A834A1E1B;
	Thu, 17 Sep 2026 10:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640681; cv=none; b=qXk73ur2WnE6dtlTUZ5ziazvwtnUw+aJLjQmqwFyPU4BGovCcJ4MMQixTj16IUpf4xyV7ZI4uAU9kcaf+fs3l99FWCmynDw9ow+0BdcGF6iQrf4TijExYQ+WXIjJYL2SXU0npeEDOgUzLI2bTdFBAzHyUvB7dZ/dCnD9WFPbGb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640681; c=relaxed/simple;
	bh=nf3JvYFu7DFgY8j/KudrvD2ix6vwDFvO1m33KoQ6kjA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H05hXhxAGqd9f0+xsckdkVVS/mLKlliGte2PXjdsEVrj9CeYiugrEgTdCoJJMhFeE4H5tjDcq14Hzdtg4na6caxYKeWMyNFSQeqzUTlEGrhNz3kSiJnekAl3I3eyuO+2x/zcsnJcQGrrd/s14P9IAD27IOWykgfx9LxkNg1DpPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a00d97e11a7b5d1f70d.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:d97e:11a7:b5d1:f70d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 2ABAD1C1958;
	Thu, 17 Sep 2026 12:24:38 +0200 (CEST)
Date: Thu, 17 Sep 2026 12:24:37 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call September 16th, 2026
Message-ID: <aqu_1vyT00ni3-7R@8bytes.org>
References: <aqlXypyTlhuLRVmD@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqlXypyTlhuLRVmD@8bytes.org>

Meeting minutes are ready:

	https://github.com/coconut-svsm/governance/pull/124

-Joerg
