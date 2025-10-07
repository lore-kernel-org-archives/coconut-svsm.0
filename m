Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82FB1A08AF
	for <coconut-svsm@lists.linux.dev>; Tue,  7 Oct 2025 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826584; cv=none; b=StMovZrpnBLWMtF1PLKRLPLvfcB/DzYGS5QOfdjqSWv1qTmXHycuau3ad1cJwhEGIrRCsq30B20WdiYY5WA/2A6D+twm/seO9ObHvs8Is35UMiie2lNl4Kzd2OVV7G9AXC/2mSc5kUQvnPNNK2QrU7QlVma+3Eg+jfaUkdnoUIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826584; c=relaxed/simple;
	bh=G/24lZM079FDhd2eovkp9//95+RNmJ7hr4eXpuqql6Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=VfXa5DTjpfXmXYtGtLKq5GNydTALctKFjkQ4Jy78miFy2clh/8zLyyIgLbZd3QRkloYJhZL09uKCFFMf0KhC9+LZvv/OYHWTPqFI7QgqXUyWN6SKlxtUyxj5atfFdWg00R16pAH5kQKGQoGb9y8YQxIHMlXUhmCO1si25bTbhc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PBPseuwL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PBPseuwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759826579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=rM5k6sGYa8Pm/22q+hyc5ZKCks8KFIHNUgtUTB38M/E=;
	b=PBPseuwLIPY88WqZ4EmtkgklOjnihYQW/bDEZ0SbBlFz/CAmXkBLkZta0ydtW8vuC9Kw8x
	ME83YfAzJfoD3z1BF0yUgdN0sbbi/4hHTW16q50uV4AzIDvxnUVBoMcAbk1iB37YHmcS/J
	HVhtppblae4H1zgyKmvgE1qbPtysxlo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-HRtckcU9PsGNKqY5VNEBbA-1; Tue, 07 Oct 2025 04:42:58 -0400
X-MC-Unique: HRtckcU9PsGNKqY5VNEBbA-1
X-Mimecast-MFC-AGG-ID: HRtckcU9PsGNKqY5VNEBbA_1759826578
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eb2b284e4so9087239a91.1
        for <coconut-svsm@lists.linux.dev>; Tue, 07 Oct 2025 01:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826566; x=1760431366;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rM5k6sGYa8Pm/22q+hyc5ZKCks8KFIHNUgtUTB38M/E=;
        b=WfO7Ai0jnuoJGZwm9B0nBz/peCKG6Ml3l5xtc0Qg5gbi7m5/IV2+gvaYsG/Gi9l+wt
         2OR++9cons2rlRYi80JGt29bJtZXv18zHIxGy7Y+oVXXGSaaB7PWO4G+4msT7jCJb1FU
         DfXj/gA6x/f1vH+pkf1y2w6WUgoO+KTWpNIn6UriVkBM9GcdTcIDY1nIx6U6Xp6/pSyl
         pdyczT0c9G30yklbT+50NZHpVf97e72uj2/v37GRWK3NnjqHvqPuWmaB0JsuJhZLZ3rd
         ref5Q8wRhVRobja9eD5ELWYKmvpHQkst0XrWD8U7yBTp0aEYecK88OJuLGwJwrQ1IivO
         gvWA==
X-Gm-Message-State: AOJu0YzVF4BRlaJ10GYmyfAtdxwAqOsbo0MFR2NoUiDMAu5mPJ5y2Cu1
	d9lKHUIzWkq+zroiPpdoA06wPsRbp5WabdH9bCVEOlAVMfr9harsOAlmwLl82QR8lQY6cTsUseN
	Edqg7qAA4tR+RTTmcD3WY4ZPENb1MGPoiK+/PUfHYN+uwOP0RwKPUgC321rjJpZOJZz/x7e9mS3
	kNyx10FlalweM3hpb+R3gp47s5uPuigYp5x2ksUYIaBz78FqeWu2I=
X-Gm-Gg: ASbGnctGsNW3I1/GHv0l+zs9gDZimibw6uMUkXlCn3bQ//ccngi8xsciBO33JO8t+76
	gzki/9A9su/BM8az7/8UkE+5WNLMjg7Zr0AnfK56BBqXKCBJxT1g0qaSEeD8ih4y75pamBm4gSL
	1PfX2bSVZfnnuie/fOVApVxd2CHQ==
X-Received: by 2002:a17:90b:1b42:b0:336:b211:1772 with SMTP id 98e67ed59e1d1-339c274dcb3mr22203326a91.16.1759826565856;
        Tue, 07 Oct 2025 01:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIxP2FOM94heyF41CxaE3rbpyz40M0HHMKBIPWx/387EW9VEGFzqG/VxfDdjJsFBa/6/sN4LKbM/71H6EckRE=
X-Received: by 2002:a17:90b:1b42:b0:336:b211:1772 with SMTP id
 98e67ed59e1d1-339c274dcb3mr22203233a91.16.1759826565165; Tue, 07 Oct 2025
 01:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 7 Oct 2025 10:42:28 +0200
X-Gm-Features: AS18NWCOF4XfzLr2dEgmGpxgibs9vZBFWsiA794Su4eLGALamjYeCPyUvJ3fEPQ
Message-ID: <CAGxU2F5MbxjrrT9O3R4hvD=6w6rsYS7DhZ6F9u7HTVSsfc2tkA@mail.gmail.com>
Subject: SVSM Development Call October 8th, 2025
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bwpG_ha9sNPOSQibYNVMtOa-sJ78hlJ3WjRuUtczYNE_1759826578
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the usual call for agenda items for this week SVSM development call.
Please send us any agenda items you have in mind or raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting can be found
in our governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.
Stefano

