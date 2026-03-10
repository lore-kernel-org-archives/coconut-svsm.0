Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0193F33B974;
	Tue, 10 Mar 2026 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773162615; cv=none; b=O2KyWwOBWFr27zlvUrJNwnFwKrTWagFg2pPQSelOs9Gy2DSTy3daha0xNMz7Sbx1V8eH9S1yLHgnzgoOr+TbkTpCplz7fPyxJM/3cDRPuVIG2n0Fo7rYOnOl0dQRG0o3OdMUM1GXlxDdREiYg1d5rZb6KukA2f4ief41M2+IvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773162615; c=relaxed/simple;
	bh=r7lCt6kJbI/2c4eHVow8TmaKDrAdUOvtgdZVXMj8U2Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oSgyVGq+AHVoi64Xevw2bB3Hyd5xM3PNusKtyILIVX4gPoO4JeHC+k81GCHLRB4C80qSLr7Tq+qZOWDyf3GvPtOuUEvuhIvrsXQV4nY4OnFBxomFVoo2RCWToAzPC2b3KZc4w85XMjiuMry8l4LyQt6c6lwBe439Kaf4lzxWMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=p7oephA/; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="p7oephA/"
Received: from 8bytes.org (p200300f6af1d9600b43a1b46c831cc21.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:b43a:1b46:c831:cc21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9AB7B1A4BBE;
	Tue, 10 Mar 2026 18:10:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1773162607;
	bh=r7lCt6kJbI/2c4eHVow8TmaKDrAdUOvtgdZVXMj8U2Q=;
	h=Date:From:To:Subject:From;
	b=p7oephA/CdC/gQxQt8tVOXvpRa01X3NAjjd968ignuv9jSqoabA1aHo9/v+eDmVsc
	 7/+Q/ZXObbfy6gw/hdSWy76Tl7BlUTOZ3lZKlDLM+4Vyx3FnjU1WsRL6fAKiU50xBk
	 SgP918uxTbHpz63pb1YRvJcu9FDbK+XWuac8DrhRQ1fCnxgDwxlCjNT4t4zaX37ywZ
	 SMUJQ3IfIdXJAgZRBBiuhX3Oa0f6HYCb6G46CABOOJzqpCaOE7MavuofbCNR/D8+Nd
	 KHf9vjrZBKxlfsK/O3hIgGEbv5noMOHZEO43hpIP+BQUPmz5FLGoDEl1gJ43ocJn6S
	 e1bwOiz0/hvCw==
Date: Tue, 10 Mar 2026 18:10:06 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call March 11, 2026
Message-ID: <ete4u42tzmawocptkhibgkv6tgg7rlqcpncdutnk36qtpdejcz@cxhur5ib7dzz>
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

There is one item on the agenda so far:

	- IGVM-Measure discussion

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
