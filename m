Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222582C21DD;
	Thu, 30 Oct 2025 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813005; cv=none; b=jUlLaY1tXFWf0T9oTwZ35E6idneev6TTvW8xlWA0vnHDp7bGCgLzHGuMwdbOQvzR+O7dcWfagOm1owLxuHosRG0UTylWf+3UoqruDce06ht8LfHSu+YyryfjrdQanp1ENLGx1a7Ek4U2HK2YPuF4y+Kf4MDABXiCKApbyqW1ovw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813005; c=relaxed/simple;
	bh=KzqkRP9TJwf5hyYt7ca5HSSfIxhrNDSEXvgDC4USU0I=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJZcN0PTpKSkuYGQpIIppynQoAXor026zga9stTueGJrlfG5T43MZqD2h09KJWTlFXicETzmTjzyM2aO64WXgulXFPDmjd7UEEnlTgkyR5+kGuAvwEC2qHId52RqfpyKBhzHuGVWatpX+ROmgCwcbI82RM2/SxezhNmBQqzqhH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=1Dp/HdAL; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="1Dp/HdAL"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D44E159FB1;
	Thu, 30 Oct 2025 09:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1761812995;
	bh=KzqkRP9TJwf5hyYt7ca5HSSfIxhrNDSEXvgDC4USU0I=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=1Dp/HdALWPcN6//ElDGSgERr0VG0lvWQC0xmtM/dHsgPTtmmZgsSHdSreUs8Ygj46
	 YxXl0Hy45Zw/7DQKjkbuBRHy2+4oSiWJmYLGd0qwWad6bmqq8uXeNV7DyuUDY26Hw2
	 v7ppRmyg8U5921bX3oJ0rKYnuHfh+BoK/jkQgb6mS88KM/LktSEZXliDAkSp0h8otC
	 +ClEKUXio5/pqowPf7YP6ZpEXhDFDW+qCKqJM6jkE8CnK8O6ANxTWt1A74FP1MncQB
	 o2S3FriWdbNqd+HGjJXc6mSQ2s4XmVPl3M/FHi2NGLSfn6SPnmST5GfREm9zv6GLGq
	 AON0stbgGl2Ew==
Date: Thu, 30 Oct 2025 09:29:54 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call October 29th, 2025
Message-ID: <u7ilxru4afxhtwtjtokpiyyelke4f3n7tzwajpkq6uwo5dgh4x@74d3z7ol2xf5>
References: <sleat6kdqvomm6mu6jxactmod6r56apnv45wgnkzjfr555ydvd@ezj4ihcmwtpj>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sleat6kdqvomm6mu6jxactmod6r56apnv45wgnkzjfr555ydvd@ezj4ihcmwtpj>

Meeting minutes are now ready for review:

	https://github.com/coconut-svsm/governance/pull/81

Regards,

	Joerg
