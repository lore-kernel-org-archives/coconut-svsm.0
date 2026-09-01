Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7423FF1AC;
	Tue,  1 Sep 2026 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274217; cv=none; b=GnqUac00f12r2/4JXdhwv/NQFGXG3m3+UpSRgGNssBa86K6inLpB2DFF1/EH8KgWAZifRScdHVDlGOshbxa6QaDMqvBz2LeWe7PFZXawcndSPMomGZ2xy1f5tZsZy7dM7ArIGH3tGspW11UM7f8+X6QN+2h18eEGzqHslz9bvdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274217; c=relaxed/simple;
	bh=a22LkJoTQoVTZI1KHi+Eg6/wxYDqDZUakotFrcm9dbM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K41yk2gbFiivuAxz0X39XUcpeK3RWK35Va/7MPquSU7OOpw0Jt11WBfrOazG2e4D5pajy8Zx+zQ44LMKxMCNkYFVqr2qJ9/UgZft9bg2CSIeQQhJcyE6o5pv4+/tlJmxufCVsU3R6yT9nlDPKjOdgYBCgh5mrDPJQilxTzvV3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc500f900711659a2d641.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:f900:7116:59a2:d641])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 428C920944D;
	Tue,  1 Sep 2026 16:50:14 +0200 (CEST)
Date: Tue, 1 Sep 2026 16:50:13 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call September 2nd, 2026
Message-ID: <apblv5ak3DL1szvR@8bytes.org>
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

Stefano will thankfully run the meeting as I will be out tomorrow.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
