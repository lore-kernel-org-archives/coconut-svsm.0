Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E020432FA3;
	Thu,  8 Jan 2026 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864080; cv=none; b=Mo4+o6W66wLWgtKJHXoQXmdyN7XvJeQxecrapgaM4Xw8+IDwrkF6ciWRX6G/R1g4uPD71brV4XXeH+p4lnLg/7FG6vP3arO2cM4zbxM//J7bQUkPjvo/gm/BwKVKHuNJXLVOxwRTVMDRB+XzyiYMf4UeBz6pnt1Uc7wRf9gOoQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864080; c=relaxed/simple;
	bh=Pb2Es9C4lm4saH02b6Kt6FLizmyahvDBjW+FAQzY/uA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0kcIcYPDxVp9taL3k0EtBPzoVHQIboQD9vGg11rAovsmy7RjJQ+a+ioF64MU24ufEFhiX4i15LkfForm41s2jEqyLiMYkdyfXZvNphFvd3hmLCd6aPcqJnCjeVHezgUcuOSm5c+vh/toBufm1fy4OUXBHr2WGGvpacqbDcaegI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=WEKS987t; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="WEKS987t"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9F4E75EA13;
	Thu,  8 Jan 2026 10:21:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1767864064;
	bh=Pb2Es9C4lm4saH02b6Kt6FLizmyahvDBjW+FAQzY/uA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=WEKS987tOegoNjVvrF7z5MFzdcybV5SjL8s8oQPEz+GoKxsZug2FK5h4bcK/UASyo
	 rlxs0/9e6tNmS41fkqvTt7Xsh/9zAErNBc1IYpCIOsmcVRTUH853+UhhHJ52Fg8oBz
	 OTvbVyKDZDcuHZN8ZujCbrL/fJS6WGh+7vVNHefH5sq7JhIL/dsgb5RpV9gJU3OCW8
	 327GOAalVGIPTNdrO1k+U3rDB1rFZHxJRD+rvJU3uGtDtZvLcZ8KcDyNbLDiy60mRO
	 Z7Iq9SJWemPOXlmvESQ8nzGGsysfWIzpw/AxFb5cEkmnyJYnp9J5QHipjjD466fA7z
	 FhSpIIS1Iw5UA==
Date: Thu, 8 Jan 2026 10:21:03 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call January 7th, 2026
Message-ID: <ovz3fqmek7idafet3ympqetqwn2knfijxobk4he6gynvh65es7@nawyolpn33ko>
References: <7eiztvv2iuki3feczlj7wksll2hdh7buttz7k26llsger2qkwf@wfa2sidzim63>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eiztvv2iuki3feczlj7wksll2hdh7buttz7k26llsger2qkwf@wfa2sidzim63>

PR with meeting minutes is now posted:

	https://github.com/coconut-svsm/governance/pull/91

Regards,

	Joerg
