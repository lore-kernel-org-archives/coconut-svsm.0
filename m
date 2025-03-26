Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id CA85246D7F
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Mar 2025 22:02:08 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso44082266b.2
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Mar 2025 14:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1743022928; x=1743627728; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVys8rhVxIaF1FNlmF5tXWRO1iwWw4y810bC0dwnmrA=;
 b=NEeS3DBOoaNvbwZZ4PxlNvBiNpAk/LdAMd6UrGjr2oWx+7M4lslbIRR7mNxTNAFw61
 jJvax6cJR70o8j7oImBi0AkTB75OhNiydhKjrRcEfRuqwGchvmcc2oPmUOGZCUm13VvF
 hukj9VwGgoI/8S1QvEHMftHUbP1yynUWXtqjSjVNXXBh7SQZ7dKplb6J8zYv00oUhhL5
 vH1XgJxineSEeeH+i4hHLfdzWuoQ2XQ1AVP/3SBJ07VQLYVpxJC3zV0H/WuixCvwiCnV
 BZ6eSTpm+w/EB7lnuO44oQAQUvE8mtAU1zrt9FyOrsQ8MJS3HURp3qmfUZr+/aFYfAcK
 /uYA==
MIME-Version: 1.0
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
 <9f2236e99150814f64f444aff2d3edee495483a8.camel@ibm.com>
 <CAAH4kHaP6n-n=X=zDxonqhv2tZRjycS3R0XBX-FZv6tS7xn_hQ@mail.gmail.com>
 <CAH6wD8X9ttrnt5rTTx8paDiWeBOnZZCgWsEiDHctLqgz5GZucw@mail.gmail.com>
 <c17b2eee63c5c16305d2a8b9aa8e451134718cdf.camel@HansenPartnership.com>
 <CAAH4kHZe1S1ErOoqX7E6qVr9ofTf15_3zyEh3-xjufcksAkiGQ@mail.gmail.com>
In-Reply-To: <CAAH4kHZe1S1ErOoqX7E6qVr9ofTf15_3zyEh3-xjufcksAkiGQ@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 26 Mar 2025 14:01:55 -0700
Message-ID: <CAAH4kHYdy6bovpA=M5gYfp-K_rBC2Hz_r-tHg_XdEJ9uEc5wMw@mail.gmail.com>
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

As the selector is used to drive a create_primary command, it's
possible for the command to fail before getting to the attestation
report creation.
If this svsm attestation report fails with invalid_parameter, then
sev-guest will retry in a loop thinking the only way for the request
to fail is due to output buffer sizes being wrong.

I think in addition to the selector address and length, I'll use the
would-be-reserved 4 following bytes for an error code related to the
selector.  If this is set, then the attestation should not be retried.
Does it make sense to add the error code as a RO configfs attribute?
We can make it visible only if the write generation is the same as the
generation it was when the error code was recorded.

On Fri, Mar 7, 2025 at 9:51=E2=80=AFAM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> On Fri, Mar 7, 2025 at 6:24=E2=80=AFAM James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> >
> > On Fri, 2025-03-07 at 11:48 +0000, Geoffrey Ndu wrote:
> > > Since the single_service_manifest call for the vTPM effectively
> > > certifies EKs, why don=E2=80=99t the =E2=80=9Cselector=E2=80=9D be th=
e handle values for EK
> > > certificates, as specified by the TCG in 2.2.2.5.1 of =E2=80=9CTCG EK
> > > Credential Profile For TPM Family 2.0; Level 0=E2=80=9D? This approac=
h would
> > > simplify the user experience, as every SVSM would function
> > > identically, and  SVSM vTPMs would exhibit analogous behaviour to
> > > physical TPMs.
> >
> > Because to make life easier we might want to short circuit the EK/AK
> > makecredential/activatecredential round trip and simply construct a
> > signing EK to use in place of an arbitrary AK.  Then to make the
> > signing EK easily useful, we might want it not to have a policy
> > statement tying it to the endorsement hierarchy password (particularly
> > as we know that will be empty).  To allow this type of thing we need to
> > allow flexibility in the EK creation which isn't listed in the TCG
> > profile EK templates.
> >
>
> I have local changes to tpm-rs that I haven't pushed to make this
> commit work on its own, but this is what I'm prototyping.
>
> https://github.com/coconut-svsm/svsm/commit/db1ad6018b04b995e0278455eb2f9=
a66569cbcc9
>
> > Regards,
> >
> > James
> >
>
>
> --
> -Dionna Glaze, PhD, CISSP, CCSP (she/her)



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
