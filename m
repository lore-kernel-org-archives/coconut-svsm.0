Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B43F2D46BC;
	Thu, 16 Oct 2025 07:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760598172; cv=none; b=hAJvsnOhsnANc4orIpxMEmXttL/oFKZzyC6Lkx0ocBALaLioqaHXKXjDv5wyJwTRP2DK01v0fPC9YOTeFV45qGHnHgC4KAeuG5fmXafipSYd5/JHViqmPWWBOpdQCVpmfZ0DJXENhaVCSvACglVIIGoioLnSlOj5Ml5LCgLGwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760598172; c=relaxed/simple;
	bh=emsN4i3bHwGFtnUqi7eooKckveRl8NcUpAflelBTpJI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2ke99An4gq1bNgJaImlsIEOGzMuGNkQDXphUlKHEnu+1gez4PQQaQqI+buSQbHrzn33pRs+J1zqHB7FbelM/uvTQ5ufCC1cnjH//odVm8Q/9AZ+nQ/nyRlCL8b4PLK38zuNi4FKWul00l7ptxjeaPDRS6EnAmoUz+DTHc9Gl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=4U+9sL4D; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="4U+9sL4D"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0C9A2568C8;
	Thu, 16 Oct 2025 09:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1760598163;
	bh=emsN4i3bHwGFtnUqi7eooKckveRl8NcUpAflelBTpJI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=4U+9sL4Dw0QT+WVGcsSpTior0qqpxL7hJ5Bm8VOijUNCn31NOKnb5dj1iysepsvh8
	 9rkrA3aYD98SPsxxD4C2BNTd16wtnzUwUmBpsVAawepRsg3YQp5UmSzX0Y5QVVedI8
	 4qH9xKNFLYp1GYjoBqXwUahrRxzdKwCXeX+WZ0CeMFbh7l7LmTQbzLDwxGmegnCp/a
	 l+M6g2fMUBd+mfgyAYCaeX6lI4cpBjJLec5clVXR4hlGUU5OSIo9NRyEuc6wD0UDER
	 BqdPchxCc9ejlResLYpsdSaP8Ew3GGfGhvwo358vB6zxRcXODQq1OoJ3cpzsQE9y/q
	 1MHAp8GKaRcUw==
Date: Thu, 16 Oct 2025 09:02:41 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call October 15th, 2025
Message-ID: <ncex2besafg4cuc6qefzlpxk7ov5imuravohjtt5pgocpjznq5@3sl73sazwvum>
References: <4xae4zcuqnb6mo5zgxdtsiqcdi4mrky5uydqc2mhzuvu37z7iw@d7grlbp4fdut>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4xae4zcuqnb6mo5zgxdtsiqcdi4mrky5uydqc2mhzuvu37z7iw@d7grlbp4fdut>

Minutes can be found here:

	https://github.com/coconut-svsm/governance/pull/78

Have fun!

	Joerg
