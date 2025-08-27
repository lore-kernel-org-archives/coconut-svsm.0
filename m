Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F5FC133;
	Wed, 27 Aug 2025 06:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756277510; cv=none; b=uBRyoQjPYw2kshUwwCLZO8lYbRwqB1d3SviLAsS2S+83jPjSKnKJlb1Xb0nXvf3cXjkNGyt9vFM+DY/Zq824XGDGaI347jxRi9pOVk8m87pMqGoaEFvPRAOxk3+2QCPVG4Zkw1X8LGdebW/veV6v4S+rrsnULsDZdF39D+h3C/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756277510; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kN4YKwUpzMLuUwAeuXz07iiLOgUZtUlBZBp+nsQmtwfyIw02Pf4ItQO22KpKXcGCI6Q5O9Ojp9ONAYG+xMe6MaPlyIpjgEgflrPKTTqmFJjL5mzRz3Hn3dVk8oeFyTH3Xrejokeae8+8lIunMnNLNAkE5Qe9bJjGq1vhzYrd2BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=lZJUT9iK; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="lZJUT9iK"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AACFF5376F;
	Wed, 27 Aug 2025 08:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1756277500;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=lZJUT9iK/7VJOd6Z7JmglZSNn0ImewOtMmK1oVZ36NcQRftv4xIExrUqJxweTKhYu
	 AdERbr3cTub5hBK/RSB4PxCE1Z+d45kwp0O9CpYU1ooapZxPA/+e83A1a3zCpBZjPR
	 ODL7GAN5T9Z0q/DOpfvm5nqV7N6ZTbiFfT6fDxiuqmHMn4XvuU0ChuinmxX4PqFhbB
	 cM7YNr9XyUFv/cpP1J+ZVYLx4lX6jcsqiPkXHWmkHOgDymY7o7xD1uik65Pu24N1Iq
	 vCsK/TeKEfE0XxbM+psmjMWq+P6jscPDQwxNuZhBajLqEzfgyJgz4SUSrdUbAYt+E/
	 vZVk68nfu10tQ==
Date: Wed, 27 Aug 2025 08:51:39 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call August 27th, 2025
Message-ID: <aq6ugh7c7nuqefyfxzr6aa7rdctpgoszbnrgcbd6q5w2a2zvd6@ufp2xxxu4ibi>
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
