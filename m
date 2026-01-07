Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A923148C5
	for <coconut-svsm@lists.linux.dev>; Wed,  7 Jan 2026 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794589; cv=none; b=KIksu//apPUFt7DhbuNACoyElbYYEvCLWPVvn8tftIsURv7dW2UUrXNoIRXX1QSv+CzjUrudcMzSxtR3i7SUrW6ji7MG9L4PGccsVOQJqA3yNAZ5w/V8POy3YBHOXuxAa9M+EyXrtwL12VKTcf5hcENem6LyJzIFXABTBTl9C9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794589; c=relaxed/simple;
	bh=mitsLCWE/VFbluMtF6vl9QSqzCY5hp/tkOqkw9zHvXU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bELERpyvfKIToz4nLHfLUOgvOSKRZpY63X7QUZA3ap/dbfE0HGBDFyXpJnSHcM0p/sjgUwLebllmQNmK2AAWlt0ssEtm46gD+egEvBAn+fMz26f6flxyYXaIJ/VL5sXN4Kdq+KKdcbqHTBf9GOXoR1JaVa/gwoh3ELocstUU5iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O4wrEKT1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O4wrEKT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767794586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mitsLCWE/VFbluMtF6vl9QSqzCY5hp/tkOqkw9zHvXU=;
	b=O4wrEKT1yMyIubIR8u9Zilx+uh0u/Ec+pdKAAgT67oyo3nh6wGROTEOoC4hnM+WBKJz4M7
	xw7ANN2TFh5NqAGLDFFiYDW/XFnb9T+MP3bf0tPUzwAfIPCSUq0aVA34nEMJYFdAF71Vod
	DzQpJdOYcqrttURKPhq/l8S6J87jy7s=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-LxWOeK-sNOiADcFlCfeONw-1; Wed, 07 Jan 2026 09:03:05 -0500
X-MC-Unique: LxWOeK-sNOiADcFlCfeONw-1
X-Mimecast-MFC-AGG-ID: LxWOeK-sNOiADcFlCfeONw_1767794584
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6446ee26635so2975966d50.1
        for <coconut-svsm@lists.linux.dev>; Wed, 07 Jan 2026 06:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794584; x=1768399384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mitsLCWE/VFbluMtF6vl9QSqzCY5hp/tkOqkw9zHvXU=;
        b=m4r/kLU8fJG3L8brBiyE0XkvHlXs+pmiEz0BWx3qced9uMK5oIMODRVkhoCyPVpsOd
         zckeXgfSadajMInAncYwDW9KZY4nI4KDiwu5wpbcE33N0C11spWOVd0rh+3HG71ZfoXN
         +ozRnwHB72tXATsfl33FXFhiXXo6B3pBJmSBV8BNkSdea9FtRzDk7JQFisdjozYrS/pJ
         QQc33HRewuHL9m23rPEw6TlY2XZQIOLvyGUlrqZlmelRVfxth3PQebzkuTlz0zt1c2je
         6RSYDjd29Jy1WVTCEyaka8zN8Wiwj7kk7s6/QhDF1nBy+i5NPRehvoj97brD/kQh+alz
         AEnQ==
X-Gm-Message-State: AOJu0YxQWKlHwuIvnONI4MoeFax0hJ6H7hU+PlB8WaOdFdKdzZuMHJdC
	zD81+X9bSLKd6baSlfqTs1HU32Ec1Sh8OrsroL8yNFyZEMjDSqXhosDDL/X5s7X9XDeJmYzNoY0
	x7+dX3tedKxBgVRHL1qv8Tbrs5tr63WEC7EguBHVr/WJ7F3ZDgF2eHsosWThEXxBXZpqNuMASrc
	8UYRJZld7yOvOJ5/hj3TpIYNkNx3bAfqX7WIVIA5O/BNDWpKs7OMI=
X-Gm-Gg: AY/fxX6B1WkdUUBzh0KFguPpCRuj3AbB1TlhCuIq8F6zEJhQ3VqX/2A/ZOCk5vZh6MD
	udSvE09tieeDf7RtytoKlZKUkj6wcmrQJdq6pQwx6DTL0GXssrJH+e4p8HSZLA1VEKpj/oLYZCf
	vqotwq8cvYOc4C5xHYENQ/zGTCbt+2uNebQSz82HNFpK+8faOSkpNoEJou3sC0iY3YeFLNzlBkW
	7lmoAiNtcF6ObMDaKuhiN0Umw==
X-Received: by 2002:a05:690e:12c8:b0:644:71e8:cce9 with SMTP id 956f58d0204a3-64716b36fe8mr2509080d50.5.1767794583924;
        Wed, 07 Jan 2026 06:03:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFkd5YeF9NJ6eV2Aum0RnF7o00tVFdUidOfEMm/RDxOmnageQ/rx4w7WWL+XLeVBDotkmbSzn8e6smWnPjxeo=
X-Received: by 2002:a05:690e:12c8:b0:644:71e8:cce9 with SMTP id
 956f58d0204a3-64716b36fe8mr2509030d50.5.1767794583204; Wed, 07 Jan 2026
 06:03:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Oliver Steffen <osteffen@redhat.com>
Date: Wed, 7 Jan 2026 15:02:52 +0100
X-Gm-Features: AQt7F2pU_yV1wahFCe85vOPFPgvC3aoE6AVM7uohn1mCVLbbQib0EuTSICCBnD8
Message-ID: <CA+bRGFrHnTCTYAR0UjG2vC+AtrJAU2Uy8G_MzVZfOELh11dxsg@mail.gmail.com>
Subject: KVM planes branches
To: coconut-svsm@lists.linux.dev
Cc: Joerg Roedel <joerg.roedel@amd.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Luigi Leonardi <leonardi@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JT4LbWQIhUvfAowEjVvCMSvEb9MQP25RS1CQ6e6HOGc_1767794584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,
happy new year!

I am curious about the state of the KVM planes effort and want
to experiment with it a bit.
I tried out the KVM planes branches we have in our GitHub org.
I built Qemu and the host kernel from there and I am able to launch
the current SVSM with that. QEMU just needed the patch for MADT-via-IGVM.
But the OVMF does not seem to start. All I see is

...
[SVSM] VTPM: TPM 2.0 Reference Implementation initialized
[SVSM] [CPU 0] Virtual memory pages used: 0 * 4K, 0 * 2M
[SVSM] VMSA PA: 0x8000f49000
[SVSM] Launching Firmware
[init] COCONUT-SVSM init process starting
[SVSM] Terminating task init, exit_code 0
[SVSM] Launching request-processing task on CPU 1
[SVSM] Launching request-processing task on CPU 2
[SVSM] Launching request-processing task on CPU 0
[SVSM] Launching request-processing task on CPU 3

and then it seems to hang forever.
Is that expected? Do I need a specific commit of SVSM or EDK2?

Any hints are very welcome!

Cheers,
 Oliver

--=20
Oliver Steffen (he/him) - Software Engineer, Virtualization
Red Hat GmbH <https://www.redhat.com/de/global/dach>,
Registered seat: Werner-von-Siemens-Ring 12, D-85630 Grasbrunn, Germany
Commercial register: Amtsgericht M=C3=BCnchen/Munich, HRB 153243,
Managing Directors: Ryan Barnhart, Charles Cachera, Michael O'Neill, Amy Ro=
ss

