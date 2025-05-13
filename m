Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D62171CD;
	Tue, 13 May 2025 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153100; cv=none; b=pGYMLtztfulfk8+VyePcG9M5pebCcImU7S4H6liuUIXy+rsqv8TTOEO9bLmooV1IQhqtRRSQdKpGFOV+gfKvmnUEKcMwdfCkMzrYJ0fvJcfI62YsBTQc9YrtrvAGMqbBxPepOXyKcMWyF3vHqVK+28ubx8kMusdteLzqHcZvHqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153100; c=relaxed/simple;
	bh=1u1ux4UFOPwrnrAokejVf0jTQVojZY5CVW37K0ypD+8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YWQEFA8yl792/+oIc3vMw56ctpshKis+66eLk6/I28HYWVwu/edkQb/2pjIL9JVEUn/kaD5kOaEUAzckW76vwjeHvdRoZeKJ2zC8KKXdALEQz56wiXZQp/9QOBaC+Oz7ew6uuMIWzxt+EXc+jhmd+1YLfK61UI/Lu3kzadTCqjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=GyiVQ7SW; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="GyiVQ7SW"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 810FF49E6B;
	Tue, 13 May 2025 18:18:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1747153096;
	bh=1u1ux4UFOPwrnrAokejVf0jTQVojZY5CVW37K0ypD+8=;
	h=Date:From:To:Subject:From;
	b=GyiVQ7SWDehKLr5bF+3ccLi8B24rfoSMd2fq9w0GX8hItq60myLAr11orfxs1hasj
	 j0JppMJ+rSFby/iyzlI6HDykgPZ1/XrQSe1pky00Ynu9naUR13245TkMpuZiuE/T8A
	 SpUDNUFuFMyQfvXrYkjFVmXmtuinc4wA6kd9IgGg23cexAbUKP9GpDt0Bvzn0YNrDl
	 ennQYCPuziBLK/LTn7+AmVjBZf25r6yn1KpMCNBowWcroTtpt18CM/GHpzTEtT648p
	 5vCJEmsiV+fxcZBZPTWvHY9U+xWjBjh8aIsQCsdx2YSbwR8DkEqsJuybJZgS/jUsgJ
	 UV1XvY2sfslcQ==
Date: Tue, 13 May 2025 18:18:15 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev,
	linux-coco@lists.linux.dev
Subject: SVSM Development Call May 14th, 2025
Message-ID: <aCNwxxKAXHYEgZQH@8bytes.org>
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

There is at least one important highlight to cover this week:

	* Introduction of the COCONUT-SVSM Technical Steering Committee

We will use the LF Zoom instance again, not GMeet as before. Details of
the meeting  can be found in our governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
