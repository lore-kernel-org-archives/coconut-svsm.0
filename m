Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BB225BEF6
	for <coconut-svsm@lists.linux.dev>; Wed, 25 Jun 2025 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859730; cv=none; b=pVJiDK1AsfyN/Wg09joL9FPy6wQvbi/Y0Y/ATI2kYpTd14KgHcAPYEArmFqn2HWgh/kx7r3picM0Ax1b4VIojx3HJAqn712rFptaV1PX3bmoS5rMwYdf9vOd3nwMo7lXPblnX1hocdofSxP6ca2juJcpYYte6pVfwYdqZEOC1II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859730; c=relaxed/simple;
	bh=aTTu2+dxl5qZVhbWbOtoDXW2Jb+fV6msOBn/v8kAaCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6Gh9cbPDFazFupilvhX8M7jRJR2IrDKuq7smWIkZTt39ucFGAYATbtSl2TkGt3zH8VXCLYXsqOHMjgmA5z665P9rnOSUHzXmo5UeJz3qvZFK1NDQlarweCZ7WBXwfT549VRvsjkGWISLqvGKWZX5WLEvwDou3jl+26E2TR3xJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=abJe18cS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="abJe18cS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750859727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ok1Q+VndY6BL0FE9sE7eYDBp5x3YoFSF5XsyVPQ30Fw=;
	b=abJe18cSxSh+JxEjHNgABPMUiGiD9zCanbSr53WY2t0fO+4jjJDd4drbb9QfM9zQgY+0MJ
	71/kPrKBSPeDCxZjvuxLem7Pes+AMz1hcP1cv3osu5k7kcpWTJ9Q7o+9BaQslGGt/bGBSm
	fBiF1Y+9PnDTluDLnkD8dnz0ICbZRJ8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-tmxV0rrfM26J38-ppNeP9A-1; Wed, 25 Jun 2025 09:55:24 -0400
X-MC-Unique: tmxV0rrfM26J38-ppNeP9A-1
X-Mimecast-MFC-AGG-ID: tmxV0rrfM26J38-ppNeP9A_1750859724
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e81d151012cso8143965276.2
        for <coconut-svsm@lists.linux.dev>; Wed, 25 Jun 2025 06:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859724; x=1751464524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ok1Q+VndY6BL0FE9sE7eYDBp5x3YoFSF5XsyVPQ30Fw=;
        b=Un2SPBT1X5CVO325vPylYqGgjArKZ2TYSglw9LoK9uCvT1KHTpUqtuNxKWlcOuPeua
         3cJXcEvUKd16BfbLe2BCVA8YfqiXHD+uE5OnBrs7KRNGk+li787RQkhrMHFnwWv97TR6
         EQTIqQ1Gog0XcPpr6k4+mRfdxa0w1mFdFUbQNGEjRDGrVBZGzuVLW+4QE9cyhGIhMkpB
         kB21EirwlhyxNcNf9B5+lpcN5wgk1KZJXrvxo4oYw8Z/78iQrDDNmTsxfdMhsJixFP3J
         7xh4AOCBY4CVothpGtjAhjv8lyHptqi9u8Sj/ghCH/GxEakPf2OxaBF9Dk0W59JOdllx
         ceJA==
X-Gm-Message-State: AOJu0YyY8eIargK9jJs4e9dSERxGM8O+YxZONYzicRJIYT1FJAxIG/ae
	rMv0S4HVEwDeFs/gfPBjmrHPaJZgYQHSx4Cuy1e3wS4Lrpm5YTSPPgK4Ntxp2fai4cn9Co/3HE5
	mtRmtUku36XvEidRWf78kn87Cr7CRA6/ecfU27DvuzD66w3qiEk5mTmeba8ondWOSAMtf+AYSdt
	sxLWEKZznkcyi5yzHSKQzhyNzFUTDP5kDgvFxd4muu
X-Gm-Gg: ASbGncstxCzqVhdeJE7UWKMI5/4fgDKaEIsHXNmWZP0ZCgqxivCyWVyw73p+h7GIKlf
	C2icFXtdHU2JsPb+DLWjjjx4hV3SLQ0oyrh+adk084GxKteVcynsgXGkZd+7l9xmeXbHIMaCtPQ
	yYRH6PIg==
X-Received: by 2002:a05:6902:1106:b0:e82:71ab:21c9 with SMTP id 3f1490d57ef6-e86019b8c3bmr3707717276.44.1750859724186;
        Wed, 25 Jun 2025 06:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQw2ajpaSaF2Qd44oWH8iXypAQELYkk8Md5Uv0CmZlSixukaq70icTpRiAXMob+6Igu/d4+Ud0AwyRdndX+j0=
X-Received: by 2002:a05:6902:1106:b0:e82:71ab:21c9 with SMTP id
 3f1490d57ef6-e86019b8c3bmr3707688276.44.1750859723759; Wed, 25 Jun 2025
 06:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <kf45vknwfpg2ule66cghubbzwdri4frjp3ugmybvfdkdyovqmn@q3hlnl34l5wb>
In-Reply-To: <kf45vknwfpg2ule66cghubbzwdri4frjp3ugmybvfdkdyovqmn@q3hlnl34l5wb>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 25 Jun 2025 15:55:12 +0200
X-Gm-Features: Ac12FXwrf1ch-VRrZmXlkFr7hnj-LYmKVv9BgtyIrbAMBYQ4adnSknMlAd5-CIw
Message-ID: <CAGxU2F41WRdj1d6e0E4_zgef8beafF97+KW_QFJmwfiT5RoJSw@mail.gmail.com>
Subject: Re: SVSM Development Call June 25th, 2025
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Pankaj Gupta <pankaj.gupta@amd.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SMGTuaybY9gyAHtOpEaRPdn3UA_y3HbK59HvBF7Wi-Q_1750859724
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Jun 2025 at 20:34, J=C3=B6rg R=C3=B6del <joro@8bytes.org> wrote:
>
> Hi,
>
> Here is the usual call for agenda items for the this weeks SVSM
> development call.  Please send me any agenda items you have in mind or
> raise them in the meeting.

I'd like to discuss a bit the status of live migration that Tom and
Pankaj presented at KVM Forum last year:
https://pretalx.com/kvm-forum-2024/talk/8FUARR/

Maybe it's short notice, so if they can't attend, we can postpone it
to next weeks.

Thanks,
Stefano

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
>
> See you all there.
>
> Regards,
>
>         J=C3=B6rg
>

