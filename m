Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE87C340A43
	for <coconut-svsm@lists.linux.dev>; Thu,  5 Mar 2026 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721294; cv=none; b=BdBN/0KHMVZ9lCN080UIw1RQkja9lVnB2C3TDRRBAFYB7IFT3xtuHGiNWCavh02qdHo6hqFAVE1DyQOOZ92bnRAOVfSCjcolyLM76HDau8Y96byAne4dQSI2Q7jxi5gEaChXPTjYUq2CknNBDfnemc/8V3WhmqG4SmGcXyGkc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721294; c=relaxed/simple;
	bh=j9W9ncSmOjRHWqhz7DstwKS6ClLCcFlsMhiNg++1dvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Q7uZbEgFJ3J7mBRnRP9hFGY09iDx2S3tOUQFF9Ppr1esB3RgEBdEvF/tBW1y0j73WeTe6x0r1PSLKwffYy2mIzJq0kedi6dJxcIJH0s8FUTg2QtnKJ3cLIhxwA8Ku8WscH+IbFVWFJv8zBShCa4ZTK23sot1BwQ9MLkxjlYBdmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NOiRQDHh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NOiRQDHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772721290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ztT2UzEYQ2TRKsgO+74ZBu3HVWKsdctH+lKd2gri5tI=;
	b=NOiRQDHhGkSjFo93l+KtlymGVR8w5wvm44s/hqyjtMDyRZPFppEIUDS+0wVwKHEomsGQ1t
	bjoHDfwrhhwDk01Oio7PKU+e3wKFJtQtIAFRKEHk64Q7+spU8abU2ft2C/NcGPtGsB6V2M
	CZT28JXI28/inanLUQh7MosjTDwJH5w=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-Tu3sINtbNeKrJuH7I2hXug-1; Thu,
 05 Mar 2026 09:34:49 -0500
X-MC-Unique: Tu3sINtbNeKrJuH7I2hXug-1
X-Mimecast-MFC-AGG-ID: Tu3sINtbNeKrJuH7I2hXug_1772721287
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C0D5518002E8;
	Thu,  5 Mar 2026 14:34:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.140])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 815071800576;
	Thu,  5 Mar 2026 14:34:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 460A91800609; Thu, 05 Mar 2026 15:34:45 +0100 (CET)
Date: Thu, 5 Mar 2026 15:34:45 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Oliver Steffen <osteffen@redhat.com>
Cc: coconut-svsm@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Jon Lange <jlange@microsoft.com>, 
	Peter Fang <peter.fang@intel.com>
Subject: Re: Separate igvmmeasure
Message-ID: <aamSbgGZ-ziazEMj@sirius.home.kraxel.org>
References: <CA+bRGFpVnzG_zg1++0TnEQ_tHsXgwYG44=FZLRNVHwBB4t1wew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CA+bRGFpVnzG_zg1++0TnEQ_tHsXgwYG44=FZLRNVHwBB4t1wew@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q3DCcQWEEmNuYewxBGqvMfqJycu-rp469OrtmFzNrlA_1772721287
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> It has no dependencies on the rest of the repo. It is not
> SVSM-specific (as it should be, since IGVM is a generic format) and is
> also useful outside the SVSM usecase as a general IGVM measurement
> tool, for example for IGVM-wrapped OVMF binaries or other firmwares.
> This way we could publish it on crates.io and downstream consumers
> could easily package it.

Publishing on crates.io would be great.  Also turning the crate into
an library would be quite useful so the measurement functionality
can easily be added to other tools.

Moving it out of the svsm git repo is not a hard requirement for
publishing on crates.io though, so continuing to maintain it in
the tools/igvmmeasure subdirectory is an option too.

take care,
  Gerd

