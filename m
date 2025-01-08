Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 6B20B2E0016
 for <svsm-devel@coconut-svsm.dev>; Wed,  8 Jan 2025 04:06:22 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aab925654d9so2860338566b.2
 for <svsm-devel@coconut-svsm.dev>; Tue, 07 Jan 2025 19:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736305581; x=1736910381; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wyufpv6roPjBF5s9DOcZCzPFDzdIdzRLScGnJY6bh/E=;
 b=t9fNc9hIkjTgu9NGS1vFr1C4lqqnlgjolVdby58sMsNIjy7e7dNulGqFqti5B8I7oA
 mm4FqksLrzYr1/CnEtxlU0X+nAAcMHJ5N7QzAAiLbYiklQt96eS2vYYF7NH3k5w6JvKH
 oCOykFQ81Q+CbGc1vK6v23dJgVpm32s2RevDTL+WwW0zrEWKByrSAQUkhrZ1U7zrigDu
 /oqCk/UUAaXH80Z9y2TrulFZsZB2hkns2LtJwfvGJ61L00OZ0aCVlQfBUYmLLcudXUKL
 1NmB7qinaYAZpie2vDwTYmk29liQV6FIXN35vcthgW1RM6nFijxqCZakHUyOV9PT3x2k
 cQ2Q==
MIME-Version: 1.0
References: <Z31OYDtmN3DRe3oN@8bytes.org>
 <CAAH4kHb21i+CbknQyYjycu2vracmJENkxS8-=VMCmOoNgA0p=A@mail.gmail.com>
 <06c94a892ce95aa043b6afaf3e61f8ee2b3010e8.camel@HansenPartnership.com>
In-Reply-To: <06c94a892ce95aa043b6afaf3e61f8ee2b3010e8.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 7 Jan 2025 19:06:10 -0800
Message-ID: <CAAH4kHYn0vW2ODa_co+0pzfbuCM27LRUySk0XrKBNgQYqU+-iw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] SVSM Development Call January 8th, 2025
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

On Tue, Jan 7, 2025 at 3:08=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Tue, 2025-01-07 at 08:26 -0800, Dionna Amalie Glaze wrote:
> > On Tue, Jan 7, 2025 at 7:55=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8byte=
s.org> wrote:
> > >
> > > Hi,
> > >
> > > Happy new year everyone!
> > >
> > > Here is the usual call for agenda items for the first SVSM
> > > development
> > > call in 2025.  Please send me any agenda items you have in mind or
> > > raise
> > > them in the meeting.
> > >
> > > I have one item on the agenda so far:
> > >
> > >         * IGVM support for QEMU.
> >
> > Regarding this, I'd like to make sure we cover the topic of MSFT
> > donating the IGVM spec and implementation to the CCC for appropriate
> > open governance.
>
> The spec isn't really separated from the code: it's all one thing.  I

For now, though for disparate implementations across openvmm, qemu,
Vanadium, EC2, we should expect implementations to diverge without a
forum under a body like the Linux Foundation for folks from different
companies to meet in a legally-blessed way. I asked for a way to
bundle signed reference values to be added to the spec last year, and
I can't easily propose an implementation without director or VP
approval.

> think in principle this document along side code is a good thing and we
> want to keep it that way, so you're in effect asking to move this
> entire repo:
>
> https://github.com/microsoft/igvm
>
> The IGVM format is designed to be useful beyond simply confidential
> computing for multiple different virtual machine images, so even if we
> were to move it, I'm not sure the CCC would be the best place to
> guarantee that universality.
>
> >  We're institutionally blocked without a significant approval chain
> > to provide code to competitor companies.
>
> This sounds a bit like an internal Google problem; I may be able to
> help you with this, but I think it's been a while since I engaged
> Google legal on open source.  However, the main argument for you to
> deploy is that for open source the whole point is to collaborate with
> your competitors in the open and you should be empowered to do that.
>

I understand. But see below that I don't often get a "yes" to these request=
s.

> >  Keeping the tools Coconut-SVSM and Qemu uses under Microsoft is an
> > inversion of power, even with the MIT license.
>
> You mean simply by hosting it under our external github account?  It's
> where we incubate all our open source projects that accept outside
> contributions (and where we hope to openly demonstrate stewardship
> worthy of community trust) and I believe Google does something similar.
> All corporations tread this fine line: if the project accretes a
> vibrant community, we'd likely be happy to move it elsewhere, but we
> equally don't want to be accused of simply throwing code over the wall,
> which is why we incubate projects to see how they progress.
>

:) I expected a "go kick rocks".
It's commendable, what Microsoft has done for the past 6 years at
least with openenclave, openhcl, openvmm, igvm, etc.
I've barked up that tree here for 7 years and been told no, open
source good will isn't dollars.
I personally agree with everything you said, but had to ask for the
company line.

> Regards,
>
> James



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
