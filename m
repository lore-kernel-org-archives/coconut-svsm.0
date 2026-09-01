Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36203D3D0C;
	Tue,  1 Sep 2026 07:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246474; cv=none; b=RZA80h+CaR8/oEQgIz7NrpYnfQ/4/UgXkoPyjbXWdFnHUGeQTfboEZJOzeTImMEFEFqXHoX2Iu7zMt8ugmXmLl2YykajUe0LrCdd/YeZKIFqVCh5iPFRnnZEnXsx9SY8yiXNfV+dKdWbhSWVzZE28W5f4DKHbyGnuGdePKio8qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246474; c=relaxed/simple;
	bh=0S0fCIYgd+fiWleWefDzlIjIeG1DE9qU063Bwj1/+oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZkis400OCY1f0Z7ly0P5u1+zMEIJwcbB5Wj+zBPtcOYJvdFZgBTZ7XFgiF8dV9BMMq17fGqhXIeB6F9jpz8t42s8tbLHhr+MBtbyAny/K8m/v5aX1mS/Hp27Ke8XNBms3UUNi94+vii3+NKAFdQwO+i7bEQYtJUtZQ4Rkj445A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc500f900711659a2d641.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:f900:7116:59a2:d641])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AEB5F209406;
	Tue,  1 Sep 2026 09:07:48 +0200 (CEST)
Date: Tue, 1 Sep 2026 09:07:47 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Liam Merwick <liam.merwick@oracle.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM: Updated Linux and QEMU branches available for testing
Message-ID: <apZ5ad_Yt22ZdBqA@8bytes.org>
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

On Tue, Sep 01, 2026 at 01:58:34AM +0100, Liam Merwick wrote:
> ./scripts/launch_guest.sh --qemu
> /root/src/coconut/qemu/build/qemu-system-x86_64 -i bin/coconut-qemu.igvm
> --image ./resolute-server-cloudimg-amd64.img

I updated the QEMU branch with a fix. The launch_guest.sh script can now detect
that the device-plane property is available and adds it to the command line.
Can you please test the fix? It fixed the issue on my side.

-Joerg
