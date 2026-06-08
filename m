Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56E3352034
	for <coconut-svsm@lists.linux.dev>; Mon,  8 Jun 2026 17:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941559; cv=none; b=KVRI0FF/uSKgy7bYyoGROka+b+yp8i0rb0sRRC/IvZCpZe1owacn5BqRZoTO4UsGVd1M/CEnUtVsODzMJxV/kCiFhXQYZpCaElfGArT99lZdKsUaUJXRzpnchNRhFyM9zPfb6omYjOpeR7LViokJWF4HX6MWptmGMqeBSnguMXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941559; c=relaxed/simple;
	bh=Yh2vF4TIAGag+raZttED/lbT/nnkLgvDu0weKA8pAqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpDdfEjko6qOzL06t3hQfsxLzsno/aTiRoNMMPanLDK1B/8Aq7Bygato4hHXfomAqIf8mwTcpEeQwnnCPQk1/dgUPUiMe16ZfxKph96/INsj+U6Qg8RQtwnv5/8h8e55yu0K4pIB6nhdka6IDC+tSUUxZLZ2y2G3TfpFtFPAfCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iuRaIeDC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iuRaIeDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780941557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8d2xpklGhwQZIXzXL6uTt/rbyfEnaEp9dTHG5HoHQ0=;
	b=iuRaIeDCE6C2vg4OsQ/bxn0KOdr2IzkYEe4lTXR3vnMaxqefdNwRc53O/JR2JXj2Quj8Cw
	9E8lWcKT3oh2fgrMjvCGD5XJMAhu204ruIUM4fiOPjnOFyY6G9ui2j1ewzpwGWmv4jnLU6
	1k8zC92Nkdo5DgJvJDn0RDjQtiWk6DI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-dklIBrszMI29rBIo5fbtcA-1; Mon, 08 Jun 2026 13:59:16 -0400
X-MC-Unique: dklIBrszMI29rBIo5fbtcA-1
X-Mimecast-MFC-AGG-ID: dklIBrszMI29rBIo5fbtcA_1780941555
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490b93debc8so36682565e9.1
        for <coconut-svsm@lists.linux.dev>; Mon, 08 Jun 2026 10:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941555; x=1781546355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8d2xpklGhwQZIXzXL6uTt/rbyfEnaEp9dTHG5HoHQ0=;
        b=cBe/NBZWkjdGwaPxYDmkXmMFpm56/JvZ+skDf4xwOoHlpPdVhvJd0vSuXsJu2tf05D
         K1JzLThOWmxZOrcFKIL+nquJH1iOJ1mt212PmyzOlEru0XAJfWFBkHj8diHsQOJsmtgs
         3GMUU5xfI60K23fIm91wVxaQMHnVTbNDherR+XMoNwZce/K8CcYJypO8tgKPERWoP1uF
         nmErskAUpds12BYWGTRSOh0bLHxWFpnP9DlTqD48aQotYANReqXvmUFjvFlqZ4Ohr9eF
         K84iDwBY/PByZd4P/ZF9QyblPlD26FLGFLw1lnCJKv06U3p+i/cP6PaNyB1Emtg+8x54
         54TA==
X-Forwarded-Encrypted: i=1; AFNElJ+8asoFAQAEsCUk3zwZFjErC3J7t16l7vfUkOh9KFDQqmoO0N4W0wIr4CWxo2dK9/Tg+P43VBa/UvaKAAg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+c9tK+XlvSS7p8kwz4ZReLWRE1CshhhPJPiZWxuuNRXsHZNgH
	/wW+eyy+6R74L/laXYJeVbjalZtXLe0RWnG50srkc8AaoW1slSaOBIR0tPTd+QU1OOcs1CrLBMO
	d3cTiit6dLz9dquxPuJc0eea25DJ7O/eaJZNWDS489Sz6vUITAtrYHfUFikLaFx2pPiILQpNnNN
	aodKQgwazNe3Oxrt6BIdYrMMMNz5VH7k27zYGDHHKk
X-Gm-Gg: Acq92OGp7dIrP2JpAu/+peIU+KWPn7vvPBdpxm3i8mB9zT3kdlL89rwC/BXWaoJMUui
	eL5tlw7WZ4m6T5fCkbHrFYhpD/wLaBU0eSFAJVUXgH7KyBNryHZS7QEmhVyGZJuhykJ36D1fviz
	NfQolg2HqkQqIsHYy5S9RyDWEtsiq7tSHqAqh7ow88SzMfDWm5MgcCkEqyC+b5UghVVRLBMTDn1
	1dLxWF+c5nJ12WOE7r6oZhp0+yodg6K9Ob4nDz/rnYRrBl67uZnzWuNyRac4Ag8grb5KbwBr8Hc
	WQ6KCaVaSTJPRZQG
X-Received: by 2002:a05:600c:1908:b0:490:b5d0:598f with SMTP id 5b1f17b1804b1-490c25b5f6cmr285228225e9.13.1780941555098;
        Mon, 08 Jun 2026 10:59:15 -0700 (PDT)
X-Received: by 2002:a05:600c:1908:b0:490:b5d0:598f with SMTP id
 5b1f17b1804b1-490c25b5f6cmr285227865e9.13.1780941554714; Mon, 08 Jun 2026
 10:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608144252.351443-1-joro@8bytes.org> <20260608144252.351443-36-joro@8bytes.org>
 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com> <aib8n5lO6HKbLC4Y@8bytes.org>
In-Reply-To: <aib8n5lO6HKbLC4Y@8bytes.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 8 Jun 2026 19:58:43 +0200
X-Gm-Features: AVVi8CcaSI98hh9wFoB_n6cKHV5EHNPF6kPS5m5gs3YdhiTjEhtRfK4vGBfAwzg
Message-ID: <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Sean Christopherson <seanjc@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com, 
	michael.roth@amd.com, nsaenz@amazon.com, anelkz@amazon.de, 
	James.Bottomley@hansenpartnership.com, Melody Wang <huibo.wang@amd.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, x86@kernel.org, 
	coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r1OP8M8392AlhBXU_ructoNPxJZ7DizTx1h9uhn8E10_1780941555
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 7:52=E2=80=AFPM J=C3=B6rg R=C3=B6del <joro@8bytes.or=
g> wrote:
> On Mon, Jun 08, 2026 at 06:47:54PM +0200, Paolo Bonzini wrote:
> > On 6/8/26 16:42, J=C3=B6rg R=C3=B6del wrote:
> > > The algorithm is to always run the lowest runnable plane. Plane
> > > switches are done by stopping the current plane and setting another
> > > runnable.
> >
> > This was left arbitrary in my version because for example Hyper-V VTLs =
use
> > highest-runnable instead.  It also made pure userspace scheduling possi=
ble,
> > though that may not be very important in the grand scheme of things.
>
> IIRC what Hyper-V does is always the run the highest-privileged runnable =
level,
> no?  Maybe in their numbering level 0 has the least privileges?

Yes, exactly.

> Anyway, I am happy to make changes here, also based on input from the VSM=
 side.

Related to this, let me know if you want me to pick up again the
common part, especially with Sashiko being hard at work on it.

> > Did you drop it because it didn't work, or just for simplicity?
>
> The user-space scheduling worked, my 6.17 planes implementation used it. =
But
> there are some problems with it going forward, because TDX Partitioning (=
and
> likely ARM CCA Planes as well) do not allow arbitrary switches forced by =
the
> hypervisor. All they allow is a forced switch to the highest privileged p=
lane,
> the SVSM on SNP will force the same constraints by making lower-privilege=
 VMSAs
> not-runnable when it executes.

The idea of the userspace scheduling was that you're not forced to use
it - the kernel can always choose to override it if it's using an
accelerated implementation of planes (and of plane switching). But it
also leaves some leeway to different accelerated implementations, each
of which can pick their own algorithm.

Conceptually I'd rather keep the possibility of userspace scheduling.
But maybe it doesn't add much.

Paolo

> So exposing an interface for user-space to chose which plane to run does =
seem
> to gain some weird, platform dependent semantics going forward. TDX and C=
CA
> also require in-kernel switching as they can switch planes without a VMEX=
IT, so
> I decided to have it from the start.
>
>
> -Joerg
>

