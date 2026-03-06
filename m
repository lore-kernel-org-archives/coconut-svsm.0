Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3572C158DA3;
	Fri,  6 Mar 2026 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786730; cv=none; b=cYu3kHBxRNm0TWNTXlcXbcby/IeajYkn1UzGk/udnTUaaWlNT37CIYU3FTzMk+oCEMSM49XNUP1z5EWw+oQ+Wqg/9nXOtJtg3RNRM8NV42uaK8CHAj/No8pMf1iFd07fwVS+OrqmDBBYIoUvxJzD7ZLs3UEGjHA9ZtpSLVrH4kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786730; c=relaxed/simple;
	bh=uGkfey0m0DWYgX+o8dQREkfyIY1+2/Nek9Zubrn5CpA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckq4qT/QQpG2BbhCK+nfQ0pIVnLjijosZ3lWjbAVBe5fxRxUSET5o/3IoU7PxPVX3MvyhULad4RGj9P+kSNV6FeoLL60YuMNx2etmoW5qWzg4Zamq2YGJwAo3INRrmwyTwnBsX2p/zS/IM3r4JNsgBgItW+kkkFcPEo/lnDLtAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=pxJeFHj9; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="pxJeFHj9"
Received: from 8bytes.org (p200300f6af1d9600fb28e2315ab7692b.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:fb28:e231:5ab7:692b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1464C1A1FD7;
	Fri,  6 Mar 2026 09:45:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1772786722;
	bh=uGkfey0m0DWYgX+o8dQREkfyIY1+2/Nek9Zubrn5CpA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=pxJeFHj90cYRrbZPSND3jzi464gVlDej9iGZwYdpCxWA8Tfo4H0+UXubV6Z5QBblE
	 GGYbq4jc4VEO0Ibf4sRffJOXgisu5GoLKDrGBFmuR8zhwll3JKvnKvn8PKc8Uhf+ku
	 KUQqDk7vRgWjoHW4R1Q1r/BwTbs6iVWG9tSs/sfLbwMoDDVMC8qD9gP6cMnYnHKqin
	 vHslll3jpfKzO6uV+7yTfYyg3QAHUmTrGlGDJzMK7ECvFIOxeK7rXSS16MSaA2436S
	 MeLsFR+WTjRgdreKyfiEdl0wRec1LQ9lwNHRqt63h+qbTN2lwFiiPfgY12yb0hzTn/
	 8xTmrWaKks13Q==
Date: Fri, 6 Mar 2026 09:45:20 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call March 4, 2026
Message-ID: <idpxkbyb3253gs6zzrswt3bte4662kf2ejmsqglzqukke7wwsj@rpxk4zdgaopj>
References: <bvfkpoqw2bz6ryy3kblt4vrqweomutyypvn7tfqqokyje6yoc3@dqwyss5eb6qy>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bvfkpoqw2bz6ryy3kblt4vrqweomutyypvn7tfqqokyje6yoc3@dqwyss5eb6qy>

Meeting minutes are now posted here:

	https://github.com/coconut-svsm/governance/pull/98

-Joerg
