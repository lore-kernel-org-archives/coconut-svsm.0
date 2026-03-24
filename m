Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360F8396D30;
	Tue, 24 Mar 2026 19:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774379667; cv=none; b=Q+i/6yfgNkMZYSNcBxU1ny37vsfhAU22k8L8Iw0CMuW2GenZtd545IFmkyWRa3BitReeDUzdd/gEEPCDAm5H7pc57k9hz7WXcLcsEJTxeFuutcAlttMDNXGAtaxROYIoVGe8Fp+vyiC/2abHYPH1PXrcxrEE0bNq/fHZQ8kWk/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774379667; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZzDMU9KF1piyfR3fSkHmtKCKlEcPJfvHOAs3O4LL5odFnkKaDTa5TaRp/TvBLFzXZU3eERihgNsk6QWJnyFAsF+bG0yD3WQxH4KUSxjw2163+pxZ1TYX3A0vSQO9Jn79WGEtzoIrEaisEuzGSd+eGk/BjIVZLrdRz0rsKaTRErc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=HvAYLpvo; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="HvAYLpvo"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 112E01A625F;
	Tue, 24 Mar 2026 20:14:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1774379659;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=HvAYLpvo0usn6FaFzoPcjp6i0cEEidn0EKgidw0pfgQn4s4hAOG/abvaz4RcxX/fn
	 ebKRw5tONTlo3CO5xayv3SDujLzppsnoN6z6+RvH18Gd6R7+5jovmt1fXwTzagNrKl
	 oWYqJyf3zANigaxehgsGkEJO+CI1/Bcf6irg6GHqMMHvhbr4oF8Jb1YwsVf1chR9aB
	 EJJQmudIsSWqJMnUeAN/jh6GRapO6yelz/OyT8CpzCMsjqXCZ+ZcpGwGorQSE7clkh
	 Or/wZAiUfTUpoz2o3iS357SFvH3BLKH9QPBnNUICnBSsL7IY5nprD0lyWbtN+4MzL2
	 g1nl+Fj8I1QDQ==
Date: Tue, 24 Mar 2026 20:14:17 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call March 25, 2026
Message-ID: <iuafzrd25l3whbifc3m7tcxf2bq3hqe4bymuwrqhtpmcujipfc@2qxd6c547gz2>
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
