Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 00A2D1A154E
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 19:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694624888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqHNW2tsOPMJhDSvX1QzMgKAjRpbMJCYadpEtOgBauI=;
 b=RUxXlsKLaj23Yd0lHDauL3iMbs+4pn4RyTSMOlZhFMlwptBGcdSUMMsk6MhbPC1GSW3IZk
 Wkhr45D5x15Pmrf1xu0swnEa3MtNLdQwQeDr2qExNs4uzPE7EwSQHhd+Ei73xU4mI1GK5t
 TRdccxyVds1JuKoQf2O0xEAdyGQow/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694624888;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqHNW2tsOPMJhDSvX1QzMgKAjRpbMJCYadpEtOgBauI=;
 b=uB7k4+mVyE+fGojIC7tpXBHrVfb2oNqIBPwPTlXZXM3VT/gxqNu4gMVeh6Kyz22Nx9F/JP
 +UUbnQSybrjP7jBg==
Date: Wed, 13 Sep 2023 19:08:07 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZQHsd3m61N4YrPlb@suse.de>
References: <ZQGe5nq8rMWujAY9@suse.de>
 <CA+bRGFq=8YJE6tshRdsxtF4m3sRoK2fZu0BmSO2fPHrs52iARQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+bRGFq=8YJE6tshRdsxtF4m3sRoK2fZu0BmSO2fPHrs52iARQ@mail.gmail.com>
Subject: Re: [svsm-devel] SVSM Call Agenda Sept. 13th
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Oliver Steffen <osteffen@redhat.com>
Cc: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"

On Wed, Sep 13, 2023 at 07:04:22PM +0200, Oliver Steffen wrote:
> We could maybe try https://meet.jit.si/ next time? There we have
> unlimited time :-)

More than thankful for alternatives. Can we make recordings in Jitsi?
I see that the openSUSE jitsi instance supports recordings.

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

