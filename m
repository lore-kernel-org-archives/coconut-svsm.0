Return-Path: <gndu8086@gmail.com>
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 5C87644C9B
 for <svsm-devel@coconut-svsm.dev>; Fri,  7 Mar 2025 12:48:29 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-390cf7458f5so1675515f8f.2
 for <svsm-devel@coconut-svsm.dev>; Fri, 07 Mar 2025 03:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741348108; x=1741952908; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjnnIRMMM5+y6MfHBsFmn4gknPicAxoSCsjptu7huIE=;
 b=mqFPHnzWpXQBBsZMACSFRrTbUUwWLg8cOTj1ebHyNFGPM/GOqgJEf5G0V1wqtupcMX
 nOsIDayURgPxclQ/jV3cGGGM9XDkgwpGPaXJhlGZR/1nDkQ0aXRTCMjuGKYJygU26Ghj
 2uMGUjZeBtF/AWkQfgwDzPvviEKQc95cBlNRp9DMplWXYvvRF2QzFgFI6O6md5/GIuHx
 YkbYjIyWTq4fKH8W+Hj4JterAX2IDam1bnWYwD5ros62+HaCVI7Wpzhs5SrbMmOzlmql
 iBHt9MfJEzAo1XO/XNfdmwIys1fyRU/Y7Lbhf7iYHzgMNfay2JnU0b+6o7nFOi/xSsAR
 KZBw==
MIME-Version: 1.0
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
 <9f2236e99150814f64f444aff2d3edee495483a8.camel@ibm.com>
 <CAAH4kHaP6n-n=X=zDxonqhv2tZRjycS3R0XBX-FZv6tS7xn_hQ@mail.gmail.com>
In-Reply-To: <CAAH4kHaP6n-n=X=zDxonqhv2tZRjycS3R0XBX-FZv6tS7xn_hQ@mail.gmail.com>
From: Geoffrey Ndu <gndu8086@gmail.com>
Date: Fri, 7 Mar 2025 11:48:17 +0000
Message-ID: <CAH6wD8X9ttrnt5rTTx8paDiWeBOnZZCgWsEiDHctLqgz5GZucw@mail.gmail.com>
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
Cc: Claudio Siqueira de Carvalho <cclaudio@ibm.com>, "James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

Since the single_service_manifest call for the vTPM effectively certifies E=
Ks,
why don=E2=80=99t the =E2=80=9Cselector=E2=80=9D be the handle values for E=
K certificates, as specified
by the TCG in 2.2.2.5.1 of =E2=80=9CTCG EK Credential Profile For TPM Famil=
y
2.0; Level 0=E2=80=9D?
This approach would simplify the user experience, as every SVSM would
function identically,
and  SVSM vTPMs would exhibit analogous behaviour to physical TPMs.

Geoffrey

On Wed, Mar 5, 2025 at 4:17=E2=80=AFPM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> On Wed, Mar 5, 2025 at 7:29=E2=80=AFAM Claudio Siqueira de Carvalho
> <cclaudio@ibm.com> wrote:
> >
> > On Fri, 2025-02-21 at 08:31 -0500, James Bottomley wrote:
> > > On Thu, 2025-02-20 at 17:17 -0800, Dionna Amalie Glaze wrote:
> > > > I'd like to propose a new version to the vTPM protocol that is
> > > > clearer
> > > > about its EK information.
> > > > It's possible to create multiple primary endorsement keys with
> > > > different algorithms.
> > > >
> > > > For manifest version 1, we have a list of created primary keys in
> > > > TPM_ALG enum order, not creation order.
> > > >
> > > > 0x000 uint32 Number of primary endorsement keys
> > > > 0x004 Variable Number-many TPMT_PUBLIC structures
> > > >
> > > > I don't want to try to load a lot into this change request. For
> > > > reducing pain with make/activatecredential, there's more to discuss=
.
> > >
> > > I'm not sure I exactly understand the proposal, but I think it's that
> > > the type of endorsement key should be part of the input data to the
> > > vTPM protocol attestation?  In which case I agree.
> > >
> > > However, the last sentence about make/activate credential makes me
> > > think you're being too traditional about this.  That protocol is real=
ly
> > > only required because physical TPMs are only shipped with encryption =
EK
> > > certificates to force the privacy preserving algorithms.  Since there=
's
> > > no privacy concerns about the vTPM in a confidential system, we can
> > > just produce a signing EK, which can itself certify TPM objects witho=
ut
> > > the need for doing the AK creation dance.
> > >
> > > That argues that there should be two input arguments: algorithm and k=
ey
> > > type.
> >
> > I am also not sure I fully understand the proposal.
> >
> > Providing algorithm and key type may not be enough to identify an EK as=
 we need
> > to provide multiple parameters to create one, for example:
>
> This is not what I'm saying. In implementing this I found a
> simplification that we can use the manifest version for the selector
> version.
> The "selector" can be as rich as the entire command to CreatePrimary.
> To make it simpler, I'm making 2 initial selector variants.
>
> The first is a TPM2B_PUBLIC that will behind the scenes use an empty
> auth block, insensitve, outsidedata, and pcrselection in the creation.
>
> I'd revise the single service attestation extension to just take 2
> additional arguments: the selector gpa and selector length.
>
> manifest =3D single_service_manifest_ex(guid, manifest_version, selector)
> magic =3D u8[b'S', b'S', b'M', b'2']
> selector_context =3D guid || manifest_version.to_le_bytes() || magic || s=
elector
> The report_data used in the attestation report becomes SHA-512(nonce
> || selector_context || manifest).
>
> >
> > RSA2048 primary key
> > https://github.com/cclaudio/svsm/commit/d3fb0bb5756e69f71ce01f3fb4c0b1b=
3a0d3eaec#diff-50751d6df54bc336e47e1d5907bf31e0fc3491e287d202bf6149df05b582=
e0b6R80-R108
> >
> > ECC_P256 primary key
> > https://github.com/cclaudio/svsm/commit/d3fb0bb5756e69f71ce01f3fb4c0b1b=
3a0d3eaec#diff-50751d6df54bc336e47e1d5907bf31e0fc3491e287d202bf6149df05b582=
e0b6R141-R170
> >
> > In addition to that, the number of permutations of algorithms and types=
 could be
> > relatively big as well.
> >
> > Here is another idea. Maybe we can agree on a few TPM memory slots that=
 could be
> > used for primary keys and then the attestation request could just refer=
 to one
> > of those.
> >
>
> Yes, this is the second selector variant, which is to provide an NV
> index for an EK template that will serve as the selector to the
> implementation of the first variant.
> RSA EK template for EK provisioning is from "TCG TPM v2.0 Provisioning
> Guidance" - v1r1 - Table 2, 0x8101_0001 and ECC is 0x8101_0002.
>
> For Google's RSA AK template (signing EK), the NV index is
> 0x01c1_0001, and ECC is 0x01c1_0003.
> I believe Geoffrey's L-1 key template ought to be from the EK
> credential profile's low range 0x01c0_0004 for RSA EK template.
>
> Note that 0x8101_0001 is the platform's prerogative to define, so we
> should expect different Coconut-SVSM distributions to populate it
> differently.
>
> > Regards,
> > Claudio
> >
> > >
> > > Reegards,
> > >
> > > James
> > >
> >
>
>
> --
> -Dionna Glaze, PhD, CISSP, CCSP (she/her)
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
