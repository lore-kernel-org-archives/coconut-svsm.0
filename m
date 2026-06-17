Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BEF3783CC;
	Wed, 17 Jun 2026 20:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781728551; cv=none; b=fZbsknJCqjU2X0xnG7V7+6EQKlcsxY09NgVjH5QA+vSS4v6phHmPaOZkFm2Em7QPa8Nyqm28bNu/qJU2z08/8VMDP1BFBfBW2F5s3pL1l9QA+K70cWDxmPGjn1glAELw6nMHzDijKHIfOK1nbFxmBuVJdgRuoEPzCE/dcd0BEAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781728551; c=relaxed/simple;
	bh=4UVmH9hNpTBU+2CuOftlujqIW+7P8xOPD8edruJ5cJ0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4SZJGFASHTL/NaFi0mz33iXz/ckuBWVhR7fupC0fmVLRTocNY9sLVdYd0xQe/3dZoTPPSEssqrvYoNqEnKsPg37vuv+R9VFK17FDkXcKq+1K+m9amC2zCf1xAMBprQkd83nks1uADitggxKW1YY9ObAf0TNpiu6DnO5fPY0hKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 801002028B6;
	Wed, 17 Jun 2026 22:35:42 +0200 (CEST)
Date: Wed, 17 Jun 2026 22:35:41 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call June 17th, 2026
Message-ID: <ajME8o5EwHVav8d_@8bytes.org>
References: <ajF1XEHc42IG07Qw@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajF1XEHc42IG07Qw@8bytes.org>

Meeting minutes are ready:

	https://github.com/coconut-svsm/governance/pull/113

-Joerg
