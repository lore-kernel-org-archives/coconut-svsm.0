Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 0BA21265DB8
 for <svsm-devel@coconut-svsm.dev>; Thu,  7 Sep 2023 20:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694110740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4liSZIXT7AcFiLKI410hiNf0zhpFOimFfyW64k1rkU=;
 b=su2Phtcghaqoj2R1s6URS11H5gneXgZAdV7xAet3wK5zKZnVyVd8Y+KyxO0yyxbrfI4UNj
 WpF4xam97GHWd/xWz59gNgLS1uUqSAxrZbyOZqVYwz3H0GK7E+hcEtHJKepdHcDtaNbMny
 FYCJArHE+/FHOhDtCPWqRjrxVquV8uw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694110740;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4liSZIXT7AcFiLKI410hiNf0zhpFOimFfyW64k1rkU=;
 b=EaSTBU6LjVchl/fCuo43jBXTG6H10Kh/7YaB23vT5Q2gcj5d/2fGq8ththuPS+qzrSy9mg
 WqyniQTJSyCtpGAA==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
In-Reply-To: <14c73cc1-7a0c-521a-11d8-dcf22e618672@amd.com>
Date: Thu, 7 Sep 2023 20:18:49 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB8C7E4D-E8B7-413D-8DA6-C9AB307BCC03@suse.de>
References: <ZPBqvbMM28sdqewQ@suse.de>
 <54F5774C-F26A-449E-83FE-6BAA6EF9CD53@suse.de>
 <14c73cc1-7a0c-521a-11d8-dcf22e618672@amd.com>
Subject: Re: [svsm-devel] [RFC] SVSM Development Call
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: "Giani, Dhaval" <Dhaval.Giani@amd.com>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

Hi Dhaval,

> Am 07.09.2023 um 18:57 schrieb Giani, Dhaval <Dhaval.Giani@amd.com>:
>=20
> Do you have an agenda is place already somewhere? And if we want to =
add=20
> items, do we just email here?

Yes, if you or anyone else has specific items to discuss please drop me =
an email. I will aggregate everything and send out an agenda before the =
meeting.

Regards,

J=C3=B6rg R=C3=B6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstra=C3=9Fe 146
90461 N=C3=BCrnberg
Germany

Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew Myers, Andrew McDonald, =
Boudien Moerman
(HRB 36809, AG N=C3=BCrnberg)

