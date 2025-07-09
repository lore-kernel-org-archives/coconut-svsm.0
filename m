Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E19B2857E9
	for <coconut-svsm@lists.linux.dev>; Wed,  9 Jul 2025 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752054233; cv=none; b=DzphGgkcuCcBOScyN1UTBoF3dntYBd1XYh04cpwP8yh9OMfMuKNxJHzeRsH0OyT3ptMM4ibnUPX7bAvzuCUHTKhAqY08gF3nekG6Zp50pxc0ZkOArO2AERLUNxUK28on8FPk0RfbAMT2flBlD/90QPfDwQzVT7jEa0B/rkiYx8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752054233; c=relaxed/simple;
	bh=/lPDnBKu5Ej0VxbZcVa3XZ9rvAga5TE+Z1cJ5K6Zy70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=A/IRJH9qR7OkghtITMBDzBsSHTEY8GOUD+fr23DDP7y3mYCeFXhr7GBcUVUnhcz944FjbbWW/973Fps1a85Ahz86TKTdSe+4/2bKHfgLh7BI22+yDi44kjqcdEMQlkXx2TjFFRhPMy2qoXL2Xa9CQyrFbSJzlHwJGTivO2TzJuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DWrkqdec; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DWrkqdec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752054230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igCiArqXJsJJsq4HFGCG/qhrV6Q18Vi3+rEwH+6RFe0=;
	b=DWrkqdecYW7GxiCBe0RME4SRTARhP+t8/IE3gtMlXXVhn3d5ztZ+XaohbxkMF2lrtvOjh+
	u5qtbLlR0IaSdSvtD8zaInqtel4y0u3TXVz/hHWHcUAT1S7xkGN2egQDCzEFvgX67EQJYX
	mBskwii3nZWxeS6UHi/g1Gfs6/Eac3I=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-370-5Jw-5jXiNFS4CYfTu1V26g-1; Wed,
 09 Jul 2025 05:43:47 -0400
X-MC-Unique: 5Jw-5jXiNFS4CYfTu1V26g-1
X-Mimecast-MFC-AGG-ID: 5Jw-5jXiNFS4CYfTu1V26g_1752054226
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF90D193585F;
	Wed,  9 Jul 2025 09:43:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.100])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A3F51803AF2;
	Wed,  9 Jul 2025 09:43:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 0E66718000B2; Wed, 09 Jul 2025 11:43:43 +0200 (CEST)
Date: Wed, 9 Jul 2025 11:43:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Relph, Richard" <richard.relph@amd.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, 
	coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call July 2nd, 2025
Message-ID: <aq6225hfazqsbqgx6fhj2klst52wdfivfa6xj2ost65sg5fq2r@4yoqnv2tp5nm>
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
 <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
 <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
 <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
 <d579919f-6e66-4499-8634-e258af61c933@amd.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d579919f-6e66-4499-8634-e258af61c933@amd.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l-tQOmPv-IP_WfMnbj6W4my9RL46Ngt1Mnua8_PEOT8_1752054226
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> > I assume you mean dynamic at boot time?
> 
> Jon Lange should weigh in here... he's the expert on this.
> But I believe it would need to be dynamic at run-time.

i.e. support for SVSM_CORE_DEPOSIT_MEM ?

> Being able start with a "reasonable" amount for page state while
> allowing for expansion later if needed is the preferred solution.

What events would trigger the need for expansion?  Would OVMF (which
typically would run for a few seconds at boot) need to support that?
Or is that something only the linux kernel (or other guest kernels)
would have to worry about?

take care,
  Gerd

