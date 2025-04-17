Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C704A347B4
	for <coconut-svsm@lists.linux.dev>; Thu, 17 Apr 2025 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906101; cv=none; b=K45T5zEBis5VzgNLEIEU+TE/AM4xiUwEfjL8heijsRovtt6lNZMI7ioyJOObjHppxX4dbMj6+FmlDfxDc1KaDSchKe0JhsxjeZ0z3/019uUsMoa8YslrDpBzaFgsQdX1plobVuqE+Wrwc6b2pfeJ8sP8feKyf9sBdZ+mKbH4oh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906101; c=relaxed/simple;
	bh=oMDv55V7ptbZVzIu7J+XPtA4lT/bLIPJqwXae6kAVhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gAef2JHUjRatZCsmJpUgtL/PZvSrH8TqDek8fqZ9iFUbbw45vs7ykraT7nNE9gKrAmhvL//6we3mlH8GF9hv/LOAts6FX1q+gLlm5PAxmCf2ZFLKuBOga1wUiuao3R/k5MFAkkhRheTy77Yr5i7KTlx8t6gqQey0KgSRIiFjbE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UhuX3kBE; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UhuX3kBE"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac34257295dso186030966b.2
        for <coconut-svsm@lists.linux.dev>; Thu, 17 Apr 2025 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744906098; x=1745510898; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMDv55V7ptbZVzIu7J+XPtA4lT/bLIPJqwXae6kAVhg=;
        b=UhuX3kBEbBVgr0KD6VHuggGM5w+ZjpAeB47T1O0tuigMsr3NbAHwFT0uB0yMfPPgfn
         StXPGeI+e6bLtvRR9b+Tg9SagJ9WWbY6EskQHih3ZfPuWncx2UuyNIw0pIqDayc0czXT
         45OmmnXpn5NNLoqrPcud4SXQf2amfXSfmNEOc7cG1gAM2fjB/i4/M504NiRQd3IZ/ZGm
         UmPPjyH7T/dt/40ar5k1JVKPsajMeBA3NEpqc6LyG3PrVHzZQknYWVFLU15a45OqiJad
         E5bF3GHgQwXvrKA1nlRMCXq8gtm9yG/9jy61KLCa6kf/YhqDW/1q1IsFP1Q2JzY3OB4Y
         JjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906098; x=1745510898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMDv55V7ptbZVzIu7J+XPtA4lT/bLIPJqwXae6kAVhg=;
        b=pCRZ4TbAunTKuK963IKLKEUeq+LbV5wV18tQBcwtHXuspaciY6fZ2M8qCrchKi8An+
         dlpNH7z3e9MIXAps4SR1it6EuWAUtZ966r0uHafZhv+kiC2oyAWWb64AHxJK9ZbRncP1
         xGcHjC/y0LqcOq7io4wOwOrIUUV112cMTN/gjP1TewMxP3SpkgEENO91/GTgr+Bzk5As
         UPgM+e1PvslXzbHsr+Eyb0lGuwPOlF0xiUpA7AReX1LAe7TrNjR3Z6d0iUwolkFbjzDu
         4XwylMbx/WDw/iC8qDpVnc/zAmt1q4p3r3cpNwCMvVm+KrljRtqwqsiID8/Ts/FpQHX/
         T08g==
X-Forwarded-Encrypted: i=1; AJvYcCWRX5FJK+shSoIwoLFAoh8IKdkfKVdv9ramM76k/UuJD8Rb9/kLZO+NLPhUSX7OABTmbNX6WhmgdANlcd0=@lists.linux.dev
X-Gm-Message-State: AOJu0YymKXzs2Ez+6r7au3PFe3xZo7N9evuLRAI39SACMuPeY1Jp9b1T
	HnPgUplgLWNsXYM8h0gi0hhguL8aRp5NmRrmfcGSlomDqsRcF76P/Tl/06gsrv7Poy06YAjGtWn
	6FKeiBgy04MvJ6mZ41jvsBoSUbsHHGZBMvEtkMZM2xAN5k9jB5g==
X-Gm-Gg: ASbGncs5noVAMvMTPcKrZ3d+TRmrCY+BO7H85B32MOhGZZy76Gn7iLxy+uoP//J1LS1
	2QyV6L/5FPMrSrDKZMrDYBysk2ygjEmQJyrx5rcqhOeFb7eP6T9WXkkOQy+K8IhG2JZeCWP2N9X
	Qe8znBiEoSwUFRB4Z1n2jtY0TjZFXej6X+l8xptwzpSdKaedIAQlp6
X-Google-Smtp-Source: AGHT+IEp6yZbnTWyItE6HWQkDGS8AAXxa4C5SZGsp6penqwD8QtOeAYE1ju07e2ugJmjVSGeX/JLbzeWtaLM7tBGxKk=
X-Received: by 2002:a17:907:7da2:b0:acb:107c:7aed with SMTP id
 a640c23a62f3a-acb42c508ccmr551787566b.55.1744906097751; Thu, 17 Apr 2025
 09:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
In-Reply-To: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 17 Apr 2025 09:08:04 -0700
X-Gm-Features: ATxdqUEGAk6tUiBRbk8p5YZmJ0Txihwc5KBvizWQDTQQrh-itdYRQ96aPQNNc_g
Message-ID: <CAAH4kHb8MsVtCSpAS7UCBN_40yjCKapWC0H1Z=cmvf4m9oErKw@mail.gmail.com>
Subject: Re: Potential project on implementing AMD SEV emulation in QEMU
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, coconut-svsm@lists.linux.dev, 
	svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What do you mean by emulate? Fake the MSRs and CPUID, or actually
provide some memory protection value like the pKVM project?

On Thu, Apr 17, 2025 at 8:26=E2=80=AFAM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> Hi Tom,
> yesterday in the Coconut-SVSM community call we talked about a
> potential project with the University of Pisa to emulate AMD
> SEV/SEV-ES/SEV-SNP support in QEMU.
>
> Joerg rightly suggested having a step-by-step approach, supporting SEV
> initially, as supporting SEV-SNP directly might be too much for a
> master's thesis (about 6 months of work).
>
> We wondered if you knew of any attempts already made in this regard,
> but especially if you think it's a feasible thing.
>
> Suggestions, ideas or partial works that can be reused are very welcome!
>
> Thanks,
> Stefano
>
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
