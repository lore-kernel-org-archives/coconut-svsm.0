Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A6DDD46D62
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Mar 2025 16:57:21 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so2717066b.0
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Mar 2025 08:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1743004641; x=1743609441; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDVXmwUat4AEIfamPC2v0yQbrIp4WxkLamv4SdiBGgw=;
 b=jWIlS0fjxp0Yb/mhuV1zIueeITZOsxdjg1TMxkAxxumy4Y7JbfspiZJBXbNt4OaOQp
 eONEp6VHy7G4Pkr/Nqb4JRiomswuGE5zWpndBtfU4a4QBSaTT9LkPaFgze/6vrMDXndX
 KQS9/bW9cM3H5VfEFm51FyzFrf7/1nLzJJGV/2f3Pm/6USBCpulCg3YWhUc9rJwZybqV
 0dDk7goKJV06JSYbFGAXrGpz1FwmWSaCXsuthQW9yhyzKcJVG+Nw/bnXTc2+NbAX21UX
 iLyksSZT/aipd0bWogyLXkIkDkQEjwqplzMPivFj8nYWY2jkI48tcLIF9bEZAYzUA86+
 8jsQ==
MIME-Version: 1.0
References: <Z-LgVcs66nVpAd7x@8bytes.org> <Z-QYQTBuOjJtkiWX@8bytes.org>
In-Reply-To: <Z-QYQTBuOjJtkiWX@8bytes.org>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 26 Mar 2025 08:57:04 -0700
Message-ID: <CAAH4kHYTD=PcCg6Yk9L03R3r=cmwOs7hXvSGKBHPt=+0SYYvOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] SVSM Development Call March 26th,
 2025 (Changed meeting time for US)
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

On Wed, Mar 26, 2025 at 8:07=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> Hey again,
>
> On Tue, Mar 25, 2025 at 05:56:53PM +0100, J=C3=B6rg R=C3=B6del wrote:
> > Here is the usual call for agenda items for the this weeks SVSM
> > development call.  Please send me any agenda items you have in mind or
> > raise them in the meeting.
>
> Just a notice that I want to bring the status of some of the PRs to the
> agenda today, namely:
>
>         - #259 SVSM: require SNP restricted injection
>           (Can we require restricted injection on SNP?)
>         - #528 Attestation driver and proxy (with KBS attestation)
>           (How to solve the stack usage problem?)
>         - #541 svsm: add SVSM VTPM Service Attestation
>           (Any dependencies regarding the ongoing attestation report
>            format changes?)

I won't be at the entire meeting, so
https://github.com/deeglaze/svsm/tree/attestsrv has my current
reworking of Geoffrey's PR.
Generally I'm not confident about how either of us are reading and
writing guest memory. We need something like Rust-for-linux's
uaccess::UserSlice.

>         - #635 virtio-blk storage via mmio using virtio-drivers [v3]
>           (Any blockers, maybe generic MMIO routine support?)
>
> See you in the meeting :)
>
> Regards,
>
>         Joerg
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
