Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E94BA36;
	Sun,  8 Jun 2025 12:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749385887; cv=none; b=cS9kSEbRr1CC4kfW7AKx0da0T2G6v4tl05/0t5LWpGgo2CzwULBkV2y6M+qHYRHc4Gn+E7ULAiesBM/vGimI70tGrR0lV9wS08g0E+Kg8y6aSXLDsOQ4zUq4r4qxywUouFKsoGX+lVOiWz7ZJpxixR3fJz0+NzFfrcgKrUxjHa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749385887; c=relaxed/simple;
	bh=VlHygrH4H5y+cTisN3Gu/HMNEeuVKKPIJKX8MQoZw7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyP6s58ll6rlJ4WI7KwbS0Untf8ePpao84pucCEtWHozCoyIGn+oU3ELxvucewDqLGRtXWHjfiaLumXvW38jL8Y8VbQ0wk4VowrkbBW3TvoyjKnlKc2GXowgX09m8Cz2l6RF5pl/2O2qQo7VywqgfNdQE1+zehXjdQwJfRP+q2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=ha1CXj61; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="ha1CXj61"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 854814CCDA;
	Sun,  8 Jun 2025 14:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1749385877;
	bh=VlHygrH4H5y+cTisN3Gu/HMNEeuVKKPIJKX8MQoZw7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ha1CXj61m5gJ1jfdAcEkmQD09OfIUHSQNL58+8lHlUZqfrtRLLx1BL/vCvFhNn+wR
	 UQ1aeJSxPiVd71XEp4+ytDPY6K6XNBJSlP4I8X1KcSfRiTwQCOb7BFlbhP+l+HQpSC
	 /ODE9pK6phhFjdWQlDh2kGHEpHZEGUwYIDIwLbgt+NJhUAVEMRila4Eyqy7MVj+QCu
	 3sm3a7rMcXuxBXi77LoY7i1MhCD433n29bmuZVT9LfJ5O9382cMo1bOkc6t/qmbzX6
	 SwHXblhunqcQfLwZ+WLj0nx6Rzz7kUo9SAjPLjbQyW0O08FwX65UB8FzQDocJKEgKG
	 RI7ZRJOSVffKQ==
Date: Sun, 8 Jun 2025 14:31:16 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: SVSM Development Call June 4th, 2025
Message-ID: <ntf4bpbin4yuzzwo5jhhc4alzopusc3n3lemccygrkxhyvktx7@rpw7vrjgdlwa>
References: <qiyips6sim6wocgiqse7fjzy4xltkfd3raj4xchjqdlzupegsg@xfgj7iwj3a5x>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qiyips6sim6wocgiqse7fjzy4xltkfd3raj4xchjqdlzupegsg@xfgj7iwj3a5x>

Minutes are now posted in this PR:

	https://github.com/coconut-svsm/governance/pull/61

Regards,

	Joerg
