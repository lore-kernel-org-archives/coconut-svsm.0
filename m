Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963873AEB35
	for <coconut-svsm@lists.linux.dev>; Mon, 15 Jun 2026 06:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506354; cv=none; b=kGGf/nvWyzc1SnBgRQOdGkMeGJcEiTU9HugWe7gXfQ9XWaUt2Px4CUwt0eOFTqFy+x7jnGPYsAvGKIKGC8O5+EgUDeciav6BjZhtxlSMu037OeoGfJB1l7g5OXZWO3n/sQKzmqlIcMytLavLxFVZcvtLdFViOPK0+0UQinsqa6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506354; c=relaxed/simple;
	bh=JHYw1InguJzZvRiJKD7I7kCGJLZd5Eb36VKtkmh5lK0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Ba6iAMblviCGaN1/YenxFFBY1tcPl3wJKUydm3Eng3Q+gVB50gP8P8gKwl0qAvwh30/DDo+4xfZlrKJyIMmmlkywvohyI+26gHtys1BerjJ3zFxaIUqJbbbwwKkFmVpsK0vBsG525QDO40pK2hIBiDJlf8dttmCYdSVJzNOr6uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gSRkn8eW; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gSRkn8eW"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bed2195323cso424002266b.1
        for <coconut-svsm@lists.linux.dev>; Sun, 14 Jun 2026 23:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781506351; x=1782111151; darn=lists.linux.dev;
        h=autocrypt:content-language:cc:to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHYw1InguJzZvRiJKD7I7kCGJLZd5Eb36VKtkmh5lK0=;
        b=gSRkn8eW8K0lQp1akk0SoF08Gti3hL5M9rumjXJ5mhLh2Gjnsa0dBzVTd1S5S33LFb
         M3OxzEv1nmiZx5YAcAcqZQiU0o1z4BjBbQCfO92s9dILi27rX5NF672VFmvQRsxhcOwb
         aFvGcm/UkTv7A7GVDsr9Ev1nANLzr+DwAdnxf4i88q6uRPkClv1Ow70neqgtlVz3RKnd
         KZTl5i8EXq+xnMg2xloo43EwiLRs/zIQicffFQWKp5pgIKOzXN/u6oP+mIJcB0pSGmd0
         undS08ZinVhjrIDsgMNaIULBCoAYxQweSegagCkaP0eTgTJ7s7UAzlfHf1KzJmk+9KHs
         i1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506351; x=1782111151;
        h=autocrypt:content-language:cc:to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHYw1InguJzZvRiJKD7I7kCGJLZd5Eb36VKtkmh5lK0=;
        b=say0N8kX/u36XMhHTSd3n9WrkaFfrCmHsVSneaJmYafp3ViM7ZqWj+41OEB5WAJusO
         aPtnoSUR6xHe7zhl4h33og/+wRKyR4D92yb7tiWO0WWYAPO8OTA1TfLIBTIrVpTbRXdD
         wKif2l/DzrZeVruTDyv6dC5IrJw34kZqhz/x5rYNCmNEeU3GEm7S9Jx+wpR4fuKWC2LO
         hhwSLg/KkCW5NA0srjnIdKS9FeRhem09z9MDR/j5QFUvLTJ4GodGh5ZnBNx5sAa6mV4a
         8cQAxvWiCancB5uZzDT/Kkin6j/vy2NRVeC9mWKUJkeul3Oid7l0QYLLFD4xvPXVhKue
         nAeA==
X-Gm-Message-State: AOJu0Ywu8cxkEzSYwNe/05M5s9L9LoYgDIxzYRu6webc62drPQEcvY3+
	7DGxTk2WawOkciGBdLH0s8IWLA1A4VqcNdWS0mb26obKXkSnq06KVBreewMdcP7jRdQ=
X-Gm-Gg: Acq92OHgpBUmSD1n+Xu9MEH/FP1uRFRgTTGkhu/6ApaBdVO+vNWMf9QfHJfBu7+DWQJ
	gbbT9O94YfJRr2ry+tg6gdEJlgL5YaBt88FxgKXeiXrYqEuDI+R058bL2Nh/vQdbeh5/qvRGDGs
	yzATMpc3J0iW4+c/N1yBqzZGfOQOP4J7lbnPTilRgPP0V8mIxmLJrr8IxrNGXOB+F3nCl471aRW
	u/GEWgtc80LHyclVJ0uQC5WFVV/md7CeMiVA9+R5xEAJ4JKBR17RoHlyNjlBQVOAfE67hZi3t0z
	puJwukSwPeRmTLx2lPg2MjA/xJiMc5GuyO9AacUYctsZ1F7QoCpwDCzVRkVaNw0oREt9DNuCsA1
	IECfP6gQX8ge2mWbW/sx8MlmZNgGnllp0fZocmtZYyR7SEjcffvoXmHqZjOJU2+8duHU4sa2rMw
	MQhXm4iweS0gVTwcuw7eybvCO83JJ9APmA+bDo/ZxYSBZRS1E4D7f5wuy3oRqUbHv90BpMBq/X7
	QhnVU6DZxLiCHl+LuX0vEG0vtt5WV6zj5kBYLIRIH10AEbP95P5pA==
X-Received: by 2002:a17:907:6d10:b0:bed:8f7e:d84b with SMTP id a640c23a62f3a-c006c665b99mr324773566b.43.1781506350996;
        Sun, 14 Jun 2026 23:52:30 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb531896dsm399869766b.27.2026.06.14.23.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:52:30 -0700 (PDT)
Message-ID: <946c1ef4-c8e0-4830-932a-bcbf125fca8b@suse.com>
Date: Mon, 15 Jun 2026 08:52:30 +0200
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: KVM planes and TDX
To: peter.fang@intel.com
Cc: coconut-svsm@lists.linux.dev
Content-Language: en-US
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JLUZ8JDimyf0nJzcvabvcwdj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JLUZ8JDimyf0nJzcvabvcwdj
Content-Type: multipart/mixed; boundary="------------EKC2L3ORQG5isAjQuZEga7k2";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: peter.fang@intel.com
Cc: coconut-svsm@lists.linux.dev
Message-ID: <946c1ef4-c8e0-4830-932a-bcbf125fca8b@suse.com>
Subject: KVM planes and TDX

--------------EKC2L3ORQG5isAjQuZEga7k2
Content-Type: multipart/mixed; boundary="------------G16vkHgM5WVrKdN0R9RY0nO0"

--------------G16vkHgM5WVrKdN0R9RY0nO0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGV0ZXIsDQoNCkpvZXJnIFJvZWRlbCBtZWFudCBJIHNob3VsZCBhc2sgeW91IGFib3V0
IFREWCBwYXJ0aXRpb25pbmcuDQoNCllvdSBhcmUgcHJvYmFibHkgYXdhcmUgb2YgSm9lcmcn
cyBzZXJpZXMgaW50cm9kdWNpbmcgcGxhbmVzIGluIEtWTSBbMV0uIFdlDQphdCBTVVNFIHdv
dWxkIGJlIGludGVyZXN0ZWQgdG8gaGF2ZSBDb2NvbnV0LVNWU00gc3VwcG9ydCB3aXRoIFRE
WCwgdG9vLiBUaGlzDQpyZXF1aXJlcyBLVk0gcGxhbmVzIHN1cHBvcnQgZm9yIFREWCwgd2hp
Y2ggcHJvYmFibHkgbmVlZHMgdG8gdXNlIFREWA0KcGFydGl0aW9uaW5nLg0KDQpEbyB5b3Ug
a25vdyB3aGV0aGVyIEludGVsIGlzIHdvcmtpbmcgb24gYW4gdXBzdHJlYW0gTGludXgga2Vy
bmVsIHBhdGNoc2V0IGZvcg0Kc3VwcG9ydGluZyBURFggcGFydGl0aW9uaW5nIHVzaW5nIHBs
YW5lcz8gT3IgaXMgdGhlcmUgYW55IG90aGVyIHVwc3RyZWFtIHdvcmsNCmF0IEludGVsIGZv
ciBURFggcGFydGl0aW9uaW5nIG9uZ29pbmc/DQoNCkknZCBiZSB1cCBmb3IgZG9pbmcgKHNv
bWUgb2YpIHRoaXMgd29yaywgYnV0IEkgZG9uJ3Qgd2FudCB0byBjb21wZXRlIHdpdGggYW55
DQpJbnRlbCB3b3JrLCBvZiBjb3Vyc2UuDQoNCkknbSBhd2FyZSBvZiB5b3VyIHdvcmsgWzJd
LCBidXQgSSdtIG5vdCBzdXJlIHRoaXMgaXMgc3RpbGwgYW4gYWN0aXZlIHByb2plY3QuDQoN
Cg0KSnVlcmdlbg0KDQpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNjA2
MDgxNDQyNTIuMzUxNDQzLTEtam9yb0A4Ynl0ZXMub3JnLw0KWzJdOiBodHRwczovL2dpdGh1
Yi5jb20vaW50ZWwtc3RhZ2luZy90ZC1wYXJ0aXRpb25pbmctc3ZzbQ0K
--------------G16vkHgM5WVrKdN0R9RY0nO0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------G16vkHgM5WVrKdN0R9RY0nO0--

--------------EKC2L3ORQG5isAjQuZEga7k2--

--------------JLUZ8JDimyf0nJzcvabvcwdj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmovoS4FAwAAAAAACgkQsN6d1ii/Ey9c
lQf/ZJo8xrr++0Z13QwnN94lcJz9yP1j9HHJcoT5YgnTsXcUVyRMG8q8wf+zvaS+D7psNnssa3Wc
qXtaUAjvJpcUwsNiwdc1/h3B7bDgf2kehzL0URPgGUP0/dDpaKW5DBQBrCvagbtr/cDbCJRwHdcD
Q+KuYEl7OuTOeHUUYwttwSej/56riTkbICqkx/lrKrxVSgGsTWyCh1zWTizpqRj24HtoMqLS1SoG
GS+P1zRVHPjfRDFDn7QKAdv/CeeOCXcVZthGyerRwj/0wN6LvMnyW7lExx4vQcwHiox5aFHq49rM
WjBaPN39ZX3Q+50NBkCYnhFiB/CDkk0/ZNanRZbUFg==
=i7T0
-----END PGP SIGNATURE-----

--------------JLUZ8JDimyf0nJzcvabvcwdj--
