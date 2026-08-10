Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8407B1F91F6;
	Mon, 10 Aug 2026 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350187; cv=none; b=gyG8iUciQWNCpKF22WSiM877BLVu0n8R+vd3CuhtH/pa217Zpch1a/I0poRb01WJ3XNGWS286vyEk+UdeLIK7xum1XDyPAe8Z3WvoXge7H/qsp+TuWlEQQpe6ijeuTJSGZ4vCa70pHZI4qbMSlYuQGPzdu0JOj3EZiFQBSc111g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350187; c=relaxed/simple;
	bh=eLrV4CP8X/prrh+x+BoRCxVBInJukVvPOwD07r5uWXY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUwwTtZkWAmhsFp7b3yS1X53D0X9nXobtWxE1X08RhChwf2lY1wwlTpYboMTCi0hSIdP9hEozoy/vZ14y/XKGNDtHixT/6Yfpy6ItvahvvBLOkcBcpzPiqW0Dvubvr4Wy08IIpiSJvhk38E74gh9fyufIQF7x48lq1qNyYkw7X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 713F720681E;
	Mon, 10 Aug 2026 10:23:04 +0200 (CEST)
Date: Mon, 10 Aug 2026 10:23:03 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call August 5th, 2026
Message-ID: <anmKVZQQAwdt9dSC@8bytes.org>
References: <anLUBR_5pnNSS3AH@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anLUBR_5pnNSS3AH@8bytes.org>

Meeting minutes are now posted:

	https://github.com/coconut-svsm/governance/pull/118

-Joerg
