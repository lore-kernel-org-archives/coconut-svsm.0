Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 09AAA44CDE
 for <svsm-devel@coconut-svsm.dev>; Fri,  7 Mar 2025 18:52:04 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-abf5e1a6cd3so400906666b.2
 for <svsm-devel@coconut-svsm.dev>; Fri, 07 Mar 2025 09:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1741369924; x=1741974724; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8eI0OQBr5sDg8EHCeoZ2kfA6SD0zX6J+nLeCE1fdYqE=;
 b=vbyvB3IPNpEhAwX9BKhrCxV4uA8rms5MPtt9yBsodVRTbEuQlYcnyamBLcvtBgbM6L
 EDcHuM7pIpdhP6ITeGqmStnLY2zkn0NEURkrzVhYG7td16GShAPJSTG/YcrEiZlypzo1
 oRlI19ZwZ9BoiqexR+LeJ2b089zy1+T5qOa2k93uRGr30tKsSGEdBCRAfZAaotMwAmVL
 zpFaJC8O3OqpFQ/gqw5/RLDeWM1GR6hr14JrDIdO3Co8kRBMEn0lfgjlN8lFJjkmm15I
 pGGThnghS8nf26ThipXgtgagG6pMl87xhWpconul7fYbQPab7xMn79sF+4CH4kIM8KrS
 6uOw==
MIME-Version: 1.0
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
 <9f2236e99150814f64f444aff2d3edee495483a8.camel@ibm.com>
 <CAAH4kHaP6n-n=X=zDxonqhv2tZRjycS3R0XBX-FZv6tS7xn_hQ@mail.gmail.com>
 <CAH6wD8X9ttrnt5rTTx8paDiWeBOnZZCgWsEiDHctLqgz5GZucw@mail.gmail.com>
 <c17b2eee63c5c16305d2a8b9aa8e451134718cdf.camel@HansenPartnership.com>
In-Reply-To: <c17b2eee63c5c16305d2a8b9aa8e451134718cdf.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 7 Mar 2025 09:51:51 -0800
Message-ID: <CAAH4kHZe1S1ErOoqX7E6qVr9ofTf15_3zyEh3-xjufcksAkiGQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] vTPM service attestation format update
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Geoffrey Ndu <gndu8086@gmail.com>, Claudio Siqueira de Carvalho <cclaudio@ibm.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

On Fri, Mar 7, 2025 at 6:24=E2=80=AFAM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Fri, 2025-03-07 at 11:48 +0000, Geoffrey Ndu wrote:
> > Since the single_service_manifest call for the vTPM effectively
> > certifies EKs, why don=E2=80=99t the =E2=80=9Cselector=E2=80=9D be the =
handle values for EK
> > certificates, as specified by the TCG in 2.2.2.5.1 of =E2=80=9CTCG EK
> > Credential Profile For TPM Family 2.0; Level 0=E2=80=9D? This approach =
would
> > simplify the user experience, as every SVSM would function
> > identically, and  SVSM vTPMs would exhibit analogous behaviour to
> > physical TPMs.
>
> Because to make life easier we might want to short circuit the EK/AK
> makecredential/activatecredential round trip and simply construct a
> signing EK to use in place of an arbitrary AK.  Then to make the
> signing EK easily useful, we might want it not to have a policy
> statement tying it to the endorsement hierarchy password (particularly
> as we know that will be empty).  To allow this type of thing we need to
> allow flexibility in the EK creation which isn't listed in the TCG
> profile EK templates.
>

I have local changes to tpm-rs that I haven't pushed to make this
commit work on its own, but this is what I'm prototyping.

https://github.com/coconut-svsm/svsm/commit/db1ad6018b04b995e0278455eb2f9a6=
6569cbcc9

> Regards,
>
> James
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
