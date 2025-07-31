Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD14228DF33;
	Thu, 31 Jul 2025 07:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753945821; cv=none; b=HJdiFUBCIjHP+kIk4oI/jLNpCf8xT0+BnRghT/9DPLSWgC9BWwgA/DTx7QKMRBSUKm0h20w7f3USxj2LeaPh/lwk61q61Ix1XQ3wIBuEaOKdiNP+3ROU3GVUhlwZ3nTObUm3xsORnh1ToYc95v5PO8QHqQTuWmAiUb2p55KjKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753945821; c=relaxed/simple;
	bh=7sGtsS8LQnYRqcGcQPgS5rTdX/PM5fPgx+rSlKW3v0g=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPVI+9ax/T9DO4ehon4x99oMNqky+g5XCPAjDiJnYrrR0oAcsiQeIB3yXhZEPSDVrcR9UJnXpc1IIVIrLOrQmG0/qWU8YHV/TNQhq186Ha+5PkJ3hMV5Cutcek5Sh+3J7nKxRrpf2K06EHcvde8f/nvKrH0ZCEKhV+uqdA8to3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=cj1jpMgK; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="cj1jpMgK"
Received: from 8bytes.org (p4ffe1b02.dip0.t-ipconnect.de [79.254.27.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B7BFB51BD8;
	Thu, 31 Jul 2025 09:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1753945810;
	bh=7sGtsS8LQnYRqcGcQPgS5rTdX/PM5fPgx+rSlKW3v0g=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=cj1jpMgKtViLYfFW65RGZ/roZEB5+RNGYIVnbRQmFyIGMztWZQIGW7VB7B9mT6GFK
	 UXJGRd7Zo5nNLonEAhrwcUPM9fU1uShxgDwSZ7U8BCWXCzXUauKKJyUUupMpHXih48
	 ECijMfwmhhaWyNe9ObPr1CYfAbgNiQRxlctn0lnqMdbM/eU6TKIZhFLMqtAVSZeH3P
	 /CEm1AXsMe6mFxh+1imnQ1hOy/eavkK3d6rqzMCK4sDKg4EGjj6Lk5V00GTjERQNO3
	 yiaF7BeTOdXEzSjjtSns9eJ6ZTzsUGMY3Ruk1GI0+k04I0o9UGOdeOClxWZc9J7K86
	 EpwAtMQ8ivNTg==
Date: Thu, 31 Jul 2025 09:10:09 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call July 30th, 2025
Message-ID: <e3c7v6ybrvbexx5kjgnrmruheqr2mqvrxsg7p35tfwmehrepum@lai7jfpeaby3>
References: <g63do42uow2gfovwl6qpilpathawqkndk7bc7egwmcjwe33jrj@hxybq2xum4ux>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g63do42uow2gfovwl6qpilpathawqkndk7bc7egwmcjwe33jrj@hxybq2xum4ux>

Minutes are now available:

	https://github.com/coconut-svsm/governance/pull/69

Have fun!

	Joerg
