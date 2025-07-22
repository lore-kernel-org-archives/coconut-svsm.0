Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA43D2E0417
	for <coconut-svsm@lists.linux.dev>; Tue, 22 Jul 2025 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180234; cv=none; b=KFs0cX51+AXSe0cvN7H6RuKmTbx3he0x4M+zc7AtFMsAiP6vg4F1wJHoZWOQE1bPdRIeyUx8Q/Q3nlfyeJpAlJaxq4eEwCijR2jeIoKd0n5ZVjsv2dCTxRTO2iP2ITXpgglOWBnjC+WqkRS9Kf65hfD0tJA7LLO0+Ax8SbkLJWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180234; c=relaxed/simple;
	bh=ChJh/7o4qBTZcSBIm+hTx2YGgyQWOtnJzJ9nvD3uRcM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=t7Q6OgbooFT/cDZf8NwM/F3YPWYy7ieBZp1Xg6y0Nuw/ro/FPJ7mrnZJK/OzQnzNPJBTmga2EbNiAZpWOVfn2rzO1+N4OhHRm7GhPDvJwLlUvX+aXhtE45Ik7O1eMGsGopcm8JKxYe7ugrnG47Kk6SRymnLub8HP29plHyfUcpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IZ3qeP4m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IZ3qeP4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753180231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=1PWSG96QyOjE4owvwQsVNEPGnP0IQkpyBAmhWlD7W0g=;
	b=IZ3qeP4mr7UuHZbK0yQHg9uU8DGGLQDuUbRP6MHv8eG6F9OrJi0BCsiEre+bPjEbWjB6gb
	kSbVUekczcklx1vE0a7cyKpniRXIXjWXxVVmudeau4fGUQuy+Iw6L869oqKA4KG4uyXZIn
	w7ll1FsV1bFUHkZbVfysS42ykbiH5sM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-e1hiYiWjOKGqtxCFjJw6rQ-1; Tue, 22 Jul 2025 06:30:30 -0400
X-MC-Unique: e1hiYiWjOKGqtxCFjJw6rQ-1
X-Mimecast-MFC-AGG-ID: e1hiYiWjOKGqtxCFjJw6rQ_1753180230
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-70e72e81fafso75399737b3.2
        for <coconut-svsm@lists.linux.dev>; Tue, 22 Jul 2025 03:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180230; x=1753785030;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1PWSG96QyOjE4owvwQsVNEPGnP0IQkpyBAmhWlD7W0g=;
        b=Cd61AyVtYk4Yej4rd/HrzseXnkiM6LRDyVHpktUozmeFJ6svkH2V/lRyf6l7dQEGH8
         cHLU46SoVgf+blhDGsxMRWVatGfGv8KgvjfNQV19fp0XdZ/C2skePUN+6Gx05VErQk++
         y2l1PEQOLZWv4IUyFKQ+IaVHdT20M9S/CDhk9/60IV42HJRBYLlswfd5LuiQfPNiorWa
         5nZKzIO67w5pSVQN+CkKkz7zSt2+2gpSThsZNWDa5Cs7p00DIXIgsczrBaDdYXygvc3i
         85EVgefvt8xqYHXuoQtXZtSrjFwHO+KNs/ngnsBDWMsEYGTvv2bfwplvnWiZUvJG8+tq
         2lxA==
X-Gm-Message-State: AOJu0YzJ05f+vI3t+YjbT9fdSG0c7swbnbK52V2RzcHdKjWMoltUMOcU
	iAwwjnSiAlTk/cGbQ6Z95Ow3dg1Jbw5yedxSnbBl9mL702JpTp/8UXfJJykIAjJAMQj/QIsk75x
	1YdpSodqQORZUY06zjkNHiHkxCJ55kU2fgfymhqS4wkzVApfb02GVIeRy42LnfzJCsV8Lkn1rEJ
	9CsM6bdVhWD+ErinUj6LEKqSFvaooVTxMVCb5d3dCiS1YW6qXv+TUsmQ==
X-Gm-Gg: ASbGncshrResHKfkMQDkKREF2WtnPcUcP4Pl2FrmPTN6wrdVlphvTIhWHqQI/1FxMCV
	8y0HGg4KwayF1yPk4d+h47JUIs/FXhniaDt7YZ+Qz2rWmX5dUtXdmiDnZwJu0r2Ogan1Jy0+wK5
	sKwCQwRjZo9tPeiLqL+rVA
X-Received: by 2002:a05:690c:4989:b0:719:61b8:ffd2 with SMTP id 00721157ae682-71961b90322mr164461487b3.1.1753180229332;
        Tue, 22 Jul 2025 03:30:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGISDj5C7QHitDo4ATVH5vRi7lZDrexxwtfIhcGZNLfMb5GhNTevytIb9PPu58RVgHrqfwlfE0i3d5FqcfMq/4=
X-Received: by 2002:a05:690c:4989:b0:719:61b8:ffd2 with SMTP id
 00721157ae682-71961b90322mr164461067b3.1.1753180228718; Tue, 22 Jul 2025
 03:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 22 Jul 2025 12:30:17 +0200
X-Gm-Features: Ac12FXzQ0rxSkYF0t1okQw2sypqfB_27RzOI4fxyBsvNGLGDP4_M5bxDV3Jm9iw
Message-ID: <CAGxU2F4ZVcj6VoXDnjo6ik4Oy=OY1T9Cnw1WYB5oZvzObfEuMg@mail.gmail.com>
Subject: SVSM Development Call July 23rd, 2025
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Cc: Nicolai Stange <nstange@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xj5jxfj-aosEFUm3FucBbOWdS7ga6HBnnKLvoP1agHU_1753180230
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the usual call for agenda items for this week's SVSM development call.
Please send us any agenda items you have in mind or raise them in the meeting.

There is one item on the list till now:

    * Discussion about persistent storage FS: CocoonFS proposal by
Nicolai Stange


We will use the LF Zoom instance. Details of the meeting can be found
in our governance repository at:

    https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

    https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Ciao,
Stefano

