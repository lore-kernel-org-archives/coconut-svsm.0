Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766300;
	b=RSGu+V1t4p8k9fxI3Gswe2wWAvV2mA0lTIgQBfwtsrBCFiKWiKI+VN8fFnRwcVHiL5YF
	 6GSXl4ejOsGgo3OiLDsJ//JF5r0425rgGXEpa8wyModjOIsGu+w0A6zghA2n3gbYQvjOk
	 lKQ4Pyy+MOP7Je4w6Jck70aO4Ujv9ZHEjNMkDb/wCRqGHkM0jHj9CMtiyQuu2PHhkoLrn
	 AFRsexJwVOup4PTLG/2jY/Fh8yQeoMvLvqHpOy3VUsKFFrTiIQDkn88qrZO0yJa2T8ifR
	 jdobKrApoOdMYtEnv/1YeaDWTzDOG/fmG9GMSNpcqsk0+Jb6vNJJO28oUJZRAGh/fFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766300;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:In-Reply-To:X-Scanned-By:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition;
	bh=vojZeN+CXnWfVFY7/b8MlqBoq/cuPVXbAcITrAcerRs=;
	b=gi9KlQchXIL1QwaNtaV02SKlYyprZkVoWKwWIfTZxobRQ+ZbkN/5kphvc6pfaztZNH1+
	 W7mbqvR5Z2nqCdGhPdc/M09go5j0+1s41CoDpu7g/Jj1rwRGBCTyPxUWWFYn/gAGXV1vE
	 FeHLKB00SCDBSjzVR3RbuvGGEhkZYENaWCoHjt3KiMtJSarkuPGudhcrrEni7bYX9dPi3
	 GA+3795uAfRa5cOX0zPo5I2b7RnMRp1w2oub6mSb6WA8kNH2pS52dxwEI6mmOMPZaS3jk
	 Ptm5XbtVOXoAspeCpkJXQP4HV73RUELA12ahIjHGCIfRpd5Q/tilv99GbXBW6CMLbug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=emJ1O0Wq;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F5606A31E
	for <coconut-svsm@lists.linux.dev>; Fri, 27 Nov 2026 07:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E8F5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=emJ1O0Wq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795766298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vojZeN+CXnWfVFY7/b8MlqBoq/cuPVXbAcITrAcerRs=;
	b=emJ1O0WqfT2hUnZlW3Fxcxn9kMshjzgPi4lgHpKrkoOgz+A1vFrteqIeHywlSY4IZDLS9R
	w9CFoqBI+zNnxmdxuileU86i6R9pxOLT1CGPQB614FeoqEOyOVdyL6b6AppkOe7jsRiSHa
	bfyoqd7eT7iuZtU4iuyjHIunHit+UbA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-_ixdUWBeO2Kk9Dw4ZRBGCQ-1; Fri,
 27 Nov 2026 07:58:14 +0000
X-MC-Unique: _ixdUWBeO2Kk9Dw4ZRBGCQ-1
X-Mimecast-MFC-AGG-ID: _ixdUWBeO2Kk9Dw4ZRBGCQ_1795766293
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0C6618002CE;
	Fri, 27 Nov 2026 07:58:12 +0000 (UTC)
Received: from nucbdw.ghoffman.csb.home.kraxel.org (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C5241956042;
	Fri, 27 Nov 2026 07:58:12 +0000 (UTC)
Received: by nucbdw.ghoffman.csb.home.kraxel.org (Postfix, from userid 11758)
	id 0D49D40774E0; Fri, 27 Nov 2026 08:58:09 +0100 (CET)
Date: Fri, 27 Nov 2026 08:58:09 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, 
	Mahmoud Nagy Adam <madam@amd.com>, coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: Discussion on policies around minimum rust version for
 coconut-svsm
Message-ID: <awkz05_7U4lmN17K@nucbdw.ghoffman.csb.home.kraxel.org>
References: <d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>
 <65vkyfqwo92zb.fsf@amd.com>
 <awglpsRXwJRS7aa5@8bytes.org>
 <ef51cb7df408839ce80921d9133020c46da3c27a.camel@HansenPartnership.com>
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <ef51cb7df408839ce80921d9133020c46da3c27a.camel@HansenPartnership.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4QXD6DVUv3ShbFH1UmjNq6ihxFVsUS6WWkWsNfi_xQQ_1795766293
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> > Also Debian stable uses Rust 1.85, COCONUT is already on 1.88 with
> > the aim to go to 1.91.
> 
> Well that's only because of this:
> 
> https://github.com/coconut-svsm/svsm/pull/1277
> 
> And the rationale is dependency on this project
> 
> https://gitlab.com/kraxel/virt-firmware-rs
> 
> requires it to pull in a bug fix, but if I look through the commit logs
> of the latter I can't figure out why (presumably Gerd or Luigi can
> explain);

uefi-rs (which virt-firmware-rs depends on) raised the bar.  The
dependency update pulled this in.  Note that virt-firmware-rs does
not require the latest version ...

	uefi = { version = ">= 0.39, < 0.42" }
	uefi-raw = { version = ">= 0.15, < 0.18" }

... so pinning uefi + uefi-rs to an older version in coconut should
work for now.

It is unclear how long that will hold though.  There have been
incompatible changes which affected virt-firmware-rs in the past, most
recent was the 0.38 -> 0.39 update (which why 0.39 is the oldest
supported version).  It will probably happen again in the future ...

take care,
  Gerd

