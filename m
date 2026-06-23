Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7881B3939B0
	for <coconut-svsm@lists.linux.dev>; Tue, 23 Jun 2026 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246234; cv=none; b=lxl7QAxV8/LTqnAtDXN/e+2Ea+hJTlPV5NfZ6k1Ih534IjeDqL1RGGeBc62Yd1Bh5HmFgvmiCnbfo5Jw79jjJvQtTHZix/Q5+tDqtiMKj4ehBzuh5DZBmICs7FqGKJwWMNgdhEHNNAaKnnZBZyf+afXbleGcLaev1Rry/gQas58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246234; c=relaxed/simple;
	bh=TMf7sYrM4BRP7pHSA+LbyCfawDFBWQK7WASMofFKCEA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p3iEn5Cf6zCcopizLQ4F9YpCQl5yUehCoN8tJb/zSYHMo0bMnqmU/QEoAAsrLynEz0HU1zw1AwYsU1sDUcMP/5qjJoTwk0Jr9Lz378pgothOaUJJ1s1RrkvwoMioYrFe6hbxMdfvh/cjEuVkWXS55mv0pPN+w/7zWXsRqi9HyIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uHNvopDI; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uHNvopDI"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c0bf6904a6so3179235ad.1
        for <coconut-svsm@lists.linux.dev>; Tue, 23 Jun 2026 13:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782246233; x=1782851033; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhCsk6gm09167ahnXNRd5Tc3HOZ2IFvvG/9MQPlCJ3s=;
        b=uHNvopDIwdzWuHYoynPU8yI5z60SybWUiQhl76p4eb8OOhi/d/f7q2axDXZvhuKivf
         fLQEwb8arYMnneEFDNGweQ0BUSSuNDFcOxDVEIDPylmoGnfKT2wXhUYdLKRLnw0DrPwd
         lvisrMoP+6ODSNjx4UFAKPJhlzEe3LwSfNBT7yQfqkA6sIn3wqa5NY+gBRiYi8yH3CcT
         ifbXXfya1DCnLXrQJ3CIs6LYLKp/aLvjUZxE0hWXZxtazG9LKDW691x+preeia6EHMWZ
         OVRuJo2gLyy9Xm7FrVIohfCCpcSmm31AMv2JR0GUPXxaPHOq+o/m1iPmy+zptGtwgYqL
         EsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246233; x=1782851033;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PhCsk6gm09167ahnXNRd5Tc3HOZ2IFvvG/9MQPlCJ3s=;
        b=rMn8kJfve0O1kNJjWMCWoV6op30gPVJ8BeHM/JZoRpn/HYhy34yOw2KO39JpJ40qp5
         +ohT4iEnaBIm+JxG223CorsaWNbc/EUl4HxB0vLjn3O0nkPpL/roD0PYlYet1/geCDr7
         38jcKzlz9FaPgANIXyv1uzXt2onWgwOP/YRIKIRIoW11NayICiMIf5UfxC797RMqg5kk
         6Wjq7J23unejlkRz/AjnIeXY1b78x0+V8FkNsXLSNhja0iWSWHA6qdqxlfY0SSpGcWlV
         dbJ5baQDxUq9m+zq667ztyqTXoHxYQQylWYh8YfzM5+csY3Q1NgSuthoicOJ4KTlIZqN
         uioA==
X-Forwarded-Encrypted: i=1; AHgh+RpyDTHssMwkRzaK8ffH9b/44Hdposy8+yx6bGV8iXlf28QLDxKk8oystqMSS/zKVs4kzFry1ekhJzHbhYw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKenVvECD6yX0tiY95VQxwqm82683r8rXiMHXvAdikioLVzTYs
	+y0SvF19UAZ3TSzmmSZdcKsKX0dOBEpHnAXs4Ji0Wr4c6o6DKQ4SFdWhAoufOuOfMA1vztiqH8o
	TJs6pQQ==
X-Received: from plbml3.prod.google.com ([2002:a17:903:34c3:b0:2c6:bebe:2819])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db03:b0:2c6:a185:be8b
 with SMTP id d9443c01a7336-2c7e1430108mr4430985ad.10.1782246232414; Tue, 23
 Jun 2026 13:23:52 -0700 (PDT)
Date: Tue, 23 Jun 2026 13:23:51 -0700
In-Reply-To: <LV0PR21MB6859D1AEF99FB84228C23620CAEE2@LV0PR21MB6859.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <aiqtWVMqTK6vDoZ8@google.com> <aiqwjn2DVOumfr3T@8bytes.org>
 <ajGOELiYwKByXbVP@google.com> <ajJAYZAPxNrrsiYp@8bytes.org>
 <ajKadxZEMI253AoT@google.com> <ajKe-oboTRowcO_i@8bytes.org>
 <ajKjMIBb21qB46fh@google.com> <ajKnKeo1FV3zbjEt@8bytes.org>
 <ajqMvQLMGONiLn1S@google.com> <LV0PR21MB6859D1AEF99FB84228C23620CAEE2@LV0PR21MB6859.namprd21.prod.outlook.com>
Message-ID: <ajrrV4SHHkS6thjQ@google.com>
Subject: Re: [EXTERNAL] Re: [PATCH 4/4] kvm: svm: Support KVM_SEV_SNP_PAGE_TYPE_VMSA
 at SNP_LAUNCH_UPDATE
From: Sean Christopherson <seanjc@google.com>
To: Jon Lange <jlange@microsoft.com>
Cc: "=?utf-8?B?SsO2cmcgUsO2ZGVs?=" <joro@8bytes.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	"x86@kernel.org" <x86@kernel.org>, "thomas.lendacky" <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>, Joerg Roedel <joerg.roedel@amd.com>, 
	Jethro Beekman <jethro@fortanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026, Jon Lange wrote:
> On Tuesday, June 23, 2026 6:40 AM, Sean Christopherson wrote:
> > On Wed, Jun 17, 2026, J=C3=B6rg R=C3=B6del wrote:
> > > On Wed, Jun 17, 2026 at 06:37:52AM -0700, Sean Christopherson wrote:
> > > > Ok, so it took us a few times to learn our lesson.  I still don't s=
ee that as a
> > > > strong argument for new uAPI, especially not for VMSA pages.  I am =
very firmly
> > > > of the opinion that letting anything but the host kernel configure =
the VMSA is
> > > > beyond stupid, but unfortunately we're stuck with AP_CREATION.  Exp=
anding that
> > > > surface has a very, very, VERY high bar to get over.
> > >=20
> > > The strongest argument in my view (and the main reason we are doing t=
his) is
> > > actually the predictable launch measurement. On SEV-SNP this is a req=
uirement
> > > to use platform VM-identity features like the ID Block.
> >
> > And I'm saying that unless KVM *can't* provide a predictable launch mea=
surement,
> > which AIUI isn't the case, then the launch measurement *must* be stable=
 across
> > kernels because it's part of KVM's ABI.  So as I see it, the issue isn'=
t that
> > KVM is inherently unpredictable, it's that we lack tests to validate a =
thorny,
> > subtle piece of KVM's ABI.
>=20
> Joerg is suggesting that we need a launch measurement that is stable not =
just
> across multiple launches on the same system, but across multiple hypervis=
ors.

*sigh*

So that, and also the multi-VMPL implications, absolutely need to be decrib=
ed in
about this level of detail in the cover letter, and the changelog needs abo=
ut the
same level of documentation to justify the various design decisions.

Bluntly, all of the changelogs in this series are awful.  +200 lines of cod=
e in
arguably the nastiest bit of "architecture" KVM has to deal with, and the l=
ongest
changelog barely hits 6 lines.

And whatever uAPI we end up with needs tests, and a lot of them, including =
coverage
for negative testcases.  Because I'm working on fixing the third? guest-exp=
loitable
DoS that's unique to SNP this year, and I've reached my breaking point: I'm=
 not
taking new functionality like this without sufficient test coverage.

Rant(s) aside, thanks for the information, it's super helpful!
