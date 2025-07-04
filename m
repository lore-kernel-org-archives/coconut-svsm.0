Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8146470805
	for <coconut-svsm@lists.linux.dev>; Fri,  4 Jul 2025 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625377; cv=none; b=gTvtO05ulKwS8JO6MfFpuBz0HK6WEsKEcrVkoJNnPAGbRouN9+CGS4wQYHpmh/Z+n6V59o4jF9D6jBo5XSGcxGw9NWQ+AuDs3NaAGqPnj1sXRgoMuxR1wqqh1y71ese5vV8hvnVZwmavWWiliSNb+QDO67GQqNxQnBugo7fYczY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625377; c=relaxed/simple;
	bh=l0/tyU7pMGaKOdFBDGOVJ+MC0CXCxJS74mx2wEM+UaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GlqWJKRNVurlfLuadFtR71E/yHiQKnn2F/uvhfUnNo6e0c92np+6U6AfE50zFd+csKuiS9l//mN5OPCL2fMvdcqG/a/9l2GNlgOGgkZuPnFq1mHckSgPXmDe3X+ifFCH1vD56syGfdQvgm3VFj1JX6R4cFn1qVgB0OxY93e+WZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NtdpXHfj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NtdpXHfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751625374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ot6yPccflvcxPwDhs27wIU2XUm972/rUkUrKXdsGPQw=;
	b=NtdpXHfjDMJzOTC2axiRxV8OhVVlhmHOL7td9IZnvFUVnt3BC+a4Zm8cgpZYHM2P1uxCRV
	3FjlkwAp5J8Q7Q2nTMZXDIee7a59TMMyMV5kXIcoU+szn9PLfYFq8RxxZEZRj9PNcoTXmk
	sHgrgSlcwY5DuC4eLGZYf1TIRf2eoUY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-zTzqMG_dPWaVDTqKUU23AA-1; Fri,
 04 Jul 2025 06:36:12 -0400
X-MC-Unique: zTzqMG_dPWaVDTqKUU23AA-1
X-Mimecast-MFC-AGG-ID: zTzqMG_dPWaVDTqKUU23AA_1751625371
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 506F218002E4;
	Fri,  4 Jul 2025 10:36:11 +0000 (UTC)
Received: from dobby.home.kraxel.org (unknown [10.45.226.81])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A16AA3000218;
	Fri,  4 Jul 2025 10:36:10 +0000 (UTC)
Received: by dobby.home.kraxel.org (Postfix, from userid 1000)
	id C5E1C49160C; Fri, 04 Jul 2025 12:36:07 +0200 (CEST)
Date: Fri, 4 Jul 2025 12:36:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call July 2nd, 2025
Message-ID: <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
 <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BImgxQSnXVFDLgcc0Y82n9v0HwbtE9R2pWerR5HqCQs_1751625371
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jul 04, 2025 at 10:12:03AM +0200, Jörg Rödel wrote:
> Meeting minutes are now posted:
> 
> 	https://github.com/coconut-svsm/governance/pull/65

<quote>
  SVSM deciding its memory needs and informing OVMF. Peter Fang started
  exploring this, but it's not trivial and will take time to establish a
  good protocol for memory consumption and handoff. 
</quote>

What exactly we are talking about?  In the call alot of the discussion
centered around tracking the state of pages, and it wasn't totally clear
whenever that was an independent discussion or not ...

From OVMF perspective I don't see this as a big problem, assuming we are
talking about static allocation.  The memory discovery code is designed
around e820.  Typically OVMF simply loads the e820 table from qemu via
fw_cfg.  But there are multiple ways to get the memory map, when running
on xen or cloud hypervisor things are handled in a different way.
Adding one more option for svsm surely is possible.

So svsm could reserve some memory block for itself, even dynamically
sized (looking at CPUs and memory installed to estimate how much it will
need for page tables etc).  Split the e820 entry where that memory is
taken from into two, one RAM and one RESERVED.  Pass that modified e820
table to OVMF, or provide some svsm protocol so OVMF can query that.

take care,
  Gerd

