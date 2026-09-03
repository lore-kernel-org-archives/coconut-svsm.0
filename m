Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7059B3F4829;
	Thu,  3 Sep 2026 06:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417536; cv=none; b=OipEIzrsN9IQsVQQkkXxM3sVDNGX4yrC9mniqYYOyhWVMMG6f1podd7hNxobj1uHhdA0GIiKGk4PzX9e4FRoEnPvPXF12TN0lZqN05teAELDuL9Y8rrE7S6bXQFsuXocj664knys3XrJAONG8QvhgaJwwED/9FAXvsAv8Vsra/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417536; c=relaxed/simple;
	bh=sGMDLzV5qnr/QJ/L/uehN68r9Wy5nMcdl84FVlqOJUs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1xPvWvSkZV5u+34GYnSRtzbPDdPnZ5JLTO/MrQcmerGysorZ7U/r6++BUgPV7c0LKvw8C3HiGUlxCRsJKUu7F37wc6mgsIBeAYDK+1SWCY3EbIzGDJNccMdN2IV9dlFFjlxdfVIBQC13WC9XTkHEJVHypHMjtEUpnLYw3rMCu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc5007e661e52f11cc49a.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:7e66:1e52:f11c:c49a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BBF5F2098BD;
	Thu,  3 Sep 2026 08:38:52 +0200 (CEST)
Date: Thu, 3 Sep 2026 08:38:51 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call September 2nd, 2026
Message-ID: <apkV694P17VUQ06j@8bytes.org>
References: <apblv5ak3DL1szvR@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apblv5ak3DL1szvR@8bytes.org>

Meeting Minutes are posted:

	https://github.com/coconut-svsm/governance/pull/122

-Joerg
