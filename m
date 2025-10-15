Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF87310654;
	Wed, 15 Oct 2025 06:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760509413; cv=none; b=r35LiBSRRc6XcML/kavSqIAbbnCNkHNpA8RY0xsFcbEL2y8/9t2wAEfda9BILi3V0x1i55mdGGuJ8MA1Q2yMXrmPh22vFKEzrjg6O58cs8VPWEZb0gDrI5D8NhmwdsE4M24OOtLk5xMVBCk0KMArLEa4wlF0NzzRGeB2vDGKJPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760509413; c=relaxed/simple;
	bh=vWzW6GTjRvUYay+aaOENBl72+2a++uxvU5eGQ1QuCQY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ureTqLYqnK0u/BqcxYeWVaesauIpaXFh5WtPr9402D+nxt0QXS0+zmbH7PZEzVmflfC6jnTQvXcgFi7o6xdhHu2Tkrr/Z8nl65NWSzYER4dim9lFOQhz9uFYUb+pxBzdPxgIDMEXvEeUdt5gj1MP5BuyGnPrFM+luE9X0KR9nrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=cI1FcUDn; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="cI1FcUDn"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 2FFE45849A;
	Wed, 15 Oct 2025 08:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1760509400;
	bh=vWzW6GTjRvUYay+aaOENBl72+2a++uxvU5eGQ1QuCQY=;
	h=Date:From:To:Subject:From;
	b=cI1FcUDnZax7jGQOPKwNAW7lNZuXXHo5F8LTiXgCSLM3Y18XhKsP1rG+I8TXmNKyh
	 HCs+OoEUYa6aTUK+uCvspehLKjkV1GJGqVwG67zpqif/V8lDQAWm9LdONbR/DZkf91
	 1sUqd3pFBR7hJHIKQVJ4XZfbCFzituF/VkQk177Bq7X7eqlU4fAxhUCRxa3P4QdTGI
	 2NV+VCRLjji904YRp2sv+DSR0IEgGz1gbcBcb6AQ58fT78tt654t2IYVvyP/14Vdtu
	 lBDIZ6NtWdUJTM8IFEFwcF2yDCkl095Bex8VKUcKS/jf9QsQ/3s7zzwXQDNopIDao8
	 2Em8vsoCZuqdg==
Date: Wed, 15 Oct 2025 08:23:20 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call October 15th, 2025
Message-ID: <4xae4zcuqnb6mo5zgxdtsiqcdi4mrky5uydqc2mhzuvu37z7iw@d7grlbp4fdut>
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

Currently on the agenda:

	* TSC meeting update.
	* Discussion on handling of AI generated code.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
