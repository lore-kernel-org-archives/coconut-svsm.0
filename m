Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1F3822AE
	for <coconut-svsm@lists.linux.dev>; Thu,  5 Mar 2026 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772719574; cv=none; b=q/zCh1u8bhKl6p7vMptodLDMCP+/vga0sId2ZSyEac+lRjUoYaMS8NYiDFQG1eb9iLOcjBExcuTgzzte5TV9n/qVvuGQJDcdGwOrIdOB1Vf/tbZvdDXnxK4yIHsyP7UPY2ujI8XwLkrIcOMUNhTymvjEuWvFMm7J4GLmQoKNBgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772719574; c=relaxed/simple;
	bh=0/D4q5jNBAtA6J2T0GNRi5rUM3stG8rKUX+MmF9pD+M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sE3IKq4x1euHFVSneetTuHwp7LGxUqUd+Ux+7QW6kHqVH0n/IJEo9mZVNbT8YzULKRd2GmlHoQBrXXy90DwbbinNe9L0HtaLLH0Sbk4pC2n1P2KLoOrzk9kxxap9LvLEszQhU0hMCKSjF/mZ1Un4RvAPNvQrqObD7CaG616lYh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BsZqbIRL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BsZqbIRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772719572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0/D4q5jNBAtA6J2T0GNRi5rUM3stG8rKUX+MmF9pD+M=;
	b=BsZqbIRLLqxvkvGmhpW+u4slwTOBt7jL4a97HnX+AP6GIjBCpxoWb4N/3DwhbxvKKNM7lR
	CB2KaRjC6qhCRZ1dlOJBdKcyG2hsXhFsCg/ezYjeZjuAjL+oCqx2i49frG5w9u03rmzhBP
	fp1ervMfy3kXjqxxqY7aJeNQwVnDFxE=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-3xVdVNcuN1GUiYDqgpaTlg-1; Thu, 05 Mar 2026 09:06:11 -0500
X-MC-Unique: 3xVdVNcuN1GUiYDqgpaTlg-1
X-Mimecast-MFC-AGG-ID: 3xVdVNcuN1GUiYDqgpaTlg_1772719570
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79895ffb315so98555157b3.2
        for <coconut-svsm@lists.linux.dev>; Thu, 05 Mar 2026 06:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772719570; x=1773324370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/D4q5jNBAtA6J2T0GNRi5rUM3stG8rKUX+MmF9pD+M=;
        b=b//y+E/uVGkBXnUx+6JspGP1GyVB1kf4dsPhUfwYJabEjEDxwrsBpo4fMbqnujac8W
         NvgI/US2w5KhFrT/bvb6Zp/Uo85cVbyQWKUMd3mZkAxMFgCpIRcR6+OVS4kn38nNWl27
         6ghe84lt45kQ2WQ3HGTyHXmNF+gbKS0PNC7V0+48jkgE6wmPNBmxgwfPaihmsRit6cgR
         pQySPimnHHzY1owJWsAROzCpZfTD0ThJzQefFI4IWjwILk/mE3BHTyYeOSDNRAqIjEVu
         Wro+bZSTG3hXdOjOWc9qxSwPTkIwqdTsLYWBLwOKFA64x1PoSoyBSJ58eOhpyIMf9VJu
         ZtGQ==
X-Gm-Message-State: AOJu0YynDB/tRh4v0aMhgxwwqKLuzrK/Ow6fYqJ/cMUH2zslEXHY5Wz3
	7JsT5lzxyJflUAr9T6BfUYbuazvTZDEZPg4Lzh1U47RiqIh88bYSDJGGldhcCemnQQB/lU9pmqx
	fH0n9ZBzvogIJkq/vvn2x+Hgf88Bysj3iAq7DsNWcZaVZWiNCyDXV0iqmPWe8TsvIGYmPEmyRD6
	RoACV+VS/vVITNzE9uIt5XrOF0LRwuuuLZ3JehCsdoHMrL84DE
X-Gm-Gg: ATEYQzxThvLJzlxM9UGkEL+QI5zirKXuS/0AmbhYeminZ3o3ZDuDJeq85e31fq2kxPG
	qbFuQ5FB2TAiM02RhHLincfWKH8SQEXtl5z0nthPC+AUzDCEsP9Id4xPARegrOlRM1l0H0JYsWm
	CEeASCEQGWqQRMjrTwSbjnGs6I6vDKhtaaXRut1DprZDK/VBW/oFGeBV7QLExWcxL31ZLTEgpsm
	rLrX4pNEOuvwNpGzBId1PuOZVRP7ugrSNGO
X-Received: by 2002:a05:690e:134e:b0:64c:2114:1766 with SMTP id 956f58d0204a3-64cf9baea2dmr4308790d50.45.1772719570168;
        Thu, 05 Mar 2026 06:06:10 -0800 (PST)
X-Received: by 2002:a05:690e:134e:b0:64c:2114:1766 with SMTP id
 956f58d0204a3-64cf9baea2dmr4308740d50.45.1772719569581; Thu, 05 Mar 2026
 06:06:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Oliver Steffen <osteffen@redhat.com>
Date: Thu, 5 Mar 2026 15:05:58 +0100
X-Gm-Features: AaiRm52RXBtDsOvv6VmydU55IBNSdsDIMgfUXTY-qGPZGmFySFL1p0-S8RsfdUQ
Message-ID: <CA+bRGFpVnzG_zg1++0TnEQ_tHsXgwYG44=FZLRNVHwBB4t1wew@mail.gmail.com>
Subject: Separate igvmmeasure
To: coconut-svsm@lists.linux.dev
Cc: Joerg Roedel <joerg.roedel@amd.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Jon Lange <jlange@microsoft.com>, Peter Fang <peter.fang@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OOM5VC_JfWnTZa6vl3HKesjnyZ7-sT6Wm_-0fhyDxGY_1772719570
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

How about moving the igvmmeasure tool to a separate repository under
the coconut-svsm org?
It has no dependencies on the rest of the repo. It is not
SVSM-specific (as it should be, since IGVM is a generic format) and is
also useful outside the SVSM usecase as a general IGVM measurement
tool, for example for IGVM-wrapped OVMF binaries or other firmwares.
This way we could publish it on crates.io and downstream consumers
could easily package it.

What do you think?

-Oliver
--
Oliver Steffen (he/him) - Software Engineer, Virtualization
Red Hat GmbH <https://www.redhat.com/de/global/dach>,
Registered seat: Werner-von-Siemens-Ring 12, D-85630 Grasbrunn, Germany
Commercial register: Amtsgericht M=C3=BCnchen/Munich, HRB 153243,
Managing Directors: Ryan Barnhart, Charles Cachera, Michael O'Neill, Amy Ro=
ss

