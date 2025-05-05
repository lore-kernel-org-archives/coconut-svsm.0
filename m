Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C232513AF2
	for <coconut-svsm@lists.linux.dev>; Mon,  5 May 2025 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746467843; cv=none; b=qKoobdRRh6p0eAZEtK/k56qCC9/lYWi57AeN+GMFM5LDZein9nVjc4qmHZDbi0XcRkvPVwWGLnX6Bv0l+nsi1vyt531OkXXsGNC7yKTtKr+UZkHcCfujNK8fr2DJvHHFicxKeox3OaA3Lo6K2MZrk217gN4u0hqcLnoBNjCCLRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746467843; c=relaxed/simple;
	bh=1WgYyNo7EUpB5KdOUCzOZyVMX1Wf4Ik7+WWxjIT821Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ktFDLrgZGneyBaNQ8TtniKIPv1RnVykPmYnL0nowdWwYM/orxQ2m68/2msuXFujDZ1YZRrYa/gTfF6y4HjIwcfIl03GgFhw4dxfuZ8wsROV9YGj27PEj876EyAYL98Q1dwy+GpP8MM4Ay8ZgnM/UHqN+nK5kPsQfPIgx8kbAHIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=fWlblK2h; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="fWlblK2h"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 6951C4A20A;
	Mon,  5 May 2025 19:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1746467839;
	bh=1WgYyNo7EUpB5KdOUCzOZyVMX1Wf4Ik7+WWxjIT821Y=;
	h=Date:From:To:Subject:From;
	b=fWlblK2hPhcFKt+fm2DiQNcyJsv/4jz9KTmrnZQxjMgRNm+2Q6T3ePuSTHM23db41
	 Hs6uHtHuuRhf61cUIiaZA/h2mkINOfiErwvnS/M1K7/3BY6BYYF45mQMS3aOJzVhXQ
	 5M7eCAQQcfxua922x75vdmPDROZiKd7DiZnxCmHb2jotvX5E6Z8oT0XX0WNKs7fuKS
	 x84bRhVlcm2RZzN10GIwEY8mqBaXs0AXYwFpDS9ZpBaMb7n13Z5wZfonHj/aI9UXx8
	 Xc1BwP1x5Ac1MPGjhMbYtkCNtEwqohpoplap8oiZ9Okimio1k3XdZT+kpaEwyfM6eP
	 OxMJ/1PHpUYHA==
Date: Mon, 5 May 2025 19:57:18 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev
Subject: Moving weekly call to Zoom
Message-ID: <aBj7_hQmgKgCfBKN@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As mentioned last week in the SVSM Development Call, I will move the
meeting to the LF Zoom instance starting this week. I updated the
Governance repository with the respective links to join.

Please note that a LF account is needed to attend the call. If you do
not have one yet, the account can be created for free via the
https://linuxfoundation.org/ web page.

For reference, here are the relevant links:

	Meeting Link:
	https://zoom-lfx.platform.linuxfoundation.org/meeting/91564675975?password=74a7ea7b-e98c-443b-88cd-94ce45b977cd

	Meeting Calendar:
	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

	Governance Repository:
	https://github.com/coconut-svsm/governance

If you have any questions, please let me know.

Regards,

	Joerg
