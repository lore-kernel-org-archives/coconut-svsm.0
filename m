Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8B12C11C4;
	Wed, 20 Aug 2025 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755672861; cv=none; b=bt7vsfIQ+aQRf5ruV0IHn9FWYi/1VCFVWvs0Xjvgrzc1HBoCaunSsjUPoruDqi6LsTmxYX3C+41V9cM5ifODZRQLyGrEQb3Uz973LTkx1tcjVVnZSnGtj0nLjfRVkOQubXkn9sCfAMet0Xaky23mFYJ7+JNRkZfDfBSNu1NxDqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755672861; c=relaxed/simple;
	bh=UZDa2AXElLVSMF5YofmIC8U2mRcqGxQYLjTjJ6VrMT0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lebhEKaZaN7XDaE2v2m6Vu3w0wKoRa/cN9VJ87zlZMfp+hwE5/sw5vJ4AUQfpH5slxm7aIjWIsYWa0I0fg5ysl9ZgbKaN1K25TqWscmZVEk9RYHNI9I4DCrpP3nW2+wVWQqtsKRiGjnXqgIISMjoPS618bGvrI4WI+l/mV4qM54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=EYeE2yH9; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="EYeE2yH9"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DAC9947C55;
	Wed, 20 Aug 2025 08:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1755672851;
	bh=UZDa2AXElLVSMF5YofmIC8U2mRcqGxQYLjTjJ6VrMT0=;
	h=Date:From:To:Subject:From;
	b=EYeE2yH9ZsEprkvWiZzwE9MumwrnIQQ394bPgrngHsq9qCALu0RQKyk8bdzSoVPO3
	 uBZKav0i9cKy2Q+nPZ8p1jco54lR9A272HGigWgOrLH0Dq0tKWMSc5pbQ+/Q5a1DKX
	 LI7zOV4laEH7HVz3W8gwZZ2QwZcHCH2g4YGfFO7wRI/AALA3rjWZ4hWJOktL801lXw
	 8sAbLjzFMY2ZVaYcBfPYpPdqB5gdSlpfuiMqze3hnr6JdLe9p33wj6PVKaxRp5S83t
	 UO8QFLziF0tZJbx+CChPLe2m4S2KAgjOyzHObezXGLJmgoLhHz1ooCYPdWYGDcuWOS
	 EXB+ZQSxcfsoQ==
Date: Wed, 20 Aug 2025 08:54:10 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call August 20th, 2025
Message-ID: <jgt3qc2rgjz6e5l5g3taplmvmdrqyr7bwcspbxgwreugj46wqr@p5lizfcaslrp>
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

Current agenda items:

	* Update from Tuesdays TSC call.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
