Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6F5369982
	for <coconut-svsm@lists.linux.dev>; Tue, 24 Feb 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942380; cv=none; b=RfIyMjp4/ZymWYgsHsviCf160yjPONkQoDbXKZO+AHeg2uKL9Ols9mzxQNCed8Nib8z1Av7dCF3NTS2IwjOJQYW0TQTONuQRcgTozlhlse/iLI6nkYRq15TuLLijy9eRWgEcNMlsKWJXqbud3pyxhAHXubkhEDGZg3NaYUEfMWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942380; c=relaxed/simple;
	bh=pIkbx7qaam4qSFZUUejKbPy7+EHvDz84Lk17LWPowVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5th0c+bdtJnNXf1JHSehvPIHzfxNm3AaGv7/6q5bGskW0f2fAhs+9qZaevtIct3bTjBodkQE+pNxjlZ+9awT/GJVNtwBTOp9ymFZTJ7aaWH4taVf4MH3LKVr/FPksAaWCsa/4MoH+4QuYgdhM6N3lWykpcfpq2+eYFjfGYvRhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QHmZHwuu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QHmZHwuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771942377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIkbx7qaam4qSFZUUejKbPy7+EHvDz84Lk17LWPowVo=;
	b=QHmZHwuuoFCN8ZQpm+mnjo2UPG3ALkEwz/jmAzqi5hyvgQpt3xTzeb+PdLKxmZ9bEpMUVZ
	pp7YClhHRMYP1fHZM1u97UpShtxwKTnohivLrG1LAQ51iuMsef7DC7lZSnI0aQRqF/mqgy
	YT327JnNHhKwDO5ofUbc+UKrh0CngGY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-D1KD8FzfNK2mS9XCKiS0vw-1; Tue, 24 Feb 2026 09:12:38 -0500
X-MC-Unique: D1KD8FzfNK2mS9XCKiS0vw-1
X-Mimecast-MFC-AGG-ID: D1KD8FzfNK2mS9XCKiS0vw_1771942326
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a863be8508so59481685ad.2
        for <coconut-svsm@lists.linux.dev>; Tue, 24 Feb 2026 06:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771942318; x=1772547118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIkbx7qaam4qSFZUUejKbPy7+EHvDz84Lk17LWPowVo=;
        b=FBrYZ6ql8HBttnjLwiBQ+W0wwDKSmsyFOuxEDxXawq1KZxTuC1H+kaqMulMAhSJUIN
         /RZWJZDEALR+ajAeN0zdDP84YfCbkYWCjjXVdhvfYXhQyyc6aTF3lyLVjOgLPhDTUwEu
         0kOilKj/V477TkA7xchf6YTFR5k9Z6wpTCcPN22W9/o3Lpd/EmtMLirmQXHdggOnL7YH
         uSlutWXjEetNQBTlOt13204msjIBPDQqVPvHdDq3A93ylPIH6aNot9hTlmnBIwZn1W+3
         y3qcUFTAFYi6syAYLfA5rAblbkE2UtIbkDtE0W0u69M7Q3z2AxHKjzGUhOunkdYDEPs0
         z3/w==
X-Gm-Message-State: AOJu0YxZyy+ST5hvmV5yPij2FbVK8IK6Wa/Jz6QNy+n6epaUuXvpZUCu
	d2tZFovTf/isCjP9WnJSfR/rwFGvEq3M1RWTa7PRSO6FwY07uIsxVvYT/4g7TLlFCr0OESwAJHC
	pgd1kgfk7nSnAXzQx354JYoard7eAvCHYWwVOHP2YBIOAKoHPTJ+MqOG3d1juKrYRA1TUHVHCpP
	N4lrNscGI0S2EFOTB6sJgYnZ1Ig6x4Y74TZPe22Gb8
X-Gm-Gg: ATEYQzxoMRUxUAKWpiehY9Odo+4XhsGb3g02kAynzz5oVILyDhwdzl5gDIAFca++kq7
	50E4xnwtgtLgIohaGR5e9DKopsaDV9JwOMggOW0ybKZBwwY+TTWzQ08cptk3EzilXKyUaDpFzeB
	Lw2Cv2DlTJuMFGAo1Nb/pMSEHV604e1+lwUhBzQKdAqLqgH3eP78qeMq/1UAMBDHQcjC2jwaKkJ
	GGd
X-Received: by 2002:a17:90b:3d47:b0:356:22b5:704f with SMTP id 98e67ed59e1d1-358ae82095fmr9495066a91.15.1771942318319;
        Tue, 24 Feb 2026 06:11:58 -0800 (PST)
X-Received: by 2002:a17:90b:3d47:b0:356:22b5:704f with SMTP id
 98e67ed59e1d1-358ae82095fmr9495040a91.15.1771942317893; Tue, 24 Feb 2026
 06:11:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <pg5dCu-pV0eEBjz8_xwn59tTQPgv6GFWkYFfCDXKhj0Hs8A8YDyJcAcCy5GmRZUqu1zMK8MtnvOmdWjD7wuDGZ9WPZmgqKwDA6ZN2UsaB2M=@protonmail.com>
In-Reply-To: <pg5dCu-pV0eEBjz8_xwn59tTQPgv6GFWkYFfCDXKhj0Hs8A8YDyJcAcCy5GmRZUqu1zMK8MtnvOmdWjD7wuDGZ9WPZmgqKwDA6ZN2UsaB2M=@protonmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 24 Feb 2026 15:11:46 +0100
X-Gm-Features: AaiRm50LkhMW3g8PPYpMdDekPj30Jr8Jv0jWsBBBqwClNChBxoZ0OxFIZFNjeQk
Message-ID: <CAGxU2F5xevpb62aZETEQdPkd8sfVHYTjqrV+Sd7mYyJ32Cv5WA@mail.gmail.com>
Subject: Re: Interest in GSoC: Observability Support
To: Nihal Kumar <nihalxkumar@protonmail.com>
Cc: "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>, Gerd Hoffmann <kraxel@redhat.com>, 
	=?UTF-8?B?UsO2ZGVsLCBKw7ZyZw==?= <joerg.roedel@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 42n6bG3KgAlkO8zq6mjk8jMlf7gxyfvvdPhGGIgxIPU_1771942326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nihal,

On Mon, 23 Feb 2026 at 19:07, Nihal Kumar <nihalxkumar@protonmail.com> wrot=
e:
>
> Hi team
>
> I am interested in the observability support project mentioned in the GSo=
C ideas list.

Cool, please keep all the mentors in CC for any questions or follow-up.

>
> Are there any starter issues you would recommend I begin with? I=E2=80=99=
d be happy to start there and familiarize myself with the codebase.

I just marked some issues with the "good first issue label"
https://github.com/coconut-svsm/svsm/issues?q=3Dis%3Aissue%20state%3Aopen%2=
0label%3A%22good%20first%20issue%22

But overall I'd suggest to start with building SVSM and running it
(presumably with native mode if you don't have SNP hardware).
Our CI contains a pipeline where SVSM is tested with QEMU and native
mode, so that could be useful to follow.

>
> Also, besides the mailing list and weekly meetings, is there an IRC chann=
el or another communication platform where contributors discuss the project=
?

We have a matrix channel here: https://matrix.to/#/#coconut-svsm:matrix.org

Thanks,
Stefano

