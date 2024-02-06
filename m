Return-Path: <jlange@microsoft.com>
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10e::])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 2D9FC1C4A21
 for <svsm-devel@coconut-svsm.dev>; Tue,  6 Feb 2024 18:41:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReyKi+mYR5cbQYvN2pqaWFVoHbHGwRJp242c9IauhrQ=;
 b=Wfs8Bu4+T1c9tQa891c3+21+pjpETGWcHiACWumNipDRogRSkgR4skxxjEYp787WEH+imsIROqQRSn9fsP3NeLcktR0Xw7q/54J87wCA+cz4RQSeZsu2x/+ZsTpZZF/6RQeM6V1xzwsolI87CHZONnwOZDjglZ6YBNl5N37h3IY=
From: Jon Lange <jlange@microsoft.com>
Date: Tue, 6 Feb 2024 17:41:07 +0000
Message-ID: <MN0PR21MB3072D34761004C4555CA635DCA462@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <C58BAD04-27B1-4183-8A65-5E4699E1BFF1@suse.de>
In-Reply-To: <C58BAD04-27B1-4183-8A65-5E4699E1BFF1@suse.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] [EXTERNAL]  SVSM Development Call Feb. 7th,
 2024 (and Cargo workspace transition)
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>

Realistically, there will not be a point in time at which there are no pend=
ing PRs, so there will always be some number of PRs subject to conflict no =
matter when the transition is made.  It seems much better to make the trans=
ition as early as possible to reap the benefits of the transition.  Count m=
e as another voice in strong support of option (1).

-Jon

-----Original Message-----
From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of J=F6rg =
R=F6del
Sent: Tuesday, February 6, 2024 8:29 AM
To: svsm-devel@coconut-svsm.dev; linux-coco@lists.linux.dev
Subject: [EXTERNAL] [svsm-devel] SVSM Development Call Feb. 7th, 2024 (and =
Cargo workspace transition)

Hi,

As some of you already noticed there is a PR now which transforms the SVSM =
repository into a cargo workspace.

I consider the move to a cargo workspace an important change which should b=
etter happen sooner than later, but it is also very intrusive, basically br=
eaking any other pending PR.

So there are two possible strategies right now:

1) Merge the cargo workspace PR and let everyone else rebase their work on-=
top. That is work for everyone, but should not cause major hickups as only =
file paths will change and not the actual file content
2) Merge some of the pending PRs first and then do the cargo workspace tran=
sition. This requires re-basing the cargo workspace PR, which is also quite=
 some work.

I am leaning towards option 1) as I think the sooner the transition is done=
 the better, but I am open to other opinions on this. So if you think optio=
n 1) will not work/causes too much hassle or we should do something differe=
nt, please speak up. Merging PRs is stopped until there is a decision on th=
is, which I hope will be made after the SVSM Development call tomorrow.

The call is happing as usual tomorrow at 9am PST/5pm UTC/6pm CET.

You are all invited to join the discussion at:

https://meet.google.com/ppv-xehx-dvb

Please also let me know of any additional agenda items you want to discuss,=
 either by replying to this email or raising them in the meeting.

A public Google calendar is available here:

https://calendar.google.com/calendar/u/0?cid=3DY181NWEzOGYzNDYwYzYzODc2MmE3=
NWQ0ZmQ2ZWRhM2IxY2Y0NTVlYzRjZmQ3ZjgzMjAxZTNjYmY4MTdiNDIwZGQ4QGdyb3VwLmNhbGV=
uZGFyLmdvb2dsZS5jb20

Looking forward to see you all there and discuss the above topics!

Regards,

J=F6rg R=F6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstra=DFe 146
90461 N=FCrnberg
Germany
https://www.suse.com/

Gesch=E4ftsf=FChrer: Ivo Totev, Andrew McDonald, Werner Knoblich (HRB 36809=
, AG N=FCrnberg)

--
Svsm-devel mailing list
Svsm-devel@coconut-svsm.dev
https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
