Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F4F2E6D3E;
	Tue, 24 Jun 2025 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750789713; cv=none; b=s7HR8U7j/E1oE9PXb5s3PJcnxhgarOT+nLheclzkxXd+bxZu3/utpTZk+IKrEPQcM+rU0t/s4vUT2iulTOLxo1Py6FIeoKsva3foD0kQl5uCP3rVDp3M2LdPam0SKLAOGikgLBVULyMRoGuYWJrnfX7ut8QSEoGX+6KiS5FZQxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750789713; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oT2KCaExmj/KW9nLbQ/rBeP81ss3shoH6va4mcdOCP8MxkTx6ThPOOv+mQ+FAdanM0U0F9hKVJcFYZUc5i09uHJF3c4lzPCO28ZczqIQ6eBwdHKDhtETLPsv8RmkqTVZVQeqch3YlWtZ4VGJJx5kx/gc5yAfgyXfCZMp09lGLkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=b13mCWqX; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="b13mCWqX"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E57044CC33;
	Tue, 24 Jun 2025 20:28:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1750789703;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=b13mCWqXVjKNwP0VkPglJ557DKYMprvqg3LMAMTOoHN80fQ/Zb669TdcuPkOmq/1j
	 UXpOBqKlmx9Jv2AIiylBQiZLwDiOs47BBCMP2+759kFmmkiIxzjxNwwXTpvLTJUWTS
	 NQOZ32RFTMUtya/eJqozpcL7G/gu/5Q9X/Q44FmAk/vuwoe+eVsW61R+w1RFqbznp6
	 sWfvoZUNPlScLJdVJ7eFvd/LGJqVBKT0RZJhPRDHuFDbRuCxjtAUtjg+TqhFQH+JH8
	 zu1MCsa8iO0oCNkJH5w5CgrOpwirsnusYAaNzEobgmzWAsBWAaf+4fmIfQplj605Jc
	 e7tBYlM5J/NaA==
Date: Tue, 24 Jun 2025 20:28:22 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call June 25th, 2025
Message-ID: <kf45vknwfpg2ule66cghubbzwdri4frjp3ugmybvfdkdyovqmn@q3hlnl34l5wb>
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
