Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C728412C06;
	Wed,  2 Sep 2026 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340728; cv=none; b=TikNNxqEBUyg1JvwJeY8l78wjJuXvwMf+BGSsFrhHzD2I/GocleC5aMxL+X1RF7RfY7BGBHPACske/r2Wh8YU8o3P+cuoE/Cy+udBzuNU+E2/hP3LfTsLNTDGa86hgpaYmrXixLsdE5AvMb+RGXDWEsony5ZSiM2Msx1sw7wuwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340728; c=relaxed/simple;
	bh=bK1uyBGLjKny9BptSYOss7TlfA3O4Oxf+kSyppApbMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GM24Aark/ibXi/wYoVn2X37UKAZxGkJQ5XLw3Eb8xkmSntTBGZ7sgKWa3+2OxWIot+CtTJuH3pP6EqrMnIkPxAkDY2DUhqgTltsBSYl17fTGHQgLH5aEtDRUe4oThUhW9Z9BHVcEzf/x6nC1B4wBxtJj0y08oMtiZM4J4RwnWyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc500788a0bff13059f5e.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:788a:bff:1305:9f5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 404C52064C4;
	Wed,  2 Sep 2026 11:18:39 +0200 (CEST)
Date: Wed, 2 Sep 2026 11:18:38 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Liam Merwick <liam.merwick@oracle.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM: Updated Linux and QEMU branches available for testing
Message-ID: <apfpXc1bKIG9dCwX@8bytes.org>
References: <apBelv6Ev-lCQ64J@8bytes.org>
 <b1cfe9d8-4f29-42f0-b3ac-312724250d0c@oracle.com>
 <apWcYdRjTeZF5vtH@8bytes.org>
 <cc95e357-00da-456b-a41a-357ddc857d17@oracle.com>
 <091149f3-c278-4699-8f8a-e99ab0e548de@oracle.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <091149f3-c278-4699-8f8a-e99ab0e548de@oracle.com>

Hi Liam,

On Wed, Sep 02, 2026 at 12:00:54AM +0100, Liam Merwick wrote:
> Another data point. The machine I encountered this issue is a Genoa
> machine. I did a fresh install on a Turin and another Genoa and those
> do not reproduce the issue - the latest SVSM branches work on those.

I pushed a fix to the svsm-v7.2 branch of

	https://github.com/coconut-svsm/qemu

Did you test with this latest version of QEMU on the failing Genoa machine? For
reference, the HEAD points at commit 5c1c05b2c3aa0dd1248e0cf58e401626e30887f8.

-Joerg
