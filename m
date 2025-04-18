Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECDA26B097
	for <coconut-svsm@lists.linux.dev>; Fri, 18 Apr 2025 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963942; cv=none; b=Kdbz/x9AQbxjK8HLmVJNXvj7Fr4MW+dZZPnttf/MOQDcx2C+iCy5tXtVYKorL8Nio96GhlyZkTbqiprWB5HbDcD8Vy/YSXFg4ap34tC3MNK+SIs8XoL/DSfZpdQENyUWx/JlFMvdlPrlWcWp6/1AwEMIAFrw1rzWajdLkqvD6Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963942; c=relaxed/simple;
	bh=hz5CWEz/bgK/a8V7LITNGRZWWud+pqwBhI/SqU0LRUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IwV9OVIsN6CGBns/svHxlbUS++3IvmzazL3TQMVwBjd+7UAfuN8M072NVwULE41ozN9FZuGeLjB6uEch+acM3SiqQS1rvIGsW6Wb6XxXtbgMPq2SS/6pYSoDQbptqWngl+myggxCukcK7D2hsUjZ0C2leRIcu7ublYcx+H3Gfp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CmHw1SIA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CmHw1SIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744963939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hz5CWEz/bgK/a8V7LITNGRZWWud+pqwBhI/SqU0LRUI=;
	b=CmHw1SIAqB1qiFNv5h/Ld45ZV3c1/zrBChMl9gs3KBY98+RYnfsXjGtZVV0XUQpVvmTZej
	7gwpos5wYA9llowUg5Y2Vxn/pYOgZwAtisU3ZaEoJxjq3gvFy/4CunzBH5U9tVHeH28Xx4
	zVUThDhiaomeM+hpOodmt5Vg4s45gLw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-vONvKFbcPIiEqaI3GJYc2A-1; Fri, 18 Apr 2025 04:12:18 -0400
X-MC-Unique: vONvKFbcPIiEqaI3GJYc2A-1
X-Mimecast-MFC-AGG-ID: vONvKFbcPIiEqaI3GJYc2A_1744963937
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-70552c16b9cso18141777b3.3
        for <coconut-svsm@lists.linux.dev>; Fri, 18 Apr 2025 01:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744963937; x=1745568737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hz5CWEz/bgK/a8V7LITNGRZWWud+pqwBhI/SqU0LRUI=;
        b=ASU1BTRmNkV4ugBLeI+rBdBanvNb2q/l21WfUgTnrGritmYx9G8TtsQuNreSqGcPO7
         5MGjGd3EatPmzdRixS9btnSTxSdmApBy8umZfE5dvLm1h3QW4U+LSZWu4Jn002k8pmzX
         LFRi5vXRXRgrna5fasG2NIFQLeYSPVK3PYTYFQ8alJWyTlyO5yVlg6q6yfdd6KJ8eus9
         x+1Lx1cMEJQQZIsZ2J6CVwEKnIrLX/IBToePm1JwV1/4Iwb8w1U16Q1FquIP/H0xyFeV
         5/4J5dOFM9fPQoxiD/VsDTyElVxYCzcL8BmRtcIQwi8u+re2x1GeWUYurW5TMkDTRJpF
         Ny/A==
X-Forwarded-Encrypted: i=1; AJvYcCVhUHXqO4/Boh650YWq/qNu2M+5EXj+eB0L6fnuYwPRLgW1Ns3mpBjfITz0iu6DNADl1nUNuS6JpbQU+l8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlJfZzOzsygjPEn48nprXV7AKkw2Hze9kCXK4fbraFehIS1MPM
	rCbMPS52fg9zA8CZRVr5NxZvwmawgrp9qHrM1ItGOpiG6G1QGAEYv7KXoXgYWyr4h3WXM2QMcI5
	jbz05Y/olNYlbzaF6CrUmxhhq1MhWf7Ri+Ys4Rkwl4dJKEn0Jp+NeTLsE7Z5T8IR5qbL1w6x2Om
	vu+xa2LGN9s2YjgUtFypLWcaNpGTM7GXoOJtp7
X-Gm-Gg: ASbGncv3ieMlYM4dtTiXF8RPRLCJljw+XB4t+doo2ly2jZl1I3h29yjvYYFJrV4dq4D
	YOFGYd5dVeIq7S85H5dbcGAA9knT58EDuoP1nKm3lpUxTsQg+M3h4lJZRnxVKm3+Nsb9L/RY=
X-Received: by 2002:a05:690c:7084:b0:6fb:a696:b23b with SMTP id 00721157ae682-706cce3e6dcmr23072777b3.33.1744963937313;
        Fri, 18 Apr 2025 01:12:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKT5/9Wtz8NNxHTdj+KpEXRxDoyfyYPcEWeTxpexvvRrIx2Wxm7T1o1yXYkh2RZDDciHACkDwD0zn4OxD5wfc=
X-Received: by 2002:a05:690c:7084:b0:6fb:a696:b23b with SMTP id
 00721157ae682-706cce3e6dcmr23072617b3.33.1744963936930; Fri, 18 Apr 2025
 01:12:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
 <CAAH4kHb8MsVtCSpAS7UCBN_40yjCKapWC0H1Z=cmvf4m9oErKw@mail.gmail.com>
In-Reply-To: <CAAH4kHb8MsVtCSpAS7UCBN_40yjCKapWC0H1Z=cmvf4m9oErKw@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 18 Apr 2025 10:12:05 +0200
X-Gm-Features: ATxdqUGVKfEAzDsgpQ5d4oXm8umQr-3qA2n-htyLnUDpd6UIXjT0zuyEm7wV3t8
Message-ID: <CAGxU2F7P4ubMKDNpXdtO0q2shf4pAfBsGmDdAoKh98GWO4DM-Q@mail.gmail.com>
Subject: Re: Potential project on implementing AMD SEV emulation in QEMU
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, coconut-svsm@lists.linux.dev, 
	svsm-devel@coconut-svsm.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M-hByk9STDJGtB5qYVbbxd99mU1ahJj0PYCSBwvN6js_1744963937
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Apr 2025 at 18:08, Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> What do you mean by emulate? Fake the MSRs and CPUID, or actually
> provide some memory protection value like the pKVM project?

The first, perhaps I should have explained the ultimate goal better:
Test/develop SVSM and guest OS interaction without having the hardware in p=
lace.

Stefano

>
> On Thu, Apr 17, 2025 at 8:26=E2=80=AFAM Stefano Garzarella <sgarzare@redh=
at.com> wrote:
> >
> > Hi Tom,
> > yesterday in the Coconut-SVSM community call we talked about a
> > potential project with the University of Pisa to emulate AMD
> > SEV/SEV-ES/SEV-SNP support in QEMU.
> >
> > Joerg rightly suggested having a step-by-step approach, supporting SEV
> > initially, as supporting SEV-SNP directly might be too much for a
> > master's thesis (about 6 months of work).
> >
> > We wondered if you knew of any attempts already made in this regard,
> > but especially if you think it's a feasible thing.
> >
> > Suggestions, ideas or partial works that can be reused are very welcome=
!
> >
> > Thanks,
> > Stefano
> >
> >
>
>
> --
> -Dionna Glaze, PhD, CISSP, CCSP (she/her)
>

