Return-Path: <tleroy@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 30DE71C003D
 for <svsm-devel@coconut-svsm.dev>; Thu,  2 May 2024 15:34:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714656853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Srw0//Tg+TA29g1R/n8tPhHTil6r0slWRBH8lNcdF+k=;
 b=ufW1JhlL8ab5jjcSJEkNNjWtjCWGbs9/6ztm2nED2vs4vaTm1Zl1/NL9Cwm/yBu0rSL02p
 H0K3U5vAd8RBstHUyW/+TSaT+a4rWeynVJljKQ5rjBO1H3JyUUw2RN6b9klaf+ayiSfgWg
 NgCQn3KwagFHoQMp01FzaHjwmR/sB0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714656853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Srw0//Tg+TA29g1R/n8tPhHTil6r0slWRBH8lNcdF+k=;
 b=Rzf1f17+8Tfs2td23KLin5IS6adprVjdIfCC0vSsibJjDqe19z5SF1J0MkBhGpwowC6rMa
 M/kJhBXRaFR8isBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714656853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Srw0//Tg+TA29g1R/n8tPhHTil6r0slWRBH8lNcdF+k=;
 b=ufW1JhlL8ab5jjcSJEkNNjWtjCWGbs9/6ztm2nED2vs4vaTm1Zl1/NL9Cwm/yBu0rSL02p
 H0K3U5vAd8RBstHUyW/+TSaT+a4rWeynVJljKQ5rjBO1H3JyUUw2RN6b9klaf+ayiSfgWg
 NgCQn3KwagFHoQMp01FzaHjwmR/sB0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714656853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Srw0//Tg+TA29g1R/n8tPhHTil6r0slWRBH8lNcdF+k=;
 b=Rzf1f17+8Tfs2td23KLin5IS6adprVjdIfCC0vSsibJjDqe19z5SF1J0MkBhGpwowC6rMa
 M/kJhBXRaFR8isBw==
Message-ID: <4f398d58-830f-405f-bca1-4a424bbe6d60@suse.de>
Date: Thu, 2 May 2024 15:34:12 +0200
MIME-Version: 1.0
References: <443d86bb-4915-44b0-8cef-93f1619cee2e@suse.de>
 <9693cc9c-80a6-45f4-9c4d-4bcc15ced56b@suse.de>
 <DS7PR21MB35244CC4F41EEEA0240F5E13CA1A2@DS7PR21MB3524.namprd21.prod.outlook.com>
Content-Language: en-US
From: Thomas Leroy <tleroy@suse.de>
In-Reply-To: <DS7PR21MB35244CC4F41EEEA0240F5E13CA1A2@DS7PR21MB3524.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] [EXTERNAL] Re:  x86 decoder further steps
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Jon Lange <jlange@microsoft.com>, =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>



On 4/30/24 19:01, Jon Lange wrote:
> As COCONUT-SVSM grows into additional configurations, it will become ne=
cessary for the SVSM to emulate MMIO instructions on behalf of the guest =
OS.  This will require instruction emulation as well.  It would seem a po=
or choice to have two different instruction emulators for handling #VC an=
d guest instruction emulation.  At the same time, it would be a poor choi=
ce to incorporate a fully functional instruction emulator both because it=
 would be big (which has impact both on resources and attack surface) and=
 because it would be excessively flexible (which dramatically increases t=
he possibility of exploitation).  I expect the best strategy would be to =
continue to expand the existing instruction emulator so it can handle dec=
ode of the common MMIO-handling instructions, such as moves (including 16=
-byte moves), common ALU operations (especially bitwise operations like A=
ND/OR/XOR/BTS/BTR as well as TEST, plus their atomic equivalents), and ot=
hers that may be determined through experimentation.  Limiting the scope =
of emulator capabilities in this way by expanding the existing emulator s=
hould strike an appropriate balance between functionality and safety.
I first thought that we could replace our naive decoder by a more
complete one, using a third-party crate to save time. As said Carlos, we
could have only picked the decoder part of the iced-x86 crate to reduce
the amount of code to import, leaving the emulation part to us.
However, if we'll never need a much more complete decoder, I agree with
you that it's better to add the missing NAE events instructions decoding
+ emulation to our existent #VC handling code.

I'm not aware of any potential future needs for a complete decoder (not
emulator), but maybe some people here do. That was another purpose of my
first email. :)

Thomas

--=20
Thomas Leroy
Security Engineer
SUSE Software Solutions

