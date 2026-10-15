Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93341231836
	for <coconut-svsm@lists.linux.dev>; Thu, 15 Oct 2026 05:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041936; cv=none; b=m/+8f0EcSfYySp38mBsSEcO0svD477YZssdtZ5Nlfs0fkzdvcSnGQFapx9MW6HjQmDvTy/0nyOHxaU7qq3PejM0SzNNtANEteBbcN8SH/kXpYyJrYG/sCcFTT+xowi07YWwx5rAnTrZxjw1+odkMFJJA7zkKv5u4ZaPkfa51Dos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041936; c=relaxed/simple;
	bh=sph0niRNUxBlfP21XerfMUftRLjIRfhEI5jcDv9yR0c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LfWU751K8SpMFqyXRQ8uBobEONo8rFFoPxChPySGbp9dxd0m3jvfmlbsQ7wzk6dAkS2biaRXCKeq4P8UZcQ9wgNg87qyLucj3zsUaH++IRpAz/Uzt75k+31fLVmptcT4AFuEJnpYm4h88MOcxCCNMkks0oum37czXeNdEGthEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QfUbbBv3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QfUbbBv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792041934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=xQOAba/B/nGRCJ9OE5qoMEzToRodWdbHGij8DTaaGx0=;
	b=QfUbbBv38AN+8KLk9Hdsp19C4BOL37DylRkdPQlsAHjAs6G42E3NiSuDcSqz4bcIsJIClY
	szOE+d0XxoWbBGqQMPJeEjche4NdmZa33umHwV6yGf5p9yO0goatIwNwWcUVljJ5mX6mgZ
	YVVDqG/hXSUG7yGRTDEWB/JIYGMwJ7s=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-dBbXgegGPR-MVkfKY11ZXA-1; Thu, 15 Oct 2026 05:25:33 +0000
X-MC-Unique: dBbXgegGPR-MVkfKY11ZXA-1
X-Mimecast-MFC-AGG-ID: dBbXgegGPR-MVkfKY11ZXA_1792041932
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88c76888646so1836882b3a.1
        for <coconut-svsm@lists.linux.dev>; Wed, 14 Oct 2026 22:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041932; x=1792646732;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQOAba/B/nGRCJ9OE5qoMEzToRodWdbHGij8DTaaGx0=;
        b=YmsybEG9vdigj0ASHfNT4LBYyEpUS+JkwzTEGpUjD1qgf82KeLy+5r6fawzz2YqdB0
         jV4n/j1soLKsoC9j7UI5B8F9IgW6nTRVzZ9oicyzG0VIIG8XF8XbHat+42Arivtz6w7E
         3FQUeMEWHtzreDOizFmbfz8cl+uoMuFVC53XPZ5YZ2lRh9xq3PJoUXx89TSZ7VY1gSoH
         yWIDBtnTXbzjU5RpyscDIR85Bve4XWDNZALBvBC9BhvTkRQJgcr5ilCREzfFCzZ9B6bO
         8ewv1SzMLIU8jBs8UShzbIi1cIG51moQ/Sk0lDd9sidV6QCtX6O8tPl1uz5JCqkNwZbU
         zyRg==
X-Gm-Message-State: AFq9FYLh0O+llUnb8pb0lqf3om7TjV1UKclH9ckIQfYkz2pChccmJnHF
	UPn1kjtbzyCSwesP2X9ACsvJOtb7Li0wia0JxytdMVegkLfqSGg0rgDe7nhIYbVHy/efi/YpnzN
	U6VwvVVXnR7HyL2dtJenQ3QJDvxyQrUIZxNI6IcpDFUbmfpdlpcl7hgEYFlrB45n1Gc0s3MFuAo
	uEXWWur0Rwb7kV5VSrjNttp4DMp1S9ZCWTfwRxTKcXbTs5x0xV
X-Gm-Gg: AYBFou1ZKepQWAj4rsbvDuSQA8n+JFr/cu0wslLL2KOwbqM69wigJoiEwYBcBR7PIkj
	E2tkLifxVka4c+5CImyAbBMmln3CdVYRuiKe9H/dMKbJpVCl6UvEI+56IY+Yyrjwyl2bGPPhiE4
	KsVXCYWwCKiU+ZvTgFuYmwk9N2KES/wP00jZVyy9nJ2tebjH0EudZnyhO3PS5KIMWvCHIXIxRov
	rCnANG+iAVoe0/lbzI=
X-Received: by 2002:a05:6a00:1818:b0:886:4070:ceb8 with SMTP id d2e1a72fcca58-897c7ec59femr16228531b3a.56.1792041931729;
        Wed, 14 Oct 2026 22:25:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:1818:b0:886:4070:ceb8 with SMTP id
 d2e1a72fcca58-897c7ec59femr16228515b3a.56.1792041931190; Wed, 14 Oct 2026
 22:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Arun Menon <armenon@redhat.com>
Date: Thu, 15 Oct 2026 10:54:52 +0530
X-Gm-Features: AclHuK-NXdTmFC5nhXbwQBtuIYb9KnGgp2lCzmH7zvoQrxk9uut3wt7Aj9GCp-U
Message-ID: <CAE_eyq_MPZxuZevOOLN2kOybjV74KHVZNRxEi9vQ4DSirwVmXg@mail.gmail.com>
Subject: [RFC] Preventing CocoonFS vTPM replay and cloning attacks across SVSM
 and KBS
To: coconut-svsm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y_wZ5Ridk08wVGXJlx8ql1BZ4KbBA0ewluu9v2iFwzo_1792041932
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I've been looking into how we handle persistent virtual TPM (vTPM) state disks
using CocoonFS in SVSM, specifically around preventing disk state replay and
cloning attacks.

I've put together a design document proposing a solution, and before I dive
deep into testing and end-to-end validation in the coming weeks, I would love to
get your thoughts and feedback on the architectural approach.

The Problem
Currently, SVSM decrypts the CocoonFS vTPM state image at boot using a
decryption
key retrieved from KBS after successful hardware attestation.

While attestation guarantees that the guest SVSM environment is
genuine and fresh,
it doesn't tie the attestation to the physical state of the underlying
disk image. This leaves two gaps:
1. Rollback / State Replay: A hypervisor could boot an older snapshot
of the disk.
  Since the machine is a genuine TEE, attestation succeeds, KBS releases
  the key, and the guest boots an old vTPM state (rolling back PCRs or NVRAM).
2. Cloning / Split-Brain: An attacker could boot multiple concurrent VM
  instances from the same valid snapshot, resulting in multiple active VMs
  sharing and diverging from the same vTPM identity.

Proposed Approach
At a high level, the design ties the disk state to KBS storage through:
* Anti-Replay Metadata Header: CocoonFS's unencrypted auxiliary metadata
 stores a 26-byte header containing a rolling random nonce and a monotonic
 boot counter.
* Attestation Binding: SVSM embeds the boot counter and disk nonce into
 structured runtime data claims alongside the challenge. CoCo-AS validates
 that these claims match the hardware quote, and KBS validates them against
 its database before releasing the key.
* Session Leases: To prevent concurrent cloned VMs, KBS grants a timed session
 lease (X-SVSM-Session-ID) when releasing the key. Duplicate boots while a
 lease is active receive HTTP 409 Conflict. The attestation proxy (aproxy)
 maintains heartbeats and cleanly releases the lease on VM shutdown.
* Local-First Roll: During boot, SVSM commits the incremented counter and fresh
 nonce to the local disk header offline before unlocking CocoonFS, and then
 notifies KBS to roll its remote record.

Design Document & Prototype
The complete design document is available here:
https://github.com/coconut-svsm/svsm/blob/961dc0aff2f471ee8ea9e912501877e8c1399639/Documentation/docs/developer/design/COCOONFS_ANTI_REPLAY_DESIGN.md

(Note: I have put together a rough, work-in-progress proof-of-concept across
SVSM, aproxy, KBS, and the provisioning tool just to sanity-check feasibility.
It is completely untested at this stage, so please treat the branches strictly
as early reference code while we discuss the design.)
* SVSM & aproxy:
https://github.com/armenon-rh/svsm/tree/feature/anti-replay #d8d7f5d
onwards
* Trustee (KBS):
https://github.com/armenon-rh/trustee/tree/feature/anti-replay-vtpm
* Host Provisioner (vtpm-to-svsm-blk):
https://github.com/armenon-rh/vtpm-to-svsm-blk/tree/feature/cocoonfs-integration

Please take a look when you get a chance.
Any questions, critique, or suggestions on the design would be greatly
appreciated!

