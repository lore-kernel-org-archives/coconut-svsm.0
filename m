Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B2D17BA2;
	Thu, 27 Nov 2025 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764241019; cv=none; b=RqhdFrRNRljmVvTVvcclqDdhxguh4hdSKy2zDrkYLgECjXBvz6JN4PM8/G/wEJruTA0Wh7ckKdtK/6ckZHrJePrhO+gyUj2w/eInKagaU5MBsh/N1UCpl7FWOvCBKT8UmjMdUWZzJz3t6jB/Ytg+Bn+NhwAJyr5D4VI944dOhAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764241019; c=relaxed/simple;
	bh=oPwDhr9gBbN0XhOFQ3rWkgGLnHQsyFy+PI7IkzRro4E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JtMju7FZrRPDDweGqcdzGJfN2x6q8ePQHWwxBPoo8B6A9JidwTkFcu7cTbNOTUH0dU3gjG6UA5CN87piA+qpOAIj5jfvnwGjqKHs4f0rB94YtqoZyMXrhwSA4kxQer3wkiJZsdBDKQi+hCdSOnkOiinHMZctl2qE4EI7kBsli7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=wMrZQLsM; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="wMrZQLsM"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1D0FB5C6FD;
	Thu, 27 Nov 2025 11:56:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1764241016;
	bh=oPwDhr9gBbN0XhOFQ3rWkgGLnHQsyFy+PI7IkzRro4E=;
	h=Date:From:To:Subject:From;
	b=wMrZQLsMguJ1McKUPszp5HzdXTS44gP2dvchycuJE/oUts2QCdNM4V4Rg4KLDT/Sf
	 YPILlToY3xmbOZgSPjq4ULhQ5G44L4HF8aLY+OLkbpOV+mAYQpVrl1NQIj93oeFtpa
	 oQUBCi+k5OfOVyDIkh4TKnkahPYdxcGjM/VMJ66cJmH42girFYAf/6a0yGuhjbO6MA
	 RHLDG5krY+0/oLUTtD9yxJgrsJMA6Zr6HqeUZJ/OMViCKrdmPnaJbMX7cUgcPJw5s6
	 AUZT4q2VpH4xwgcTs6rhE3nv5fGpp6MEA28g1OSG8/eN/S07ohgB3jZL12z9aLnjgR
	 DjN4hHhHSEQ3g==
Date: Thu, 27 Nov 2025 11:56:54 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: COCONUT-SVSM Development Release v2025.11-devel
Message-ID: <semhxsg2p3ui45hulp4nr56s7fh46olg34ev4xm6c2mgbyiokr@oguvl5aktplj>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The November development release of COCONUT-SVSM now ready and tagged. This
release features 101 non-merge commits since the October release. Some
highlights of the changes (in no particular order) include:

	* Consuming MADT table via IGVM instead of GWCGF on QEMU. This needs an
	  updated QEMU, so please make sure to use the latest one from the
	  COCONUT-SVSM github project.

	* Some reorganization of repository structure.

	* Build system improvements around building the C parts.

	* IGVM memory map for OVMF support.

	* Improvements to the allocator to allow stage2 to allocate in the
	  kernel heap before kernel is launched (WIP).

	* Updated development plan document.

	* Attestation and verification updates.

	* Other fixes and documentation updates.

Overall this is a pretty solid release, a big Thanks goes out to all
contributors.

As in the previous release, formal verification does still not work. The
reasons it did not work in the October release have been fixed (Thanks!), but
other changes broke it again. We are working on fixing this for the next
release.

Have fun!

Regards,

	Joerg
