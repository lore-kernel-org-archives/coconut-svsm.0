Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDAE230273
	for <coconut-svsm@lists.linux.dev>; Tue, 22 Apr 2025 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308624; cv=none; b=KaHwezSo+nn8F21YrMk+a/RGujkGE59wN2r/bvjfZPAtbDAwEO2OLf/A5XPU3dTYLJmoFLu6m/ho5sMQak+jG1BsNPaKei0cLvBkDF5VQW3oIPDAl3DfcC5PXUsUq5uXMNHjOi/Z7q1Q2eJZIZllUO/mhDRnuF8zHeDrRRyNQiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308624; c=relaxed/simple;
	bh=9Zr3D5R/C7DkBbiOBSPslIEkpH6oe3sjLkl+8ZFRInM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=E6gSgMqLjRTkPJVBNdymPcyKfacyo19tBKC18LutEt+HqTotToouSRhmj/jOvVvtMWNeuSqZL/iFkJwxzcirefS2AWiNomegJbw1osnq19y2BeVM9G8bhRNyI/f02geFzQ17U4iX91HKCxB6vMvQOgxVN3IoSoNeOJ3PdxWv5UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YknmOa2C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YknmOa2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745308621;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=ALTkil7fnngHJY5cAjFb5hFmpnQn9Vh+0fGmOTExobg=;
	b=YknmOa2CNoQsuZhqSU6YbcFafjnxU9YMlfn5vnITEXG+6Ch3tEDXXuwrNfEgzsCNjSkj4J
	1fQ8LiiBr8MvU7Vx8XNj2t4iAeFAGaAIHec1OhsK9MR8ZcDbgzRQUw1HWk0ub7L2C27bM7
	JVf3UP+88BkUsuVsqJSzsyTDhwdXbUU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373-szy_uoZJOtunzexoxymwgQ-1; Tue,
 22 Apr 2025 03:56:58 -0400
X-MC-Unique: szy_uoZJOtunzexoxymwgQ-1
X-Mimecast-MFC-AGG-ID: szy_uoZJOtunzexoxymwgQ_1745308617
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 366CD1800263;
	Tue, 22 Apr 2025 07:56:57 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.105])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B46211956095;
	Tue, 22 Apr 2025 07:56:54 +0000 (UTC)
Date: Tue, 22 Apr 2025 08:56:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, coconut-svsm@lists.linux.dev,
	svsm-devel@coconut-svsm.dev
Subject: Re: [svsm-devel] Potential project on implementing AMD SEV emulation
 in QEMU
Message-ID: <aAdLw-1y-Zcz7mme@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
 <06e71552-c890-1577-8967-4d44fb8bdf6b@amd.com>
 <CAGxU2F7=TuWMrbUAE0fqwfpb4A82pNqtaf63Fq59P=7h6U8tdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAGxU2F7=TuWMrbUAE0fqwfpb4A82pNqtaf63Fq59P=7h6U8tdQ@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VHPaRyGrnleWOzH1x7zaRl90gCcdiyBnsDG7XZZuFU0_1745308617
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 18, 2025 at 10:31:57AM +0200, Stefano Garzarella wrote:
> Hi Tom,
> 
> On Thu, 17 Apr 2025 at 22:14, Tom Lendacky <thomas.lendacky@amd.com> wrote:
> >
> > On 4/17/25 10:26, Stefano Garzarella wrote:
> > > Hi Tom,
> >
> > Hi Stefano,
> >
> > > yesterday in the Coconut-SVSM community call we talked about a
> > > potential project with the University of Pisa to emulate AMD
> > > SEV/SEV-ES/SEV-SNP support in QEMU.
> > >
> > > Joerg rightly suggested having a step-by-step approach, supporting SEV
> > > initially, as supporting SEV-SNP directly might be too much for a
> > > master's thesis (about 6 months of work).
> > >
> > > We wondered if you knew of any attempts already made in this regard,
> >
> > Nothing that I'm aware of.
> >
> > > but especially if you think it's a feasible thing.
> >
> > Anything is possible I guess, but I'm not sure what it would take to
> > accomplish that. Attestation would tell you if you're on real hardware
> > vs emulated hardware.
> 
> As I wrote to Dionna, I did not explain the ultimate goal well:
> Test/develop SVSM and guest OS interaction without having the hardware in place.
> 
> So that's why IMO it's perfectly fine for attestation to be
> unsuccessful, plus I don't think it's even necessary to implement any
> encryption.

IMHO attestation is required to make this fully usable even for SVSM
dev. eg consider the work underway for persistent vTPM, which relies
on attestation during SVSM. It would also be required for any of the
guest OS / application layer to test/devel SEV(SNP) support fully.

I would consider attestation in scope for any QEMU impl, but I agree
that encryption of memory is not likely a priority.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

