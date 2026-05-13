Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CD53E9C21
	for <coconut-svsm@lists.linux.dev>; Wed, 13 May 2026 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778662556; cv=none; b=DZt994zgT8oCU1fOVHV2fxkfv21XIphugxMGNAYFFwP8AYvkWiZpMR94wOzh/7b5HJRVjVUFaKEDrNBnqtEeJUiwnf/Ug/hIkNcqwTrCll23UcM4f5jLwUjissQK1MsGkHtGZ9O+XzGJQWnEVOCDmYLNFP9JW1s0a2KGI7HcO0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778662556; c=relaxed/simple;
	bh=hBD1ZWsr43GWG1Rfk/rimkZLIga2SViU6lS18d6l9ow=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=poe13hzPlIhe0SIlvl+VXs8WbxNHRs9HjnhUL4fMqaIK0/KKpWsFN8bQNTzaeZVDmpYbwGhSkNVBg6ou6BI4ryLDxoydKdS0xeixuXr+IdbMJgg35sz66pJBwS0azaF5D1VX+0G+tlV9ripPlVzObJuWCjcqUjTZuoR/6xF//AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JZXB7CbV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JZXB7CbV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778662554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=XLQbrhIr0963Qk0F6MawCFQSHclc4ilpbEWSJwG+31s=;
	b=JZXB7CbV5ihnbRbYvQjwugPOwXq1iBGqUtk6aDgXPRrzkChFxpdwhhEfIP5MK6CWaoDvWq
	yW2utsBz4LimLK72MIuMveu5PQKx7VdevNBiY9oJOM1elTfl0ke4t+ehvraGiLDSWXnxjT
	+MK0PUfo8GelTVUhyGVp6AAhNFsrBz4=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-ocuq-usEMuSyBV-dv4ak7w-1; Wed, 13 May 2026 04:55:52 -0400
X-MC-Unique: ocuq-usEMuSyBV-dv4ak7w-1
X-Mimecast-MFC-AGG-ID: ocuq-usEMuSyBV-dv4ak7w_1778662552
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-65d8659ae23so10877306d50.1
        for <coconut-svsm@lists.linux.dev>; Wed, 13 May 2026 01:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778662551; x=1779267351;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLQbrhIr0963Qk0F6MawCFQSHclc4ilpbEWSJwG+31s=;
        b=n/gOEDhKFnB/I71uu+OtYg0bQGeODxFu0q5elMr3hOqOfVhDrwGa/bAbi/CVhPBUlQ
         /iQeh5vmE0ki3snFOpDcCr23f6095N2RyKKTyy3Tce/dOzM8ksTHjXpOhSe9wjtvXTRX
         fUYArhZep6N38xN485cNybugMFJJfgoF7RJFS/3XBhuh2ISWTe8f+QOFZYB166GhHtJw
         K1BEthw/0y3PAjlDfR5a61OpraEkz2j26e4RZ/FW//iGlCkHUodjbUE+odVMu/aytu3Q
         OVspIBoegvGkp5/S1+2v5nkJvX/BXZADx+ZmqQ2UwMLi6a3/1Rj826dqjfZZWP6NYR+S
         kxhA==
X-Gm-Message-State: AOJu0YxeG/yPzZuhdGiipLBzd9PhYsYZ0T45r6DEobn5bxbvi+ihl/i+
	cXAVx6CBDaRicWrxizUe6qLM4cscoxVaAfmIfojJWi2cVyTSugRTvu0wCgOrAWqhIgDfoHxCHQj
	gnkCL0jFzXTGwx96RtQmCRe5XiAfkOzV/EVlShsJFjZL90TMGsdniVM3doFDxhy6C/KFyGLLVn8
	FDxKoNv2LWEkRVnmUulcjcHpgiBybDIE8q12Iyc9bDL2RlNC9ub9E=
X-Gm-Gg: Acq92OH8EQOds+GfdIwAmi/pNXA7XLGkQrBW1o7ZhtjmSHS+MxZAvnK6CHhRNBL7Vs+
	doDrs1KRY98H40O5evdAcyn4PlW7rhWAeQxR2zoE4lMmmgmFc7LlDNcwl4AI1chKGeCPUCRDnPK
	go7BiBHbG37AZ/BNe1gXwZNfDMkH7MY+3Z9dp6sfY7RGIeTZ0EIT3+mYDsd0t3c1WC27zwPiniE
	Cqj9Q==
X-Received: by 2002:a05:690c:389:b0:7bd:6a98:58d3 with SMTP id 00721157ae682-7c69ae4a90bmr21121197b3.18.1778662551070;
        Wed, 13 May 2026 01:55:51 -0700 (PDT)
X-Received: by 2002:a05:690c:389:b0:7bd:6a98:58d3 with SMTP id
 00721157ae682-7c69ae4a90bmr21120977b3.18.1778662550548; Wed, 13 May 2026
 01:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 13 May 2026 10:55:37 +0200
X-Gm-Features: AVHnY4K_i7cOHtxXY0lcT7DvYvBWtEmQ-EfdW_s3DJ05SKwficAC7qUkXSIBD1E
Message-ID: <CAGxU2F6Dqfyxo4Ydn-yP_4ahuUtMuzu+P4NgD0Tz6RzwP+Vv4w@mail.gmail.com>
Subject: QEMU downstream fork rebased on top of v11.0.0
To: coconut-svsm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GRyjLeFqJ09i6y1rSRCTg_txYy6JkWzqUW7-umbltzU_1778662552
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi all,
we just rebased our QEMU fork (https://github.com/coconut-svsm/qemu)
to upstream QEMU v11.0.0 [1]. This allowed us to remove several
patches related to ACPI/MADT and native platform support since they
are merged upstream. Thanks to Oliver and Luigi for the rebase.

So the `svsm-igvm` branch of our QEMU fork was force-pushed with the
new version. Locally, you need the following steps to align:
    git checkout svsm-igvm
    git fetch
    git reset --hard origin/svsm-igvm

`scripts/test-in-svsm.sh` is also updated [2] to work with the new
QEMU, while continuing to work with the old version as well. You need
the new version of the script only if you use `--nocc` (native mode)
with the new QEMU.

Thanks,
Stefano


[1] https://github.com/coconut-svsm/qemu/pull/32
[2] https://github.com/coconut-svsm/svsm/pull/1058

