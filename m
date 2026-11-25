Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.37.111.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629326;
	b=cCT22NvXz4iy8jxyGYTwEYw5ZIQ6nZJc2SyS2POwZZLlQmBvyTTPhQItLlWpsjyJDEQp
	 /P/GG5Ninb7n5OjRdRmDlvFIN3ugldj0qvn4wIHyGhCCMQX98YDKs2sdguTqo4X0xnL5+
	 HaMb+MJEniyoasPKG6OphQiSrV/S9/3LR2I+wUSWZkaEQXgLLtbJ3hPjL1TaSTqQ6Kgbm
	 JBgZJyVTKKMQUHW2hcnXoofR26LNczEzwqHcfTzJLoO2AB5foM+Rq/dJhOtVx2Us/VhUj
	 R+5YD+womf2JWYKDvNb525AXLKwrpXgoJwJn2wjFUAUTEpbJORIuNe8/xwHIzERykBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629326;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Date:
	 Autocrypt:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=W88O8WaAOVpexIk+K/HPO0dMS1DiP26fdrrIEC9a054=;
	b=2nTv30rulgJCHA7F1ekUYyx5tH9YrWx9umMNMx6qqEhnljWGoF2tCtf4R/QybcaMWhCC
	 X0GtFA+JWTp+by121xLM9cN3r5YixMcLyZYxnjwSmCSJ++jqDh0V39UaBWRQAKKKY3dq1
	 A/Q7IRzGAGz3asvi6vk3jkQ4Ux5yuMT6uklBwlJ6JbfQxsR6luohsDoAksCdQHlewTgvD
	 7cA9iH92pL1wBKSrUF4mCachGE5ugeSSEVT16MAKtxItMRbRU8PQ7E4fjoiEb/+CFa49v
	 DstCcizPabQey/IS9zH/pYt6vQ9wCOvGrg1m/GdQzzZyHmDsB9hTWLPda4VKaIxxTuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=HansenPartnership.com;
	spf=pass smtp.mailfrom=HansenPartnership.com;
	dkim=pass header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=ghvQ3cRU;
	arc=none smtp.remote-ip=198.37.111.173
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9742F606A327;
	Wed, 25 Nov 2026 17:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9742F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=ghvQ3cRU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1795629324;
	bh=n/Xqmr0WFDnb3/6KQYJ6FOrtJFPr9w056e+sAkStl0g=;
	h=Message-ID:Subject:From:To:Date:From;
	b=ghvQ3cRUt77mURb2nTBfXZM9EgbKXDFUwjHscI9Fym+blGrWXB3bEcMI31OtC6kkl
	 /bn4X/Tq+G1PXHQwLAuZIcn8vRmg/fgjdihyw8H2yGuosDewDD21AJIDXxbXOr+ar6
	 YMb/MOp94zEmqu8K7Y6N7bndk0+d7EHbNV8gJgYg=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8309])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 903281C0338;
	Wed, 25 Nov 2026 12:55:24 -0500 (EST)
Message-ID: <d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>
Subject: Discussion on policies around minimum rust version for coconut-svsm
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Date: Wed, 25 Nov 2026 12:55:23 -0500
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

In the Wednesday coconut-svsm meeting I advocated for keeping this the
lowest version possible, in line with the way the kernel handles gcc
versioning, but since rust is a lot less mature than gcc, there are
more compelling reasons not to do this. However, the situation we
really want to avoid is moving too aggressively to a newer rust version
which then complicates actually doing a stable release of coconut
through a distribution.

Just in case it's instructive, the Linux Kernel actually maintains a
global and per-architecture minimum of gcc (checked in scripts/min-
tool-version.sh). The current minimum version of gcc is gcc-8, which is
way behind the latest gnu release of gcc-16. The last time it was
actually changed was in early 2025. The driver for the change was x86
needing gcc-8.1 for stack protector support:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Da3e8fe814ad15c16735cdf394454a8bd96eb4d56

However Arnd Bergmann later raised it globally because there had been
no objections from any other architecture:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D118c40b7b50340bf7ff7e0adee8e3bab6e552c82

You can read the discussion in the links, but the compact summary is
"does anyone care ... no ... OK let's do it"

I think the coconut-svsm policy should be conservative; i.e. we try to
stay on the lowest possible rust version, starting with where we are
now (1.85 but shortly to be bumped to 1.90). However, if any forcing
function comes along that version should be increased. I think the two
forcing functions are

   1. Language feature we really need to help with or simplify the code
   2. cargo dependency hygiene (we need a version of our dependencies
      which is current with fixes and they may require a newer rust
      version to keep that currency)

but others may have things to add.

The other thing that came up is that eventually coconut-svsm will have
to be shipped by distributions and that means its minimum version must
overlap the build versions that distributions have chosen, so this
policy has to also be informed by the policies the distributions (both
enterprise like RHEL and community like Debian and Fedora) are going to
adopt ... which at least Red Hat promised to think about.

Are there any other considerations people can think of?

Regards,

James
