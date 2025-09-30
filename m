Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A3B20C038;
	Tue, 30 Sep 2025 18:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759256400; cv=none; b=iKFaZFlHs3rS8wQ2h6WZBjvz8P6VHQu1P9ZGFMWQffXABk2a1Gpcvob6MjbQwy3lx6zxej4csK9o4mypg1hzSp9/HJlzhmhd32JObY56C27hSvlgOLutbWueP+fa8F4Ces2JctNc6MZrQHqmAScz/8IHIlKUDyrEuD/eRiWZG2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759256400; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=maJLQ9Ld1qH476GA6Sh0sXYMO3ewuA+dl/7SfzfUwhYUHUJqgPjXLQFIm52MUIjsN4e5eWbme1LgjFBYPbRtmYSwF5XCde9R0emfzHzhmsAZWMRB1jdkKEnyap91DPTA/oFGmhkJPOIQqMnwxsV6N4XZiwMCUjLTSfdHU4fElI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=TB2yFXhp; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="TB2yFXhp"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B4F1656C2D;
	Tue, 30 Sep 2025 20:12:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1759255948;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=TB2yFXhpkbDzuAafn3bdBLCCXjmxbVub+ZyYJjRlfOnJeh4vd/gZy6RLohFOz8Sik
	 Ccm0KZKmG0QXQXZLb13kioDKDmJ0unCCQF7ec6qRCwiNh0z6eCf3vnRoPPAX7D3eQX
	 2FmNNLab5VQrtVcqU6DooLH6wnDeofpHTxpcHOBa0o78ALnv/NZXmeLUuIqkAuYc5M
	 Ut7vLPOYT21Q/2cfu7vJNTapZPlTOJYhF74RLCjSRiQhqSpPqDsEJlGLetoXyr+azx
	 /6Fbo76OFPP4Y+IKKDXR4xV40IZ25pY2x+uykQu/SbRrCRd2/cPtXPtj7ScYSqkW8j
	 sdJBpfayLQHbg==
Date: Tue, 30 Sep 2025 20:12:27 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call October 1st, 2025
Message-ID: <gix4cnzw7ws6ajzd723k5u5y4fexqnwyuhmp2a7ccgejeru62o@y3lyqiq7ayog>
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
