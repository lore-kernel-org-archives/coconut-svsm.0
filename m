Return-Path: <James.Bottomley@HansenPartnership.com>
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com
 [IPv6:2604:f440:8:8::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id A45D944CDF
 for <svsm-devel@coconut-svsm.dev>; Fri,  7 Mar 2025 15:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1741357468;
 bh=gxf6HPbbTVcWhANAFLnhUE77XUz/0O3dBzkm5E7XRic=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=hoNZabfE5hs9wYdDnC6GC5FHHyZH1gGAloVOE2a5cm5sIh1QoS4sx24VKVAjo/joT
 WGaYtVx6pV7uosWj4y+a16+CUlArbHF0lOO796YeVlsRsB7mdrr2tk6Buk69inCqHF
 aKVe7T+I4hy4avY7s9tM68TerAyUsmVz3FZmPMS8=
Message-ID: <c17b2eee63c5c16305d2a8b9aa8e451134718cdf.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Fri, 07 Mar 2025 06:24:26 -0800
In-Reply-To: <CAH6wD8X9ttrnt5rTTx8paDiWeBOnZZCgWsEiDHctLqgz5GZucw@mail.gmail.com>
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
 <9f2236e99150814f64f444aff2d3edee495483a8.camel@ibm.com>
 <CAAH4kHaP6n-n=X=zDxonqhv2tZRjycS3R0XBX-FZv6tS7xn_hQ@mail.gmail.com>
 <CAH6wD8X9ttrnt5rTTx8paDiWeBOnZZCgWsEiDHctLqgz5GZucw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [svsm-devel] vTPM service attestation format update
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Geoffrey Ndu <gndu8086@gmail.com>, Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Claudio Siqueira de Carvalho <cclaudio@ibm.com>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>

On Fri, 2025-03-07 at 11:48 +0000, Geoffrey Ndu wrote:
> Since the single_service_manifest call for the vTPM effectively
> certifies EKs, why don=E2=80=99t the =E2=80=9Cselector=E2=80=9D be the ha=
ndle values for EK
> certificates, as specified by the TCG in 2.2.2.5.1 of =E2=80=9CTCG EK
> Credential Profile For TPM Family 2.0; Level 0=E2=80=9D? This approach wo=
uld
> simplify the user experience, as every SVSM would function
> identically, and=C2=A0 SVSM vTPMs would exhibit analogous behaviour to
> physical TPMs.

Because to make life easier we might want to short circuit the EK/AK
makecredential/activatecredential round trip and simply construct a
signing EK to use in place of an arbitrary AK.  Then to make the
signing EK easily useful, we might want it not to have a policy
statement tying it to the endorsement hierarchy password (particularly
as we know that will be empty).  To allow this type of thing we need to
allow flexibility in the EK creation which isn't listed in the TCG
profile EK templates.

Regards,

James

