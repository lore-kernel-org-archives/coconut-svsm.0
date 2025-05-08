Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3767621D594;
	Thu,  8 May 2025 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693196; cv=none; b=E62jSbHPhbw3Qov9rv2i5aaMrzAyWVQYkXx37YOHFCKstFnocD1wogXgVSp9smlhijq0QT+aPz+pQRL2GwNld84+m53JxK1OYiwkDFI0BBiY9KVhKi5EJzz9azVtiJaLvLlbMPvBzKzmSD405Q79dJVsvQtNrKPw1scILAQJbiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693196; c=relaxed/simple;
	bh=CbvrT8AOwBaE8P7M3TTnReNuntpFCznCWHNjmNniYAQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRLfl1k8+b4d8l2ylH/0bwk+NgJU+YglrI47Nl+Xk9umRYqJH8KpPHaNSYlYcBQ6xpm+R/wqJwrIa77n639rqHvxRJtPLDlJV1j8zMgRHpbDcvHgtCjqxgdhNmmugfo0WIJ7t6vb56WseSFY4HMjopcbAjfLDpkQsBX7HRGdNrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=ahRi9NjL; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="ahRi9NjL"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7306B4A6EB;
	Thu,  8 May 2025 10:33:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1746693187;
	bh=CbvrT8AOwBaE8P7M3TTnReNuntpFCznCWHNjmNniYAQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ahRi9NjLsYjdDQfXYFQ/m97/SqdwzDZbTHVv4CR2RRLXezzzn9wSaz0k18jEBBhFm
	 yv9peSg3BabtINeUSpah2ZBWz8eb2c3qF/Vdlz3u3TgaLEB6209hNAUIbXTCF5FKiN
	 lkSj4WRXYJYKavQHNaoiEJQq1mRWzu58LV4LH+2xvy1o+GdYX6xh6q/Z7wWBbCuiKR
	 qB6CWLRpYJouSxB7QOjxuoFCUpcEO57fU7oA/XjCfERLoWSoAkjih2NEyKxuMtWD6R
	 BeNe8HWUjBrdr6S2eez2V00Y1woJccG17zdy2LBZ1VTxm1LSfGowYrYzargZOT0/EW
	 /qZPMg3WFHKbg==
Date: Thu, 8 May 2025 10:33:06 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev,
	linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call May 7th, 2025
Message-ID: <aBxsQqqOoFiM_xrE@8bytes.org>
References: <aBotemx_JthzO9FG@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBotemx_JthzO9FG@8bytes.org>

Meeting minutes are now available in this PR:

	https://github.com/coconut-svsm/governance/pull/57

Have fun!

	Joerg
