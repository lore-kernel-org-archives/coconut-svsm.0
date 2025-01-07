Return-Path: <James.Bottomley@HansenPartnership.com>
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [104.223.66.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id F2FF72E002D
 for <svsm-devel@coconut-svsm.dev>; Wed,  8 Jan 2025 00:08:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1736291295;
 bh=HMiBiA/wjEFCDapYSNMC3e5iiTOK3Q/ehnaOFjFPa6A=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=LZm99slUT244knZxktmV8kPO1+A9SHCFMZPGvoReI0A29QTuPzWUShpNMoGpa1CfZ
 nqQ0TXtCKrvlxm2WWCJOJZTcE67ji7GArCAHajngBnyxlGoCeOz9v4CY/GJX9XAYdz
 wn242izfEi9QB4te1KOROiAxM8qPUu80AY/0Dv6g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1736291294;
 bh=HMiBiA/wjEFCDapYSNMC3e5iiTOK3Q/ehnaOFjFPa6A=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=D4rO+6HBLbHFTPaw5Je5oPFmGZ3EbwtUQj3b1oZUKhm0hTVewUAGYAUzxL8CbU76I
 Cm7cn1RofIVxOt/8tM5ViyOHUIg2Kfuj/EFwOrbzDo94MOaQ9NWrKnDSZvRtzJFwLo
 KYi6BRtcrhRlUHog1x7KqcMBPOuddB3+kzjrjXrg=
Message-ID: <06c94a892ce95aa043b6afaf3e61f8ee2b3010e8.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Tue, 07 Jan 2025 15:08:13 -0800
In-Reply-To: <CAAH4kHb21i+CbknQyYjycu2vracmJENkxS8-=VMCmOoNgA0p=A@mail.gmail.com>
References: <Z31OYDtmN3DRe3oN@8bytes.org>
 <CAAH4kHb21i+CbknQyYjycu2vracmJENkxS8-=VMCmOoNgA0p=A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] SVSM Development Call January 8th, 2025
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dionna Amalie Glaze <dionnaglaze@google.com>, =?ISO-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Tue, 2025-01-07 at 08:26 -0800, Dionna Amalie Glaze wrote:
> On Tue, Jan 7, 2025 at 7:55 AM Jörg Rödel <joro@8bytes.org> wrote:
> > 
> > Hi,
> > 
> > Happy new year everyone!
> > 
> > Here is the usual call for agenda items for the first SVSM
> > development
> > call in 2025.  Please send me any agenda items you have in mind or
> > raise
> > them in the meeting.
> > 
> > I have one item on the agenda so far:
> > 
> >         * IGVM support for QEMU.
> 
> Regarding this, I'd like to make sure we cover the topic of MSFT
> donating the IGVM spec and implementation to the CCC for appropriate
> open governance.

The spec isn't really separated from the code: it's all one thing.  I
think in principle this document along side code is a good thing and we
want to keep it that way, so you're in effect asking to move this
entire repo:

https://github.com/microsoft/igvm

The IGVM format is designed to be useful beyond simply confidential
computing for multiple different virtual machine images, so even if we
were to move it, I'm not sure the CCC would be the best place to
guarantee that universality.

>  We're institutionally blocked without a significant approval chain
> to provide code to competitor companies.

This sounds a bit like an internal Google problem; I may be able to
help you with this, but I think it's been a while since I engaged
Google legal on open source.  However, the main argument for you to
deploy is that for open source the whole point is to collaborate with
your competitors in the open and you should be empowered to do that.

>  Keeping the tools Coconut-SVSM and Qemu uses under Microsoft is an
> inversion of power, even with the MIT license.

You mean simply by hosting it under our external github account?  It's
where we incubate all our open source projects that accept outside
contributions (and where we hope to openly demonstrate stewardship
worthy of community trust) and I believe Google does something similar.
All corporations tread this fine line: if the project accretes a
vibrant community, we'd likely be happy to move it elsewhere, but we
equally don't want to be accused of simply throwing code over the wall,
which is why we incubate projects to see how they progress.

Regards,

James
