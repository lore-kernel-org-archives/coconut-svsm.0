Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 178A443F91
 for <svsm-devel@coconut-svsm.dev>; Tue,  4 Mar 2025 17:16:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741104968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=eqsXsyxO1KVsnnLWSz+A1YdPbG1qCjXfcy058K8vyIA=;
 b=J1pWPtDcvQScI7XOKlpMU9/eLNhkFtfAxMnwhUiJYTfzhK2A68r6T6fQBf81/D5uziIrmV
 p2woFb5+HjzGNF5MJ3KJuWAHrMeuCLkK+MSyMv926nPq4LYiuyUbgRaTjwmKDBdxS+ODvB
 UlgFMpOS4t2BPGTYhC0fb2R9y0R1DcM=
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4393e89e910so32062205e9.0
 for <svsm-devel@coconut-svsm.dev>; Tue, 04 Mar 2025 08:16:07 -0800 (PST)
Date: Tue, 4 Mar 2025 17:16:00 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <CAGxU2F55-JDYqt62rg6HUVEZo4voHrsuPizYxv7mWO+PE0fM-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [svsm-devel] SVSM_VTPM_CMD Call question
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Tom Lendacky <thomas.lendacky@amd.com>, James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Claudio Carvalho <cclaudio@linux.ibm.com>, svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

Hi Tom, James,
working on the SVSM side of the vTPM emulation, I'm a bit lost on `8.2 
SVSM_VTPM_CMD Call` section.

In the SVSM code [1] we are assuming that the driver is always using a 
PAGE_SIZE buffer for TPM_SEND_COMMAND request/response, but I can't find 
anything in the spec apart from this:

   It is expected that the request/response structure is large
   enough to hold the expected output of the vTPM request. The vTPM
   request/response buffer will be treated as physically contiguous in
   the guest address space.

IIUC from `Table 16: TPM_SEND_COMMAND Request Structure` the 3rd field 
`TPM Command size (in bytes)` is just the amount of bytes filled with 
the request.

How does SVSM know the total buffer size it can use for response?

Claudio mentioned that in an old discussion, we were thinking of adding 
in the specification that the buffer should always be PAGE_SIZE. This 
would explain the assumption we make in SVSM and also the driver that 
always allocates a page.

If there are any changes already planned for the specification, 
apologies in advance for my confusion.

Thanks,
Stefano

[1] https://github.com/coconut-svsm/svsm/blob/376e4571099ee5e9aab8343c137600e97ebe1b4b/kernel/src/protocols/vtpm.rs#L67

