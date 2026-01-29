Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7CC33B6D0
	for <coconut-svsm@lists.linux.dev>; Thu, 29 Jan 2026 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682240; cv=none; b=R4fHGT1JZsKC9UHMZytrFDXk9Ov1EF0Qbi+s2n8bfEQ4kdDg0yk+K3DP00z9Udrlv7VP7RNNkweSE7FqdmZNSXMiOs0tCBTkFDJLm6ppdnanixd36Co/Rdw7yEE3WNoaKTpDwJunHwTUfd2CoRRCsOJzh5Hfz4lx3lrqCF7OFGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682240; c=relaxed/simple;
	bh=JQN4dMwPYhmVDnftZbuApVt6PD4HIX4wOckPBKhLpnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jw+raPaoDJ7EZwtm2gGbirU31YrvNb2XA86HjzYyhO/q/dKXduRWJS6GvAXyli3yxBt6QUJw8INEUPyajehNjgoOhl6pSVNQwqHqjGhRL5hgpFtOiU8Ua92LDb4tWBToogyAA9QrljqDZm5+HpBZISKyYqr2at0hOriT16l5OSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=g7zma7k/; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="g7zma7k/"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B67A51C0A37;
	Thu, 29 Jan 2026 11:23:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769682237;
	bh=JQN4dMwPYhmVDnftZbuApVt6PD4HIX4wOckPBKhLpnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7zma7k/QkNpnGQ2ahaOQKNnOnGSL1xMNXYD/JMr+8X6CrWY69PrLMDHHmb9llFFb
	 Xs9/DDa5hd5a1HoT7rgRIYjKzEDSR2y57EybQURhBzn67S5VSZc2rg/LDblURzUz8h
	 tztBDLaTkJNLhxMyD9mRiw6/HVet5wxetovsd2knvnLDtFvB/6wCc4THdwr63NgJ5q
	 GqtbcjfV9iSmmF38nWQUHLMQ9zf6StVPl3izRpeLNcnjqH45QcAhBc6ysQNKNeC/Xc
	 iV7zc94rhfqiRdSZXRbXRC+LDz803aj36LoBbqcM/x5eIg9W6VxSDzj498e1k8hmzJ
	 d8G+LCNrrNfWA==
Date: Thu, 29 Jan 2026 11:23:56 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Luigi Leonardi <leonardi@redhat.com>
Cc: coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
Subject: Re: [GSoC 2026] PCID Support for COCONUT-SVSM
Message-ID: <h4gdazo7ojl4ubm2pohlsdbfmpmx56xbpmzzzllwvuovakczu4@k2x7gwrfbtrr>
References: <20260121144151.37812-1-joro@8bytes.org>
 <20260121144151.37812-3-joro@8bytes.org>
 <aXssgQwnTkX7C2pO@leonardi-redhat>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXssgQwnTkX7C2pO@leonardi-redhat>

On Thu, Jan 29, 2026 at 10:52:34AM +0100, Luigi Leonardi wrote:
> On Wed, Jan 21, 2026 at 03:41:51PM +0100, Jörg Rödel wrote:
> > === Support X86 Process Context Identifiers (PCID) in COCONUT-SVSM ===
> 
> I'm available to help co-mentor this project.

Great, thanks Luigi!

-Joerg
