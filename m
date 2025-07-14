Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB631FE461
	for <coconut-svsm@lists.linux.dev>; Mon, 14 Jul 2025 10:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752490158; cv=none; b=faMujeDzwPPfiHB2l4cxSu5bPXIKgvUOUyYFAzVGgNd3iP/rIrXIhQ3bhdHHexqY5e15Av16/hAu5OykaWYVoVodvwsc+58AdWunSpeEuDr1Dm39/GFZYRw/jHiujUauLUFSU/DRVHVvZHrSAVZKzZ5W00Yq2JKPzNXXlvhMTio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752490158; c=relaxed/simple;
	bh=ZboqnaKGLbrOCpqKOULtvMOdqNdy7RxTTBZJ4gcUJwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RhfS/R+EJMaRd5caVJ3TcPqvhUpnmFxH95r8DkyRrRWBVrZmSD0aUeTyoJrHBgyQEx2x2TKXYV1CLdYFOl8ETs+K7mynuSV1Pl8G0/J7mujkKTWOe2J3m708dXv9+XDZ/mpaQrL3A50i5WY/8ASv08oI6XN8w5v7Gy74FpYoksI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UurfOWVL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UurfOWVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752490154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MudZ5AK/fhk7BjC1FhqEwhh6CMT62St20v1fHU2vQPU=;
	b=UurfOWVLqA0wgLZQo8eyc99qqapgHEbAucHNeASN6obNKype37z2QnqZGga8/YY74wZNhq
	9SFB1elqKTsv/qth9Yp6N2ToxXN8GUstH1HHzYUjF8JzAL5oHtVR9duFD37wvxSl5RD4r+
	ojWCv4+AX883BmiDTZCpM53IKepARuU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-ajcIioZpNu67Tp6YUJz16A-1; Mon,
 14 Jul 2025 06:49:13 -0400
X-MC-Unique: ajcIioZpNu67Tp6YUJz16A-1
X-Mimecast-MFC-AGG-ID: ajcIioZpNu67Tp6YUJz16A_1752490152
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 77C6E195608C;
	Mon, 14 Jul 2025 10:49:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.214])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1FDB730001A1;
	Mon, 14 Jul 2025 10:49:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7AC961800DE8; Mon, 14 Jul 2025 12:49:09 +0200 (CEST)
Date: Mon, 14 Jul 2025 12:49:09 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jon Lange <jlange@microsoft.com>
Cc: "Relph, Richard" <richard.relph@amd.com>, 
	=?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, "coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [EXTERNAL] Re: SVSM Development Call July 2nd, 2025
Message-ID: <axljobcnpe6oct5v7edaocroajirywcft5z6lgtnoh3s6tj2r6@cux7zhrgbqnc>
References: <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
 <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
 <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
 <d579919f-6e66-4499-8634-e258af61c933@amd.com>
 <aq6225hfazqsbqgx6fhj2klst52wdfivfa6xj2ost65sg5fq2r@4yoqnv2tp5nm>
 <LV5PR21MB5210A051A344852EC30C089CCA48A@LV5PR21MB5210.namprd21.prod.outlook.com>
 <auq7txxlerpwzl542o6rkjams22cy6rb2xoi3f7lbej6u47svi@rto2jldlvxyh>
 <LV5PR21MB5210915F19D877E261E66ABACA4BA@LV5PR21MB5210.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <LV5PR21MB5210915F19D877E261E66ABACA4BA@LV5PR21MB5210.namprd21.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rcoHWuiglQx5vxq9cHRs9VpUmI5XrCWjOaImA8p9Gvc_1752490152
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 11, 2025 at 05:24:06PM +0000, Jon Lange wrote:
> > OVMF doing svsm calls for this should work fine (didn't actually test, but OVMF does memory validate calls quite early at boot, so I don't expect blockers).  A protocol along these lines should work I think:
> 
> There are two challenges with using an SVSM protocol to discover the
> memory map.  First, at least as I have been led to believe, OVMF isn't
> able to execute SVSM calls prior to the point in time that it requires
> the memory map to be available.

This is not correct.  Experimental but working patches:
 * coconut: https://github.com/coconut-svsm/svsm/pull/760
 * edk2: https://github.com/kraxel/edk2/commits/devel/svsm-memmap/

> More importantly, though, SVSM calls are only available on SEV-SNP
> architectures, but memory reserves for page bitmaps are required on
> all platforms that support COCONUT-SVSM (TDX today, and ARM-CCA in the
> future).  Devising a protocol that only works on one architecture
> doesn't leave us in a very good place for the future.

Huh?  I've assumed svsm protocols can work on TDX too.

The calling convention for guests to call into svsm surely must be
different on TDX.  But I've expected some similar mechanism could be
used ...

> Whatever design we produce for TDX

Can you clarify what options exist on TDX?
Pointer to documentation is fine.

thanks,
  Gerd

