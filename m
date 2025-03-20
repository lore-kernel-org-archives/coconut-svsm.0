Return-Path: <osteffen@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 9775B46447
 for <svsm-devel@coconut-svsm.dev>; Thu, 20 Mar 2025 14:41:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742478076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=upueXuPNSf7nzRvG0VbfWNtgH+IMK9tncOib00+IPus=;
 b=S0mahMJSs8wRlFqViQ3K4DC3EXcs9TSacttIBjeljxpuivEBo7L7WA4u9QkRHW801J0Qok
 B0M0XkxfXl9ddFt6sJZ2avrkarGRf/BPox/I1MF9yqn9GDESdXgK2IVxmbwpuP6xqUtA7E
 U25j8d2BeazIq+43ZhDXzP4G62oLjs4=
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-549adfc38daso382259e87.0
 for <svsm-devel@coconut-svsm.dev>; Thu, 20 Mar 2025 06:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAGxU2F4DOAhiRd02V0U6So0XV528DAahzJGgQTqFFDuF3j1+xw@mail.gmail.com>
In-Reply-To: <CAGxU2F4DOAhiRd02V0U6So0XV528DAahzJGgQTqFFDuF3j1+xw@mail.gmail.com>
From: Oliver Steffen <osteffen@redhat.com>
Date: Thu, 20 Mar 2025 14:41:00 +0100
Message-ID: <CA+bRGFpay+cqzaKFzQ=3JLrHuRz1LJKN5w5JPJQ-mVgXymaOdg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007f64e20630c64a48"
Subject: Re: [svsm-devel] Call for mentors/ideas for Google Summer of Code
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: svsm-devel@coconut-svsm.dev, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>

--0000000000007f64e20630c64a48
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 10:25=E2=80=AFAM Stefano Garzarella <sgarzare@redha=
t.com>
wrote:

> Hi all,
> the QEMU community has kindly offered to use their GSoC as an umbrella
> for ideas regarding SVSM as well, since there are many students
> interested in programming in Rust.
>
> QEMU has been accepted as an organization [1] for GSoC 2025, so we are
> looking for ideas and available mentors.
>
> In this thread [2] in qemu-devel, Stefan explained how to share new
> ideas. We are a bit behind schedule, by March 24 (the start date of
> scholar applications) we should have the ideas added to the QEMU ideas
> page [3].
>
> If you prefer, we can discuss ideas here and then post those that have
> at least one mentor on the qemu-devel thread [2]. I already have
> another accepted idea regarding rust-vmm, but I could help as a
> co-mentor if needed.
>

An idea that came to mind (not fully thought through) is to do something
about
logging, adding a log buffer, log targets and/or some kind of tracing
feature?
There is an old PR here that worked on something like that:
https://github.com/coconut-svsm/svsm/pull/52

But since the deadline is already in a couple of days and I don't think
it is realistic (at least not for me) to get something together in time.

Oliver


>
> Thanks,
> Stefano
>
> [1]
> https://lore.kernel.org/qemu-devel/CAJSP0QVzNieSgkecZEjsfjwpQsXL3-7yrwech=
7-QH433V_u+Gg@mail.gmail.com/
> [2]
> https://lore.kernel.org/qemu-devel/CAJSP0QVYE1Zcws=3D9hoO6+B+xB-hVWv38Dtu=
_LM8SysAmS4qRMw@mail.gmail.com/
> [3] https://wiki.qemu.org/Google_Summer_of_Code_2025
>
>

--0000000000007f64e20630c64a48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 20,=
 2025 at 10:25=E2=80=AFAM Stefano Garzarella &lt;<a href=3D"mailto:sgarzare=
@redhat.com">sgarzare@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi all,<br>
the QEMU community has kindly offered to use their GSoC as an umbrella<br>
for ideas regarding SVSM as well, since there are many students<br>
interested in programming in Rust.<br>
<br>
QEMU has been accepted as an organization [1] for GSoC 2025, so we are<br>
looking for ideas and available mentors.<br>
<br>
In this thread [2] in qemu-devel, Stefan explained how to share new<br>
ideas. We are a bit behind schedule, by March 24 (the start date of<br>
scholar applications) we should have the ideas added to the QEMU ideas<br>
page [3].<br>
<br>
If you prefer, we can discuss ideas here and then post those that have<br>
at least one mentor on the qemu-devel thread [2]. I already have<br>
another accepted idea regarding rust-vmm, but I could help as a<br>
co-mentor if needed.<br></blockquote><div><br></div><div>An idea that came =
to mind (not fully thought through) is to do something about<br></div><div>=
logging, adding a log buffer, log targets and/or some kind of tracing featu=
re?<br></div><div>There is an old PR here that worked on something like tha=
t:<br><a href=3D"https://github.com/coconut-svsm/svsm/pull/52">https://gith=
ub.com/coconut-svsm/svsm/pull/52</a><br><br></div><div>But since the deadli=
ne is already in a couple of days and I don&#39;t think<br></div><div>it is=
 realistic (at least not for me) to get something together in time.</div><d=
iv><br></div><div>Oliver</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
Thanks,<br>
Stefano<br>
<br>
[1] <a href=3D"https://lore.kernel.org/qemu-devel/CAJSP0QVzNieSgkecZEjsfjwp=
QsXL3-7yrwech7-QH433V_u+Gg@mail.gmail.com/" rel=3D"noreferrer" target=3D"_b=
lank">https://lore.kernel.org/qemu-devel/CAJSP0QVzNieSgkecZEjsfjwpQsXL3-7yr=
wech7-QH433V_u+Gg@mail.gmail.com/</a><br>
[2] <a href=3D"https://lore.kernel.org/qemu-devel/CAJSP0QVYE1Zcws=3D9hoO6+B=
+xB-hVWv38Dtu_LM8SysAmS4qRMw@mail.gmail.com/" rel=3D"noreferrer" target=3D"=
_blank">https://lore.kernel.org/qemu-devel/CAJSP0QVYE1Zcws=3D9hoO6+B+xB-hVW=
v38Dtu_LM8SysAmS4qRMw@mail.gmail.com/</a><br>
[3] <a href=3D"https://wiki.qemu.org/Google_Summer_of_Code_2025" rel=3D"nor=
eferrer" target=3D"_blank">https://wiki.qemu.org/Google_Summer_of_Code_2025=
</a><br>
<br>
</blockquote></div></div>

--0000000000007f64e20630c64a48--

