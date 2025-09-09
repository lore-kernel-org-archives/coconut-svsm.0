Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E0635209B;
	Tue,  9 Sep 2025 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429548; cv=none; b=b8dXzvCMO7efifgXp1l08zykw0iEgRtDMVdnfclg2LxGFd6x0n/GgU8cXfK53uvyTfMSCgKl9tdp5ZcTH7uBbQURv5lX666d0ugKOHbqwvvGE23rf+zfsWKQsRkb9SSWAlDoJ8eui0Z24eh+nwanKE2rFs/Ku5zn28Ue8gM+RPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429548; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rx4kvM2aoS0PnSbyoZqjYoDrVzM6yflnmbRFHBCNZJYwrYnjInAKEgtWNdxg2sOouGeEhRo/OcZp6J3rrFS8kvmS5gVgbM+ef5D/fyOdZQKwQkHJXpMGi4th+/C1D9iyGmh2C9vGCjzoxoYUZuIECifEUqvUssjBw514/LAcLK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=yTbqwZGD; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="yTbqwZGD"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5D13A52FBD;
	Tue,  9 Sep 2025 16:52:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1757429539;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=yTbqwZGDSN/AueHi6SHcDshx5zc/8hlZoo1ZvvJcwviK4fKVvpL40Udor4idOCF1g
	 E1vHlRZJdEci2olP3sGab5RSJuZr6EKu4Yiov4A/DRLHcyiR2fT2XRBY4jUezsBwnQ
	 I429qggkHVeoHzLrgIjNaIznvwk942h6jX9ZnB9mP9MBM7Ll1IGAmE240EBf//2OgD
	 YmDSRMnsg9eqYgd4TLFXvV9aw9b79iCghAnG0lBAXsWRpsih8qe6N23c4LNpcVU67n
	 6J4Cfor8G1AwuMJ6R8ZYC6UUtjABD3m4vcNYbSJoNmX7+e0+EJmYo6Di+av6kltbQh
	 +tULI+SpKAQyQ==
Date: Tue, 9 Sep 2025 16:52:18 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call September 10th, 2025
Message-ID: <2u3l6vuoby5ffds63pzlqzmxzqylk2aklv2znb6wkxhjhpgek2@mb5xxsx2r2bp>
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
