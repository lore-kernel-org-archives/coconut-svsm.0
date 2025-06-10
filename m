Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A2B2494C0;
	Tue, 10 Jun 2025 18:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581508; cv=none; b=HXDK5fP/HcYAwMwlLO9oSktjKhswDdFc1eH79LVszzdLRSDuYC4FcHRvx1AmibE1MY8hMmrm/BZQ1IYdzEWhQscn5YYgwjo8jmwQVTiigmyQKomWFqYi/FxRjIiP6OzrACQCvIKQljYMCSPxZzevz4/K2ZdXjnQ7pZboH1EOHfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581508; c=relaxed/simple;
	bh=dtgh8dObgs2E/Inw/TX1mhNnKcpBR+lRJ6/GfbTas/0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7jSPYRWlnwILDs9IEdYpiD30/UGzCRzoL6sXKE2Tb9mg8jxQMsaiSaXYVEZwSdgZyN+hu0ULiX8UB9tUzHOEw6DVR9KCLZ/lvVGgOSvdRtj5ZuBnY/Oql8QoTiwERpsG465G+6vGDKqayPtoFYX+AhynQh/9g7UsCXCjfc1kgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=yEF4Yqpu; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="yEF4Yqpu"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 35F744B87E;
	Tue, 10 Jun 2025 20:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1749581499;
	bh=dtgh8dObgs2E/Inw/TX1mhNnKcpBR+lRJ6/GfbTas/0=;
	h=Date:From:To:Subject:From;
	b=yEF4YqpuoT/BHrGuMydEToY112oJX3+YjFRZmMCJrKTry2ZHaHZpBA+ALIOLoF9zi
	 SmGPNhw3MaVGmf0qQPfliiPrFFLXQMnhF1txaL94hMjjD+uPPwRhm2G01yHesnl0NJ
	 RPNpuOyzQeb06CVbL54nO2Hl7HahM2rsG8oGciAC2pYkn9jcbIRIdJSEExaIwG49CN
	 oJvWfbvwonwZcabZujDH2ap5hEEYsLZ27YwHaNsn9LrSpjMa2rroEaxZQ+xCS32vVp
	 nD4lwH1T2k9Hcf+QzaWwXoxPmtC08Bs6VoaLiG2W4MIkNjBA/NizHwfDDHiBZ+JuMn
	 EllHlH1VLg12g==
Date: Tue, 10 Jun 2025 20:51:38 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call June 11th, 2025
Message-ID: <uz7wk5f6c5uoamhlydd2uqc62eazpyn4zaxmsohd7pugydrvvu@uwuoa5c7yley>
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

From the TSC meeting today two topics emerged:

	* Ways to generic crypto-lib support.
	* Requirements for logging infrastructure.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
