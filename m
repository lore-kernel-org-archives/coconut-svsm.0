Return-Path: <osteffen@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id C0593269D36
 for <svsm-devel@coconut-svsm.dev>; Fri,  1 Sep 2023 09:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693551673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qaudm2rY3rGLuvTNpMH5FSpNVWZW3xTGuy4ddGP0Vxo=;
 b=ErnTSQeiOkrM3z38iunBClUeSD4zEj5HeoSaOBcvn5veSr2V5wdc/ceF28wsxaVzF8i5yi
 U+qVllO5QgDIg7IGn15BV2sLUnyJQ1RH0AjWsUYVrdrbRwyYA19X0Ixd+uUtqXIA3nn8o9
 0OLvS5hv5riDKAIiVERUO2T+1G1J3wc=
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-50092034189so2071205e87.3
 for <svsm-devel@coconut-svsm.dev>; Fri, 01 Sep 2023 00:01:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ZPBqvbMM28sdqewQ@suse.de>
References: <ZPBqvbMM28sdqewQ@suse.de>
From: Oliver Steffen <osteffen@redhat.com>
Date: Fri, 1 Sep 2023 00:01:07 -0700
Message-ID: <CA+bRGFpwH=PcK-LOXH3Yje=ARsE=-=3mD-ydWP8QKx_WHu_Qvg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] [RFC] SVSM Development Call
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsODwrZyZyBSw4PCtmRlbA==?= <jroedel@suse.de>, svsm-devel@coconut-svsm.dev

Hi J=C3=B6rg,

any of the proposed times works for me.

Thanks,
 Oliver

Quoting J=C3=B6rg R=C3=B6del (2023-08-31 12:26:05)
> Hi,
>
> I talked to a couple of people recently about our SVSM project and the
> idea came up to schedule a semi-regular call where the community can
> sync on development and direction of the project.
>
> It also fits my wish to be more transparent about our direction and work
> and helps move discussions out of private formats to a more public
> community forum.
>
> So I wanted to propose a couple of time slots and see what people think.
> The idea is to have a meeting every 2 weeks, I will collect and post an
> agenda beforehand and we can always cancel if there is nothing to talk
> about.
>
> Some time slots that would work for me:
>
>                   CEST   ET     CT     PST
>
>         Tuesday   5pm    11am   10am   8am
>                   6pm    12pm   11am   9am
>
>         Wednesday 5pm    11am   10am   8am
>                   6pm    12pm   11am   9am
>
>         Thursday  6pm    12pm   11am   9am
>
>         Friday    4pm    10am    9am   7am
>
> I have only considered slots that work well for participants joining
> from America or Europe/Africa because most people I talked to live in
> these areas. If people living in Asia/Australia time zones want to join
> as well please let me know. We can use alternating time slots to make
> this possible.
>
> Please let me know what you think.
>
> Thanks,
>
> --
> J=C3=B6rg R=C3=B6del
> jroedel@suse.de
>
> SUSE Software Solutions Germany GmbH
> Frankenstra=C3=9Fe 146
> 90461 N=C3=BCrnberg
> Germany
>
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew Myers, Andrew McDonald, Boud=
ien Moerman
>

