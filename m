Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F2134F27D;
	Tue, 20 Jan 2026 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929006; cv=none; b=ijyGAJ0/fe61mOryHTx1HCXrL4Y4XJNhffuwXC/SA8co4O1R0PbO3M4X2mG4kLbQMgPFR1BvMEA8IDjGWdnDeU2jzyJNAKtUeT23ejIWt60BwfpQjk71RyFt7QklsxGoGnYyYQw2s/SyqPFrzPerOoIXDiaQdjrcm26mGZKkKmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929006; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=buPmJqIeqT0/qU4eSCN/+sF4zEU7n0yyMDAIXxgclzXxnwpxv3e/qzW+qZ272qM5NJ73Y2EjZVR029MUFs0lbgSvQAbanLqfGxJPeNOMewp9CoZN/Ij0fIbnkNmwFP3kwsWkNy3MxQ/dbs697d0X2qC1UzWsK0PnFdOtkW2873c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=0h0GTlGR; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="0h0GTlGR"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8D99D5CD91;
	Tue, 20 Jan 2026 18:09:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768928995;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=0h0GTlGRNU/2iy64WR0Dpsngg0oQ6skOhMya1OrV38L3F9EbcgGAVxfTj3A9vAukQ
	 Zj9rl/DlY//JRdDWJLoa3e5UEreAj0MJsQv5+ZEOixRt0xMoHGxHdZmaHWJIOcKP+p
	 yIv+xhhgnD+XnJLGBmH8jp9D9U4hRpVWEYAFyE8FiwKkSUv3oehuJW/u9RLpQmqNEZ
	 +9K2W+UP+NyrdtsgT9yGEinSQpu5g27qCr3Ob8U4AXEmuHUjaNBVu0EFLA6tKza3oO
	 cNs+ROuQJjxr8kD3PlkjTUBxePOCmDE33QnwsjDwSxTKwPz7S81VM7VIYdfDzqvUJJ
	 91WRYeMemZAVg==
Date: Tue, 20 Jan 2026 18:09:54 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call January 21, 2026
Message-ID: <4uhsm4wvzsoto4e6koyccvsdqcg2pber4s4oexclhywps7pz5l@tpkfglmsge45>
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
