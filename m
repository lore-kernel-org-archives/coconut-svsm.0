Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 2FDF81A1F2C
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 15:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695820041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlhDKuBsR5npB28u1A6w/g1ZdMdUrdDCqK6W1QgnedQ=;
 b=ai96Rboxpe1HbvvEFCnbTw4yU3qFOxp0TYRcG/FGzCVCZCege0DGFQj5M8H8CvWXGT7Xl3
 b9zpjDOjqmy/x9Ca6m94NEREdj0W61SXa0jMKJpoftPDYP5O/XTKPKSKZ15PEppkYnAD5L
 3wnqKkEFTQM0iK9k4B02p4j+0jFE5wU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695820041;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlhDKuBsR5npB28u1A6w/g1ZdMdUrdDCqK6W1QgnedQ=;
 b=LMdI7HjzQcKJuJx6kxKhcZXLUSlBrqLTAunlyjKDT5D2n/KYew2eSIVlk5aY3gPST6eoW+
 XNthbAwaUrrsVcCA==
Date: Wed, 27 Sep 2023 15:07:20 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZRQpCOpzuMPqn_Dx@suse.de>
References: <52e7321c9b1c77a1fa0c8f830deb2a78fcbf8243.camel@linux.ibm.com>
 <ZRMkpiiFuBHaF2pP@8bytes.org>
 <CAAH4kHbUDwrxZSNrcGQf=qD3P6uh0EYLAn7HE3inZAnBmuge-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAH4kHbUDwrxZSNrcGQf=qD3P6uh0EYLAn7HE3inZAnBmuge-A@mail.gmail.com>
Subject: Re: [svsm-devel] Questions about crypto support
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"

Hi Dionna,

On Tue, Sep 26, 2023 at 11:50:44AM -0700, Dionna Amalie Glaze wrote:
> There are a number of string manipulation functions, of course
> malloc/free, and also pthread_once and pthread_key_* functions.
> Without pthreads, you have to build with
> -DOPENSSL_NO_THREADS_CORRUPT_MEMORY_AND_LEAK_SECRETS_IF_THREADED
> I don't know what the concurrency story is for SVSM, but I imagine
> it's concurrent for all vCPUs to use without a global lock.

Ugh, pthreads, that is bit harder to support right now as SVSM will
start with cooperative scheduling. Given that we only need the bare
crypto functionality and none of the protocols or file parsing
functionality I wonder what the pthread calls are used for.

The concurrency story for SVSM is still very simple, I already mentioned
cooperative scheduling. Besides that we don't have a facility yet to
force another VCPU into VMPL0 to execute threads there. Same with timers
to implement preemptive scheduling.

> VMPCKs may have a single conceptual owner, but they'll still need to
> be used in cryptographic operations, so I do see them getting passed
> around.

We can encapsulate that into a module which talks to the PSP. AFAIR the
commands have sequence numbers, and that module would also keep track of
them. Any other module sending requests would format and send them to
the PSP communication module. That would then also be the single owner
of the VMPCK0 key.

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany

(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman

