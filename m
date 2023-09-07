Return-Path: <jroedel@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 51EC62670C2
 for <svsm-devel@coconut-svsm.dev>; Thu,  7 Sep 2023 18:42:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EA2062187B
 for <svsm-devel@coconut-svsm.dev>; Thu,  7 Sep 2023 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694104928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flLZgF9HTkAOwp7PNUPFqdmUOrELcenT4PT6A7daOPU=;
 b=P1BC6lO/gzRB8fOyE8QJ3mDWmLwxPrxKFddeLdGnEqkIOB4BYOS2Zzj73FMZ4qxDLO1hQ7
 k6AUf7wLKD7XvRuVokzlpIpL4RMm4P+W6uCiqQh/AvCOQDQ52l08hx1OcSqVeVD/RqnPnK
 fovrdJX2Kag3utBQ2oT5hKUIPkMy+RU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694104928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flLZgF9HTkAOwp7PNUPFqdmUOrELcenT4PT6A7daOPU=;
 b=K0DZRebKLrPynx83Go+SCH8BUjDp/R2KUCZlB7jfLJ0HUJBnj+XtUjm6KFgLsNeoI5Scct
 jZIllWOy8W6e6aBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9C12138F9
 for <svsm-devel@coconut-svsm.dev>; Thu,  7 Sep 2023 16:42:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RlTkM2D9+WTIJAAAMHmgww
 (envelope-from <jroedel@suse.de>)
 for <svsm-devel@coconut-svsm.dev>; Thu, 07 Sep 2023 16:42:08 +0000
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Date: Thu, 7 Sep 2023 18:41:58 +0200
References: <ZPBqvbMM28sdqewQ@suse.de>
In-Reply-To: <ZPBqvbMM28sdqewQ@suse.de>
Message-Id: <54F5774C-F26A-449E-83FE-6BAA6EF9CD53@suse.de>
Subject: Re: [svsm-devel] [RFC] SVSM Development Call
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

Hi,

> Am 31.08.2023 um 12:26 schrieb J=C3=B6rg R=C3=B6del <jroedel@suse.de>:
>=20
>                  CEST   ET     CT     PST
> Wednesday         6pm    12pm   11am   9am=20

Based on the feedback to this thread I chose the above slot for the =
meeting. The first one is scheduled for September 13 at 6pm CEST/9am PST =
and repeats every two weeks.

There is a public Google calendar which you can add to a calendar app of =
your choice:

=
https://calendar.google.com/calendar/embed?src=3Dd750138ac91273752b32e5e9d=
7b2a96c826b800da6a3afd690d9ff1298e05181%40group.calendar.google.com&ctz=3D=
Europe%2FBerlin

The meeting will happen via Google meet here:

https://meet.google.com/jqz-yonh-ngb

Have a nice week and hope to see you all there :-)

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

