Return-Path: <erbse.13@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 9BDDD269794
 for <svsm-devel@coconut-svsm.dev>; Thu, 31 Aug 2023 11:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1693473638; x=1694078438; i=erbse.13@gmx.de;
 bh=hm8KFY/qWoJ8rLOsuII+HJi40mCG/WTxUKAgzpplj7g=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=Rla44+Mbt8xeDq4g5lHoGaNsRDZn8QuY7fY+loCLspCRCwDIQVLnFqVgIdJRZDrfIvvHkO2
 nyqOd8D+O5v2pPRbyhhIpuX8q08AsplNYRSC+2wXiZr2YmJ462dIH99H4hlwdV8zibJ5Td3kh
 lbgZjNsp3CNKh1Aza/BPngbu5bWtFdd6GNbJ5hdvLB3lYXNMu+1J5a5QK9I2KHyPLLZzzUjuV
 nIjZXmsydzjJPTWb4yc/DWLqnj3Ty9M0hQxdYSX1h5x4uJve5AzD0tbWisM62G3C1aon5VA81
 i2qTqFVQRadqrLoCla84zsRPL4G70ToH3owMBAqGv39wf/uej34w==
Received: from [192.168.13.4] ([5.146.128.56]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRMs-1qEVK60TKW-00TivZ for
 <svsm-devel@coconut-svsm.dev>; Thu, 31 Aug 2023 11:20:38 +0200
Message-ID: <57404878-5b38-4d67-9c5b-0db0ec53929b@gmx.de>
Date: Thu, 31 Aug 2023 11:20:24 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <ZPBZ-QTrz85YkEbQ@suse.de>
From: Tom Dohrmann <erbse.13@gmx.de>
In-Reply-To: <ZPBZ-QTrz85YkEbQ@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------osOWGxgKtKNWGjeSibUz5iK4"
Subject: Re: [svsm-devel] Coconut now builds with rust-stable
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: svsm-devel@coconut-svsm.dev

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------osOWGxgKtKNWGjeSibUz5iK4
Content-Type: multipart/mixed; boundary="------------fjLmYxRXs7Yc1PRCq8851Qaj";
 protected-headers="v1"
From: Tom Dohrmann <erbse.13@gmx.de>
To: svsm-devel@coconut-svsm.dev
Message-ID: <57404878-5b38-4d67-9c5b-0db0ec53929b@gmx.de>
Subject: Re: [svsm-devel] Coconut now builds with rust-stable
References: <ZPBZ-QTrz85YkEbQ@suse.de>
In-Reply-To: <ZPBZ-QTrz85YkEbQ@suse.de>

--------------fjLmYxRXs7Yc1PRCq8851Qaj
Content-Type: multipart/mixed; boundary="------------ygCaPOhuASZmPdENGuzq2dOZ"

--------------ygCaPOhuASZmPdENGuzq2dOZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDgvMzEvMjMgMTE6MTQsIErDtnJnIFLDtmRlbCB3cm90ZToNCj4gSGksDQo+
DQo+IEkganVzdCB0ZXN0ZWQgYW5kIG1lcmdlZA0KPg0KPiAJaHR0cHM6Ly9naXRodWIuY29t
L2NvY29udXQtc3ZzbS9zdnNtL3B1bGwvODENCj4NCj4gd2hpY2gsIGR1ZSB0byB0aGUgYXdl
c29tZSB3b3JrIG9mIENhcmxvcyBMw7NwZXosIG1ha2VzIGFsbCBuZWNlc3NhcnkNCj4gY2hh
bmdlcyB0byBidWlsZCBDb2NvbnV0LVNWU00gd2l0aCBydXN0LXN0YWJsZS4NCj4NCj4gT25l
IHByZXJlcXVpc2l0ZSBmb3IgdGhhdCBjaGFuZ2Ugd2FzIHRvIGdldCByaWQgb3VyIG91ciBj
dXN0b20gYnVpbGQNCj4gdGFyZ2V0IGFuZCBzd2l0Y2ggdG8gdGhlIGdlbmVyaWMgeDg2XzY0
LXVua25vd24tbm9uZSB0YXJnZXQuIFRoaXMgbWVhbnMNCj4geW91IG5lZWQgdG8gYWRkIHRo
aXMgdGFyZ2V0IHRvIHlvdXIgcnVzdCBpbnN0YWxsYXRpb24gZnJvbSBub3cgb24uIE9uIG15
DQo+IHNpZGUgYWxsIEkgaGFkIHRvIGRvIHdhcw0KPg0KPiAJJCBydXN0dXAgdGFyZ2V0IGFk
ZCB4ODZfNjQtdW5rbm93bi1ub25lDQo+DQo+IHRvIHN1Y2Nlc3NmdWxseSBidWlsZCB0aGUg
U1ZTTSBhZnRlciB0aGlzIGNoYW5nZS4NCklmIHlvdSBwbGFjZSBhIGZpbGUgY2FsbGVkIHJ1
c3QtdG9vbGNoYWluLnRvbWwgd2l0aCB0aGUgZm9sbG93aW5nIA0KY29udGVudCBpbiB0aGUg
cHJvamVjdCByb290IGRpcmVjdG9yeSwgcnVzdHVwIHdpbGwgYXV0b21hdGljYWxseSBpbnN0
YWxsIA0KdGhlIHRhcmdldCBvbiB0aGUgdXNlcnMgbWFjaGluZSB3aGVuIHRoZXkgaW52b2tl
IGNhcmdvIGZvciB0aGUgZmlyc3QgdGltZToNCg0KW3Rvb2xjaGFpbl0NCnRhcmdldHMgPSBb
Ing4Nl82NC11bmtub3duLW5vbmUiXQ0KDQpSZWdhcmRzLA0KVG9tDQo+IEhhdmUgYSBsb3Qg
b2YgZnVuLA0KPg0K
--------------ygCaPOhuASZmPdENGuzq2dOZ
Content-Type: application/pgp-keys; name="OpenPGP_0xA1907110D8518A9A.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA1907110D8518A9A.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
cnUWfaxnFCASHLaA7Q0cB3mQH6g=3D
=3D5ZSj
-----END PGP PUBLIC KEY BLOCK-----

--------------ygCaPOhuASZmPdENGuzq2dOZ--

--------------fjLmYxRXs7Yc1PRCq8851Qaj--

--------------osOWGxgKtKNWGjeSibUz5iK4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEah0uLdn3fBXaEZrdoZBxENhRipoFAmTwW1kACgkQoZBxENhR
iprVtgf/aDRMYNBgJTb9/6C6cFYtgmmDjh9YnD7CXxHuNbfDpjRBxmpeDTN6vWIA
8FMB3Ae/cJYEq3UDU7nXyBr8INJzsRE0pgK52EgObRIU8zfhBqez7bOv15x36k8o
OlCm3WP4LY8u9ocfKfGlI8wvverqfWWSJprc3iC8uscfNjiSQDkR/4+JnAjqadFX
L6pmfF0gAe7f98bWFROYjlo283+ZG5WeB3w+Wcwr6a+VQskrSR0IkbEBUzvZMAfI
oqpFWQgmL7ENBzEfn40NuqNhPZ7zd3PaphstlFDxAClfSzIglSHYNSCWpvF/O+ci
h//5wtE+gUSu8N6WSugnRVpQPaKqyg==
=yrvX
-----END PGP SIGNATURE-----

--------------osOWGxgKtKNWGjeSibUz5iK4--
