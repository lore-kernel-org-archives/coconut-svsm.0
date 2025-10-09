Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E222E336F;
	Thu,  9 Oct 2025 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007455; cv=none; b=FxaPHpqThsQ0QgOsRdIW8PZ55JFvDfNFUdnDX2YNxesXvUXObaXp7/2AWMu/2/YgDB+Hz41DYzWQ/cUo0Lsy/W+HDEHc7j0u7w/H/1FJqvtNP1pex68PoDbt95nO0EiyV6smEu7kN9khk0cM5BsX9FPCjuaZwN83cpwrFDx6xOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007455; c=relaxed/simple;
	bh=Cv+Yuej9WYVRWSWd56khx2+Q3UPYjhZmO0Xml1QMvT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0tvmC9igbkkE1W5GuuXqUsGcLrN9hkClu/6ggIgn2G6+HsAyvRG62/MkTiCrKfFkL/enIE4D4HysxHlvUZxFkZs5jmBTxs0ow1NGAyhodH0FTkMlYnlJreXrMY/d9jhn6/aCGOnpLKjRuYvX7jBqYjwlWrGjaXZjQUQLZtFUtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=8Nw43lYb; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="8Nw43lYb"
Received: from 8bytes.org (unknown [149.199.80.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4984557B25;
	Thu,  9 Oct 2025 12:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1760007446;
	bh=Cv+Yuej9WYVRWSWd56khx2+Q3UPYjhZmO0Xml1QMvT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=8Nw43lYbkz/e07Vj3a0aiW7RqZu1+UL9y1cEkTNdIpPdgeZjr5cZJFvlfDl9UvewL
	 VdNgSwG24f35gSiVVzMiwkwXyDIx0gkmES32gma18vwlRe2mLcTprQo8f8abjvyfzn
	 ugXz4tad1qCxvXDfyxTz2NjS3a2gErva4vhYlW8jVajAGPmjGTITfwD2T8yfGaVJGR
	 aZhEO9THOZw8TRLyxGW2CU/HewEQhhriewzFU9aStZVvWdBsPejiMMFQWj6n4CBSzv
	 NqowWz335dZwpokvapg1/UHHHbu3MhYKkF7smjsnl0GJhuk0VTjhu4ORzDpzElTdAs
	 +WRBfWLWVzGPA==
Date: Thu, 9 Oct 2025 12:57:24 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call October 8th, 2025
Message-ID: <56vpzcbglzutxkzdrkpxas6v4ukhpht75tgc7yykm2qdur62i6@isq3qsmvrmjk>
References: <CAGxU2F5MbxjrrT9O3R4hvD=6w6rsYS7DhZ6F9u7HTVSsfc2tkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F5MbxjrrT9O3R4hvD=6w6rsYS7DhZ6F9u7HTVSsfc2tkA@mail.gmail.com>

Meeting minutes PR is now ready:

	https://github.com/coconut-svsm/governance/pull/77

Please review as I was not in the meeting this time :)

Regards,

	Joerg
