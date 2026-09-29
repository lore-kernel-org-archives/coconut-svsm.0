Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE244F3901;
	Tue, 29 Sep 2026 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698496; cv=none; b=J1dMs+DCPsjn1H2PpcKGk3KgXvyWEJ5ydOIpOM64NbkulYvu3dHF+6az9Rvkdw0ED4UE8of7wg5SHA20vtxXRU1rRDjRqthMyydgdeA/cIqVnCVL7ekiw9Wx4zVKe+VgkYqrwnmm5ixDhp5mrwCuuvkdfRzyf50U4LDiGjrAqdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698496; c=relaxed/simple;
	bh=a22LkJoTQoVTZI1KHi+Eg6/wxYDqDZUakotFrcm9dbM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mdjRcH2b4vL6gZCw8T3KnuzqJk/3O2HdzJK4CcyxvTaS2SngUalaEdX1Q2jwCW/MqEZI1kan70pLLbOrmRPNIitWL0AJPCM0d0B/h7ZGjz/YmXu5iLjyYncHB0NyArAWrXrWmJidAu5QGaR6MAneJ/mPixl/rLbAdesVXMioph0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a0026677be519f5933d.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:2667:7be5:19f5:933d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B51BD1C1C39;
	Tue, 29 Sep 2026 18:14:52 +0200 (CEST)
Date: Tue, 29 Sep 2026 18:14:51 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call September 30th, 2026
Message-ID: <arvj-0XliWJT0809@8bytes.org>
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
