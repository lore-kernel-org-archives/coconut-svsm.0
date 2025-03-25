Return-Path: <dionnaglaze@google.com>
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id B860340B22
 for <svsm-devel@coconut-svsm.dev>; Tue, 25 Mar 2025 19:51:11 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e5deb6482cso240044a12.1
 for <svsm-devel@coconut-svsm.dev>; Tue, 25 Mar 2025 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1742928671; x=1743533471; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RW9FEkNvOGypF+at2s9ctuj3s+TWHqjoYBpJnWAqH6g=;
 b=BMP+9ozItfYpzjHcRIGB/x2gDAGDhcXutgngJ3h3MdLja43tVRC/29s/AHP4341VEs
 gkkCExd1PrRrMshH8gkAnSSQRh5AuNVP5r+p0uJyN94Hpaz5OstrF7o2sZr71giybglk
 nPlP/sk5Wd24cZWijWNo6AtfSDIqogKj+ehyCwl64dbPEE2tGXWCq4ailRs0/WHkVV1a
 eb8c3TfQ1Cuf/5Hy9lvdF8Vx8UJt8FsRCGKC/XQTNApokznBYhSMFr/o432wEyMUMBJ3
 uHGxGJ4SevAsS8fxFINjHkPpxrH41DUFT6ew5Y1BPfRyZfk48+Tfpp0NKwMP+LSKqO2v
 sU1Q==
MIME-Version: 1.0
References: <cf792be2-56f8-653e-237d-a98787976b1d@amd.com>
In-Reply-To: <cf792be2-56f8-653e-237d-a98787976b1d@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 25 Mar 2025 11:50:59 -0700
Message-ID: <CAAH4kHa_oas28jq4ExptkiMMzxk79G3fFxsg0X8KYvgCqC_u9w@mail.gmail.com>
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

On Wed, Feb 26, 2025 at 2:40=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
>
> All,
>
> There has been some talk about how the GUIDs in the GHCB and SVSM
> specifications should be encoded [1]. The term GUID brings encoding
> ambiguity with it.
>
> - RFC 4122 specifies the format of a GUID/UUID and the encodingas
> network byte order.
>
> - The UEFI specification says that their GUID format is that of RFC
> 4122, but that the encoding is different. UEFI has time_low, time_mid,
> and time_hi_and_version as little-endian encoded.
>
> Given this, the GHCB and SVSM specifications need to be updated to
> specify the expected encoding of the GUIDs.
>
> The GHCB specification will add that the certificate GUIDs follow RFC
> 4122 in format and encoding (network byte order). This is based on
> existing users and tools that have already (likely) been using network
> byte order.
>
> The SVSM specification, however, because support has already been added
> to the Linux kernel using guid library APIs, will follow RFC 4122 in
> format with an encoding of time_low, time_mid, and time_hi_and_version
> as little-endian. In Linux, the guid library APIs are guid_parse(),
> guid_gen(), etc.
>
> If there are no objections, I'll make those changes.

What we know is that the service GUID is in little endian order, but
what we don't know is if the GUID table of the attest all services
protocol should be the same as is provided in GHCB (big endian).
I haven't heard back on the other thread about a more general
principle that maybe we should follow little-endian in and big-endian
out at least for GUIDs, since reports still use little endian numbers.
I'm writing up the implementation of the GUID table serializer right
now, and it'd be nice to know it can have the same test vectors as the
GUID table marshaling/unmarshaling code I have in go-sev-guest.

>
> Thanks,
> Tom
>
> [1] https://github.com/coconut-svsm/svsm/pull/541#discussion_r1963201009
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
