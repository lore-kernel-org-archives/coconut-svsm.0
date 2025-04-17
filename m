Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDC9252916
	for <coconut-svsm@lists.linux.dev>; Thu, 17 Apr 2025 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900037; cv=none; b=e6ggu5R/i75DTbdE+2LHhdmzPBnnpmMZ7HPs1nWtpAoZJe8YhALPWXI2t92C+nb+kdgwDa7npC4IjHuy9JI+qHCVX0e3Enc7a2ocGtHh6yuxU/x8zpbP+cCCZ8fbwAgBjuOwYIZ52Y+jDxH+aMdA7rXsjOSU/+FbeYFZGSBkYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900037; c=relaxed/simple;
	bh=AbO0vESSqdb/IzeMX9pNHGE5rT5pMPe/xu50G+ABW2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2oVolG1gGLmETqjCvV3lkMUALhuVAiMw54HQq8/WiWOD/hLdBvi/vyfI109vzfPJsmemOF8upEA8pNGmG2Pv/J/59Fttbyd/9GIkXOtUBnxEP1Yg6xVA4Y7pnuHcayR3u69qEGLFoIuSmgg5qur7XhjfVakdaauF7YwxCzJVqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KlZV98UH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KlZV98UH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744900034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=375qmHTJ5XDGeIw/DwvkJo6aXAR/zxNsDeEM1lNbaHs=;
	b=KlZV98UHrG71URvdwCW8TGV28Jmh/abLvJE3FVRNImjND6pcYSX9Ihb24x58PQtQiyuCsF
	IFYPOEIjjsuuzqJUIVVKOMedbLFMmt0cmRyu3QELGdCWSO57jW+hKQvKxod+HfTaYbuPpt
	+XWGs6X3phgDW8GO0w6uL09GXHrIujQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-oDqIgHSoM4OqEi63mg3Lug-1; Thu, 17 Apr 2025 10:27:13 -0400
X-MC-Unique: oDqIgHSoM4OqEi63mg3Lug-1
X-Mimecast-MFC-AGG-ID: oDqIgHSoM4OqEi63mg3Lug_1744900033
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-70252f99aa0so8145257b3.1
        for <coconut-svsm@lists.linux.dev>; Thu, 17 Apr 2025 07:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900032; x=1745504832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=375qmHTJ5XDGeIw/DwvkJo6aXAR/zxNsDeEM1lNbaHs=;
        b=gggTUIg/i4lIWVmZ8zvl+lupzTxk5pqHbzWlqXM9beD2zzjN0pRpptb+LOGT9NKUOz
         yWLS6WHa5TXjr0TaoLMcGiiRCctxWKLUjqW7cxT5BlzEdpOEf13zQpF55TubCjnEv/ly
         IPU3nJWTXPtA3Vsl0iBmW0ubqABTuI//SddyVb3+YMTKyWm4J8xtRhAQ5BK3hQar/f/m
         C95GCpblz9RU2Kplv8dX/Lz6bpeKcmY2Twxo2fRbrKcXlF6EjHc6svAGQ5i46HT56+9J
         BpHQzC45/AHKpAD2nGmjc7fl7LluaAqXqnGdx2BWu4LzlrIcmAhHgiY6BAjh9Bs3MUqZ
         KziA==
X-Gm-Message-State: AOJu0YwguDYTnACSdkpWvY3aElyX91CI/V9lG2T0ZWpKY34IqeszHKu1
	RyTWnpwTE3P3WpGCfFTER5cznfd24j/Lku7zB+6b0X6AwaRcL/d3cWc21nO5Ra98dgKIRPVLzv/
	zgTqHa35D3gCkwSajoDWd8P81aBJcRUYt3yTnm7R7i4Mgpg7whmKrX7Uki6wMZ9539cPwlF6UJ3
	iSxa05SaAWYOfZQUla35zXqvX7SXkD3vdEMcP4TT3JsIXq
X-Gm-Gg: ASbGnctdTpyki6CDJFiSazcaJ5nMmdGKiE69uSLvaxsjFAxVa1jhMA1FLZ6ENhju/IB
	+iJKOPj/rswxFEYBsqTYRbLZ7B+SJM7DYM81fu7on0bYGrIx/WmO+Pc6Sb1kF2OUykebVjHg=
X-Received: by 2002:a05:690c:670b:b0:6fd:6589:7957 with SMTP id 00721157ae682-706b339009bmr89867137b3.32.1744900032475;
        Thu, 17 Apr 2025 07:27:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsHoaRMObKpFdGZm89lavv8LxMUfThGYtcHLHjKBJmW4QVlhMQo9ck3BEnbUM6mONFcrDZzKHwaAREd1GIZ8c=
X-Received: by 2002:a05:690c:670b:b0:6fd:6589:7957 with SMTP id
 00721157ae682-706b339009bmr89866717b3.32.1744900032096; Thu, 17 Apr 2025
 07:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <25558.125041610080302253@us-mta-166.us.mimecast.lan>
In-Reply-To: <25558.125041610080302253@us-mta-166.us.mimecast.lan>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 17 Apr 2025 16:27:00 +0200
X-Gm-Features: ATxdqUGmqgA3jBV0FZN11ZqmKjazXPEJxlCkK8bKEMZbJ5ckZUwYeUjaVq4weOU
Message-ID: <CAGxU2F5aM_GXbcbOocrwpsGS4H+1i7O9xM4MhKrx8ycGOgah=w@mail.gmail.com>
Subject: Re: ECC keygen for PR #528 ("Attestation driver and proxy")
To: Nicolai Stange <nstange@suse.de>
Cc: coconut-svsm@lists.linux.dev, Tyler Fanelli <tfanelli@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v_E_CXXi1O1OZAX50_FgOjcJGH5QTjrgGP9ta4yYosU_1744900033
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolai,
CCing Tyler

On Wed, 16 Apr 2025 at 16:08, Nicolai Stange <nstange@suse.de> wrote:
>
> Hi all,
>
> I managed to carve out and cleanup the first batch ([1]) from my work on
> an encrypted FS by now. The FS cleanup itself is still WIP, but the
> crypto parts should be in a usable state.
>
> As mentioned on last week's svsm-devel call, it might help with
> addressing those stack size related issues with ECC keygen in the
> context of PR #528 ([2]).
>
> I prepared some example code for generating an ECC key with NIST P-521,
> to be found at [3].
>
> From some lax experiments in userspace, peak stack usage is at about 2.3k=
B.
> (Which is still way above what I would have expected, given that no
>  buffers are stored on the stack. I'm currently investigating that).
>
> I'm not sure whether merely generating the key is all you need -- FWIW
> there's also support for ecdh, ecdsa and ecschnorr, in case you're
> wondering. I'd be happy to come up with some example code for these as
> well.
>
> Please let me know if you have any questions, either here or in today's
> call.

Cool, thanks for the example code, I guess this can unlock for now
Tyler's PR and FS support, but as we discussed yesterday in the
community call, the long term plan is to use OpenSSL/BoringSSL. I'll
open an issue ASAP to track that work, and I'll start to investigate
it.

Thanks,
Stefano

>
> Thanks!
>
> Nicolai
>
> [1] https://github.com/nicstange/cocoon-tpm
> [2] https://github.com/coconut-svsm/svsm/pull/528
> [3] https://github.com/nicstange/cocoon-tpm-crypto-ec-key-gen-demo
>
> --
> SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=
=BCrnberg, Germany
> GF: Ivo Totev, Andrew McDonald, Werner Knoblich
> (HRB 36809, AG N=C3=BCrnberg)
>

