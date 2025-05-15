Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F67A28D857;
	Thu, 15 May 2025 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747303745; cv=none; b=EqudA+364/oFvbUsyPY1hC7+iWO7TxzXWONc5wDYOBxorJYerewNL2UAX1peGoM8XvAnRxPMzwEYl2s7OUmcDJ4cuzqG7SoZPqKUV25URiUNzBEfQ8bMDVnB1w12F2VNA6c0HgwgU7jZTX/u61BNZz4UsBPKRZt01j1k8XloqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747303745; c=relaxed/simple;
	bh=L99K0NoL4nMF2uoLcp1TznF/xLcklhQE/GdXScRvjmA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuXLexX+fzqfxFeyy3wQindXvfzEgejYUec8lVteg2NceoneBtS7ZKA4DdtbCM6KNLI07qvajiD5ut8Ue6aBGx1M/MRPthFzdLYGFNqLwKokjkIqPDqITIgDymcxhapFC8I3anxWyM0kCkGbjLYD97wxzN3JODYsCKEwn9qeqrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=4lN4BvgV; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="4lN4BvgV"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 04451493D3;
	Thu, 15 May 2025 12:08:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1747303735;
	bh=L99K0NoL4nMF2uoLcp1TznF/xLcklhQE/GdXScRvjmA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=4lN4BvgVWKUnPUXsQDR9GFQlyOcnFEcG3XODWdAIt66+FWrRtfvgYmdCCH5AEvn2r
	 u1v5VOp8nA48wwIpabIu1ktTWmBDChx8irg+Y8O704Nox9Q4J4Znqa3GH9D9AaNj12
	 YjtsbDptPCIXE+QyL7O1eLbDTd3EQAQyrt8O5aJ2QQm7opRXaa7hRsIESYkT33E7lH
	 vtRWkBhd1AfnNZ8EIu7hUJ7uLLOiWHh3NThJB/Dppq97m7cyhiRaUocWk/EaNYNHd/
	 x7TYSM97PXGVESTpnIFmP9S+hINE+k07P+gugB7uvjGVE0fbovgCRMGZ/m3bQQd6a/
	 jK6RCKnOYkuXg==
Date: Thu, 15 May 2025 12:08:53 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev,
	linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call May 14th, 2025
Message-ID: <aCW9NYJ0c1tqybm3@8bytes.org>
References: <aCNwxxKAXHYEgZQH@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCNwxxKAXHYEgZQH@8bytes.org>

Meeting minutes are now available in this PR:

	https://github.com/coconut-svsm/governance/pull/58

Regards,

	Joerg
