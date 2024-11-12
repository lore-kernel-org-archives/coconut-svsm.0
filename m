Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id C26872C2084
 for <svsm-devel@coconut-svsm.dev>; Tue, 12 Nov 2024 09:44:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731401081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=FkAnOvhkJiDPAh9cGA9+RULJUq5zEzQsLcmVMPmgOJY=;
 b=TRu9kRYMzWTLG2aiP2oivUl/2a4evB0db3jwFECTvsX7J5xdPi2E17JyJ7/TI72oct+nTP
 3OC2mgQ4c4YEFAHH3cClxTi776VbWU2v46G1TZ8WRGkPRC7RJcXEAOO9RyzhK5IpL5Ndcd
 oeUk2y26yPaQcQFJ73WL3rfbxHZ8dM4=
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-e2904d0cad0so9069239276.1
 for <svsm-devel@coconut-svsm.dev>; Tue, 12 Nov 2024 00:44:39 -0800 (PST)
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 12 Nov 2024 09:44:27 +0100
Message-ID: <CAGxU2F4AN+3cNcDKAciLkYAMkxKe5CA5VM7YjZfzb8S4H5HboA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: [svsm-devel] Coconut EDK2 fork issue with subhook module
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Joerg Roedel <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev

Hi Joerg,
there is an issue in our fork about initializing an EDK2 submodule.

So currently, our fork has problems when we initialize submodules.
Upstream have already fixed it and I backported the fix here:
https://github.com/coconut-svsm/edk2/pull/4

Can you merge it?

Thanks,
Stefano

