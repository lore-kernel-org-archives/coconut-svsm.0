Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489CA46A5FB
	for <coconut-svsm@lists.linux.dev>; Tue, 21 Jul 2026 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649572; cv=none; b=hAqvroXMqlrrBmKD2j3QDL/SBebsZ+0zsZLhmaBVQmeq6kyfz1bNqv+6p60Kt7RdmhZ86SNI59PDGyGDBSTCpKU1kMqWL1KJpfpsfsUC9k3Bq8rE8LqO6kuS0pKVoRYPhUaUByr1vz7CiL1381RKM/Lp67yZ/RZhluxdNnvX8PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649572; c=relaxed/simple;
	bh=kQ6MFm1RcBK5lthrtsS3tKwgEUgIjQSVP8M3aj6hNVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=JxAfBLA4wmZcQgtOe1u+FXDNos+dCU3U9YWL80fhAMEntZKWDMaYHoHttcR7lVnCjRo9yOxWJ3e3SxdD/ejSpU+E/rD9dxngMUaJ42fV+nfPdBkfj+K/BWhPOGztOG1JJKsBgGZHACOyv4HOBqTskaNqUarzGJ7iVzFhY7ZeNL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a0Bz5iwO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a0Bz5iwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784649568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=coBt7Zb3aZ3ZG0mTYJhcJ0JzfkK/zs88iplrFlJsbyY=;
	b=a0Bz5iwOsdFK1TBWd/HQDuJgFNkUHuxb0o0AykmzX6BFTFeBh1j1w09gyRdcJsC6fDOXYv
	KAsm0D/CRz/t1rI7DyzvNq2wSJUjDrtL7RU1UQM+kBxZWMTie65/d0bPwpiWD58OojCByt
	07l8MJWQTPdOPaKpaFQA84nqCBHeENc=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-f1hC9ZQHOr-DyfRe01wBGQ-1; Tue, 21 Jul 2026 11:59:26 -0400
X-MC-Unique: f1hC9ZQHOr-DyfRe01wBGQ-1
X-Mimecast-MFC-AGG-ID: f1hC9ZQHOr-DyfRe01wBGQ_1784649566
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e024d2129so1994886b3a.2
        for <coconut-svsm@lists.linux.dev>; Tue, 21 Jul 2026 08:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649566; x=1785254366;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coBt7Zb3aZ3ZG0mTYJhcJ0JzfkK/zs88iplrFlJsbyY=;
        b=C2GZfU17KWtat9jRjvo2Y5s5ll/Rchz1GzAh7IrKMu/ZfPEJQQ/q9s/F1qB9KIzjqM
         gLaBmsTeYY4C1W7sJo/4e+PZDP32zoMDi3hBFGSpx6PdN1mXSk0RLtOhXYjJgMIQn0C8
         SyhuUNWW+MbW7Ha+ywtbUcsgyNoGGh78oJZjwHvObMHXzPdAdHoI24DTASHyeWQ10smB
         Obsnyyqs+QXOnGqV3H9Cf802I8TgIPiNvL9KToGHXs5ZfSEiWwzYlnGt/CMEQrm7YyFN
         KQ3zE/5jpcG71s8knF4LmCRf86Ji37q7aNLUZyNh3MXrOhE3Zhptg0jzJaj6ref+PliM
         hnkg==
X-Gm-Message-State: AOJu0Yw0D5KyvtJeITBVBN4JxXeZoFM6BoWh6h4NAyWdUlZKpLoLV6UQ
	lEASblO4280BwJ/nrUoX70MDyA2FrHfi/X1dD+0GfhVrO8F94eo0QirNn7NKe9zhqjDCC7YnfY3
	aadynbtovW+2lFAfuepYwyiBiUR55fKNz8jdF5OeZ13NQnFjMiet2K80zkKs1ioqsBjoEzWkGI/
	YnBaLduIsRVxuBkbPoPU87bJrzpVvkSLFEAi14KlU0c1JL78KK
X-Gm-Gg: AR+sD113cZgBYmW446Md/hFuxLTRgi0xk5Hlrc/TKlnBZ4d5WVHRF5qjAU9jqKDbSZb
	lDmq+kBofo0iuKiBkI1+yaLBxOi4mZ8mGdcmZJmzDH5HG5NSDPi6sKVKkgwGBRve4zPFBYls9eS
	iEV8PRdPlG1lWJxsuBaYo/rPUgv197trD6mIWRjSC3PajA95rGe96+3RM=
X-Received: by 2002:a05:6a00:886:b0:847:e4c7:8ca1 with SMTP id d2e1a72fcca58-84c294d4d7cmr20505418b3a.43.1784649565616;
        Tue, 21 Jul 2026 08:59:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:886:b0:847:e4c7:8ca1 with SMTP id
 d2e1a72fcca58-84c294d4d7cmr20505389b3a.43.1784649564955; Tue, 21 Jul 2026
 08:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
 <CAGxU2F6ko6Ojyu138cB7szTszoYkx1AEw5oK6EMMaUoi=m7+sw@mail.gmail.com>
In-Reply-To: <CAGxU2F6ko6Ojyu138cB7szTszoYkx1AEw5oK6EMMaUoi=m7+sw@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 21 Jul 2026 17:59:13 +0200
X-Gm-Features: AUfX_mycc19fDRYGIXFAJUJP8E2TJYsiUEBl2zVyI5gpeplWRXhlWTC5mJZQRWI
Message-ID: <CAGxU2F5EtQ7tnF28i3Z3onJYMf30OBCBCz9piTinK013sh+Eig@mail.gmail.com>
Subject: SVSM Development Call July 22nd, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qmFQ91rzZm9_nAQ3hnvrDOPMZIwO6bxbrdyfD4zlWpE_1784649566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this weeks SVSM development
call. Please send any agenda items you have in mind as a reply to this
email or raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting can be found
in our governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,
Stefano

