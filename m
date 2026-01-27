Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536292E8E16
	for <coconut-svsm@lists.linux.dev>; Tue, 27 Jan 2026 17:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534744; cv=none; b=AwyvibbdEf8BVS6hGAmHQqxE6/v11FvEfRFqhDjn6aD2bEpfqQw4o+Gl+4/f95GRxMMiy0O6PM03zEjUk28InXEDKnfdLUz6O8vw7KTy1jB1DBOcNuxngnI/ThEmHSrZWHtT/hWZwqKjSobDsbNslTCLewVCVh9uBNey8KZ9ssE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534744; c=relaxed/simple;
	bh=/smCSp1iqiX7k5O6L2ACoWmS3vBhh1rivPs2ZcZ7EjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ojqD+iHdZZgNHVvTFf6Ox1w77e3pKdoWK/BrN0gggbj8m6yXhZ0LAkpVJ0TNq6M7TdQbEp4QvsbAobvjHVxk8cCee4OAeV2+oQ0+BNeJt9gbNeEXlS6l7D2jyeurshUwopUNcRLEcx+bUqRJxU6p2Ln5kyx3hJcOB/Se61cOz5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hCWYJoWm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hCWYJoWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769534742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TSt1oTGPdbVtMWrhHsVP8ImDNETV2yBloqqrEqSDtD0=;
	b=hCWYJoWmxftoRUgBeBKQ3dVTo2azQxBkpW2aA4u04HVSRHjBc4xoVrJTjZYjIUv1iTFXJP
	uuuBmARLaeTI7NivLf58KSd/XJwmU+RDdeKfmZe3ew7hd8y6RRvtcfwMIqdXwCyt3m39/k
	C47SjACIhOgurg9JHNknRcpOhI8fROY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-1cQ6_ooIN1CacSr-y6GxoQ-1; Tue, 27 Jan 2026 12:25:40 -0500
X-MC-Unique: 1cQ6_ooIN1CacSr-y6GxoQ-1
X-Mimecast-MFC-AGG-ID: 1cQ6_ooIN1CacSr-y6GxoQ_1769534739
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso54562a91.0
        for <coconut-svsm@lists.linux.dev>; Tue, 27 Jan 2026 09:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769534739; x=1770139539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TSt1oTGPdbVtMWrhHsVP8ImDNETV2yBloqqrEqSDtD0=;
        b=Z7VpcSrWWGMmS/txHJtFtEqGsXFnQb0Cy8rltEzSLhkNh4n+ItgTL6ZC9+ATemJsrl
         HucBimmxDgFuomTarQjayJxCZP2CeO8Xr3yKBU+ft5HGCmszpQ5+IbYtz3gptcbU5to/
         B7dKNeQLNx6jyNT3ezMGTsBX5T3g3RtNbu2/WIgWlExl8brZGlnh/bxHKRhRFb5VtPY2
         bue5MbfTf55Mtz1hrqRsCJPgXlCOv850RemByOEiPprgPYhWWipvLc4KUyz47pvxWkLR
         pD0IzGvJPQzjLLhvOJwMfVsw4Xn0v401+ZITvYad+vg1SV3rf7LsfZjI1m8MF520EmH6
         pWkQ==
X-Gm-Message-State: AOJu0Yzb7Jkpb93NbhZLa28RqmHwkb7OwRTRbiXpj/TKPFGaVBZsiIxd
	atgqbnlcY6RYQ+RmUQgxbnm7KkDWAteCF2rbVd9iK5vF/Ya+5G1XW97iEKnug3jhH4y7qRtWh01
	9B5N9YZXpYZazde6SPy1/gb4UYm9xX+pz1h5pqka/g5weTsvD7tizrdzJd5dfTW5yhyQYLuH0HF
	zZKOHB9ZtqrjCXM/s8AZdB3Rovk0A5Af983sJWfwv6
X-Gm-Gg: AZuq6aK8LWPl3mXLAaAde9a6JuWROrLAnHax0FymjdyKephwWF/HSX4Y0QalZAZ45FQ
	hx8njjiRtqY1S8zoTQjGVY5zz04DbsdkYTM92E5XIzf0nyZvWqkRnpLvxf1UvsN5MByvhFM3MqH
	ebk6wvm9bPzGaq0mLbWTR7c3z5VzPfzuPI7HkQMeXCsv+jW1DuKmn9ZG33dum547IZ
X-Received: by 2002:a17:90a:608:b0:34c:718c:5448 with SMTP id 98e67ed59e1d1-353ff8b45b1mr1467932a91.4.1769534738654;
        Tue, 27 Jan 2026 09:25:38 -0800 (PST)
X-Received: by 2002:a17:90a:608:b0:34c:718c:5448 with SMTP id
 98e67ed59e1d1-353ff8b45b1mr1467912a91.4.1769534738207; Tue, 27 Jan 2026
 09:25:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121144151.37812-1-joro@8bytes.org> <20260121144151.37812-2-joro@8bytes.org>
In-Reply-To: <20260121144151.37812-2-joro@8bytes.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 27 Jan 2026 18:25:27 +0100
X-Gm-Features: AZwV_QipZily0RkKIxjrmM3CutVma1HkSby9Nr-739nFEqtMv0kWmOxdnlZ3aTM
Message-ID: <CAGxU2F5_jFasH8oAvM+H8FnoHWFQtVcpApMfma4d9ny8meZJNg@mail.gmail.com>
Subject: Re: [GSoC 2026] Observability Support for COCONUT-SVSM
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, 
	Gerd Hoffmann <kraxel@redhat.com>
Cc: coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OSx5ExxCiKg_ilRyAzSQ3EGUDaAaelBDGDDLVCtJ248_1769534739
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=B6rg,
Gerd and I can help on mentoring this, so we can add:

On Fri, 23 Jan 2026 at 03:02, J=C3=B6rg R=C3=B6del <joro@8bytes.org> wrote:
>
> =3D=3D=3D Observability Support for COCONUT-SVSM =3D=3D=3D
>
> '''Summary:''' Implement Support for COCONUT-SVSM Observability within th=
e TEE
>
> COCONUT-SVSM is a Secure Virtual machine Service Module that runs at a
> privileged level within a Confidential Virtual Machine (CVM) to provide t=
rusted
> services, such as a virtual TPM, to the guest operating system, independe=
nt of
> the host hypervisor.
>
> The goal of the project is to implement support for observability of
> COCONUT-SVSM from the guest OS. When finished the guest OS has a way to
> fetch runtime metrics and data from the COCONUT-SVSM running within the s=
ame
> TEE. Runtime data includes the log buffer, services logs, memory usage, a=
nd
> possible future extensions.
>
> The project consists of several parts:
>
> 1. Design an experimental SVSM observability protocol for exchanging metr=
ics
>    and data between COCONUT-SVSM and the Linux kernel. This protocol will=
 be an
>    extension of the SVSM protocol specification.
> 2. Implement a handler for the protocol within COCONUT-SVSM following the=
 other
>    protocols COCONUT-SVSM already implements.
> 3. Implement a Linux device driver which uses this protocol to get
>    observability data from COCONUT-SVSM and make it accessible to Linux u=
ser-mode
>    via a device file.
> 4. Implement a Linux user-space utility to fetch and save the observabili=
ty
>    data using the device driver.
>
> '''Links:'''
>
> * COCONUT-SVSM Repository: https://github.com/coconut-svsm/svsm/
> * Development plan: https://coconut-svsm.github.io/svsm/developer/DEVELOP=
MENT-PLAN/#observability
> * SVSM protocol specification: https://docs.amd.com/v/u/en-US/58019
>
> '''Details:'''
> Skill level: Intermediate
> Language: Rust and C

Mentors: Stefano Garzarella <sgarzare@redhat.com>, Gerd Hoffmann
<kraxel@redhat.com>

Thanks,
Stefano

