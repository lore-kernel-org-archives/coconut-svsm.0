Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E843E8C49;
	Tue, 17 Mar 2026 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767173; cv=none; b=frH9CIUPsiMgOK+XQ5WIBBXWMX4UU9+Ext22Wzk38cxmJMKOlRjMA0Dz84dPoHpum8VK50UPODkD6PDn7m8GQ+ZAjemsRiGFVAwBXh6454rYRHFAtPea4mBdxLXRgzU1/0CXh/HYLkJYVZW5NLjsy38C8rvmJ1hYVhdWtU3i6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767173; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JH0xAl4tpcC7PXuH4zS/XIpjt23b4zprHGppdRM5h5YPQcdBQAkgMYQIJ5sTxIswMRO5+bhsSbXQC+f6CrPzSAKbty/bYD/WrRE6CE5TqEGbNyr8qeQceFlcmwuwF9818rqaXJbRPUJUq18PIcX6dqE2WRDF73epEp3L794Uvzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=LwpCyzJT; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="LwpCyzJT"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 421041A58A1;
	Tue, 17 Mar 2026 18:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1773767166;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=LwpCyzJThCleDXfw8vtlodRNyNK+14ujLq+mgt7O9HT61PJc5Ix63zLWTrZPgVJVO
	 lJDPbpaLxThuouEOEfAJY7ig0aMv6kQ+6zpXddOYVCJqxzoGVNfsTPLTOnfKGmduB9
	 W8v9kkMXxCt1kozWWhjFAXKZbR/Uwi0fIslYEFqD1XW+u1rwbWgCUUDqOn5PMW07nI
	 iLuDZcwII4GRRwc45bCTGzJEjubcif1gBLlE8x3VNF9FMnctkmeHyWMILTPZDK0U5X
	 pK8hifCt2MYpxxEvQsI8oyZsx4XBjm5+r/r8p6FmL4tu6TgHrJ8dIFQPY/dpPY4HRr
	 FpksCXnpjIfYg==
Date: Tue, 17 Mar 2026 18:06:05 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call March 18, 2026
Message-ID: <jf4dqgnyttqibmmjzi42q77z3frcd2oomrfyjfahiglp5vo5vn@uxhtposjrxox>
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
