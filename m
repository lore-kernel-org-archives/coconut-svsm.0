Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614631DB127;
	Fri,  2 May 2025 06:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746167476; cv=none; b=ihkdUf4mOzE3LCxVkG7p/lh64D10N+TUOOzBvGOVwYHPs8PDOQjBSnucN5UvP9rd7+RbmBziJy+G54yI8Wq0KI0yjsHvn02PAQjVmyNQ3GrgOT0SqA22gNETPD8JgvygOCspb5xmTXKFBx3VB4lDoiw/aJcdX0KtpjRVylAjABY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746167476; c=relaxed/simple;
	bh=EPs1CunF6VE76UmW8lHRhVmfk/ZpQqAp3Ghy8NkWZec=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTOuhumrXFimZn1HJDRNfiGxcB49iW5+o0HzTK44JxIIsJ9xjvwXfE9gtwSBYNFPyBK9AhHuCsq3O2KM0Af9N7qd7tf8FT19FnGVeUD5gnFZ4iuJNyLmZDz3eRFT2YgaBGjm8T6iCgCJ+XNTmzAhIH22EDXZpNmHe9cgjT33jRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=LAyWRPmO; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="LAyWRPmO"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DBB4A49B71;
	Fri,  2 May 2025 08:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1746167466;
	bh=EPs1CunF6VE76UmW8lHRhVmfk/ZpQqAp3Ghy8NkWZec=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=LAyWRPmOHIXFpAM8HOy/21lzPg6HRVeYUwG9YBc/O0BJc1VpvJQrxOBZfdkvYLzM6
	 t0HScZt5DjjyGMcv/HpEMFCE4dbKPfa+Oe+QPEW6EyWUoOsQRDEsOECRranMYKQ1qA
	 U8Zcpwq7l86MkcSe6tvxATft47s2sU5WE8FRY4LWNFMyqLbh43x6J1F3Z4vtReMx8c
	 OPwCplWGP+rsb9BrswEFhwPa+A60guSl6XmIrQM8kngiLi/wCzmivEhIX3pqitGovg
	 eapwTPPfRhYwaRtufvT3vfehMLtw8Ak24DcquDD2ncy1hxyxiHdWKF7ux6lazt+hWd
	 50mraTk+BOWMQ==
Date: Fri, 2 May 2025 08:31:05 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev,
	linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call April 30th, 2025
Message-ID: <aBRmqTan7qWcULjy@8bytes.org>
References: <aBDzsNz2hpkkA23c@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBDzsNz2hpkkA23c@8bytes.org>

Meeting Minutes are now posted in this PR:

	https://github.com/coconut-svsm/governance/pull/55

Have fun!


	Joerg
