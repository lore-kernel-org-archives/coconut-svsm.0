Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD833FE652
	for <coconut-svsm@lists.linux.dev>; Wed, 14 Oct 2026 19:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.37.111.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006660; cv=none; b=LKtszifP9REGjqqG61DB/krn8YuYunncQaAHQ3vdsWSJpU/Ik5iYztFpiZ2RGOOLWUns3gFxAyIEaq9tuEjXdg1mPsh9BSw2mY7aoRZ3BJqvKlV8NxASA8MS+dlsoiZVyE3Nyx41K0mm9CPABfrbg4hjlVnrfrjq3oHNrOZRSXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006660; c=relaxed/simple;
	bh=OjrWwARnPi1B+Y0XZa72jgy86kjrJw4kR1tsNAbIUW4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Co5hUrfETbresSjX7V+GbGHVEzUxi+l9iZ1bUtfCu5H3Vf/E2NDZ0YLRMZQ3Bl49zU3RdpfVhfExCHVeXSlbm8DrLJO5E5LElnAHWJujmicKyEgba5qMIiTia5x29Y8NDZaEiZWTLxdLL7IC8VxRM2hwPHWVdkCAtD5yLVBE2gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=phIeJnIo; arc=none smtp.client-ip=198.37.111.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="phIeJnIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1792006656;
	bh=OjrWwARnPi1B+Y0XZa72jgy86kjrJw4kR1tsNAbIUW4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=phIeJnIo/cWRQKtOJ7l4nnrn/Jm0Q6ERFDHjjglc4n1GIffiVP5DeVfLHQZiTeZ/D
	 b2UNI5UtqMhR4rpXDM4PIARv0D5uXIJbJR3BlliRgooK3AYj5cyRhRGXi2k7v/U0Hc
	 W+oP6lwVND206T/VclYJuTAJHNvYcl9JqtQbJVZY=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8309])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id A801A1C024D;
	Wed, 14 Oct 2026 15:37:36 -0400 (EDT)
Message-ID: <c397a444492ac996add776569871dde6bac60b41.camel@HansenPartnership.com>
Subject: Re: Inline attestation of vTPM-bound keys
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Jeff Andersen <jeffandersen@google.com>, coconut-svsm@lists.linux.dev
Date: Wed, 14 Oct 2026 15:37:35 -0400
In-Reply-To: <CADRsRuW1zJxk2+WxM2oQX1T_nq9O5SOoswhMQH+OsNvz9hUiHg@mail.gmail.com>
References: 
	<CADRsRuW1zJxk2+WxM2oQX1T_nq9O5SOoswhMQH+OsNvz9hUiHg@mail.gmail.com>
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
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

I cut the previous text because what was presented today at the meeting
was a bit different.  To follow up on the outsideInfo being part of the
key derivation material I checked and it isn't: it's only used as the
nonce for the creation data.  The specs we had are slightly different
since I use the 1.16 spec mostly because that's supported by every 2.0
TPM I've seen in the field.  That has an exact KDFa formula for the
derivation of the private key from the seed.  The 1.85 spec you were
looking at is much more handwavy since they switched to a DRBG and
don't specify exactly how the private key is calculated.  Table 37 says
the entropy used to derive the private key must come from "DRBG
initialized using a hierarchy seed and the hash of the input template"
and the input template is the TPMT_PUBLIC you pass in to the
TPM2_CreatePrimary command which does not include outsideInfo.=20
However, the public template does have a unique parameter which is
usually zero, but could be filled in to give the entropy you want.=20
It's form is always the public key form of the key you're creating (so
it's two points for an EC key, the d number for RSA etc).  It
definitely looks like there would be a bijective transformation to use
the outsideData as the unique in some form which might provide the
linkage you were looking for.

Regards,

James
