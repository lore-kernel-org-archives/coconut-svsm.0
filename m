Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD283ACA48;
	Tue, 14 Apr 2026 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183355; cv=none; b=XOjKYKyB6nHlc3kG0sXKVuC6AVgMxQ/PVi9yNRlrBUzWHzcm7lWYXdNF59h/5RW1XLJO5S60i1JtZA+Ehd33orV3WFsOUMdP0J/9OZNpttiPBXwhMUhIf/Q8N+WSohe/gjHSq6l0tp95FGBGkCdKB596j35Inlc7yCqkQczo/y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183355; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kUITrP+NZj31ol3N0oGEGWKCAartwjtGeEkO+O+1fG30VVKtp++6dtvyWNksAjbz2gt7pZ1cnBCcwu6o6IcgCFAK60ixkSHLOOwPbFLMut7WAWEdOwayAc3h3l/tAI8vgPOqa4w0Ge/jA8V0ffDgsUQ3oW2xSLCBHImwf46buwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=GypyogB6; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="GypyogB6"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A1AEB1C2722;
	Tue, 14 Apr 2026 18:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1776183351;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=GypyogB6Q3BBWJZVaRMH7zibDsBGOQBUN2mAm4j+cDg2gziig0nv1DEnjpzoKQm+1
	 ByaqweJQMUo+brT082emIMYZX+g8GDWPxSS9WNOWsq7fHurzWH9+JmmSep10jIoNMt
	 z+XmIfTX53kLR6j/Rl7ebIPN3/3v7Fr87iap3Bg0DOqgxtjg2T7od+MF/1havAOqwL
	 IPDtUXQPWe5BxHGpayFpMiBIcwnqKyKrBaqcGA1IeLIjgIxm1eloq4PKUAkUxjcD23
	 0CAUBKAbk8I6zoXxVRfJ3yP6ot92SegKoutfTpjN4mPCWwV/1JVD3AELJQQbfmHGny
	 0YcaesliD9Lag==
Date: Tue, 14 Apr 2026 18:15:50 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call April 15, 2026
Message-ID: <ek6soyyk2yocghq6eb23unh4cfyzmhf5zf4ez5a3bo6fr2obi3@fwxk4wu6w4vn>
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
