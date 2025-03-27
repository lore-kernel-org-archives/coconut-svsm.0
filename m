Return-Path: <gndu8086@gmail.com>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 8C62B445FC
 for <svsm-devel@coconut-svsm.dev>; Thu, 27 Mar 2025 12:37:54 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso8051335e9.3
 for <svsm-devel@coconut-svsm.dev>; Thu, 27 Mar 2025 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743075474; x=1743680274; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owYQCCn/JrStfR8R3ckwa7IoUUZBq442WYN4fZrH7mA=;
 b=d1qiJnOpylxjBc6WJ6DGnm7ECpzoB5a5DN7S39Z5jv1w0nuR7oNyNjIEDeuePeq004
 WeK3nTBKAWQJo/12tnEY46v63ynsADkPh7rg8DcJ+okHPYLz/gQXEsdl4C/bwqv/cOO2
 ikL3GlZByRofQkysGlDcq753bmlahPAVV8gQLMldBlrD6ynW8swDl+N1GMaEe6Zba8dX
 Bzgdq4kfoCouoDmN8gMbZ7f4kvGoXwoZXG6l2HFJ6Rhxtx5rlFeBGBujKjDlFZd8cup8
 7BOIr5oGehdKCQkQSZw8UmxjnTpGm2Wcrc0wAIrp5cYhQM4t6kvtolQlc4F5Kgt4aIrj
 SdpQ==
MIME-Version: 1.0
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
 <9f2236e99150814f64f444aff2d3edee495483a8.camel@ibm.com>
 <CAAH4kHaP6n-n=X=zDxonqhv2tZRjycS3R0XBX-FZv6tS7xn_hQ@mail.gmail.com>
 <CAH6wD8X9ttrnt5rTTx8paDiWeBOnZZCgWsEiDHctLqgz5GZucw@mail.gmail.com>
 <c17b2eee63c5c16305d2a8b9aa8e451134718cdf.camel@HansenPartnership.com>
 <CAAH4kHZe1S1ErOoqX7E6qVr9ofTf15_3zyEh3-xjufcksAkiGQ@mail.gmail.com>
 <CAAH4kHYdy6bovpA=M5gYfp-K_rBC2Hz_r-tHg_XdEJ9uEc5wMw@mail.gmail.com>
In-Reply-To: <CAAH4kHYdy6bovpA=M5gYfp-K_rBC2Hz_r-tHg_XdEJ9uEc5wMw@mail.gmail.com>
From: Geoffrey Ndu <gndu8086@gmail.com>
Date: Thu, 27 Mar 2025 11:37:42 +0000
Message-ID: <CAH6wD8WEqn4XyefQXBYyTT_W6g6mE5GOhcp25BxpwJz_bgmZ1A@mail.gmail.com>
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
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Claudio Siqueira de Carvalho <cclaudio@ibm.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

I believe it would be helpful to add the error code as a read-only
attribute in configfs

Geoffrey

On Wed, Mar 26, 2025 at 9:02=E2=80=AFPM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> As the selector is used to drive a create_primary command, it's
> possible for the command to fail before getting to the attestation
> report creation.
> If this svsm attestation report fails with invalid_parameter, then
> sev-guest will retry in a loop thinking the only way for the request
> to fail is due to output buffer sizes being wrong.
>
> I think in addition to the selector address and length, I'll use the
> would-be-reserved 4 following bytes for an error code related to the
> selector.  If this is set, then the attestation should not be retried.
> Does it make sense to add the error code as a RO configfs attribute?
> We can make it visible only if the write generation is the same as the
> generation it was when the error code was recorded.
>
> On Fri, Mar 7, 2025 at 9:51=E2=80=AFAM Dionna Amalie Glaze
> <dionnaglaze@google.com> wrote:
> >
> > On Fri, Mar 7, 2025 at 6:24=E2=80=AFAM James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:
> > >
> > > On Fri, 2025-03-07 at 11:48 +0000, Geoffrey Ndu wrote:
> > > > Since the single_service_manifest call for the vTPM effectively
> > > > certifies EKs, why don=E2=80=99t the =E2=80=9Cselector=E2=80=9D be =
the handle values for EK
> > > > certificates, as specified by the TCG in 2.2.2.5.1 of =E2=80=9CTCG =
EK
> > > > Credential Profile For TPM Family 2.0; Level 0=E2=80=9D? This appro=
ach would
> > > > simplify the user experience, as every SVSM would function
> > > > identically, and  SVSM vTPMs would exhibit analogous behaviour to
> > > > physical TPMs.
> > >
> > > Because to make life easier we might want to short circuit the EK/AK
> > > makecredential/activatecredential round trip and simply construct a
> > > signing EK to use in place of an arbitrary AK.  Then to make the
> > > signing EK easily useful, we might want it not to have a policy
> > > statement tying it to the endorsement hierarchy password (particularl=
y
> > > as we know that will be empty).  To allow this type of thing we need =
to
> > > allow flexibility in the EK creation which isn't listed in the TCG
> > > profile EK templates.
> > >
> >
> > I have local changes to tpm-rs that I haven't pushed to make this
> > commit work on its own, but this is what I'm prototyping.
> >
> > https://github.com/coconut-svsm/svsm/commit/db1ad6018b04b995e0278455eb2=
f9a66569cbcc9
> >
> > > Regards,
> > >
> > > James
> > >
> >
> >
> > --
> > -Dionna Glaze, PhD, CISSP, CCSP (she/her)
>
>
>
> --
> -Dionna Glaze, PhD, CISSP, CCSP (she/her)
