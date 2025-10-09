Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051E83D76
	for <coconut-svsm@lists.linux.dev>; Thu,  9 Oct 2025 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760017832; cv=none; b=JeXc3qVbzLtsWBlqWFzCWIdFxpE8xKn1MqrsgTJZ3ve6iikNNon8EOUa+jlM6ospxI4OKgO/1O82DmZMupjVe/dyzwyg9c0xgwcrQWLUDMU6EQCIKU7lijSwUW7X4cPtvjffqaF97FKr8/tFp8/U9+qXaw5hjL68G5z4EiTitHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760017832; c=relaxed/simple;
	bh=DjCO3WxTevRd3ScoimObLWfoAAptBotJqL3Y72s0+4k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GeiJGlX1MU3dM4bPdv7OWSYLU4p1MHxcqMb2A7s7NWEN/dFtzLXguOUnOzzLL5jjBMhqZKLNy7Z+B29uY/Ba9fe/mvef/FnoIuXdK5iOneubOxG9CS0crnBjikuEsb6zDKAeqUj0TpK0H7zGZCztRs1Wq+ViuFAHd0QvA8ahxHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fFbOEDyN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fFbOEDyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760017830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=qU6zMeJ0/ARZy55R8Auba5Y3tNCmNLUYpGMtFIVjVPg=;
	b=fFbOEDyN2mBsKxOZ3pBGkVd5pXkvvP41l3HJHFBehblpchjYAFBzX1wESJSkwv96YAE/ZC
	9dINhB9hl8z35LeEV+Pfy6826Z46skfgZN8gTCREo5ln6saqWx3nQb7dv+3CwHadI+RGWh
	zEE838ImYfc25KnsoUvHYxFxgvkPTwU=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510--qs1jPcAPqKj3_q91DuNTg-1; Thu, 09 Oct 2025 09:50:28 -0400
X-MC-Unique: -qs1jPcAPqKj3_q91DuNTg-1
X-Mimecast-MFC-AGG-ID: -qs1jPcAPqKj3_q91DuNTg_1760017828
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-632edf1e41dso1966282d50.1
        for <coconut-svsm@lists.linux.dev>; Thu, 09 Oct 2025 06:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760017828; x=1760622628;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qU6zMeJ0/ARZy55R8Auba5Y3tNCmNLUYpGMtFIVjVPg=;
        b=G406Rt61xNBo+S98mbz70yaXKPyAP9VQAHDLx2csULLbXDENa6/d9Ul9VllYCJ51Ul
         K4JDfA7IlNb9Z0W8r4AfcnJlDahVXmZElrLygwR83nJ7eUn6Kcx4BhUoEGTS5rm3CQ7H
         XwOeciks3DO7lkoTl0g9Bx8Yn6LUT0e5QHSF5DLZy8HXC1GdDrVa4kbl383Mv6Iwx4DU
         73gGt2fn0Gfc9lBED7sOFa9RGfJvdi9lfI8GrYBu0m12iokaoPh7r3zBIcPY8E7gipPQ
         oPAc0We8beufTLEkE1GX2JYFUflhAQ1b49V1eLSWMLyoD7pKdPS8ZFY34sCpyzZpPuq5
         O+kA==
X-Gm-Message-State: AOJu0Yzbz6YH5MI338gTR/N/06d2UuwnVp7wKBW6jIhPq84K1VulzFuZ
	UpjG73Z4WVtuPaRPHC7GMWjtwvBqLOgOHDPwwSIRzfgWT9FzEKzLvUVX4jxsAVSaXQAzbOsdnXn
	ICXXz3j5qad70P4JiHhXe/tEsqDrF3KGihO84Sq1phvmznINtPDwVFbdYNOfHGQnq+8xKWMQ3uQ
	9QnRkhaScWtbYDH6q9rpuIaFHM1TlzmxiAjqlJHAAa
X-Gm-Gg: ASbGnctMoRtIeGkKE4hiaU95QuuI+uBu2JwPKmHPbodKnTZ1Qw3sNn6EGuoUJq3PvIN
	xVy22YuxP0TsC/yXIpRXLQsN4ZHIlHxzBBJmWurxvEc12d2JuCe6iXxxuuS6tXw0BFp2lvmq8sT
	jDOnbSQ0LS/NscQDXiYm5ovNxTrA==
X-Received: by 2002:a53:b888:0:b0:635:4ed0:5714 with SMTP id 956f58d0204a3-63ccb931f6amr5162002d50.46.1760017828276;
        Thu, 09 Oct 2025 06:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvBVG6OOJLJG8wsYJg/5ahBsnr1oj1rBS5B5SzEro2Z3CngB550GzypHOyBlaSfKeOn7fxIJd4umWwhBggSMU=
X-Received: by 2002:a53:b888:0:b0:635:4ed0:5714 with SMTP id
 956f58d0204a3-63ccb931f6amr5161993d50.46.1760017827901; Thu, 09 Oct 2025
 06:50:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Luigi Leonardi <leonardi@redhat.com>
Date: Thu, 9 Oct 2025 15:50:17 +0200
X-Gm-Features: AS18NWBozEpO0MjfGnF71tqkXqaQvBfG3uDo70enT-b8KfeWrKaqC0uQNgGGWEI
Message-ID: <CANo9s6nV-gUFKqxaOqH7qFzLTdY3RcA=WYhhcQhdQpMXQG=Qpw@mail.gmail.com>
Subject: SVSM device assignment: device tree support
To: joro@8bytes.org
Cc: coconut-svsm@lists.linux.dev, qemu-devel@nongnu.org, 
	Stefano Garzarella <sgarzare@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Oliver Steffen <osteffen@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cLKfe_sOWrw9Jty59vgsDe8DkR4x2eIIa__897SiNYY_1760017828
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Joerg,

I am working on device tree support for SVSM to allow it to discover
MMIO devices that should be used only by SVSM.
In this way we can differentiate the devices attached to VMPL0 and
VMPLX. As we discussed in the SVSM community call,
we can use IGVM to expose the device tree to SVSM. This should be
generic enough to be supported by any hypervisor
(vs the PoC we currently have that uses the fw-cfg).

My idea is to use the IGVM directive "IGVM_VHT_DEVICE_TREE", basically
replicating what was done for MADT,
allocating a page (maybe more?)  for the DT blob, using a new index
for the parameter area.

I think that the DT parameter, just like MADT, should be marked as
optional for now, as not all hypervisors support it.

For the QEMU support, I had an offline discussion with Stefano, who
suggested creating a new object (for example "svsm-devices")
where we can specify all the devices that need to be attached to SVSM.

something like this:

-machine [..] svsm-bus=bus1
-device virtio-blk-device,drive=svsm_storage,id=dev1
-object svsm-devices,id=bus1,devices=dev1,dev2,dev3

This object would be in charge of creating the DT.

Note that we are not sure if it's doable or not, we still need to
investigate the best QEMU interface.

What do you think? Do you have a different idea for the DT support?

Of course I am very open to suggestions and comments from everybody.

Thanks,
Luigi

PS: sorry to send this again, I accidentally didn't set plain text
mode and was rejected by the ML.

