Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id CA607463EA
 for <svsm-devel@coconut-svsm.dev>; Thu, 20 Mar 2025 10:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742462753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=DOFceyZiKMPZxlkDAJ9EXjoPXj0pFFU1TQspvWYnnTM=;
 b=JMdnlB7iXE91Aymdi2fdU521KGe41Lbqqg7LtQ/srgHhc9oi/HLF3OH1LpIR/tOUlLVUFA
 OKYrqd+NDh/0LERCxp/SZHAGHQRJfqT+OSQ93DJW151UeWgRPpGikHdWN2JTYDf8CQSZ3R
 8Rb93IboHfJwTfEKynf57NyxSBD95s0=
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6fda1dcbdf1so4725717b3.1
 for <svsm-devel@coconut-svsm.dev>; Thu, 20 Mar 2025 02:25:51 -0700 (PDT)
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 20 Mar 2025 10:25:38 +0100
Message-ID: <CAGxU2F4DOAhiRd02V0U6So0XV528DAahzJGgQTqFFDuF3j1+xw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: [svsm-devel] Call for mentors/ideas for Google Summer of Code
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
the QEMU community has kindly offered to use their GSoC as an umbrella
for ideas regarding SVSM as well, since there are many students
interested in programming in Rust.

QEMU has been accepted as an organization [1] for GSoC 2025, so we are
looking for ideas and available mentors.

In this thread [2] in qemu-devel, Stefan explained how to share new
ideas. We are a bit behind schedule, by March 24 (the start date of
scholar applications) we should have the ideas added to the QEMU ideas
page [3].

If you prefer, we can discuss ideas here and then post those that have
at least one mentor on the qemu-devel thread [2]. I already have
another accepted idea regarding rust-vmm, but I could help as a
co-mentor if needed.

Thanks,
Stefano

[1] https://lore.kernel.org/qemu-devel/CAJSP0QVzNieSgkecZEjsfjwpQsXL3-7yrwech7-QH433V_u+Gg@mail.gmail.com/
[2] https://lore.kernel.org/qemu-devel/CAJSP0QVYE1Zcws=9hoO6+B+xB-hVWv38Dtu_LM8SysAmS4qRMw@mail.gmail.com/
[3] https://wiki.qemu.org/Google_Summer_of_Code_2025

