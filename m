Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.37.111.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709943;
	b=D9Ig1T09piUXsDdkS3T0lufr5eDZ8AWybWQFreMStTocmawYw947eHfEJyhZCSKiXohO
	 bm4GmG0EhCT2vtIEjzAW1KAxY2V+VR4RH5c60FelT9tIPCa571AEqJe07VRZcCJsY0hxn
	 JbHyqSSABsOAhKUKKl77lqOpj/j3YW/ap0J/NzbO1Rkz7qk6hXb0yOamy0+/Z1OVlynPz
	 uKE+ZRg570TQRN99H27zvJh8lX9ilhlwfD/SGN6Lt8duHLDtmSR0yJMLPLlTHRol0HhRQ
	 6HaHaqWKwehFjtGJzZUPsbMgPEkVyWshhpfybIPbE0BLpf/CdiGXL5K5pbCWdD1vAOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709943;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=POVlFWk6u5eEavXM6cBTqxSZ/l/WCbrqO1lpca7Avm8=;
	b=K8I9WyZZrLLoxXHRAlzXDUvn+paG4aWuQn50oXu52b9U37niykp6Xhfldey6ePg6YbBE
	 cOpgyJ4blHVaFR1shjd8dmGW/sjCMz1drSCZfEhzF9xShryN0mfpY2pjWZ7bMAeqE5KPs
	 KpwYBSzdXGa1W8po/M9JJ5EJZ0+Jz+4g6el/hYyunjuu4i2inkZS35vv7l7dvTk29kCHU
	 66VtvKWSFsdcJFVxTO+qVjK2XHzhuPPilJ+l2i1BglxPuG6lKDTg7HvAHxdpn/fUqvxxv
	 UH+3sk9GIJ3peEwSD4LGyKFlm4covZn7YYB5Fnwd3TGW7YRpQNd/mEHneJDAnB8m8ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=HansenPartnership.com;
	spf=pass smtp.mailfrom=HansenPartnership.com;
	dkim=pass header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b="fsr5dK/I";
	arc=none smtp.remote-ip=198.37.111.173
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8044606A32D;
	Thu, 26 Nov 2026 16:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8044606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=fsr5dK/I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1795709936;
	bh=74YwIf+PYD90z7UKNj5VqIwas8dRX6fb9j8BuowJT2c=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=fsr5dK/IJc0NTxupHd6qmJfcJgxmN8BH4PxUSjRG38UhlRel10oKCVNQ4eqTGEKd1
	 w867J6zoNhRS98JXXpAn0dKh/Vb4TpcRqVU98r1Eiy+qeGc/cKyZ/CboxtuLr6xf/C
	 F/DQI0yh8LnWMKsximatUYrYrqoA/kHPo6fdaO+c=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8309])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 67F4A1C0291;
	Thu, 26 Nov 2026 11:18:56 -0500 (EST)
Message-ID: <ef51cb7df408839ce80921d9133020c46da3c27a.camel@HansenPartnership.com>
Subject: Re: Discussion on policies around minimum rust version for
 coconut-svsm
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, Mahmoud Nagy Adam
	 <madam@amd.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Date: Thu, 26 Nov 2026 11:18:55 -0500
In-Reply-To: <awglpsRXwJRS7aa5@8bytes.org>
References: 
	<d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>
	 <65vkyfqwo92zb.fsf@amd.com> <awglpsRXwJRS7aa5@8bytes.org>
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

On Thu, 2026-11-26 at 13:31 +0100, J=C3=B6rg R=C3=B6del wrote:
> Hi Mahmoud,
>=20
> On Wed, Nov 25, 2026 at 07:32:08PM +0100, Mahmoud Nagy Adam wrote:
> > For information, Rust for Linux already has a policy for this:
> > their minimum Rust version follows Debian Stable's and is raised
> > some months after each Debian stable release, so the kernel can
> > always be built with the Rust that Debian ships
> > (https://rust-for-linux.com/rust-version-policy).
> >=20
> > We could generally follow this policy, unless a forcing function (a
> > needed language feature or a dependency fix) requires a newer
> > version.
>=20
> The Rust4Linux project is in a different situation. They do not use
> cargo and vendor all external dependencies to maintain them within
> the Linux source tree.
> This gives them much more freedom to set the minimum Rust version
> because constraint #2 (from James' email) does not apply to them.

I agree with this, but it it too late to question why coconut couldn't
remove or at least reduce external dependencies? =C2=A0I know it's a lot
easier for the rust4linux project because the kernel has a huge library
set of stuff it had to home grow which rust4linux can just use.
However, if I look at the coconut dependency list today, it's not that
huge.  I'm definitely biased; I tend to see the package ecosystem of
rust going the same way as all the others and leading to nasty security
problems like log4j via uncontrolled indirect dependencies.  To give a
concrete example: the goal of making coconut fips compliant by forcing
all crypto through a fips library is impossible to achieve today due to
crypto in indirect dependencies.

> Also Debian stable uses Rust 1.85, COCONUT is already on 1.88 with
> the aim to go to 1.91.

Well that's only because of this:

https://github.com/coconut-svsm/svsm/pull/1277

And the rationale is dependency on this project

https://gitlab.com/kraxel/virt-firmware-rs

requires it to pull in a bug fix, but if I look through the commit logs
of the latter I can't figure out why (presumably Gerd or Luigi can
explain); however, since the authors are also coconut committers it
might be possible to negotiate a way to get the bug fix without
requiring a rust version increase.

If the crypto dependencies all get dumped for fips, there's really only
the closely allied projects and some odd helpers which remain.  It
might be possible to internalize the helpers and keep the allies if
they agree to the same rust version policy (and crypto policy for fips)
... sort of a half way house between the way a normal rust project
behaves and the no external dependency requirement of rust4linux.

Regards,

James
