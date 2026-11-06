Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.37.111.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977262;
	b=Zhlc1AmidnmJvzzcHDC1AVuZ5jAmGfwg6STxgGcldbELi3+HAg5MFuB5AjMBmB9dp3n1
	 qf+MaZjgRqa2e1gmfZWJJZViBWReWA9vnFeKTqeKNekqFAz79rxhawIdXLbSdaxyGHAtl
	 DZX2vzmKGfBXWIHgY4/BRqruqy+Vk9IF1yWpRzGi+38RcxgWS6n/J6WVl0SDUJWvZxQzm
	 jVgiBy7QitB36U2CdwOX+qWcfVtAtHCVDffP8hEDMlOlTR7NWScCDZ4WyVLutCjA25EZk
	 WOGrWhdJ+HTn9Qaln7RmyeJHp8r+iR+5BP10KjMJecY371Uewk+5/5u6TBrvcjcOZ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977262;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=yzd+GCKIVHKfFYmD8AFSICY6VmDuMLmOYGV9UzK2dWY=;
	b=KkvbAkwhqUFm3awDWHh60xHmDFshMWQDnXmWrQp0RiNIjjeaKRA7WdRG1IlWA76ZtQzM
	 EXOHLCpx45SWPbBRXnpt2pRf+T22f8lXKXB3FZyE1MoZuJoFuArB34GtliDKcdaXmmJhX
	 3DWhG5D1aFYxwW45ZHghQbPbVS2Mu/GT+mRBbjBdrqHL1oL0WA011cF0lYvRKYa1LZvBu
	 QiM+nf/av4WbndplnOypL6ONMvtaJ/IKmygfBhjtVpVQ9Q+vrIEem7ylTac1AA1AM74Zu
	 p9577r9usUCbz2LB26kJ8fGffKhVbmHthRtgBCIUVFvqX08OqTH5+wZBxtNAa0W7+Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=HansenPartnership.com;
	spf=pass smtp.mailfrom=HansenPartnership.com;
	dkim=pass header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=wyTfa4Jg;
	arc=none smtp.remote-ip=198.37.111.173
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B205606A326;
	Fri,  6 Nov 2026 15:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B205606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=wyTfa4Jg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1793977259;
	bh=5eQBfJ0yczzUiSKJ8EZ8P6D8sM05B7F639QsQk4HSYY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=wyTfa4JgzZkJJuRcCs0OvI5rBhrn+FReFLJw2McReTkadF86yqdzjvzc0WA0hEoAu
	 Ip7VgjdVVFPVQIXqEnFK/LG5f0CmHGG6Lewaaiy9q36L4qiWdNQm/4QN1ekO7SUBUN
	 YvXSPsTrxBshzK9zYCtCdhaxC+UYdO2cCRf6UciI=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8309])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 2DA4C1C05A3;
	Fri, 06 Nov 2026 10:00:59 -0500 (EST)
Message-ID: <85a6a70f70562e7c6b7e2a784a87683778e23026.camel@HansenPartnership.com>
Subject: Re: SVSM Development Call November 4th, 2026
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, 
	coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Cc: Paul Meyer <katexochen0@gmail.com>
Date: Fri, 06 Nov 2026 10:00:58 -0500
In-Reply-To: <auoEI5wICyOXh-gH@8bytes.org>
References: <auoEI5wICyOXh-gH@8bytes.org>
Autocrypt: addr=James.Bottomley@HansenPartnership.com;
 keydata=mQENBE58FlABCADPM714lRLxGmba4JFjkocqpj1/6/Cx+IXezcS22azZetzCXDpm2MfNE
 lecY3qkFjfnoffQiw5rrOO0/oRSATOh8+2fmJ6el7naRbDuh+i8lVESfdlkoqX57H5R8h/UTIp6gn
 1mpNlxjQv6QSZbl551zQ1nmkSVRbA5TbEp4br5GZeJ58esmYDCBwxuFTsSsdzbOBNthLcudWpJZHU
 RfMc0ew24By1nldL9F37AktNcCipKpC2U0NtGlJjYPNSVXrCd1izxKmO7te7BLP+7B4DNj1VRnaf8
 X9+VIApCi/l4Kdx+ZR3aLTqSuNsIMmXUJ3T8JRl+ag7kby/KBp+0OpotABEBAAG0N0phbWVzIEJvd
 HRvbWxleSA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT6JAVgEEwEIAEICGw
 MGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAhkBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAml2ZBI
 FCS3GUMIACgkQgUrkfCFIVNZKjQf/deRzlXZClKxTC/Ee2yEPqqS7mm/INUA49KdQQ5oIhSxkUBy0
 9J4qjMIo5F8ZFkFTqikBqeL35LKu7O7rn8WETfX8Bxvos3HUsl3jHo34DES4MUFIpoQPgtiLRGwLb
 K0cVCAArR2u2qj4ABmTRrs1I1kvdjEw6gatOuXtEe/j5O2fvfzTq9GBr0Q3n2IAsFXi4hLlx6VPE8
 tyWUZ8BWJKtih3JAeUiXFvASL3McV0rV9RnU0VbjEQEhSE7PMYhWpnDC9AyBb0lXJllQRvC3NSkUB
 8KVQgNNxRPss0WE/nBoZ4dFA42jTyzTz8lNylxZoAWV7WJb3QxVg4oCodRVrxxrQhSmFtZXMgQm90
 dG9tbGV5IDxqZWpiQGtlcm5lbC5vcmc+iQFVBBMBCAA/AhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeA
 QIXgBYhBNVgbnPItGJxvq2a34FK5HwhSFTWBQJgS5mYBQkbNYS9AAoJEIFK5HwhSFTWBpwIAL5Bk3
 5FB34U6iHmDzzgdCbxLTs43T/YQyJpcGIvopBvnI/fDY8oSG6Df64/O6B+1R+A8TDp6ZG5ysUWnCC
 6GuIaEHemBYkitMPglR6+sGCMQY7O0mlsPvdssvKK1KI9Bno4VU6ogaF2qVzefSqg1Djmf/DcsxWP
 rI/jdJ8FB5AYR2rjIdDFc+zRdAJuavo1/anyY2wgpFh/3R8IOYAEfWV9nGgYkf9+tA4EIn1sxE0I3
 L5oW2N3mbyRrkzuBwO8ztMCwqEPk7moWzhokcZqMXiAIahaZdkashJC+s2X2RZSGCy+g+pvY5NN4B
 BVG5XwLgVBqbHMTcxE0fbmPqz+q6O0LEphbWVzIEJvdHRvbWxleSA8amVqYkBoYW5zZW5wYXJ0bmV
 yc2hpcC5jb20+iQFXBBMBCABBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAmODZ5ACGwMFCRs1hL0F
 CwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQgUrkfCFIVNZu0Af/TzvL2/NdgAcw9uN3x60H8
 jc4QUq14VpxcFEFEMpcj1morkX/G93V+56HBBaXZj+yK8PhxIA/SIz+sU7C/0YvKuvzakP8ZX/7WJ
 e32SOUtjfr/VTaqjIBzNj6OxLvZpmNbBw7s6DwhhNpHOWqJ/1ml+PtDRDV71IB58yVqQjp1xlNKVl
 ZppcJ5908EJzsFnRIVjiQiDSKoppqB2BCibBbrWcln7CiWMyOC/cco6SIn6twH+f7+aivJ3xGcOE2
 a9gBKF5rNi9TBoX9oyPmshv/TDmnohsVrH7AYXlGYfZTk15SWEiROh1QX8/uD9wl/gcIv5EDUpT/F
 L2jzOsA5663bw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-03 at 16:56 +0100, J=C3=B6rg R=C3=B6del wrote:
> Hi,
>=20
> Here is the call for agenda items for this weeks SVSM development
> call.=C2=A0 Please
> send any agenda items you have in mind as a reply to this email or
> raise them
> in the meeting.
>=20
> We will use the LF Zoom instance. Details of the meeting=C2=A0 can be
> found in our
> governance repository at:
>=20
> 	https://github.com/coconut-svsm/governance
>=20
> The link to the COCONUT-SVSM calendar is:
>=20
> =09
> https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?v
> iew=3Dweek
>=20
> The meeting will be recorded and the recording eventually published.

One of the requests on this call was around the ability to create a
signing EK, which Dionna's proposal a long time ago covered.=20
Unfortunately, we couldn't pull up the thread because it was on the old
list.  However, Konstantin has now imported J=C3=B6rg's mbox and we now hav=
e
the complete thread about adding parameters to the SVSM vTPM
attestation:

https://lore.kernel.org/all/CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=3Dg0-=
u0DZTQ@mail.gmail.com/

Regards,

James
