Return-Path: <osteffen@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 469D941A50
 for <svsm-devel@coconut-svsm.dev>; Tue, 18 Feb 2025 20:05:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739905504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=lpRHGUilIOby4OeThnmZItzNgME/1YgKcYdJ9GWjm7Q=;
 b=MI0mKWa635t1vD4AHdt2zCEwTd/Fc0/lKxD0s2aKo9ABYibclh5VS6D0Hw6JmXYGCJW7ym
 3Mkli6MLLVWrlEv3ZCFpZfC7oW+LWwspyNFjSnIwqEbwRAFS5mfCNrFweBh6EI3XFopGz+
 09peCxpFl8uPUBPyqUf3x3GW4+Qt0Pk=
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5461db6468aso1286995e87.0
 for <svsm-devel@coconut-svsm.dev>; Tue, 18 Feb 2025 11:05:02 -0800 (PST)
MIME-Version: 1.0
From: Oliver Steffen <osteffen@redhat.com>
Date: Tue, 18 Feb 2025 20:04:49 +0100
Message-ID: <CA+bRGFprMx2s6scqXgjdrDUG2JOz0ybp6Srx0g1kp2ahSCoJuA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: [svsm-devel] virtio-mmio base address: fw_cfg vs IGVM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi all,

In last week's meeting we talked about communicating the mmio base address
for the virtio driver to the SVSM via Qemu's fw_cfg interface.

This is easy to do, but now I am unsure how we want to
handle hardware information in general.

Currently, the serial ports for logging, gdb, etc. are configured via
the IGVM file.
The address for virtio-mmio is not really a different thing. Shouldn't we use
a common approach?

Using the IGVM file makes these things part of the launch measurement and
requires rebuilding the file if anything needs to change.
Do we want that? Or should it rather be a run-time configuration?

Thanks.

- Oliver

