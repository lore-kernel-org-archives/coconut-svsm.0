Return-Path: <acdunlap@google.com>
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 84B564BC51
 for <svsm-devel@coconut-svsm.dev>; Wed, 21 May 2025 17:19:51 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-231f61dc510so1059945ad.0
 for <svsm-devel@coconut-svsm.dev>; Wed, 21 May 2025 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747840789; x=1748445589; darn=coconut-svsm.dev;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HzdkvQ5Y2ze8fP0/46XK3sn5zJ4ix5zUkI+8CtML6Jw=;
 b=awNFvNSZ3X3ibAKmEpp8qM5mNglWrGAIp+e4oMyg5BZDVyaeKI5sm+yDwvFcWBoUXW
 MemB+MDf3mkZZWpMAAijeZ39220eVDPTn+QYEl6fovkhNp6fpNgqc30u5oXm0W/EO5Fi
 ow1Zlom5vKEFbuecqLjTwrpJguunn6U0E+V2Gj5ztDHTvqTtBsN/8epzrt0sIvA0HNw3
 9QPBNHeKi5cHGwcIONppevkT2nFNsph0t17l6GccHEwOjK7CAqEyqBge9m0QSBFxrC7n
 9FFkqK/rwglu5S1QXoQwWm1qCoKzh0ByQxOFuNJ+Lyv8vVakpJn1Pfzg3WF0MVjMutc7
 aEBg==
MIME-Version: 1.0
References: <CAMBK9=YfWzsXqhav8d8-cLtn6RKLBKY4PN2FCHwjCci1Mi-fhQ@mail.gmail.com>
 <ifj4skreud33emq6apcrmp6s4na5nmwsncrxkozaicg4xih6il@5kqf6yjt3tsy>
 <SA6PR21MB430341F8085E6F0B004B865BCA9CA@SA6PR21MB4303.namprd21.prod.outlook.com>
 <nnijlaq5y6a5fvydo4vohgjefci63puwckhcrtgi5yec3tmbql@xjuuvnjyypqi>
 <SA6PR21MB4303A1AE51FDC2CC8A83A779CA9FA@SA6PR21MB4303.namprd21.prod.outlook.com>
 <3molncndmeeajso7cuyhx3cmt36wsx3lvsqurch54htvf7ngal@6e67qqyfbtk6>
In-Reply-To: <3molncndmeeajso7cuyhx3cmt36wsx3lvsqurch54htvf7ngal@6e67qqyfbtk6>
From: Adam Dunlap <acdunlap@google.com>
Date: Wed, 21 May 2025 08:19:38 -0700
Message-ID: <CAMBK9=aObzsePC--7gt=+w4PJw+tdEpf+QO7=TYdv6FLtZZqEw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005e2d690635a6e549"
Subject: Re: [svsm-devel] [EXTERNAL] Re: EDK2 CAA Page Fragmented Allocation
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Jon Lange <jlange@microsoft.com>, coconut-svsm@lists.linux.dev, svsm-devel@coconut-svsm.dev

--0000000000005e2d690635a6e549
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025, 4:20=E2=80=AFAM Gerd Hoffmann <kraxel@redhat.com> wro=
te:

>
> There is no trace of any explicit PVALIDATE calls.  So I'm wondering
> what conditions might cause the VMM do actions like that?
>
> One possibly relevant detail is that the linux kernel and the uefi
> runtime use different mappings and different virtual addresses to
> access the caa page.
>

If the guest accesses a GPA with the c-bit disabled, then KVM will
rmpupdate that page to shared. If the guest then accesses the same GPA with
the c-bit enabled, then KVM will rmpupdate it back to private, but it will
be unaccepted and thus give the 0x404 error. I've seen this happen while
investigating several different bugs.

Adam

>

--0000000000005e2d690635a6e549
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 21, 2025, 4:20=E2=80=
=AFAM Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.=
com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
There is no trace of any explicit PVALIDATE calls.=C2=A0 So I&#39;m wonderi=
ng<br>
what conditions might cause the VMM do actions like that?<br>
<br>
One possibly relevant detail is that the linux kernel and the uefi<br>
runtime use different mappings and different virtual addresses to<br>
access the caa page.<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">If the guest accesses a GPA with the c-bit disabled, th=
en KVM will rmpupdate that page to shared. If the guest then accesses the s=
ame GPA with the c-bit enabled, then KVM will rmpupdate it back to private,=
 but it will be unaccepted and thus give the 0x404 error. I&#39;ve seen thi=
s happen while investigating several different bugs.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Adam</div><div dir=3D"auto"><div class=3D"gmai=
l_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000005e2d690635a6e549--
