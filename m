Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540782F39BC
	for <coconut-svsm@lists.linux.dev>; Mon, 22 Sep 2025 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535027; cv=none; b=s/3rLTJL2THi9jLvi1FXlf3aUcU8eqsnykUSAxXfHAphjJ/Mli2v8R56ANuTIwkDAvsVY8fT2aEHMNL8HSSYh7i8MqL0B33rEADBemhdt7yH2z+1ONByTbu+ZJnecyaJey02k1hTmJVPlAgxWkslfs/l5jbJADmVCEfxGMy4Vh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535027; c=relaxed/simple;
	bh=cWaxL9wDkJ/gdN9qHP1DkOW1oeoLvxzHaKVR9800fDE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=DwxJEYYxstDOPdA5cCxWwDR1P3KnI0aXaz92c4xLdtDT7DJewQLK27YdX6Hx2ObBCwXbYE0qDHIxTowbnnelJMKqnH3zYSA8IRbLl0/eAV9LBELysnBGVSvA68mjSI0SFnKO/x/BaBf6F6Hx5VD312hrrW4VuErZX3DR8/c3jwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AXvWhdBG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AXvWhdBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758535025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=cWaxL9wDkJ/gdN9qHP1DkOW1oeoLvxzHaKVR9800fDE=;
	b=AXvWhdBG3r19GYBxHZuLVvTaWdudaZdYk1GP/rFqN8HLP3yQpqopWkzR6bCwHX+JXv3t+F
	Jr/yuJZ4camMUjT4SOMvUlobiSgV+9TQXZeEZBbZQTttS0OghxZV1U1rM51u6mPkbZLFCD
	Cn0dpAunCNirjNkR90vvS6+DGqeQUZ8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-weYH2WZEMraAFSvAXp5qjg-1; Mon, 22 Sep 2025 05:57:03 -0400
X-MC-Unique: weYH2WZEMraAFSvAXp5qjg-1
X-Mimecast-MFC-AGG-ID: weYH2WZEMraAFSvAXp5qjg_1758535023
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581ce13aso78407285ad.2
        for <coconut-svsm@lists.linux.dev>; Mon, 22 Sep 2025 02:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535022; x=1759139822;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWaxL9wDkJ/gdN9qHP1DkOW1oeoLvxzHaKVR9800fDE=;
        b=niFW+HIcS2QK/242RHJ1neckw7CJuSv9va6KJTZBbImMw8PM09lK/4zTiGQXSYl3X6
         0VBxX0byx9amMHWPpDK85se4kaRE4UmfNcJy0nMT7Ml2YpTBhkYOyjHd0ENWrbW6Lk4J
         e3RtL/3ahFmdKo+8FxlTLR26VLJpAIUc7g1vloE9zxwIwToZdkpN4CsUGB0lhhkFlV8d
         kRBI/6yFaoXpSfQBc6Ocbvh3mTpUo8FFx7BeGw9tAhKdwszdyTFBZPm5bF8sQA21GNQX
         bfEY1cr0Q81qXPNitkHKlABlPmKHNJA8u9PkKzoQuKLUk0IDfoVmEhOpc5ODHZi/fyXl
         eNQA==
X-Gm-Message-State: AOJu0YzH3oC0FlGYOUr4dBuslpv26YyEZAjq0J+xqYtTkHCVhZF5qPLb
	LfNCycKruVnvbHiIbcO7Mg3UwExggUsMC170kZT5zp+iaB1V5IXkChcbyyAGggZe1/m2+uEVd8D
	oEb31m5K/JuZ+9nBeCRRPwecosTA4sPqQHDdisefNvaghsP35VsI4Nvgq5UMmLbAD26vn2yvOzJ
	rp56WZWG2YQb5F6Wg26dpRqbSQIgWC56sm3KNOpNlKIpLB5r/KF7Y=
X-Gm-Gg: ASbGncvVbm2qazcvvmuNQEdpknGJbXOub95Y5Dhm9OFDVc3lyMknkKeYES9g4VbuqO8
	WRKKVWIJ2eizkjYOvlf8Te+V4o2dhtJwl7j4SwztABZ480k8Dsp6Wm+WVi2LGrfxURhUZdnBCQY
	azZB+VOszLJyAxwyQEzQ==
X-Received: by 2002:a17:903:b48:b0:267:cd93:cba9 with SMTP id d9443c01a7336-269ba5118damr143497635ad.35.1758535022597;
        Mon, 22 Sep 2025 02:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG6XdvGZ8WmCpki0vIUY43/4oTILcB3kXH8WPACXnvRVvA82nD7paRRfhneLktli/RybkRYeDNxBohkoI4CdM=
X-Received: by 2002:a17:903:b48:b0:267:cd93:cba9 with SMTP id
 d9443c01a7336-269ba5118damr143497205ad.35.1758535021631; Mon, 22 Sep 2025
 02:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 22 Sep 2025 11:56:50 +0200
X-Gm-Features: AS18NWD0m_hvSbKAwglEqo2InjXzbyXck7FUC7B0bZwRU6LsmSem9Ludog2J02E
Message-ID: <CAGxU2F7d=9Lqf7Qwq2g2Y5tHeBSDVFd_r+55p5qVNf-XaieOEg@mail.gmail.com>
Subject: QEMU: svsm-igvm branch of our fork rebased on v10.1.0
To: coconut-svsm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e4aSShnr6VXt5GlbSFQ0yzXW-M_qyv8zRDpomuEntdk_1758535023
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi all,
we just rebased `svsm-igvm` branch of our QEMU fork
(https://github.com/coconut-svsm/qemu/) on QEMU v10.1.0 + custom
patches (Direct VMSA, Rebuild ACPI tables, virtio-mmio slots, no-cc
support). See https://github.com/coconut-svsm/qemu/pull/25 for more
details.

Please note that vga must be disabled in qemu (-vga none) since we
have an issue upstream tracked here:
https://github.com/coconut-svsm/svsm/issues/811
We already updated our scripts and documentation with
https://github.com/coconut-svsm/svsm/pull/809

Thanks,
Stefano

