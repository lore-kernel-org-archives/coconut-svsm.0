Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 476A11A154E
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 19:05:53 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EF914218DF
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694624752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pEIdO62kG3ZWVUuqiNMyJegrJ+zxHeDHkDgIyeAjHcc=;
 b=syBUDZ+JQaRyQzmpEkmjtMIpUzJMh/uXs1iIagX/mYd+N2oQXch73auUiMe1oJ6RE8ok+l
 5lLqlJG7Q4NEe8qblZOWLTWArZxTiS7bFiZ6zkX/kOVMYgl1AwIvMiv8vOYr5SJ0Ig6QC9
 vnUVYDcnmtnbVtwcSINxN+oeaanyGXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694624752;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pEIdO62kG3ZWVUuqiNMyJegrJ+zxHeDHkDgIyeAjHcc=;
 b=VW13Fzx1eRqK7BAgyUHgSTSWC7oNnxpUU5I1W/1mZo7aJnz+jN4e+iNZJj8ttD4cZY1Aq9
 rsV12+ktvSCfieBw==
Received: from suse.de (jroedel.udp.ovpn1.nue.suse.de [10.163.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D24CF2C142
 for <svsm-devel@coconut-svsm.dev>; Wed, 13 Sep 2023 17:05:52 +0000 (UTC)
Date: Wed, 13 Sep 2023 19:05:51 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZQHr75YiTvnEt4-A@suse.de>
References: <ZQGe5nq8rMWujAY9@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQGe5nq8rMWujAY9@suse.de>
Subject: Re: [svsm-devel] SVSM Call Agenda Sept. 13th
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"

On Wed, Sep 13, 2023 at 01:37:10PM +0200, Jörg Rödel wrote:
> Have a lot of fun and see you in the meeting!

Sorry that the meeting ended so abruptly, apparently it is because I am
not a paying google customer :(

I will look into how to change that for the next meeting.

Anyway, I want to thank everyone for attending and the good discussions
we had before the tool threw us out. I really enjoyed it and felt we
made some good progress on the topics discussed.

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

