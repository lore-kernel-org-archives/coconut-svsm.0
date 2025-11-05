Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239942EB5CD;
	Wed,  5 Nov 2025 22:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762380146; cv=none; b=LYZ5/6zcs6PK5qjtBA6xoLVaTkZPWrnuw0LtsuxjZCd5Ox5iFrGPoZvfwkBZ199I+/ffUXwDBp9H1lrlmhpLtx7U3mJIMgyMQ/2mMHYuEiobKNRKiVj2gmE8tcrsA65+yNSjFTu+AaCF+TmaevpIxj3JjVl0Mj1si4ATqh2jgBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762380146; c=relaxed/simple;
	bh=1q2D/+aQX51qeG+pkHGFDOVvbLXeuPg8qL5mKfE07ZU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn/ctQG/hKz2/IMHKV7hPZI44iYhy/X976j9AMzscYOzRK43hT8GC90lwB+n4tbdEb0t8Hr/XO9Nc9+HU8IQ6oWmUUyi2agcjGLXSeGruWl1YXCXDbARUh6KGm1r0eiiWe9I4niBGXnP218k/ly+ZR6tRPRg1vqUX+01mP+cZ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=UBsiv3XD; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="UBsiv3XD"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 11A90565EA;
	Wed,  5 Nov 2025 23:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1762380136;
	bh=1q2D/+aQX51qeG+pkHGFDOVvbLXeuPg8qL5mKfE07ZU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=UBsiv3XD+xFXD3FJ0bG4vNHFPGOhzi601Bdw3o9myN9l2bVCuf9vcZaEFpzTaBPrN
	 vOd/YYBmlKoBxTeYFScErluYZcARmWQ9+Yt9Qxv+EAvAAnQLJ1TLEghF72VX7MkTgv
	 J008e40jILUChPRT690PKUwM0XeyJx7M+5c/+alUgTXVsfImY0grpRgOJXyXpkiOVp
	 73WU2AYv5SXNd4vlrJhYnN5822ZUr2arnVdALJfYoslYm7p1FB0JTQW81Gnop7QZRZ
	 r0O/GbByf7LsF13Hm4XhpizoTxJgNCToW/R18e41lV4c0GtSSF4S64nA0pbGvd7eDb
	 Yp3TpVJWXMoZQ==
Date: Wed, 5 Nov 2025 23:02:14 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call November 5th, 2025
Message-ID: <4dgzfckji6upg2jdnosej5zq32oyymzlnksryxwnprrwduw235@rodrlpmxwkbe>
References: <xkishn3nobuvvcwl6zm76y6wnk42lhayaesjuytpk335gf4r7i@4lcpktemow7o>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xkishn3nobuvvcwl6zm76y6wnk42lhayaesjuytpk335gf4r7i@4lcpktemow7o>

Meeting minutes are now posted:

	https://github.com/coconut-svsm/governance/pull/82

Regards,

	Joerg
