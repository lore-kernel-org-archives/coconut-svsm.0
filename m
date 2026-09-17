Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A575A984C
	for <coconut-svsm@lists.linux.dev>; Thu, 17 Sep 2026 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657204; cv=none; b=fYFynRhjEh1Ht3/fWcUzI3uc5IZKKPpSMijpbtP8a1cbtqCOA9a5Pw/lsDyfP1v6fLrkC8JzIOMSNBymfoeUnrX1VrlkzhL19SVWcm4zp1P3rtmZqmUYhHndeGAjpUPa7wFGf8VwUNYne4b8X7J0aLpLruiCtvSb6BLSDXSoCAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657204; c=relaxed/simple;
	bh=53aCEGHYwukAZTl86DipUp2yXojCNqH9CDncsz1xdks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8gQ2WbWWKRFbXJ0hpiesHBJtT0f5wQHRsL8QyrCizZLgjc38+AfLr6eJnMYLvJaECkOZoc1bS70W5u+MOx7d1suQ6UfJAN3qmK5BspyeQYXMWD4u+rHEWUJdy4nvny3OZlpyT6BMXjqD3GaYhrGWv9SgGP7oGZ0LaPEWk3iagU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a00d97e11a7b5d1f70d.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:d97e:11a7:b5d1:f70d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8DCCB1C1C39;
	Thu, 17 Sep 2026 16:59:38 +0200 (CEST)
Date: Thu, 17 Sep 2026 16:59:37 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Tony Lindgren <tony.lindgren@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Michael Roth <michael.roth@amd.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ninad Naik <ninadnaik07@gmail.com>, Joerg Roedel <joerg.roedel@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, coconut-svsm@lists.linux.dev
Subject: Re: [PATCH v2 6/8] KVM: SEV: Add SNP vCPU state get and set commands
Message-ID: <aqv-FtT1v1FjDZJD@8bytes.org>
References: <20260908103338.427254-1-joro@8bytes.org>
 <20260908103338.427254-7-joro@8bytes.org>
 <aqksXLLcmFDkM9Xj@tlindgre-MOBL1>
 <aqrDUgB7nfdgzXpQ@8bytes.org>
 <aquIYzwDOx6jzy3T@tlindgre-MOBL1>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aquIYzwDOx6jzy3T@tlindgre-MOBL1>

Hi Tony,

On Thu, Sep 17, 2026 at 09:27:47AM +0300, Tony Lindgren wrote:
> Oh OK, so calling for both hypervisor and confidential VCPU state would be
> needed. The difference could be specified in the struct kvm_vcpu_transfer
> flags?

Or hypervisor state is migrated outside of the CVM live migration interface? From QEMUs
perspective it is not different to other state like for emulated devices and
such. Does TDX also have per-cpu hypervisor state that needs to be migrated?

In any case, for SNP this state must be settable from QEMU to correctly support
IGVM loading, so an interface outside of live migration is needed :)

Regards,

	Joerg
