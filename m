Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCF531F9A5;
	Wed, 10 Jun 2026 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781116535; cv=none; b=mV9tr3XjfCOGo6mq87/ukbnfFPKa3N4lLkUD7G6OAzGcC0Z1FfZ3CKRBZAYJuHyR1Dk5D0a7lS5FoFizPKDZVZMq1ti1zzBnA54wSDim0Wc6BwN9/nTFyfpMZMQzx11t3TYEpXc6PdR740U2NEoK9jNuQiCUynKRSrdLzsdhEB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781116535; c=relaxed/simple;
	bh=GG13XAIcEgEVozgqku/2T0gHdFTK+jTcjhKN+/gCJlk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKXuSQbqzAQu1JQm+49l8jkdHPea4678ApCH3JSD9CzVHky/TsXv8rRaA3h1UOjIdL+Jpu3k4bUfJcB200aJecuhT5BHN4A8DpfNRFN9/b5gaukIVBJqOzajDCQmFW9miDu6hA8nY2ThrapNE9KbnGa7IWgaJGP+qnVzf01DF54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D5CB222353C;
	Wed, 10 Jun 2026 20:35:25 +0200 (CEST)
Date: Wed, 10 Jun 2026 20:35:24 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call June 10th, 2026
Message-ID: <aimuWJuUQNqge3GH@8bytes.org>
References: <aigneULi6Pmcjexa@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aigneULi6Pmcjexa@8bytes.org>

Meeting minutes are ready in this PR:

	https://github.com/coconut-svsm/governance/pull/112

-Joerg
