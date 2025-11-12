Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B81B1D618C;
	Wed, 12 Nov 2025 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762927654; cv=none; b=f8wb5IHngk5LLgVZXsSUcWpP5tMNAjK5AEXn7MjDv/IeCu4GkDrWj1EsWBmWHn2RPRX1N5DOf9BrsCfWgFv5uZmY8GJS08bQpbBD0nSg72vGcTtGyYY6tApdIkYvTzUcsiGnC3QyKNHlExG0fETGjoKpBmLKYHK2+D4WOGz4sDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762927654; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SC3sVOEgYZuyYBksKHjfrJCEAf6jO7vxMfivFaXc3zl8D9919TU3h1O3mdOuCOghrmkhY/xLtWs1bu5HeH1kO+hOpj+oq8o4Po3V4NLceiqqjV+NpzuMKyeoFKx5vV6EYrJOWI1QLcIp5nqENqt4irHdBlqfpFT9nswtUM5lYPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=sl1XI09A; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="sl1XI09A"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9F5D55B078;
	Wed, 12 Nov 2025 07:07:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1762927645;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=sl1XI09AUuLQeaYfCv7oJ+i7uA8s4t4/+M8UL8JLt9EsCNroFpJpuiM9LW5ynuROg
	 y6K6Yc5igCG+Wg3oL7Klf5ToZJ7JXOGHBR/SSXMsv3Bdq8ojVOy5o0x2vtUR94Gpnw
	 XH/e3dShOQC37zBGhud0yjMeeI1Lnfg0gwKmUyBmRoYZENnfj/es7SvmpUuYB3Hp8j
	 jnpAc47V3IdzFs8FW8gEJUH/hioLdpEcbIST/5xsyob3y6dBZ4HGP3THG1VY44mt/j
	 xlHasSOh1WjiS7AAY2llZof9eHqMkYs1IS0PiSMBeuRcWSnVA18kwaetozheI3PNwg
	 3yFQ9HLJHHujQ==
Date: Wed, 12 Nov 2025 07:07:24 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call November 12th, 2025
Message-ID: <s5lzpd7oaqibweihjmqidr6etqmw36avgvvz22htqly5jbqiqh@vqzp54r5cxao>
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
