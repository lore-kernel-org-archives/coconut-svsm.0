Return-Path: <osteffen@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 4288E1A154E
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 19:04:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694624686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkNtQtKkPH0sOHbzoGaVExdRg5WOFzuLyIpeeTkNitU=;
 b=VJWNZf4z3sJEkgQkzdppTDhIxu/BGanBr6TKTKZiDRjRo5Jo0x9G+gpAEDoqGf9QeQl6Wf
 E8bHCnTcLEijb5cFtWZ6BB3ibupocyYufzTrqYKv7axuqsDanK+lhBBwHB764QS3Sm406D
 mByS/hF1CWiWEmcmyuUVTpRZpFMWhwU=
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2bbc1d8011dso390001fa.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 10:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <ZQGe5nq8rMWujAY9@suse.de>
In-Reply-To: <ZQGe5nq8rMWujAY9@suse.de>
From: Oliver Steffen <osteffen@redhat.com>
Date: Wed, 13 Sep 2023 19:04:22 +0200
Message-ID: <CA+bRGFq=8YJE6tshRdsxtF4m3sRoK2fZu0BmSO2fPHrs52iARQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] SVSM Call Agenda Sept. 13th
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

On Wed, Sep 13, 2023 at 1:37=E2=80=AFPM J=C3=B6rg R=C3=B6del <jroedel@suse.=
de> wrote:
>
> Hi,
>
> here is a rough agenda for todays inaugural SVSM development call. Feel
> free to reply to this email with additional agenda items you want to see
> covered.
>
>         1. Introduction round. Everyone please introduce themselves and
>            tell what your interest in the SVSM is and/or what you are
>            working on for the SVSM.
>
>         2. Development update - Current plan how to move forward
>            - CPL3 support/virtual memory management/tasks
>            - Crypto support
>            - Launch protocol
>            - ...?
>            I hope to give a short overview to the above topics and then
>            we can have an open discussion.
>
>         3. Governance discussion - This becomes more pressing, so let us
>            discuss how we can move to a multi-maintainer model better
>            sooner than later.
>
>         4. Open discussion/your topics :)
>
> Have a lot of fun and see you in the meeting!
>
> Regards,
>
> --
> J=C3=B6rg R=C3=B6del
> jroedel@suse.de
>

Ah, the call ended very sudden. And I was not able to rejoin.

We could maybe try https://meet.jit.si/ next time? There we have
unlimited time :-)

Oliver

