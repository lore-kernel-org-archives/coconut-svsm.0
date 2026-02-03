Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FFE311977;
	Tue,  3 Feb 2026 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138401; cv=none; b=BtNDARkzTSTXSOgHxwGaj6sxJhDKj8hV9p6rly4exmv456H9lHknnbLT+7ThWFz+yXGWjOztO55HbIrx9vD5kp9STrx4W277x5aJOv2SydCMqCP/sMBbiWJ8ERtLQHCfkcAa7gA7Iwy24Qnm/3XzpLaCOlurEIo9fj7tHrhGSO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138401; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mba9snRWJWS1idelknuddL0JcZR8f6mw1aYXTmKwZZz6gTSbjMce49sef7smxv9/DjlqQIcFLkVBhxPpkF/V2JQcuSqPslf/rj4wJZa/KjzH4yK1zNRvph43vfOmNAlNK5shgrG5JYv62HHvykh3Q4wLUNB9/w+hoW2KyuYlxAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=TX7mhkOh; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="TX7mhkOh"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9F28F1C1138;
	Tue,  3 Feb 2026 18:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1770138398;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=TX7mhkOhdgmNoEfkpyCwueZD4SIiAUxqq+QGWCYJoxwDOXEne6W3/WwKDUOuSQeWR
	 mCTAlYFeb+sjU4I17LHXvfHXhQz1wZe/cjD9Aok/Mrv/ce3XppPQ3X8osmW3MvzprE
	 C6pJ0syFP0+N1fiIM7yoAMf/4RuEazgxkTbfD6s0IBKwCipAdtzGwY2xZpmS7MeKQQ
	 xKFsldGGgCQ/2Wo0m4RPI74WjFEypcaHFmI+dKgvwrN5YvOMqsd8oVoyGpElsk1yRx
	 iE6w7/5EF7fWavNlnFqn6VX8M86ZTHOqTiW1cJIG/KILmhcFM6EHo+BShroPlsoA+a
	 lAH8W0cqUUhsQ==
Date: Tue, 3 Feb 2026 18:06:37 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call February 4, 2026
Message-ID: <lcirfa4dfkyv2522vuwr4dth2lbzi2sunhcubojuarg6v2myfx@bf33fftemnmj>
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
