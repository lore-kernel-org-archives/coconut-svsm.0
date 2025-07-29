Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0821226A0EB;
	Tue, 29 Jul 2025 20:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753821100; cv=none; b=O9iG4eoRvL++YBeVgQIdspWzX68G27H/UG03NASeijl/4e9Br8WyR3Sit0sUlSD2z+F8cA02lcf59mNVks3dpXRkc8ZIUl9Q7SIdWPQrwPgVoh4R+SvZ/CAiTvzzK9BrRnRs2d+EaI2LubPLtZyKlsL4XDx9tSHXzU/TmPMFY1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753821100; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TH2bZDD9Q1NzXL2k2tQjSRY+7wIhLKTIwEG7hHoTeLQPrNxSb8UNJ9UBlcB2H91LwWhgw8rGR5h5K+4lc0TtlixlVYLzbsK7490P8qL1HX/GHeFIgW4i3t1NXL+0B60a0qV/LbCzaIQu/GVW0jQoNakQ3ULtuJ1cx15hKCnikik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=7BvGl6T5; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="7BvGl6T5"
Received: from 8bytes.org (p4ffe1b02.dip0.t-ipconnect.de [79.254.27.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 03E8946201;
	Tue, 29 Jul 2025 22:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1753821090;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=7BvGl6T5XTvegDSUz5pmhC2MMRSFrajWfc7HcNhNkZ/le7M7WtuAZFu/QyAsBPbOY
	 1C3vypDbqpeffa77Pj9JGSXSx6LPa8KaS8sBgal1BZ74Scr/nB+z/l2dkIPpiXnHtd
	 Hqa8HStQHM763AN+8FdgguPMFlUKPYn6JAZy7xqH+1e6/835tHI79LP5pAR7+i4zSO
	 b07r9RtPVUUsVtPHRtLJHRLClHIGAvYJsJ5JDakPlUmfe5bh9c8BPn6YeDubtp++qU
	 mIAUzLmkPV5GfNOmob1tL4dCtSOW6EDSonP+7wudCgKUs4yZm9BxBrMWB/SL+6N5vu
	 PJQWQvCJmV72Q==
Date: Tue, 29 Jul 2025 22:31:28 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call July 30th, 2025
Message-ID: <g63do42uow2gfovwl6qpilpathawqkndk7bc7egwmcjwe33jrj@hxybq2xum4ux>
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

Here is the usual call for agenda items for the this weeks SVSM
development call.  Please send me any agenda items you have in mind or
raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
