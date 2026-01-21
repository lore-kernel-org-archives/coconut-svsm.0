Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A150B3A7F60
	for <coconut-svsm@lists.linux.dev>; Wed, 21 Jan 2026 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993035; cv=none; b=FRU8tVreCaQilDpqEs0F/2HD9zDy7iEoreIuZZbYw536j4U4bnavfaeA0Xffw80xTW9p7WUDJhtSFR+LzNgjV1/3+3QYF4NEP3E44FviwGF/BTYEkqRcMRw4Uvk9db+WF0YYbR/KZZqujc0HVQJ/ITt9GvzCtXj7q+dng4FGgMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993035; c=relaxed/simple;
	bh=gUk/epx32MC0mPk29vJKcsivCNS3ALyW4o5g9j2gsrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ma+o7Hyxbnxi5zvv4SEyh4pcn02NLXjpcHGkoYWgjOdJQTlea9B4rjK51pIIsRVEIBw1TZ3QBu/zia1eyi+rHSZw6g1eFPmEmwLnAnaN6iCRqQ7wvEEZ3lDr1b5vfqLUD0+ZaTrVDx7y/s0lfS6VrealNRJgvu6sDmbu9OPv9CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=7ZfE/JqO; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="7ZfE/JqO"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3F8EA5FF90;
	Wed, 21 Jan 2026 11:57:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768993031;
	bh=gUk/epx32MC0mPk29vJKcsivCNS3ALyW4o5g9j2gsrQ=;
	h=Date:From:To:Cc:Subject:From;
	b=7ZfE/JqOcSnv4qtKGaS0QsQumywXf15RgZI6qjuNcRLPltoSVSsBBNvRF6wbwryGs
	 XecFphbAfFOfhq1mWGdOXey0e8VCB7OQlkDMsGiLmD5JHoSo6IqRdMXdUZB07BFMCH
	 Zs5BB0yDkzPQ6XGLU2wczEKNZRZ/PXtHvjuZVmWapTOsOvI4w2MEiAfXXlVWeozoA3
	 uhc9nWrMDRD1Uo07r7BC34VDrgS5E+3f9152+LRn6mfmt5BU7LLfX5T+4cgEPi47mf
	 NGPzUjaiksToN64T6SoVMTL4oTdnYfOGzx8fdIyTa2hpy4+6clds1+hSaNFX5/0Of6
	 Pl8Wd7++KoVTw==
Date: Wed, 21 Jan 2026 11:57:10 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Cc: Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>
Subject: Move to Rust 2024 and January dev release
Message-ID: <ksdawsdemi3erury5izljbhvronldlt23qez5jawcjgo3aojbr@b6swic4sw2kq>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

I plan to merge Carlos' PR to adapt the Rust 2024 edition into the COCONUT-SVSM
repository. There is a chance that other pending PRs need to be re-based after
the change, so if you have pending PRs please keep an eye open for the change
and re-test your changes with Rust 2024.

Towards the end of next week I also plan to tag the next development release
and a couple of PRs have been put on the wishlist. If you are the author or are
on the reviewers of assignee list of one of those, please make sure there is
progress so that the PRs are ready for merging next week.

Thanks everyone and hope to see many of you in the development call today.

Regards,

	Joerg
