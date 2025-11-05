Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6952DBF4B;
	Wed,  5 Nov 2025 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332340; cv=none; b=jOTVaq55+hsNWRmIebHYiSKGwy6rmQoKhA8Wk9V01nS3xs1ySZVKpAb93lfKO8vTBbZH01PzTrPZRp+0RA5uZB+V450tBIhI7sC6ApGTBO20CP/oJ2RfnRM39bPB6dQXilSra7sTmm80YVctxp7g0hhn4L/drsEF1c3Ata7L6xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332340; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CIiy3MWGFcFIHsyWlTLptNNVFDmVhY4QQdw2njM04PGwY6jIppCCs2Gey2LFQbDecywk3nN74SrCbl6HHD7IbsleFAyXGDfAQwzdYaCT7V10pnnvsEJEdnJoUbcdpCrXKMU9h0bwtgk8RnVmhlvWeouzQSKMBrD7FtgktCn9f58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=6S0aI/eq; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="6S0aI/eq"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 06AE45A90D;
	Wed,  5 Nov 2025 09:45:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1762332337;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=6S0aI/eqM2k+LCyUMXwQJSW2fejHtiJLqBT164OL+86HqFsVa2Z5RTj4Oh145FUQi
	 xk/bsQBOLulea8f5Xx4cJT0/zBLyAeXU6Cmrf3liL0VVQKQwYBetIft7ByAvc8IgDS
	 Ghc+aD6bdKJtAjzWNKHEMXs9mAS0bkl6l97K5W73R4ooxkDFYc0E73h663662UQA+4
	 nEPLcETs3VNyeYszOF/gkJRP/gv9aS6BdNKKe2dX1YOcsr1oji9i6vVCynNx8DWdss
	 zHi2mKC92KIyuWfihdcGf9KBnMhdH0+O09czj6QCTTMDb3jHQifTPovO83WUTRCh+g
	 juX25CeJN+rRw==
Date: Wed, 5 Nov 2025 09:45:35 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call November 5th, 2025
Message-ID: <xkishn3nobuvvcwl6zm76y6wnk42lhayaesjuytpk335gf4r7i@4lcpktemow7o>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Here is the usual call for agenda items for the this weeks SVSM
development call.  Please send me any agenda items you have in mind or
raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
