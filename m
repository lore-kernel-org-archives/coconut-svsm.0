Return-Path: <dionnaglaze@google.com>
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id BBC46430F6
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 17:33:46 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e095d47a25so4438041a12.0
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 08:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740155626; x=1740760426; darn=coconut-svsm.dev;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vh4XfVxzJcy4SZHrsUs0+Lf+o/mjW9x/b+kRf3z1jH8=;
 b=MrTCtRwUpbijK2DUs0C/wFTCtkmeJu+YlXwiMD0o/bUikXGUgZjjvvsyn3PQFYkIKV
 TvEK0/C4RRq0xQO5cXQIVa4JMrIQdeSq8wCzAix1lj1r6lkvx0Z23yQpLX5HPrwBSI7t
 WZBEw/q1oVc7OcV8+vkP1eOiaUPqbPtsJc/fw3A3a8cOddWM/QjMX2ZKhT9AbikV5bx3
 nss/GITWLwZtQs/JLj7RL017YtGFMPhfBdnHo877EItkelaNpOkHRNSp/xTySOJplu07
 wxYNj9LdNK2Ex19Vc8OzbBQM7Ry0TiCQXGYJEuqLKRypVr9a2pu29tajGR1zYkOQHfje
 Wmvw==
MIME-Version: 1.0
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
In-Reply-To: <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 21 Feb 2025 08:33:33 -0800
Message-ID: <CAAH4kHYrCLoT3x50MN+STaFapEPysDNH2udttr0snYJTVjkdaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [svsm-devel] vTPM service attestation format update
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: svsm-devel@coconut-svsm.dev, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>

> However, the last sentence about make/activate credential makes me
> think you're being too traditional about this.

If instead we use TPM2_CreatePrimary with a public key template that
has its bit 18 set in objectAttributes and use the EK handle for
TPM2_Quote, then there's a great deal to change in user space.
tpm2_createek doesn't give this as an option for example. Is adding a
--non-anonymous-ak (or some such) to the TSS for EK creation part of
your plan?



--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
