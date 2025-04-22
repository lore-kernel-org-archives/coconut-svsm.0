Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8B61EB5E3
	for <coconut-svsm@lists.linux.dev>; Tue, 22 Apr 2025 07:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308384; cv=none; b=C0DrYNMH4p/z08AzegeWM9nhf8xCqzy78nzQCtukH8RzOtZ1df4kMOej0lXWZXmmZMurFjCf1AaoUaGN/UMJMmSQQTzRYfOkm0pTcsTZUFYSVFa796xMWfpKESZFHtnEJ8Y+KcjE41MNOqMnDOCH2kBis9NN6f9mavYzQKRwYl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308384; c=relaxed/simple;
	bh=dPFsEHoRTbQ1m2B+jbk4qiRqOB1cyta1eiU7fuOnCnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=sgOLu6yfG3X73+QcY2C+GWUadfv0w4afUlgDSUV3zaPLgA6Y42gToS24szJTDxDQNqF3Y/MKKPtTXzSyXD+1GAdMB+nd9r+njRDVCyCyXuXRCVFvjoaCVafSaZ0FzYtIdRWzqYK0P8W8Wt3NyqSxp9QoCnMJxRgb7iqa2sGjEXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BER9E8hX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BER9E8hX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745308379;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=ux1E3t+ETmTpkwCxwrXB/lJVCMHxtN9pqudyWAlaU9I=;
	b=BER9E8hXshTNwK/BTlOFi4ndcbvbaKidBD7e05LmAU8FuzOHQgO6znjRJRo2JfFdkVyoO5
	pqmJqOf2r8PV4FpI3O1JInhAF0YLNIHXq6kkzXiwjSRufj4qLN7ahEIfxZjLGi4Yp4Xm4w
	Qd1gzQ194BaoF0j1Tm6p22eq1rQ6UPk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-64_zuUunPa6DmJcnFKsSJw-1; Tue,
 22 Apr 2025 03:52:56 -0400
X-MC-Unique: 64_zuUunPa6DmJcnFKsSJw-1
X-Mimecast-MFC-AGG-ID: 64_zuUunPa6DmJcnFKsSJw_1745308375
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DA1CD1800370;
	Tue, 22 Apr 2025 07:52:54 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.105])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D6B919560AB;
	Tue, 22 Apr 2025 07:52:53 +0000 (UTC)
Date: Tue, 22 Apr 2025 08:52:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, coconut-svsm@lists.linux.dev,
	svsm-devel@coconut-svsm.dev
Subject: Re: [svsm-devel] Potential project on implementing AMD SEV emulation
 in QEMU
Message-ID: <aAdKwgeBO3ILBwcJ@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ngVmBALHbipvpaktZw9tg0hgAAaNfzkQ67CbvK-6xtg_1745308375
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Apr 17, 2025 at 05:26:15PM +0200, Stefano Garzarella wrote:
> Hi Tom,
> yesterday in the Coconut-SVSM community call we talked about a
> potential project with the University of Pisa to emulate AMD
> SEV/SEV-ES/SEV-SNP support in QEMU.
> 
> Joerg rightly suggested having a step-by-step approach, supporting SEV
> initially, as supporting SEV-SNP directly might be too much for a
> master's thesis (about 6 months of work).

Agreed, from the QEMU maintainer side we'd very likely want to see an
incremental set of patches rather than a "big bang" attempting todo
everything in one go. Staging patch submissions for SEV, then ES
then SNP would make conceptual sense, to enable something useful to
be delivered at each step.

> We wondered if you knew of any attempts already made in this regard,
> but especially if you think it's a feasible thing.

I think 6 months is possibly on the optimistic side.

Non-trivial feature proposals have a habit of taking longer than people
expect upfront. They might get lucky, but I equally it wouldn't surprise
me to see patches go through 6-9 months of reviews, on top of the initial
time needed to write a first impl before submission, with multiple
repostings needed before being merged. IOW it could be 6 months,  it
could be 12 months.

I don't mean that to discourage an attempt. Just that non-trivial open
source contributions with fixed timelines are not a reliable combination.
IOW, plan for what happens if it takes longer than expected, exceeding
the 6 month thesis timeframe.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

