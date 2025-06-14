Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4820456B81;
	Sat, 14 Jun 2025 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749915372; cv=none; b=CMkhZM34+D5ADEqikkuWJ/dn4yuTXZCDHxlFs9h+4SA8HqcAS46n43msxBHzmUpP8lajOfj3uzTq/9jKlwu8P8JJ9siHWLCmKBHd27xxzY5Xun2LbSiTQ1grx8ibtaVugPGhKsqrzbwamcMFE/g17uDgUmUXfCqi5GtPKMPU+2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749915372; c=relaxed/simple;
	bh=EtK8F6qzWL3dSPitCXuTnlOAuCQjkQ6IlyeDVH8ipuY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXtQZtMvsoZyIinQ4TKho5N3lRdyLA5JhKLliA/KUFqBhMPSWmHcYw2UACZza6r3vtYm4hknklxUfg9r2IDrEKBQInXv6O8i9ahW4rtm7mgewChzj2M3YUUvjXUOgMAecwrQE5yWRr5weRYzntujTYBzsYQgxjDlJFnDlDNca14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=M58D+14f; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="M58D+14f"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C3BCA4DE74;
	Sat, 14 Jun 2025 17:36:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1749915367;
	bh=EtK8F6qzWL3dSPitCXuTnlOAuCQjkQ6IlyeDVH8ipuY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=M58D+14fqpxn7s5gV62NI5K9Tno9YWHxozrVZHYW6iHNhyqOVbitgJ8EtQr0XByKb
	 UnAAAwiHborrrUemccE7WyOI4je3bQBK/WalI6yUjItcWZlZosPBrPoDaDm/C/G0cw
	 Q/z6WKp7aWU5/jh8+Hks57Nd5Z6fKJdTE17R5b6zQ/gI6sWCQsJUiOVM0HlX8lddzn
	 k47GU23liXNM9CQ2/eqA6soAnJbcLKE5NlYUyrlCkP5rzKKPsKwaU2nDIKShjUUhNP
	 wotDDcv640NaonewWvGra58Se809rOcJi7aBnhC5IUMOxZvI+NNm73+b8KxhX+vd7D
	 1Bod5WNeTEONw==
Date: Sat, 14 Jun 2025 17:36:06 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call June 11th, 2025
Message-ID: <ofdovvtbvg6yiiwblbj3fdkyrf757ogictpf3rfnheoclvsonx@2yazplofqaml>
References: <uz7wk5f6c5uoamhlydd2uqc62eazpyn4zaxmsohd7pugydrvvu@uwuoa5c7yley>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uz7wk5f6c5uoamhlydd2uqc62eazpyn4zaxmsohd7pugydrvvu@uwuoa5c7yley>

Meeting minutes are now posted in this PR:

	https://github.com/coconut-svsm/governance/pull/62

Regards,

	Joerg
