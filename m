Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0812EBDC8;
	Thu, 23 Oct 2025 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761207088; cv=none; b=p55kWQriKYj9aQEQAFVPKWLri7fAZ3vZaOGbBrGSeVqTyGYbdGrBSt16EH2nFDJ1NzQKA5H4pemjk6O7iqoxTFViftVIwz3JihkSiucSe9tjVesSPfyolN+J0vSnKGc0bp0KGGW1rrLjrQ9ibDytRKi9SdfiXM5//AZBXVpJvww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761207088; c=relaxed/simple;
	bh=/36uPtoDhAEeC9y07y2RP7RGsAxpF96uogiCYddQsfw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bO7L73QyRqpVGD+7WbWvNvl7eaDk8UuI6yOCNiI4qMiiBjnfQAc3CUweGNZ/L2/a8C4M8dLvFA//+QrPi45L1gMh8Cn7tY/DSKfp8/Q4qABcNfolOdH9bjUFrrYpzok9IlH7K+i4PkcGPzYSrlxnZW8+7EhoiLNxEuXGonI4Aaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=IIKfsrW3; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="IIKfsrW3"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7FA0A593C9;
	Thu, 23 Oct 2025 10:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1761207078;
	bh=/36uPtoDhAEeC9y07y2RP7RGsAxpF96uogiCYddQsfw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=IIKfsrW3zQdocYpbxf+U0pOUJuddT8lWAmTLmFjE0snDP3pM3GvTwaIgeYJp2kqAY
	 hzD2uwlZc5+GpdeEIYrkrtnKTEPVzARUmLtm5otPNZ6ToIBapmSgACHrZNFOa1U8u6
	 qUL239ERLYLsrYOcDyIXKmr5uRyvHvkkd5kIpWOhsraIB24bmMfadj2eWZQZSjP1Y5
	 OCEA/GdT+VKSZ80QmwB47YTqQgi4AdhClOKD+F0dGhQvyw2rEYo6kDlXrr7V3P2AJf
	 zVG4U+mcX3blQb45R8Qv9WrebpEQS4wwdETb5p5iGmXPSCMOJq06k8IuC3T8Y3ZF9t
	 5b7mm/EdTKfRg==
Date: Thu, 23 Oct 2025 10:11:17 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call October 22nd, 2025
Message-ID: <rs7b6tjghkofu2nzlv3ccanfi6zbsk4hi7ungm7tklufjvgj2v@sxzfcuduyw3f>
References: <vz6neag4eup6zcthdnirk4pcm3qyc64cqekwdkmmgdnlko4rpr@fhgr54maycax>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vz6neag4eup6zcthdnirk4pcm3qyc64cqekwdkmmgdnlko4rpr@fhgr54maycax>

Meeting minutes are now available here:

	https://github.com/coconut-svsm/governance/pull/79

Cheers,

	Joerg
