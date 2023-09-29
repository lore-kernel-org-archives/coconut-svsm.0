Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 8B8261A275C
 for <svsm-devel@coconut-svsm.dev>; Fri, 29 Sep 2023 10:09:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695974952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZtTZ0oLFtfdj52Y/wHfs3MFmSvgVPGvHKRJncrdjno=;
 b=Z1xPF4/wl5r19DvS9saVETy4FnNj5P4PY3yb64i9imnWf8y9uFbLaOxrTcPIAyse9CPaOt
 OlzxHiRP/A09njp7+EnJk82xKMYVkum1TeZGoDxqOR1DV/jjv37DZVaXJGFM/RtGQgSUqa
 9G+LoMosDAhEIADdnjgkskESKZ3LwCY=
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-d7ec535fe42so21401511276.1
 for <svsm-devel@coconut-svsm.dev>; Fri, 29 Sep 2023 01:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <ZRGfRVgczigX_tyR@suse.de> <ZRQb6WDRz3q1F4Jg@suse.de>
In-Reply-To: <ZRQb6WDRz3q1F4Jg@suse.de>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 29 Sep 2023 10:08:58 +0200
Message-ID: <CAGxU2F5ru6OCqYAQrH-o6-yhhuoDy9jkWhs3-iKGbGxTOQA_zg@mail.gmail.com>
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
Cc: svsm-devel@coconut-svsm.dev, Oliver Steffen <osteffen@redhat.com>

Hi J=C3=B6rg,

On Wed, Sep 27, 2023 at 2:11=E2=80=AFPM J=C3=B6rg R=C3=B6del <jroedel@suse.=
de> wrote:
>
> Hi,
>
> I received no requests for agenda items, so I put mine into the agenda
> below:
>
>         1. Development update
>
>            What happened since last meeting. Everyone is encouraged to
>            give their update as well about what they are working on and
>            what progress was made.
>
>         2. Rust smart pointers and usage of alloc crate
>
>            There are several problems with the usage of the alloc crate,
>            which could be solved by using unstable features. But we just
>            switched to stable Rust for a good reason. So I like to
>            discuss how to move forward.
>
>         3. Module runtime discussion
>
>            This started on the mailing list and questions came up about
>            which runtime to use and how to get there (e.g. which libc to
>            use).
>
>         4. Governance discussion - Continued
>
>            This ended very abruptly last time. Let's continue in this
>            meeting.
>
> See you at 6pm CEST/9am PST at
>
>         https://meet.opensuse.org/coconutsvsm

is the recording available?

Thanks,
Stefano

