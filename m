Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792562149;
	b=0AgftOa1ZF/Z4ht5tkCOa8s0kufVWMaXfVwOUeElwEFjMcRAkKk2LhEHhhrI0N6eApPP
	 xSVxNovd+8xvlLmzHh/lWeNNVMh4823o2o32yZbrNb061K+k5eh0Wu4JZnX3G3zx4aU5i
	 LP8X5Ga1WnOeZyS8pJGviSfOqaZ/X62YAQwCUFYBCe3sP+Hgf3ftWwHBQbjhP/Vk3uVZ8
	 4S+FhavOjr/h/fBDoJMPlf4rkKDkQpgCv4kezDSY/Ex2UZAZgq/3QLhDhXWaGCjylBlJJ
	 uqlJF9gYP7A1oyMvxinGDRkkryHCfjQ0VoBuOCiFs5SH1/fBaGnhyC8icC1JkhOJgcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=/FFdfdrN7aRadLX6ARmxlIn/ghwJAMUWoAakxkec6W4=;
	b=uur93p6AUm1qpZk7M+NA0on2SJaqt2/HmXyj/h5QF2qgUwD5tdXRiTo0anOsgg+6PmYQ
	 1f4Y16DCLkvCvPFqVzVCsR+19R5YmpCDeyf9VwEYCaFyBJwHG+QwC+mKuztq1lRdCs3Fy
	 m5+T6eXe4u1ABgx9C6HNDD+tGy3GE56K3fnItjuKLNapsaLqITSvxCbKghuysPBYcPWmJ
	 lD8DRWIrUeoupVM2iqhN87Ez56RfQNMEMnFuL8ZOeBSj1QR9p0ggB1ecAfpVBC9hbBXJN
	 GhU/dv8qIwzi5MiCmrrlZwKP7lNYhjvjWQNJ44/oER0b4iKmNbSf1+/4JQuxWNXiVDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vtVOiKeo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D51C606A319
	for <coconut-svsm@lists.linux.dev>; Wed, 21 Oct 2026 05:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D51C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vtVOiKeo
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso5059a12.1
        for <coconut-svsm@lists.linux.dev>; Tue, 20 Oct 2026 22:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792562148; cv=none;
        d=google.com; s=arc-20260327;
        b=KtMxdZsr3zAXunZBD50txDifFPVTs8c6FJ+uaSFJ/cYfmslIObl5JEXYuf9rq2EQO8
         MQf5sheaPcL5XaCVCyLn9v/KKKUxZXdntPhUUsnmAVglsgHuvGkg+tNNPgp4QJAlUDFY
         /V2TdZz0AFSHcve2Ka+3HbO7Jg2Q17cJ12q6WAT6aw6915aGMoqMkouT4+3hi8neb/vM
         ZO9jp8xJmsO3EJNbY/+7QK8mCuhoff2NQfDQrrPpVNUaXUQLUiMLlmlJbiad7oKyVE60
         47fO+9g0Sz/Wkk8SUwFzowR7vP4qELsjo7zDxawBI/IjeK86msRNjx6CduGGKAaJjLKt
         Nhtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/FFdfdrN7aRadLX6ARmxlIn/ghwJAMUWoAakxkec6W4=;
        fh=13pJRPVV00EwCTSt1Ewy/B+PqjhInIfd8t2I2le6UCU=;
        b=F+zhINQvXwTe6iUqn4H8Sp1H9RiPlE5kVYDTS9BWNo1XL9Mfec/MxdGn4Mytib13ZL
         oAMA3DWcaSiWpoTMGHeG8vevRfHxBFwLqy7RU7aznWdv/LjOF84KCTmESvQWiBnWqQoP
         93rtJvKpH/cOspgoqybSffQWvN6CyuMBi3OSqVXDpU850qzyvcn31VKdhMByDrM22C6k
         FOH4ztLuIeG+jKqidWHyG2p1InZuwrZpydbz/V5J3Sd9pNTpnXhGoauu/aTeBrGa+07q
         JKzlOsbHjFEIwW4TnMoDNqe+ydEX9UWCgffmBu3jQrLe6j/CdRjSDNYukVGMfEYdKJHA
         JsDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792562148; x=1793166948; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FFdfdrN7aRadLX6ARmxlIn/ghwJAMUWoAakxkec6W4=;
        b=vtVOiKeoaxiHdaXO5FHdmjAqyPZqbau5OoyRPI/3NlpIITy36Qa/YBzLXRIf0MEBaM
         I8OF5QuzHOvqw3Sl2Vv4G+lD6022yO10N9acQv0J/f25/B8OkR70Lewtpx7lmvM5jN6t
         JF2JfSa0HJ9L9vn6QB1Q6YQ7ZjCEVR1IR5l8TuyNUN9+H/T0o2xPoUlzGdU84Niwzbma
         bNI1He0xWLVMvnZ7vo1U0eQpEPoa8JjbA594IJGdmx/N8g+UquFtJBEqTNN5KfYousX3
         Xjx3A9045kPh6KvHoBKLx4QPPWeizqq4IJCMtMK9wzlg21IVcfWMcdZy2RKI8Gs1LBKl
         lqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562148; x=1793166948;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FFdfdrN7aRadLX6ARmxlIn/ghwJAMUWoAakxkec6W4=;
        b=pBel0njJZp8N0LAfjQRaDtoHpzwjkaASfKluiV0RSbLK/JXeavW7ZoROdC0omBlQ+L
         rfE7QhJ+l9MXuBTSvCQOwqz9jII5/reyVM0rEj96CnEPCk55UhbnAQB+bzSxVGX8QyAh
         nu9DTb0KgkUyfsuj4MeH3ZlnBMKejKcbaD2MAXfi3HWEJHEEZb/fpWAUu8UlCQGCm6Z5
         nX6z0ixJXZ6jDFv4S1PtUdaf9aLU9u/7yuZ/iLcvR61ha8jm9AUMsFJ2SgHdZN3tit+Q
         9quy1r2Vrxa9fcgaTr2dmK17u9uRBaKoqbKiva1tFn8PiU1lDQoOTVi4agMihOZa4WoV
         sc4g==
X-Gm-Message-State: AFq9FYI0R91ShbSqBePn8WuhAjJEhc77a4l+9X/s5ZmNsQxtX5YnSl8u
	CiquTJOzjslGlvCfBrIQJpGsLA0i+TaeZ5xn4Uh6ywqBK7sQj76GjDMm6g91KZh6/ov+jgNjHAB
	PpvDH8VMVMDLsNA4WXt3/FXCBq8AQbh1bLJNY8KMgndXlNUZsXEnuysEU
X-Gm-Gg: AYBFou1+pxwg1/i3HybgNs+Q0/WxTe4+GtJRBjMZExanut/HqbY+z2eVvzpTQ6a5fSk
	UzGpqxllHCEnPuXWJI14ftJu5imzXlBS5gd+iXlGzo8oUipQAB2aAsaFMO4q1j0ybGdENyQ77nM
	XkUS6EdlOTmhHvFg0GlOsg8ZvaNtY8ccydHJVRN5hQ6++19iL3ZhiS28eKAiHq8XirtR8HAeTEj
	/V+FsfND7om6j5t9tMPt/bfWGaiVgsdr/BcB48e/UpVpbeX2yJtbId7YC2y/3vTurfFBH/qF5fF
	y6FM19vhBKNCA1s1ok96jPYAaneeKDJxMKFm22M5OLXifmF6eDWT/Pk2BQURCFpZt9dN32t3Ed9
	xZMsoFHYovybk0vDDC+ourgxeT8W30hVAjPIjKLgaNcdO1QUBrPFBiWHbGICl9b05q13w023JkD
	y2P3PsmXmkmk2fgr6XT3e+v5VAg3pkxMcmsYcOPTLR1SA=
X-Received: by 2002:a05:6402:14cf:b0:6b1:bbbf:25b4 with SMTP id
 4fb4d7f45d1cf-6b3e5a5474dmr95197a12.6.1792562147138; Tue, 20 Oct 2026
 22:55:47 -0700 (PDT)
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CADRsRuW1zJxk2+WxM2oQX1T_nq9O5SOoswhMQH+OsNvz9hUiHg@mail.gmail.com>
 <c397a444492ac996add776569871dde6bac60b41.camel@HansenPartnership.com>
In-Reply-To: <c397a444492ac996add776569871dde6bac60b41.camel@HansenPartnership.com>
From: Jeff Andersen <jeffandersen@google.com>
Date: Tue, 20 Oct 2026 22:55:36 -0700
X-Gm-Features: AclHuK8ZzlUoP8CeFxf99dd6oMX41PkwiItdmTfzBQFgCRPyI-kDU5ygJMS8UEw
Message-ID: <CADRsRuX=+0KOH4QmtnUjTmXe4BRgimyvD-jqwppcyvoQnpJAcA@mail.gmail.com>
Subject: Re: Inline attestation of vTPM-bound keys
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: coconut-svsm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi James,

You are correct. I believe the freshness assurances are effectively
the same between SVSM_ATTEST_SINGLE_SERVICE and TPM2_CreatePrimary +
TPM2_CertifyIntegrated. Both paths allow a remote entity to prove
that the TPM currently controls a given key. Outside the context of
SVSM, some schemes for attesting a software TPM are non-interactive and
therefore lack freshness (e.g. surfacing an attestation over a TPM EK
via a virtual NV index). TPM2_CertifyIntegrated helps there.

I'd say the main benefit of TPM2_CertifyIntegrated is that it provides
a unified framework for attesting keys held by a software TPM running
on top of some kind of integrated root of trust, be it SEV-SNP,
TrustZone, or something else.

--Jeff Andersen
