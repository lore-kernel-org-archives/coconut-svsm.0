Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 0E5CD463FA
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Mar 2025 10:36:54 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac2902f7c2aso298135966b.1
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Mar 2025 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1742549814; x=1743154614; darn=coconut-svsm.dev;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gAMFw6EP08Uctmjh9Y2tnw18yYMhGMAV2u+m54nMeE0=;
 b=gYfdTlptE4piihErab7gC2/tPBPG88pOWfhZ112f3GkomArqm0JkMSkRn0I8awaofY
 C70Xrs+vbytjDi96nDOu+73X3UJwcUEUxPTmDIqydWtcxQ1AMz/awLyRkY8WCMUZr9p3
 3lm4oHrKTTj42SxMIJYDA5Sci5PAEpmPix99EMbvM7q5xEYvqd7YCgFujPyJK90ufXOg
 hqGobGGYPT6YKwDtpPSJOWsIMNYabq/NQiLAKiatP2BNlLzELrsRdcFFJAA9UFzvI+8L
 jaiUcbUqXskH0V8bHdfgans1GVd1aVdlu2Opjz4e9hyPKZPz+oy71n5BDbLvgL9RiMeL
 PMwg==
MIME-Version: 1.0
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 20 Mar 2025 14:19:52 -0700
Message-ID: <CAAH4kHbv6ZcUT2KVhFS02RAVpJTjrVX=5x+5J_j4LnSkrc4sQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: [svsm-devel] Attest multiple services guid byte order
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi folks, one more request for clarification, since providing attest
single service necessitates providing attest_services to be compliant
with the spec.

The GUID table that is communicated for auxblob (certificates from the
host) has been clarified to be in big endian order, whereas the
service_guid for SVSM has been clarified to be in little endian order.

For the GUID table format parsers written for auxblob to be reusable
for manifestblob, I'd like to recommend that we output big endian
order.
The general idea would be that guids are consumed in native order and
produced in network order.

Any objection to this?

-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
