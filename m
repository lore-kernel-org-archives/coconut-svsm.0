Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 583F91A1F2C
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 15:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695820013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvbuSdA/q7XudHI7eaxu14rbfXstAqL5uKYusTvDb/Q=;
 b=gpy5/kdzik9eKE6TcRQDkyoqKAoklz1oJ5Ab7Aj2o8Ywxgt2snO8Kyw+1LbD4OL3l1lbKf
 J+EXKXM9SJlTlTHcr5t7zqVFlTPpqzp4l04ycYi8xP8vmfVBLH4eFYKdSX8RmUxLsDoN4K
 WPJajkX9/02QS7tjADfm0ESnQxqEKs4=
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-d865f1447a2so14374680276.2
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 06:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <ZRGfRVgczigX_tyR@suse.de> <ZRQb6WDRz3q1F4Jg@suse.de>
 <CAGxU2F76O=et5X7W_2Dc3TgyqtJ0b1WDMMVnczP+fVr7WwC0DQ@mail.gmail.com>
 <ZRQmrEC7S5zlRMFN@suse.de>
In-Reply-To: <ZRQmrEC7S5zlRMFN@suse.de>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 27 Sep 2023 15:06:39 +0200
Message-ID: <CAGxU2F4MNd2BGtamWnxnkUp_5ri2vzy30Ws8F2iUY9wUxM=YSw@mail.gmail.com>
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

On Wed, Sep 27, 2023 at 2:57=E2=80=AFPM J=C3=B6rg R=C3=B6del <jroedel@suse.=
de> wrote:
>
> Hi Stefano,
>
> On Wed, Sep 27, 2023 at 02:29:05PM +0200, Stefano Garzarella wrote:
> > talking with Oliver we thought about creating a shared document where
> > to put agenda items and notes during the call.
> > So we created this Etherpad: https://etherpad.opendev.org/p/coconutsvsm
> >
> > If you think there is a better way to share the document and take
> > notes together, please advise ;-)
> >
> > If this etherpad is okay, I'd suggest adding the link to the shared cal=
endar.
>
> Storing the notes somewhere public makes a lot of sense.
>
> Longer term, and when we made some progress in the governance
> discussion, I'd like to have the notes stored in a governance repo at
> GitHub.

Yeah, I think it is a good idea.

> For now Etherpad is perfect, thanks.

Also in the future, maybe we can use it live during the call, then
posting the meeting notes in the GH governance repo.

Anyway, we can decide late.

Thanks,
Stefano

