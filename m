Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEBD3B95EB;
	Thu,  1 Oct 2026 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850079; cv=none; b=e9FaHkdPoqjMAF4xIlqOMQoOdtFtr8TiGSgbRe1IoEXlbL6vEl1x1z9sycfJHyFTYIw4FnxYIAXwdVwHbwv3vhHSYOhWBAMa0Zx0L18geaR0r11O8znAc2kYgjZEOV7YzC4DfvarHPxFLhkWJHQEIYOdPbym2BPMkqzWeLpvwzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850079; c=relaxed/simple;
	bh=KnqPQ0q5IImBFOlS3dgGtdsrjBhs422+OyNTLk/5Nqo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HV4e1SfR4W0rGB9OY4LshtsFRbOKoLG6fp89p9fAFObv6lHWTEFPeIkKs+oItD9vSRBPODKsdZilPSWGCvV2Nmm+au8OIwuHHRnMxOR3LPbkxYcUkA51fxS/RRIFZhDSIcNLwjb+HkOiFkJaXdrTntUfKk5r4QmcPqSMY1++Ha0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a00b07c104f01ad9be8.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:b07c:104f:1ad:9be8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E6A7B1C778D;
	Thu,  1 Oct 2026 12:21:09 +0200 (CEST)
Date: Thu, 1 Oct 2026 12:21:08 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call September 30th, 2026
Message-ID: <ar4z90vVGOT0B_PA@8bytes.org>
References: <arvj-0XliWJT0809@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arvj-0XliWJT0809@8bytes.org>

The minutes for the past two meetings are now available for review:

	https://github.com/coconut-svsm/governance/pull/125

-Joerg
