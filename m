Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 0FF7A4423E
 for <svsm-devel@coconut-svsm.dev>; Tue, 25 Mar 2025 20:20:46 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2bfcd2a70so844336266b.0
 for <svsm-devel@coconut-svsm.dev>; Tue, 25 Mar 2025 12:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1742930446; x=1743535246; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwSA4M0a/8432Ze+0aESX0bQjrcTRTL0d+4YAm6cDaM=;
 b=cRHy0+MgQ8V1QW5GrRQSDhqh+6gUv6FsJQsLiea1mxmUvp+KsnpRWOM7+jJ7uyWphn
 UQ/GH4Ov/lJLpW8fvuvHgj7hJix16bKmsYU0M4s4EPs2txxYg1HfTDEwne4oUF+07rnh
 pp5DOyDMb4aQbyFdzLYnGZoFQOrwbtYgNBUR72/+VAqxPUTDTQY0qV45xgQ39LXXS8Pd
 KBPwDCfoO1i4p6sb6/JIhnaYPTiEHqCCuNCbcQleSmfu60LRhjsWGhevbCYzW1uC8Ma8
 jS+Ol2Luy4xVbgWrpXulwS1dJJJuEJjc3/FVlDWRf04QbN7y626ynaO4H2acrBFLRK/Q
 0d3g==
MIME-Version: 1.0
References: <cf792be2-56f8-653e-237d-a98787976b1d@amd.com>
 <CAAH4kHa_oas28jq4ExptkiMMzxk79G3fFxsg0X8KYvgCqC_u9w@mail.gmail.com>
In-Reply-To: <CAAH4kHa_oas28jq4ExptkiMMzxk79G3fFxsg0X8KYvgCqC_u9w@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 25 Mar 2025 12:20:33 -0700
Message-ID: <CAAH4kHZeoFKOsV-ZJ3k6N0H17Vx1-m8mDun7Qt2J9p=uFN+J8A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] GUIDs in the GHCB and SVSM specifications
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, svsm-devel@coconut-svsm.dev

On Tue, Mar 25, 2025 at 11:50=E2=80=AFAM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> On Wed, Feb 26, 2025 at 2:40=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd=
.com> wrote:
> >
> > All,
> >
> > There has been some talk about how the GUIDs in the GHCB and SVSM
> > specifications should be encoded [1]. The term GUID brings encoding
> > ambiguity with it.
> >
> > - RFC 4122 specifies the format of a GUID/UUID and the encodingas
> > network byte order.
> >
> > - The UEFI specification says that their GUID format is that of RFC
> > 4122, but that the encoding is different. UEFI has time_low, time_mid,
> > and time_hi_and_version as little-endian encoded.
> >
> > Given this, the GHCB and SVSM specifications need to be updated to
> > specify the expected encoding of the GUIDs.
> >
> > The GHCB specification will add that the certificate GUIDs follow RFC
> > 4122 in format and encoding (network byte order). This is based on
> > existing users and tools that have already (likely) been using network
> > byte order.
> >
> > The SVSM specification, however, because support has already been added
> > to the Linux kernel using guid library APIs, will follow RFC 4122 in
> > format with an encoding of time_low, time_mid, and time_hi_and_version
> > as little-endian. In Linux, the guid library APIs are guid_parse(),
> > guid_gen(), etc.
> >
> > If there are no objections, I'll make those changes.
>
> What we know is that the service GUID is in little endian order, but
> what we don't know is if the GUID table of the attest all services
> protocol should be the same as is provided in GHCB (big endian).
> I haven't heard back on the other thread about a more general
> principle that maybe we should follow little-endian in and big-endian
> out at least for GUIDs, since reports still use little endian numbers.
> I'm writing up the implementation of the GUID table serializer right
> now, and it'd be nice to know it can have the same test vectors as the
> GUID table marshaling/unmarshaling code I have in go-sev-guest.
>

I suppose nevermind since the headers are slightly different, the
parsers are incompatible. I'll use little endian.

> >
> > Thanks,
> > Tom
> >
> > [1] https://github.com/coconut-svsm/svsm/pull/541#discussion_r196320100=
9
> >
>
>
> --
> -Dionna Glaze, PhD, CISSP, CCSP (she/her)



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
