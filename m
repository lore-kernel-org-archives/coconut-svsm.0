Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D89278E67
	for <coconut-svsm@lists.linux.dev>; Wed, 21 May 2025 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833497; cv=none; b=F5J3CgunYbwLk5XV9hyYEi8V2iq0UeY2LkuO3fTtUBvGzryrhgCJ++GAn7db4Ze3+mdpmTEGdDMa5hS8qs1lQaKyhO5FvmYMhYQLKenSc5naOErDhj5IVrjWHBaaSrtngEyXRSfIEwPsIL5QKgx1w1s7BAGdVqlenULrKvYBeeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833497; c=relaxed/simple;
	bh=+rD3tlPqJvZmHNLgfLlgNCmp6G3oDXslX+rWTD+z6js=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=IVNxTnQsBTa33SrkPUrzk45sRNc+aX4JtclYamUhC/+alUPzRSA6YytU7KM2Wnwo3VUosSC3mTJvZm+Z3t4FDQNn4KEGp7hJOPP+4HKVTd0vhyj1OuUJDYRKm+0S40TzPOSAEWIOCqFc33yjTs/EhmXkmKBKUnouloD1O76Oz7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DhL1S19L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DhL1S19L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747833493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=+rD3tlPqJvZmHNLgfLlgNCmp6G3oDXslX+rWTD+z6js=;
	b=DhL1S19LId4MYulJGtrSoIDV8tmh1a0sKgC/ZQ3VZwhwsPFYIqiYaNFNQkVXjAGE9yUbOn
	JJ8neNbVCS7dzcyiFidSe+GBcbefe3CERu47IJbedKChwiy7EE29i+pIexB2tbrJS9oTr4
	sjuidLm9rQStfEAvPYBNcEcyRfgi4xU=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-6OX7X9wxPGSyHDOS3vYkGg-1; Wed, 21 May 2025 09:18:12 -0400
X-MC-Unique: 6OX7X9wxPGSyHDOS3vYkGg-1
X-Mimecast-MFC-AGG-ID: 6OX7X9wxPGSyHDOS3vYkGg_1747833492
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e7b92692543so6517382276.2
        for <coconut-svsm@lists.linux.dev>; Wed, 21 May 2025 06:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833492; x=1748438292;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+rD3tlPqJvZmHNLgfLlgNCmp6G3oDXslX+rWTD+z6js=;
        b=rUY4RerGyl6Y0W/75g8UU/LbJD5aD3nOq/f/SS1X7Di+tyuqZokTSLADaNXy3076ic
         IDhka9L7S7b9MMvdvcFeGqrx8TOmtzZEzmZYDD6i3g3F5lNC/KeKf/laZYIRBMcKDvfg
         Yutc3OnW8s/YB82jZvln0k1zFI0/MLg2Q+JIZiSzaVqnxogOeWbxZou/ufPh1H8w0+Tn
         NE1+GiYaVIFo1qUmKWD31pLMqWG3a4w///Y11ceJsWwO5aH9PSfL/QPs20JIVV+G63GD
         JChZrkbiFm+XpsKWfFKRf0/R22DT7cWO4Nfad+wSQGJoceA7OzL5TO6A+YqzKb3IwSSI
         w4Pw==
X-Gm-Message-State: AOJu0Yz6OZus/GJwXtZebbHgO0fh+wLW1X7qOZknhyrKvcWWUbpAAdCp
	WnsTInf0gHhK9Sfa/uWEXKfrPGVBEHr2EF4i1MPRt/ROVoA/i7PgkzLyxvoGj9yX6ZRv/n//u5O
	msar9Lsy/ANAz5cJ34w0BOWSdwZnkiK2u5dRn4WiRBHFno9t8ZFXRDudG7f4L4PHUxJ/W0CloDr
	TiNeh7+xsV1pSY9aMaMiGGT63ZOeZkHyzYQpNIuBVbTh+h7XqZ
X-Gm-Gg: ASbGnctANqSo+03YB02JgkE90Cc69ivDe6sq5W1wQMu7ohJdHAQKZZp2kyDNVfyvUvy
	BUV0EVQAJiUagejOMF88MkUkEb+uamX+4ona4GW6x8WdgEFJBmYDz1A4XhQ0LkEMLHdA=
X-Received: by 2002:a05:6902:c0a:b0:e7d:619c:5134 with SMTP id 3f1490d57ef6-e7d619c5207mr1874444276.34.1747833491736;
        Wed, 21 May 2025 06:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0SHOVfFU6BXKDZuqhEbeQ+6GSjbLf1MXhakRu0Y1a8TXdXvqRWc67pLk/KYVSzbgOIySKmxVx9lJJl6RzvBE=
X-Received: by 2002:a05:6902:c0a:b0:e7d:619c:5134 with SMTP id
 3f1490d57ef6-e7d619c5207mr1874399276.34.1747833491175; Wed, 21 May 2025
 06:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 21 May 2025 15:17:59 +0200
X-Gm-Features: AX0GCFv3Mxj0_LVFcOp6RoO_oeQe500W-Mns7qysHsv9ixKr2cypq9BzmUhSWy4
Message-ID: <CAGxU2F4Mxc_s8bUejyNLUiGmiJxu-V4LcxZ6jQaELMageucQcQ@mail.gmail.com>
Subject: Custom CI runners in Kata container
To: coconut-svsm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TyTpHAQR42ZU1zhBJVF1m6ZCcuOY3YdIJx9wRL1t5Ds_1747833492
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi all,
as we discussed some weeks ago, I pinged Fabiano Fidencio of the Kata
community about their CI.

He told me that for now they use runners on machines provided by
AMD/Intel to run GitHub jobs and test SEV-SNP/TDX related features.

He recommended we take a look at OVHCloud if we have the ability to
expense through CCC, because it might be easier to maintain.
Particularly if there's downtime, there should be customer service
ready to fix them quickly, which we certainly can't require if the HW
vendors donate us access to a few machines.

If we still want to ask HW vendors, I can ask the Kata community to
share some contacts with us to see if we can get machines.

Cheers,
Stefano

