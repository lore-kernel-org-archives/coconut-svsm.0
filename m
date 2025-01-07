Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 78C932E001D
 for <svsm-devel@coconut-svsm.dev>; Tue,  7 Jan 2025 17:26:52 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso1853074566b.1
 for <svsm-devel@coconut-svsm.dev>; Tue, 07 Jan 2025 08:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736267212; x=1736872012; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPDb87+wHT7alrKNNz5U85die5MPoJIDxj7r/wzwoMM=;
 b=0gidy1QEM6w7b8hzdCUhd9zEO3SyvYkZT4Ik7MmcgKUyVP5DCIBDC2bsx+q6PJVKPs
 F6A4KSapyI7SMwsiM+No/qKdHan2U4PbY33B3F5VdexZUaK7pQGmHiOPcFmUXpI2hPiL
 vf+Zrwp71ERdzUvyOPEjNtECF5CCIHsMOI5spk72Q36iJTkA8DeLjNVbokGvs41SlSFI
 D2noKartEmd+v9DqNJQvKlvFz4UcjXJ4E3s4a4MZGRxV1HJfcWhFOrW792fa4pGBkOG4
 ltfAggkpYekFrP2afsQM/evJhWd5q31h6NNsar+W4+TZyFPDDi84UiEFW1c7ednP5/Hq
 17bg==
MIME-Version: 1.0
References: <Z31OYDtmN3DRe3oN@8bytes.org>
In-Reply-To: <Z31OYDtmN3DRe3oN@8bytes.org>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 7 Jan 2025 08:26:40 -0800
Message-ID: <CAAH4kHb21i+CbknQyYjycu2vracmJENkxS8-=VMCmOoNgA0p=A@mail.gmail.com>
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
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

On Tue, Jan 7, 2025 at 7:55=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8bytes.or=
g> wrote:
>
> Hi,
>
> Happy new year everyone!
>
> Here is the usual call for agenda items for the first SVSM development
> call in 2025.  Please send me any agenda items you have in mind or raise
> them in the meeting.
>
> I have one item on the agenda so far:
>
>         * IGVM support for QEMU.

Regarding this, I'd like to make sure we cover the topic of MSFT
donating the IGVM spec and implementation to the CCC for appropriate
open governance. We're institutionally blocked without a significant
approval chain to provide code to competitor companies.
Keeping the tools Coconut-SVSM and Qemu uses under Microsoft is an
inversion of power, even with the MIT license.

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



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
