Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DE73264D5
	for <coconut-svsm@lists.linux.dev>; Wed, 17 Jun 2026 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701242; cv=none; b=gBsj9XDv5EbDJqPb/7r4e2JBZa8BTMW0cBRncgc6tTptsNKM7KcUsd/BvtXTmSDrKxp07p1DhNtLGDgSOQx55zfpJQu9WB91pLt4TJzeILLEU4QQsDzruVuOjgkBzVCMJmwLIfY48ypi2EpQqyW6CJppCS9T2+LLkKqSyt8WbLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701242; c=relaxed/simple;
	bh=v9AW9ttnyqMH8SLe1cvzY21GDBcPgzmm6bezz+XRKfg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jCpsA1zaKg5B3eRYyV1CCjWskS85w4dtG5GTxC3+eK1fMtGSl9VHPkFBhNuInuXkGMyGM1ED3hPNNZy+jdhdoq6JgjME4xrVllY0k0BKIKw7XCguFQ8hpFMLlX9WlCqow5zluxiwr4LtC4EONbC4vracypW0Ey0fHszXURULZds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mWC7CQrR; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mWC7CQrR"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8428419982eso5176442b3a.3
        for <coconut-svsm@lists.linux.dev>; Wed, 17 Jun 2026 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781701240; x=1782306040; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ot+PTpIfkC3BFgu+DoGlv5FhONUNAHAv7ldmmbQzbTA=;
        b=mWC7CQrRawfu7EolhHja8UiW1yCZtV6EDBkd/nspPDa2QACwLVuJBJaIO4fb3O6wl+
         EDPzmznQxAtJCoVjzyurzM5OhhlJdJ7zjE7zOqTjctF+trct8u7G4O4v588xpF4lCY1r
         21ZnIMj6r0Jg+VOoFsLqc+06vbyhrb1/RHvQHkyx7e/ENcDQ6f+eP56jf+M4/QnXePxv
         OMErDx1azq95HLyCnC7NnqpO3GbOoUTojgt/H8+YtDN6TqGNykqt+9tr7/saSXiv3MpO
         wEkddziLOdHT1YiHrCRfqQMIlWylTUmEN+A6ZZgvkXUQvH2+xTxEdu/7JLt5jgHOh/4F
         N2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701240; x=1782306040;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ot+PTpIfkC3BFgu+DoGlv5FhONUNAHAv7ldmmbQzbTA=;
        b=IL9LHH50DDPy4F9mjhqw10gOt8dk5xDKjSuOPRRehWbtEZTGYPDz9yOMsUP8mQT5Gi
         4LVBF66njZgWL3iLAD9EOe4wzyl8H67takIjoY3Bk/wUKM75oxIpdbR42r2J7oNfHlDA
         VOsgK5DPVk7oYNUveTRcGL4xgp+Qj5ajdp9aLAFekOH2x22TaZusxMxQKKorQx8wa2oR
         vcfFajsiuolAbhgyD2jiBO/yu9f3UNJnCs5CFi2mQrOHa3DNL9p7KUedufsu1TAE308X
         sZ66/5CNdyPOZprDS6XRkkw7dcnihwi2WbpDcYhzi3PCQkkBmBesnXiMyLQd1nYtLwzF
         +C3g==
X-Forwarded-Encrypted: i=1; AFNElJ8fGGfW7nR6GN+IDdHHOn2Zd46e/aq4RQyNJtn7WD+frqREvCkyRppNjWgDZ7n3mkNfzAHvbMTli+q5ptA=@lists.linux.dev
X-Gm-Message-State: AOJu0YycEikNeumcIDWPAZP3kQMXUVnutVHmCcA/Nz+DIlWyG+rxs2E9
	URzr4E9Y8mLwZhIaNSgOeMWjYT9D324TCN0dmdjxIzkbFAWPWWH8++Kv3uUz3VdrExwJi57J2ES
	HgqILfA==
X-Received: from pfbmy11-n1.prod.google.com ([2002:a05:6a00:6d4b:10b0:842:4be5:5ed6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1ca7:b0:83e:b443:965e
 with SMTP id d2e1a72fcca58-8452442926amr3817503b3a.3.1781701240120; Wed, 17
 Jun 2026 06:00:40 -0700 (PDT)
Date: Wed, 17 Jun 2026 06:00:39 -0700
In-Reply-To: <ajJAYZAPxNrrsiYp@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260611123528.572255-1-joro@8bytes.org> <20260611123528.572255-5-joro@8bytes.org>
 <aiqtWVMqTK6vDoZ8@google.com> <aiqwjn2DVOumfr3T@8bytes.org>
 <ajGOELiYwKByXbVP@google.com> <ajJAYZAPxNrrsiYp@8bytes.org>
Message-ID: <ajKadxZEMI253AoT@google.com>
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
> On Tue, Jun 16, 2026 at 10:55:28AM -0700, Sean Christopherson wrote:
> > Isn't this essentially the same thing as hot-plugging vCPUs after launc=
h?  I
> > have yet to review it in depth (sorry Jethro), but it looks a *lot* sim=
pler.
>=20
> Replacing the VMSA after launch (as supported with the AP_CREATE GHCB cal=
l) is
> different because this has no influence on the launch measurement.
>=20
> The point of providing an initial VMSA is to get a predictable launch
> measurement which is independent of the number of VCPUs the guest has.
>=20
> With the current code KVM will create its own VMSA for each created VCPU =
and
> measure it into the guests initial image. This makes predicting the initi=
al
> launch measurement difficult (as it depends on KVM internals) and fragile=
 because
> KVM-internal changes always carry a risk to change the launch measurement

The same holds true for userspace.

> (which has happened a couple of times already).

Examples?  The SEV features thing jumps to mind, but I don't recall any oth=
ers
off the top of my head.
