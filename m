Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AC52BEC43;
	Wed, 22 Apr 2026 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776838374; cv=none; b=dWmZvHunz1gMYw+LVe5uQyRJ7hBOWT8Rfi9N3hy0ei/yU8w9hKHLeShVD/cMhuSONJ/nhEBIpz6Fejy/1AnZhoLkdqHqBhTQL+7sE45eZZiUoogrZV5igxxVzAHeerPxacEXiB1waabjYY8llHo46ZfX3a11VgVRYGZ7gIeuwss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776838374; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VYvuJ6hQ8AdHEVt5i8nejZ/7lev0L5pK+j46xzkstvA1RmN00+wffI79X5wBnnZwunCRena51Mhw3Ny2fLl7mwviCWWIMkyqDDqCd4G7wamfkYNc/EPGb57DGbI+5l7rfGSIZcHjXYz53d3f0DaOnEHxCCS7MgI17Akd9bK4c2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=ikxH1ohJ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="ikxH1ohJ"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 012941C2E8C;
	Wed, 22 Apr 2026 08:12:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1776838366;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=ikxH1ohJ2KfzLzW2hrE9PZacv1QFbnQli0erNkV9ZOB8GnNN2q6G1BxbCejmE9apn
	 r7bDR1ncs51imfMar8oyc+jDw6a1BQQWcGaRpAPKM/dvDg41J8Y3MUFBCCX2aoO8qT
	 9Scxo9K/hhFx1m8gM8O3RMJCA0l1PZmgHPip7gyllK4dMxyZmoi3GxXhzCnWe/w4RL
	 FI3CPUKJGIKmONL8cr2Sk/LeBy6KJ8thVpJsuwLA2l4T6OpbzCxun/9T5PCyYR/kEO
	 nc4t8Urb4UxhyLNkqxs2xyeYvJACIKFCTC9OB4CYnNXkaqnc9jBHKaPFqF+eBo5br/
	 7/fOnZB6RkqoQ==
Date: Wed, 22 Apr 2026 08:12:44 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call April 22, 2026
Message-ID: <ymracc35f44xtep4zvexdvqxbh2sfudsnnvz6nrgj56wyxaekv@xrxkyzbpdohk>
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
