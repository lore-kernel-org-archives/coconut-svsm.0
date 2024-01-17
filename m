Return-Path: <jacobhxu@google.com>
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 580BE1C3C0E
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Jan 2024 18:39:36 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d6f1df9355so116405ad.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 17 Jan 2024 09:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705513174; x=1706117974; darn=coconut-svsm.dev;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MeEUesL9URdEj6MTInlDuZBiguOV9dc4ldUoQyZEaGM=;
 b=TDM9wAUmkLvmRXFMN3Q4z1BFJ5BiCBDwNLK0xc6apN39I26gE2ecI0LPZP6065Yyu9
 0ILWzhKc/4w3MDh+uLmnKz/9xcsrkKe4Y30qf1xj7uNO8qF2ZdJnSj6C4g9LjQismvjk
 y2gQXm+t7Xnvl+AIG5Zh2inTbP2q5KTIcALUycexupSr76vrTI2AAFCKKAcoG4NS1NSz
 1kIcRb7zgyUYb4yY0z5l+u36chE9FRZTok11OyRRm+FPSRc3eP7LxP6qWv77ZAMgnnMp
 MG/J8GvKhWbV5v5vVsabFPIykhuJYq2Qh8gCeZeGTWJNjF1eZZqyNY34o+WhK0o2ieL3
 mPQA==
MIME-Version: 1.0
References: <6C4D2A02-3B78-4F3F-AD1A-87A1C24CB8CD@suse.de>
In-Reply-To: <6C4D2A02-3B78-4F3F-AD1A-87A1C24CB8CD@suse.de>
From: Jacob Xu <jacobhxu@google.com>
Date: Wed, 17 Jan 2024 09:39:22 -0800
Message-ID: <CAJ5mJ6ix_+pJc+ty8OgEdZt4gwBXhJd00DbhccESJYZh9_wsUQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e966e5060f27ba36"
Subject: Re: [svsm-devel] SVSM Development Call Jan 17th, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, carlos.bilbao@amd.com
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

--000000000000e966e5060f27ba36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Carlos,

Here's a link to the AP boot race condition mentioned during the call, it's
on the SNP host-kernel patches.

https://www.spinics.net/lists/kernel/msg5058122.html

Jacob

On Wed, Jan 17, 2024 at 4:48=E2=80=AFAM J=C3=B6rg R=C3=B6del <jroedel@suse.=
de> wrote:

> Hi all,
>
> Just a reminder for todays SVSM Development call at 9am PST/6pm CET.
>
> If you have any agenda items you want to see covered, please let me know.
> Otherwise we will just do the usual rounds of updates and Q&A.
>
> We meet as usual at https://meet.google.com/ppv-xehx-dvb
>
> Regards,
>
> J=C3=B6rg R=C3=B6del
> jroedel@suse.de
>
> SUSE Software Solutions Germany GmbH
> Frankenstra=C3=9Fe 146
> 90461 N=C3=BCrnberg
> Germany
> https://www.suse.com/
>
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew McDonald, Werner Knoblich
> (HRB 36809, AG N=C3=BCrnberg)
>
>
>

--000000000000e966e5060f27ba36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Carlos,<div><br></div><div>Here&#39;s a link to the AP =
boot race condition mentioned during the call, it&#39;s on the SNP host-ker=
nel patches.</div><div><br></div><div><a href=3D"https://www.spinics.net/li=
sts/kernel/msg5058122.html">https://www.spinics.net/lists/kernel/msg5058122=
.html</a><br></div><div><br></div><div>Jacob</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 17, 2024 at 4=
:48=E2=80=AFAM J=C3=B6rg R=C3=B6del &lt;<a href=3D"mailto:jroedel@suse.de">=
jroedel@suse.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi all,<br>
<br>
Just a reminder for todays SVSM Development call at 9am PST/6pm CET.<br>
<br>
If you have any agenda items you want to see covered, please let me know. O=
therwise we will just do the usual rounds of updates and Q&amp;A.<br>
<br>
We meet as usual at <a href=3D"https://meet.google.com/ppv-xehx-dvb" rel=3D=
"noreferrer" target=3D"_blank">https://meet.google.com/ppv-xehx-dvb</a><br>
<br>
Regards,<br>
<br>
J=C3=B6rg R=C3=B6del<br>
<a href=3D"mailto:jroedel@suse.de" target=3D"_blank">jroedel@suse.de</a><br=
>
<br>
SUSE Software Solutions Germany GmbH<br>
Frankenstra=C3=9Fe 146<br>
90461 N=C3=BCrnberg<br>
Germany<br>
<a href=3D"https://www.suse.com/" rel=3D"noreferrer" target=3D"_blank">http=
s://www.suse.com/</a><br>
<br>
Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew McDonald, Werner Knoblich<br>
(HRB 36809, AG N=C3=BCrnberg)<br>
<br>
<br>
</blockquote></div>

--000000000000e966e5060f27ba36--
