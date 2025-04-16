Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1602A226534;
	Wed, 16 Apr 2025 09:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796332; cv=none; b=bGg0azp/6jpZgAtDhUfIjRbgmCStsaQHEmDtImOkBjiSCmlvQm5lMBhR5v3fOEb9SjTcI71DJJzUbZO+bqhssOTd0OFFEBq3bpGLquMPqvvkhrmmesM7UQ3cM4aCcRYjSt1zsIlacM+M5yrm97wdMfz81LLbu2QH+3trfDN7VcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796332; c=relaxed/simple;
	bh=ldttsrZrPfaaWxyHQeXiq2HJ//k0Id6g0MVzAWbrG1U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ojplZQYRZhwIXftC3aeyeBt0CNaWmpI2JpK9E/XhI3sriYDRbozR5VRUE95HklvWrUwuROLeGTN+jgQrMCJZA1lbdqrgRBFa3ZlWot1BWnpn81CFh4ZRU9yp9CFrvtygrgVgAIKvkYXTrm6+1ypCbFbI8p9JaZ5AmJB16HbK1zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=BYlCZ0Zo; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="BYlCZ0Zo"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8D3C246B64;
	Wed, 16 Apr 2025 11:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744796328;
	bh=ldttsrZrPfaaWxyHQeXiq2HJ//k0Id6g0MVzAWbrG1U=;
	h=Date:From:To:Subject:From;
	b=BYlCZ0Zoj2082nu3QoQEW3a1wGYS8aLGctFwR6ao6l/XFUmzH/WvRKfizsHtTAkLk
	 jEFSpPlDiJXvO0pLYVzbZDg4BCTC1qnizBoUD/NUS8xLPgL1pysISDkHfYeZt+8ATp
	 Jf4AVYnDEhLa76NB2tzCF5v7bLTVEYDc9C8welwj0hkJXT5BNy+qaUaiJA4aEvfIOF
	 /u3ntJbG8O71n63BqG3KqpSINC1kQC2f7Ohyz1LPG7ujLbZw1UdxcJtpkeRKKwO51+
	 QW8qgA6Ogp1WqYEMmZdw80WKhj2Xt1A1sVBV70kwBvYmwgKYIEgaqHYmWzlRjEqr5b
	 mCFg4cWjXVsyw==
Date: Wed, 16 Apr 2025 11:38:47 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev,
	linux-coco@lists.linux.dev
Subject: Matrix room for COCONUT-SVSM
Message-ID: <Z_96pzxZi6Eg3Nfl@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

I created a public Matrix room for the COCONUT-SVSM community:

	https://matrix.to/#/#coconut-svsm:matrix.org

The room is for extending and continuing discussions from our mailing
list and the weekly development call. Hope to see many of you there :)

Regards,

	Jörg
