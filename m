Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CD92BEC20;
	Tue, 28 Oct 2025 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761638121; cv=none; b=QfEaU2pWPvAzaxXZpsyEZOhJ64f+sZxgeGyel8Oj7NIJtYYL+P/KPCWZWP6RGImoDbrWn5ihxf9OxnC1qFpPWkhjH4qUmeAB352FygtWco5lgeOTiJP5XQAJBvx23cCRoeNrKQjh6Cy40Tvi5oDQSdgIHTYDXkt+eZoll8FBZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761638121; c=relaxed/simple;
	bh=rEfTmhdo1YInrtGuK/qeymzGJNgUEYCIWIjZLQ4koWA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8yty1nWKFCIaybb98u0IraM+OdJEBSTU2/DO/ba5jmlyf9VfZzbqabdACYVr9Sjf0GDDtNMhAQq3j6sOuSEJlCA8VzDHu37ot1rwLYS+9JaQ/mIiUK3NA7C/s7I34ynmJLDaDccTWdfAoUNt+U1epE9ec043t0W2U+/JXYVkSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=c3QM8mSZ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="c3QM8mSZ"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3827E59B9E;
	Tue, 28 Oct 2025 08:55:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1761638117;
	bh=rEfTmhdo1YInrtGuK/qeymzGJNgUEYCIWIjZLQ4koWA=;
	h=Date:From:To:Subject:From;
	b=c3QM8mSZgDpftg0YwaJwYRFr+dq8/VWfW0tmTv8b09YeGEbgjZ4vvT1NBPSZoUvTs
	 DFET0B1llXHfv/J+uSuOkkfEv5Cnf7UNI2bIX2lXHuz/jFJqYWB93MIvFhjaLS2va0
	 e9l0/aHr+3rdmIRybkkGrX3Dk3sa05yoyKIXpt1LbKw65FBh4E1Pgm+AYiCoFDfHm2
	 6SWR2xyEDOxX7v4Iu/w5gTvnrA1IrBn7JWQY1vGQkgWCRd2K9CtYuNHEy3ZwInB95p
	 /npjEmj+1E9ILDgY3znfFra4zZ4WGG1qz942cIwlUy0Am3fOM1gKElvA6Lh7nWwaCL
	 w7Bxd2X4vc+/Q==
Date: Tue, 28 Oct 2025 08:55:16 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Development Release v2025.10-devel
Message-ID: <oeowmogxww47eoa6x6uxdjgqeqndkh2plsgtgo6jovptfjc7br@ueqpwevwgmfg>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am pleased to announce that the October 2025 development release of the
COCONUT-SVSM is out. The most prominent changes since September are
improvements in kernel stack usage and support for MMIO on non-confidential
platforms.

There is also one known regression: The formal verification is not working in
this release, issue is created.

Have fun!

Regards,

	Joerg
