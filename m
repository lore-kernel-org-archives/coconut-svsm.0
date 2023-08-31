Return-Path: <cclaudio@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 87F57269C1F
 for <svsm-devel@coconut-svsm.dev>; Thu, 31 Aug 2023 21:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=FyvEodm5z8wK+3NFXF7GvwgeHfhGgTc2cW74LuTMXu8=;
 b=S8afOqGGzIGi9a1ABCsreattkmOCA0RYv5pxecxJmX66utnt7pmWZgaMqnZyQjSOB3rF
 4UhEK0KTY0F6RicNSlmvVsLaxVUQZZX3Hj25TrARA/16yt5cRLi9BafDR2aSZ7R7SNCV
 1yhaGEPSS95FO+dyzYKUTdCZ1FGYV+2yxMQKKjOjP0bBUGbzNCTcAcBJXdw0Jlh7uCVA
 8OM8KfdjiJISXGW8FDW6yhjuOYHBujyMNy5mJQDftdxFf/o+RyMF0E6wZ4jC+BtmwX01
 Je9bZKw1hw2nPRJlTxOLxto0rTOIaXh7kNkacOm8VkMe/TaeJa52v5C1YbZiCW49Dk9r 2g== 
Message-ID: <72a93094a9c05d96ab0d8e7e25ec9fa012cdfe47.camel@linux.ibm.com>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Date: Thu, 31 Aug 2023 15:18:59 -0400
In-Reply-To: <ZPBqvbMM28sdqewQ@suse.de>
References: <ZPBqvbMM28sdqewQ@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] [RFC] SVSM Development Call
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>, svsm-devel@coconut-svsm.dev

Hi J=C3=B6rg,=20

The Wednesdays / Fridays time slots should work best for me.
Thanks for putting this together.

Claudio

On Thu, 2023-08-31 at 12:26 +0200, J=C3=B6rg R=C3=B6del wrote:
> Hi,
>=20
> I talked to a couple of people recently about our SVSM project and the
> idea came up to schedule a semi-regular call where the community can
> sync on development and direction of the project.
>=20
> It also fits my wish to be more transparent about our direction and work
> and helps move discussions out of private formats to a more public
> community forum.
>=20
> So I wanted to propose a couple of time slots and see what people think.
> The idea is to have a meeting every 2 weeks, I will collect and post an
> agenda beforehand and we can always cancel if there is nothing to talk
> about.
>=20
> Some time slots that would work for me:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CEST=C2=A0=C2=A0 ET=C2=A0=C2=A0=C2=A0=C2=A0 =
CT=C2=A0=C2=A0=C2=A0=C2=A0 PST
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Tuesday=C2=A0=C2=A0 5pm=
=C2=A0=C2=A0=C2=A0 11am=C2=A0=C2=A0 10am=C2=A0=C2=A0 8am
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6pm=C2=A0=C2=A0=C2=A0 12pm=C2=A0=C2=A0 11am=
=C2=A0=C2=A0 9am
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Wednesday 5pm=C2=A0=C2=A0=
=C2=A0 11am=C2=A0=C2=A0 10am=C2=A0=C2=A0 8am
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6pm=C2=A0=C2=A0=C2=A0 12pm=C2=A0=C2=A0 11am=
=C2=A0=C2=A0 9am=20
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Thursday=C2=A0 6pm=C2=A0=
=C2=A0=C2=A0 12pm=C2=A0=C2=A0 11am=C2=A0=C2=A0 9am
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Friday=C2=A0=C2=A0=C2=A0 =
4pm=C2=A0=C2=A0=C2=A0 10am=C2=A0=C2=A0=C2=A0 9am=C2=A0=C2=A0 7am
>=20
> I have only considered slots that work well for participants joining
> from America or Europe/Africa because most people I talked to live in
> these areas. If people living in Asia/Australia time zones want to join
> as well please let me know. We can use alternating time slots to make
> this possible.
>=20
> Please let me know what you think.
>=20
> Thanks,
>=20
> --=20
> J=C3=B6rg R=C3=B6del
> jroedel@suse.de
>=20
> SUSE Software Solutions Germany GmbH
> Frankenstra=C3=9Fe 146
> 90461 N=C3=BCrnberg
> Germany
>=20
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew Myers, Andrew McDonald, Boud=
ien Moerman
>=20

