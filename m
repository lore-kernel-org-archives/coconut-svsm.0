Return-Path: <osteffen@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 7FC912C1377
 for <svsm-devel@coconut-svsm.dev>; Wed, 11 Dec 2024 14:26:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733923580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Ilxatb4ZvowuGWdBO/miUuujDDn3dFvzYs9TzUV/lZo=;
 b=K4crvvhjQcpjFYjloOd9N0KjSlLFvZH5DqswWb51n/p7cqmC4A2hstc9QNv80OHKBcncR2
 2E9CtcckFSBMJYnzJ916c0wxva5R4WW0tBZOFJ8sfxQyuvcg0YlVhFCOdcMbHRmUN2gESE
 Zs/rY828eOijs3UJGr/8MmGHYRxgjdQ=
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-3023936c474so9993371fa.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 11 Dec 2024 05:26:18 -0800 (PST)
MIME-Version: 1.0
From: Oliver Steffen <osteffen@redhat.com>
Date: Wed, 11 Dec 2024 14:26:04 +0100
Message-ID: <CA+bRGFr6Fhuy+27ov3kykvt=0jJnf+S7BAxbqOsARZf5Uw_KHg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000cda7de0628fe8a60"
Subject: [svsm-devel] EDK2 vTPM driver: new PR open
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev, Claudio Siqueira de Carvalho <cclaudio@ibm.com>, James Bottomley <James.Bottomley@hansenpartnership.com>

--000000000000cda7de0628fe8a60
Content-Type: text/plain; charset="UTF-8"

Hi,

I pushed a new version of Claudio's PR for upstreaming the EDK2 SVSM vTPM
driver.
It implements some comments from Gerd, but the general approach is kept the
same.

https://github.com/tianocore/edk2/pull/6527

-Oliver

--000000000000cda7de0628fe8a60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,</div><br></div>I pushed a new version o=
f Claudio&#39;s PR for upstreaming the EDK2 SVSM vTPM driver.<br></div><div=
>It implements some comments from Gerd, but the general approach is kept th=
e same.<br></div><div><div><br><a href=3D"https://github.com/tianocore/edk2=
/pull/6527">https://github.com/tianocore/edk2/pull/6527</a></div><br></div>=
-Oliver<br><div><div><div><span class=3D"gmail_signature_prefix"></span><br=
></div></div></div></div>

--000000000000cda7de0628fe8a60--

