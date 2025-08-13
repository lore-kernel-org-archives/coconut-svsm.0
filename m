Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3552BEC21;
	Wed, 13 Aug 2025 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755110478; cv=none; b=Xco8Qg0m/Soh0Reh12E+57yd+Tq9PVxPmA8HLiSjTiFReK9c+HTVY+8tSGKY6zfn2GPquWS+iLcGB6dFO6DflNkfV8E3aY9L8i9oKoFDhbWmG70QEs9DpRmW74aGg41x184ny5baH3VFzx1veK/PFYJaYBsmcCsrnMsoS0dE79U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755110478; c=relaxed/simple;
	bh=5ENoyMe3/IGcFvSVhtFBaTfgiFWbnIDc71oxYhCZ+OI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2cvXzmw/ta2CEdxheO8UcGh8/xFwfsq3qhOzgMf8rNuvAKygIq06mVRy2sQhn2eC0MF8P0T8uo8VnMzbLErG10zvws43R0EMTSF+CnBc/mosbl7SNDyLT1eGjXPb9Z0y6TcOeRn+tYZLrG/Ts6Yy+Kc3KcyBHAR8pSH1fs5JCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Txj3CVBV; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Txj3CVBV"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7B79052BA7;
	Wed, 13 Aug 2025 20:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1755110467;
	bh=5ENoyMe3/IGcFvSVhtFBaTfgiFWbnIDc71oxYhCZ+OI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Txj3CVBVnCEp+K1Dmq6uAtEKJ2lts4CJTN0CSmAg/dqUinGxiepNxK+f4JxxpZVC8
	 EX49LnhNDuNEn/HBcLae2kHDZVlhUzB53FgwU2KmWTn3qytBoWGXIoGnPaVnsXpZid
	 kfl1MR4N879iZR5lkc2agH7gexNCZLY+3OlBCUvTTymaRErVWVmB50nulw5rO2YNGH
	 x5deQ9yz+FjWZbwslgR86ZUJDawX65urb+Bcaa+azoFof+h8Zj0xs3duz27MgwhoKI
	 0U5s5HVAO/gm+a+cx3cNRsITx8wBdgetmQPGufWtMLmIpNixnqOfl9cWZ9bgjI2iEq
	 G4Jd0JE1of16g==
Date: Wed, 13 Aug 2025 20:41:06 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call August 13th, 2025
Message-ID: <6thtotdqpil7nb6bp3ho4nayyuggpskvpcmjteb73nrt4pni5h@nvq3x7maxvq3>
References: <tcn7lbkdldezuzuhsvmodkunsze6kwefbsibc3r5acktj4ssgz@akyknynywlqd>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tcn7lbkdldezuzuhsvmodkunsze6kwefbsibc3r5acktj4ssgz@akyknynywlqd>

Meeting minutes are now available in this PR:

	https://github.com/coconut-svsm/governance/pull/71

-Joerg
