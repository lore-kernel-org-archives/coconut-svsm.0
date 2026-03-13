Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63AE34404F
	for <coconut-svsm@lists.linux.dev>; Fri, 13 Mar 2026 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773401139; cv=none; b=nC9UWAiJp7BmT4N5L2S0rI6UC2+N8/3r1lQ5ohmKyTvyPLwy1+9eLlmK8WER60p+Rw0bO1g2lsptASs99RN90ly1ZJAafdqLaH/t/DJKrEpTOaFjNthg2s227z4rc0hfeIypRKL8KgImHPIH4Z+EL0mKR8anCVkOHH9udlSm/co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773401139; c=relaxed/simple;
	bh=tSGbcm3OSrQExmnLG1GXPTARyGFYuTsuQViSiL8jAoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMnVLAOaqIRwkIC6ODnq9cJIWzmcI73wJV/JPc1ptp5nDe5hKA4giGpbe4MT76XDaRvVkwMhRBilgq7bJTFFy2Cl44nE+lF9V8U/lcdEdO6zu1DHZr4YgOj3VDYbS+dU6fyY4utly1Md6KjLwCunMbiKMj+uUivHC64SxBR/eVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RZsolO1O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RZsolO1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773401137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Boo592O8fgF0fubIh0faPFvWN+sayttFHAWQi2ya5GA=;
	b=RZsolO1OmZjKx44plwLStFbrptnzKyCm09M+o4XIJFuMJqgnmPZ2zulHWUuYGJ9vFAltHm
	E/RVs1h9rDqG5VKu8GyPEw+SYAz8FTgcnTU9xObZJLInHqy0Duqa3QAb0mcHHW7XFQCWOP
	iXX0gHNcfj/ZN9OJtjISVmjLTzKghzY=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-7yip1bk3OyaabslH0oFsFQ-1; Fri, 13 Mar 2026 07:25:35 -0400
X-MC-Unique: 7yip1bk3OyaabslH0oFsFQ-1
X-Mimecast-MFC-AGG-ID: 7yip1bk3OyaabslH0oFsFQ_1773401135
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64cb719e778so4951731d50.1
        for <coconut-svsm@lists.linux.dev>; Fri, 13 Mar 2026 04:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773401135; x=1774005935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Boo592O8fgF0fubIh0faPFvWN+sayttFHAWQi2ya5GA=;
        b=iT6GpnR6ReR0gkaG6rDQOqXnIUPubrJ1179+c1w+D7xi3+lzfintcY807+Plf89Kwh
         XiIyR6kRuS9DoI/akekPWdZ0TLlUi+XZvERYNt3ERa67YWXvE8TnSpW8q75v2fn3YKyh
         caUGQtIxuKFlyRD63dOLhd5RT7+cjbZ+QQkNWs2DKhFdcfhsEoinYD0C2mLc68iY2Q0U
         0646/RvdAAIbFHMwyl0uc1qqrPQCE2ZhthxugG0ULaCDeHUQrSAc4iLyhG6I77lqBxTv
         oAdyZswxffFg9Tyv+KCpPBbTxVpKHnE8TBw2de+ONt3V7EFXsthSVDSJGbxhzl/bw8Qk
         fRtg==
X-Gm-Message-State: AOJu0YyDEmzcgwoGJvKh6NyeyJxcY/c9BtyIX1aThOD+i1hrT14xg1Cy
	su6A3Klq+k4ItEyfxZVpJ7kbSrw5d+oOOh9xnn4oqOYTUMULfqIer4zzciA7DWWisJCozwCrDOh
	T2Qc4d1788O66XVQvfqE0NZcSCxPNR+3iUmUX+q7QLoD2t6j9yATbkJ4D0DGrfuuaUrp/CdkfWv
	zumVxuBX7pf0fz1BV+XBW8Wm8MA1OVKKkop1bv4vLr
X-Gm-Gg: ATEYQzxm1SzC2hZ8lALgYfyBFjaP+YrPSQf7LQ2cKJnC61iVwyt9ZjrzQyHX2pzG7nu
	/DuU3zSEOq5VeX2MlSFB0xyldFjIRwyJdOPsv7EZE+m3Jhuf0P0IBOUrJUlVuk++1rf8hsyBlEs
	0ox4ZB/hFResRB3mxl6Tod2oMbZh4GKiQY8aAsX8myGZP/KL16aln97/0Fa7QvjxlWW+Me6aHAO
	1WhszDiMC5QWfVHTuCSfyYG+b0gz6/jNRnI7A==
X-Received: by 2002:a53:ac41:0:b0:64d:29a3:ebbf with SMTP id 956f58d0204a3-64e62f28aacmr2091698d50.16.1773401135208;
        Fri, 13 Mar 2026 04:25:35 -0700 (PDT)
X-Received: by 2002:a53:ac41:0:b0:64d:29a3:ebbf with SMTP id
 956f58d0204a3-64e62f28aacmr2091688d50.16.1773401134827; Fri, 13 Mar 2026
 04:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+bRGFpVnzG_zg1++0TnEQ_tHsXgwYG44=FZLRNVHwBB4t1wew@mail.gmail.com>
 <aamSbgGZ-ziazEMj@sirius.home.kraxel.org>
In-Reply-To: <aamSbgGZ-ziazEMj@sirius.home.kraxel.org>
From: Oliver Steffen <osteffen@redhat.com>
Date: Fri, 13 Mar 2026 12:25:24 +0100
X-Gm-Features: AaiRm50eB-xd4_oU06MErQDQniaQPv08d_r3RfygosnXyK_4UQNB87EDdKNZ1tk
Message-ID: <CA+bRGFpWW7CkrTyozwiYo-J00S7BZU8yWUL4c5teZZ-jcKUwMw@mail.gmail.com>
Subject: Re: Separate igvmmeasure
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: coconut-svsm@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Jon Lange <jlange@microsoft.com>, 
	Peter Fang <peter.fang@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sS-iuPRXyziv00Gb7LvhggixrDQdt5Gpw5H8ZZi4BR4_1773401135
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 3:34=E2=80=AFPM Gerd Hoffmann <kraxel@redhat.com> wr=
ote:
>
>   Hi,
>
> > It has no dependencies on the rest of the repo. It is not
> > SVSM-specific (as it should be, since IGVM is a generic format) and is
> > also useful outside the SVSM usecase as a general IGVM measurement
> > tool, for example for IGVM-wrapped OVMF binaries or other firmwares.
> > This way we could publish it on crates.io and downstream consumers
> > could easily package it.
>
> Publishing on crates.io would be great.  Also turning the crate into
> an library would be quite useful so the measurement functionality
> can easily be added to other tools.
>
> Moving it out of the svsm git repo is not a hard requirement for
> publishing on crates.io though, so continuing to maintain it in
> the tools/igvmmeasure subdirectory is an option too.
>
> take care,
>   Gerd
>

I am glad we got to discuss this at our last community call [1].
I am happy to help maintain it, should we make it a separate tool.

[1] https://github.com/coconut-svsm/governance/pull/99

 - Oliver

