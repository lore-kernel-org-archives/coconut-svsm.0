Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 607891A22D2
 for <svsm-devel@coconut-svsm.dev>; Wed, 27 Sep 2023 14:57:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695819437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWugLnqpaYMvv/PFjBHFXuTqcL9B3QHyr/DeDPFDXKw=;
 b=wmJRXxy8Y5oVsay8Qu2SqWcaNHOSPbIvBgq9RZL7u6jj7MPs2Db69hcHhIDmhSH3eXYU4m
 /cQaAEny3C1+zHARie5Ef3npUG5BBq9IEzgUeTARJzMt8uvCm6k5oQKOu8SAob4bZIp2pJ
 A3IOGgsMqJSx2mxCOkqpo3tQRwwhaPw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695819437;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWugLnqpaYMvv/PFjBHFXuTqcL9B3QHyr/DeDPFDXKw=;
 b=iPEOrFVxqZaVZ3it5citipdxqNvZtVM42pN70rmyq+JE7Bsmn2WH72I1/AJQUAQMklfnk0
 D6d/4pljOSrvDLDg==
Date: Wed, 27 Sep 2023 14:57:16 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZRQmrEC7S5zlRMFN@suse.de>
References: <ZRGfRVgczigX_tyR@suse.de> <ZRQb6WDRz3q1F4Jg@suse.de>
 <CAGxU2F76O=et5X7W_2Dc3TgyqtJ0b1WDMMVnczP+fVr7WwC0DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGxU2F76O=et5X7W_2Dc3TgyqtJ0b1WDMMVnczP+fVr7WwC0DQ@mail.gmail.com>
Subject: Re: [svsm-devel] SVSM Call Agenda for Sept. 27th
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"

Hi Stefano,

On Wed, Sep 27, 2023 at 02:29:05PM +0200, Stefano Garzarella wrote:
> talking with Oliver we thought about creating a shared document where
> to put agenda items and notes during the call.
> So we created this Etherpad: https://etherpad.opendev.org/p/coconutsvsm
> 
> If you think there is a better way to share the document and take
> notes together, please advise ;-)
> 
> If this etherpad is okay, I'd suggest adding the link to the shared calendar.

Storing the notes somewhere public makes a lot of sense.

Longer term, and when we made some progress in the governance
discussion, I'd like to have the notes stored in a governance repo at
GitHub. For now Etherpad is perfect, thanks.

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

