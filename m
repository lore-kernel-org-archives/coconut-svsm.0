Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67F414F98;
	Thu, 19 Jun 2025 06:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316045; cv=none; b=Elu344wHR1/FbPpmxeu8mURRuWsu7Xs/iq15KU3qWbuxKP55cfRVgtPjK921dsVqzOM2AiL/Ufb2+kcVOJYNzKhUxoS880+0gUf8PSSbKLYgk1hOsqb5G132hkZe2TfAwejm/PZVmNxwPGG09qO+tAap4m4+63+wI4y4+9IxKZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316045; c=relaxed/simple;
	bh=2Hb03TE5ai682t7LBkGfvjxDXkkR+lcIRb9FWoAMGX8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UupSfooT/VOnfsuwcc+gVw0HGWpPYFldMGPhKLWpWf8qA7baxjQ8kDs6duH52AMa5CfdccVeM5dI2ycsPXS976kdAsz6RNbKEccVMmQBEnS7qSdk1UjgL/w4tHcCbzD9xnT3lWuJQGG1rbgzTNENA92qSImvBUS8BVzYmvc44Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=ySfrYVap; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="ySfrYVap"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 529544C711;
	Thu, 19 Jun 2025 08:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1750316036;
	bh=2Hb03TE5ai682t7LBkGfvjxDXkkR+lcIRb9FWoAMGX8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ySfrYVapQ1Nk4ktLYwGRc/u2AlIU/FpLU0OJYSVeA54KcP4MTtcurzqUV6Zy9mg0X
	 k3cN/I10ctL2FD/Q5rK+kkeSuwRLUrC/jLsvBEmr6p2wgFTmKvKwKeoRQJ7kZaUo7v
	 St//l+qWvrVyKDyDrWuGMi5H+H/8mQ7YPOZoQYRJ7jVyHZ42du9sUSj0ltVdcXcvi3
	 GC7D9jfSq4k+ch4RyVwy1coMtnqk/+uNDSieG1Gda19ltV8ZKNlHpPsh7wkiuY0tRT
	 tus7QCg+ylJxcOqxJktd4O+o1NbX6tEPrMRmF29wNGKlaiyL7tP29fqJ0y03pSKquw
	 NMWaxb8uPniNw==
Date: Thu, 19 Jun 2025 08:53:55 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call June 18th, 2025
Message-ID: <j465dsh36gcgzxc5njrfvoffkolxzdkvyq32csx3ziardetzlk@n4kqqwuynnjp>
References: <koizxbgvbx7eyxacd5snfcwcuzbzhgnu4q3fet6rhds75xemvh@qres6fu4qmxg>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <koizxbgvbx7eyxacd5snfcwcuzbzhgnu4q3fet6rhds75xemvh@qres6fu4qmxg>

Meeting minutes are now available:

	https://github.com/coconut-svsm/governance/pull/63

Regards,

	Joerg
