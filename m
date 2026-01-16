Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EF53081B8;
	Fri, 16 Jan 2026 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552867; cv=none; b=hOt440/Slg3qTsEssahu+AREixO3/25cwlNnXszX6jgavWjRH60EIsaE8JBaj9DMnoCOlZtP0d5nxjL128PoadJqOu5EoDG4hmSKbBDyHtA25Px+YDCYLJOzwYS5qBI+kkmdyGgqA8A82HXDBuAb/WGxJxSJNgcP1Ba+o6FAX14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552867; c=relaxed/simple;
	bh=nWZTkBYM68SOgGcEca11stuolnqhyvj9tLGwOcCHfJI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7mD3ULeZ/9HJ1z6LLd66Z0ogAHRLa7IZOdVQopvyt2ZYBVFqEgysRBM+pXn7HPIK+YjoGQiMPbsF5OuFDLRHxA0nfABg+ekcdHm+7KVnDduEFx5Le4sg54Pj0PmqGjM4wnvxMz+nsCj4roXOwtHef7i4HyXJ3LrmXWqkvU5mHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=tZTgnAWh; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="tZTgnAWh"
Received: from 8bytes.org (p200300f6af1d96002b8cfb52e3e08e58.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:2b8c:fb52:e3e0:8e58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4ABCA5F9A0;
	Fri, 16 Jan 2026 09:40:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768552858;
	bh=nWZTkBYM68SOgGcEca11stuolnqhyvj9tLGwOcCHfJI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=tZTgnAWhkWqzbtycRRJCWWqROe8KMUA0knc3cTsOy5D/XxgiLqtUXEIHLGxAMWojH
	 Cc0hW8g5MCBkBp+JvvdCK8MroizAEjon0Cky69zKLTxZ11gAq1SxQVXFpUdNpqUE/j
	 NC2yILRNvIFAAIxIR1EP7RU1+dnziC8qiz2ggts7Q+2CiIuYnJQyrHBFNLIqJCYNF9
	 bz7ThVnuLWmmbJsuegMLQtiA3U2CYMYD+0dG4Y1cQDRvo3Oh67SDDLOWN6Ka8yBez1
	 9ttLQ3UmmuN3X4lxEFylZPOEfRs9+q2Texe0HL+NvtK8rSIlREyZmoD9iU9G8MTDeP
	 jvZQP/qp1E32A==
Date: Fri, 16 Jan 2026 09:40:57 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call January 14, 2026
Message-ID: <gu2ryt77xjubhnaubqzmrzt2gsfvff5knjmxixkkcgmh6psktd@p44h3njnnwhs>
References: <tlhepq4dp47rbq3vpzm4qtf65t62fqe26tk736sd3ulcbwcefy@btzt3fsapu5e>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tlhepq4dp47rbq3vpzm4qtf65t62fqe26tk736sd3ulcbwcefy@btzt3fsapu5e>

Meeting minutes are here:

	https://github.com/coconut-svsm/governance/pull/92

Have fun!

-Joerg
