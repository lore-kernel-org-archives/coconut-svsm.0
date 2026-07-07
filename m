Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91F21ABED9;
	Tue,  7 Jul 2026 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441205; cv=none; b=gkbFB0bhlGoTr0xlCksIS6PFQ3jPjvoigyCENuJ9leYi48X0YQumMikJUuG7gFriTk9ieKGPMlAGUwj7w6CBVx7VjjNIhzwsG1ObwKL2PhdgOKSmA7N68aUDpwAwwSd3E310KPNQ5oCLjypXT1pe96GjqsbBbs5Uub870yNvS0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441205; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jIk2nBb0nocKH0W+LIE+E0XZ9BJjQRx5xKWPnTZQMVhntWkA5cAWopQvFiw+Gpx5cMFwb2mWonNZMMZZcoT3ddkPF1AQSD+8aUmZggYkK1Rx1fT4Wnr3KRBRhaLtbl0FpMsKpCQEOgBGSH9iVtA5dG1gcbxGSIKepBSwqr0F4Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc5009ee7c35faac12b34.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:9ee7:c35f:aac1:2b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 81150202F94;
	Tue,  7 Jul 2026 18:19:56 +0200 (CEST)
Date: Tue, 7 Jul 2026 18:19:55 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call July 8th, 2026
Message-ID: <ak0nGPsnLf6Rn4Kx@8bytes.org>
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
