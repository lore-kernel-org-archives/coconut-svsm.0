Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4E438398B;
	Tue, 12 May 2026 16:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603385; cv=none; b=EE417mxZZw75LGjxOD3QcctvxuJkT3erd+nBphwfGcuC86NAPb5sPc+EdQEU6ZldL+cupzXi4Rd/ldxH0Un4wVxTctBv5hHCHBJcAomvjDuRtL8GOx5Sb1TRwNlCtiRAt+yVIndd1XyNUeW6MJDuEC5FKFeDuqY37cpLt1dR4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603385; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wg4CLj7GzVEcgjPhw7lIBkbcnSBaraJLRIE8sHw811ub86HWexTt2yP4k9eceVV4qmIg0LpvlMePD9zWkGqpc18wv0zAYMX7VjLe1wJkGJqjpr0kL33UMEGHh0uUMX8r/sOguyvRnq74dF5TTkeLmvbCnv/x1OP4AJvP9uAM3OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=r9MsYz36; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="r9MsYz36"
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 48EDB1C48D1;
	Tue, 12 May 2026 18:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1778603382;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=r9MsYz367oj5spwMPqY2TQdS3o14ZHxMFeXzhALKXhUhX/x+VJWavTyNjSQkNrRLb
	 bcBaahqxQBqoUsZ1RT6rib2SOu8YNseT9sUWbFNHo/Zxwh044fZSVSX/p0AAvbFwDR
	 3WQ+sysoXU0mLp6R/dNkNbEyVgE5nCq5aUQPw4fQaRFzbl0ITaMwoGx8JztLDBIn2S
	 O9EcAz4UCo9n0Bn3Q5ImL+QQCqxzlqKEYSQvWd2f1QffPCcz889WLXgCST9tc6bEul
	 BgPNunCX1kWDpNAGaPHV2e+T4CMwVIZjcoBuOWpFf3k7DMnGo01N2zo5HJ/ZE0kDgy
	 S0kTkrBlw7pBA==
Date: Tue, 12 May 2026 18:29:41 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call May 13th, 2026
Message-ID: <6vr7ihpntcdikktgtlbudfblvahawkwwqtuv4pmr74j6mtp4yg@loyxw56it4jy>
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
