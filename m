Return-Path: <dionnaglaze@google.com>
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 147F21A258A
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 19:02:47 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-534694a9f26so705a12.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695834167; x=1696438967; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U06O0tdQwEOHNdhWPtu2f8rels92VjKdv8el8zcm6y4=;
 b=kCLOE32k4p7CYncj0gUKDA+bknjnH8egL3rcZu8gokpVuTwgkhxp0qQPb3b1d+soq+
 yUw2OtMs19c96cEmW61rcCKbqe4Xz5cclmyplyDzAMar/MJt2YxHK614ChZZORIsCIkx
 1QiV2HuvkXfTLGcdSpqEgCG6C6+rZlft+qEVHoCF75CyAZlFRfxUhepsp+CW1CTLhaxv
 Yi2RqMIJXo8jU4Rhhb7PpPScF6aCIVcFvXpHWijKqgtaJp9G0xQW1gjdcR/zqbx4iqG5
 yEPqBcf93+n23sUE89cAnF6DOU3QwHJtSrRqflku2C6yB6X5/0HoC9y4zBFFe+Nq++GZ
 iXqA==
MIME-Version: 1.0
References: <ZRGfRVgczigX_tyR@suse.de> <ZRQb6WDRz3q1F4Jg@suse.de>
 <ZRRPHOlDQz4O-CoS@suse.de>
In-Reply-To: <ZRRPHOlDQz4O-CoS@suse.de>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 27 Sep 2023 10:02:35 -0700
Message-ID: <CAAH4kHZoTfowbvLSxGnV_KbQUrvNSjhLkCmHispmQEQJb7E_Sg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] SVSM Call Agenda for Sept. 27th
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: svsm-devel@coconut-svsm.dev

I put out a call for the Attested TPM document and got a link to the
recorded talk about it

https://youtu.be/z0Joifl7JS0?si=3DDzuIwtGK1psjl2ZQ&t=3D1453

I'm not above rickrolling folks, but this is legit.

On Wed, Sep 27, 2023 at 8:49=E2=80=AFAM J=C3=B6rg R=C3=B6del <jroedel@suse.=
de> wrote:
>
> Almost forgot, there is another item for today:
>
> On Wed, Sep 27, 2023 at 02:11:21PM +0200, J=C3=B6rg R=C3=B6del wrote:
> >       1. Development update
> >
> >          What happened since last meeting. Everyone is encouraged to
> >          give their update as well about what they are working on and
> >          what progress was made.
>
>         1.5. Upcoming update of support repositorys for Linux kernel and
>              QEMU.
>
>              Soon we will update the base repos for the Linux host and
>              guest kernel and QEMU that are used to run the SVSM.
>
> >       2. Rust smart pointers and usage of alloc crate
> >
> >          There are several problems with the usage of the alloc crate,
> >          which could be solved by using unstable features. But we just
> >          switched to stable Rust for a good reason. So I like to
> >          discuss how to move forward.
> >
> >       3. Module runtime discussion
> >
> >          This started on the mailing list and questions came up about
> >          which runtime to use and how to get there (e.g. which libc to
> >          use).
> >
> >       4. Governance discussion - Continued
> >
> >          This ended very abruptly last time. Let's continue in this
> >          meeting.
> >
> > See you at 6pm CEST/9am PST at
> >
> >       https://meet.opensuse.org/coconutsvsm
>
> Regards,
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
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel



--=20
-Dionna Glaze, PhD (she/her)
