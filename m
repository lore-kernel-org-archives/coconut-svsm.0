Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 71CA242EB0
 for <svsm-devel@coconut-svsm.dev>; Wed,  5 Mar 2025 19:22:59 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ab771575040so206122866b.1
 for <svsm-devel@coconut-svsm.dev>; Wed, 05 Mar 2025 10:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1741198978; x=1741803778; darn=coconut-svsm.dev;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PyEQZ3hX02+NEl55KdDYbHk0j8tOs3DnrCcb4MtdiSg=;
 b=uY6t2uq+bX1S3CHaeu2/yLjunh8KKUXqpEVYOsLDODBBQiPGVaQ97CZUHKtyXJESOu
 qdBPf0DH6fI8NieunPk1nYv2+xavvShQblc88YxX6CWodjt6Chy/xvKl/GY8JYSPB8UA
 UqzoiSdxgjgXBQL8Fqi4A+UbJUGp4EUJ3ze/wSzxbgf+hK6WkAiNlgOrA/TH0X18DtuT
 /fwtjS1pRlQ0Bj4Em+P0qR2tySKjXHscednZ2uwkUMfpjVcEhQCYrDDgtKUoScao5uMf
 CjT3sNz/dXFPmTHoJA45WJMkwaMYlFEyKvHhPjtif23Ki/N2tWc0HbDafS6DSRCfNvGs
 lPDg==
MIME-Version: 1.0
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 5 Mar 2025 10:22:46 -0800
Message-ID: <CAAH4kHZmmDtJm1ef4kMuBWheacYW7QmttLUZsx8M2QP2SSLU=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: [svsm-devel] vTPM send command extension
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

On the topic of updating the SVSM reference, we discussed in the
developer's call today that we really do need for the
VTPM_SEND_COMMAND call to make the buffer length known to the SVSM,
because there's not enough information in the input for SVSM to make
the determination that the given buffer is large enough to receive the
response.

I propose VTPM_SEND_COMMAND_EX, where everything is the same except
RDX contains the number of contiguous pages starting from RCX that are
available to use in the response.
We ought to update the original send command to limit the buffer size
to a page for safety.


-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
