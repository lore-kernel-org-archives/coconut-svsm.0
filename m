Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1672C37C109
	for <coconut-svsm@lists.linux.dev>; Tue, 23 Jun 2026 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782222016; cv=none; b=uXQd7O7CP/447bA/hSazqc4niWGQcw8Uu0uI1zIdv7SMQDdDXKpBo6SVJEQOLuPyxphxhfGOu6EmdvKECpp7Yjj/DWAdS04qzVuB7XZAh6x1AgoiL3jKljRDyXeTiRu8WAkGt8ueeNvwXs5neFBNlsPXUG9Tq9JrpT+cXh0OIHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782222016; c=relaxed/simple;
	bh=8q5QhEQdlM3d6kQ3XX6ma4td3ssAZCufnK99f0nfE4E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uixhRvlBtUBW3hY9kFZG55VC5It3uD2sMbwEnSqY7TyDj1pbcuznFnoQ/h5NrFqAE4cJ0bshCT1oEY3tCCy1+mFkXeIHu547oUpO+IVE0BRatOlkxW4PbVa5hzmXSQQv7nTWFD92XUVtokHdRzdhQvW/+uCJCPfCFLdvETZEGks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PIW/uwtU; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PIW/uwtU"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c76be5dd09so18969625ad.3
        for <coconut-svsm@lists.linux.dev>; Tue, 23 Jun 2026 06:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782222014; x=1782826814; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAvjmMtZBSA7brQ2Om+ad+/lAiJh5nkfAfWiCHYFESo=;
        b=PIW/uwtULH1Mch1LGErgKcEVkeJSIaeHuF9iuNUdC+wtRXtnYUB14W7CuegnmXDOWb
         o9gQ+RqsyF59cg30oBvM6M6RygTnGELe0aPDrL1BtJxSlMWJz/yUvDXUXvjXUHVEo+lW
         jnu1BxL/L29lp6UVftD8oYQ4gi2rCGdAUarYNicPmPKS4Y3gRPn176Njok3WjUzUy7Kn
         AHsS0SWLeGYKQNAA0EcUstNYsfYthEF7LaB/1moiwI0SK9riBpqqr6eUlqQht7WPv0Xa
         7WmtAaK91P4jcqLCCgQfFLO7yy9ioIQDXP+GyZY5JHdzOBLDwhWOZCxtshrgpQeQr+kC
         PYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782222014; x=1782826814;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WAvjmMtZBSA7brQ2Om+ad+/lAiJh5nkfAfWiCHYFESo=;
        b=J+cUI9Q09W+d8IPk3cmzC4IwXroEREuZ8+C1uf+McsAelJJwiXqV+fBQX1IIE0nA3R
         FY+64wayh2xksH2Y4v5qATjMdwRTj5RSpC9EKZReovJ24oIxz7HVclDaq/37Qe8Y0BDn
         gsVKRh7hVD4Ld5BAgcN1A1bl7YD9CW7D5Ugxzit7VU61357Y2KQTJePaPpdaHMZ2k4sw
         v5KlGOVwvCvOLsQ8rJncAqZF/PT+mA2I7j2U1yZWe/rSARuQ3546YthTq7jH1Ht2IBUX
         ov3MSzZNJTUr8/u+yiImCBdGVASWyaxLUv4hhmFbecYZd+B9LgJaiDODpdciEblfk+uS
         +fDA==
X-Forwarded-Encrypted: i=1; AHgh+RqSxfYOrdzM2AaUksmTulbjt/fh0iLsdWlwatZ2+OM4Ir9gh9hXUTQx4qSbjtzY7Vdyg/WkyCTwd+L0Hos=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvkNZJgi9LIOFTWW1ikpaInYannaMhfferTRtCso75J7zCwOva
	xZQh9UWtquO+RskwbzRPVHrcEV4JIqbmV8BhV6cJbJsee1eqtEVumSMYPI7J2jrPGWB6kIKQxPA
	KObmjng==
X-Received: from plwp7.prod.google.com ([2002:a17:903:2487:b0:2c6:7ea2:f696])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d488:b0:2c2:50c7:58ab
 with SMTP id d9443c01a7336-2c7c9a34cbcmr23536425ad.23.1782222013976; Tue, 23
 Jun 2026 06:40:13 -0700 (PDT)
Date: Tue, 23 Jun 2026 06:40:13 -0700
In-Reply-To: <ajKnKeo1FV3zbjEt@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260611123528.572255-1-joro@8bytes.org> <20260611123528.572255-5-joro@8bytes.org>
 <aiqtWVMqTK6vDoZ8@google.com> <aiqwjn2DVOumfr3T@8bytes.org>
 <ajGOELiYwKByXbVP@google.com> <ajJAYZAPxNrrsiYp@8bytes.org>
 <ajKadxZEMI253AoT@google.com> <ajKe-oboTRowcO_i@8bytes.org>
 <ajKjMIBb21qB46fh@google.com> <ajKnKeo1FV3zbjEt@8bytes.org>
Message-ID: <ajqMvQLMGONiLn1S@google.com>
Subject: Re: [PATCH 4/4] kvm: svm: Support KVM_SEV_SNP_PAGE_TYPE_VMSA at SNP_LAUNCH_UPDATE
From: Sean Christopherson <seanjc@google.com>
To: "=?utf-8?B?SsO2cmcgUsO2ZGVs?=" <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, x86@kernel.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, coconut-svsm@lists.linux.dev, 
	Joerg Roedel <joerg.roedel@amd.com>, Jethro Beekman <jethro@fortanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026, J=C3=B6rg R=C3=B6del wrote:
> On Wed, Jun 17, 2026 at 06:37:52AM -0700, Sean Christopherson wrote:
> > Ok, so it took us a few times to learn our lesson.  I still don't see t=
hat as a
> > strong argument for new uAPI, especially not for VMSA pages.  I am very=
 firmly
> > of the opinion that letting anything but the host kernel configure the =
VMSA is
> > beyond stupid, but unfortunately we're stuck with AP_CREATION.  Expandi=
ng that
> > surface has a very, very, VERY high bar to get over.
>=20
> The strongest argument in my view (and the main reason we are doing this)=
 is
> actually the predictable launch measurement. On SEV-SNP this is a require=
ment
> to use platform VM-identity features like the ID Block.

And I'm saying that unless KVM *can't* provide a predictable launch measure=
ment,
which AIUI isn't the case, then the launch measurement *must* be stable acr=
oss
kernels because it's part of KVM's ABI.  So as I see it, the issue isn't th=
at
KVM is inherently unpredictable, it's that we lack tests to validate a thor=
ny,
subtle piece of KVM's ABI.

In other words, I want tests, not more complexity in KVM.
