Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE36C1FDE12
	for <coconut-svsm@lists.linux.dev>; Fri, 18 Apr 2025 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965134; cv=none; b=U7ZtpQ7rRbzWvpHnuS1EhYDPd28JguA2nGRtqPXbqfOyhnZbQQx2yHjokvJIibrQ0xuozpYYaB0i4rPVa+pebafnTlP0clo7UMnUjpQeKYFY59KXllOsuTyfg5LxM5bAVMFbBIq7UxEsaErTzy28kEBCW8SC0OHtfgiqqOJSASU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965134; c=relaxed/simple;
	bh=7lYyefAddAAAW3Iha7erN9RAaYJYQ8xP6k6BZTIc3lU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QV32H0o4T73NP9EBwGi2KjijF3evVqCKjjWTz5gBF9KydOkYTpVDShQBAiowByQjTZmRrDbh88kZ1NBQ0wOejDUXLN9xbxpshc7fWRQD4qVqeEtL7njP08QoZ4Btc9MykAJE+NtFkgXveZIC81ZPacgH5vxtBT5bXSMkDz6eSPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AZJ7m5rR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AZJ7m5rR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744965131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7lYyefAddAAAW3Iha7erN9RAaYJYQ8xP6k6BZTIc3lU=;
	b=AZJ7m5rRfrl6CQBXswNoj5sxt2JhY0gCmkVKXMNbLR5tiqFiG87PxCykijLquHH8qpSv9A
	+Sn1p9UtzO61RJt+KbgMa6ccnMgQfhn+4m7nzsf1C+B5jSphrBUGC49t0JpYP9ww0Lggfp
	rYL5EOPrAqUqVzM7FaMOWjo6oVD0baM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-92oSjpRpPtG-4smFgoD3iw-1; Fri, 18 Apr 2025 04:32:10 -0400
X-MC-Unique: 92oSjpRpPtG-4smFgoD3iw-1
X-Mimecast-MFC-AGG-ID: 92oSjpRpPtG-4smFgoD3iw_1744965129
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-707cc4700acso785817b3.1
        for <coconut-svsm@lists.linux.dev>; Fri, 18 Apr 2025 01:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744965129; x=1745569929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lYyefAddAAAW3Iha7erN9RAaYJYQ8xP6k6BZTIc3lU=;
        b=WfixYkjom3FMhWPJvtEybzvuqb3ydqt7AiM740zX20GNz8aomo0ko4FN76oG6dZHlV
         aUqB1RJ9zJeR/M0GcDlKzbSgdTqbYaDqxV8LPH6yh+ACUQhgziXAEbSh55R4NZmT4LlB
         cXQXk47rBlQ5vXhq6NSZlCzN/S9d52lFPoblzYnXOVlip0JsSHsqFuKpNF87YfZlBOGY
         AO+pB4l1DMOXoNU6FJusR1kb2aZ+sh2U4dBvECeGV+6UeaZl/SRxgrGJfv2A7HUJCC16
         OCbHLzUulXdZsV+G+z8JXOcrq0QyueNPnMuj4LPyj+XBdUxDMo98MQtV/Wpe36GBHeNt
         XzTQ==
X-Gm-Message-State: AOJu0YwBcdng1g+OirrFuBLauSGqRBuPyg51B8JgGXAKsLA36t+270dI
	bwvpRxL+2yoifnCwmdG7zqK+JspXLajXC9+8GCobH5vxnVih7SqmHXvJAs9P8o+2CRg8OaPx6gT
	3o3lFKd1QM2ZzniPMR/GUHjhZT4nHhp8ouL8367al38wpcc6z7og1cDRpYTn2dC384E5x+ZjG60
	bkRh0UZBWsGmU2J5FLPceExKR/YXCQJLWdZshYk9A2PnOT2Lk=
X-Gm-Gg: ASbGncu7P+lSoliic30IPMyYGqkOqg15Ap9Qo6cdyeBBTYQuh6Mtzb0aKjZu5ipWRCY
	enGz5SOFae3M3lw/4orcc3ybWhG/lOfgCthKnx4O5ETs14jdtgd64QDwpVgOZxiOnXsEhk0M=
X-Received: by 2002:a05:6902:c10:b0:e69:192f:c752 with SMTP id 3f1490d57ef6-e7297d9d009mr2190927276.1.1744965129165;
        Fri, 18 Apr 2025 01:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeUaXyQqvQ1GJibqQVhzP4dyPxscBRrEC7H1PBuC0GMbdcQbZDSI4ZM84siAPwzTDY/LnfsdNaJp9IJAfMU5c=
X-Received: by 2002:a05:6902:c10:b0:e69:192f:c752 with SMTP id
 3f1490d57ef6-e7297d9d009mr2190906276.1.1744965128778; Fri, 18 Apr 2025
 01:32:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
 <06e71552-c890-1577-8967-4d44fb8bdf6b@amd.com>
In-Reply-To: <06e71552-c890-1577-8967-4d44fb8bdf6b@amd.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 18 Apr 2025 10:31:57 +0200
X-Gm-Features: ATxdqUHdYAvML7aqjGZ_ucl2GL-GgbTrPhweioXJTIxhDdfvZJ3DFPfiIeX8jQM
Message-ID: <CAGxU2F7=TuWMrbUAE0fqwfpb4A82pNqtaf63Fq59P=7h6U8tdQ@mail.gmail.com>
Subject: Re: Potential project on implementing AMD SEV emulation in QEMU
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: coconut-svsm@lists.linux.dev, svsm-devel@coconut-svsm.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M5QuUuqRor9IfB6jDv-_9dfc9CBLnSMSsPAlc7bDR3A_1744965129
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Tom,

On Thu, 17 Apr 2025 at 22:14, Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> On 4/17/25 10:26, Stefano Garzarella wrote:
> > Hi Tom,
>
> Hi Stefano,
>
> > yesterday in the Coconut-SVSM community call we talked about a
> > potential project with the University of Pisa to emulate AMD
> > SEV/SEV-ES/SEV-SNP support in QEMU.
> >
> > Joerg rightly suggested having a step-by-step approach, supporting SEV
> > initially, as supporting SEV-SNP directly might be too much for a
> > master's thesis (about 6 months of work).
> >
> > We wondered if you knew of any attempts already made in this regard,
>
> Nothing that I'm aware of.
>
> > but especially if you think it's a feasible thing.
>
> Anything is possible I guess, but I'm not sure what it would take to
> accomplish that. Attestation would tell you if you're on real hardware
> vs emulated hardware.

As I wrote to Dionna, I did not explain the ultimate goal well:
Test/develop SVSM and guest OS interaction without having the hardware in place.

So that's why IMO it's perfectly fine for attestation to be
unsuccessful, plus I don't think it's even necessary to implement any
encryption.

Thanks,
Stefano

