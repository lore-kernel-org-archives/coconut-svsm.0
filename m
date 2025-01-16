Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 58BE72E003F
 for <svsm-devel@coconut-svsm.dev>; Thu, 16 Jan 2025 17:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737046285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZevCcvEXzdwQO9JDQ8www35TxtlitlV/3OB/SH5BBXM=;
 b=jhqHqFaCgXqpgeOMUC5m1la4myJf94CHu4GvfAtwmJ7+Vmg8K1AD7owIln2fd2PBJ+FkxG
 3GpQqtLUebx62RaT91b5Uqzt+rJHNIYz7Lvdg8ivnGVf/WpRr4KXjbje1ZHVgTCDAVtIOw
 fz9ZAr/oOBY2PXLb0TrHR/sHKbsTEKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737046285;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZevCcvEXzdwQO9JDQ8www35TxtlitlV/3OB/SH5BBXM=;
 b=XBq/MiEoanCL9J8TZ6QR/wvZm+53KxF/HzHilp3w7wB9lkXZmSSqu7uMyfAw8QztjIOvti
 wKRMVvk41AjciTDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737046285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZevCcvEXzdwQO9JDQ8www35TxtlitlV/3OB/SH5BBXM=;
 b=jhqHqFaCgXqpgeOMUC5m1la4myJf94CHu4GvfAtwmJ7+Vmg8K1AD7owIln2fd2PBJ+FkxG
 3GpQqtLUebx62RaT91b5Uqzt+rJHNIYz7Lvdg8ivnGVf/WpRr4KXjbje1ZHVgTCDAVtIOw
 fz9ZAr/oOBY2PXLb0TrHR/sHKbsTEKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737046285;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZevCcvEXzdwQO9JDQ8www35TxtlitlV/3OB/SH5BBXM=;
 b=XBq/MiEoanCL9J8TZ6QR/wvZm+53KxF/HzHilp3w7wB9lkXZmSSqu7uMyfAw8QztjIOvti
 wKRMVvk41AjciTDA==
Date: Thu, 16 Jan 2025 17:51:23 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <Z4k5C2bw8El7Yn9S@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] Confidential Computing MC-like workshop in May?
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, amd-sev-snp@lists.suse.com
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>, dhaval.giani@amd.com, thomas.fossati@linaro.org, leonardo.garcia@linaro.org, mathieu.poirier@linaro.org
Content-Type: text/plain; charset="utf-8"

Hello everyone,

I hope you had a great start into 2025 and return refreshed for more
exciting confidential computing work :)

Our last get-together as the confidential computing community was in
September last year and this years LPC is far away in December. So there
is the idea to have another in-person/hybrid event earlier in May,
alongside Linaro Connect 2025 (May 14th-16th, 2025) in Lisbon.

Lorenzo (on Cc) reached out to ask if there is interest and enough
expected attendace at such an event? I personally see quite some value
in another in-person event before December.

Please let us know what you think and whether you would attend such an
event, either in-person or remotely.

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany
https://www.suse.com/

Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG Nürnberg)
