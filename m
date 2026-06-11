Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60992F28FC
	for <coconut-svsm@lists.linux.dev>; Thu, 11 Jun 2026 12:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181789; cv=none; b=AesxHY9nQmdOjza3nCP6yjdelqs4xJfOXPWUMWaILli1wAVfgVvAa4L/V5fm8YWUorXiOek7VPbq+ddnXceQn6O9H0z8pJDaTbMxWfikd9gsgRtSMDaZvw16E5ZYTskuDNBEX86KqbZfS1cgHIcJlJ9WeyFxsKLc0KVE5Bjzjdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181789; c=relaxed/simple;
	bh=6r2wSiS1OrKZjLIZIsNzlzfyS+o5DTffK/BlyxWwF30=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QMWAsjr0wdb7LSwqxiGDZmz0kuXgs/tyaUfWtB2mJ5Xk7gAYPUpxcdDXQHkn0tZxKVos2B/ol9Rq5QUYtEJ0Z5JoR2hyAOybIyIxElMTk+sLyq7LbUyLVbAFVqVrwvCFSKfh86eH5v5S8h7/cGmUCs3P+1Yc80FnhTw/kHeiMno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OiKkJkD6; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OiKkJkD6"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36d98b74447so6239512a91.2
        for <coconut-svsm@lists.linux.dev>; Thu, 11 Jun 2026 05:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781181787; x=1781786587; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqAjTQM6QI1dGE0+M3wPWibIsSJpIcu2J8JnWgkuZ3E=;
        b=OiKkJkD66NypPwxOIUv6v7FDF/bgLx4WGbmqKBFQwZaGv2koCbrfe5rmvIJwrzp8gx
         1/CMwk5yuVMITM8UfCrEHLuvbUEMfW1jPvvGUNHH0mzkSme8M2sO1VXBv8BaFh/vhVnF
         1tPn2/3BiF5iK+2+XRqDhhqKrhidcwu7DAdrl/jJimuXFEb01X9uO41me/PB++IgQgPg
         vsuO0O0E+VNihIS7SMBUe1ZpwAMCb5EzvqSV/5I17huHS23vpt2t5TRiZahVrHBqB2VZ
         YRQUH6cwWxEaMdag+sGTUmnREFhMX8m2lF6Pf/avFcf9+2kYso8NJYBkc78J9eN4SyHW
         VuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781181787; x=1781786587;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NqAjTQM6QI1dGE0+M3wPWibIsSJpIcu2J8JnWgkuZ3E=;
        b=DLHq62UitScm9r3hs8hUbEhWj+oNGJeJgKoAzMASU5p2tHVdmGTfCHc1YIIz3cmC7W
         FxnGwq6NJu0vqrLBjlhPpFuJb72mjixIPYKb/ZVps2XgWnTXRi/GdQ5IWIlHvXlcVT2W
         8yntsVHuo/TyXsO5uM4ri9YR6XdaxCVsYCkAmSpQ/Evn3V3Q+takdTI+8xrUO/iA8mxm
         4xsqlWl7jaPIOdWDWJJrkX12SgfT3jN4B59auGvjtVjavVKOGNSqsUmLwwqUCLab21Rz
         1R9o4EL9mLNAizfLYCFOcrzjcRs3eKX12M2PhpEdknssdqONkHiA1wjDfPExq8XOYxjI
         /AxA==
X-Forwarded-Encrypted: i=1; AFNElJ/ArkeJKJzlDAsVRsMWN/AnA8Uz1jp9BJGZCIwdwYwLzejGbDLr2h2MO/WP5w20rX09dcOO8yj8twC0Hf4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbP2SOG5fPuuFpK4SejD9VRTPIO/j9T3Z09B/xLvN0sA1PfqpB
	wf3tVl4W8terBhvCUXIvj3aaGTeozkAY9sjX34P9MBN4xCtSRPZpG4CnVBXXFpQk/i2JNPx5DG1
	SCseNsQ==
X-Received: from pgmk26.prod.google.com ([2002:a63:5a5a:0:b0:c82:a5b0:d9f0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c7:b0:368:b4a5:c4dd
 with SMTP id 98e67ed59e1d1-3779bade7bfmr3145891a91.2.1781181787050; Thu, 11
 Jun 2026 05:43:07 -0700 (PDT)
Date: Thu, 11 Jun 2026 05:43:05 -0700
In-Reply-To: <20260611123528.572255-5-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260611123528.572255-1-joro@8bytes.org> <20260611123528.572255-5-joro@8bytes.org>
Message-ID: <aiqtWVMqTK6vDoZ8@google.com>
Subject: Re: [PATCH 4/4] kvm: svm: Support KVM_SEV_SNP_PAGE_TYPE_VMSA at SNP_LAUNCH_UPDATE
From: Sean Christopherson <seanjc@google.com>
To: "=?utf-8?B?SsO2cmcgUsO2ZGVs?=" <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, x86@kernel.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, coconut-svsm@lists.linux.dev, 
	Joerg Roedel <joerg.roedel@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026, J=C3=B6rg R=C3=B6del wrote:
> From: Joerg Roedel <joerg.roedel@amd.com>
>=20
> Support setting a VMSA in guest physical memory during the SEV-SNP
> launch process. Only one VMSA can be provided which will then be used
> for the BSP. All of the APs will not have a VMSA allocated or assigned
> when this feature is used.
>
> This ensures stable launch measurements on SEV-SNP which are
> independent of the number of VCPUs the VM is launched with.

This needs a *much* longer explanation and more justification for exactly w=
hy
this needs to be handled in KVM.  I understand most of the words and acrony=
ms,
but that's about where my understanding stops.
