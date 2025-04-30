Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6388223906A
	for <coconut-svsm@lists.linux.dev>; Wed, 30 Apr 2025 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009050; cv=none; b=Foy41KubrOCzY2ARWiUShAx+lWkbgx4i2Dy64W1A0NVytxklrmcBFBNSDNkphN6xcwN15OfnndDg9D3RmLrsT1/KRVfvs8rCvWC2KyhvLnfZA9NqCO1BAmVSJIyKcpnhYv/4HrKhp6kxQUMOEpbAlGuo+Eij0+mFp/sxxYtlwFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009050; c=relaxed/simple;
	bh=JUi2RUx2p9l4euBQygPb7mE/lWlUUBPoj25Zc7OYzVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUMPCv9g0OHhjtvpfvOMLUC/H4bgfEHySSxeINlSeFnI34MpD3vxjAuv4+aIwcVzKLXvSq5cnd0xHEDhCaq2ohCQzWybaKuPHNvK6nm0fEhaJFFpg0Yxm+Rzboxh8XFQ2w+C8OGHFTPLXnCUtdSRE0Db3vkUosfdi1yr4QRBzLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IfXd4k8I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IfXd4k8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746009047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RYIswrDirNEOHKP6GS3p17qELFAH3c5E5ZMnKcMbNvQ=;
	b=IfXd4k8IjUlepevRO6d640XpVlWjekZQjBx/NjaGXP+Nc5EqKuG/Al2U7RGgoOfkRpjgHa
	rKgyiWk9yhmz+dlzcAo3bZ8BMin6hEsOdHzPx7nZOcXUMUC1RWPuuhH1z1vgA994kuO0vJ
	j9jQ4bsILqB2jIDs7n07JuIkNj88Pvc=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-xCBbC0ClMRWaDmt-bkUevA-1; Wed, 30 Apr 2025 06:30:45 -0400
X-MC-Unique: xCBbC0ClMRWaDmt-bkUevA-1
X-Mimecast-MFC-AGG-ID: xCBbC0ClMRWaDmt-bkUevA_1746009045
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e72976110faso8538062276.3
        for <coconut-svsm@lists.linux.dev>; Wed, 30 Apr 2025 03:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009045; x=1746613845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYIswrDirNEOHKP6GS3p17qELFAH3c5E5ZMnKcMbNvQ=;
        b=TLFI274IE0P/B45SDS4X9RnBBVYZ/d/FB+7bwr3AsZUTdL1UV35JMiJ2RJeISNyxWm
         8SSShlw9iZIBpLR/2pAuxDsejccQHdeY7l05uFjQCOES3x/WCrVtExk9ihe1SJBDFhox
         Q0089aeVZ+XmueHYxtT+wCC+y4BQy3Xe/QygeXNjZtczzQ0YOOXJkUpsEwJbtPxv71YE
         CgqNj5DTQdinh+gre+iV0okMJ6Fp75CQKztsEUZofmCpI3FtVMJao+SuH9KA+hwEGSb6
         dgazsvHqYzUE5si4A5lide30+4b4X2CYz11sfNy4wHa47E3cQDnSJt/M8z6R5AGUDIv7
         pYWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT2NMMi48PBwCEAKt32wDeHMgD2SYuEXMXFOQ0sLXR5SZEQQDSdbv8u3uX0L/AyFyPqj7o7NWFoS4CUYM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5DorIghudbi54URCpNmUnRcCrRQfmvqxvuBqifnONzCs9jV6Y
	G4lccPg+sV5fz3PvKgODJ5H13Ql/s+qJM3KJeKXON9XcQvHQ29vvvBbHt+2zR39aInMpCIJ8SmD
	aB+0gRn8miuFjSriSfsSWCO+GN9ZsHntWoO/wyubNVwSPmClofxAVZlH05bcEEVrEkucWZDzlr2
	FVL2PDmcZZ5yxNGfPUekcK4PS29hxhTwAiC3kq
X-Gm-Gg: ASbGncsmwHhp4RnzajHcEppsYt9qFcMZ20OEyilTRbfwCb37pqIQbnEabhfPIsk5QcI
	g69T2L2VXRGaTIF4H5jh/JzAk9QWCyDiuGqgdIw+tAmIGCcDXuDmMW/hG2lyjRsTVnrUhXNs=
X-Received: by 2002:a05:6902:2603:b0:e73:281d:6828 with SMTP id 3f1490d57ef6-e73ebfd4369mr3176423276.39.1746009045201;
        Wed, 30 Apr 2025 03:30:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUAd9xYGm7adKWRNYdEA0/mb2Fi5f4YwSgHbUATSxW7T/1pRBY12HqLIGsHIS9a0VVeRGFkNrTiTcmbDc7xro=
X-Received: by 2002:a05:6902:2603:b0:e73:281d:6828 with SMTP id
 3f1490d57ef6-e73ebfd4369mr3176386276.39.1746009044880; Wed, 30 Apr 2025
 03:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <25558.125041610080302253@us-mta-166.us.mimecast.lan>
 <CAGxU2F5aM_GXbcbOocrwpsGS4H+1i7O9xM4MhKrx8ycGOgah=w@mail.gmail.com>
 <96587.125042918523400199@us-mta-360.us.mimecast.lan> <e1ade6fd-53f9-43d1-a270-4d233194b4d1@redhat.com>
 <23479.125043001203100291@us-mta-656.us.mimecast.lan>
In-Reply-To: <23479.125043001203100291@us-mta-656.us.mimecast.lan>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 30 Apr 2025 12:30:33 +0200
X-Gm-Features: ATxdqUFq8QVkESlD8Ni0VXWtTwVkdVva-PtNLMkVPnN-y_ZnIhQE0AEai62Vtrk
Message-ID: <CAGxU2F48gwHSam_9_zus+=3ze4mubJEpo7u-L5jMu8j+0ufV8g@mail.gmail.com>
Subject: Re: ECC keygen for PR #528 ("Attestation driver and proxy")
To: Nicolai Stange <nstange@suse.de>
Cc: Tyler Fanelli <tfanelli@redhat.com>, coconut-svsm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _X80z03pxd9_bF1uccBuo4Y19j8-sW5DvdcpaurggLY_1746009045
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Apr 2025 at 07:20, Nicolai Stange <nstange@suse.de> wrote:
>
> Hi Tyler,
>
> Tyler Fanelli <tfanelli@redhat.com> writes:
>
> > On 4/29/25 6:46 PM, Nicolai Stange wrote:
> >> Hi Stefano,
> >> Stefano Garzarella <sgarzare@redhat.com> writes:
> >>
> >>> On Wed, 16 Apr 2025 at 16:08, Nicolai Stange <nstange@suse.de> wrote:
> >>>>
> >>>> I managed to carve out and cleanup the first batch ([1]) from my wor=
k on
> >>>> an encrypted FS by now. The FS cleanup itself is still WIP, but the
> >>>> crypto parts should be in a usable state.
> >>>>
> >>>> As mentioned on last week's svsm-devel call, it might help with
> >>>> addressing those stack size related issues with ECC keygen in the
> >>>> context of PR #528 ([2]).
> >>>>
> >>>> I prepared some example code for generating an ECC key with NIST P-5=
21,
> >>>> to be found at [3].
> >>>>
> >>>>  From some lax experiments in userspace, peak stack usage is at abou=
t 2.3kB.
> >>>> (Which is still way above what I would have expected, given that no
> >>>>   buffers are stored on the stack. I'm currently investigating that)=
.
> >>>>
> >>>> I'm not sure whether merely generating the key is all you need -- FW=
IW
> >>>> there's also support for ecdh, ecdsa and ecschnorr, in case you're
> >>>> wondering. I'd be happy to come up with some example code for these =
as
> >>>> well.
> >>>>
> >>>> Please let me know if you have any questions, either here or in toda=
y's
> >>>> call.
> >>>
> >>> Cool, thanks for the example code, I guess this can unlock for now
> >>> Tyler's PR and FS support, but as we discussed yesterday in the
> >>> community call, the long term plan is to use OpenSSL/BoringSSL. I'll
> >>> open an issue ASAP to track that work, and I'll start to investigate
> >>> it.
> >> I've implemented a BoringSSL FFI backend as a configurable
> >> alternative
> >> to the cocoon-tpm-crypto now (example code is updated accodingly), and
> >> did a POC integration into SVSM, c.f. [4]. Good news is it still boots=
 :)

This is really cool, thanks for that. I hope you can open a PR soon
and I'll help reviewing it!

> >>
> >
> > Thanks for this. I'm currently updating PR #528 to use
> > cocoon-tpm-crypto for generating ECC keys. For now, should I err
> > towards using the BoringSSL feature?
> >
>
> That would become a Cargo feature ("boringssl") for the svsm kernel
> crate, but yes, we can make it the default, either in the Cargo.toml or
> by specifying it in the Makefile as it's being done for the vtpm IIRC.
>
> One note though: the cocoon-tpm-crypto in its current form depends on a
> 1.86 toolchain, while the svsm fixes 1.82. Either we bump that up, or I
> would have to go figure which of the used language features are
> incompatible with 1.82 and somehow fix that up or work around (one is
> upcasts of &mut dyn's to supertraits).

We already have a PR opened to bump to 1.84, but I think we can go also to =
1.86.

Thanks,
Stefano

>
> In either case, as the integration of the boringssl build into the svsm
> environment is non-trival (see that demo POC [4]), I would leave that
> part at least to a separate, dedicated PR.
>
> Thanks!
>
> Nicolai
>
> --
> SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=
=BCrnberg, Germany
> GF: Ivo Totev, Andrew McDonald, Werner Knoblich
> (HRB 36809, AG N=C3=BCrnberg)
>

