Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD92D27D782
	for <coconut-svsm@lists.linux.dev>; Wed,  2 Jul 2025 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464968; cv=none; b=vFEWYAcSNxDyVxQJPRTQN0q7R3raDq1DAPbP+XKWp7MYgW60siz05DZtNL2veiDCsy/7rw6OhAtUljUUBfYKU5PC8weHp2p4mI1NSfpB8wSg91T30YvttS3XILvzwbpotR3mHfrEfm7Hw79ada6Ffur+/MCNdJska/jRP+CQ8cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464968; c=relaxed/simple;
	bh=ErCK7yguAWcz+ldbHMaO+Z46QM9hb5cFYkAerTVoFyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LT7Ftr/mSJOdLwYc7R2LglwAMSkeDxLCoH5wtYnv2YbNX5QZ4cwhmo8XVGrERbaDh+WwkGonTclWHj+z2UFynY/DPM+kF85O/mOrgg0POTNwmR1Uq4RPycbwNpjMDUVPaJwXpp5GO0zDh1FjZWPzGyDzza69s4BYhXwWxDSzCcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hfE/yZX+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hfE/yZX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751464965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X3PHPJfbgRQnN33dqUpLVbEh914SefL2p0rxJQRrSZ8=;
	b=hfE/yZX+C19TDbzhYx7OFp6+HhGBeK7ZsUZTyOGlR57M5TFg0OjOViQpFcKxhptN8bzY0m
	fWEdOMY6RUYkfVPZao+/Nmkd8Ini9/KykI7S44e0IH7UFocD7Fur5XoRe4/TKi26hwsGz9
	lz0JIYICZNJ3N6RTH9OXBXyQujk0Kng=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-baRqHwFNM3ai_G4f25ilUA-1; Wed,
 02 Jul 2025 10:02:41 -0400
X-MC-Unique: baRqHwFNM3ai_G4f25ilUA-1
X-Mimecast-MFC-AGG-ID: baRqHwFNM3ai_G4f25ilUA_1751464960
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF394193EF52;
	Wed,  2 Jul 2025 14:02:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.226.82])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D1B9230001B1;
	Wed,  2 Jul 2025 14:02:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 51F92180039F; Wed, 02 Jul 2025 16:02:36 +0200 (CEST)
Date: Wed, 2 Jul 2025 16:02:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, coconut-svsm@lists.linux.dev, 
	Dionna Amalie Glaze <dionnaglaze@google.com>
Subject: Re: SVSM draft specification
Message-ID: <nzsh4ygk44scv3olsoccr2emv5spslt23owtywmhfcqfkbc37s@5kmonxhcz7aj>
References: <fe3a4825-d079-0fe8-3fda-ed16044a048a@amd.com>
 <47bf2466ae99d797c8f10f071fd919ad3df6b409.camel@HansenPartnership.com>
 <b2cab079872b6e0588743d4f93a769f1844cda6e.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b2cab079872b6e0588743d4f93a769f1844cda6e.camel@HansenPartnership.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OnqHLGzJnKuaXiIglva0eqESb9lq0JwOVX0uKr-acM4_1751464960
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> However, even if we get a UEFI flash persistence service, updates to
> variables will again be the province of OVMF and the SVSM will just be
> providing backing storage.

No.  svsm will actually manage the variables and verify updates.
Current version can't handle pkcs7 signature verification yet, so the
secure boot variables are read-only for now.  Also they are not
persistent yet.  That is expected to change as crypto + storage support
in svsm improves.

take care,
  Gerd

