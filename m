Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A0F38CFF1
	for <coconut-svsm@lists.linux.dev>; Tue,  7 Apr 2026 16:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579799; cv=none; b=KiJtk2hDzbK3pH7u56DWE7cBXxDorqhKfqc+APAp0nMuTXleD6ISbMho+UnZ9Jyng7XMYEvCmgAtbtCdMqHBxb/p7o74R1rkI48LAvgLTBzYmgpM6ewUMRWLZiwHZfvXC4r/p1q12hskiVUk0SRTu2sz5OmCW9QSikdDQNcfYE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579799; c=relaxed/simple;
	bh=ZsZWGK8NPQVAaVImU3h0Z3K3DNLW37epYpfvEpL7kmI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OCB9oeh1OU3TdbXLdsqQni4IBrzc3HxsDpOSgSLACr8ceZ76YVvh/q64NsB0x5vc1yCwisFhZYbOITqNVny//Md6VuQI/uniqg9fj4/aConjnUD/r+urZSx4+5k45zL2TGSstD71Pu8x6qqjuHNLEvFLEaJfDVILu7gLD7Eobug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H5MCBVjR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H5MCBVjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775579796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=LJCTQ6yvzucVb7LSRfCEx4d2sHWJ53AMLsBBh6zk0Fo=;
	b=H5MCBVjR25lE28jUnhFyKsHiOP/jGTvRgT57rt5KZW3VP39oSZb0Z2Ubi2cjtm4Rduupbp
	gP6U7jGMtZ9EL9yp9lbIC/QRmmo3J+5qSh1I5Vo8OqYR3K09Mty+k0+tEAfXodC2nUc3Gt
	ZpbjTahDovADZmrKK3GF4rakTo0Ho4c=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-f8NqkE1iP6KmD8XRd4DQJw-1; Tue, 07 Apr 2026 12:36:35 -0400
X-MC-Unique: f8NqkE1iP6KmD8XRd4DQJw-1
X-Mimecast-MFC-AGG-ID: f8NqkE1iP6KmD8XRd4DQJw_1775579794
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c1107da15so5708914a91.2
        for <coconut-svsm@lists.linux.dev>; Tue, 07 Apr 2026 09:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775579794; x=1776184594;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJCTQ6yvzucVb7LSRfCEx4d2sHWJ53AMLsBBh6zk0Fo=;
        b=Ay+5gx2Nea4Bl42zMJVyY+4lREZnbuv68VA3l9UBRkgmIGM0uUmqw/4h/wBjyu/vl4
         lbx3kdt1T/DZrh1hYNLgjMAKXB7gvdgf77gokvTmC9OR9/D3UeU8ghzpZPmSUc/c0Ovr
         K6EzlAXhu9Q02BUtOjafU45mGJTQPQqkPtEATvDMsVLJ8tnogoQ6QL9ORVO9vY6xUH3x
         3U6Vg/NZlmC+U8y0BmBYKynoC15pTGXtWG1XakPeNyHyVTlq5CybS7O9wLLUKYS7jg9q
         2AaYfYexqDvpcomLP/A2FZWNBnrJoEnMF/MyyFK44CxiF5k4NNKoZJagZLYcJ640yLYk
         tjJg==
X-Gm-Message-State: AOJu0YzHDMw9yOhETi/SxPNoQW9rdPQAP7+18jdEM4NO5yza4MQMnwkI
	xPrYslkfj/a9Guvy8WoHmN2Q43QldR8rAENzGNKtpdscd1OyuTdyN116khh7DxFkmzjb+zspQhi
	H71EWmG6vdoCswzT/g1fr6PoN4bzbk7TVWUA1czHTzdHlb1RlKWQ7/JJFvjA8RuFYI5IMRL9BUA
	K5/QkkvkTyDEpSKANzhe0T07VFgUysNKvEJWOB4/2A5pEXWaWWFfs=
X-Gm-Gg: AeBDiesEbq5oM682w4lms4pETj/Re+NqdRyNWEdHOXGF0eBeV9TF8rR7lJl9tpcTpOU
	DKZEl3GX8+NIz0WTOsv63kbqVMctlBIyiQJ/D/rQSkoWb6EHf8bdcQSVaufDoNZtVSUQCERLTxS
	nz6vKuYx+nZGkS5yy3fFRTxBJVlA42VaCrnib4O5YnH+V0ktb0XTlSMEUF+bzT7Te48Fg2oXijI
	Knu
X-Received: by 2002:a17:90b:2e0d:b0:35d:982d:96c7 with SMTP id 98e67ed59e1d1-35de6980b71mr18628842a91.27.1775579793955;
        Tue, 07 Apr 2026 09:36:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0d:b0:35d:982d:96c7 with SMTP id
 98e67ed59e1d1-35de6980b71mr18628800a91.27.1775579793278; Tue, 07 Apr 2026
 09:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 7 Apr 2026 18:36:22 +0200
X-Gm-Features: AQROBzDB-aEaoPKvHT8F596oTqnKgNiJsmIBcp2TBkUe2U9M5Fm9UyxZ_pqFgDQ
Message-ID: <CAGxU2F6OApB3K61_sPujnvK_gx_K8zFWyOSTPV9mzWOCyNkBJg@mail.gmail.com>
Subject: SVSM Development Call April 8th, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6DYZMjafY1VdGfsn-iQmlOJacAN2W8lBZxRovGz9sb0_1775579794
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this week's SVSM development
call. Please send any agenda items you have in mind as a reply to this
email or raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting can be found
in our governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,
Stefano

