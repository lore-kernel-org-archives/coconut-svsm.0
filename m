Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD111991D4
	for <coconut-svsm@lists.linux.dev>; Wed,  3 Jun 2026 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780473499; cv=none; b=JIpoXZFFNQLg4OgQ3MSoVq+9TwArjlkTmzF/sNphX22d+bzwvAhvNfzXU5+vRdEqKWbzBoyLfPO9o+bZa062slB+RjlYkGDrIW+BX1E+RGviWdkjKu3Pmg4YP7cqSzmOmWQRm5Ya3pmVInaKOh3CcMCTifNwxCVsrYl6G2a8JEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780473499; c=relaxed/simple;
	bh=GenkSbAAZbmgIYjnjatLIXyTvbIP6W+4AfKps7Ntb/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=atd0JDyKYgvqE5zAvMaWQ6txI7D1prccHBR3ZpzNWuZCedVBOcFA7EcNJl++/oDcBzv99kCjg8+7Pocui/+/E+4urLJ5c0Tth3ohRdgkXL+JpuE4CtdqOqAfjVJdTy7FqKuNt2JiR4CigglNS2EtXeZHaeOsBGUCkHFxGlqMSQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZdpLD0oC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZdpLD0oC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780473496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbIaiV+usjyONBGbrHjC3CjCtYSdkcWUYeQVUIDYeQY=;
	b=ZdpLD0oCkSVkYCm6TMfhZ+mLYiAsKBmboRRI5g2//e4sB3/F/VTOcfWTfhN9UUebunOBtr
	/+TdmjUQh3ZYQkJlnajyrZvpRFSHe1yyFcWt0bnuzqsYue4nY6uTz/9rC9wUC9BycN0qlF
	KF8TMvIhtJ74To++Ts4FO8ZimBtbHwI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-QiS8p623P--fPb03p1HQww-1; Wed, 03 Jun 2026 03:58:15 -0400
X-MC-Unique: QiS8p623P--fPb03p1HQww-1
X-Mimecast-MFC-AGG-ID: QiS8p623P--fPb03p1HQww_1780473494
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490b56bf7bcso7409705e9.3
        for <coconut-svsm@lists.linux.dev>; Wed, 03 Jun 2026 00:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780473494; x=1781078294;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbIaiV+usjyONBGbrHjC3CjCtYSdkcWUYeQVUIDYeQY=;
        b=XzYSRQ4mxzcAIdpfsIzv7T8PSct8FSS9UYkBmYDtruFlZKXuu1YQ/fgu5dKCW3Lfkt
         ibx9IdVJ2ix/txKUsnwgAkCAzLPn5Y5w0kkB8/tt+BRsBxIX0Im/UjOjavfNIdxFg81w
         2L90kN4elTL+bp2Cdt2FtlDMgkNVP6nmZX6xIP2SEfdrBJjdB8DKSpvdgsJm/Pt0f8vX
         w6SlazpT3YV3JwU97Sfso2ZepbhFc7O68gE/6NbIuZLqPd4hMaB9gAX9v0g1CbC6JREU
         53LGp+lQj0h5RJ4HkKPuKankhrMZ+uQ0KaInebx1EspRm4t6r8mCrrXRsntDDJef6qOy
         Iogw==
X-Gm-Message-State: AOJu0YzYyeIGF5YA+Es6y2krbBh5eF8F0i2VRk80ylgSxKyKxIQnIa9b
	W4hPaqjFtIyJ22MzbuebPQA7ZG+zTbUa4gZxbpdgcPohGIhUNhrcT8X/v2iGZ2L675/MyOMWipx
	hWAkISN5Tu7z5+tZpGmkt810Ldpy0Dwe7hopQi3gzCyKH0BWbEnhoOTXEXxLdJJoWrQ==
X-Gm-Gg: Acq92OH/sHM5zEffm2+lYNK33HsUca+0yU+1qFcySYBkr742YideUJ+++E5k9U2mJtL
	KsIxWhZNKMHzubCx0O28avEFXqqHnOsHmz2/990LPKgo1KrQy9WnVXwfpBJ44UapESxTQZz/zp3
	HdyjG4oTK8uIFAWWJEjMcKj+jPCAuKb61H7zQfrtX1rmAxTJX/XWg+pA1THD/eJT/mqXlCNpViA
	RMrg+3wYPs6FEl+l2E+hYHrTegcB7xvD39WyHW/mRx6a9Xfg0/WKryWGI6vwiz5GqiKl2MAFuXf
	iBriPHn6LQ8Wv7rz5dCGkDs1BNWxFfPhzRqZ3FhEJHq42babHQCAq4y6rkS15L47Ep5z67VJ9eE
	hTqZtX8MfRfjCkIQpCFMx/BqOHbZzPszqpaHwTtz4HANFXf7E96NNs/ivIEqeGFLvkgq4Hg==
X-Received: by 2002:a05:600c:4e92:b0:490:59cc:998e with SMTP id 5b1f17b1804b1-490b5e644efmr36416155e9.3.1780473494405;
        Wed, 03 Jun 2026 00:58:14 -0700 (PDT)
X-Received: by 2002:a05:600c:4e92:b0:490:59cc:998e with SMTP id 5b1f17b1804b1-490b5e644efmr36415805e9.3.1780473494030;
        Wed, 03 Jun 2026 00:58:14 -0700 (PDT)
Received: from leonardi-redhat ([176.206.19.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc294sm8627235f8f.7.2026.06.03.00.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:58:13 -0700 (PDT)
Date: Wed, 3 Jun 2026 09:58:11 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [RFT] KVM Planes on Linux 7.1 ready for testing
Message-ID: <ah_c_5bKpmx3nOdA@leonardi-redhat>
References: <ah6w0xGq1jtKNJen@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ah6w0xGq1jtKNJen@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l8s9cagmPsxlO2OLc40rRlnighm4U9wbvY0loqy7lus_1780473494
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Joerg,

On Tue, Jun 02, 2026 at 12:41:57PM +0200, Jörg Rödel wrote:
>Hi all,
>
>An updated version of the KVM Planes patches is now ready for wider testing.
>The branches are based on Linux v7.1-rc6 and QEMU 11.0.0. Before sending them
>out I'd love to get more people from the COCONUT community test the changes and
>report any problems or regressions agains the 6.11 version.
>
>The Linux branch is here:
>
>	https://github.com/joergroedel/linux/tree/kvm-planes-v7.1
>
>The QEMU branch is here:
>
>	https://github.com/joergroedel/qemu/tree/qemu-planes-linux-v7.1
>

I think commit `ACPI: Rebuild ACPI tables on every read` can be dropped, IIRC
this was necessary when SVSM consumed MADT from fw_cfg.

In `qdev: Add plane property`, in function `device_initfn`, dev->plane
should be set to `qdev_default_plane()`
see https://github.com/coconut-svsm/qemu/pull/31/changes/8fa10020cb97ced3151f67b842ecba57ef76765e

Luigi

