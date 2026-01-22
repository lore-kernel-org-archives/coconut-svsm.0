Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7363E8C4B
	for <coconut-svsm@lists.linux.dev>; Thu, 22 Jan 2026 11:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082565; cv=none; b=r0AFgBNIxj7sbKqwMTEP51+ZobuY45RkBZ95Eyl8r2rQqUBCS6Z0qanrYjdo0JUBP2d/v5BXnQl+HpTsyznohrc6QY3DpmjgPtqwfF/kKuEIgaLxZeQdCl9561Aog2uhNe6mm02YjkrBXl96RHOE8jrKguTGkZX4+H4MV3Fi7CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082565; c=relaxed/simple;
	bh=heLBdpqDGGoP4OihkLsjq5uEhRiVEwjSpumXIoHJWxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9XcodOrp5LV7SptX/RTzjiUA2xFLLCqqwNfm47VyhggSQGRfHfnMpJztELDo6Lc3alaYI2Bl9AT5DF1pnpP8lg7QEvLLJQWQ7zxds3YwYE3tAj9Ku+BfiVOWQ7TbSE5XpFzF0UIBAN+iVWh6yRC1xCakkbf3FRQiFVKNxV97eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=f6LIFovq; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="f6LIFovq"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 52FAA1C04C5;
	Thu, 22 Jan 2026 12:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769082561;
	bh=heLBdpqDGGoP4OihkLsjq5uEhRiVEwjSpumXIoHJWxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6LIFovq+Yd/LF50Kx1JwUHjdxgaMOsaurds8USp38ALCCWZ9wnDrUzMOtdFC+PLp
	 77t0KyREMpuCdSZjJwQQ1f/uyKN4z7SdzDU1BJspIxpuYTkocm056QIaCLz95yXgtI
	 5FevBDnSPPN9I6NuTGo074+ggHJ+HMSXMW+VUqK0m3TubFzwzFhQ0mcZd0428ls8yi
	 vDwDwXrUlunyO3eO6IQxDitrF9s5hWmP7UoAYAS+x+Z3NhwLQ4Dap7u+kDc0oMvwOz
	 RdguX/xXQvT/sdsfgzzJhlXHk6SrA29VwWQaGougktxUZMwxunAh4kFAG4BjAUxtZE
	 qqGlHDK2rHOag==
Date: Thu, 22 Jan 2026 12:49:20 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Cc: Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>
Subject: Re: Move to Rust 2024 and January dev release
Message-ID: <ki6sr4uf4fynkdtazb3mes7sixc4geimofvjjdqn2pro4fbstz@mnpijppp36oo>
References: <ksdawsdemi3erury5izljbhvronldlt23qez5jawcjgo3aojbr@b6swic4sw2kq>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ksdawsdemi3erury5izljbhvronldlt23qez5jawcjgo3aojbr@b6swic4sw2kq>

On Wed, Jan 21, 2026 at 11:57:10AM +0100, Jörg Rödel wrote:
> I plan to merge Carlos' PR to adapt the Rust 2024 edition into the COCONUT-SVSM
> repository. There is a chance that other pending PRs need to be re-based after
> the change, so if you have pending PRs please keep an eye open for the change
> and re-test your changes with Rust 2024.

I just merged the PR and the SVSM repository is now using the Rust 2024
edition. Thanks Carlos for all the work on that and I am happy that this is now
over the finish line.

For the long-term gain we get from that change we have to go through some
short-term pain now, so I am asking everyone to please rebase your pending PRs
to the latest HEAD to adapt them to the newer Rust edition (as discussed in
yesterdays SVSM call).

Thanks,

	Joerg
