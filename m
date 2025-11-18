Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0793A79C5;
	Tue, 18 Nov 2025 17:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485809; cv=none; b=LRVwkyM32yWbx3kpcCdCf5Zt4VPCGJgGQOdV3kdMPH/UA35bPMoC/OIx8xtG0ktIDvAFu1yhqjk1n2xrWj8u9eP3CJFa4vF7dV118XVRJfckFTlv0DFpni/sqpsCFuzwqbfYY6sKcauYQIK7uPqlJj+GXFl8wjDQo7ztrt+HwVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485809; c=relaxed/simple;
	bh=gvagssODxCXQt77uWV/N4glreWH9YebloZywPcuCBUI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bIXNJOQbpIpzEpE3PrVjjbQnZcKn2lbb0aWDgE+Ft1zVKEWbmj/j36RINbyczNijjwDc3i+dNzsMXdFi0nqN/de+T51WrYbyPtTSMUzmAr32RoZyPBEuG9U6rjDiW8t9cA5CrgVnMTx+wTlSvVAsUU8COkIdkHxUqaOP+XMkd/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=mtEdwtDR; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="mtEdwtDR"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3EEF15B860;
	Tue, 18 Nov 2025 18:10:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1763485800;
	bh=gvagssODxCXQt77uWV/N4glreWH9YebloZywPcuCBUI=;
	h=Date:From:To:Subject:From;
	b=mtEdwtDRMTREalADiTH3Cu5+VSOnOWTNcIoCDWO/hT+VTW5igowstHXu20YDpvyt6
	 R+UsnGgb8spBc3O3VK60A9g6BRH0sBQ4k/0AvHWseqrR+hbaiygM8pqC71ClsausCc
	 bsbUxP5l4PzXrIpJDrs17d0rJi5EG+g753JfXdRKKf/EujibdSnKhWCB5WegMPCkh0
	 DL89LrzMQ8UhZ/JA3T/PKeq4gjxJwx/8Tsy1emJ2cqHzIPKmIiO8PMSby4PHrLnLKb
	 Asa7C4UI3PSqqkNqe8gohSdjW1WYzI3nKSpk202ew9ggdF/kx29gidPju2528aeSTY
	 WI1Ed2XZTe1Pg==
Date: Tue, 18 Nov 2025 18:09:59 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call November 19th, 2025
Message-ID: <cba55jdxpvqmcaor77arlgak34ixrcevfc33mhq4tkyybuiqi6@xzthbzosur4j>
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

Stefano volunteered to lead the meeting tomorrow as I unfortunately can not
make it to the call.

Regards,

	Jörg
