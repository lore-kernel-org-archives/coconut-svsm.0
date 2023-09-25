Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 4A2041A2288
 for <svsm-devel@coconut-svsm.dev>; Mon, 25 Sep 2023 16:55:03 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id CC0AB1F45F
 for <svsm-devel@coconut-svsm.dev>; Mon, 25 Sep 2023 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695653702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xbj7we4UWrSFsE5T1CpFe52K9qP/ltgKIIOaSxd2+hU=;
 b=OIxaH0HuwAhkfaTKsxMX40mwhZnV4bOSpPGIQAjDpEUSqfd1chXidZQyYJju3zxZXX5MXY
 Of5uZgsskDxbCV55KsSAPeZ/+4+wy1c/XHR/in1lDogr8h19NVZbUi+Fc5S1CQuUbX4lu1
 Te+X4GWwAqWpwYNUEYL9I1Ye9uXDL9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695653702;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xbj7we4UWrSFsE5T1CpFe52K9qP/ltgKIIOaSxd2+hU=;
 b=z871qq0FrF/ZNxddyPGd9S1rsrkuFrzAUYwemJLM98iNyzl95BE1tPbXPAfDIVCUzXizIs
 hVmX8W//J157HrCQ==
Received: from suse.de (jroedel.udp.ovpn1.nue.suse.de [10.163.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A6C1E2C142
 for <svsm-devel@coconut-svsm.dev>; Mon, 25 Sep 2023 14:55:02 +0000 (UTC)
Date: Mon, 25 Sep 2023 16:55:01 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <ZRGfRVgczigX_tyR@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [svsm-devel] Next SVSM Call on Sept. 27th
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

Hi,

On Wednesday our next SVSM call is scheduled. Since Google Meet was not
nice to us last time, we will try Jitsi instead. I checked and it will
allow us to do recordings, too. The link is:

	https://meet.opensuse.org/coconutsvsm

The shared calendar is also updated with the new meeting link. The URL
of the calendar is:

	https://calendar.google.com/calendar/embed?src=d750138ac91273752b32e5e9d7b2a96c826b800da6a3afd690d9ff1298e05181%40group.calendar.google.com&ctz=Europe%2FBerlin

iCal:
	https://calendar.google.com/calendar/ical/d750138ac91273752b32e5e9d7b2a96c826b800da6a3afd690d9ff1298e05181%40group.calendar.google.com/public/basic.ics

I also collect agenda items, so if you have anything to discuss, please
let me know. I will send around an agenda before the meeting.

See you on Wednesday,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany

(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman

