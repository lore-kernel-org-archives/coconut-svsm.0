Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EBE20FA90;
	Thu, 17 Apr 2025 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880739; cv=none; b=XvpGmlkMorPhYoUFaDislNWpboVoyV7Lplax8NW5FwR3FErYJEXz8P1FP68CtwN7cDJW7/vj1nvkBQSlVGvTf9NSAczr83iZrkxDWJ6uhewAB5vGXSi/tpT1i5RfhgzzwqGdeNaI65IVrpR5yJCqhkdrzleeOkpY5Qax3SLxyAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880739; c=relaxed/simple;
	bh=7ErKA3nuUWMuQRHrXe+5htO5kR3JRPM+aYBiSHrq7yw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QG7WxjOe5kng/OqAbAIdBlZEfAUM2DHvth1ZB7k/izeniOMpHhm/Pd0FCKICtqNQk0pnFyBFkFZh0x7pA83KX0o/HKe3mXaO85YVJ5NnRA8iYmPbNOjafSJYwO7SAiMLgLcIDFjMF2PdelmbACJnmx3/+FfL83brq6iYMmrsJhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=jFxnDfvu; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="jFxnDfvu"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0EBAE48531;
	Thu, 17 Apr 2025 11:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744880730;
	bh=7ErKA3nuUWMuQRHrXe+5htO5kR3JRPM+aYBiSHrq7yw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=jFxnDfvus5W0dtOlurcgJPJgJ6XeV+tZWJP+n/XClttKTu97c8Xo/ydORuJURhCQ1
	 dmkNNtkUrqzweKmPa4g8C1LnOl6Ya3eDlNvz/7axwOhCZ4n/SmKizVZTn3jGcSbpEr
	 my5lzCVdxST24JLKfJSBS//OC6j9QNg5Cs0MiLm64VArIk9xC4OY/JOP9aVd/DnKBS
	 /REBe8ZY9R49WbYvgHxpo4x3ES1xwcCu/bPNqHigVaE77TMgjc55Rq5i4Tgu6gbyU2
	 CMiAqIDAAMxk8lN1nGOrN31pEZwmtO2g2YVIrlOM/BG7LmW+rwfRVf+pCCPdQ4opML
	 oW6JXAa/9RkCw==
Date: Thu, 17 Apr 2025 11:05:28 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev,
	linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call April 16th, 2025
Message-ID: <aADEWG83kwzcEgkb@8bytes.org>
References: <Z_5wQLUu13RUm7Dy@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5wQLUu13RUm7Dy@8bytes.org>

Hi,

The minutes of yesterdays call are now available in this PR:

	https://github.com/coconut-svsm/governance/pull/54

Have fun!

Regards,

	Joerg
