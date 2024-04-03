Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 5BA99281862
 for <svsm-devel@coconut-svsm.dev>; Wed,  3 Apr 2024 19:06:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712164004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sFFsKLNM6DVyAQEhs+dQiDTDz3OB5mNLzLN/zmEJcPw=;
 b=aMmdxD7CB5i3KSFQF/ZK3oictO9IqW6F8iGZ11teB3NyQQ22wcjAYilZVmxiSaKeCa0pPm
 esV2fl1WMNX1p8WJfT6x2dxN4Wgah7IVEgcLkrmHzktkGd7S7YcpeMycLxpHM858rQw+SC
 xeqIDiEkk0+/kMD7LMsseeumQSC0tsk=
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-60cbba6f571so1271307b3.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 03 Apr 2024 10:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <Zg07c6Y5a_Ak5oXs@8bytes.org>
In-Reply-To: <Zg07c6Y5a_Ak5oXs@8bytes.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 3 Apr 2024 19:06:26 +0200
Message-ID: <CAGxU2F5qTMU1hx-qAdc0ZL6mWoxWU1JhCTZK243KnMA29AiHFA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] SVSM Development Call April 3rd, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev
Cc: linux-coco@lists.linux.dev, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>

On Wed, Apr 3, 2024 at 1:20=E2=80=AFPM J=C3=B6rg R=C3=B6del <joro@8bytes.or=
g> wrote:
>
> Hi,
>
> Here is the usual call for agenda items for this weeks SVSM development
> call. My agenda so far is:
>
>         * vTPM merge fallout
>         * Security issue mitigations

As I mentioned during the call, I started a shared document to discuss
early attestation architecture in SVSM:
https://docs.google.com/document/d/11ZsxP8jsviP3ddp9Hrn0rf6inttNw_Pbnz0psXl=
xlPs

To get write access, please send me a request.
The document is really at an early stage. As J=C3=B6rg suggested, we're
keeping it on gdoc for now to collaborate, but as soon as we have an
agreement, we'll move to github in some markdown files.

As I mentioned, from next week (April 9th to be precise) I will be
away until the end of the month. I will be back online on May 3rd.
Sorry in advance for the delay in my responses.

Thanks,
Stefano

>
> The items we can not cover during the meeting will be deferred to the
> next meeting.
>
> Please note that Europe is now also on summer time, so the meeting will
> be at its usual time spot again. The definitive time is always in the
> Google calendar I shared below.
>
> Details of the meeting (GMeet and Calendar links, meeting time) can be
> found in our governance repository at:
>
>         https://github.com/coconut-svsm/governance
>
> The meeting will be recorded and the recording eventually published.
>
> See you all there.
>
> Regards,
>
>         J=C3=B6rg
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
>

