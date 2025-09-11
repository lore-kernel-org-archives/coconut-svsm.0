Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5873570C5;
	Thu, 11 Sep 2025 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757609002; cv=none; b=nTk4aJ9mQZeVBAw3gf3RnI1vC+PRd98tQyix1tbpAa+PzCRTq3GBfVpELnjdxdktds19+3919GDjHNN42JSRFD+QwARM6EQ+UV9TMcPsZlFKCkVBOL+jPgdkTL1d4U3FdZG+LtGP2LNQnqSivgSHlBk8XUM3r69IZEvqnbuMfUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757609002; c=relaxed/simple;
	bh=D26C9qOUnnC1BhvQEQk+MXysVaAWEMLHGOi3kBlS2As=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/LeBlaXu42/9NpDUFBF7+yorKPHo2WsekGPxGBOU0XKEENPhsIjBeTOQ2CWVywSGBa0Vk6y1mKDP5JS0+8NF4knXITAOpnOMYwShPnTCbzhFgxaJc0xXsFfG+9hvkWd+FeNx8phA8zJssNLkWiZoKv0B8GVhXlGoOUoUKFZVsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=0122ui6J; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="0122ui6J"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 6D581552DB;
	Thu, 11 Sep 2025 18:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1757608991;
	bh=D26C9qOUnnC1BhvQEQk+MXysVaAWEMLHGOi3kBlS2As=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=0122ui6JtkOq2A5HqYRB4bBzxhVjNJJ/SLeUQTlMTMnDmTsqIT5E/sS+p33MWoneG
	 CppSnC6OHMw1KM9N7sVYmpWn0IM6x90Uy8+auTTUtSciVYSBtNWWCJzLK1oEN0VnlF
	 lnm0IGBmPwxh5DDfnhqVLwgbpGuWQJ95HKUVSw27MOzVbyc5MbSF0ZTFYBSCaTkjnc
	 /GdlvDRuk4mPfgxOEcav2Mj89O8XGUikAjgH5t/oVj0wscSB+ODUWpW5yZLer6G0Qm
	 mnMCTZHpGf9TotKW1CEgsfNLtRT3/Gh8xGB2V/gLeGOKJawItnCwGw9xAv3kiYyaDt
	 SetZLS9QRbtbQ==
Date: Thu, 11 Sep 2025 18:43:07 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call September 10th, 2025
Message-ID: <jlq36usfe37msiplnejljtpgttdagvkqtdgsulirhy4msb3wf6@46gt7t5w4idg>
References: <2u3l6vuoby5ffds63pzlqzmxzqylk2aklv2znb6wkxhjhpgek2@mb5xxsx2r2bp>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2u3l6vuoby5ffds63pzlqzmxzqylk2aklv2znb6wkxhjhpgek2@mb5xxsx2r2bp>

Meeting minutes for September 3rd and 10th are now available:

	https://github.com/coconut-svsm/governance/pull/74

Regards,

	Joerg
