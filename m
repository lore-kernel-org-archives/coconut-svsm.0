Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F2A23EA8A;
	Tue,  6 Jan 2026 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719886; cv=none; b=GyVylHW6De+jJY8U7ETYfoFCW8v0pa1J02V8IJm24A2OIYej1DKdD32YczMe+wVQFwpbm2BAjENJUivkpaNE6gdcDktVu9tWyNlGjugq6yn7aiHohf9L3JiDmsM6dVrw0dC45yR1q5Syy3qHixJKBeoViJhBFUwYOxYcbK4+1bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719886; c=relaxed/simple;
	bh=qShT6tJnsyz3EGc2G8zd5A8deOkgBppzYdpk2n+HJE8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yl1vFFgsXb5RmBeZqoqvb3+D3RYM0p7r1pT8SgGVyGw11upNxgnOrLLrq9ED0R9Uyvd9nBv3aTSoVWHk5xqPLnB4Dw4Odogk0p4BCPuYefglCCUprA/pOZoq9feH532t5pcwpScvdPlTDuL9xvxZuduC+bG6z/B0vE1iQ5/ZPFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Wyd3JLfG; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Wyd3JLfG"
Received: from 8bytes.org (p200300f6af1d960049fb4393cf547e2c.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:49fb:4393:cf54:7e2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DF5CB5E932;
	Tue,  6 Jan 2026 18:12:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1767719528;
	bh=qShT6tJnsyz3EGc2G8zd5A8deOkgBppzYdpk2n+HJE8=;
	h=Date:From:To:Subject:From;
	b=Wyd3JLfGDvTSAi7F1G8FcMYOzxVpNs1vQdi8ldIP0Csb06FqmK7vCq5Kh5Rec/sNf
	 PgsQvQ35dF66i1CXOo7VY768QF6a/vnh4DC9KUtc9MnRbn8YEldFKv2UrRJnVcvAiD
	 MDXc6fWWZQGc1L6UK5kIygyuKqh+znuONF6dVkuWbXQ04NyQfckJet3rJF6cxjsjLu
	 a4lVZhRzRzfwmSdg5DZ4vW8HYUOpJYYHcjLt76rTuGDJD+/WzVquamp79agIl/Nc/c
	 3TywrG6lhH+bTNOMyqhyZduEOcrcZ0c8PYdiW1yd7lF5K3Q/FcyJ+/BIkHItRO4QY7
	 I31KlVrPVPkag==
Date: Tue, 6 Jan 2026 18:12:07 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call January 7th, 2026
Message-ID: <7eiztvv2iuki3feczlj7wksll2hdh7buttz7k26llsger2qkwf@wfa2sidzim63>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Happy new year everyone!

Here is the call for agenda items for the the first SVSM development call of
the year. Please send me any agenda items you have in mind or raise them in the
meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
