Return-Path: <osteffen@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 947912C1FDE
 for <svsm-devel@coconut-svsm.dev>; Wed, 18 Dec 2024 12:40:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734522056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V/UN1uCGkIKElClJFIQjbCK2FOIajymOIp8DXj5s8OU=;
 b=JLY878F6TxZiUoAickETlFbz2o/ap/Ko6qYZDonFmDph4BEllsFlHI6eijXCE2jmzmeGQm
 A8BrAWzutNXysDN+IouHSRnrgdb5NeQIXB/juyjxuNXB+SAsAmYXSNAQNrEM1UuSfGCDbs
 gT8fcmY+nEriqNUjFymkGmrC5XrgVDk=
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5400e88b7a4so3562441e87.3
 for <svsm-devel@coconut-svsm.dev>; Wed, 18 Dec 2024 03:40:54 -0800 (PST)
MIME-Version: 1.0
References: <Z2GlkOf63fGpsks2@8bytes.org>
 <CAGxU2F53byEE4gp6VTos_eS-=1tnLE2mvMk=wHO7FsXWMysSVg@mail.gmail.com>
 <Z2KvKpdviLiSQ-4b@8bytes.org>
In-Reply-To: <Z2KvKpdviLiSQ-4b@8bytes.org>
From: Oliver Steffen <osteffen@redhat.com>
Date: Wed, 18 Dec 2024 12:40:41 +0100
Message-ID: <CA+bRGFr7SibkGrOSqEvTKrnc4+aWN3BpNMxwC174bauGxvwYhQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c76639062989e27b"
Subject: Re: [svsm-devel] Linux and QEMU branches updated
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>, svsm-devel@coconut-svsm.dev

--000000000000c76639062989e27b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 12:17=E2=80=AFPM J=C3=B6rg R=C3=B6del <joro@8bytes.=
org> wrote:

> Hi Stefano,
>
> On Wed, Dec 18, 2024 at 12:09:17PM +0100, Stefano Garzarella wrote:
> > I noticed that in the svsm branch of edk2 the TPM driver is no longer
> > there, so I tried the PR [1] that Oliver opened upstream, and it seems
> > to be working:
>
> Yes, please also open a PR against the svsm branch of our EDK2 fork. I
> wll merge it then so that we get back the vTPM driver.
>

-> https://github.com/coconut-svsm/edk2/pull/5


> Regards,
>
>         Joerg
>
>

--000000000000c76639062989e27b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 18,=
 2024 at 12:17=E2=80=AFPM J=C3=B6rg R=C3=B6del &lt;<a href=3D"mailto:joro@8=
bytes.org">joro@8bytes.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi Stefano,<br>
<br>
On Wed, Dec 18, 2024 at 12:09:17PM +0100, Stefano Garzarella wrote:<br>
&gt; I noticed that in the svsm branch of edk2 the TPM driver is no longer<=
br>
&gt; there, so I tried the PR [1] that Oliver opened upstream, and it seems=
<br>
&gt; to be working:<br>
<br>
Yes, please also open a PR against the svsm branch of our EDK2 fork. I<br>
wll merge it then so that we get back the vTPM driver.<br></blockquote><div=
><br></div><div>-&gt;=C2=A0<a href=3D"https://github.com/coconut-svsm/edk2/=
pull/5">https://github.com/coconut-svsm/edk2/pull/5</a></div><div><br> </di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Joerg<br>
<br>
</blockquote></div></div>

--000000000000c76639062989e27b--

