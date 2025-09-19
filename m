Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B4B2C028E;
	Fri, 19 Sep 2025 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758269619; cv=none; b=bl9+UEU41fN+NLkIDimO5Y/57Z3eMuveujtTSy1MFAnkHZ32ckGsvKFCE/LwzpLsaRqGlAHzYWdMF6acr095KnwdHVc3TwwOJGrlcoy/ry1DFVhMDyBuDORdGC80XVSfLthf9OsJRo4CeUba92OEQ00v6yfOd9tjjz4xA0UcU9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758269619; c=relaxed/simple;
	bh=PpvkPIOjsuhWLgh/WznuVzoLpDILL4zKzWoCo95mTDI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPrDOg/A9RiyJviOhf4rhavy9z8HMkttAV+T2RJGYagbc1td0a8eAuGZH7CYzEXNpXWZz1FLPbFmUAwRwbZc5gEGosbYTHHIpT7suVfu6NJTmr8mzE1ISaDn8srUYjR27jaQqyWpiTkkHFCV2Go2/LdmWSz3okT0KZ62UtzAh+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=aktuHwCf; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="aktuHwCf"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3E5E955DAB;
	Fri, 19 Sep 2025 10:13:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1758269616;
	bh=PpvkPIOjsuhWLgh/WznuVzoLpDILL4zKzWoCo95mTDI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=aktuHwCfsA3Hvav+FTW9lnBMly3PMy4yqwBvfA4MaYoshnDRgFRbHV8+AvZWalhA+
	 mVxEpmAfDHfKW6i/lvAM/CtG8ht2KDmRGhJggiO6BGaY7C7RyS0qlgBJ0xNK6lLcX8
	 W5kwNdnKYSfKFYPF4jBKfwlUUO+yRgDNoNqRyC4AVJ43yA4pRYbgvL5LYUYrJzwXMT
	 JKkahwpBxFTytdOOVmI9nhHSUBgog+Op/RhTFWAIMDUJmkanf2tC07+wHFU8HDCLbO
	 0HlpmAlFT7UXhZ8y3Scie5TD1MYX2Vzc8hMXCnsNNaN2uOlpgQewAlcBxshh6lTujb
	 RWApEWhcxA1fQ==
Date: Fri, 19 Sep 2025 10:13:35 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call September 17th, 2025
Message-ID: <f3afdzm6mhtvq5qpkjolj6sfmfoxi2nshve3srnfhyyl5ofcnz@rsl3euwu2s66>
References: <lcem3i4xidnk3ngaeotq2qyxhylt72sx3tjznvo3uz7uhxlgp7@fbyok7ripatk>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lcem3i4xidnk3ngaeotq2qyxhylt72sx3tjznvo3uz7uhxlgp7@fbyok7ripatk>

Meeting minutes are now posted:

	https://github.com/coconut-svsm/governance/pull/75

Have fun,

     Joerg
