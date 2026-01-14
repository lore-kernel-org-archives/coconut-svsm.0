Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335E62FFDC4
	for <coconut-svsm@lists.linux.dev>; Wed, 14 Jan 2026 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768411430; cv=none; b=gr0tjspIrrDtNqbBCF16yrcrJ4OeUdZhPYrCSUoz1HT+Iwh63oTf6/neGQ2L70omO605t11qBM2/sqh9D/URT1iu7LmHPSh8yoHRIuXeNR87A4642A4ygLkaF71QHVlRnuMget6KFI3p4DbVsT55ktRLC1jKM4F5SSfblQS965s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768411430; c=relaxed/simple;
	bh=60/pCMec5sbW4vCXTi6czqr8fDOa6GUGG4jkRyNpklk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rp5fGgfNR0ofZr51CcDXJV196aNmnn8zzrQjQW83uKo9xIs6no5d9tBa7xoH8Sm6ICsoE0ycGPB5Z/3gvr4aw7YCinVGvP/lf+ssUj3edjmpDmBF5ooSeAu9NOuUZDUQKKeXzJKiY5+7NiQ3dqRcnEgngCqjcOOCMrqaxf/rbsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ye0tiv8L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ye0tiv8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768411428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nMtXDHWeunBz5/gEAqWBNjnjMLZuqV4POcsc21pJOGw=;
	b=Ye0tiv8LtSQYyFBY8W6u0sWoe0CQo1kr/locHV1qvL38FMyoS/0ruFhGWdpT0wcJkw1Tgv
	zYLLOu5tx0c3+nPcNkVa+KD/G2GfKtvUPJ6avVHHDlTsAbxsDBOfmY6PZ3kYRrAWmNxZW5
	whceveOhdLPgCHkeHluNGtu0DZJiKJw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-CG1_hCEcNiCGIowt0m61ww-1; Wed, 14 Jan 2026 12:23:44 -0500
X-MC-Unique: CG1_hCEcNiCGIowt0m61ww-1
X-Mimecast-MFC-AGG-ID: CG1_hCEcNiCGIowt0m61ww_1768411424
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ea5074935so8187762a91.0
        for <coconut-svsm@lists.linux.dev>; Wed, 14 Jan 2026 09:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411423; x=1769016223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nMtXDHWeunBz5/gEAqWBNjnjMLZuqV4POcsc21pJOGw=;
        b=gcz0PZ0WIj1JkW+IbTh7y0ReY9nIIhniyM9aXm4l3JvqZiqDZGKrtZw+PNIRts2WHK
         keEVOm2qF4TaKhGJHmh0xrNV3/SK7hubGfDwplU35JSWAFbEzeHtTTNY5AuOV9777HJx
         SrPEUb2c0wT8Jelpigrs6FrmyYVUNZ4ZyHQsa1vzVezfmxnsahZDCQOjt0FeviaEwYOI
         bxng18rCMwoGb7D6Ne0UxzBw8UB0Uc+ybK1mO21uIRsYsN1zUuvJqeJFm6bKACN0GLl1
         NL824RKIPiVT46GDURrhXk+N5K8pZbipubMQxrU5VqKTPyd8jWttl/xybcu7Ju+/b7In
         3/ww==
X-Gm-Message-State: AOJu0YycUOqt+z+FFTfjYJZgbzXpLv+mNFqMYFXnra/VLE0yuWDoK62a
	eNR1Rgml9qlvyejVor8+I2xwWFZZbhtnyn1B5yZ4y+ShincBLVIJRsHLdBmYViU34F3PdRm+7bl
	FueorW92mPw3xgOq+H2UTEamVHL0dffQgmzqQcMxr+KDxqbVwSxqJ+bhZP9OUgb5I5X8FbjHvt5
	7+Uwr+LeiDDIdtAQPVIgFLaR41DON/z+Xb+exdezU/x3C9zX0atLg=
X-Gm-Gg: AY/fxX7f89mWemFr5+TKoD+J4NDpXhXmG6pIkjzIeW0JzIqgUi7bLV+EWgxYOimbqbF
	DsFYiWW5d1zzCVvJ6MolBcLN4v9BHLBVVRAFkFJEeY6RbdwMMcaYRHpbNzr2/rzAfzXbGLvuXOi
	AqPE1KM1NrTCp6X5yocH+M+kNw/kVJCg3QSos6tuig14pBMwPFdoUFqO2QylIzKDRA
X-Received: by 2002:a17:90b:54cd:b0:340:f05a:3ec2 with SMTP id 98e67ed59e1d1-3510915b86bmr3251591a91.17.1768411423334;
        Wed, 14 Jan 2026 09:23:43 -0800 (PST)
X-Received: by 2002:a17:90b:54cd:b0:340:f05a:3ec2 with SMTP id
 98e67ed59e1d1-3510915b86bmr3251564a91.17.1768411422892; Wed, 14 Jan 2026
 09:23:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tlhepq4dp47rbq3vpzm4qtf65t62fqe26tk736sd3ulcbwcefy@btzt3fsapu5e>
In-Reply-To: <tlhepq4dp47rbq3vpzm4qtf65t62fqe26tk736sd3ulcbwcefy@btzt3fsapu5e>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 14 Jan 2026 18:23:31 +0100
X-Gm-Features: AZwV_Qh_viSj5DvQpQuH2QF-Ny9GEAUvVoMMAgbCU7LqdsD76dwJ16psjJIM_TU
Message-ID: <CAGxU2F7Q1Kxr5OPKpKO84cVvsm=2YU1tABJM3YxMPwX0Rfh_uQ@mail.gmail.com>
Subject: Re: SVSM Development Call January 14, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FDJEaQM04AgaG6qn8guSbQWIL6xugzqu00QOsE_peCE_1768411424
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Jan 2026 at 19:36, J=C3=B6rg R=C3=B6del <joro@8bytes.org> wrote:
>
> Hi,
>
> Here is the call for agenda items for this weeks SVSM development call.  =
Please
> send any agenda items you have in mind as a reply to this email or raise =
them
> in the meeting.
>
> Stefano will run the meeting tomorrow (Thanks again!) as I can not attend=
 due
> to travel.
>
> We will use the LF Zoom instance. Details of the meeting  can be found in=
 our
> governance repository at:
>
>         https://github.com/coconut-svsm/governance
>
> The link to the COCONUT-SVSM calendar is:
>
>         https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-sv=
sm?view=3Dweek
>
> The meeting will be recorded and the recording eventually published.

As I mentioned in the call, QEMU community is open to host some
COCONUT SVSM projects for GSoC 2026.
You can find more details at
https://lore.kernel.org/qemu-devel/CAJSP0QVXXX7GV5W4nj7kP35x_4gbF2nG1G1jdh9=
Q=3DXgSx=3DnX3A@mail.gmail.com/
Also, you can find proposals from the past years here:
https://wiki.qemu.org/Category:GSoC

Our goal is to come up with a couple of projects related to COCONUT
SVSM by next week, since the deadline to post them to QEMU is Jan 30.

If you have any idea in mind, please share with us :-)

Thanks,
Stefano

