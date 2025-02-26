Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 5AB834364E
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Feb 2025 16:16:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740583018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y6O3H0bKwSgz8ac6NG6weWjL85qpaidZjw0jrlrtCgQ=;
 b=WqVizK6F4IelZCH1Gh3kIyDpKyB76U2UBHEpMWEx0TRvRTg/KD7gyYVzEIq+CKrPBOv2OO
 tl1+PP6A5PCTfBv/ScnMrPFnbT4GliIB9rYm43p1EU5f4MXGXhiHMWy+evrv8JJJTqjaOv
 cc352de+Z5OdcfIxj49hx5Bhi8u3PnE=
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-ab7f6f6cd96so595794166b.2
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Feb 2025 07:16:55 -0800 (PST)
Date: Wed, 26 Feb 2025 16:16:47 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <CAGxU2F7LacCGbuL3HemvfOAD9v9i_GCbdM8Y4bs+xT=+JBz1ug@mail.gmail.com>
References: <38fdf6373fe5f500115d09bcad391e14137b75b8.camel@HansenPartnership.com>
 <CAGxU2F5N7MrLU_Wsr0D1nBS_C=ojjm-NUmf5_a00j6+jiuDtJw@mail.gmail.com>
 <3cbef80a611a8ce6b9584981777810ec054de7f8.camel@HansenPartnership.com>
MIME-Version: 1.0
In-Reply-To: <3cbef80a611a8ce6b9584981777810ec054de7f8.camel@HansenPartnership.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [svsm-devel] Using a linux bus for SVSM devices
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev

On Wed, 26 Feb 2025 at 15:34, James Bottomley <James.Bottomley@hansenpartnership.com> wrote:
>
> On Wed, 2025-02-26 at 15:04 +0100, Stefano Garzarella wrote:
> [...]
> > IIUC the SVSM vTPM driver will be the first one using the new bus.
> > Since I have the new version almost ready (need to finish writing
> > better commit descriptions), do you think I should post it in any
> > case as RFC, or better to wait to include also the SVSM bus?
> >
> > The current version is here [1] but it still uses platform devices,
> > even though I removed one as requested during the review of the
> > previous version.
>
> So on this, yes, it's always wise to post early and often, particularly
> where there's a discussion about where the code is going.  Seeing
> updated code helps people frame arguments.

Got it ;-)

>
> Just on the platform device: Greg seems to be going on an anti-platform
> device bender at the moment
>
> https://lore.kernel.org/linux-usb/2025021023-sandstorm-precise-9f5d@gregkh/
>
> So you may need to humour him and use his faux bus instead.

I see, thanks for sharing!

Currently, I have
- module_platform_driver_probe(tpm_svsm_driver, tpm_svsm_probe) in
  drivers/char/tpm/tpm_svsm.c since they asked to keep tpm drivers in
  drivers/char/tpm
- platform_device_register(&tpm_svsm_device) in arch/x86/coco/sev/core.c
  to load it

I'll check if I can use the faux bus in this case.

>
> > If no one is working on the new SVSM bus or planning to (don't want
> > to step on anyone's toes), I can try adding something to that branch
> > and send an RFC here.
>
> I was going to do an RFC in my copious free time, but I've no objection
> at all to someone else doing it...

If I can do something (probably next week), I'll let you know!

Thanks,
Stefano

