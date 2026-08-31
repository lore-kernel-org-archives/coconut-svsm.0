Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EE5463B85;
	Mon, 31 Aug 2026 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189903; cv=none; b=GjgXyLmJ91DgMEcu4DrmlSPZuOX6Gpb57U0koWePBnTFnCJ9xJi8R+pGpJHfBdi+US8N3/ZmcRppHiLtv5dHhrdNTOJBvaB8lsINKO7TTliIUU1gNjeZR7lnpdnL9KVuNVV29a72z38OUld452xn4FRAVhIVZ3jZ9sdXlf9s55s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189903; c=relaxed/simple;
	bh=53oLHiP/CjXFAIBYdCjQrvUrtdjEhLXGi3+27b7rCvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwASY2yQSwpMp+CZIgOZ0o47yt5bZPssQjPnQR4LDWEqL8NqOd4u4u1AKhjgkoh/37aKvFxU8PUtJkz0VtG4QyVoI0rzkmPUxR2tsj3IuDnkLwXFCuBkdTf/397ZglMd4/roPg/tOeFRkLUV0XCHBWnCfJRIXsOBpj9hbIKLIg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc5009e1b9b42fe5dc9c4.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:9e1b:9b42:fe5d:c9c4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 61E912092AC;
	Mon, 31 Aug 2026 17:24:54 +0200 (CEST)
Date: Mon, 31 Aug 2026 17:24:53 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Liam Merwick <liam.merwick@oracle.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM: Updated Linux and QEMU branches available for testing
Message-ID: <apWcYdRjTeZF5vtH@8bytes.org>
References: <apBelv6Ev-lCQ64J@8bytes.org>
 <b1cfe9d8-4f29-42f0-b3ac-312724250d0c@oracle.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1cfe9d8-4f29-42f0-b3ac-312724250d0c@oracle.com>

Hi Liam,

On Mon, Aug 31, 2026 at 09:41:13AM +0100, Liam Merwick wrote:
> 
> On 27/08/2026 17:17, Jörg Rödel wrote:
> > Hi, I just pushed out new branches for COCONUT-SVSMs downstream Linux
> > and QEMU changes. The new branches need to be used together, as there
> > have been rebases which changed parts of the user-space interface. For
> > Linux the branch is:
> > https: //github. com/coconut-svsm/linux/tree/svsm-v7. 2
> > 
> 
> 
> On a system that was running the 7.1 branches, I've upgraded the host
> kernel and qemu to the 7.2 branches and am now getting CPU stalls in
> the guest (and eventual boot hang).
> 
> I'm using ./scripts/launch_guest.sh (and 2026.08-devel)
> 
> One thing I've noticed with kvm_stat is that the top host functions are
> 
>  Event                                         Total %Total CurAvg/s
>  kvm_set_irq                                 2304824   22.2     2095
>  kvm_ioapic_set_irq                          2304824   22.2     2095
>  kvm_pic_set_irq                             2304768   22.2     2095
>  kvm_exit                                     626814    6.0      159
>  kvm_entry                                    626814    6.0      159
>  kvm_vmgexit_exit                             299778    2.9      105
>  kvm_vmgexit_enter                            299777    2.9      105
>  (...)

Thanks for testing the new branches. Can you please share your exact
launch_guest.sh command line? Also, what type of guest image are you running,
something I can download as well?

-Joerg
