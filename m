Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAE23B5304;
	Wed, 26 Aug 2026 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787776425; cv=none; b=CNbUdyttx3+e67qWOefGcb95krnY/LIlalpKYk15WJVFRr7bn07XkLRarUPtdQGxIT8CZxmwp8XdaCcwY84af+dUQZNQPiedZ3HIhaGmq57H3WGw93+YEGlbA6xvObSYJapLL6JFV5oaNgbr+Ad57V8GrS+WArV+A/xGvI7yjYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787776425; c=relaxed/simple;
	bh=Zf9tkJBCIfogBPPFDQmV3+9+B1WuaplhB+BzymrUVa8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOKhE0k5oTg5eVTLZHJ4IM1lFKuFmlVRwLWnTTuBTGTvsedbcJL0SMDWzpFbEo7AmPkHcuroibjqj9/bHlrgPPdqf6duZVTBsmTAjrHf5ycKwX0VDXYBS1u4PyBZ784f3OpLau6OQjmARGvLzV9y+d3W0JJs5CtiK2PWQ3DwhAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc5005afac8421fbddde7.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:5afa:c842:1fbd:dde7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B94312088CE;
	Wed, 26 Aug 2026 22:26:20 +0200 (CEST)
Date: Wed, 26 Aug 2026 22:26:18 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call August 26th, 2026
Message-ID: <ao9Lojgdqb-t8Fzs@8bytes.org>
References: <ao3FKVJEdDyL3Ax4@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao3FKVJEdDyL3Ax4@8bytes.org>

Meeting minutes are here:

	https://github.com/coconut-svsm/governance/pull/121

-Joerg
