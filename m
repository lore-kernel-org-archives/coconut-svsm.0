Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D5E2F5498
	for <coconut-svsm@lists.linux.dev>; Wed, 29 Oct 2025 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761733115; cv=none; b=LUswTIfSjFUQzp5pB0LB3VGXjRLiGrN8jzbY1bIfVAr3j8ufUrtHjRfZ1aAppKSbdZVBMVB6WaaWxEaXPaKkX58YVqU4UyrFtDFsLSYozZ49l1RCdcI4gKjkipABJ186yvY+iDI0aBtloDMDRMhsnfQaeL6J8huhCg1aflXBPDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761733115; c=relaxed/simple;
	bh=hET7PW6PvrxXSRORLCjDA2MF0YdZkenclts+BXLGjaA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FjcuKfJ9fKzLDh+iq2uPhxeX5IsYrqJuKIO/Df8x0GFVjZ4AHPZ+taKJLgqiR5siIwc6kB2dRiX11wAjS0RyBIKwsJ2bM0x+K6Cws1+yRxrKcWeDjJY1wFjbcK4ro7H4YF7KNlFwT0AdMi8kb8GSuw3lSlTV0D62GjhEFotkeAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q3T58vMQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q3T58vMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761733112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=hET7PW6PvrxXSRORLCjDA2MF0YdZkenclts+BXLGjaA=;
	b=Q3T58vMQ6Y6jr4fa2uN+81qtrgh8nRqRiSXf9wM44kHdRvSRDv+uDxa8b8xUdTcZfkJl3m
	L9AxVRL8BnKBe1+CyfbB1JnDaFnoW4ztPLEcpv6p/aVPCv9il+j91ZmrKN87x+7dKxFnzB
	f+s1MQzREW8cbjZ45O7KRm7ts4MeyuI=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-YRwHicMUP7CkJ7Ux0bq7hQ-1; Wed, 29 Oct 2025 06:18:31 -0400
X-MC-Unique: YRwHicMUP7CkJ7Ux0bq7hQ-1
X-Mimecast-MFC-AGG-ID: YRwHicMUP7CkJ7Ux0bq7hQ_1761733111
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-783cfa3c7a4so90078617b3.3
        for <coconut-svsm@lists.linux.dev>; Wed, 29 Oct 2025 03:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761733111; x=1762337911;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hET7PW6PvrxXSRORLCjDA2MF0YdZkenclts+BXLGjaA=;
        b=OPRulxTpL9oto/VRhm/okomjrtoJ1AAIAsgoCVaMBD9j3cVNvJcAD3RMpHlTSqIMWE
         fHMacfE4oSktu99vCcUrDbByXlXuc336s/tmV4Tt4dM8VeRnaVpWQrOoTZEMweg+gnls
         IP8C9LooFtFOlueEMot9xRyTJUMomGZfkFf5HGaf8lCs5ep+G4kayG+wF0vpEgSqRnOR
         DAfDMqRmzDsjCop3TwhdYwECpX7QF7TCauMdkonhIBNg+yPia8N0j6J7TcydnUulteY8
         /4ia1beGSfBHFlQaisGtO8ho5Koi+Z8Cvzcb8gneU57wEHyJVTvMpIHSg/aG1C4kjuIV
         rsTw==
X-Gm-Message-State: AOJu0YyfyizpIZmYxQOEX4Gs6t4MuGRvCqi+hwBqcWStrQNjUGjNRcGZ
	3JYaq9d28fusgeGJ44A6GULYwcO7jcuht1M7wo2tTuE6+HQIEhBXlgvux9UCMS52mAd45dAb01q
	TmE73JMw2STcDfHDJzDG03Jmnb4O62IbEElhW1WonuqjkyesUt5T9i+BS3x6p1G1sC6QoPfxc9y
	vEt+tHgnkjVUFckMkB3GzkrRmzM7EQH8k9ZwAfw7Vz0WjCWkdtirI=
X-Gm-Gg: ASbGnctkjAfk5YV6us5wY80eKaKi3QWbRtVs9Jy22+1AbMOfIGSclMeUg6+kbaGMzhV
	cWTSD5XhHuGTsn1GOBmlp4xpNy5xjBQjhMJeVlMpJKO3D2mtfYyjkN5O7cDjfceDCKOkWeW3LNO
	YNeT6gC/XFssYOS8quVbEhCH6cWhX11APHoaAeqj6KKhfF/umRlChLiXc=
X-Received: by 2002:a53:d6c4:0:b0:63e:2a71:83b9 with SMTP id 956f58d0204a3-63f76df79a7mr1739748d50.65.1761733111107;
        Wed, 29 Oct 2025 03:18:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA0MQfn8bUpAZQ70EeCNJrNdVJsSDqaQNUkJJZVV8kaNvBsoBrMnna8ZWydDf0FbCA3M3oLcbDA8wqEsmceXU=
X-Received: by 2002:a53:d6c4:0:b0:63e:2a71:83b9 with SMTP id
 956f58d0204a3-63f76df79a7mr1739735d50.65.1761733110728; Wed, 29 Oct 2025
 03:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Luigi Leonardi <leonardi@redhat.com>
Date: Wed, 29 Oct 2025 11:18:18 +0100
X-Gm-Features: AWmQ_blZsP6mg33EHX_vJJoxhv7zjW6quFtTSoWtskVgyQcoDwqEJSBYtmeAkiY
Message-ID: <CANo9s6mCcXce7xhzYvsixURCtWxdwkxzxKrQvNQ78s6hfc_QHA@mail.gmail.com>
Subject: coconut-QEMU IGVM patch
To: vaishali.thakkar@suse.com
Cc: coconut-svsm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _yFgJiLdgTKXpALxiEgJkB2za5Kd2Ee2fksoeR4bgYs_1761733111
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Vaishali,

In coconut's QEMU fork there is this commit [1] that, IIUC, is not
available in upstream QEMU.
If so, is there any plan of upstreaming it?

Thanks,
Luigi

[1] https://github.com/coconut-svsm/qemu/commit/d313e671e547927919994a82955a46965d45e72a

