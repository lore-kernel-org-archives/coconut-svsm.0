Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDDC3E3D92;
	Wed,  8 Jul 2026 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541433; cv=none; b=n7X5dlTNrghJKNSLs7AqwiDYos57vl35sZ+1+fEmDqpClwWYcNfOvyhabvIVgdQ3AR1FMHOUmvcgW1WZ2HLyEizmgjd4/z7Eae/nvjehMFUY9KB0N1R+j9XZMybm08/W5BJcrVNKTteKWYwsWVlAf7TsEjJOFZYgxbSGZ/mCTX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541433; c=relaxed/simple;
	bh=LPMYAm1UrTklfE/pHLOiblbXg5DiX144xZ42Shp+zyE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpEOh2Rn4fCNR0mWYKEgpQyT/j4KZTMEbs0HXjbvrG8+kIL8FbUb+C934VQ91RrGNyh7e/6x9hBCOtWp04U9Hlys285sPN0LvzT+YczHqZD/7U57slXqdlDeUiFLRP4xBSYqLXqruoKE4l9qMb8lrp468rUGv9SuVuNuq87ECcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc5007a3799ce1eb75691.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:7a37:99ce:1eb7:5691])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 55AB920339F;
	Wed,  8 Jul 2026 22:10:22 +0200 (CEST)
Date: Wed, 8 Jul 2026 22:10:20 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call July 8th, 2026
Message-ID: <ak6uZ5Uy1QYFSFPL@8bytes.org>
References: <ak0nGPsnLf6Rn4Kx@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak0nGPsnLf6Rn4Kx@8bytes.org>

Meeting Minutes for the calls on July 1st and 8th are now posted:

	https://github.com/coconut-svsm/governance/pull/115

Have fun!

-Joerg
