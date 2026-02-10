Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5499E158538;
	Tue, 10 Feb 2026 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738986; cv=none; b=dTAenhEKa+FOGSSoqJYXrVfdoN6FIMhXCAgU4uvB8Oy02/kb5bmNt/5kBr9E5sJJINmqbBBMuxrRZ8DMSBqqXa1b5u8Ak+TWtNsVHXYZZQMopOn43+mpuwZTkAlCuVQLiVXfpiOB9lA0ZscqiLYk+fo3wbFeMDsVDA6/cFbuksw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738986; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c+aTVFdPQWNfxzSjuGjV4C5By1o2x4d/NyhoGQei3bav3xj5KlneZ03BH+6G54afiwGj6Mtl//rbYm5RIWvPaAxJ/twh6lcYHU5uA9bzcRmOrSC4UDJqpwOMjfVnMEmXgCr699UfZ9R16qM1MSo7NOT2pjf2eyRNO9G5n+0HLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=5SN1x++5; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="5SN1x++5"
Received: from 8bytes.org (p200300f6af1d9600bab986b75373e6db.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:bab9:86b7:5373:e6db])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DDD645FCF5;
	Tue, 10 Feb 2026 16:56:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1770738983;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=5SN1x++52weYoG9Lh0kYuZng2BJ1OabhzPHpZc6DZ5glnd4N+SX+Z8Suw4beKpNWC
	 89U4ZsDyoBjHiCd0kW0cUmB5B26fQ8ut9O7NwfY4koZmQyN7m3zAD0Vzhr3vdrR7Nx
	 msrJOYliksHN+d+IUI7p9z0oKDhIHoJ9TU/gljpM0DnPXX0z2tQOLzMiKy5YxAcMwm
	 T6Pch9qmW22g57bxgEQf4N4/lPz8lkwGH1wLqwlrIKeEO4H3SXRUjVv9U0V5+5FOzP
	 cm5zAFX5VE5hACRVEg4FU39nvKfw3xub+Xrg3YPAWEbMzP3poXuzI0q4/P+48NhJgR
	 ie5SsohsxqzWQ==
Date: Tue, 10 Feb 2026 16:56:22 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call February 11, 2026
Message-ID: <r2qpr5a3uouckc6rzldudljmbwntv2q77mwsiv3hqlwgrj33tp@k43izbdzpjrn>
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
