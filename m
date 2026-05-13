Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608BD3A9D9F;
	Wed, 13 May 2026 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778703679; cv=none; b=ZY30sG16y/O8LyLyyisepB3Q4lPKUTrwVOp0l0cNFqB1/fK9PP3xEZ+OCq2AJ8noWpwO9ge1zdO9MDEX+PavMrdGfJ6D6T4P8sgv2UbW+sKv0iKMv0m6bvUJhy/EqWwQqErh5glKVMNGnRI/Chxa5LZJlq8ICZDvL81I2jVq2UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778703679; c=relaxed/simple;
	bh=ctcl9vvj3yVyLxo49vbPmi03kV4Z4bOEv+hwhQYonnM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIrcbL1e91a97fn1pGp9677nIXnJQjyv765jyl/xvhDKBy2YMqK7YcxaEpmtn0nAAPWyZDxFUt2VrS4yUSz3vQdiB7/br3uvlOaHpu/XTineopfaXcsh0XmwNk8IfrpkfLMttNJ0PPSDtsh6V+gi1ae3rLRCQTWPVyzNorDVFqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=sm2mVefR; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="sm2mVefR"
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 483021C4847;
	Wed, 13 May 2026 22:14:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1778703294;
	bh=ctcl9vvj3yVyLxo49vbPmi03kV4Z4bOEv+hwhQYonnM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=sm2mVefREcNwj9YSYkehPuzRxvqJOqTiT1GCEvk7BMRFfZn6Nmay4F46IE1qh4EBu
	 ws0b0yHTaGZuoxLn+M6qOdnfBBt5V49JSLj/akctECSLyiFg3ekL07gX7CJZsgj2Wg
	 UZD9/eDC/kxkW2jgEBGFOk4DrtdecPRlTPg1R5kb3bmf7uo8p4qjSQAUrpB0XPTq3z
	 uTHF7B8ys8ONz/QGKsbSXpde/hk//hv8K+NPJQVim8+kIsVhV0dI2imWiszlHADGHV
	 t7WyJoeWVg96AsTPWNXnd0iF9BjZ7kX0lfRoFC9J2QMLtyEQL6hl4N0JjV0sj/Od0H
	 teACj+1qAzy1w==
Date: Wed, 13 May 2026 22:14:53 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call May 13th, 2026
Message-ID: <app3iawbjr4o2knrg4jsu7w55ekyexn4su35kbqateutcgmgai@2n24kfenuy3o>
References: <6vr7ihpntcdikktgtlbudfblvahawkwwqtuv4pmr74j6mtp4yg@loyxw56it4jy>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6vr7ihpntcdikktgtlbudfblvahawkwwqtuv4pmr74j6mtp4yg@loyxw56it4jy>

Meeting minutes are here:

	https://github.com/coconut-svsm/governance/pull/107

-Joerg
