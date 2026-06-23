Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5D5393DC0
	for <coconut-svsm@lists.linux.dev>; Tue, 23 Jun 2026 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782245883; cv=none; b=d/nJ0ajj2xp4qZELTBjJrrelZI+zr1imujNvlCiz57LNI+c7uL/QYifv8AfalT+4zulHfTIzJDc0LxkeDh6erHxYqlPo2oi43BgxYSoaOIqJXoJIXiybMc1YVJbAIXL2AEJCasgcV956H1Ti/OeoMXHYRPPefS3mm4FzU98b1RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782245883; c=relaxed/simple;
	bh=pfBbZTVSVd9kFMPR307jWCQr5DUyZeOASXb+3/YzapQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dKGw/wcVStbFsPFVw1CDDdl8Bd1esMmQD9gJnyqnT4lHhZDlzHMyr85ZA9m2mmjcIaDUJxCeauMXAadSb6QlOGrTDrTxJI8r+BAxVLlL+ftDHvtD02kJy5ZJaQP0SkJeFGPbyycr38VJjm+As18nELmenkqzgV+yW91IBR6RPRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q4mCEr6f; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q4mCEr6f"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-842688fa7b8so1160595b3a.0
        for <coconut-svsm@lists.linux.dev>; Tue, 23 Jun 2026 13:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782245882; x=1782850682; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4it6V/RsWdXiHrdeR0Q4Fr1bmFRjk/MLCAbcFKI4NI=;
        b=q4mCEr6fijQ0MtgVW8Cof1urCpkb9z77FLlYxxs7BdCMMnk8A0yPRBsqdXXv5HNfNL
         fFwKwD8iHhH4eXDQKhB1yfrVxH+tVGIY19KUACkVQmknfQ/VO6ke1aWwUBx+1BAjnbVV
         WiA+DCG+GM/aiHoGR8zDN+NLL8WwRJxs/wu/qyAubwJC7j9lUT4z+9ucQ0ROBKjrgxuR
         KhWB3OpT1ek4sKMNFBHAXgXM6titsGaOyRtYCFzts9/gOKntA6D8hctjMqQxpOY1cIl/
         7qEqYjOJC187vb11pGZvOCbbsoYj4PShtHbWzbtB6/lalhlx8nl8BoP6kVpOLNz0GQaI
         4fpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245882; x=1782850682;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j4it6V/RsWdXiHrdeR0Q4Fr1bmFRjk/MLCAbcFKI4NI=;
        b=OzarWcBHc/qN5YZhYhyHCgv450QzDSb6ThmDVxZyyvuN9qDXlENVz26ztUo/v368cs
         tGTzBQUNjUpjgXLRElyFEFwr4lbTVNR+Cs+4GroHvZegt6Li5XdeE2pdbZq6O+YIYSCU
         JssEXcnx5C51abgUe5MwOD+Q7uW5QIZdMvIhGYbMPQduLVFcIvSYi1735HElOapccs0C
         ZkMya5PXNxDV+ogKLswVKCJdNC7xT4PqW93A0oyHCIRFRkkY0IeEVy+K3DJmN9ev3IRQ
         CZfaHvQdtrqHoOBhWkPGZh2t3+6beT4uFheeoYA73YgD29tbFJR28KY9oQ+ItklMboJU
         U4Gg==
X-Forwarded-Encrypted: i=1; AFNElJ+IQuFq1DuCpa0UsGopeqNM7VtH+V+ndJ7bMDrDimelYX3r+2ohYTSVzBwZgOYV0zRi3fsl2Ix4tUyNlhY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfH3u9UQCD2cr3OqogZFC8EllLoDfdF03jBN9cCh7NflP1q9wn
	i+3Eq3aOq89GDhQlAYKG9lbOrvYJLBcmyxY8IVCHCkfcvbKRoutra6SO7NsNy3ulDjS8p46lZIb
	wpf0qGw==
X-Received: from pfjd3.prod.google.com ([2002:a05:6a00:2443:b0:842:33b9:bdf8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:21cd:b0:835:447b:a2ac
 with SMTP id d2e1a72fcca58-84591b23f6emr4790574b3a.5.1782245881715; Tue, 23
 Jun 2026 13:18:01 -0700 (PDT)
Date: Tue, 23 Jun 2026 13:18:01 -0700
In-Reply-To: <20260611123528.572255-2-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260611123528.572255-1-joro@8bytes.org> <20260611123528.572255-2-joro@8bytes.org>
Message-ID: <ajrp-Tv7t4U-IS7y@google.com>
Subject: Re: [PATCH 1/4] kvm: svm: Streamline VMSA setting for VCPUs
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
> Streamline the VMSA setting state of vcpus, where a VMSA can be either
> KVM-allocated or guest-provided. This consolidates the various
> tracking state around VMSAs.

This needs to be split up into distinct logic changes.  There are renames, =
there
are tracking changes, there is code movement, and who knows what else, all =
bundled
together.  And the changelog is little more than "consolidate stuff".

>=20
> Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
> ---
>  arch/x86/kvm/svm/sev.c | 301 ++++++++++++++++++++++++++++-------------
>  arch/x86/kvm/svm/svm.h |  31 ++++-
>  2 files changed, 237 insertions(+), 95 deletions(-)

+180 lines of code doesn't scream "streamline" to me.

> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 6c6a6d663e29..9b1280222e20 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -147,6 +147,9 @@ static bool sev_snp_guest(struct kvm *kvm)
>  }
> =20
>  static int snp_decommission_context(struct kvm *kvm);
> +static int kvm_rmp_make_shared(struct kvm *kvm, u64 pfn, enum pg_level l=
evel);
> +static void sev_flush_encrypted_page(struct kvm_vcpu *vcpu, void *va);
> +static int snp_page_reclaim(struct kvm *kvm, u64 pfn);
> =20
>  struct enc_region {
>  	struct list_head list;
> @@ -156,6 +159,173 @@ struct enc_region {
>  	unsigned long size;
>  };
> =20
> +static void *sev_es_vmsa_ref(struct kvm_vcpu *vcpu)
> +{
> +	struct vcpu_svm *svm =3D to_svm(vcpu);
> +	void *vmsa =3D NULL;
> +
> +	if (svm->sev_es.vmsa.vmsa_state =3D=3D VMSA_SHARED) {

Unnecessary curly braces.

> +		vmsa =3D page_address(svm->sev_es.vmsa.vmsa_page);
> +	}
> +
> +	return vmsa;
> +}

...

> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 5137416be593..3d4799f09b23 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -240,9 +240,29 @@ struct svm_nested_state {
>  	bool force_msr_bitmap_recalc;
>  };
> =20
> +enum vmsa_state {
> +	/* No VMSA set */
> +	VMSA_NONE,
> +	/* VMSA allocated by KVM - Shared in RMP (if applicable) */
> +	VMSA_SHARED,
> +	/* VMSA allocated by KVM - Guest-private in RMP (SEV-SNP only) */
> +	VMSA_PRIVATE,
> +	/* Guest-owned VMSA */
> +	VMSA_GUEST,
> +};

I am strongly against this tracking.  AFAICT, every case is completely redu=
ndant
with other information that *must* be tracked.=20
