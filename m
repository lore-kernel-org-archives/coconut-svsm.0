Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B242DA751
	for <coconut-svsm@lists.linux.dev>; Fri, 13 Jun 2025 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803929; cv=none; b=YurTx/BftDrc/Xa0wZDWM5c0eYEo8aGncg6TSJbmQT4vmFIeDCy/CCk26BoKYDQQv7KNkft1n2vhUpguB5cDMsUHnc+JLU0LEGV2fnYFNs/M4XBhGbPYoicyJhjAnKzw2aEpk3ZbPn63qbbWq2Neuf6nZqP1W9etlJ/rJWtbKc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803929; c=relaxed/simple;
	bh=DDvxEocCCmgQ0X4Jen5MwIFOHlVTp1l4XYPM+VsNMbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3ahbi+gDed++Y9/vgJuHv9dudLHlO/a2VdRxC+XTDRN9ctXKT3loLfcMd/YtaIMo6uKBBiR5US6bPsY9+uUzyVr3i0uRMMiuC/EFzlG4tnfbu514BpbTU5z9g6M5J+0z0z+6x6mEgBVxffm6VU7XOqsrVl2iI1GHfJ/2P483e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=kR67rkq8; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="kR67rkq8"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1FA9F4DAF1;
	Fri, 13 Jun 2025 10:38:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1749803919;
	bh=DDvxEocCCmgQ0X4Jen5MwIFOHlVTp1l4XYPM+VsNMbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kR67rkq82Q1XJinvCe0W5U0ZqCvyvX9LTKRa34rOcck1TlfOgbrfwBy/vi7SOUad4
	 XuT5KjkwVw88bv7w77m18P/XHZ6ht2EayMOhoa3n2IzGHprcCeeRC+n2AcrYRCEDET
	 /0xsW9QY5LcxJUd5k1DrD4MAy7O2WIqfQJAtjy4v8MhZpDPykY8t2/R+ujsvOC3hmd
	 qG7u04Vr+7kMA52D3hnCAcOWUjdvZOmzLkpaY+jo602UTlqK0iJLev9CeOOxkTX1YX
	 27xMuk6tPyQSyaZGApg6UL1yFXTEC8p01/aa1pK/cwtVVgLfKDM3a54hJgnyPw2vej
	 B8H7mYKgOwgeA==
Date: Fri, 13 Jun 2025 10:38:38 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: coconut-svsm@lists.linux.dev
Subject: Re: Custom CI runners in Kata container
Message-ID: <hjpfhokxqsog25l7akyqcznv7uv4c3orhq7u63uxh37izluv6h@gw3s3na7dlej>
References: <CAGxU2F4Mxc_s8bUejyNLUiGmiJxu-V4LcxZ6jQaELMageucQcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F4Mxc_s8bUejyNLUiGmiJxu-V4LcxZ6jQaELMageucQcQ@mail.gmail.com>

Hi Stefano,

On Wed, May 21, 2025 at 03:17:59PM +0200, Stefano Garzarella wrote:
> as we discussed some weeks ago, I pinged Fabiano Fidencio of the Kata
> community about their CI.
> 
> He told me that for now they use runners on machines provided by
> AMD/Intel to run GitHub jobs and test SEV-SNP/TDX related features.

Thanks for looking into this! However we decide to proceed here, there will be
some disadvantages.

> He recommended we take a look at OVHCloud if we have the ability to
> expense through CCC, because it might be easier to maintain.
> Particularly if there's downtime, there should be customer service
> ready to fix them quickly, which we certainly can't require if the HW
> vendors donate us access to a few machines.
> 
> If we still want to ask HW vendors, I can ask the Kata community to
> share some contacts with us to see if we can get machines.

I am a bit hesitant with the expense-way of getting CI hardware, because it
requires someone to pay the bill in advance before it can be expensed. On the
other side you are right about the customer service we could rely on.

This is something we could not rely on for gifted resources, of course. But
still I'd like to pursue this route first, we can still change gears if it
turns out too unreliable for us.

Regards,

	Joerg
