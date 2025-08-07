Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66749226CEB;
	Thu,  7 Aug 2025 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552397; cv=none; b=sErLTcQbtbHcSopwifi5QeJcv+BZvnFznSCJO/9D+Nxx/6wxCnIbtl8hGRuz8CilAdD5njsmYeZQfv6LZqzMA2OCq9Eu9nBepBIjvPbHLmMnGAkIDq/WLOqkC9D0weOsxlZjYWzUPQtomoJUIhaiPDxVrUEj2mishZhIQqQsuN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552397; c=relaxed/simple;
	bh=lMjdTYniWCCt9JvemQbXDrLBUSUlQ3UammwOVTc2aoA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb+XZC5wriA0fBYKIFy5OmRy22mA5rupROTFPPna6BLboY75IdqDU56uBqaMSA6b7TJs6jja4zHXaNQ2Glbdp78x4EvBDr9hoYeYTYEtYskuNds63xufdzApTWJmQCGz+WE0rC94O3fHAiMz3HwWbAANtHF2M0qCwzynW9I+/vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=xrqzx+8g; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="xrqzx+8g"
Received: from 8bytes.org (p4ffe1b02.dip0.t-ipconnect.de [79.254.27.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3950B51EA8;
	Thu,  7 Aug 2025 09:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1754552388;
	bh=lMjdTYniWCCt9JvemQbXDrLBUSUlQ3UammwOVTc2aoA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=xrqzx+8gNyj7PxLCyxa4wrBcXNAz+Ssme0/Ju+EGIm/8cguIHGaKK5B3G1piUOErn
	 /U2MJaTOwY8qiYHakA64OQrJ4I2ndB8ivfelHOdUzNlPdgJfSHo6cwxqmzZ7w4kUCh
	 AL3J7tSU61rnVLvVTFm54KOiuFXm8Fyrg9v7fEDoemw/WQzot+DGRf8VwZdte6J2UJ
	 03wZQwM6U2FdGxbYENUv1VLiohvOaCkE5KPSI1efRe5Myqd9t6sHn73T14dfeAf6Vi
	 gkshVhTXUQYglfxICeoWoDGFDVJ1pq0iyq7+ZOFbXY1GAp1AVVGgO6LPtUc/acycve
	 6J9sTXhfctxJQ==
Date: Thu, 7 Aug 2025 09:39:47 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call August 6th, 2025
Message-ID: <akfut2zmjsp3wnbmj64ycginzjd2uecugds46u5eazmtvee47h@dfko7zk5groi>
References: <ulsznoch6efwoe2kxdbfbzl7pblfwo7ux36b43goz3irucrpgx@wn55u5s6bfsb>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ulsznoch6efwoe2kxdbfbzl7pblfwo7ux36b43goz3irucrpgx@wn55u5s6bfsb>

Meeting minutes are now ready for review:

	https://github.com/coconut-svsm/governance/pull/70

Cheers,

	Joerg
