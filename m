Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E19146A72
	for <coconut-svsm@lists.linux.dev>; Mon,  5 May 2025 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438378; cv=none; b=F8nnVPblRb5zqLOqxjkOjCYGyKjcLSE/zNl/LKf2Lb3WvThTD9JRbSWiaOFYhdPiCl8nVDMVcg7pmegCUyb0L9PhP8ga55sksDAzTfOfLTWdqddz3r8flKAVy20VR9BioI8NwCKWiuZRjeEE2BHV3+N0FV6P2dX9wVZJLNiSvGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438378; c=relaxed/simple;
	bh=f7AtF2PSAWJTmYlGE2qsNzwn4xR23PuPjiTML0+mJi4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g6+tdrp4WPvwC4pNU5tbqkpP874VzAnf0poWvTbCBxqfn7kcBIs3VALRj9DPf1A5MBUHdLxm0GzkTMR097hrIDo465WxPm/RmF2r8jUdX0gzUxU7wfWTAouU2tSFUUpTCLScTybaepuU7Y+yQEN7ki3s+GOYkZOQ/GvEmvdbgto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=nfMuIFun; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="nfMuIFun"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 549C9450F5;
	Mon,  5 May 2025 11:46:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1746438369;
	bh=f7AtF2PSAWJTmYlGE2qsNzwn4xR23PuPjiTML0+mJi4=;
	h=Date:From:To:Subject:From;
	b=nfMuIFunaLZdfnp2WMc5l5qF3DRna58UxetgFS+UyJj8v3S08Ak97wJitGpjC3E1M
	 i1g7xuYI5CnHCP2HJOp6fwYi46iqD2NSQ90wbmcigDSCkgpNI1864SiVnve+dmL4Zh
	 TpDNBpKoEWSzpj8auSDVRzV/n1QKGC0QrLre9Im1RLrKLdtkg5/nfUw0cxnJNUkkT0
	 aEx/flGFqvAxfDK9mYb+j2dTpe8htRJafw19NLS0b+o8ux3ohPKz143wQXiiwDSX+i
	 kyAYEFQur7TSBNzZWX8zU1d6Iqo5kLwWMEFHJigYhd/nem1fkkMbZwL3kH9+tMOUjs
	 3XoAOJFKrRp8Q==
Date: Mon, 5 May 2025 11:46:08 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev
Subject: Please update QEMU for SVSM development.
Message-ID: <aBiI4LuIltqLLKGn@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey everyone,
    
just a heads-up that I merged the VirtIO PR from Oliver to the SVSM QEMU
repository. I encourage everyone to update their QEMU as it will be
needed to run the tests successfully when the VirtIO-BLK PR for SVSM is
merged, which I plan to do in the next days.

Thanks,

	Joerg
