Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F78D2E9EAC;
	Thu, 18 Dec 2025 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048917; cv=none; b=gjqgg5nSwODLy3LTO6k0KKDVFRzbiLZIQqYLMMd3YWLWBNTFgiHYXB3IVfz3gyyugLh+20Z3rAE0SsIoxvAv9HLOZamu40lF8Xs4ZSEd4mbNhL4Uro5f1W3+8crEi+Tq4NOSoCzUiZ6EdAAnuxpiZDNetw5K9cFjBmMNbfV/CW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048917; c=relaxed/simple;
	bh=SqyIgaG0J+Ip/ibvhjn9k78MJExpiaf265gwTR7IQ+E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrzwetDC6k1/hxLZb1EcnzwDL827Jmhb/0fEUelIXMnjjNOYsBBc6qlHSAvY5csEjP24JgHFcyAhpgAbY1VF+ANlEBqXmYFvo96fWreKIlBcmYh554RT6I57g9KlGDZAWsapbTZlLhh559SZxBfrcx73Mr6UnBrOUlV8KRYTTKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=4E7tsczK; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="4E7tsczK"
Received: from 8bytes.org (p4ffe00f4.dip0.t-ipconnect.de [79.254.0.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8008B5D591;
	Thu, 18 Dec 2025 10:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1766048908;
	bh=SqyIgaG0J+Ip/ibvhjn9k78MJExpiaf265gwTR7IQ+E=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=4E7tsczKGgMQRjZgOANxQJe1ZRBtGV4xtfcanXFS1iAFVK65AinzCMSRq4dM9xdZ/
	 jRDAtVP1+r5HWL+wtrYtzgbMmYVgaANEC2xDLdhM7SURHQPDXYp2DRRlkKhGyVCb6W
	 qWOyKqG4Lb4srNfSvQxFlqB/aY3zeQKX61+zxMDjpxRkONJAS6U7r77OJIetVtW74F
	 80nbzY3SfmNmM1oNl7CF0EkSxmldmeFIsZeiF5Dw7L4eFIYo91e92TtrvoEyhhNECg
	 pyre1zGFVWmxGaX0j7JUA0mRitDIGHk2ICEq6JEJ64kPyZYxZJWTD5Q3ynY0C7PwUX
	 B1U9IdlfK4m/A==
Date: Thu, 18 Dec 2025 10:08:27 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call December 17th, 2025
Message-ID: <jufemrws4esfbsnfttf72rsb4bljys3aifhhyysm5ihpf3bwa6@veppcwk6land>
References: <wr5g22qmztj3mqiiwzxvqw22tdypqtu4rd7biwcbrbvv2m52o5@ok3fldp5auo5>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wr5g22qmztj3mqiiwzxvqw22tdypqtu4rd7biwcbrbvv2m52o5@ok3fldp5auo5>

Meeting Minutes are now posted:

	https://github.com/coconut-svsm/governance/pull/90

Have fun and enjoy the holidays!


-Joerg
