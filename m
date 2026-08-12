Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D9034E74B;
	Wed, 12 Aug 2026 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786566263; cv=none; b=kBgcEjCukum7wrvstOQFZWo+yhaIz8Dp61Q/DDrPw6GP7bXhkmffSBDODFHDJba/7dsHIS7H6+djsvyDnQAC85bLJNsfKGTevL+S52jOPXhKy892eOKZr3mPQOyIN8W/Ntho1nrF1tIar1mLRbJWaIjflHvATkgp38B1U9kxsGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786566263; c=relaxed/simple;
	bh=XLlCdbDQg+6W4ekkTKo63IDayTfwh/P064gqqFNk2og=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRu4ZLnbmoEDoDEMxApDjjmlYSrV8zwneJfDjnWVBF89ntwC35UCsGSaa70eP/Mja0YOLQ60a3Eez21anRFl/rnpoeuojXV9j0Ty9FsOjoJUNIzAvECN3ftaYlHUU39SwjGfODBpm+vHOjOHyZ/N/GiWbPvtygUYrKVTzABk6iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id ABA47204166;
	Wed, 12 Aug 2026 22:24:13 +0200 (CEST)
Date: Wed, 12 Aug 2026 22:24:11 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call August 12th, 2026
Message-ID: <anzWTZ6I_K_C1Y-M@8bytes.org>
References: <antMdEgGBXu3aK74@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <antMdEgGBXu3aK74@8bytes.org>

Meeting minutes are now ready:

	https://github.com/coconut-svsm/governance/pull/119

-Joerg
