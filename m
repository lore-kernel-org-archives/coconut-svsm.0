Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793869;
	b=sXnGmCn146gq7QFOSLapEqDRYy72KXIy2f1VQEM361rvzeFeVFgJoMDky4s2HF2DzFL5
	 UNh0/IImN90ssHhUueu7Qy6hiEW0k6/AKebAv/XFqUqc3YKLKxli/f966mCMe+0TYe8EE
	 e/bKnj9mk9d+qq7IOdah6AescT1INleD8m7EYMwFBk/+SAwgN8RRqPr7lddeGSFNnBxty
	 6H/+gHdQpHx0aIxtyxyamZEC4MCgT+Y2rYx01wBdMtW4z+fJFFeXGHOCIwUljdgzlemuI
	 5lzP+DCiqElJuscL4razYDdtMuJ6BNTzQOxXIve258qQtYPx3U5nI4TbJNj/D0VmDPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793869;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:In-Reply-To:X-Scanned-By:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition;
	bh=AWsY6gF0fsVDqvH/4ZMLK8d5IyM2JRwhdPFY54zOmUo=;
	b=hcc12Im2I4f8g6w8IG6jDd3UrLWa3/r7lv+cwfdMhDOLlVjVOfPMWgDw5+pV/bb0YsBk
	 MC5KvidtPnivFgWnfwkhPvWk+54Ucsi4pI4cLLKjUgNGLCSy0E0F0yMixrGPMch6yDjdZ
	 kBHXxOVyodXup+cw8dz8lkagZvSg/BUqO8swxtRZkxpN3j51I/rIHrhDUcLssfOh+ca8F
	 xBwj0jlTU9Or8UhYQhSdkVyVCkBtESbDn2q7nlIsAc0wCcFQGJeAV7/GO3tC1NC71HtKs
	 r9lzm9+eHSb88qDKXg1WpfrKaPMcxkwpurOWhWemQuqOB2NAdKtam85JQ15rTVBLtFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VHHpn2xR;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D56B606A331
	for <coconut-svsm@lists.linux.dev>; Fri, 27 Nov 2026 15:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D56B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VHHpn2xR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795793867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AWsY6gF0fsVDqvH/4ZMLK8d5IyM2JRwhdPFY54zOmUo=;
	b=VHHpn2xR3aA2LY1o19DjfLukUpgSQetxMKAluI5cWo7EZUaJbRfifzLogYHZMeEx/cn8tF
	woLSToq8fooPQnyBQCdjlHGpKWemR6NJQOvB32vCMD4sHxbbNfUV+X9pJKMp7tzPqCApH2
	D9OQ/Jf9cbfALgshDUZ97tNkMIyFIx8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-b1UZVrUOMZS6UQWkVZu-fw-1; Fri,
 27 Nov 2026 15:37:42 +0000
X-MC-Unique: b1UZVrUOMZS6UQWkVZu-fw-1
X-Mimecast-MFC-AGG-ID: b1UZVrUOMZS6UQWkVZu-fw_1795793861
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7608E1955F45;
	Fri, 27 Nov 2026 15:37:40 +0000 (UTC)
Received: from nucbdw.ghoffman.csb.home.kraxel.org (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BDCC31956042;
	Fri, 27 Nov 2026 15:37:39 +0000 (UTC)
Received: by nucbdw.ghoffman.csb.home.kraxel.org (Postfix, from userid 11758)
	id 9DBFE40774E0; Fri, 27 Nov 2026 16:37:37 +0100 (CET)
Date: Fri, 27 Nov 2026 16:37:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, 
	Mahmoud Nagy Adam <madam@amd.com>, coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: Discussion on policies around minimum rust version for
 coconut-svsm
Message-ID: <awmeo3YNfKSxVkSO@nucbdw.ghoffman.csb.home.kraxel.org>
References: <d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>
 <65vkyfqwo92zb.fsf@amd.com>
 <awglpsRXwJRS7aa5@8bytes.org>
 <ef51cb7df408839ce80921d9133020c46da3c27a.camel@HansenPartnership.com>
 <awkz05_7U4lmN17K@nucbdw.ghoffman.csb.home.kraxel.org>
 <c84cba39a4bc68a20efca97b617cddf107761838.camel@HansenPartnership.com>
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <c84cba39a4bc68a20efca97b617cddf107761838.camel@HansenPartnership.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eJ52o-paztOIJfOp3RrOjnhJMbaomSklYk67a3TrVbk_1795793861
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> Would I be right in guessing it's just Cstr16 and the variable
> interface you get from them?

Yes, for the most part it is support for those uefi strings.
Also Errors and Status codes.

The variable interface is actually internal, but it needs
parse uefi strings ...

take care,
  Gerd

