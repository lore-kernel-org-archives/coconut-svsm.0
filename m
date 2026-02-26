Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E14C3128B8;
	Thu, 26 Feb 2026 09:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772099359; cv=none; b=uSUp8l6Acyebg2xqzbSTmBJfeaOez6sNWifwgaOb5/imNBtYi771tL4lcF3pSVasCcbFTlu/dXYbP/FJv6sLadxhh3auFafSfgLvJazcULDBhqZN5iDrUlUbG3BioHb78s1Dyg3/7D3FR1gnbH22p6FApm2Vsnyalqzar3a+JMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772099359; c=relaxed/simple;
	bh=ngr/nF1Ta0D4lo1IE92pvA3Vhhi3fpxqqI69lqLiOh8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGviSd4rhYWaIBOSgtZlcuFJv7zkNp1tukjhRiWOSZ8HIWn9IUpCqdQdviyrt7RsU7yqpX1L4B7oSJiNTT6KILX0TWBoGxrHNim2j7YGNkpDy4D4NuDKc64yHMg0Zmh7DYUOcTMfntBiMHsdQPwUlDmDNCyWcqLUxT0mV3t5E5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=f/LZhfZC; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="f/LZhfZC"
Received: from 8bytes.org (p200300f6af1d9600c83559b88eb41dc2.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:c835:59b8:8eb4:1dc2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B3961200063;
	Thu, 26 Feb 2026 10:49:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1772099350;
	bh=ngr/nF1Ta0D4lo1IE92pvA3Vhhi3fpxqqI69lqLiOh8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=f/LZhfZCpB0fUIp8A8rKUFx5D4KdqtYnWh3ZfgVoSoCmSO0OE74HFcGWeZFJEtXmi
	 s5FMq82HUWiOYlRPjXM7GWzWaEDfhq83izuc+u7xvjMTpnEU7Lfkbjl/xEwqTo2AM0
	 SGjUpl/gpx1B3g84Vqq9nxFgX1aaESRupPKOaUNAQhyFllnPNEu8zbJ91gecYRGySn
	 A4W9wexx1SW3OPJB19/oPzL1g5PrmXY+58nsofoA70/RzvYnPtV+snxRpuGLtPhOgM
	 4JeYJecn/iNwzNNnNPOuYp8Wvm8sK5xZoJ5tgDB9WyRInqDSncG1ZnXQFBHY0IPdq1
	 hLh7ELgBeztFg==
Date: Thu, 26 Feb 2026 10:49:09 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call February 25, 2026
Message-ID: <uyg4xshhfxjo3iuvqpt5kvklfxbvxef7sharcxmwjqab34hynm@7qx5bizvopmh>
References: <hul66wdlddkhriko6gb7po5nstadfjvou7lbzsfbvlyrpl4ybw@gkpc22ppgsxo>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hul66wdlddkhriko6gb7po5nstadfjvou7lbzsfbvlyrpl4ybw@gkpc22ppgsxo>

Meeting minutes are ready in this PR:

	https://github.com/coconut-svsm/governance/pull/97

-Joerg
