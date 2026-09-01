Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6D836E498;
	Tue,  1 Sep 2026 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245310; cv=none; b=qVqyWECP57dWc4hFltWeDfPJsJ3NxWCLzw/YZSuLSYb1TnYOghwoD2zPYTVjHdEsg/XZFOqJtmd4xm/aZDgHWtS4u0kCr0miW60fAyljKKOXZOhvXx7CUNs00id4RBVg2J4OMgXsQPTyT3xRjXAVM51CXbWai+4rq6BIAGRvDtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245310; c=relaxed/simple;
	bh=w6Sr1MbyYXwQcu9bY+IxQoqdFn/U/4cZXjR/F3AaY/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKQApf4BPnDTXl9VBNomS5qGUs5YnxrQZ3AGcJNAUa506Xe27ONnw1Pssh1NLW4554Q7YpcEVTZeqf7/q+/MRgXs54zZ3kqrChwYe1vW1N07/wDFvPpu1V6bXQqa2PsbSNXLSVVfmrmp7G6Y/SKYKzUOOcuUBuk4PCu3W9jUzEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc500f900711659a2d641.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:f900:7116:59a2:d641])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 24BDD2062B6;
	Tue,  1 Sep 2026 08:48:27 +0200 (CEST)
Date: Tue, 1 Sep 2026 08:48:25 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Liam Merwick <liam.merwick@oracle.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM: Updated Linux and QEMU branches available for testing
Message-ID: <apZ0s9kpYXozf2x-@8bytes.org>
References: <apBelv6Ev-lCQ64J@8bytes.org>
 <b1cfe9d8-4f29-42f0-b3ac-312724250d0c@oracle.com>
 <apWcYdRjTeZF5vtH@8bytes.org>
 <cc95e357-00da-456b-a41a-357ddc857d17@oracle.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc95e357-00da-456b-a41a-357ddc857d17@oracle.com>

Hi Liam,

On Tue, Sep 01, 2026 at 01:58:34AM +0100, Liam Merwick wrote:
> ./scripts/launch_guest.sh --qemu
> /root/src/coconut/qemu/build/qemu-system-x86_64 -i bin/coconut-qemu.igvm
> --image ./resolute-server-cloudimg-amd64.img

I found the issue, it is in the interaction between QEMU and the
launch_guest.sh script. The script does no longer detect that the device-plane=
property is available and does not add it to the command line. This explains
why IOAPIC IRQs (and also other IRQs) do not get through to Linux anymore.

I will prepare and push a fix.

-Joerg
