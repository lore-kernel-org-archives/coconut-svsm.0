Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955982;
	b=3rtkMsFDqfIQgzbp3sEh+SJ2ZearqR3GUnf/8MP/wVr2LQz/mNsi/V3R86MxuGtw1siD
	 9Mg77TJPXtv6QqKyoVJR1uTzyRIQy8TpkgD+yKz180NFPmgRHXzXWdhgOc1HSQKZG8YHN
	 ZS6/vEQmeCuNS2r/4CjNFMKcTwPnN1/y7XPc3pRp38jWe+n1A6Omh06b39Sp6UfrkLGVj
	 05KOy4zFlQgpAJ3zEmNxDMk8/9DZkJnCyD1OoSsNGoYK65XrqjvczOGXMlAyiYpjc8S4+
	 Ux9X2UWYdzsR3dYw4HX0zwu3vTesWxmLgaO3skzyM7Zs39bckWp+0iFSNJpOjX78mBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955982;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type;
	bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
	b=4nLlP2zJkthf3suUPHZWWEHGwwEl/DtFeBWWW7ciaeclXlO4Yg3BjHt3d1pKdQjgC3d9
	 j2dk5/nhudFrIrWzffIeJyYWxQsvm5HOVnHh0al9JGHPPQ+477VeRKpIgi1xqerq+nCBR
	 h90/X6qvvLB75JrIpIvq5yc5Nh8gfA7oQG019RbBetgSepNr7YyhNSfL/ubq3zynPhROq
	 dwGLuOw6plM3r2Xp0J/fnPJ3kIBPSedmU1G13p0NZY7ddoabccjt50fklXLcdSIcN9sKE
	 vP2AMuvm0RNKcphiBPqzeVxQ6ET7/WNKEsVtZ1uzjCwhlscyEV3xs2k4YHgUlnKJAYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gM2t1aNa;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C131606A32A
	for <coconut-svsm@lists.linux.dev>; Tue, 17 Nov 2026 22:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C131606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gM2t1aNa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794955980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
	b=gM2t1aNaBrFhQNQuqFlyLnfDx6vlIUyPR55lVRMd+ki/E4KMOwh27+4suYkqEXzhF1f3ep
	dY3vrpSvKXnBUMhyIArAGqN67gz3St1KpmKt449cDcaK2T4A4EduKC1DC55wHpf8KONGTX
	qL4KGBAoPvSSa7lhUdNlQFicTu3N5mI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-RNJ41AV-M0KbzYXErtj8og-1; Tue, 17 Nov 2026 17:52:58 -0500
X-MC-Unique: RNJ41AV-M0KbzYXErtj8og-1
X-Mimecast-MFC-AGG-ID: RNJ41AV-M0KbzYXErtj8og_1794955978
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9995cea88so2111915ad.0
        for <coconut-svsm@lists.linux.dev>; Tue, 17 Nov 2026 14:52:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955978; x=1795560778;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
        b=DRd+sS4c7SKDX9kDxYosZnjIsjr3ximBuN1IChlSBqeYwFmZ9Bef2M/dAC7EKlviRY
         PymKEmjbSnQJ9BAWmYGhMkHWI5pyD0JM7S10LbAGruhuZaJ22+xg5DkMcHzwlhE64Fvh
         +UQp0trFqrMrMY9pFIpLWD0/GWn/1+TbHLg0OzXO7RKGzdiBnBlkbXVp7TGcnumLsyWd
         TscsKjJEgFIjvaeTwWtdSH82UF+vnDto7webeLTIBB6WV2ES/9EAbV4y5PQVjatcvoWs
         fiakLQuzXAhzYt4Rb3ypDi/N8d1BrcNy2BnC9sxxiNCTfhszJrs5TD4PUMN5H5NdvwDp
         YuvQ==
X-Gm-Message-State: APuU4Z9oOkpLPpphWP8y24QCMxSheChw6ZLd3BSYt4YxoUQ+zauTThmp
	AXlSRR5UY3tgXHd7yHBqnDjTMj1ndXsAlqD7aeI6HbQ+HlObsHiZPbOpeHh2YCLbNkcHmiofBgl
	2ssSm6SfrTygFFhB8U/e11h3wVLYjeUH+kiVN+TXuaGNYoXBnbudVJFMk/XuBfII86CwL/ND0yo
	wYiJbb0x84wfij+JDupnoGrjxvmTwcZFzqCvsZ3B5NjGRAD19o
X-Gm-Gg: AZFdTZfMZ+h0cNNh85WUnG9EwRQ6yRjwFX9OnWGdItoaMC7zia71KxkN1pnt06w51vz
	9dGuBhZqD+TonuNYhe121BFS+D4oSJDgHnSEJcK81Djo4XjHBihb842gIahkOHTR0XvzhJ5w6oF
	6EHwe/J1O+uwcvpqfi544UMojOINbYLVievkF8DPIldhgrQw/Oczta3iz27w==
X-Received: by 2002:a17:902:e790:b0:2e2:dfb8:818a with SMTP id d9443c01a7336-2eff7574cbamr6491225ad.62.1794955977583;
        Tue, 17 Nov 2026 14:52:57 -0800 (PST)
X-Received: by 2002:a17:902:e790:b0:2e2:dfb8:818a with SMTP id
 d9443c01a7336-2eff7574cbamr6491025ad.62.1794955977016; Tue, 17 Nov 2026
 14:52:57 -0800 (PST)
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <aqlXypyTlhuLRVmD@8bytes.org> <CAGxU2F4VaSUGe7QkhqCm2=AzcYxzZqgxm+yjk=QTRkUTxq_3Ew@mail.gmail.com>
 <CAGxU2F5=Yh_ywLJ0eNAeL_Cqa6LNeThN3r8upRKaXs6ZBed+ug@mail.gmail.com>
In-Reply-To: <CAGxU2F5=Yh_ywLJ0eNAeL_Cqa6LNeThN3r8upRKaXs6ZBed+ug@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 17 Nov 2026 23:52:45 +0100
X-Gm-Features: Aa3M54pcHnE_FTFiw-y6-U_ScXMFc2hV4sru3RD4iJg1cE8QPWLiZ53h5ZVvcnQ
Message-ID: <CAGxU2F5pif_d6ZNca=CovuD4L359+t21mMNqYEcOjd_bAcmqag@mail.gmail.com>
Subject: SVSM Development Call November 18st, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JPgZXn0SW8yj5tJduk8ehcaVJaVn6uTRZs-yMVWCjRs_1794955978
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this weeks SVSM development call.  Please
send any agenda items you have in mind as a reply to this email or raise them
in the meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Ciao,
Stefano

