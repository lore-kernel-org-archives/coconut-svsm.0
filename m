Return-Path: <dionnaglaze@google.com>
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 307901A2482
 for <svsm-devel@coconut-svsm.dev>; Tue, 26 Sep 2023 20:50:58 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4053f24c900so18145e9.1
 for <svsm-devel@coconut-svsm.dev>; Tue, 26 Sep 2023 11:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695754257; x=1696359057; darn=coconut-svsm.dev;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Iee+MmkxMmKRsKfkBm15VWyq+58kZGH01RjjC4TueXw=;
 b=24IoaWxXJIjI6BVDTWxUeoP9xRMx8pgltRjz5YkHZ4fcoftc+POKFZ6Xl/8Ldd4qgO
 Nd5KEB6oxs2Hkm/MBtt6XtJkhjiRQ1rH6cHPtRz6WjSCkJplZE7MGrBxvQlOdSeNxDDd
 5vS4g7AgiwoCrbhdOO1EGEjkTk90JRoqeKO9Mhh7jz5FMyp3P1yaGD+c4LWzJ5aA0ow+
 Nnzp700rHjyTGwNGVcY5/+Rh3B41fqnw6Uu61vEUaiQLpoVHGMvOna+p62XaLuHrQ2zV
 cOOp7A2pEBuQvQmVrgeWV9GBilk7A08lGWrGu1D8RBrBtIH4TvFWRF8ZwT/rgx8CCPyY
 BA0Q==
MIME-Version: 1.0
References: <52e7321c9b1c77a1fa0c8f830deb2a78fcbf8243.camel@linux.ibm.com>
 <ZRMkpiiFuBHaF2pP@8bytes.org>
In-Reply-To: <ZRMkpiiFuBHaF2pP@8bytes.org>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 26 Sep 2023 11:50:44 -0700
Message-ID: <CAAH4kHbUDwrxZSNrcGQf=qD3P6uh0EYLAn7HE3inZAnBmuge-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [svsm-devel] Questions about crypto support
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Claudio Carvalho <cclaudio@linux.ibm.com>, svsm-devel@coconut-svsm.dev

> > Q3) What libc implementation should we use to build OpenSSL and other CPL3
> > modules?
>
> What amount of libc does openssl need? Or how much is it beyond
> malloc/free? Whatever libc we chose, some porting efforts to the SVSM
> syscall interface will be needed.
>

I've written some stubs to enable the crypto components of BoringSSL
(trimmed-down OpenSSL) in a nostdlib environment, and it's not
insignificant.

There are a number of string manipulation functions, of course
malloc/free, and also pthread_once and pthread_key_* functions.
Without pthreads, you have to build with
-DOPENSSL_NO_THREADS_CORRUPT_MEMORY_AND_LEAK_SECRETS_IF_THREADED
I don't know what the concurrency story is for SVSM, but I imagine
it's concurrent for all vCPUs to use without a global lock.

>
> > Q6) Interface 3. How a CPL3 module should communicate with other CPL3 modules?
> > It may also need to carry secrets such as keys.
>
> For secrets like the VMPCK keys there should be a single owner, or do
> you see a need to pass those around? Besides secrets, communication will
> be done via the TBD IPC mechanism.
>

VMPCKs may have a single conceptual owner, but they'll still need to
be used in cryptographic operations, so I do see them getting passed
around.

-- 
-Dionna Glaze, PhD (she/her)
