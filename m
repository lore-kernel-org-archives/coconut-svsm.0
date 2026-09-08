Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97195540B1;
	Tue,  8 Sep 2026 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883641; cv=none; b=KhqvhN74FSCv4PPX8lLJdnNmqxEToYc3M9ScJ4C5BNksyPZ8EelVVt0TK0GhiVuctjia9VIvpJmv10WfjrM4xcJkvR5GJUM2QFcbfm3LyoAQnsRt4ll8AJRW7sZqGKBXnkecbdstyXHouwIiWKXvYhyI6faZdLh9cLRwy9bhbsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883641; c=relaxed/simple;
	bh=pD7k5u9T/hNx1WLndKd4M2X2PDJtAiCFk+c+YNYRh9s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=helWXop54//RO8aSHmdhb4p+Pijl2Q7L1fj1WXbksGPWKe+U5fEmpGScugo345svNOShwkq/qEJ/X7iYpWV4VIUfO8Ni+VcziXBis6Vw7MKjGgDoCCdxxzZMsyudulpEOA7e9U4oHdF33BhahN1gfN5SuLl7koGr7LaghTC265o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af085a00d84fb33a51badfd9.dip0.t-ipconnect.de [IPv6:2003:f6:af08:5a00:d84f:b33a:51ba:dfd9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 83C6320A15D;
	Tue,  8 Sep 2026 18:07:11 +0200 (CEST)
Date: Tue, 8 Sep 2026 18:07:10 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call September 9th, 2026
Message-ID: <aqAyOssrT_fjLZaO@8bytes.org>
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

Two topics are on the list for tomorrow:

	- SVSM BoF at LPC?
	- OpenSSL for libtpm and cocoon-fs

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
