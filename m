Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4E27A45D
	for <coconut-svsm@lists.linux.dev>; Tue, 27 May 2025 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748360993; cv=none; b=ZE68XZiZmfKPbNHzbAkhy06OdXxjr/9ufjhGUAro8MAQ0HvU1gNXwfYFucw+7icOskZqyjMl7qXJjyaW/Mq84I7n2Gxk+miFrGIygilledRWS82I0TJyqNlQqAS7eAeypfxu2YnPq9GdWrsY2YEqdBywj7DqPIE7Pz9Trbc0Ykk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748360993; c=relaxed/simple;
	bh=yShCBBLRkIFxQZxNmJvNsxRiK/3/0s0yLPvxyo8IwfM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=b16S5LML8oess2HSbcl9j1l9gOxqcSUdSgoUKRsI1js5lcNAhh5Ke56jppzDe2MqSauUOTIEUsQTjrxLWWKR5ug0ISH3lLe90Kq5nBmAqOWJOHK0yufi1X4RN7lzCMlIRXbdWyvnG/gM852kytksI0jbhlfYnupN41L2La1tJeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LKKFWsg+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LKKFWsg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748360987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=WZGOJLeYIZIuNyXycDHmcBhHNeauZyZzpVAciy5BvY0=;
	b=LKKFWsg+HgqIZubhbEMrXrvrhdJVocM//MOJ7oED7Mfd9NyOonvx0hpjrWQOPsG1L3nPUn
	GA//NFS9nWtdHlZmCEhGRg3s4/wJW/XzTIOcnX3cvESCO8HhWpiGfw1bdjrHln5Ap5C1Cq
	Y96dUX3FxGVTwW1gdXCSUiqQD4Qv8yg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-GpdEgmXaOmyCbEQNwy0z9w-1; Tue, 27 May 2025 11:49:44 -0400
X-MC-Unique: GpdEgmXaOmyCbEQNwy0z9w-1
X-Mimecast-MFC-AGG-ID: GpdEgmXaOmyCbEQNwy0z9w_1748360984
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70e620999a5so25780607b3.1
        for <coconut-svsm@lists.linux.dev>; Tue, 27 May 2025 08:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748360984; x=1748965784;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZGOJLeYIZIuNyXycDHmcBhHNeauZyZzpVAciy5BvY0=;
        b=nBH4pc9dFuBXkKJ1RQAEJS9/OeA0ICCQEIIpaHVb+DtS6HGW+CApyL/phrEPH8PO7l
         cwxYoUMF6Mw/eW7ZBUzhGtKrLlYOvr103B3Q7O3HAjSjYZdDwf1UHeT2iJpyMM25+oNu
         a8XZ8wV4f3ctY2NvvYAzwZscCqrkVSZkTivVjGZBEwyht1QSfsKEZ9OYIkRbCC172ti3
         PbxusTlXti562r2/F7FTE3r2BKliZMzlEQoqBQ0rxKyonv+UeK1g33fBzGUGVTmX5yPY
         2K7A2VtIOk9v3R+pzizJa6oJl+3UjroGiwC6t8bMgwvdKgUia/MudxBgm/p6Z/3x/uVS
         uyNw==
X-Gm-Message-State: AOJu0YyPRv7hNvhHJbNEqP1msVbl3g8GHLhgyvNhgceEL1v2rEi13Dpk
	QDqbTIILWBB/+c7xIsKku1EYCLcuJPBJ3/iDp/OMWpDcVxU2Kek0jz/xLJCCEhvbwB0qMQjJCxf
	8nQHlBKSFFeT1ahxsEga8ToxntqLrAw1ufA5bF/b2aTJ6Lticag28t6ZkP2GjrwIadR9dNV/652
	URad2RslxX7K/qdKeguGVxzBrJqDu9ap9JHRMXv3Hm7DquOg0x
X-Gm-Gg: ASbGncsX4UjTgVCtgxcSTyXoIjzeZKJNkFVNdJv9rWqWD+aNsneod+HaMBW7DuLWq6W
	UXLlFTv4CipeLtmTcu+s4Qdnd3C895gtcqX3NxbAcnoBcwqg+rupwShPmIDx1dVIucjo=
X-Received: by 2002:a05:6902:100f:b0:e7d:c9f4:ed7b with SMTP id 3f1490d57ef6-e7dc9f4eedemr3087841276.1.1748360983869;
        Tue, 27 May 2025 08:49:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiWyvITgJL+J+DThBvUtJX06I5LZ0wJ4xX7cXWNpyrd9yE+oA3SbDhtVDmFlvtI+97dxZWuXgvdd/jvC793zk=
X-Received: by 2002:a05:6902:100f:b0:e7d:c9f4:ed7b with SMTP id
 3f1490d57ef6-e7dc9f4eedemr3087813276.1.1748360983464; Tue, 27 May 2025
 08:49:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 27 May 2025 17:49:32 +0200
X-Gm-Features: AX0GCFtO07OFGCirVhUW5Z7V4STVi5G09xgnk1wWpqEEzNAmpai1tl4PiZ4ZEqw
Message-ID: <CAGxU2F6wv3QUOD=Ji_Y1aFqpwKUKhcHsUDCdk2uy79DgrvOrrQ@mail.gmail.com>
Subject: SVSM Development Call May 28th, 2025
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RmItPeVjjBNKl1GHtV2r9Q4tSKDKmKaHtYg58OcdeDE_1748360984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the usual call for agenda items for this week's SVSM development call.
Please send us any agenda items you have in mind or raise them in the meeting.

Details of the meeting can be found in our governance repository at:

    https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

    https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Ciao,
Stefano

