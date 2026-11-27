Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.37.111.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788290;
	b=SXE5DruQKto69semxTl35isQYvjlNJ71ytsuwnsRafJ9W/y/HDJh1HhNcUgqohHx5Lpn
	 SRTUJHRa7Gp5HSgdi44W487pTSumU1lI/q1QlCwVHrZhN6bFDnSIoDmG8zUeLI61K9qH5
	 iMzJpL3hYOfvYrR5fy1NdndlrIDBulbl8QMC+jG+nyty8lg0w//2P9BeAi04WzmYG6952
	 qLN9ifg7awkPNmiafrNCSNAcNO22V833PnHQ5P7nid8ukztNbhdr69NTzWKMwRmsYxUfB
	 RXviUHEflk4jfRfg0tgRf4LHYEFcOAgH0RHVQ1AquAfGlPoimxoxEKWKpNQN726K3Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788290;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=p3n5NA2MlIY1kdsAVTniTW2glkK3Gcdyi9nrhi4fu3s=;
	b=gaaE3fexRiVDEt19fMq5uzq7bt+AtrzX0DWvqto7+BKVWEB1MMsP48CZ3xp6YvoIyMhI
	 4FjLX/BAV+qvQsIAVrjo5O1j9umcqyJju9HAYSWon0J3ptSOdQrtBl35DFxgHv8/7Qi+9
	 Dc616U1U6UrInnZq4svn1SNI6FxtjMiHobsqFuhJhh1Vr5ce8/0LivoJZO8oAraIqyNRV
	 SHQCh3TY8+yYPj6XNfQU3c8JeVknC7j4zyt6UJ6NFuuqq23iYQJSyipOjtWTWyA9JUMNu
	 1w9YKXmWhoOi1x1UDBOAGvotKGK6IwXFMoexCI+RquUqMi0Ry3C+HH+qaZaqkvTXTYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=HansenPartnership.com;
	spf=pass smtp.mailfrom=HansenPartnership.com;
	dkim=pass header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b="Mlb/oigI";
	arc=none smtp.remote-ip=198.37.111.173
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD214606A333;
	Fri, 27 Nov 2026 14:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD214606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=Mlb/oigI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1795788288;
	bh=j4x7LDiBpS7gszjrrCNgB+t+hEtojYPX5RN4C8qMUss=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Mlb/oigIwaVVn79PKrMnh7IpYaJ38qwjsSfd+/+INjc0ohzOwDZsNYH/cW4JB9mgw
	 db+b7DubUb0m36BoonlA0SstfxPfZuxMGe/P/0uLTGRGmTfxY2tYD75JUV4OJ0C82p
	 W7X2LSkOmAsuigWw2mBp9wnwNzSSBrhf5S2GtL4g=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8309])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 822601C07E7;
	Fri, 27 Nov 2026 09:04:48 -0500 (EST)
Message-ID: <c84cba39a4bc68a20efca97b617cddf107761838.camel@HansenPartnership.com>
Subject: Re: Discussion on policies around minimum rust version for
 coconut-svsm
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, Mahmoud Nagy Adam
	 <madam@amd.com>, coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Date: Fri, 27 Nov 2026 09:04:47 -0500
In-Reply-To: <awkz05_7U4lmN17K@nucbdw.ghoffman.csb.home.kraxel.org>
References: 
	<d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>
	 <65vkyfqwo92zb.fsf@amd.com> <awglpsRXwJRS7aa5@8bytes.org>
	 <ef51cb7df408839ce80921d9133020c46da3c27a.camel@HansenPartnership.com>
	 <awkz05_7U4lmN17K@nucbdw.ghoffman.csb.home.kraxel.org>
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

On Fri, 2026-11-27 at 08:58 +0100, Gerd Hoffmann wrote:
> =C2=A0 Hi,
>=20
> > > Also Debian stable uses Rust 1.85, COCONUT is already on 1.88
> > > with the aim to go to 1.91.
> >=20
> > Well that's only because of this:
> >=20
> > https://github.com/coconut-svsm/svsm/pull/1277
> >=20
> > And the rationale is dependency on this project
> >=20
> > https://gitlab.com/kraxel/virt-firmware-rs
> >=20
> > requires it to pull in a bug fix, but if I look through the commit
> > logs of the latter I can't figure out why (presumably Gerd or Luigi
> > can explain);
>=20
> uefi-rs (which virt-firmware-rs depends on) raised the bar.=C2=A0 The
> dependency update pulled this in.=C2=A0 Note that virt-firmware-rs does
> not require the latest version ...
>=20
> 	uefi =3D { version =3D ">=3D 0.39, < 0.42" }
> 	uefi-raw =3D { version =3D ">=3D 0.15, < 0.18" }

Digging into their reasons, it's this:

https://github.com/rust-osdev/uefi-rs/commit/89def6ad014294d0549d3efccab4af=
b55ae3f6ea

So they're blaming their dependencies ... it's turtles all the way
down.  Their commit logs are a bit useless (like most github projects)
but there are hints it's this issue:

https://github.com/rust-lang/rust/issues/100189

> ... so pinning uefi + uefi-rs to an older version in coconut should
> work for now.

THat's probably a good idea given this commit:

https://github.com/rust-osdev/uefi-rs/commit/b6876100e8a1cdf12ccea09252adc4=
ef4b367519

Although I don't quite know why going to 1.95 would be a breaking
change ... but if they mark it as such, it's likely going to be a
problem for you ...

The bottom line is they seem to be a project with an aggressive view
about increasing rust versions to get language features, so if there's
no way of controlling them, their view is going to become the forcing
function even for coconut.

> It is unclear how long that will hold though.=C2=A0 There have been
> incompatible changes which affected virt-firmware-rs in the past,
> most recent was the 0.38 -> 0.39 update (which why 0.39 is the oldest
> supported version).=C2=A0 It will probably happen again in the future ...

Would I be right in guessing it's just Cstr16 and the variable
interface you get from them?  The former should probably be generic,
like it is in C and the latter could be done internally.  I'm not
saying that's what has to be done, just probing for ways to reconcile
this conservative vs aggressive rust policy problem.

Regards,

James
