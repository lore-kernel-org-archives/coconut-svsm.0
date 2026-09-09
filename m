Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8973D3498;
	Wed,  9 Sep 2026 19:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983907; cv=none; b=AY3+AnYVptS8yOAbjZZ1/8wtiRnIRqeGZHKLQ6PmT1d/BVm2lgh78kP10IwwEYyp5bQEJgfmERwW5j662G3+953VNNdH/C0K4h1kM4xGurszq5HUCf6fHK0MrDkQG6S+bKMzHeg76fyMbugI2wbZBY5f7WsyUtl6qO9oLNkmduY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983907; c=relaxed/simple;
	bh=vVcxUfAqKj6kjwNjbvAWJNMr0ylFnJ7LTtg6Zg8003A=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKsnFNXqcq5WIcGHByP+vdSl2z4CEZRMZJFI+7uM62ZFg7vBqQvzRc7ZagbDTQLW0BG5P6JqxzyZAxRDqXLJab2j/WBdo4/v/gf4f1e58X5g/+yT3Xss55IK3In4uJaU5eSJDCJKdjIuvhZnQC4yLuZNBi40yADtgsJQ6QkQokU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af085a0034cd9705be838281.dip0.t-ipconnect.de [IPv6:2003:f6:af08:5a00:34cd:9705:be83:8281])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 76EBC20A08C;
	Wed,  9 Sep 2026 21:58:19 +0200 (CEST)
Date: Wed, 9 Sep 2026 21:58:17 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call September 9th, 2026
Message-ID: <aqG6Sk1wsRQVQ4rY@8bytes.org>
References: <aqAyOssrT_fjLZaO@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqAyOssrT_fjLZaO@8bytes.org>

Minutes are ready:

	https://github.com/coconut-svsm/governance/pull/123

-Joerg
