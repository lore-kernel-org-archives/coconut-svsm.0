Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8818039E191
	for <coconut-svsm@lists.linux.dev>; Wed, 17 Jun 2026 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703475; cv=none; b=mbHlfML0y7nVj3rOVSYXABePiw/CDYz13BWOA2MADJjamgN+fwK0i6XdkANdaE+rF0fH+j1jezLKYv14DfKRDboJlLVvcmhUh9e1C1OLAJsdWVNvvEdkmde/7WaP150eoFqQt9bqDom8bt3lkdGgbGjbtA0O5t/v3X+KqJ8Qp3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703475; c=relaxed/simple;
	bh=7jvheL/qAmaTTHS5xK+l/tVp5Gsh72Hu0Hh7hsIjBG4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XgvLY1oYTvAUqRHMsoYCtO+JZaUEFQnIBElHTzvjKcXuL+73PgsjUsU6rEWgkwMOVPK01JSXmkkllt20ArQK9UAl7oZbxaR+YXIoYNBsPIq6uOQ14aJoEawjono+Y5K9OJcLGdDB9/iidzn2ZCk3trS8VCcuWKecAp2m9/npEPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cQdFMVKb; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cQdFMVKb"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c85edbb10dfso661502a12.0
        for <coconut-svsm@lists.linux.dev>; Wed, 17 Jun 2026 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781703474; x=1782308274; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xafrOaxeWuRZe0/2sgztMbGOHrwrXJkZEqKtZ2nD9W4=;
        b=cQdFMVKbmHC+2mk4K96+hh8mJKykDWPSpXI80VVotbR+Wh6BKkgW7v8QdKPQNHy9YJ
         Ve7BbC9hJevHeNeIeL7aRYk0agpn1Ib72YTdUY+DzkLtS1r7qr5Gdil5d6ay/H9aobg8
         /X+DmtrH4n9TQ7utjbgmR2ipViT7BCpGR2iyjqKi4rjSQilx96xLcSppsS4YmidlCI4Q
         quuJpwlGHdrJ+JW+kIcV7j6WwV3D/3n4GwhBkUkjmJOdz2+RqY6xKIZdfRwmbJ/2pqOv
         zSydzeHC0kE40ChDOflR0NzWbkHQaHXD9fEVMP6cqJjDhBs78A35sC9luZqIyFv9E/vi
         +gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781703474; x=1782308274;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xafrOaxeWuRZe0/2sgztMbGOHrwrXJkZEqKtZ2nD9W4=;
        b=KF45zeplmv6/c4gCscYf6FivbeNqcTU0kvl25X2PypJ/XhjGxi7WcjRhrFrDXYvMvX
         iqy2rY0vgoR0H3RNKQ5T45ckOkH+1z4EyuXuYSL/HiHLpw37JEIMLw4XvLhWYaHTpqqu
         Zg4aFPxzTxxb25FNZdi21ehOJaM6XembxHi5313SEuOiub+xX57vY40y4vd36xZcZ8pC
         MEDEr/gOjsOGeYoCXfezsqDnZkc3KwD1hi+NhZ5Qta+tSolryhlXbu4cJBlDVcf6qzXt
         ncV703SlcBVDXbpMVG3u8rYxco0sAnC59NNBGDR75WaCfy9HJNZjJ314BtpcJaoROEy+
         aBOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sKaemG3H7uOORhVLmwtjrodp9pQjPg35SzUD9sk+XaPc/Ctl53gmY6PnimKyHVhURpEJ3Ldadpx2IgW4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ2hnR2VmOS7Mksm55yuHhLgTzQE595+1QsCDrRPDjrtjzFX4A
	9KC+gbrEDpT7VT45Gg+KP836HwLitxN4K/3GNR78JpL30b6W0i30hEDGentZhoTQsLrzY97k+AN
	cz+gSow==
X-Received: from pgbcr2.prod.google.com ([2002:a05:6a02:4102:b0:c86:93b:4965])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4307:b0:3b4:731e:6fad
 with SMTP id adf61e73a8af0-3b8db0d66bbmr3049921637.16.1781703473551; Wed, 17
 Jun 2026 06:37:53 -0700 (PDT)
Date: Wed, 17 Jun 2026 06:37:52 -0700
In-Reply-To: <ajKe-oboTRowcO_i@8bytes.org>
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
Message-ID: <ajKjMIBb21qB46fh@google.com>
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
> On Wed, Jun 17, 2026 at 06:00:39AM -0700, Sean Christopherson wrote:
> > On Wed, Jun 17, 2026, J=C3=B6rg R=C3=B6del wrote:
> > > (which has happened a couple of times already).
> >=20
> > Examples?  The SEV features thing jumps to mind, but I don't recall any=
 others
> > off the top of my head.
>=20
> I was referring to KVM-induced changes to SEV features, but thought this
> happened more than once?

Ok, so it took us a few times to learn our lesson.  I still don't see that =
as a
strong argument for new uAPI, especially not for VMSA pages.  I am very fir=
mly
of the opinion that letting anything but the host kernel configure the VMSA=
 is
beyond stupid, but unfortunately we're stuck with AP_CREATION.  Expanding t=
hat
surface has a very, very, VERY high bar to get over.
