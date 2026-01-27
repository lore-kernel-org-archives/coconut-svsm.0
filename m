Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3909725785D;
	Tue, 27 Jan 2026 17:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533576; cv=none; b=cxk3dOBYuG+imepK3ur/VQB1yv1+2k0CY+jYEYwtK9dZU+DHpRFNPAuEJWvk3V3Ye/G3FLW6AqkamucNsY7wh6i53jzeYO8n87Eq7miyX1KZhrtZRDWz1MAPrfu0DVgPvlnnblQbkl/3otsDBz6IXSxc8jaYrwK9Zz7jXHkBeys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533576; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QINx7dIFBtiivalnOILhDYeX7dn6ySTCLVeAcNcLqdMZULrE9ljzfwq3IYk7FuWO7ppDLBbz+RaBp49vztiHZEh+wK0ocj5kQFr230RZN4CqWpHdhcHzfzTkFNeYN5ltgReF0xrYsHxcQTF2hCSDJTDf6iFSmRBCGsvqMM5XmGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=tS9bSkue; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="tS9bSkue"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E71241C07F8;
	Tue, 27 Jan 2026 18:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769533566;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=tS9bSkueiiwb2RHG+oaMruE2PRuAVm/5e/bsxwFbmahl57Ig7Y3gQ7k89EL9H7b3P
	 k3irhuYDB+N6hJMZQlFNWN2/r9y/FRM0pPi9CbpgVKHY14jhSHdmuESNCq0x/tJH+t
	 Tb5HVSFz3a0DeAIH2m4rZXbngL0EFAvKKCHFy4GdHBbiXwLzdMm1B4pRfipmNfBQg5
	 LzBLuHQq1QRoBY4yNmUXy946jrDnZK8h+SeKD5Qt2Y7h4LJAC9urGp6OykdrK9hAJR
	 f9nBBsplmN6uOOU6jIwNY9fwsittlKsYjtl56hSxbG2rytjYxN9B8pnfrHQC1OVRKH
	 X2KAMf0Sr4lIA==
Date: Tue, 27 Jan 2026 18:06:05 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call January 28, 2026
Message-ID: <ihxnjxdpnguz4ajm44jgkldpg4oddyd6drrtqloawbuyo5ee65@c5dvv3s2g5fi>
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

Here is the call for agenda items for this weeks SVSM development call.  Please
send any agenda items you have in mind as a reply to this email or raise them
in the meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
