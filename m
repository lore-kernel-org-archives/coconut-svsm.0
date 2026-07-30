Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D177639DBD7;
	Thu, 30 Jul 2026 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419281; cv=none; b=uPP5iEueXTdrWcXPr1Scrp2ReEe74Q85+riJV1QVaXVT8SFUv9TKpzKr06cGFChAE6MCJjcSQh29KGHL8mGt/be6fOzE3xahDvHJLX9BDoK3ocP+U5PBpO4WqZsNVY4Q+FNUqVF7d+bTT7REs3j3YKqnig7pk0QLotbyEhKCkyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419281; c=relaxed/simple;
	bh=KQI0VQHt7IofiEPVUGJ+IGaLfUQz6TG2LDvzfcSMzBU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeSP+vC/CqUVnx5gekQUqYb+/jw+qeCJAPGSLo6wXPYQ+cXM2gAGpSkjSLmG4Zmu6Mc/Db7ubNLSDmaxfMbLfg3GTwRBq4yxXlEuwjloiSF9HpfIgyFFFBaR0z5h/SygUgzMDWfpgCRkL+DtDWCayCMCcnyv31xWzZqAIP0Ombs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc50014f63e0f2a030593.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:14f6:3e0f:2a03:593])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5DF64240A00;
	Thu, 30 Jul 2026 15:47:58 +0200 (CEST)
Date: Thu, 30 Jul 2026 15:47:57 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call July 29th, 2026
Message-ID: <amtV9TqAZHiksyRo@8bytes.org>
References: <amjT8oarGUmnYVk_@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amjT8oarGUmnYVk_@8bytes.org>

Minutes are posted:

	https://github.com/coconut-svsm/governance/pull/117

-Joerg
