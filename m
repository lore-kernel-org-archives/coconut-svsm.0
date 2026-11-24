Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539635;
	b=Fpg4EN2lW1tG2AjXkMf1NoAAPA6YyXoI8eDw5IYrQKwGe5ZfJHYsttcLSfI6jAQHd0+y
	 D+k4Zc9I4+D4nD4aaA6KqTEPvVyvZUbTVQILkG/rDqfGyFlcXkcMWUd5MYvaAg+37q6QT
	 PQH93tNMhUFLNvIqiCbz/CxZ/+m3pYMJQwIs9ve4GqjJWWt80tDVbgV3fmrUAY/hdzHRv
	 evGXQpxttg/CKd3ZlHYkFMFYhXTZlLudMQysvkD3f6AT4/wTLp14xJ3QhM5yrIIS9uQWV
	 dfDIxrfMJYOy1dvT0BfN0DFV6IfcE0wkBhoTY/jcJLn1FwnwoGI5DbAzIIqyRgARYIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539635;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=/mulPRNFc9Mmg69CBN6d9UVIGfFOhz5cNKUfRieNWJg=;
	b=u6kQpHJe6mQUmfA/7Uhd7EHlAOt6sqMtO93vJiZlLSO2bVkttPhuW/uuzIiE+XhthYMW
	 PavGKPpbS3ejFhcmVSEV+69zKmd+9tqtmBDWMZlu79hFVBaZOUmSABIkAJ9tl36sL3CNw
	 uhPkGpnPpkpUzTrmHLR0nvu/sCZLc57GzDwOY7tuUmhGmZaUbRTtk3XucsDI9mOTttlm2
	 B62/yvdssiQbmt/Q8MTPxbg8K8T4qsv6psbfjwNzpgShNx7DZpYhIfZN/7g7LylVeNctR
	 coATbmPREzv6mdH4v8c9hquSabu0J2+YmdGo+xi5cLSHQLv4oq+m/wfpz8jxp4UQ0kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF30606A327;
	Tue, 24 Nov 2026 17:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF30606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1E04924507C;
	Tue, 24 Nov 2026 18:00:27 +0100 (CET)
Date: Tue, 24 Nov 2026 18:00:25 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call November 25th, 2026
Message-ID: <awXCnJhLBvX_fRyX@8bytes.org>
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Here is the call for agenda items for this weeks SVSM development call.  Please
send any agenda items you have in mind as a reply to this email or raise them
in the meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
