Return-Path: <James.Bottomley@HansenPartnership.com>
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com
 [198.37.111.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 4C90843A57
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Feb 2025 15:34:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1740580456;
 bh=j3rMfqhZQpSA963KHR38+1nPJJaP5/380A9keD4KOq4=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=LwWmYDbw8AUeLnJ1wBv6Nl0mpT4ziD7pRDIqx7oCimAnY4r+8oQRZ6EA9lHOhTbQV
 z/hGknyCwQbhxJ5POd+iAaZW432/QsFomkSM2ajsnRfhaONqMwvWj/OQHp2HQx4+/X
 dnQ5u0FOh564Y5EFfjFofsIalTKjNdVy05+s4zvc=
Message-ID: <3cbef80a611a8ce6b9584981777810ec054de7f8.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Wed, 26 Feb 2025 09:34:15 -0500
In-Reply-To: <CAGxU2F5N7MrLU_Wsr0D1nBS_C=ojjm-NUmf5_a00j6+jiuDtJw@mail.gmail.com>
References: <38fdf6373fe5f500115d09bcad391e14137b75b8.camel@HansenPartnership.com>
 <CAGxU2F5N7MrLU_Wsr0D1nBS_C=ojjm-NUmf5_a00j6+jiuDtJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [svsm-devel] Using a linux bus for SVSM devices
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev

On Wed, 2025-02-26 at 15:04 +0100, Stefano Garzarella wrote:
[...]
> IIUC the SVSM vTPM driver will be the first one using the new bus.
> Since I have the new version almost ready (need to finish writing
> better commit descriptions), do you think I should post it in any
> case as RFC, or better to wait to include also the SVSM bus?
> 
> The current version is here [1] but it still uses platform devices,
> even though I removed one as requested during the review of the
> previous version.

So on this, yes, it's always wise to post early and often, particularly
where there's a discussion about where the code is going.  Seeing
updated code helps people frame arguments.

Just on the platform device: Greg seems to be going on an anti-platform
device bender at the moment

https://lore.kernel.org/linux-usb/2025021023-sandstorm-precise-9f5d@gregkh/

So you may need to humour him and use his faux bus instead.

> If no one is working on the new SVSM bus or planning to (don't want
> to step on anyone's toes), I can try adding something to that branch
> and send an RFC here.

I was going to do an RFC in my copious free time, but I've no objection
at all to someone else doing it...

Regards,

James

