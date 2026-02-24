Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BEE304BB4;
	Tue, 24 Feb 2026 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771966929; cv=none; b=NVAt8EzP+dqYIFrfbnbON6rq9+4Qan9Z5JMAMbIhhnxpt25rqhFomoi1DSooRrblZEx8FihdYsRgcDhsnrs0QtL1WRjkLvoFIuUdhy2wl9BoOsGKwiJaLH2C8wwRLz4qooOdwaDzyvG/jW2cJJJM9xKUSh+ZLtahsKImzcVVf1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771966929; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YFi6I4VXFAf7Wd5AcGg5Lvlt/WoaNYYyWOYaus6T2Gt+8ouCIpIh8ygbXv1VkLkH6fDbsmaomXEIQpLgVMrwhQ2uWrCBzVxGNlP6VWmQGIB3KOHOgZwMNa+pid/CCfiMQyamVZMigRhq801GBFs/sAHMGKdXEFPB3MW5N1SA7Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=beOfqzPi; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="beOfqzPi"
Received: from 8bytes.org (p200300f6af1d96004e79ebcb96c9e72f.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:4e79:ebcb:96c9:e72f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 811321C1626;
	Tue, 24 Feb 2026 22:02:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1771966921;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=beOfqzPiQ5Tf3ssl1oCnhlo9ek977BX4bTttaozcUiIuTGfC2eYOuCaAljy9s6NGJ
	 JKypLe9znwzGFYqsLBo8aZmbFYPDIzummZZ0YAQ+YUX7xiwI2qL7iWHsBjH1ZRfc85
	 bo1Z34DLmQwcKKzaOQ/UrSABpuX/NSnDslAPxwIap2c/XbXHZWBjymAXKXHCZIL0pk
	 DSM/DRZ/pQH9a+1+h1NkDUfagD6DJk6WE05Xx9eN2ylvXR/1WLbn3eideMIVdnA/2l
	 NvBOoKo58wBuYu4qC+9TACp8qRHjjPbg/bmRrWrmUGDGkDUqcs4FVjIjq/6A3Hn2vg
	 zbNRACnv+h1dQ==
Date: Tue, 24 Feb 2026 22:02:00 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call February 25, 2026
Message-ID: <hul66wdlddkhriko6gb7po5nstadfjvou7lbzsfbvlyrpl4ybw@gkpc22ppgsxo>
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
