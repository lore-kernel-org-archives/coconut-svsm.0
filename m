Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07312283FC0;
	Tue,  6 May 2025 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546053; cv=none; b=nrkEkmyIc1ECIB/LOXqv+napoIPuRNzR36zFJ4v88Ns2ZLXUsoC5mEn8Azq/Y+V7+IbGGydIqdkfgmoFqKU3mpnrjJljvwaxsfFDZzOjjtRVRssDApY1aZm2uSABkKAdAZXia26gzeMmEZcgQeg57yIgS705EC0xKz+gtMQMHl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546053; c=relaxed/simple;
	bh=FmSAABPfGXdYaG+10h10y8QNaOAYwrRVG+0FqnIEG5I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YzrkOliL5WvZz0Hj9tJDfHomT3E1iB0RcAdzGSvFSRUhX7rs234h0yPm7DHVVDYd1zGibeA1RjDM5Sez0gn/hPsST8dZvy1fgkS6prO2vG9iLHMda2IHbtozJE4YdMS/IGxBh8JjDAbLLUvceKa6WK+N4PzXa7970ckty3Qh3ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=1aRdGoc4; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="1aRdGoc4"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 171C94A570;
	Tue,  6 May 2025 17:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1746546044;
	bh=FmSAABPfGXdYaG+10h10y8QNaOAYwrRVG+0FqnIEG5I=;
	h=Date:From:To:Subject:From;
	b=1aRdGoc4dcBRl8DoAlBle/6NIjvSuSPd7fpNXtOKOjwHtP9tbWKtNSTkZ/CeaDV62
	 vxaKGmvzZCkdNgQT4UromrKH4qgjcK65eIfGpdBNAY4A4XHKIKceX8OBhtDJirbvdz
	 TcDAXx48DTWAw2dlI4fboTOlXK6GIPwr2CoDFo2gFsEB9AzSHk3NqBOfxuo9jZPwl3
	 f/bX6bJ0b6r6FXMyZQpUI9Az8Np07rRMX12yTk150UrplE/F2cw3F4nkDNDSTzRRKp
	 q5hq6Mw5Wl9EHZnC2rFFTubJA0Vw+HbVDMnkTP2AKCnJZxQeghFPCmyzUR7YWUyDqs
	 Y1YwaC4FIfu5Q==
Date: Tue, 6 May 2025 17:40:42 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev,
	linux-coco@lists.linux.dev
Subject: SVSM Development Call May 7th, 2025
Message-ID: <aBotemx_JthzO9FG@8bytes.org>
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

Currently I have one item on the list:

	* Announcements

We will use the LF Zoom instance for the first time this week, not GMeet
as before. Details of the meeting  can be found in our governance
repository at:

	https://github.com/coconut-svsm/governance

Especially the link the the new COCONUT-SVSM calendar is important. It
has the meeting appointments and the link to the Zoom meeting room:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
