Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC903DE44D
	for <coconut-svsm@lists.linux.dev>; Wed, 27 May 2026 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898521; cv=none; b=Ah92JW4+6uZ92pQsy3qdB+pXJErTn4n3tn2BGFdmeU8ebyVHuFBGvLPkrb74auq4ffkaNB40reXhLQmSiDu/sV3dV9NUp9VzgRvip2eQw/YaxFQRVnJNeAYTaiQyX42USXiI80FWz8dwpQVzMR36F4kMNOYybula0GFZprn8ibs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898521; c=relaxed/simple;
	bh=3kSEin8iQiUe7Rt9RltmRhmaRz3EsLAq30d3GhMkZdg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jGFba3F1tTEqSqScUQvKAwL7/dTSzc2F4QbOZ+D+/yHPqRQoahvgdst+RBTlPh6qz45XPghhwGpPpatU0KTUnW8iTvRvFEj+QnMDFbLJrIDwTela3uEeZXfUg2ozf4zeY5WRKtoneF4EJX31k/0VCMnwjH8UOxM+eprOSzFI6gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iFpUtvtB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iFpUtvtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779898518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=3kSEin8iQiUe7Rt9RltmRhmaRz3EsLAq30d3GhMkZdg=;
	b=iFpUtvtBEnHXxs1IChfdAcL2m3uQxtbuHR5WwuKAr/pYMuOKkMMpM2z291RjMk95gdjh1N
	ELFpcJH3PX/bh5Ee9LDA5+c2Vpow6WtIEFnw3Mn2inSxRB17bQJxYA8Q8EucSZPsoRBd2Q
	0UrkTPzJfRFxpDolVHOi2mGxDo78vPU=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-UWMApwU5P1q3-bWvLvNFcA-1; Wed, 27 May 2026 12:15:16 -0400
X-MC-Unique: UWMApwU5P1q3-bWvLvNFcA-1
X-Mimecast-MFC-AGG-ID: UWMApwU5P1q3-bWvLvNFcA_1779898516
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7bdd1ef8648so199426197b3.0
        for <coconut-svsm@lists.linux.dev>; Wed, 27 May 2026 09:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898516; x=1780503316;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kSEin8iQiUe7Rt9RltmRhmaRz3EsLAq30d3GhMkZdg=;
        b=g84Ou7rEg2AgvHINRwoVw5EZT6sN1vvh81b+4PC5RQSum/9VVlpmRFNZM3LHL/PoS2
         xAAKicEByb36RDHV0YV4qovD6stARBJhzc5AlFwoj2aXcGn550m6yjDxU56SAglDjFAh
         Duc8m7znA5b/DVErx/NOEdYNy9/WGFD/+QdDm124ayjRyzG6IP6drBQrx0wrYe30l9Pr
         EJF5M9eFgzlsJ1EUJEPZs3ZYESJqnj+rRHch1WJA5E2PlHmrq3tm9SXw3rZTOWMWElN4
         CKLH1CMmZFCHSJkzSKVoFYceY/dWyv9s4JmjF4Cz01k1SRryQpaRgc3e/HPOR2wRudSq
         M6Sw==
X-Gm-Message-State: AOJu0Ywkvneh5rrgCKvnZUR8xzmp0KpQUfA3Q9HAmGHFjP3XbhH25oro
	jVyGNcJEgPzyU/Mk8XP6/qG1QvmbOLKLfsVi/zENzdRzE5pP/hD1xjpPDHpa8Fw65NzSGuEd9nU
	LQzJjssWN0BnOquJzb32vfgBmSxXWcrUnxKA3gkf5cgowpQYZiYvmF/GQMC6g8ShAYRR54RwDXs
	bjIKIWWzttktcpg7grBYblr27JER87W9LdqSccTwAL
X-Gm-Gg: Acq92OE3q19l8nHlGR65W8tXkHEr7CUu/FIJIySi9RzMVaZ1S3Ss/FAWihziH+7dFhS
	oRTvNbLxEoE1MdUn0muF6mhM9mrBv2RiT1lQnNy+c+rs0TYOGnVXnMRyk4RGz5leTej6jLaS2Mx
	8646i15pe3tKXE9NZI1EO8aAuu6sZ39FW6Wf/k1PS3YNvE4zIFLh/I4hzLfVUlczU28jya0t2Xs
	+9w9mbEwcFhxkMn+Lu2owF7win9GZgPX/2x//0=
X-Received: by 2002:a05:690c:6908:b0:7bd:8ce4:92c with SMTP id 00721157ae682-7d335fbccdamr257923407b3.31.1779898515905;
        Wed, 27 May 2026 09:15:15 -0700 (PDT)
X-Received: by 2002:a05:690c:6908:b0:7bd:8ce4:92c with SMTP id
 00721157ae682-7d335fbccdamr257922817b3.31.1779898515424; Wed, 27 May 2026
 09:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Luigi Leonardi <leonardi@redhat.com>
Date: Wed, 27 May 2026 18:15:04 +0200
X-Gm-Features: AVHnY4IZGiWrUNgOkpPL8hW-KuGAbu4IT4E_I7BugWR3n7BsJukjAGtpzSNcPhs
Message-ID: <CANo9s6kr38e_P59r2x3B_Xh+YqOWx5JmOmneY8xKJ9ZXQaASWA@mail.gmail.com>
Subject: Hyper-V support for IGVM optional parameter
To: jlange@microsoft.com
Cc: coconut-svsm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XlReK3AmQpSr7ZRXbocnWCvrIRxpLvhjKnz0UXwArVw_1779898516
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

I'm currently working on adding the device tree support for SVSM, and
I was thinking of
adding the DT directive, marking it as optional [1], for every hypervisor.

Do you know if Hyper-V supports this? QEMU currently does not, but I'm
working on it.[2]

This would simplify the logic in igvmbuilder, and when the other
hypervisors support
this directive, it would be totally transparent and require no change to SVSM.

Luigi

[1] https://docs.rs/igvm_defs/0.4.0/igvm_defs/struct.IgvmVariableHeaderType.html
[2]https://lore.kernel.org/qemu-devel/20260525-igvm_optional-v1-1-28edc607acfd@redhat.com/

