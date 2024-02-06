Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 0F55D1C456B
 for <svsm-devel@coconut-svsm.dev>; Tue,  6 Feb 2024 17:29:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707236954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nUysi8c9Bu/xn+XNFRmS2UCGeK6DxQQ45GIXgJSIVFE=;
 b=tjWoCJa42WiaEtlG5rBVf16JiQ8zvyriWzHAuvUWh1pHsdhhWLdnqKhwCp7nkD4/1OIZKm
 bCx5m6QhcpgJXpgZLMWAwlUppcWVqbu8WzB/5m0y7O4CWObhpX8OtELMdgoWSzgOuGcLBx
 SR547VTDuPmCQjDdqiqZqYZPmiJZ+h8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707236954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nUysi8c9Bu/xn+XNFRmS2UCGeK6DxQQ45GIXgJSIVFE=;
 b=sBc929WthFJ5xO4U75hihDUa/FzlpL3ZvEHkbf7dq5O2z23LoWvhkdEjLI97NrPU72YeEi
 Ax2eFnoWdgXcvUAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707236954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nUysi8c9Bu/xn+XNFRmS2UCGeK6DxQQ45GIXgJSIVFE=;
 b=tjWoCJa42WiaEtlG5rBVf16JiQ8zvyriWzHAuvUWh1pHsdhhWLdnqKhwCp7nkD4/1OIZKm
 bCx5m6QhcpgJXpgZLMWAwlUppcWVqbu8WzB/5m0y7O4CWObhpX8OtELMdgoWSzgOuGcLBx
 SR547VTDuPmCQjDdqiqZqYZPmiJZ+h8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707236954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nUysi8c9Bu/xn+XNFRmS2UCGeK6DxQQ45GIXgJSIVFE=;
 b=sBc929WthFJ5xO4U75hihDUa/FzlpL3ZvEHkbf7dq5O2z23LoWvhkdEjLI97NrPU72YeEi
 Ax2eFnoWdgXcvUAA==
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Message-Id: <C58BAD04-27B1-4183-8A65-5E4699E1BFF1@suse.de>
Date: Tue, 6 Feb 2024 17:29:02 +0100
Subject: [svsm-devel] SVSM Development Call Feb. 7th,
 2024 (and Cargo workspace transition)
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev

Hi,

As some of you already noticed there is a PR now which transforms the =
SVSM repository into a cargo workspace.=20

I consider the move to a cargo workspace an important change which =
should better happen sooner than later, but it is also very intrusive, =
basically breaking any other pending PR.

So there are two possible strategies right now:

1) Merge the cargo workspace PR and let everyone else rebase their work =
on-top. That is work for everyone, but should not cause major hickups as =
only file paths will change and not the actual file content
2) Merge some of the pending PRs first and then do the cargo workspace =
transition. This requires re-basing the cargo workspace PR, which is =
also quite some work.

I am leaning towards option 1) as I think the sooner the transition is =
done the better, but I am open to other opinions on this. So if you =
think option 1) will not work/causes too much hassle or we should do =
something different, please speak up. Merging PRs is stopped until there =
is a decision on this, which I hope will be made after the SVSM =
Development call tomorrow.

The call is happing as usual tomorrow at 9am PST/5pm UTC/6pm CET.

You are all invited to join the discussion at:

https://meet.google.com/ppv-xehx-dvb

Please also let me know of any additional agenda items you want to =
discuss, either by replying to this email or raising them in the =
meeting.

A public Google calendar is available here:

=
https://calendar.google.com/calendar/u/0?cid=3DY181NWEzOGYzNDYwYzYzODc2MmE=
3NWQ0ZmQ2ZWRhM2IxY2Y0NTVlYzRjZmQ3ZjgzMjAxZTNjYmY4MTdiNDIwZGQ4QGdyb3VwLmNhb=
GVuZGFyLmdvb2dsZS5jb20

Looking forward to see you all there and discuss the above topics!

Regards,

J=C3=B6rg R=C3=B6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstra=C3=9Fe 146
90461 N=C3=BCrnberg
Germany
https://www.suse.com/

Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)

