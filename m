Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2442D74420;
	Wed, 24 Sep 2025 06:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758696315; cv=none; b=cbC2u5KeA9MTFq+B9KvnVFezDUU4kndIiwOAHncJDdJXmxybVNBCJL4b/V9/9Aa25dNotgfRWl+Z8T7XYWVHH7spxJy8x3R4YrLaEhpFdP4hHvgWDW8Xtp4VT1olx963of9NDEwEVQbHjE5Svxq0k2wJn64kXuzimIk/rxcrGAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758696315; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kqhMI9nY4MTTF5CUuATkWVGA48zU/J2xcMgMM8UQ4W+F9S6YE3mKAZ2W2c1ccwP9N65qpMGNn3Q6WLI1pWPrZrtSZxLVCQSd0qus4d0nJfJnFiZoo3rQJZlsL181zlob3kso2jdNO1bkUGbAfwebCG6viVWl4sVARPBceaTdado=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=K+8kNXyf; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="K+8kNXyf"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 99D5556090;
	Wed, 24 Sep 2025 08:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1758696305;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=K+8kNXyftP3tZGfLUPXHCWQpSQzt/66CDuHdSiD1zrxXpPIS3S5OJzb1JASQYGIuh
	 qj+Dzk+YLyUtGegmgRrEXb3+OOWvo0dp2BDirnH4F/dEyTpQQsMgntYKz5D9Qc6c7T
	 uKlopWiDnRAhDJbmcKjuiOWdVPNN7/u3CQdOxhE1FmtC+WP3hcG4PR6GeXalz/vk8j
	 L+5FMohwNuPLvOGd9RER4o/vaUHCOx/JFBNrV1AX7jAnrnORjK/7fNLqeEk/Ai67HE
	 X4cMniqKMkV6HAhthcivtAMes7NzdZRxN5zFaQcQaLg2kfIl0cPH3cO3ZkJX+v3Xx1
	 vjBAo1UPvF6zQ==
Date: Wed, 24 Sep 2025 08:45:03 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call September 24th, 2025
Message-ID: <gw3hzruia4uucn2a3dw2d5djhdv5jqrbwzifil76xd5vwajqon@pyy4tjowb5d3>
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
