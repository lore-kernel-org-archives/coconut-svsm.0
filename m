Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378CF2FDC55;
	Tue, 12 Aug 2025 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755020249; cv=none; b=dQXx1acQogwJ6L8H+w764U4dERztavmVQ0uMQWi+Hjz7Zf1pXMdWc0tVaj8/T8U3go2uSROYyGn0ktqeJoYgecc9jOQ+RWIDcgI2wDGd9CvOdGIspc/IJT5rHv9ZllnbDnWbgCTH46EFqoXO3xT4hZ1yKQLB6jCSZJYLEz9eQVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755020249; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nHI92OKeFfUPVNDEnI2GKIki1aDbYit9FTrQKi6EvUbGn0pHAGqlo5SXiw0Z3l5YLcG7RgQ6rKl4nNDskvAbk4QyLnoexnpY36tI0mjtanbm0VCKfa9AcjeTI2MArYB74j7thIpDFaKexDhlUIBshhfgdOO5GWR7LFBF62bAz5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=CuE9OTc9; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="CuE9OTc9"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AEB50529A5;
	Tue, 12 Aug 2025 19:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1755020245;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=CuE9OTc9OSudnZaYU7N7Lvh286TODm0H1rxV3N1lMEqughP2Sp/k4K8DFxfE4npPZ
	 lOtsgd3VZHu16vqVVGyEeiwJxn/f9hX2vZW8zwSJgLVPpEFT6lk2AOsewuezXs9yRx
	 f6nyqIu/inM9W05MsyQN2EiPjSaloDxsUEa9nqJmuDBZWlBs3jhQrA76aXcW5Fe+nS
	 TsHsPCCAl9+B1jDIktgAz8xahGKkF8Toe+nI7wd5XY7VkeIYciwJ9k5Q3Zd8zvxq4z
	 yyM8CS9EdZh2qQfpG2swE3uiUEuSjthN8dya+HhcnRWYwDeFgXqDP9sKBkPg5kUEbj
	 nxcXyLv1t5Vbw==
Date: Tue, 12 Aug 2025 19:37:24 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call August 13th, 2025
Message-ID: <tcn7lbkdldezuzuhsvmodkunsze6kwefbsibc3r5acktj4ssgz@akyknynywlqd>
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
