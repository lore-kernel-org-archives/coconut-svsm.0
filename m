Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978573164CB;
	Thu, 18 Dec 2025 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057899; cv=none; b=C7bFxcYCZRSTc7h5c25Bp5+poDKJw14TkWMRXSwCghVUvy24gyXYOwqQbHHUt/RPve5NS2MPNOQ7xmuPo7Vp85zKZAqRLxwcJWPaE9LNBs0621NiBJjyUfV30qWS6Z7R6Mr+L2dk9aQ+GpK/e5C5pbbRLvRTGWeTQE6BE4MOLE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057899; c=relaxed/simple;
	bh=luwn4moNd6ENX9vqfSQCdBoItqwXBfCbOeXhRLyHfVM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WNKeA3+b4U4gfSHavimDi9iuyo8GX8QqllbYbFuRuBJKTkySAbEnvPLEJGX5eIx+93UnfJxN7rw2tBQAAs6EaZ1zbVUeQz6xTkdNzmw/CwVufPadqr2RWYE0iBI0UVOCQpCQDcNgHdk5YlcrXHKopu5XLgp+7iYApLz1h1FwgcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Bs9iTYqq; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Bs9iTYqq"
Received: from 8bytes.org (p4ffe00f4.dip0.t-ipconnect.de [79.254.0.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id F2E215C364;
	Thu, 18 Dec 2025 12:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1766057895;
	bh=luwn4moNd6ENX9vqfSQCdBoItqwXBfCbOeXhRLyHfVM=;
	h=Date:From:To:Subject:From;
	b=Bs9iTYqq+vXPPrHxR+n/Jj3ytsBxWsN0EKkmNm6AXusCFDaJdrPSZRgFWR2bexQAN
	 R8VP3qfnF6okAteljkaEgCQ3LGXFokDPVniJ1MrrHOqN1EON9G7pfGatAB5Y82DBTi
	 eIp0CX3Std6xpS4N6RF0TcI4jKGbUpdobqgRjfYNOe/P1gjYau9l9w2ePeRl7D9VY3
	 K8qy4tPcARZxzO3/phPrRPZEsuJdeUjiSUf7LmQCUQJKtYDTpI8fTRcBe82av5ZUEy
	 wdOoO6YGTIkw6iOCIB5Y3CQXMnl1sbaluGOYeiVDWi7140sSo0Mx4VlBb+8cw3v3rt
	 xnGbcPmRf7Kpw==
Date: Thu, 18 Dec 2025 12:38:13 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Development Release v2025.12-devel
Message-ID: <ct4vbdsqu4kdbp5p4p4ssd4opwa7yc3j2mi36mogzuwhw5stne@udgg2tvlwpks>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The last development release of COCONUT-SVSM for this year has been tagged. Due
to the upcoming holidays in the western parts of the world this release
happened a few weeks earlier than ususal and turned out to be smaller as well.

This time it features 47 non-merge commits since the November release, the
changes include (but are not limited to):

	* Fixed formal verification. This has been broken for the last two
	  releases, so I am excited to report that it works again.

	* Rust safety improvements

	* Initial steps towards a UEFI variable store service with merging the
	  SVSM protocol number definition.

	* Fixed the idle-halt loop. It had a bug that could have caused COCONUT
	  to go into halt while another task is runnable.

	* Improvements in x86 platform support.

With verification working again this is a pretty solid release which received a
good amount of testing as well.

A big "Thank You!" goes to the COCONUT-SVSM community for another year of solid
progress on the project due to all the hard work being done. I'd also like to
thank the Technical Steering Committee for all their help and dedication in
managing the project with PR reviews and setting the technical direction.

I wish everyone a restful time with their loved ones, see you all again next
year!

Regards,

	Joerg
