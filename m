Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA8172613;
	Wed,  9 Jul 2025 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752062547; cv=none; b=fbRboMlLRBM8vr24VBQUmDHqLxd8nuIAO+QgQ0f/VkCwSnROjWXXar5SU6rcR9/0GisHCK63fNGpUpHOlF45R6hvRBFcj0vf0Xku37VVR/E7OWScfGIGex8xoFQM4Bg/PGYKOJmsglfJGbiRoLflg8fm5XuUMzAyiYU2OSFk1EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752062547; c=relaxed/simple;
	bh=DcubyNld8/UBo+kHavNU9yqx7p6kejGxDkFeRk32dpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Op41Qf99l4axGxamj8euUSYsEBaFzmLMYwGBXOCQdghYY5ZMiP3W0NsRri4clCfhviGvxtFmZhQDYNg9BTy09LKiqEQAM7bxKnw/BfYr8gB4Qf4orfcceRyhcGYKwh3IFTitr68bBWdA/mg1l1bC9Fi+KBii3ojlIGmjonBMH48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=qVpZgpGk; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="qVpZgpGk"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C367B40179;
	Wed,  9 Jul 2025 14:02:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1752062543;
	bh=DcubyNld8/UBo+kHavNU9yqx7p6kejGxDkFeRk32dpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVpZgpGkSOKxQLE0l2rxSxioqBrc1GuaJxbtz4wqI8WbNOGFk2aU6cAKB1mF3MzFy
	 OWhEnfQeAkd4QBvOzKyoj2d4mltcCj6L6d7HH1/e/NM9JlPxkJyYcmtkrYRd/Mm/le
	 RvY1swYxQcRK6Hd0NYmGB7tVARpdTYpLUkwx6FL/fEkY+mWIBZA7YybX0XqlNNLObQ
	 reS/qaDtZRiDxmoOnKVy0h6kVo3xtfjmjqHPPp7BE+hU33lnUi4fNmwRW0a84mIAjg
	 5Wa+gHPQDdyUsIXh8JclqjwON2e14rnn67f8RIGqJB5TN80+uL8DkB83RgmhAvsO9+
	 PBb9ButfFf3gA==
Date: Wed, 9 Jul 2025 14:02:22 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: "Relph, Richard" <richard.relph@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, coconut-svsm@lists.linux.dev, 
	linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call July 2nd, 2025
Message-ID: <dxk7tpe3sebmv55p2izpwe5nr5esqf7rxwtzzmjio5zmzogam4@mdtstwmhvyj2>
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
 <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
 <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
 <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
 <d579919f-6e66-4499-8634-e258af61c933@amd.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d579919f-6e66-4499-8634-e258af61c933@amd.com>

Hi Richard,

On Tue, Jul 08, 2025 at 10:12:09AM -0500, Relph, Richard wrote:
> Jon Lange should weigh in here... he's the expert on this.
> But I believe it would need to be dynamic at run-time.
> Using 'worst case' allocations that might have every page ending up needing
> it's own page state entry leads to excessive memory reservations. While not
> having enough memory leads to fatal errors. Being able start with a
> "reasonable" amount for page state while allowing for expansion later if
> needed is the preferred solution. At least that's what I was hearing last
> Wednesday.

I think it is reasonable to assume that the (Linux) guest will eventually use
all available memory, and thus it makes sense to allocate the page-state
tracking data structure(s) big enough to cover all all guest memory right from
the start.

This eliminates the need for runtime resizing of SVSM memory, which is also
only possible on platforms/configurations that use the SVSM protocol.

Regards,

	Joerg
