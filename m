Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B143264E9;
	Tue,  3 Mar 2026 17:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557676; cv=none; b=oJtbm6ui7utgFAZVcptFiE1Dp6Hglq+3xoEGZT3uNP4B9fK2FqPNu6orueW+eo6g5aA/GBBTzuUlWTvYeNWKclrA2+1xYrvSBSOA8s31iYLlD6qFRHQcChyURYe7OJr4CyLN80AEtZzAgnScfcCLxmVWb2K/h3Uj9WJB7OyNKwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557676; c=relaxed/simple;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQVUY1bbDPJiDlB7iKM9ZovEzTCnS0EgZcsD6SspeyLxMOoR2Who6JzbkHA9/GOqhV506jst5x106gMKyqc6kiEiC5a6ozrPVeQQfZ9h4+EEEAUXwEecD1e2EDb7G19aEfuiWCzIOT1OgjSN8l7nX8nFvUO+V/wijSeMwi/GTGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=MKGxHG+Q; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="MKGxHG+Q"
Received: from 8bytes.org (p200300f6af1d9600e1e07d9254d4fdeb.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:e1e0:7d92:54d4:fdeb])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B0A771A12D3;
	Tue,  3 Mar 2026 18:07:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1772557667;
	bh=aTy8W7SgWTy9MJdjHu3wk/HtiWHlpjo1ZfaA7EhmecI=;
	h=Date:From:To:Subject:From;
	b=MKGxHG+QW7bxgscQONzVfSHJHv4N22HfEQdRmcKRs8SXv8XcSicwQsvcD6gSnEa7T
	 ryUuG2D9a8Z6O8v9+LI195bzZsOa3AY2zEvVETWQmKePMNtl8mOSSwlK4Zov+7T6+V
	 QMLA8ot16mN4n9htaAD22sw4ENGIldHOj35N7BbYunpnza6qa+e3DS081rVfgfnnS7
	 +hmk6s2VPExscIZqQOzuaaANHeJrjhEeWrrMmkiBySufxmbLrnA0hkeOcHQcX2v4bx
	 HW9l+E222lKGXZ818cuJotAWPTtDC7Pj0iGgGd5HW1x6BnwV6zdASDsb32FHid/Ntb
	 3adhZrFbN9kmw==
Date: Tue, 3 Mar 2026 18:07:46 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call March 4, 2026
Message-ID: <bvfkpoqw2bz6ryy3kblt4vrqweomutyypvn7tfqqokyje6yoc3@dqwyss5eb6qy>
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
