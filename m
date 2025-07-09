Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E379522538F
	for <coconut-svsm@lists.linux.dev>; Wed,  9 Jul 2025 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752064764; cv=none; b=u3EHeGCtLhv+VfQMDWeGL8ImTbORR3BeN0XhVOSjCqw/RNl6jKZUJb1o5xfvnKkRuUJf0+CVSfQ6ZzLOhnJaFGWcIlIn8iAkuxgVhwxcXp9snziZy6krZ13clMI4OvzVW9FYvytXISeQgFHEpQZbTgy6uGLkmf0TKYgKbQQseGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752064764; c=relaxed/simple;
	bh=0AP4EaC3V3VsELhdAMg0xqe6pQHtyKdEAGQ8b3/bA8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/74XRgY7vhjpFvJmyAzy4A3p7a/Jz3zlqoEzkpZMxMkM8P/aq3Shb1P5SGDYazKLT0kjePs/8eT/tj+EvnupotdCmi1aHnfvEUC8vXc0s2xUA2xGgxJsnji+1VMYClxUvSovrQbllzsl14G+QWD9u+vBYUtQIvj3dDoqQSks2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=MFxQZQaw; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="MFxQZQaw"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 73D8E500CA;
	Wed,  9 Jul 2025 14:39:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1752064760;
	bh=0AP4EaC3V3VsELhdAMg0xqe6pQHtyKdEAGQ8b3/bA8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFxQZQawfGgdGjQXsQHAJp8IBmFQtzoZOLznhYgQqIr4PK6KQdqYV9gEBbt4shrlQ
	 Hxh2f+prdAPuDYg/ugiURZW2AQEI6tyf4CiXRdCWYWs7LFLzKlxAxwDW2ggvWohpES
	 kId1ieTvNcKSpUCETmhhQjJCxJ/+vEcFRVJcK/ZIKlS+LEFaVXJ4RhcgarJeuggnZX
	 h7omZOWgPaKYOR2KXf6jvuqh1sOQbI6XnuctlgTvHhdB1e5Cql9idC7klWuwzZJpoV
	 YCy3YpuEl+Y3K44mDpFUJyq8hqcg1FMqQ2/XIiH5rGXFyiGVCvUnl/aiLiI5rewyIs
	 ubo1ZXk8KGlPg==
Date: Wed, 9 Jul 2025 14:39:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jakub =?utf-8?B?UsWvxb5pxI1rYQ==?= <jakub.ruzicka@matfyz.cz>
Cc: "Gupta, Pankaj" <pankaj.gupta@amd.com>, coconut-svsm@lists.linux.dev, 
	thomas.lendacky@amd.com, sgarzare@redhat.com, John Allen <john.allen@amd.com>
Subject: Re: Steps towards live migration
Message-ID: <tz3gzwopx6wfex4nccetfftzxfdlwa5hsur37tc22rapmd6kw7@lb54bqxz4vzu>
References: <DAXD0VKXZ7KH.2WNLX124KC7HZ@matfyz.cz>
 <232c21fc-33d9-49cc-ba82-fa02e5a699d7@amd.com>
 <DB6PZTUMQLGW.2H9XI9IDV2UV4@matfyz.cz>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB6PZTUMQLGW.2H9XI9IDV2UV4@matfyz.cz>

Hi Jakub,

Thanks a lot for working on this and bringing your results to the COCONUT-SVSM
community. Live migration for confidential VMs is a much wanted feature and any
helping hand to make it happen is appreciated!

On Tue, Jul 08, 2025 at 03:49:48PM +0200, Jakub Růžička wrote:
> There is no comprehensive design document at the moment.

Before any code can be merged, a couple of fundamental questions need to be
answered, e.g.:

	* What are the security guarantees for SVSM-based live migration?
	* How is continuity in the attestation chain achieved?
	* Which platforms are in scope for live migration support?
	* Is SVSM live migration code generic or hypervisor-specific?

I think that the discussion should focus on these questions for now, because
they are fundamental and heavily influence how the code and the VMM/SVSM
interface will look like.

Having a design document that tries to answer the above questions would be a
great start for the discussion.

Kind regards,

     Joerg
