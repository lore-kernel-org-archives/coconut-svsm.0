Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2B045BD4E;
	Tue, 28 Apr 2026 16:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392680; cv=none; b=e5gsdnpVRW17yBM+gM57HFTt/GdN3V70goFlsWkRPm2R+TOtJSNWbLG6ogRWts8V/YDqezneOgQuiawtWPA/z5SHjOYqcgFodqV0+8hG0VRSpN2dyYDaSB8WeOu6z7iX6io7ocbytPTP9uzI2pu7fJwZzmI+y9U9QlI0Da4BTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392680; c=relaxed/simple;
	bh=aKsL5LDMRGJDnxY0bZ1Iy458t0bBgVo+i2j0ob53Nro=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J0DA446+DXzZf2+Fy56+BqVngMEPLp5agv7BvscKUE+JoyIKLE1oUPozz63hoVkSLbTEdMmvahfAeD5OO0/q/oEQctnpo1j7jorhj5WyO0fekGOd0ltuLnVpdhwK64297cCw9ljur0t4CeGYZcLBOPWNtyAj8JwzFNzChsiz7ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=KHLq+spb; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="KHLq+spb"
Received: from 8bytes.org (p200300f6af1d9600de1adc504dc18013.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:de1a:dc50:4dc1:8013])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 29B9C200E53;
	Tue, 28 Apr 2026 18:11:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1777392672;
	bh=aKsL5LDMRGJDnxY0bZ1Iy458t0bBgVo+i2j0ob53Nro=;
	h=Date:From:To:Subject:From;
	b=KHLq+spbk5mNDOD6xw+ph3DsJsUbX2CIL6IKaKrkrz3nBsYdRfDVvAb7vHIWZJDVM
	 neVM4goQAtp/rhx/T4hBaD8geaD++zVbQnaFpV1ijXlM3QnIk47a9tWxK/4zIG7Xqt
	 pGi4coXHJ17mK2Af1NghkSQFhJ19cWuO7kjJoInHg7pXrl44fYojcQwAK09qp0RqpG
	 CwOSURtc6mn4xwd2mjiVGD/RkjIVAVoR7fcSRnsG5fe0UqjlBBOvAvR9mhGBk76kvY
	 GMFou8j4qUSaYhDVtNZtUzN7RKvekVTtUQQcq5aWgcsQRGEl/sWfcXCGB9rLncDEUo
	 xp2Zl3I8LCTLg==
Date: Tue, 28 Apr 2026 18:11:11 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call April 29, 2026
Message-ID: <j3qgor73sx536uzabgyrfadoj7xznc4ir2pj6tbyimn7aqpiki@m5hzafmcng7m>
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

Currently on the agenda:

	- Usual TSC meeting update
	- Review of slides for CCC project status update

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
