Return-Path: <dionnaglaze@google.com>
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id C47391A577D
 for <svsm-devel@coconut-svsm.dev>; Wed, 25 Oct 2023 17:38:10 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53eeb28e8e5so13028a12.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 25 Oct 2023 08:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698248290; x=1698853090; darn=coconut-svsm.dev;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L7vTcYcM4klUe5BHygHGCvpgPbcXsTwSnO7dAfTsmOY=;
 b=JsEZDtOF+hUVB4iXh2aXf3i6EWs3Ydzj9TxVpW9PkQCaB1Ikto20GtgfAAbyxYr0m5
 5aBvK2l2KN2PcBjXl1n9Fjcz9vjVtA9Usgi6jqSlyFGcavCuPda2VCf9P4Tw/73uQ5bs
 OIHD2inesBLyvo07G8/aukNEa4kRZSi3lvbqYtU3OPZrCEER9URrFYIYXuYC61CRbi0w
 So6lmg7YwrduuGMDAE3iExoWTXIbbrPlcpeQuKbCF9IYHbprl/zSspb7WUrlqudSEXEf
 YIAzWpOwjS84rELTjw0ehthXkalSz6P2IBA6zza5Eu1j65T9d16YnzXCbQt+c+bw1hfo
 FF8g==
MIME-Version: 1.0
References: <ZTjpSzrFHP1BNB9w@suse.de>
In-Reply-To: <ZTjpSzrFHP1BNB9w@suse.de>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 25 Oct 2023 08:37:55 -0700
Message-ID: <CAAH4kHaqVm6m-0zFPsB2_eLexxc59dB57mQWNPAK1Z+PeJBu9Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000009837c06088c3e53"
Subject: Re: [svsm-devel] SVSM Call Oct. 25th
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

--00000000000009837c06088c3e53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm wondering if anyone in this effort is also involved in the TPM-rs
project that just met on Monday. They're working on a re-engineering of the
MS TPM simulator to be production-ready from the start, and they appear to
have their own ideas on how to modularize crypto library use. It might be
good to align on that.

Here's a link to the meeting's notes
https://docs.google.com/document/d/1Dph-RVB7-Kg2bXvDJIfpM66MuA4UEhhbubUFuWs=
Vd1U/edit#heading=3Dh.ygbyz6saowrm

On Wed, Oct 25, 2023 at 3:09=E2=80=AFAM J=C3=B6rg R=C3=B6del <jroedel@suse.=
de> wrote:

> Hi,
>
> I don't have any particular topics for today, but since there will be no
> meeting next week due to my upcoming vacation, let us meet anyway to
> discuss PRs and topics everyone else might want to talk about.
>
> See you at 6pm CEST/9am PST at
>
>         https://meet.opensuse.org/coconutsvsm
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
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
>


--=20
-Dionna Glaze, PhD (she/her)

--00000000000009837c06088c3e53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m wondering if anyone in this effort is also involve=
d in the TPM-rs project that just met on Monday. They&#39;re working on a r=
e-engineering=C2=A0of the MS TPM simulator to be production-ready from the =
start, and they appear to have their own ideas on how to modularize crypto =
library use. It might be good to align on that.<div><br></div><div>Here&#39=
;s a link to the meeting&#39;s notes=C2=A0<a href=3D"https://docs.google.co=
m/document/d/1Dph-RVB7-Kg2bXvDJIfpM66MuA4UEhhbubUFuWsVd1U/edit#heading=3Dh.=
ygbyz6saowrm">https://docs.google.com/document/d/1Dph-RVB7-Kg2bXvDJIfpM66Mu=
A4UEhhbubUFuWsVd1U/edit#heading=3Dh.ygbyz6saowrm</a></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 25, 2=
023 at 3:09=E2=80=AFAM J=C3=B6rg R=C3=B6del &lt;<a href=3D"mailto:jroedel@s=
use.de">jroedel@suse.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi,<br>
<br>
I don&#39;t have any particular topics for today, but since there will be n=
o<br>
meeting next week due to my upcoming vacation, let us meet anyway to<br>
discuss PRs and topics everyone else might want to talk about.<br>
<br>
See you at 6pm CEST/9am PST at<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://meet.opensuse.org/coconutsvs=
m" rel=3D"noreferrer" target=3D"_blank">https://meet.opensuse.org/coconutsv=
sm</a><br>
<br>
Regards,<br>
<br>
-- <br>
J=C3=B6rg R=C3=B6del<br>
<a href=3D"mailto:jroedel@suse.de" target=3D"_blank">jroedel@suse.de</a><br=
>
<br>
SUSE Software Solutions Germany GmbH<br>
Frankenstra=C3=9Fe 146<br>
90461 N=C3=BCrnberg<br>
Germany<br>
<br>
(HRB 36809, AG N=C3=BCrnberg)<br>
Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudie=
n Moerman<br>
-- <br>
Svsm-devel mailing list<br>
<a href=3D"mailto:Svsm-devel@coconut-svsm.dev" target=3D"_blank">Svsm-devel=
@coconut-svsm.dev</a><br>
<a href=3D"https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel" rel=
=3D"noreferrer" target=3D"_blank">https://mail.8bytes.org/cgi-bin/mailman/l=
istinfo/svsm-devel</a><br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">-Dionna Glaze, PhD (she/her)</div></div>

--00000000000009837c06088c3e53--
