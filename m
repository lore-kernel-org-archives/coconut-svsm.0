Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B88B3AEF57;
	Mon, 13 Apr 2026 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776079476; cv=none; b=QSffI/sAt7yhSJA+2q6wWQqQgzjXPhjiz0hhayxwu4Qx2L8Wi96ZWH6R8V4UmKEHTJHGYmtFvJvJoUSH9YNI9zPOdHljMMM9mmhGJB3wyiCDKYZC6aoiRjle6jEPGByjJ0MALiyzKB0T9x24ZEAwlf+7TkaGBaECGx7zo5BNXvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776079476; c=relaxed/simple;
	bh=qjd4jHR/r8R5p2nvQNxKQ0woRsQV1vPGnFMy6nEQ0YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9BVfUGBBDaYqlvDj+TnBVIt4OFx6kssfTZopXH2mkWLGVz3714By+ix+p+2OJmFhHAay9iF1SeAtXIKwATPmHJlvyG5HGTL/xyxM44ml/UR9izC4ekTJZ1bSROEx5hD1tHIhIF2DmnrMOGlzw6g5XkiUMtpRi1jN24xqNGgcaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=RHeR2oLK; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="RHeR2oLK"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0255C1C26C8;
	Mon, 13 Apr 2026 13:17:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1776079066;
	bh=qjd4jHR/r8R5p2nvQNxKQ0woRsQV1vPGnFMy6nEQ0YI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RHeR2oLKsNUU/GB7/2fHPVAYsq9undNfam2ziDATarzM+l7fWZOTpt04Zt1FsFLjn
	 Oo085Iw4/VXNRA9sf5/S1HI7FkehJoFInHrNTebgt0btyZxtovuVF+wEa1zovI2DU5
	 Gm+/xZ88JTCaBYIeWHYRfGH/+iUBgtUXyxZmmeBPS69oa8ZOoj70sQ2tQtRefapo2w
	 UR0kTR4ycGvWTpuhNrnyHyIrkWEueJTNUqzU6auxXDbLbcBLsdaRTEuyr9khKYP41v
	 yZnKwQ3B+llMgsfFkUXhmL02jvPtB10irYyCxQmZ4Qz5/tUNS4R+mKRjI2npsnxZhB
	 Uf9nKUGJ86HFA==
Date: Mon, 13 Apr 2026 13:17:44 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call April 8th, 2026
Message-ID: <nmr55xxh7uaifbif7yt4hojuirg2tiq4tdfvqt5jjgo7lv5efe@wnqi35z4vkgf>
References: <CAGxU2F6OApB3K61_sPujnvK_gx_K8zFWyOSTPV9mzWOCyNkBJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F6OApB3K61_sPujnvK_gx_K8zFWyOSTPV9mzWOCyNkBJg@mail.gmail.com>

Meeting Minutes are here, please everyone check for accuracy and completeness:

	https://github.com/coconut-svsm/governance/pull/103

-Joerg
