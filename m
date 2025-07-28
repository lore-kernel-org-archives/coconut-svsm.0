Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1CE25CC4B;
	Mon, 28 Jul 2025 13:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753709951; cv=none; b=HnU1AWjo5eGLW0shZLh1uecFlDuyweM20CPXZ9vNPW4cipOpD7TRPWr4oUVgWyNKIwBwJlibBCm/2tFTmOvVksvfnNlpTinTftYINjpGXHra25kUdX3CDfME1ISJIWM5kC39L3YKFCLNKKCMZQbiGP7pTvS1GUykug8b4hGimxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753709951; c=relaxed/simple;
	bh=ZDf+sbdyxLY+ma68XE6aNV76xy8MFZHGj5ectqR15Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gy2ldosfruwDnzUdqL8/BOOP+ucgT5nRZqwUFb7xTk3X39mbG/XN/tFwKw5FG6QHChdMNMzu1cJ0csL+iW5uhqF9oWu/5GrBGrvUzJ3VX+FdxohhtS9slTgcs3NHJCp1uYZOcVf2Dda0uY2WzDqsCKGZ/u9lOZwM2VlKNoKSlaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=KRxa6R0s; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="KRxa6R0s"
Received: from 8bytes.org (p4ffe1b02.dip0.t-ipconnect.de [79.254.27.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D14AA51A1A;
	Mon, 28 Jul 2025 15:31:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1753709519;
	bh=ZDf+sbdyxLY+ma68XE6aNV76xy8MFZHGj5ectqR15Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRxa6R0s53i77/oNr7KmM96cZK4N2LzgoVt6yr8EkqTNpPXgL0tPMm8tgHVGfsUIQ
	 G/gcE9O97BpTkuAoHH9QIqLCZT9aZXxo8i97HoOATIfksleD2HmhU3SRxIxuwz8ko4
	 9PmggsWEgvSJvarOU5a2flMOjVXohoDvJnBVVw2Ngd8wKhdcQDrLLVq0gF/Lapm4rq
	 ++X2cwIc3xnNCfiYMHuU/oyWXXcmFa3GJKg9X8HO/ISbeHea4kW5Ayz6pkqaldNShN
	 gtJba+tAi2tZWY06afc0hCgZU5y0BGb9zfZeA1MllVefklAQi2okfHLtkAt5N6CaMm
	 sQc1POiUZ4Syg==
Date: Mon, 28 Jul 2025 15:31:58 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev, 
	Nicolai Stange <nstange@suse.de>
Subject: Re: SVSM Development Call July 23rd, 2025
Message-ID: <7mgnjtxyq5nzhnh75gvkje2wjnyt4t6ke2f4byomkozm647nij@fbmbxpn46qsh>
References: <CAGxU2F4ZVcj6VoXDnjo6ik4Oy=OY1T9Cnw1WYB5oZvzObfEuMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F4ZVcj6VoXDnjo6ik4Oy=OY1T9Cnw1WYB5oZvzObfEuMg@mail.gmail.com>

Meeting minutes are now ready:

	https://github.com/coconut-svsm/governance/pull/68

Regards,

	Joerg
