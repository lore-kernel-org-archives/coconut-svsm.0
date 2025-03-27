Return-Path: <3zF7lZwYKCmUVHDQMFJRRJOH.FRPVYVP-GHYHOFRFRQXW-VYVP.GHY@flex--seanjc.bounces.google.com>
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E0F6446B1E
 for <svsm-devel@coconut-svsm.dev>; Thu, 27 Mar 2025 15:21:02 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-3032f4eca83so1781800a91.3
 for <svsm-devel@coconut-svsm.dev>; Thu, 27 Mar 2025 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1743085261; x=1743690061; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=0E1KoF9n8W5T1UdiJVOslWaohgAmLtobQZJ+uL0v3qI=;
 b=seWe07n8A/7jKw1TgJUVKWY/y9nGYH0ju1NyTNhMgIpJdk951q/2K087xlPlFlI988
 9pOAo4r1qzCH+r8zJ2TTqJhZ19ZiQQnsctpzzTT/tc4tLgG8GpWtM+o+zqhm0SvnE3co
 slcpygugR5fMaIKa9GYxpm32RvJp4J/TlDQuJ+AYZ+ZewkOksN7rS0pfNlHw3YOm2+VN
 w+ip3xjdYU0/LAM0eTpYwyXp5L5voQgpUJGuxiix4qXNg146ec1EnFGHrQfZbpPSfudu
 qr/yQhFLsE4y95q/dhmEVWm5Th9ldCFHFQ4HzFxo1e4Mzd6WmfTs/N95KROiJoaoRhp3
 2wTg==
Date: Thu, 27 Mar 2025 07:20:58 -0700
In-Reply-To: <4732241e-b706-481b-a73a-01ef77622d8a@amd.com>
Mime-Version: 1.0
References: <4732241e-b706-481b-a73a-01ef77622d8a@amd.com>
Message-ID: <Z-Veys6h0OSx4L_e@google.com>
From: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] RESEND: SEV-SNP Alternate Injection
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Melody (Huibo) Wang" <huibo.wang@amd.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, Jon Lange <jlange@microsoft.com>, Thomas Lendacky <Thomas.Lendacky@amd.com>, David Kaplan <David.Kaplan@amd.com>, Joerg Roedel <jroedel@suse.de>

On Wed, Mar 26, 2025, Melody (Huibo) Wang wrote:
> Hi,
>=20
> I am currently enabling Alternate Injection for SEV-SNP guests and have
> encountered a design issue.
>=20
> The Alternate Injection specification which is a preliminary spec support=
s
> only the SVSM APIC protocol through a subset of X2APIC MSRs, Timer suppor=
t is
> configurable, If timer functionality is not supported, the guest must rel=
y on
> the hypervisor to emulate timer support through use of the #HV Timer GHCB
> protocol.
>=20
> When the OVMF firmware starts, it is in XAPIC mode by default and then, l=
ater
> during the init phase it switches the guest to X2APIC. However, with
> Alternate Injection enabled, the OVMF in its very first phase - SEC - doe=
s
> XAPIC accesses. The SVSM uses a so-called SVSM APIC protocol which uses a
> subset of the X2APIC MSRs.
>=20
> The OVMF, however, thinks it starts off in XAPIC memory-mapped mode. Ther=
e's
> a protocol mismatch of sorts. With Alternate Injection enabled in the SEC
> phase, it requires X2APIC. The registers (timer registers) - not handled =
by
> SVSM will get routed to KVM, which at that point is operating the guest i=
n
> XAPIC mode until the PEI phase switches to X2APIC.
>=20
> One potential solution is to have KVM enable X2APIC as soon as Alternate
> Injection is activated. While we could start X2APIC during the creation o=
f
> the vCPU, APM Volume 2, Figure 16-32 states that we must transition from
> XAPIC mode to X2APIC mode first.
>=20
> More specifically:
>=20
> =E2=80=9CIf the feature is present, the local APIC is placed into x2APIC =
mode by
> setting bit 10 in the Local APIC Base register (MSR 01Bh). Before enterin=
g
> x2APIC mode, the local APIC must first be enabled (AE=3D1, EXTD=3D0).=E2=
=80=9D
>=20
> Therefore, I am uncertain if enabling X2APIC directly during vCPU creatio=
n is
> permissible.
>=20
> Do you have any suggestions for a better solution?

Fix OVMF.  Or change the AMD architectural specs.  Don't hack KVM.

>=20
> Please feel free to ask questions if some concepts are unclear and I'll
> gladly expand on them.
>=20
> Thanks,
> Melody
