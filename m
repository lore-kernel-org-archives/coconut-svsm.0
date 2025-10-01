Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CEE1EA65;
	Wed,  1 Oct 2025 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759304744; cv=none; b=BzsPZXWn6J4jxrQLPpFRLE+OIIZ/ju+DFF63tWiklHHrEKbEIoQBSEExX0ILMWxMOMorMh8FnhFG/p+lZnnJ7Bcn00OuF//8H/KCI9O7YBlRf8Ol6QPJMgH9JbBGmRd0hXGppFwICUHmKR+VFcItKkVC7faqlpYNhO1EXCSRNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759304744; c=relaxed/simple;
	bh=+rNcpjGCzzpnqgxQPesG3kMBNR0HewMa2+wCZTElttI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6cOVoq9T0ZpV4ICCP4q00zhewQr0N0/28hmEZR4mwSyQrDG0RevOKbDdSz1L5xMc8flsvfUnEfBVocRGwbJ0zBJQEBgGr6x1N/IYmCNkpX43D8HPi3MvPrTC1sNYMU+/3DCxKGFtTrvQ5rv+yb3ysNFVkAB7gocgN6GXwlYIeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Yhzv1mpt; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Yhzv1mpt"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A49145707D;
	Wed,  1 Oct 2025 09:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1759304738;
	bh=+rNcpjGCzzpnqgxQPesG3kMBNR0HewMa2+wCZTElttI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Yhzv1mptDlhmn72HnUWLZ/ZCu0OPHDEKMFbYYMH2KLr+NKZDs9lnE+VS9XJu/H1dx
	 Cdl2194AQus+g54OqtSODV2IP5Qbj4mCF9m6wdNGe81g5TQouoK+J2nyieDRyHyczd
	 sxV+Rcilr94MP5CN+tEbhM7vK8D9RPSYYialfydsxhj/KyVPFrcIRycgWhx7okGXaK
	 dCv83Ci2G6LGnoruMvLvSYJrechJUU+bAFQPFlegqt2cRR7Y/6C7RHyE2DDIndfpQR
	 /H92vgkILqTGRa8YxdXX2WQQCm616mG9AnB17cIQnVJWt249vfps1nBhoocwvo2Ugb
	 unNWQXAHUEwbQ==
Date: Wed, 1 Oct 2025 09:45:37 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call September 24th, 2025
Message-ID: <qwobca6lueoiov4oy4uwio3xqhm35ibkbxrjp4ejrb2zpy33bu@sj43bruinozz>
References: <gw3hzruia4uucn2a3dw2d5djhdv5jqrbwzifil76xd5vwajqon@pyy4tjowb5d3>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gw3hzruia4uucn2a3dw2d5djhdv5jqrbwzifil76xd5vwajqon@pyy4tjowb5d3>

Meeting minutes are now ready:

	https://github.com/coconut-svsm/governance/pull/76

Please let me know if anything is missing or inaccurate.

Thanks,

	Joerg
