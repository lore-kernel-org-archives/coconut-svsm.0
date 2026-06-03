Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A831384CDC;
	Wed,  3 Jun 2026 18:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780509842; cv=none; b=qznweo1dRlLg03Ibu+xzYwwrFpz4ewDgjeaDcQcQCXo0VBuZxiCT2DIqW1hbTpc6+vDHEYUUsMY6neCYykIP5qNcXnlBNufc7V8zwCoF90a8+HbHQORWQqx5p80N4LmvzviC2OF47O1zRPi6N0TJF58wPNU96zEZsKt8FpQN8F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780509842; c=relaxed/simple;
	bh=c9T/zZEcPMQCizDzd8CZwdTUjc63gvX2E/OUgBC/74o=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZ3JVGsCfPBsHuT2NnshEuzwW9oux+Bibv3/RLnsnKHmlsUuPn70k05eOAnt6iBGk3JV3xRMpCQJfSQvs6zrJGxwx7YSVIC+LAqydNNe5iH6rjVLGN9w+ldZLUAqvi8pa2KgyFTteU3uKslVHGDwxe2qGulQ8v67QNgxFjvwEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc500cb168346ed3abba9.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:cb16:8346:ed3a:bba9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 796141C7747;
	Wed,  3 Jun 2026 20:03:52 +0200 (CEST)
Date: Wed, 3 Jun 2026 20:03:51 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call June 3rd, 2026
Message-ID: <aiBsawI5ycK-zfLf@8bytes.org>
References: <ah7_t33cbOVFJcbo@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah7_t33cbOVFJcbo@8bytes.org>

Meeting minutes are now ready for review:

	https://github.com/coconut-svsm/governance/pull/110

-Joerg
