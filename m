Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCDF266584
	for <coconut-svsm@lists.linux.dev>; Wed,  2 Jul 2025 11:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456471; cv=none; b=U+gFQc2rpDYCSwSJTvzB00t//p/H9AmVRmjhjvuG2yRC3kV6zugtUa6CgwYLS1LAFcdxtat4GPEmjFzcpj0BpcKX40ReVWfICiEF4TsIKNYsmzgnDWefTWaCdnNmurk3TNbjbY4BufhR++eF/p/BzFbFIZCoJlt075UVXyHVAZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456471; c=relaxed/simple;
	bh=O/cLO1qM8DWlvcCIX2cFQPDGMCvTqrVhmBP2U/bQvUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eG3S655g4oFexLvEUNOmCKVyCgawQEgXW/Dt2quVLZHs/fJJ9nl54Mgp0h008WULJrU9KrHFIpu4XxcZAwPgdkhw9d9NuKBbXsjvL3GKyqRCKK2LpVagsuLU0u6sOvgrSPZxGFq7JV6XKZmbnyGcgBrv8kDRgc1InKDVo6Lbsxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRRk/gpx; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRRk/gpx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a365a6804eso3608557f8f.3
        for <coconut-svsm@lists.linux.dev>; Wed, 02 Jul 2025 04:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751456468; x=1752061268; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjdzqWSUtjOwd+Zu+sjRNPjgqY5ABklHbrbBSih73w0=;
        b=TRRk/gpxO03RDOavKuxnhj59kOHo9WX84IvjKw5o9TnbnqQLg+Z2DES0UdaxV+AtT0
         v+FbJpvE/3kkQBvrZ0Dr2GT36kw5lxvffOdyEPulZKjLNe9/4eJNeSsPdJagVbi0kzH+
         REZheEzwZkIxz6P2cplr97Zda4+MFl/C3/eb4hFLS6lSKCi2kCEemqby+/zWFJh9ROk7
         8Yb4YH3tJ4exEmmcOx5IjBxLAEvrs0EvRYeO3MdsEhJ/Yc3rM8gN/FdrmosG5013qDXI
         X0TTHEHt04p3PCct6iaWneopivAifofO0PzQRyNjBEtSpm36qMRAPr4UHfnc6fwYA98V
         tbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456468; x=1752061268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjdzqWSUtjOwd+Zu+sjRNPjgqY5ABklHbrbBSih73w0=;
        b=AcP8eeJ6syRQWifxklrllF+sTfJTLsflqlmWdueT5vV21KyaSUUpWUs3xNJ4JQBZN2
         L48wpPK/VKIwVRO64N6hAg1pwwQGXw2ZZtJLcsvo06Cgx9+IHlGGioYU6YcZm42JWV5M
         y8TNXdnkcXjSUaJZ3usbwlpMLvTgXCJIzr4Wa2kSy0jCdGwRq/+9l6hV4eDFWvEEVi+D
         8GoODvlkaHgP8zgZ1/qMX16IJXfFVuE1ZKOmbXMP7ohV8wf8L6jvas7pFEszU5Qp17K+
         H3Mpgvc22+ors8Lzfd4yLZXjaI1IbqAi4aSv0r7D3cLiXRyJVRvUoOikQf8+EaA2TT1S
         LDVA==
X-Gm-Message-State: AOJu0Yz0slfQ4G3TXm0OylRQ5am6tXOZIMwO32xjP6TZ4YIAHImrq/9F
	Hj7uycvS6PyTf3coCqDRKOL8nKzr4bjCQazcCbdeZzIjqxIIYuiOZSd4fPtYL5CACZ/+VYaUAGP
	V9M8FMh6MuRtHIFYI/6xCSc+Jonn83GymnV/UspI=
X-Gm-Gg: ASbGncuHOhWkxD9kpZTOCjUm9FnLq0y41MXL1gkndJvqgL4epTu+oYIBRyRqxhzdZ6V
	Fn3k5ebK8MjeEmjiKJg2ZhGHorJoPrBq3mg3LUuy1k7hcURq6pT/E7M+ZINfmES7v3pQIifQtIW
	bYQwRk0A/euzKYykuS5uKLDmxyKRlkRyliw0wdOpkohr35aA==
X-Google-Smtp-Source: AGHT+IEYbyWmO/B0sFoEHtBjNENIL/f0LudnMLXr/pA4BVcBpcsOZ8bdOBN1l73r5P9IN6yNHoI5djUfrotQJ72tx28=
X-Received: by 2002:a05:6000:658:b0:3a5:8a68:b836 with SMTP id
 ffacd0b85a97d-3b20048d117mr2114302f8f.44.1751456467462; Wed, 02 Jul 2025
 04:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fe3a4825-d079-0fe8-3fda-ed16044a048a@amd.com>
In-Reply-To: <fe3a4825-d079-0fe8-3fda-ed16044a048a@amd.com>
From: Geoffrey Ndu <gndu8086@gmail.com>
Date: Wed, 2 Jul 2025 12:40:55 +0100
X-Gm-Features: Ac12FXwt6aLaVLu5RjLUTG8YYzClLhvLnZiMW1NKp3q5kbBQz8YWPXCwD4d2NWk
Message-ID: <CAH6wD8WM3Zk2uy=nmaPgZ7LKuFSpNfYc7W1tuQJSnWQF=vN0eQ@mail.gmail.com>
Subject: Re: SVSM draft specification
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: coconut-svsm@lists.linux.dev, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Comments and Suggestions:

* Bit 2 of Flags (Table 23):

The description for bit 2 is, "Secure boot databases are updatable by
the guest (db/dbx)."

Does this also apply to other updatable Secure Boot databases like
Platform Key (PK), Key Exchange Key (KEK), and Timestamp Signature
Database (dbt)? If not, perhaps allocating one bit per UEFI database
could enhance flexibility.

* Confusing Statement:

The following statement is unclear:

"If a database does not contain any data or is not present, the offset
and size for that database must be 0."

My understanding is that bit 2 is meant to specify whether databases
are updatable, not to define thier sizes.. Could you clarify this?

* Typo:

There is a typo in the text: "Secure boot is enabledn." It should be  "enab=
led."


Geoffrey

On Mon, Jun 30, 2025 at 5:38=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
>
> Attached is a draft specification with the following changes:
>
>   - New single service extended attestation request
>   - vTPM service update for single service extended attestation request
>   - UEFI Management Mode service
>     - Needs references to the request/response formats
>   - Placeholder for the APIC emulation service
>
> I just noticed that Dionna is now looking instead at adding a new
> manifest version that would return a list of the various forms of the
> storage and signing keys. This would eliminate any kernel changes as the
> caller would now just request the new manifest version in the attest
> single service request.
>
> I would prefer this as it would eliminate the need for the single
> service extended attestation request and support for that within each
> service. For now, this draft specification has the original changes
> requested. Please review at least for the UEFI MM service, if the
> direction is to move to a new vTPM manifest version.
>
> Thanks,
> Tom
