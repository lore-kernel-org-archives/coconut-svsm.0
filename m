Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618473EB80E;
	Mon, 27 Jul 2026 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151264; cv=none; b=Qb2kiztByqX/lsQr535E/uoFUQRz4QMo1ATXWxGU7glsjJ84oXSPcbfp8mANR7LCBjqCTGTurWaXGA9N8tpjYCq45QoHH96HHFy6lZnaqLznW1c3CCZl0iIE+NGQpqWJUtlQUDt2U5wIq0TjjE4DD+giUlnZyYGV+Uo9jgx9mUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151264; c=relaxed/simple;
	bh=TrPxqFhSrg/g7OLjUrUNoJnRoZ3It55mzjGgNESWyRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJk6sa5/BaH+tojIoWELQ2gFlqCGCAmeOufoGJduJUhzx368KJJvFTd3EtreM4a59kSeLKZLGCQcHGhGxkzlG8WRksdYR5GxZi1L5QV3BzxqrnbwfgmtXMqt2IaiJZrxCl4Fiug9b7iQq49natb2z0HSey0EyxFXf92s0mdESPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc500ebaed89d31e83d28.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:ebae:d89d:31e8:3d28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 001662409C1;
	Mon, 27 Jul 2026 13:21:00 +0200 (CEST)
Date: Mon, 27 Jul 2026 13:20:59 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call July 22nd, 2026
Message-ID: <amc-4PUaf39ZALPi@8bytes.org>
References: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
 <CAGxU2F6ko6Ojyu138cB7szTszoYkx1AEw5oK6EMMaUoi=m7+sw@mail.gmail.com>
 <CAGxU2F5EtQ7tnF28i3Z3onJYMf30OBCBCz9piTinK013sh+Eig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F5EtQ7tnF28i3Z3onJYMf30OBCBCz9piTinK013sh+Eig@mail.gmail.com>

Meeting minutes for the calls on July 14 and 21 are now available:

	https://github.com/coconut-svsm/governance/pull/116

-Joerg
