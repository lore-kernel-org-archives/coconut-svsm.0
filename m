Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F065C225409
	for <coconut-svsm@lists.linux.dev>; Fri, 11 Jul 2025 13:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240069; cv=none; b=YJRIbSOAAnthVZ0W59UB4fT3H/a4UlWDeAcUeJgkyrsIEc4eZzlE9SSIWislzCsqWKRSLTzsMt6pM7myQk6wG6cEpTF2MUWdaoOkQSgU97T3/IKbDiRCn0xnoMjGNo1EvvPSFe6M5w+MDYz8YXjLGw15yC28rNw3t46PvoAQgLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240069; c=relaxed/simple;
	bh=nqx49WPKnUoI8Y3198O0/4CAeBRnDsUCbGjqq3i0L7s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mijIxbA39IEIhn3puIerKxSHszKu3tEqxQW75cQZdOT8DFenDvwwcSU+pJ9DNLkTZUE8wQAzO+xICqFK9+MeK/ZGgij47zd34zwY/v2whTWTftc84W/fBZjXzDr6t4orMEEYk108hKSdQl7E4Rxt7XxhUMjJT5wc//msrJ2SOeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hPVwbTCT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hPVwbTCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752240066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=HI3DXTJH+E5afO2iqlBA4pO79KkBmc3pMVui26CVcYE=;
	b=hPVwbTCTDto0gb1E2nh8ycqP7Ibi1XcZmWzEkRLFpV+s9UcdNblk4Ptg3fUqPOMzWb3cVg
	9Q383Z9D3MsNp2bTZ3WgQADGLr+MZrFwd+lGzdJTfnvyo+RUti7B4VeuEZcvPlQsHWX2Q0
	Pu1hSvmvt1kvF3Rk0rMt3rlL2HxORKI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-ni5iBtjMP3qx0tA8L9CVKw-1; Fri, 11 Jul 2025 09:21:04 -0400
X-MC-Unique: ni5iBtjMP3qx0tA8L9CVKw-1
X-Mimecast-MFC-AGG-ID: ni5iBtjMP3qx0tA8L9CVKw_1752240064
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-703d7a66d77so27944097b3.0
        for <coconut-svsm@lists.linux.dev>; Fri, 11 Jul 2025 06:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752240064; x=1752844864;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HI3DXTJH+E5afO2iqlBA4pO79KkBmc3pMVui26CVcYE=;
        b=wGdsJjKIo8NIBVoGHKfjK30P1Bj5jcvoruvQlNbd8oou6IHwklQEo6pNqGXk8OpMsX
         znrhZFSgqveidValBku4oNImFqnrMl9NwXStVYNZnnagRnAnE4q2zAlfHUj/19esK6Gu
         fGaMXPJQf7p8Fg1OFbrCXCoxvujxvRu+mP62I4YCcjo2R4gZ7nwTddNMUSzWPOaI2cO5
         0vEDAgmvuMq7EHpBfvgCLAdumebz0HRZRp4KBZkB2VOajAl3Mg4so+BnOT81sYL4nE4D
         jXqG1MXpSBzBEcO0gws9NBdHGcUVVSsLVCX9kJsM28O+rBiO1MLbR0J2N6m7S27WL4k9
         AF3w==
X-Gm-Message-State: AOJu0Yw1rHZCDaouZPVSV3kMisHG02Itl9eFVov3G6ju9yQn3s/DKmx6
	nFK5aFIyZypjISLWfaOWC5IahJDWm7PTDwFp5FzwRoX9GQrleB8u1bNsbojUXvq6fzUuAzOcx6s
	S+l9jx9QnrZ+xxkSXNyY9Hqe77BF6TXWTiWqRr/la9Jq3n+IqWARs77CU19scIQjMlq9JTJcm+1
	J2huGbkYxWLz4tVgN8NXACslqHRFtm9CqbNDV8LIwpxWXTwy9y2Co=
X-Gm-Gg: ASbGncsFTBvTUs1HaDtIh/IEip4H7MthBw37/Y9pt9FRfChB81Z9BPsyS9Sn6b3Bog2
	cvlDnYTQJEX9KZuerv1M/T+VQ5scYXhRi43/s3NHae2WDFLRywueC0qkQY6jXUPOzz45RWqgnkx
	SPRKaphpluBXxi+Dvah8AdmcI=
X-Received: by 2002:a05:690c:4981:b0:703:b47a:7312 with SMTP id 00721157ae682-717d69d0cf7mr53566127b3.15.1752240063670;
        Fri, 11 Jul 2025 06:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfweBzo+z0zokpW83SEsmpETsz6+MY9K1pLsMu2Tx2KaB3yIjIGJ+1Hh/iW2R+C5DTrBhAbj9BJVOUBNFXxLQ=
X-Received: by 2002:a05:690c:4981:b0:703:b47a:7312 with SMTP id
 00721157ae682-717d69d0cf7mr53565557b3.15.1752240063200; Fri, 11 Jul 2025
 06:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 11 Jul 2025 15:20:51 +0200
X-Gm-Features: Ac12FXz3o3fvc-lL8R0cH1CBFbUbq1rXZQJrrE9iCf5IX-iLcgJA0PYGORv9lqU
Message-ID: <CAGxU2F6AM=cdsr2DmY-7cawNxcsuHWwNPe3qN=WWrGfJOsTzzg@mail.gmail.com>
Subject: COCONUT EDK2 fork rebased
To: coconut-svsm@lists.linux.dev
Cc: Oliver Steffen <osteffen@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fcI7qeXssc2MVGFyEoOaGDSlFTXcqA0RWoKpC1w9Ll0_1752240064
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,
we just rebased the `svsm` branch of our edk2 fork on the upstream
`stable202505` release, which also contains the SVSM TPM driver.

The `svsm` branch contains just 2 patches on top of `stable202505` to
fix a known issue with major Linux distributions and to disable the
fallback reboot of shim. See
https://github.com/coconut-svsm/edk2/pull/7 for more details.

For the rebase we had to force push the PR content, so if you have the
old reference you have to reset HEAD in this way:

  git checkout svsm
  git fetch origin
  git reset --hard origin/svsm

Thanks,
Stefano

