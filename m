Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id B14D6470E0
 for <svsm-devel@coconut-svsm.dev>; Wed,  2 Apr 2025 03:42:17 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so881759766b.2
 for <svsm-devel@coconut-svsm.dev>; Tue, 01 Apr 2025 18:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1743558137; x=1744162937; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXs8x2fMAhJkRxpoRPOLT5/UkjiiDW99y/Dw6g+272A=;
 b=RD3QckJLxIRdjq2mENaR1OJxwXDbyAVTH7hCodi4OJ0pCTSGBMZv9Uznj8Ms0EUSaT
 goz0aSVMTsl07B5MW5zqg8hSRT70hAH1pwKr+m3NxKVh+rRGylNoCt1dKLMGQtOuk0Le
 fiybDoAozxSxAZvcpVLO3UHn9Qj4WrlRm131uEp5CZCzHRwEunUKZu8rhUh0RmJIlP5z
 Ds8HV3TF8xwxLxfHzWyiG3Q4up8ahLZGL172iiERT8sjiQsITrQSWt9e2ltEzLda4q5b
 feBW2LrL55uaoc3mlBxlKiVLDQw/4enH5KAKNv+TtC0bX+I41+InzVKXpMR0S67Tviw8
 OTww==
MIME-Version: 1.0
References: <Z-wLndJu1CM_K64R@8bytes.org>
In-Reply-To: <Z-wLndJu1CM_K64R@8bytes.org>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 1 Apr 2025 18:42:04 -0700
Message-ID: <CAAH4kHauJodNzsZgQjCLBPbwQiZW7FDzkJd5Bx4aQder=xHxxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] SVSM Development Call April 2nd, 2025
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

I would like to get a clear go/no-go for the proposed
SVSM_ATTEST_SINGLE_SERVICE_EX addition to the SVSM specification so we
can get the ABI committed for Linux to accept the corresponding
additional WO binary attribute for manifest_selector.

I have patches staged on Linux v6.15-rc7 that I won't post on LKML
until there's agreement of the specification change:
https://github.com/deeglaze/amdese-linux/tree/atssex
For SVSM_ATTEST_PROTOCOL support, we need to first merge the same
memory read/write from/to guest memory
https://github.com/coconut-svsm/svsm/pull/653
Then we can talk about SVSM_ATTEST_SINGLE_SERVICE_EX in
https://github.com/coconut-svsm/svsm/pull/662

On Tue, Apr 1, 2025 at 8:52=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8bytes.or=
g> wrote:
>
> Hi,
>
> Here is the usual call for agenda items for the this weeks SVSM
> development call.  Please send me any agenda items you have in mind or
> raise them in the meeting.
>
> Europe switched to summer time as well, so meeting time is back to
> normal for all US participants.
>
> Details of the meeting (GMeet and Calendar links, meeting time) can be
> found in our governance repository at:
>
>         https://github.com/coconut-svsm/governance
>
> The meeting will be recorded and the recording eventually published.
>
> See you all there.
>
> Regards,
>
>         J=C3=B6rg
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel



--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
