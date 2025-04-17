Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C434419D898
	for <coconut-svsm@lists.linux.dev>; Thu, 17 Apr 2025 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744903592; cv=none; b=Bc1cWk2+ymJPtG0PGYO/r0pVP34nKbxhjjSk7+xwsG2Aeqwhxw5i3lfjCPnkFzJiuFSDPDzGeTNI9aslI5H3QAXanjtjdbzZowwlmur2wApU0EDC2A/Q9TosoEzkEaTOcfd+lut9gCoGH60NVwKznTAXMTKrNlEfs7sdaj0C9hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744903592; c=relaxed/simple;
	bh=V995ntdKLpPRc/+j6ar6jPT1YHhl6mKUeECHqbVDO8c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=biTW3dIVFbe0RF8EcOngCpAjnGLObEybwWCFTHWy5DgSfUIKwj2EHeCkCH7dPd+N/qdrgybAbXabjaQ84OnnImalbJufQUtSBX1AE8jQRCxx2jqe7ljcgSleYYJQeHtjq3LYL4g9DxnNvUAkCzI/btINKzlmjiSNilk0N632fTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZW49FX1V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZW49FX1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744903589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=V995ntdKLpPRc/+j6ar6jPT1YHhl6mKUeECHqbVDO8c=;
	b=ZW49FX1V7vxUhc/HXV+NYXG1wWuwymw59enJZcjLuBL5fRM5IJUHSup2XHzh16Hg7LZ/UU
	RePRE8ve8oM35IkSZbOAehSTDV7tquovvw+PGkNQeV9iL1Zos8MFdniq8gSg19I36jnYIY
	IRXe2PXzHSHG6d5lM8K1AK2K42GWIHY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-zcpA1CT3PECuEKQH4JDxvw-1; Thu, 17 Apr 2025 11:26:27 -0400
X-MC-Unique: zcpA1CT3PECuEKQH4JDxvw-1
X-Mimecast-MFC-AGG-ID: zcpA1CT3PECuEKQH4JDxvw_1744903587
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e6dfe7c8d4cso1345236276.0
        for <coconut-svsm@lists.linux.dev>; Thu, 17 Apr 2025 08:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903587; x=1745508387;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V995ntdKLpPRc/+j6ar6jPT1YHhl6mKUeECHqbVDO8c=;
        b=HBy7sA4coED9PefmbaU0bBnWNbEbHASzCdytwfvVSJCkwhth0dDRdFUdnf0XiI3jSh
         i/mv6hPjCu4aSmBVNFAZa6w5U99Ylppnr+oyckEr2VAnfMDDiqKCtqtSivj0UGk7ytaD
         KrSLDsQYsrw8tLwTP0xxZGAsjro6VcYpnsLB+giOyuceVvFU2y8/TN7ZPUlmSBMHyz66
         vczvCXkM4J5rmFs/4E/8u3S1brRuvM229jPXUUAUUEwPHD+21oL7+XHimFoqlYDK3TGm
         ZXnuQ/eIl3pckxTv4X5qW8x0nW0oYDqDiJbjNoKYMxNRKygu5XEX+kAO0uD39bI0JNtx
         AgSg==
X-Gm-Message-State: AOJu0Yw+ErVtivhBhbN7bZW7vT1SMhWvoIUqXDcpivLxFGRyePdg5ycx
	SLsdLvIx3ViF46w+R4YpW1WsVcgyZeVMWTRYLY759Unvs9jWaead4CPGWlcVBvazI/RspjEeyBm
	ZiHX4snTulsT3sFXXzWaLvga5zSgOaz1hONbM1RDOIK6Lrvgg1ljmfyUpcBrLsq+GHf+RataQLk
	g+6XDsfvF+17U2QbBZlSIFUPxyO7ESGtvCgLax
X-Gm-Gg: ASbGncsY+6ghrhtXYkKfsDs3z4cvSpbEjlAt/R4RwtiN5iKdYZ5ncDisl8jk2Lg2zt4
	LZ/79qDYtjaLWI9MeqTORO8PgcO96F9NGcV5wS4UoQwlEBHmo4a2UtAW8XYAlWElpOAfNlVc=
X-Received: by 2002:a05:6902:2502:b0:e57:442a:befd with SMTP id 3f1490d57ef6-e7275deda02mr8862869276.32.1744903587342;
        Thu, 17 Apr 2025 08:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECbMbPBndevFaIifec9n0la/8TonXVa5OmCKYx11CK+/YdD5R66sMv3lp5eu7BvouCnGZZU4PxE26enYXN3cU=
X-Received: by 2002:a05:6902:2502:b0:e57:442a:befd with SMTP id
 3f1490d57ef6-e7275deda02mr8862839276.32.1744903586965; Thu, 17 Apr 2025
 08:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 17 Apr 2025 17:26:15 +0200
X-Gm-Features: ATxdqUFRavsEY-S9auIt9lCLUDnfy2XGasOkjFa91_ntLIGkk_lqP7Pjo0I9PgI
Message-ID: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
Subject: Potential project on implementing AMD SEV emulation in QEMU
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: coconut-svsm@lists.linux.dev, svsm-devel@coconut-svsm.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0UigmPdLQL9OgTglHbJC_9FIlkNP5Dz2LI9kjLxyMrA_1744903587
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Tom,
yesterday in the Coconut-SVSM community call we talked about a
potential project with the University of Pisa to emulate AMD
SEV/SEV-ES/SEV-SNP support in QEMU.

Joerg rightly suggested having a step-by-step approach, supporting SEV
initially, as supporting SEV-SNP directly might be too much for a
master's thesis (about 6 months of work).

We wondered if you knew of any attempts already made in this regard,
but especially if you think it's a feasible thing.

Suggestions, ideas or partial works that can be reused are very welcome!

Thanks,
Stefano

