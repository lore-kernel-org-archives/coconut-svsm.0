Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8C37E110;
	Tue, 16 Sep 2025 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758024085; cv=none; b=Wh0XwTec7tLIx/u1kLwoGayd0edLDv0dyn4uP0Re7M0FnFkHMKbYnNQS00r4urEpJkEV+HA6Jw3aF4dn3Ygh36p8niXZZh0MhPWgGQHpy9qF0pja0cYAINxsmA+RS711tmKjMdbYsMocmprTuZ5uN7oI+wKYBDQMIdITchNvJJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758024085; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qe3Z0Np7cW7jLMeQoBZ+uyi2DoptXn+FlMlE4E6s7/AoDa1HTi3YxsmNRpEf0tigSqSKIiWzaojwcW+aqpraK0WvwXk7XeZobRRlbrgsDAo9w1n29T16d28CpVDzZXIrI1fw01srioM5lzoLCfCdu4gWVh0pUMVSP2sMAdJotJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=xrroZBBy; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="xrroZBBy"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 42FC055495;
	Tue, 16 Sep 2025 14:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1758024076;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=xrroZBBy0y6ApjgqDnYs7qAp1Nr4uJRgXy/lYeNGKyzAiEtTd6s3CjCiR57bLPU9d
	 wimDGvryWIjix0cCY8asgi+w4mgGdxDHQk5cjmK1qnGdkrgGhkrfcoMXrmiWQ60xUg
	 7SlgW28YMOApg6rJRlOz64xR20aAANTW4db+0l7h2UYyG7CtDdIfXvLpec2cA6stwd
	 w1vyX4L8A2Yri4xuazNVrtE9+eeUOj0OYXFf1RAXKBEIY1SE5+YMpxtoHW136fmv9m
	 +SfiqvuWqMtGSfxjMJ6aAshheL3iKGGygf0ais7JOMoiMBKwl/v8ZUfZdZy4wctky5
	 1hSIYDhRY6T+g==
Date: Tue, 16 Sep 2025 14:01:15 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call September 17th, 2025
Message-ID: <lcem3i4xidnk3ngaeotq2qyxhylt72sx3tjznvo3uz7uhxlgp7@fbyok7ripatk>
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
