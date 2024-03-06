Return-Path: <osteffen@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 7EA891C82E1
 for <svsm-devel@coconut-svsm.dev>; Wed,  6 Mar 2024 10:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709719134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UvA96KgQa2J8pMybZyiSGblttpeS5QeeLnV9GmoALwE=;
 b=Qoj7Tb96QfljkvzaTefSOYZsQ4/51KJAnkWoir4ZFc/cpUi1v2TG6abQ0pG2foMz0sqQeK
 qJyZ7Oivsid0oYgQYhIaveCR6MdKDgh4oKK1wJFs+mSsXsVc9v7Zq/Fm+7Tc8lJptykVZe
 v65ZJ4K1ikpUQiC7aCa1pdUcn1JRuV4=
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5132027acc8so1515976e87.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 06 Mar 2024 01:58:52 -0800 (PST)
MIME-Version: 1.0
References: <ZeeWgVCN6ZdRGxJ3@8bytes.org>
In-Reply-To: <ZeeWgVCN6ZdRGxJ3@8bytes.org>
From: Oliver Steffen <osteffen@redhat.com>
Date: Wed, 6 Mar 2024 10:58:38 +0100
Message-ID: <CA+bRGFq0Kg9srnVe9nOXOVJ-F4tq36WOeQNn88sQmOZ4Pequig@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000070d5d80612fb01f3"
Subject: Re: [svsm-devel] SVSM Devel Call March 6th, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

--00000000000070d5d80612fb01f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 11:02=E2=80=AFPM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:

> Hi,
>
> Here is the usual call for agenda items for this weeks SVSM development
> call. I don't have any particular items yet, if you have please let me
> know via email or in the meeting.
>

We could talk about persistent storage. I started looking into supporting
Qemu's flash device with the goal to add a block level driver and an
additional
encryption layer on top.
We could touch implementational details as well as higher level
considerations.
I think that Claudio also has thoughts around this topic.

Oliver


>
> Details of the meeting (GMeet and Calendar links, meeting time) can be
> found in our shiny new governance repository at:
>
>         https://github.com/coconut-svsm/governance
>
> Please note that the meeting will be recorded and the recording
> eventually published.
>
> Next week will be no meeting as it conflicts with the OC3 conference.
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
>

--00000000000070d5d80612fb01f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 5, 2024 at 11:02=E2=80=AF=
PM J=C3=B6rg R=C3=B6del &lt;<a href=3D"mailto:joro@8bytes.org">joro@8bytes.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi,<br>
<br>
Here is the usual call for agenda items for this weeks SVSM development<br>
call. I don&#39;t have any particular items yet, if you have please let me<=
br>
know via email or in the meeting.<br></blockquote><div><br></div><div>We co=
uld talk about persistent storage. I started looking into supporting</div><=
div>Qemu&#39;s flash device with the goal to add a block level driver and a=
n additional</div><div>encryption layer on top.</div><div>We could touch im=
plementational details as well as higher level considerations.<br></div><di=
v>I think that Claudio also has thoughts around this topic.</div><div><br><=
/div><div>Oliver<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Details of the meeting (GMeet and Calendar links, meeting time) can be<br>
found in our shiny new governance repository at:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/coconut-svsm/gove=
rnance" rel=3D"noreferrer" target=3D"_blank">https://github.com/coconut-svs=
m/governance</a><br>
<br>
Please note that the meeting will be recorded and the recording<br>
eventually published.<br>
<br>
Next week will be no meeting as it conflicts with the OC3 conference.<br>
<br>
See you all there.<br>
<br>
Regards,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 J=C3=B6rg<br>
-- <br>
Svsm-devel mailing list<br>
<a href=3D"mailto:Svsm-devel@coconut-svsm.dev" target=3D"_blank">Svsm-devel=
@coconut-svsm.dev</a><br>
<a href=3D"https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel" rel=
=3D"noreferrer" target=3D"_blank">https://mail.8bytes.org/cgi-bin/mailman/l=
istinfo/svsm-devel</a><br>
<br>
</blockquote></div></div>

--00000000000070d5d80612fb01f3--

