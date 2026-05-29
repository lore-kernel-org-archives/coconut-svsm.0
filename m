Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99492369D77
	for <coconut-svsm@lists.linux.dev>; Fri, 29 May 2026 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056944; cv=pass; b=kbXQYl+BtbBUOwAdBDOw4Hb0QSB9SVf8eC4kcAqazIs1zPrtzTev2hqoUFIC0zUEs40ZkH2i8IkIqcOaJIv4ez2N46xRXERP1xfeaL0iL4dRUlnT/36eCbtWxe2agqL3dXJgmaZsl+sP8JcgS/LKvXNaL5iCQNX8xhUrPmLrS3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056944; c=relaxed/simple;
	bh=wBLsikgcWRjc6caTKkDxapksvxKzXWshhMu4aVKTHyI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=X/5KFv3n3TuH4fRFQdc8McTOLZNIiLj9by+9J9t9RvuLE3L4Iadr5K3+7xyMsf/D1kh6CJC3VHHR92EXjSbyTSUnNnDc0jKckabge+pBk5XYxIsforZZQtJAZNo+XsImuw6mD6huz5Lg888/AqXfGuvpu+6QSF1D0jtVY8OwgIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDEcHQB0; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDEcHQB0"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7dc2b658544so17544317b3.2
        for <coconut-svsm@lists.linux.dev>; Fri, 29 May 2026 05:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780056943; cv=none;
        d=google.com; s=arc-20240605;
        b=KqzWJzCILM5Q16X8MbcTQ/Wrl/U4xnWpl8DFj+Pji3OQFS27ih7f7aEcW5/sBvZrSN
         dxJuzubhyy9iOcoGM+QGIAxsmGtmrIbv2fbA2LYDYACC+QQlOaCZ5HxFgnzPbtjfAqnG
         cp3v24HkB19XOYCFfg1xZLkCGScn54whEc75PMqmQZvGlAvnQoCVUWvBhq8Ss6y6VpNE
         hrX+VZdUdthQzyK3WNRt7jutZC7pQasJSWJImKc5yM/TsJNf3Dcm9TrqnXKqqJCdgbZo
         gR6jd6PE5LONCo8VufNHYYzB6pAbcX2ixTzXIjKM5d6DPFTYbpSqjkCzNN4Vej0e5Uvn
         jMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yjKGj59EYdEVZMYoNn1QX72MKnSy7HepRRbi+EYklHg=;
        fh=rTSJHlsTmsGDbFoUnWDTtWj+4u05duMBNy7qEEhPraY=;
        b=TjrqayAa0WDiC63t0YyIDXtoUJdNV7hYSTn9BNgnOAFQhJhQd7isXj/YAgTO9y7CtX
         BLJn+XFP4ki63UonK8X4zTKylJFzOwA9siWRlZgpS4p25ba2GEBmJTz7V5dd8VblftKr
         gukQIZOK6qBZ69UlQ1o9r21+84LCn7URdyeFfxM/0gWg/gajbC9aH13qemJavp/SGX5k
         hZWqgEk0Cn9SmTMypYgsCnFWpAwdwO1kR6O+2y8iEvDNMAoGsxN0sPMCtUnCR8q94amu
         qhdSj+VA5ozpbp3OYOrm3ikVW31mK/kOMang5xo+cUJYxmq93RGhbpf4+0OXdSNFb8Wy
         PqGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780056943; x=1780661743; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yjKGj59EYdEVZMYoNn1QX72MKnSy7HepRRbi+EYklHg=;
        b=DDEcHQB0QFK8agqah9xIToPBR+eKnaOyPUebyaom5wvItz4mD0G4HYcH0EzFEBv6rL
         TOuZtBAQ6dqHvBXVCYJ0/TcjymhdaGZYbSkMa7QCLE9ZTwGPk/psdkWjkrR802/8nVvV
         t8KQ3E1v7aD8XkLzRetBoyNKFZ9MjRZL8U3JjzzZibXMp4HS4l2AaqEchKP2kzG+PW/p
         zTjTKYDqP1oNmZ1Xck8uh+hYKNO6/Al5IT3naTgSff8uzHIaKSMMLac+MMRtoUd9tKyW
         JE2Rf8DEy3nKPHwSlxFRj8E6BS2ujEVMWJDS9Ir3nD7KCt0BhKTZdQONSUpVc2HLwvYY
         AUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056943; x=1780661743;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjKGj59EYdEVZMYoNn1QX72MKnSy7HepRRbi+EYklHg=;
        b=Q7txH1urQw3RrJP+bZV201zdADEUqSUhJ4Ibrhk9wcmWDHAxvYHx622VaTkia+wEex
         +I9ZmfO9PncpdFc4aHuQtsrJjsB0MfJTosBgGZTJmqJbFD351ewWpz7F7nzuuN5bHmLs
         zPw+ChsjeFa5m/gHucZiVJjQQfselyqM0BXQu35ryso3Xnlxooch0OgsixStI9AllI7n
         DHt3PoXUa8An+LECcE2/Lf5E74QFKlzvjYRbFrkwz51XgfR+giceZxr29jAkkGMqdpMq
         Mkdn+14HLdRcSSBFxb1idX39bJSeWRbGwioC2LEYiWGQZs9CtaU742dIh89wAcyBS6lW
         ps0w==
X-Forwarded-Encrypted: i=1; AFNElJ8dLNbEr1xlnFcOznQy7gpzNWhsJ3Lp6cv6xEni5ortHd6vz7mujGMt1SYKkX/EvL8g8SHt9nEX3wKmDqg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjBAlVllQgnzf3Bu6QPB9EyT4PRSl71uEjS7nSto26+ALZmRh0
	TZzZE7P7F3VzX/oVSsgXAHtCYxyhS7O5r3qpOskgwjpLrZyKo469msC8eBMXk1KyLJAXlUmkSZz
	56bArw8QVV09bT7ZFzWprq1HB/otfmZz2kAgzym2Qtw==
X-Gm-Gg: Acq92OHfgsoUzjQ1qIMj+LfBULza27ZBvwuuwrDEFbuGWsudTBzvoU7CXeaGYCewdgT
	3sODB4wWGnSIzwzdbKzb4V1m5dFuZuw3rSwmB8QB4bWIk3pazkm7M2MYGOhiDwh4l5WKh7I9F/j
	ga0dg2H8AV9lryVkZc7HNzpbuZsoEzEv52TSNiI62aq3tw39/lONHOTXcK4U4ruJ7L9WbxF19NI
	YGougOJcQS5jhPvPoxT8wYLlVKl7caTwQuEqvSpQWNHatrJPnuznhMZA7mqvEAQ82qQ5mEfOnrG
	TQYnA8Kgal+zkYmiG2/8SyxqyxVdG4eAXNwDtPJb1sTlv6p7yjS/qHakS6aG63kkN0O6m1NZ8ef
	TJg==
X-Received: by 2002:a05:690c:600c:b0:7d1:c256:b5c2 with SMTP id
 00721157ae682-7de49c3369bmr20746167b3.33.1780056942332; Fri, 29 May 2026
 05:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2026 13:15:31 +0100
X-Gm-Features: AVHnY4JLeR9AeYFBA5aawGm6vGHoYnsK642CUtkYU-vZUDUKpXBaG742LlgMaNQ
Message-ID: <CAFEAcA-H-bsjnvCPg71BMre7=6ZQ9f-tSU_XZcPPSgXkK+dDXA@mail.gmail.com>
Subject: KVM Forum 2026: Call For Presentations
To: QEMU Developers <qemu-devel@nongnu.org>, rust-vmm@lists.opendev.org, 
	kubevirt-dev@googlegroups.com, kvm-devel <kvm@vger.kernel.org>, 
	coconut-svsm@lists.linux.dev, libvirt-devel <devel@lists.libvirt.org>, 
	edk2-devel-groups-io <devel@edk2.groups.io>
Content-Type: text/plain; charset="UTF-8"

####################
KVM Forum 2026
November 12-13, 2026
Vancouver, Canada
####################

On behalf of the program committee for the KVM Forum, I am pleased to
announce the KVM Forum 2026 Call for Presentations.

CALL FOR PRESENTATIONS
======================

We encourage you to submit presentations via Pretalx at

     https://kvm-forum.qemu.org/2026/cfp/

All presentation slots will be 25 minutes + 5 minutes for questions.

Suggested topics:
- Scalability and Optimization
- Hardening and security
- Confidential computing

KVM and the Linux Kernel
- New Features and Architecture Ports
- Device Passthrough: VFIO, mdev, vDPA
- Network Virtualization
- Virtio and vhost

Virtual Machine Monitors and Management
- VMM Implementation: APIs, Live Migration, Performance Tuning, etc.
- Multi-process VMMs: vhost-user, vfio-user, QEMU Storage Daemon
- QEMU without KVM: Hypervisor.framework, Hyper-V, etc.
- Managing KVM: Libvirt, KubeVirt, Kata Containers

Emulation
- New Devices, Boards and Architectures
- CPU Emulation and Binary Translation

Developer-focused content
- Tooling improvements
- Enabling Rust
- Testing frameworks and strategies

Speakers are expected to attend in person.

IMPORTANT DATES
===============

The deadline for submitting presentations is:
   2026-08-01 00:00 (Canada/Pacific)

Accepted speakers will be notified on August 21, 2026.

ATTENDING KVM FORUM
===================

The cost of admission to KVM Forum 2026 is $75. You can get your ticket at

     https://kvm-forum.qemu.org/2026/register/

Admission is free for accepted speakers.

The conference will be held at Coast Coal Harbour Hotel Vancouver by APA
in Vancouver, Canada. More details about the location, and about the
reduced price rooms available for attendees at the conference hotel,
can be found at:

     https://kvm-forum.qemu.org/location/

If you need a visa invitation letter in order to attend, please reach out
to the organizers at kvm-forum-pc@redhat.com.

We are committed to fostering an open and welcoming environment at our
conference. Participants are expected to abide by our code of conduct
and media policy:

      https://kvm-forum.qemu.org/coc/
      https://kvm-forum.qemu.org/media-policy/

CONTACTS
========

Reach out to us should you have any questions. The program committee may
be contacted as a group via email: kvm-forum-pc@redhat.com.

--
Peter Maydell
