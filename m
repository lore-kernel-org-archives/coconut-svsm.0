Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0947286323;
	Fri, 27 Mar 2026 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614622; cv=none; b=KE/JA8mrfNlqwiU0h+0iHIQaJYkBUlcU2JsA1tfptyFWqUhFw41RpqUM3kmQ/H0xiVdMyj9lYv0MY7t+DOuXt/8C2W82apsjBbAauSYbJchOcSXxnox8rMASv9iS8naun/3+vB/pA/PViRv/X91BDpUZnO0K6ZH1JFeknE5UPdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614622; c=relaxed/simple;
	bh=3s65BB5DRam2+mdQcILw+b61XvINglDM+apNYleZSqc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbGZUv6hQrJs/NYmJkCwNZlfzOjUIFVfXkib1wbfHtYD1Y/G2c0tJ0iQjEhNQmbwO9QlaEHrKmbCi6aN6I++lOiJP0B4TecLA2mVRadY854i/fPBYpUWahJK18A08+13b8ze3+2Z2HsO1TIUp16a+E46u2ESr0AYdULE2Usmmcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=kI3yRDG+; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="kI3yRDG+"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9B16B1A6679;
	Fri, 27 Mar 2026 13:30:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1774614619;
	bh=3s65BB5DRam2+mdQcILw+b61XvINglDM+apNYleZSqc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=kI3yRDG+3os9ekSZUthGJK+VMYbyliRI5aNNPC37vkEQ6F3f4HCt2/yV+D36+fkUV
	 Ne+uRpVt7gSso6ol8FZPKZa6A2wMDo/EFMsNXazFEZSVPEAK49TnL/FH/B/e/3WtjO
	 Dfkh1QH37EyXZ+B+yrG6a42qqDXw4kYZixlZJ/+f+/C9v52n/WsGi8vK2pNfCRUOq0
	 O4MvfUIV5+LRKB9LsImyfNCYppQ+UP0DP9OnmJL8avWXuDZarLemEZs6//G1wrUVNO
	 ra/CFyeVpXb9YlQE+/uVhxd+DwSXL7KmMZjeRD2PECldqPGwwVKuI5zyeuPbss5AuR
	 S3isSvyjxvUUQ==
Date: Fri, 27 Mar 2026 13:30:18 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call March 25, 2026
Message-ID: <o7xvnxnrjvpqgi3uxgko53uopq72qhiamgp4f7fytuntawzgbd@tpxzd7sowrcd>
References: <iuafzrd25l3whbifc3m7tcxf2bq3hqe4bymuwrqhtpmcujipfc@2qxd6c547gz2>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iuafzrd25l3whbifc3m7tcxf2bq3hqe4bymuwrqhtpmcujipfc@2qxd6c547gz2>

Meeting minutes are ready for review:

	https://github.com/coconut-svsm/governance/pull/101

-Joerg
