Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2960F19995E;
	Thu, 20 Nov 2025 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628234; cv=none; b=eK1nF79xWp6NoTpqZvn0JhwwZJPrN0k7h9w61f66NpgN+mwGYChfZI3hS8DECOxGVRkrgK1yX2DdtXpeST5K85rjEijWRMV36q7JIM6sS211v0KHoG126uR9ocGciBwNxpPX6cVxXOL2gmzVLnhNMktOxJG6ijhAKASrPPS4xHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628234; c=relaxed/simple;
	bh=ls2jXTNC7vXaqYRUSa+wLXwmQ04zv41CI8RSuWVwcX4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgSuor5N9xkEb/LLDHEsUYIcfj+Vt6S2xceT8Mu1ltY3F7enJWswSj17nvq2Oz6Q+Zi1u3qreaw9CpEJfqGiLSKfl2PjhsFWR3Ce8gau8LpkmmpC9ahLFDrOlsFAd1ZLC/5A9A1mlA4VKCTQGXOYCGkJqoBDgJVcwpWyJ7S1g14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=1CQDFgrM; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="1CQDFgrM"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 26EDF5AF47;
	Thu, 20 Nov 2025 09:43:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1763628225;
	bh=ls2jXTNC7vXaqYRUSa+wLXwmQ04zv41CI8RSuWVwcX4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=1CQDFgrMA1jOtHJGvxcko0k8ba4LOAl9VNms62Wc49nD+c5KUSIPTYuQouyp+tOIY
	 CKitskmgFDtx31HhdKyLW40wccD2herPKt0FM8O7IzYP/aLpMU8AHySKsSmjIYBDBc
	 bXDgggwIiC3zspusychmz4LufyKcOlA+5luqp+m8gHRJ7jawnI09p4XYJs7ffzS5A9
	 YaNil8oozM2Hbdw4Sp5IXEKQ8lbibPTiYBZYwGdhSiilVhs2Q6xNgS9n//0k0aJnCi
	 hQngsFG/Y2bw0LiUggLTun4e9SDYVZHDp5JjR8ruGk1FidUSc4xkmyCSVojPVkziso
	 /UKfaJbNub98w==
Date: Thu, 20 Nov 2025 09:43:44 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call November 19th, 2025
Message-ID: <yot4sbmsys5uym7paqjvofqqewjss4ajnbdlp3s6m3sn325pk5@wootdlhhlhsp>
References: <cba55jdxpvqmcaor77arlgak34ixrcevfc33mhq4tkyybuiqi6@xzthbzosur4j>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cba55jdxpvqmcaor77arlgak34ixrcevfc33mhq4tkyybuiqi6@xzthbzosur4j>

Meeting minutes are now available in this PR:

	https://github.com/coconut-svsm/governance/pull/86

Regards,

	Joerg
