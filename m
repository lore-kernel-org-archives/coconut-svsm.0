Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615A738C2A5
	for <coconut-svsm@lists.linux.dev>; Tue, 26 May 2026 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810411; cv=none; b=CH6ObyZWrvielQUpqpPpZeO1V8OJc/6cbghT8DfGXfF1ihAKz1Iu59eManNJLnnbVXdkCm8Hxh3p2jFqT0h/Np6wNZNsYR54Z6wehUhyS0TCdisVUt14WWOH7OkPpCJ08qUk6G5UnTAviXXQO8sNZciGZZRJF0IpNWNSEKIwOjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810411; c=relaxed/simple;
	bh=kQ6MFm1RcBK5lthrtsS3tKwgEUgIjQSVP8M3aj6hNVQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=IpLUvmvuPwmYjsN95rmzXXbzUN+aNl2aMCqAHNdEJNASyWTj23K30mRJo2YQIEPeAhk1xTrBC+4jkWYbI0/WkDpOoRXxPzYAOQLd3S79AAUj34kpjMlMViEOJksmUKmW2OUQvOQ9OFFJ7kEry6w/5ZGFK/xUAXZFBv2Iy8HDL/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CAgbAAgd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CAgbAAgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779810409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=coBt7Zb3aZ3ZG0mTYJhcJ0JzfkK/zs88iplrFlJsbyY=;
	b=CAgbAAgdZYsAYKsxIeM4y6jtZ8F7G6PdtDKXBIKQXgMvnoJlf9Vyn335yaM3dk1/xn7bq6
	SBXtgR3M61O0O9nuhtfNL8MXb1WZLmtHUloUavYwrYFscqfuX9N1yC0zDOBnjyFaSMZfv5
	LNy+Wf0rRjOSYElqaAbVaKAkaXjl6ug=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-PFadKmCXMp-ZE-Ty63gibg-1; Tue, 26 May 2026 11:46:47 -0400
X-MC-Unique: PFadKmCXMp-ZE-Ty63gibg-1
X-Mimecast-MFC-AGG-ID: PFadKmCXMp-ZE-Ty63gibg_1779810407
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc763c7256so233227565ad.3
        for <coconut-svsm@lists.linux.dev>; Tue, 26 May 2026 08:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779810406; x=1780415206;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=coBt7Zb3aZ3ZG0mTYJhcJ0JzfkK/zs88iplrFlJsbyY=;
        b=PadvydT/Kh+9Ioh2McOFJxsHwMc6ng2kG8v6uxNS0OJfKjU+p2hea0oSihBiRuMPTm
         mro6lpV3KmlqRWiDgu1B2RHM60v1oQpLgmXLB97dMAP8UCraRJQFZIIb1vcID14WKmuj
         gWWw1K56LAFz8W1EkNH3iDv7lsbkacHR7utj0qL3+7ivrrxDW6AmFswKHXUf4ykALd7T
         hN+ynt+UncHw2v35t71Dv0hdhCB1wKGU5AlZ+5e6/k7kSFjz9Ugx0DTBStgi10BogF6s
         uCxnxCLmwM2pczi/Z6tcRHoFR4p9nJLtcZwnQWV8XabC0P71/CichNYYrtAqUFlohdYT
         puMA==
X-Gm-Message-State: AOJu0YxI5ZoB6jac2nHQqvtZtIl0W+J8CDCk6X0d622xI0c6OODS6BBF
	RXhthnTB1P8vNpwAK6UUO4j9vA1uwFbZCmime4XB8TKr5q6xgBHDXMXQohwgWAjLJEqgTs0/i9c
	Xz935rVMja12dHSmI4gh/uTO0Dk0N5XYqi0M4fGh7GAke9EX9eFscCVXpX289xJo1IU8Y6Cs4Cl
	CMSFmvN8EWXtq8n/DnK/Lqlw8RtsCir8f5y7h+lRMvRvGfPS13pXU=
X-Gm-Gg: Acq92OFW81+y66DqvgbIhrvYG8trkSQYEt6g1a/b1rzpNx8OYiN71HZoqwFzcHOqUJr
	jYokQRAJOBacp1MZzWrw05NJfpstkmMZyE5sT2j+Nw5uJQK1Rt47PaWleXg2U5xwDoUEBfIy/Rw
	Z7Jp2Bcq8Z7U1f4/vygfntMSaz4cpW7oQtzJ2mx8IQmiuNjiJR0ag0VmrA9EOZlFuDAiAf2f6Xm
	stw
X-Received: by 2002:a17:903:390d:b0:2b9:8d39:5e87 with SMTP id d9443c01a7336-2beb0657112mr195126995ad.10.1779810406565;
        Tue, 26 May 2026 08:46:46 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2b9:8d39:5e87 with SMTP id
 d9443c01a7336-2beb0657112mr195126665ad.10.1779810405978; Tue, 26 May 2026
 08:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 26 May 2026 17:46:34 +0200
X-Gm-Features: AVHnY4L3nOjJR38ocxZeT7riD_InnfNotcXGoStd6H43t02pPyJbpziDl5UZVbs
Message-ID: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
Subject: SVSM Development Call May 27th, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D20Q37_yIH1iVOAeiC4YEvY1y7n2d6n4ruq8U3WjUe4_1779810407
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this weeks SVSM development
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

