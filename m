Return-Path: <acdunlap@google.com>
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E5847281CD3
 for <svsm-devel@coconut-svsm.dev>; Wed, 10 Apr 2024 17:52:47 +0200 (CEST)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-479c9c2d2b0so2211553137.0
 for <svsm-devel@coconut-svsm.dev>; Wed, 10 Apr 2024 08:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712764366; x=1713369166; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2SCfeMeAP4CrrUmuI6sFD4UCvW4SjhxuhHyg74Ksiss=;
 b=pdLazMhykr87zkvjISqx1MQrNBRCd+nVkk+zmhLzbWzSIrj7hedGNzlwgaaxe2H6Ic
 xYZukC56S/QkqWVehL/26/4M9AN79m9rsCY4OxbzIrabwT6guMnurJ+9+LLpXwVRxcW9
 vYJbfk1y3i0c+WDHqvrmcTZozyE9ODs1aoXpZ55OfQ6S3jpTvVoEgXGDy7pkNOlfJP3Z
 nclfY51c0KfLa+hU+PAKaA9tfDtXgon0nlOlCPYbTMMomF/gHW1LFZAJcjiSXzo50mLP
 553nL95X1lCy50BhVYr9BZXrbgLY4OmX4RSZ6AmL0rkgU60eaPGdA+a3FIbXGhbyj2Tx
 eNfg==
MIME-Version: 1.0
References: <ZhZfWhyOQ4ZmTdVP@8bytes.org>
In-Reply-To: <ZhZfWhyOQ4ZmTdVP@8bytes.org>
From: Adam Dunlap <acdunlap@google.com>
Date: Wed, 10 Apr 2024 08:52:33 -0700
Message-ID: <CAMBK9=bhzO3SFv+6439X=VZ6Raa2hAwVOKE7XN4U9DPJZyX_Ng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] SVSM Development Call April 10th, 2024
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

Hi J=C3=B6rg,

In light of the ahoi attacks (https://ahoi-attacks.github.io/) being
disclosed, it would be interesting to discuss what it would take for
coconut-svsm to enable restricted interrupt injection for vmpl3 to
protect a linux guest against maliciously injected interrupts.

Adam

On Wed, Apr 10, 2024 at 2:44=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> Hi,
>
> Here is the usual call for agenda items for this weeks SVSM development
> call. I don't have agenda items so far, please send me yours or raise
> them during the meeting.
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
