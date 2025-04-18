Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E51E4487B2
 for <svsm-devel@coconut-svsm.dev>; Fri, 18 Apr 2025 10:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744964595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTClBF6C/7MsRak2hzaexmcEeZ+I8iVApQoyPKWDL6A=;
 b=bFTP0BUt70rvODE6bDainFz5NPPdbmho1W+hZQDqHeK6aOAAYEUS8HuAZBveJGMbpkE10/
 aiNbIEaNv+Caeiq6PYjWkvQzk0OWK2/tpF9yz35Iukk9ZIXomb+imOWozGYuw34jL9CbCY
 a/5/cAmAHDSgOR9oqaPXLTIMmWJDxw8=
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-e6ddf3f05easo2642310276.1
 for <svsm-devel@coconut-svsm.dev>; Fri, 18 Apr 2025 01:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
 <2c9d2894-db39-4a87-a1ab-08a12add6f0d@gmx.de>
In-Reply-To: <2c9d2894-db39-4a87-a1ab-08a12add6f0d@gmx.de>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 18 Apr 2025 10:23:01 +0200
Message-ID: <CAGxU2F5nfjVRd6CaXVpi8oab2ExNaRA90Xtd9fFAX3ZawFTF5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] Potential project on implementing AMD SEV
 emulation in QEMU
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Dohrmann <erbse.13@gmx.de>
Cc: svsm-devel@coconut-svsm.dev

Hi Tom,

On Thu, 17 Apr 2025 at 18:24, Tom Dohrmann <erbse.13@gmx.de> wrote:
>
> Hi Stefano,
>
> (I do realize I'm not the Tom you wanted to ask)

The question was kind of for everyone, so thank you very much for answering=
 :-)

>
> A while ago, there was a CTF event (hxp 38C3 CTF) where one of the challe=
nges was about attacking some code running inside an SEV guest. The challen=
ge authors implemented SME & SEV for QEMU's TCG backend, so that players co=
uld participate even if they don't have the hardware. Their patches are pub=
lic. Their implementation is probably not complete/accurate and it's likely=
 not particularly cleanly implemented, but IIRC it was good enough to run O=
VMF and Linux. It might be a good starting point for someone to look at to =
figure out what needs to be done.

Cool! Yes, this is really a great starting point!

Anyway, the link [1] you shared talked about "AI1337 processor.",
although browsing through the other challenges I found this one [2]
that talks about Confidential VM, I guess you meant the latter.

Thanks again,
Stefano

[1] https://2024.ctf.link/internal/challenge/6b7ff9d7-efc9-47fc-a06e-4ab9ae=
6d9eaa/
[2] https://2024.ctf.link/internal/challenge/16e69ddd-62b2-467a-9bbc-2ed086=
7c8e48/

