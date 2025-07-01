Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA9B264A95;
	Tue,  1 Jul 2025 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401129; cv=none; b=eQ5Jpp+uOOrmYf3n4ovBTU737Z6LTNnYeOzUIlWSNWxYGCr0xGkVg2XL4QqC0+8AChkLFgebRby33JdUuLgMugKIiDY+sl6V4RJXQdUZD80hngguFxDr9APZz9VMvh/PAJYqIrm8eke5yXMJn3oyP62dsApQc53lzdEQfniZZ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401129; c=relaxed/simple;
	bh=PDaOeYyCcqodpHyiL5U+31YQ+wJY6l4ncsFR6tyzBPI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A3OBW4Z/9vSP922yiJthD///Uk3wJrh20nU/1P5RFicTlJXj9PStnOlXr/EI2YdOY1TmIrq4KaMJssYeykFFy7D/U2yOweYFASIim/t5ITpLiAUQKAyrKTtKZ+KuAyJ3TqXfqHyFa79UEqa9TZEfFCzLMgt9h/mSjSJPEXdAEy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=sgmZpg0a; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="sgmZpg0a"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B635C4F036;
	Tue,  1 Jul 2025 22:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751401119;
	bh=PDaOeYyCcqodpHyiL5U+31YQ+wJY6l4ncsFR6tyzBPI=;
	h=Date:From:To:Subject:From;
	b=sgmZpg0asWadXnkUtDkXHVaLkL+3BFZN7kwSnVSqa4B+qmdKF7Yjm6CkJaAEUBlOx
	 92/OQx/k9Umo47Noj7MroSuw5U8MPZy5UyDcRyqTOns3QW4B+cD7JVAPuBEUEGqDxz
	 IrXxSzmMTeK7Mla7b2vqKIuQYvWpVkPKschZY/7YS6m/XQXIfU0RiYiTeKL8Zoyn89
	 RZ6QZm9SriQ/Vqk+lu+vngxj37hi0YnX2GR4foQlwEIsD/PlNZdu2PGVJg0IkkeoYc
	 18H8xA0NuW7fjcVtwhuqiS4ge5kthWDU+rVg4870mtW1itwZaA6jiMZ3HhLQY9rbOq
	 +SXAU+T8JjD/g==
Date: Tue, 1 Jul 2025 22:18:38 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call July 2nd, 2025
Message-ID: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
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

Here is the usual call for agenda items for the this weeks SVSM
development call.  Please send me any agenda items you have in mind or
raise them in the meeting.

Currently on the agenda:

	* Update on Hardware for CI.
	* Follow-up on the Live Migration discussion from last week.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
