Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 43C7F2C2DFD
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Nov 2024 09:18:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732695481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8CouElbYsuFBkhUzHzZg7YHq5IHGPA3eYM6awm1J9k=;
 b=ZEz4CcRzQVT1eSTzHgaLww1oNmJUL9pR49XDiQJlm4XMNEAROubFrHackRJu6t1vg3xzAV
 zUqRfW+4p8nsF9wV3e8+qMOIuDekBnp0qZj2+wOIbixc3/28yY9sAGw6YJtBDXhV6PsHu2
 uH24Zhs4A8Toau77cl3Nnbt12FwnCI4=
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-6eea70c89cbso7235397b3.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Nov 2024 00:17:57 -0800 (PST)
MIME-Version: 1.0
References: <Z0X5ebN6KE05gOR9@8bytes.org>
In-Reply-To: <Z0X5ebN6KE05gOR9@8bytes.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 27 Nov 2024 09:17:45 +0100
Message-ID: <CAGxU2F7Kp64HNq2ZEne=RJfqkBmvuCKNyp31JfiO2TJX5tomwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] SVSM Development Call November 27th, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

Hi J=C3=B6rg,

On Tue, Nov 26, 2024 at 5:38=E2=80=AFPM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> Hi,
>
> Here is the usual call for agenda items for this weeks SVSM development
> call.  Please send me any agenda items you have in mind or raise them in
> the meeting.

If we have time, I'd like to talk a bit about 2 topics:

- status of QEMU & Linux patches
- unsafe block documentation

Thanks,
Stefano

