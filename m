Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 8BEBD431CF
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 02:18:02 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-abbc38adeb1so278563766b.1
 for <svsm-devel@coconut-svsm.dev>; Thu, 20 Feb 2025 17:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740100681; x=1740705481; darn=coconut-svsm.dev;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=apJwQDH6bcvS1vSuD610QmmT9QB3YAOn0B6YOUH3KMA=;
 b=TBBz7vjKV/CHGjImwWSu7m06+KiCnDTK6YiW0ZzwO2su77TX1j3G7dnEkuuYic4Rd5
 QpLVQwVidtAMh0p7Y5At8pjXflJvCc4okIBtZMeJgYNs3RdvW38S/+V+ZCYQb0xfWfpg
 +MJw4Pg5cLNM91442n0HSHiwUe2H2T1lY0Fo4DVEebhPTl/K6CjF23VZRrPffAmVF/bx
 gSZW+usUwaGuRY+J8cjQ9m+knffUJL/9iFC03M9K3EZlViDSznd/j5ETAOkubZSEIZEP
 uyyduEZ6UYxhHvTQRC0vucnJTRBxgPkSXiKgM7RDuf5a/+ZNOcnaLi3bnKZss9/y94CQ
 ZGIg==
MIME-Version: 1.0
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 20 Feb 2025 17:17:48 -0800
Message-ID: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: [svsm-devel] vTPM service attestation format update
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, James Bottomley <James.Bottomley@hansenpartnership.com>

I'd like to propose a new version to the vTPM protocol that is clearer
about its EK information.
It's possible to create multiple primary endorsement keys with
different algorithms.

For manifest version 1, we have a list of created primary keys in
TPM_ALG enum order, not creation order.

0x000 uint32 Number of primary endorsement keys
0x004 Variable Number-many TPMT_PUBLIC structures

I don't want to try to load a lot into this change request. For
reducing pain with make/activatecredential, there's more to discuss.
-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
