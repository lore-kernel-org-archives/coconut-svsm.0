Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C96A36CE1D
	for <coconut-svsm@lists.linux.dev>; Tue, 17 Feb 2026 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771341197; cv=none; b=U6WFzIrmlldILCqQvxw9UvL5SJPaMkg/nDdpY3idmD6DtdS46A2kNBcmrsgkB8V2E56kcIFp6u/iwzDWZqKJtmH1WUIlwPR4GhlosmqqLf4FNvajEUpe8/4Aag32oPNM3AoiKg2pYUqzvHhfDWizsV89rsrjtS+XgeT9jMQEoho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771341197; c=relaxed/simple;
	bh=x7Jhsu7riKN4ta1ryX5N4I7XT9zPxImuZI9ZDeN9mTw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HdmlhFz3BiPcsUgIjJbr7yDXirEhW6PpxDw40i1aNDCstAkJdmQd1/zx4tzNwjx2BnsCtvPFdlZxSCPjslkfDZK8PjoFYzDckH8sXhEygiKrAL9/OmteQpi+HId82HUHkoP2aO0UvF2ItOvaRZ41lvAajS3Qo7bwnxgeEuWJ2NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gjyqwkas; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gjyqwkas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771341195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=y/WbQo1ubRSbNIyu57pwb3Zf13D/n/SuzWSZhnLxsFY=;
	b=gjyqwkas2zu9M4E1Ucy6RtTMZ313kk52LOrzvPzqmpWVxp606o5xByLjG3f1ZLl6dyNaeG
	k5JTl/FcQEtgfCg63n6LSKWYkKmmlRwaYqasOjDEs9QYwos4jsoe/N+XF+wIZ1F+LTBXn9
	zNRU1C0eTOtBss8r/4XEdPqYRfIAGJE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-OxDc51_tPxez0h68tR5wAw-1; Tue, 17 Feb 2026 10:13:14 -0500
X-MC-Unique: OxDc51_tPxez0h68tR5wAw-1
X-Mimecast-MFC-AGG-ID: OxDc51_tPxez0h68tR5wAw_1771341193
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4837906e9b2so40490555e9.1
        for <coconut-svsm@lists.linux.dev>; Tue, 17 Feb 2026 07:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771341192; x=1771945992;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/WbQo1ubRSbNIyu57pwb3Zf13D/n/SuzWSZhnLxsFY=;
        b=ieGHarsVh66me0g1NrRi2SEyPDl5iRW9m/f3Ehh2gLrDYXpq/0E+dNWEqdGe9ffVQp
         6w+GyBFd/BYLTP3Codxvxb+Lsp+TfIa0k7oyJFmehlyuvTMAkpUeMqBuwJicXZjvvkUI
         33FLZ64otQkeGwcvA16WoIDgFWR1GNqFbxpoejtiFV5Wjy1f7FHfwtBdIaCcAKs4ckOy
         aM40Re0csIKypZeBI2FJzS3vNWRwCVISCcJc+i2FkNbaNMNLz6jUS7vZvVJAdWD0dWfV
         y3aN+LOdV3z5OkIgma9cyenM+RtKtXg1UyOX/4p3FbZXOwMmMpkHowlZs78WK5U9g77r
         0J2A==
X-Gm-Message-State: AOJu0Ywukw+Jy5ODPTxmcPGfzCzOK9SsaaoLF/L9wa6ia4L+02sf2UGV
	kAuxomwjdA1JuaYnY2Vbk8TRFi5Hs70nNLpTtkwo0wYBXY+4Nl4hcqGSZh+z4K9fLMz//agZ1ty
	k90EZer61ZhzgDnwWSUlMywGrzjGcjxoaijOQbmJ45xLzcsGd1GLJSws2y3MXy49604lTqQtMzI
	FaJcZyx8nDNxCam8skBROQb6MY2XPKqiJuwv/TbvyAs9caLN7/iA==
X-Gm-Gg: AZuq6aLZBz2GX1JPMOg+Ip2nctB/q/GFq4Zzc7uNGyXYP4yVhNbaGm70vgSI2RlgEF/
	qWKbPyxSemDsD7emWEP6lCZK66+W2HQKpNmEcZ6D/yEulixRpAwvJLwD1zdOr+Cw8uyPEYVfqGK
	/6DD3dwqmEGfuzW6cCCc8fvJkMeRggbbIQsfmjpiXc7E3tns3f2x3/yhjH8tU/iq+ung8NzQSZi
	hoaPi65+MSOQlVcVmdCZ3VpDwLVf2ecxpuaZ8pvvuwY167jp0Eub5FCXjUF1GmYcZGTDhK151A/
	D1WJFw89ElcVFJMzpEL//MP9txJYph2X1Mmx/LHr6yHBelCy9F+4QTAikXEYTNGYDao14QfVdPI
	rqxu71efoX+MfTB4MO1wIYdqO0FqRlID/H0RxPvBHRFTacLmtvxCXG5WzIE3WJ9PWAortoy8=
X-Received: by 2002:a05:600c:1c22:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-48373a786f3mr262279595e9.33.1771341192346;
        Tue, 17 Feb 2026 07:13:12 -0800 (PST)
X-Received: by 2002:a05:600c:1c22:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-48373a786f3mr262278965e9.33.1771341191676;
        Tue, 17 Feb 2026 07:13:11 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm32899940f8f.34.2026.02.17.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:13:11 -0800 (PST)
Date: Tue, 17 Feb 2026 16:13:04 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call February 18, 2026
Message-ID: <aZSE8XXPM5NK91rd@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kcxQSKmVToJ6Ydngr6XbzFLQtIxvbvEEFFVvc1nRLYg_1771341193
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi,

Here is the call for agenda items for this week SVSM development call.
Please send any agenda items you have in mind as a reply to this email 
or raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting can be found in 
our governance repository at:

     https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

     https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Ciao,
Stefano

