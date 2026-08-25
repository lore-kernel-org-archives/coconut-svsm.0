Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D744342524;
	Tue, 25 Aug 2026 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787676036; cv=none; b=b8oqI4bDyOzZq/w6D/Wip+DfAcr4ammfReUwpNmXjLTMTY6emz15MFrvxmEtGT2HkReNhYlNmFiIGJB1cYkeUYZ/KrFIPSB3sSFt8vqT3JMavWRe3V9yEh1MIq8/1LW1BMSH2uGKYwAUEVYRWYTiVGvEb9btEQpnOLA7att16ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787676036; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ll1356IAgDxmjYlizaFNHAidaIYhxkSJ94NRc0qjcjJ4tlzuZ/MNh+A6/MFMA1lBto6OYNVepf4CRD/n/gI4GYC79F5GR/dmhXHpfFq5idjLjDx8SMXrlMThScpvT+6rMsj7SHOxAR/AsK5zYDCB1dfHenOm29dpvCjKUcV6J28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc500741de0bab9f50fdc.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:741d:e0ba:b9f5:fdc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 29F7220821A;
	Tue, 25 Aug 2026 18:40:28 +0200 (CEST)
Date: Tue, 25 Aug 2026 18:40:27 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call August 26th, 2026
Message-ID: <ao3FKVJEdDyL3Ax4@8bytes.org>
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
