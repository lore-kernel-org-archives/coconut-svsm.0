Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A08E383C81;
	Wed, 15 Apr 2026 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776285584; cv=none; b=s9Ja10UHffm5KOSuU6Tuonxt8S5KbKm6P9aUsy6JqPN5ZawTdDW2prPn4KKRlXd8rcFj5W4Dvegl3cLauPfsYNhlC0gj4iC36geaB+hLpXAdlfUEJ35WxhQM3O0r4ZvYLrpb3yVBYVKs8u3kENIAV9s0C9RVAGhLHuHTXG6V3ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776285584; c=relaxed/simple;
	bh=HI4MnG/igL3sUJSm7NZ5hoiH5iPSaHcaxwfKDiuFx3g=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDZtLtPFq0ZBwGlP4kLhziibbYjz4n+mvWxs+j5EWWhbsKS1eTgJLLm0jRne8ZkUUHOXpUB5giZ83/9AVn7c3k3ndT/MVXrImkE0UNIQEk2kXJgqjSjEBvwQ62JULUX+s/ldCWILQD3i708MY/98QlAD3yEN3dckvdLMCk6gkA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=NcCKpEFI; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="NcCKpEFI"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8204C1C274A;
	Wed, 15 Apr 2026 22:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1776285576;
	bh=HI4MnG/igL3sUJSm7NZ5hoiH5iPSaHcaxwfKDiuFx3g=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=NcCKpEFIPMi/2RHc0hrJ2h1mlzkXHEl1pv4lj59PHzvTYWVCO0ZRo0uaEnJzrFBmu
	 3GHOQicSr+W3/ATXrmI51RqdkW4kvG1Q4rbtnPkpURNjaP5CJ50ICdKW2XJv/5HJND
	 OG/WHseMOWMFeu6DqwPnDkGNJQW/t+CBu+O2WokIyk30GW2eQZroiTnV2uv1mSL7E3
	 4UYCGJMsR6LGXowWnTkPlg1hqaYBn0vrHWUgkwidYgfZ96tFSQFGxJXOJuzj3ywcRu
	 EJSYYq7Fw5n6Xu7C85ScDtS1xUDNHp5gGCwOzhgi/hUCFgcXck3RYCd0Tj4q1Vru7H
	 uhHFcL/ysM2cQ==
Date: Wed, 15 Apr 2026 22:39:34 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call April 15, 2026
Message-ID: <v2w342om4zobxfrmciznp4h5qncpksv2ucntzyfrb7cp54agpj@7ypyqs2odshi>
References: <ek6soyyk2yocghq6eb23unh4cfyzmhf5zf4ez5a3bo6fr2obi3@fwxk4wu6w4vn>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ek6soyyk2yocghq6eb23unh4cfyzmhf5zf4ez5a3bo6fr2obi3@fwxk4wu6w4vn>

Meeting notes are ready:

	https://github.com/coconut-svsm/governance/pull/104

-Joerg
