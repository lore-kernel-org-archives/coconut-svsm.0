Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A837F74C
	for <coconut-svsm@lists.linux.dev>; Thu, 29 Jan 2026 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680364; cv=none; b=BbV1aHOW9zYY0xJd6+tSI0ptTleSIzArhS14jWfJTOeWVYkOIooBbH69bL6QfEN16q+35ctnc/EJDEW8NRjewXGV6wBzcNDNoFjac/aBGLOrZk2EdxbgM0WHo39FFFI0lgZ+TtRga/Y33SEwj2yq5QI/5c6GMB84X4ANq+7oR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680364; c=relaxed/simple;
	bh=1HAXRovB8qPyqL1uoSwgSmmBTZmAc+4tgw6+oJHLetg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JMMH5lU1+fvH8Q/FIq8OelhA9zy3/fnZIUUG2I1SqkpqGiLELroQDqF/s8rChuW7rbABQjX/Ubh+shaye0V+Clapd6x32L7lcyUJ12cA9hJeLcCk2kMNlE0cxNfRfbmt+5obUHjQzM0ynuqUP/FVmtNz/mEmjsF7GxwUbvrKKoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cs1ll1Li; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cs1ll1Li"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769680362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9s32AnuHJaDgDDdBbepDw+9PgDF0CvJYdL2/7RmPdxQ=;
	b=cs1ll1LiOePsriTbv3JlwqOjzOthjcZdUUVzN03Tls69KpulXbDnxJpdf1ynmIlKLwrRkw
	yryOdcIEey95H0s6HR/mvgUYK53X1io265N9WFFnINwJY1i/wlwVZVYwQsaNY4Egev0Bys
	UZ37AcPgeXWyImwgqGBObsY1s+ipKjE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-rJPCDGb_OWWYKQf5NDNFoQ-1; Thu, 29 Jan 2026 04:52:39 -0500
X-MC-Unique: rJPCDGb_OWWYKQf5NDNFoQ-1
X-Mimecast-MFC-AGG-ID: rJPCDGb_OWWYKQf5NDNFoQ_1769680358
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4803b4e3b9eso5830015e9.3
        for <coconut-svsm@lists.linux.dev>; Thu, 29 Jan 2026 01:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769680358; x=1770285158;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9s32AnuHJaDgDDdBbepDw+9PgDF0CvJYdL2/7RmPdxQ=;
        b=chPWalvwQKNdtCYmIXO+9MayJzTv2ZaJy2s61wKpaA3Bx9/bjCctnYODhL3+LhCCmP
         UXj+uiUDSiN06q+mEvmg0xQjPLn+1SsJPt/EtAf3m6+iEHQcFcY6vev2PwByHsyrWS+P
         axAcXRGB7IwNwb3d2togFZlFr2KhYCvWmf5pyUWTSBVIgjnEGrYswk7+9tHcB3HPWX1c
         1xZCouxFcGxVDsMwcI+zQiSE4Vr5k8nikwXxvdgcWLYtV9gLF8R7Tn1zVCCaVIRO5pd8
         2FkxvjSJQpc8NAMSnPBPMTRuG+ja0osKtW+cQfy3PTWROWX1rm+LLUxxKjKlt8T8qfhF
         uO3Q==
X-Gm-Message-State: AOJu0YxOPQdLgk/4GgWBMuoetaIBZIaQEooNQ5sMMSFcWvm09rDpsF4L
	SoeIa/zNF5N0m804q4e6mjOhBUuvyk2HuAHeFm1C+50GFGUopuSgWC6vJP9XVXzz5RVp5RxruhW
	h/a9EhHNl/XLELJYzzW57ehM6m3W/OS086MTIcL1+k67UdUFMIHnrIFUpkPUu/+YewQ==
X-Gm-Gg: AZuq6aK2AjfJz+JDsNrLRqyucm1FWoqRufO4Ow3Eqd4DIC9kwR3KRh1P6K1BwBuC13L
	mTM/GALU6TVk73HCJBxkpDKupaxbVKx4oqB3ABbnosrSxO2KlsyOHKbEskB4TvA2LaxzA/UH+Sn
	sTgXFul11b5fdu/18GqWT3odKJwzbAVCqnCvxkWViV8zY1TNTJBccX71IPiaTDL2q8kyrfDx14O
	HlkQ1mbqk4MNWN2eSClgchCXBFSe5+0tUjm8HxrN3QHFmQt1ecRYn1AvEwo6RPJ2TlKhCHWz30s
	t+Vx8ykSyEMwvcP1nk4gi9cUQaCw2PoJDzlDcl0Arq0YTSu+thUJ/hzCgryuKhIJ+IRDlIuJ14n
	iFqXeOyMloTDGkQ==
X-Received: by 2002:a05:600c:4e94:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-48069cafa29mr111644295e9.33.1769680358255;
        Thu, 29 Jan 2026 01:52:38 -0800 (PST)
X-Received: by 2002:a05:600c:4e94:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-48069cafa29mr111644025e9.33.1769680357814;
        Thu, 29 Jan 2026 01:52:37 -0800 (PST)
Received: from leonardi-redhat ([176.206.38.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480705956f1sm88261005e9.11.2026.01.29.01.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:52:36 -0800 (PST)
Date: Thu, 29 Jan 2026 10:52:34 +0100
From: Luigi Leonardi <leonardi@redhat.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
Subject: Re: [GSoC 2026] PCID Support for COCONUT-SVSM
Message-ID: <aXssgQwnTkX7C2pO@leonardi-redhat>
References: <20260121144151.37812-1-joro@8bytes.org>
 <20260121144151.37812-3-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260121144151.37812-3-joro@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mg2joYflQdqht_Z89szpv38bflMyyN9acYUZxf6nUSY_1769680358
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Joerg,

On Wed, Jan 21, 2026 at 03:41:51PM +0100, Jörg Rödel wrote:
>=== Support X86 Process Context Identifiers (PCID) in COCONUT-SVSM ===
>
>COCONUT-SVSM is a Secure Virtual machine Service Module that runs at a
>privileged level within a Confidential Virtual Machine (CVM) to provide trusted
>services, such as a virtual TPM, to the guest operating system, independent of
>the host hypervisor.
>
>The goal of the project is to enhance the COCONUT-SVSM kernel to make use of
>the PCID feature on X86 to reduce the number of runtime TLB misses. The work
>consists of several steps:
>
>1. Implement generic CPUID feature enumeration support by building a code
>   generator which automatically creates a Rust crate from the data provided by
>   the X86-CPUID project. Use that generated crate in COCONUT-SVSM for
>   detecting the PCID feature and clean up all the open coded CPUID checks.
>2. Design and implement a PCID assignment strategy for tasks and threads in the
>   COCONUT kernel.
>3. Apply the PCIDs in the COCONUT page-tables and adapt the TLB flushing code
>   to take PCIDs into account.
>
>'''Links:'''
>* AMD64 APM 2 (PCIDs, Section 5.5.1.): https://docs.amd.com/v/u/en-US/24593_3.43
>* X86 cpuid project: https://x86-cpuid.org/
>* COCONUT-SVSM: https://github.com/coconut-svsm/svsm/
>
>'''Details:'''
>* Skill level: Intermediate
>* Languages: Rust
>

I'm available to help co-mentor this project.

Luigi

