Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCE0371870;
	Wed, 18 Mar 2026 20:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773867584; cv=none; b=Wt/J99zyJL8h9FZvbZ/8LFy/GzX4Ps79lqApSNmLS8D4v5gt7sn68pBN550IV4wNRLy/3PdW78f/tp4qjTD2JBsgSXnbXAK3P/wicxXMlQui2Wq7tW/mVnF6KxO8kfH0o/PPi6ROC1UA8QuC1eKWbQ0dYwCPotpqaCLuQ+VjAEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773867584; c=relaxed/simple;
	bh=06xUsCD6gdlmkJ7XQ1AqQECCH0Uf5X5+djRpwtxAUcg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3SOuUHoDq0T4cL5v6Kz8SNygM4VbkEnB9GTv42Y8Gnqi75H7y7u5VU7fT3R/WuPdq/6P1dZqN2JDzVLGFdkByCMVr503Vhl6Xbe36P1jJF54w1yTUWigkWQjg1NjPAu0GcYy+PhfjUMwVVHz5AlWcHDAHSfxQPKe2OE8jWyMWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=DeOGFXlX; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="DeOGFXlX"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D80F21A5C62;
	Wed, 18 Mar 2026 21:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1773867574;
	bh=06xUsCD6gdlmkJ7XQ1AqQECCH0Uf5X5+djRpwtxAUcg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=DeOGFXlXJWEZM+BillLFWQMoQbDhE6tO4mzj+Xpantmf4FPQWkjt4Gh5POAdWHirl
	 fIfu7vpfrN7Tqn8WG82JaoPBJDSnUBDPgYIWr3Lyqdu36qHyFrk67x8Z8F3O030x5g
	 ZH1SV4rF82GUbXtJFWgkJc1l8y6GvC9Cd0ZvHbZ+yiJ8YW5o1PJf7QKQt47B1hAn0T
	 SVaGa9DGg48/jn2qAO+T6rJsS+rOtyNChZ/wbtCpcX70lH/94eNbYBdIsHy6seGg00
	 dyEjoJlMjZzywq8LVETquZbKfWgDFvPrQ7NF8ovqwUTgMKsK3gzMoKWoEZmu1sOckK
	 K0Z807PsCBQZg==
Date: Wed, 18 Mar 2026 21:59:33 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call March 18, 2026
Message-ID: <tln452lofhghedpjgnnmunchawivyaxecqvninjhxzsibspxqc@uunfdod3lsbp>
References: <jf4dqgnyttqibmmjzi42q77z3frcd2oomrfyjfahiglp5vo5vn@uxhtposjrxox>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jf4dqgnyttqibmmjzi42q77z3frcd2oomrfyjfahiglp5vo5vn@uxhtposjrxox>

Meeting minutes are ready:

	https://github.com/coconut-svsm/governance/pull/100

-Joerg
