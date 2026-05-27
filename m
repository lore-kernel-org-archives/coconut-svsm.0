Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E64438228B
	for <coconut-svsm@lists.linux.dev>; Wed, 27 May 2026 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894789; cv=none; b=APahlgGm0KubagHkHD97y9GFk7DNAxLY9vXTK+r2qsV1cLcGak8GGOPIz3bFhF3oVkCvVR6ZYeknNWuZeKCacr39wGv6bI6PsqSMiE6aSy3vntpajZjA4M+7qI+B8DfWUsdmt1oe96pvs5S55fm/REYIbJxhlShkMOQn3fOjMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894789; c=relaxed/simple;
	bh=DAtmH8CyITM9x8yq/gVxY7/o2xoz6vlXkLV6FI0ICHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9isgXADl7OvBLqb5YeMU3edosRXnu2cuup7d/34zauETptryq1y/8y2+97ne0ZeRkQPJhsmAKavRxqZ0Hp6IWorx0TIxYpqcTTiyrFQX3UlnEVV71mszDqe7ojiFBFxEyQIyX8TR46soRdBncLcdv6tErEOdGWovlCB4kvzDcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g3bz7DmE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g3bz7DmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779894787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q66AXjMoD4HcY+Mc1Vy0txQA/vox/wAhbo+yij5mYhs=;
	b=g3bz7DmEVBxGsGGUwPHfD5s57X2VRR0EFYnxLbYBgTyZoiseigY++EzzVjFObN9suIMltC
	2J+O+U1a7/fCR6HdSN94UR/De+sd7gqzKCZL7qeon+m00flM2WdSUNmwDxxhgmSJl1QxaK
	xif9IPK0D95Kxi3zuxOPJwjZX/CCs9M=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-HX8U7c1KOX6wCk-DJDeLrw-1; Wed, 27 May 2026 11:13:05 -0400
X-MC-Unique: HX8U7c1KOX6wCk-DJDeLrw-1
X-Mimecast-MFC-AGG-ID: HX8U7c1KOX6wCk-DJDeLrw_1779894785
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bf8075f04eso200016107b3.1
        for <coconut-svsm@lists.linux.dev>; Wed, 27 May 2026 08:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894785; x=1780499585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q66AXjMoD4HcY+Mc1Vy0txQA/vox/wAhbo+yij5mYhs=;
        b=n+l+uG6X2yLPaXpWmwZLQFg7e4eJVMjskmVaZ2FhF0iwkdUJS4hIF2N7ueC2wgzVU6
         S6+hzDmKcYnJ75ua9arNLcyLl5Z5Ojs/VTVlc+XPfRiAF/NE9AwCxb6J+5BeG+iPH8Mr
         jAi31bG4U4Pv90dwuqFx6BhY9rprnx2bU13Yezkzkkrpom+t8G58R0vYlePAXPwhRioZ
         4yYDDLMx9hsguMGktgrgh1Q0gHxRmC+bvHp7o7f/XfLjpuP7ohd/TsON/EcWdKRftNBP
         kIaYLtMZ0BgjJ9EburVPynnjN4eEupC6gBeG3a2kwpYSg4Rt2pTFZCRpzfmu+kP0xcAx
         YT3w==
X-Gm-Message-State: AOJu0Yy8jWsHt/GTyEb1HtHr7rftXCFA8AJH3jmejwdfEPKRWkhhzxzC
	PZrLBCBrJItHF7KP3qh0E30A3x4Dz6GM081neXl3MQCrusxkMJZqf1yOi8GHEDn3GfXMhv7WE7D
	LMUvnqXnlQ//rNBfeasgjruAJX/l+ENUxArz/qkqD2n8mpbc9S/l9JcJDbu/hDCb35LhfsdZA5k
	qhiKcZeA8wbGlEJ2pTtz+kakokJRkUo9tixs1jFBBgAVy7qtON
X-Gm-Gg: Acq92OFhQHy3ZUruSk/ZUSuGu4Bu6U4BfZ9tyhZJi9w9y9JzuEY1QAp22ZwF733mNmd
	dOm3yCUb5vWrEGtxukGIUhhl45J9BYDutLvlZ3GsVn0Z1q/HH7vQSbtAIf57wIxlj9I9mH2gIO3
	GgfhzbHFI6ifj8GYQ7xvUQIAUuaGbiu7BNRbFibDqRKVVtpAcFAktS4DErcCREOS+elPk/URzI1
	JnOvaXVlWN8JAs=
X-Received: by 2002:a05:690c:6a12:b0:7dc:1d92:17f9 with SMTP id 00721157ae682-7dc1d921c36mr2008837b3.27.1779894784865;
        Wed, 27 May 2026 08:13:04 -0700 (PDT)
X-Received: by 2002:a05:690c:6a12:b0:7dc:1d92:17f9 with SMTP id
 00721157ae682-7dc1d921c36mr2008347b3.27.1779894784241; Wed, 27 May 2026
 08:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
In-Reply-To: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 27 May 2026 17:12:52 +0200
X-Gm-Features: AVHnY4K1ZVwtEAHSBgaR0RHgntIzXI1OtPPiPq6icytbmj4HyDY2tOYiLml6to4
Message-ID: <CAGxU2F4uJLH5OTv+y4712vmNBogfSspN-nJHzDJAz9N6HWeg2g@mail.gmail.com>
Subject: Re: SVSM Development Call May 27th, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Cc: Nicola Ramacciotti <niko.ramak@gmail.com>, Tanish Desai <tanishdesai37@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _1kJbAFxRr-uNqxe6UppY2ewXQVKtw8ehAg4fazAJ9M_1779894785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 May 2026 at 17:46, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> Hi,
>
> Here is the call for agenda items for this weeks SVSM development
> call. Please send any agenda items you have in mind as a reply to this
> email or raise them in the meeting.

One topic could be the 2 GSoC projects we have this year.
If Nicola and Tanish join, it would be nice to allow them some time to
present their projects. They will work with the COCONUT community
during the summer :-)

Stefano

>
> We will use the LF Zoom instance. Details of the meeting can be found
> in our governance repository at:
>
>         https://github.com/coconut-svsm/governance
>
> The link to the COCONUT-SVSM calendar is:
>
>         https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week
>
> The meeting will be recorded and the recording eventually published.
>
> Regards,
> Stefano

