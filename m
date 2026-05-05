Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4772947DFA9;
	Tue,  5 May 2026 16:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997246; cv=none; b=HPdf8UFEC0w28rAo18xfj4CzS2LqIq09Wt7X/i2udbn2bzUz2Dolt9vkYApHlt7ilUwXmq6DsJI8QBbh7RXM2KGxSWAoyUVlMU4j+ScXmBDOYxuJoPQrvf35OSgtryc/QQXtoQjoNjEFB6yx1a2Q4MxRCr2+nSuN6M3DuTrIeu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997246; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oFSmSV/liRdQR9Aqxrn4h19Y/q2W2fl68Gwyy5iEUa2qnH8ZlrX6fU0YmKM2Ct34vIiUJg0kpkuy9HupgApIo2kx046A1pM1Ug+9v+OenQ/8OZ/jP0aQrKcPnpRVirVARyjOjm4psrC+sjQnVhDqTlHFy69tpxsxnw1QIVdg0wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=p5pr78WK; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="p5pr78WK"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1A9A51C3731;
	Tue,  5 May 2026 18:07:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1777997238;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=p5pr78WKkhCfEfM8HX4FRXRGzbOcfhsl1HURUdw9oqsTl3jhZFHJCKx01BIcVhUAq
	 dKuoxzC/ampOS7YYr4K1vECWll7lP54gzvXn3TUF8LUP9ZMXJ3QDvWia/8n/Zeom42
	 NZ+q/S0ujzpUqYmrqY8UJG37MEmmY07mASMedRqsX4MKvw+Fp7VIwp2yl7GZx1VrtE
	 z1gKbt8xTlxzUTdtOsCXc5i12blcKCG3mKL1EcyyLckA0lKgQlGTz1Hve9rKGsDVc8
	 NdArWTLyriKqo/ifivDpKqynRubsTr/ecMWEZF0P5+dYcl8FfWo6v3xabinEhtIBaf
	 KUrr+5fMB4TtA==
Date: Tue, 5 May 2026 18:07:16 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call May 6th, 2026
Message-ID: <45x7yirnjkd374loz5ymizxdyccuytg7rr46jvgh33gl7c2xwo@vps5xitk2umx>
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
