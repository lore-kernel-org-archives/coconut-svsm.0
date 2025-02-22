Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A84A343134
 for <svsm-devel@coconut-svsm.dev>; Sat, 22 Feb 2025 01:37:21 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-abbec6a0bfeso427767566b.2
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 16:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740184641; x=1740789441; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6OYd4c9EzT2FrauiPwHHrItnedGPezNE0JvS+R0Qls=;
 b=BKG4904Lq/QqJB5lDaPt/pDJikP9QcJshOJ+HLE5AilFNn2Kn997tEnhcT8hk+888g
 oBlYN/yiB9eOuhZg9s6ERSfxjpWpEdYaEyZW274Otw7umgdo9XFhG1+xBoIZjyo/wqNW
 9im50BpBBYe4Ske1CuNl+fB2damu070XGc3gOcEATE1dtBVBY/5MWZf7LaICAJuGQ8h2
 TFdpm4iUyFrZB7GOaHUe9JKUf2r5kxfkosXFeSpM654FXkGm2u+f6xwGK3PFt9tWc4OG
 F3e+vitiu9Z+a20ThWSjgUTNZ+7XLNcikCICgEAk+u9bZYeC1dinPrHEWUU86Be/CWDD
 xnkw==
MIME-Version: 1.0
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
 <CAAH4kHay7jEbjpV19BG6Ghsr4fy2Gxce2Ud6Gtc3QPX4aYgTjQ@mail.gmail.com>
 <596e9f2233a8938ec1360159df4f84238db2b20a.camel@HansenPartnership.com>
 <CAAH4kHZ6SdM4oAj6NbJ=z0eYT2DtvPm7SW=s3H-fA+T4i_426w@mail.gmail.com>
 <635e767a188aa8f83a1c9741821b021b48664ad6.camel@HansenPartnership.com>
In-Reply-To: <635e767a188aa8f83a1c9741821b021b48664ad6.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 21 Feb 2025 16:37:08 -0800
Message-ID: <CAAH4kHYCnSJBWkaHN8ywXEfbWhzqeh7Y2MRc_tTKSaKM9mqxLw@mail.gmail.com>
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
Cc: svsm-devel@coconut-svsm.dev, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>

> Well, you could do that, yes.  However, I was actually thinking of
> adding two new attestation guids having a _WITH_ARG suffix that allow
> you to pass in an extra pointer and length representing an argument
> buffer that the attestation protocol could validate and use.  Thus the
> VTPM attestation would choose the current template in the non-_WITH_ARG
> case as it does now and validate and perform attestation on the
> requested template in the _WITH_ARG case.  For completeness of inputs I
> suppose it makes sense that a whole template should actually be passed
> in as a TPMT_PUBLIC.
>

Now we're talking about changing the attestation service protocol, not
the vTPM protocol.
We can't change the operation structure of SVSM_ATTEST_SINGLE_SERVICE,
so we need to add SVSM_ATTEST_SINGLE_SERVICE2 and tell the core query
protocol that it's only available at version 2.

The register calling convention is the same, except the operation
structure is longer and uses Linux ABI extension guidelines of using
prior version's behavior when new fields are zero.

Take all of Table 13: Attest Single Service Operation and add

Table 13: Attest Single Service2 Operation
| Byte   Offset | Size (Bytes) |Alignment (Bytes) | Meaning |
...
> | 0x058           |                  4 |                             | Th=
e version of the service selection structure for the requested service |
> | 0x05C           |                  2 |                             | Th=
e TPMI_ALG_HASH for the digest algorithm to use for the selection structure=
 digest included in the service manifest |
> | 0x05E           |                  2 |                             | RE=
SERVED=E2=80=94MBZ |
> | 0x060           |                  8 |                     4 KB | gPA o=
f the service attestation selector structure |

The same spiel as attest single service follows, but with added text

> If any value starting at 0x58, 0x5C, 0x5E, or 0x60 is 0, they all must be=
 zero, otherwise the call will return SVSM_ERR_INVALID_PARAMETER.
> If the service does not support the TPM_ALG_ID and it is non-zero, the ca=
ll will return SVSM_ERR_INVALID_PARAMETER.
> If the service is unable to parse the attestation selector structure, the=
 call will return SVSM_ERR_INVALID_PARAMETER.
> No service may use a zero-length attestation selector structure.

Then the "descriptive manifest" changes to include a header

> The service will produce a descriptive manifest in a service-defined form=
at with a required header.
> If the TPM_ALG_ID is 0, the header is empty, otherwise, the manifest is o=
f the form
>
> | Byte offset | Size (bytes) | Meaning |
> | 0x000        |            Variable | TPMT_HA of the selection context |
> | Size(TMPT_HA) |            Variable | The service-specific service mani=
fest |
>
> The selection context is a structure
>
> | Byte offset | Size (bytes) | Meaning |
> | 0x000        |           16 | Service GUID in UUID 4122 network byte or=
der  |
> | 0x010        |             4 | The requested manifest version in little=
 endian    |
> | 0x010        |             4 | The service selection version in little =
endian    |
> | 0x018        |             8 | The magic number 0x324D5353 |
> | 0x020        | Variable | The service-specific selector structure |
>
> The vTPM protocol may respond to a selector version 1 structure
>
> | Byte offset | Size (bytes) | Meaning |
> | 0x000        |                  2 | Selection kind tag. If 0, then the =
selector is a TPM_HANDLE for an asymmetric primary key |
> | 0x002        |                  0 | Reserved=E2=80=94MBZ |
> | 0x004        |      size[tag] | If the tag is 0, then size 4 TPM_HANDLE=
. |
>
> If the vTPM finds that the handle is not for an asymmetric primary key, t=
hen the call returns SVSM_ERR_INVALID_PARAMETER.
> Otherwise, the service manifest is the TPMT_PUBLIC of the selected key.

The selection context is there to disambiguate any raw outputs from
different services at different versions.

Meanwhile, if we're going to do weird things, we should have clear
documentation and get some earmarked NV index ranges for Confidential
Computing vTPMs, no?
We ought to make the weird EK template we want accessible in a
specified NV index.
We can get a reserved range of handles by proposing changes to have
the CCC own a range of 64 handles.
https://trustedcomputinggroup.org/wp-content/uploads/Registry-of-Reserved-T=
PM-2.0-Handles-and-Localities-Version-1.2-Revision-1.00_pub.pdf

I do see that the EK credential profile has B.4.5.3 Table 13 "default
EK template for ECC Signing", so sign =3D 1 is acceptable for an EK.
There's also reserved NV indices for the automotive industry that
allow for signing EKs, but the Automotive-Thin profile does not make
use of any sign =3D 1 object attributes for EKs. The referenced
"Automotive-rich" profile doesn't exist.

I notice that Google Cloud's vTPM uses its own NV index for a
non-standard EK template at index 0x1c10000 that we're just kind of...
squatting on. I should work with the TCG to sort that out.








>


--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
