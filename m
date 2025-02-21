Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 1D42A432CC
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 18:29:51 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-abbc38adeb1so413750366b.1
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 09:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740158991; x=1740763791; darn=coconut-svsm.dev;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+idODt/G7RPriZA1xV8Gq8aS6imxy61hcqqzENf8mS0=;
 b=bFxZVZ0IToWnXUIk9I2OKoGBbkWKO1d41ZLkB5rmddyBC+BPKJ8wRnUXW9PfM0uYdc
 vu5JLGrEQgAT8iE8XQkB876H7VOXnOXD/MuOu919HkSUz5N+j/zisKKjyTXdhNwDcKZ/
 qdvYwTaUU3/c1O+51wTiKwyZ2yMZt0i4qESssATHKyKsSG0LhYh23Tc+w8HU2NMYaUv0
 Woefya3IsrB9ziltHiK/UGWTMJqaO1Y/0ChFMIYU67SX7IQIy1FNjYYv2fzBeLW7ikL9
 lnZy9GWn/SRqHPvCiJ6kF+MSR2GFONNWV8Ykmb7gVmg1+d1pB6SIj25igF5AU/2/OpPO
 DsFA==
MIME-Version: 1.0
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
 <CAAH4kHay7jEbjpV19BG6Ghsr4fy2Gxce2Ud6Gtc3QPX4aYgTjQ@mail.gmail.com>
 <596e9f2233a8938ec1360159df4f84238db2b20a.camel@HansenPartnership.com>
In-Reply-To: <596e9f2233a8938ec1360159df4f84238db2b20a.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 21 Feb 2025 09:29:39 -0800
Message-ID: <CAAH4kHZ6SdM4oAj6NbJ=z0eYT2DtvPm7SW=s3H-fA+T4i_426w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [svsm-devel] vTPM service attestation format update
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: svsm-devel@coconut-svsm.dev, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>

> That's a lot of GUIDs; why not simply define a guid for the additional
> arguments and then pass them in in TPM form (except probably native
> endian)?
>

That sure does sound nice, but that will mean either adding a new call
to the vTPM service so that it changes which EK it reports in the
service manifest, or to clarify in the service manifest that "the
endorsement key" refers to the last created primary key on the
endorsement hierarchy. That could be fine too.

I will note that in SVSM Revision 1.00 section 8's first table "table
14. Attestation Protocol Services" seems like a copy/paste error from
table 10. It should be "table 14. vTPM protocol services")

| Call ID | First version supported | Name | Function
|  2 | 2 | SVSM_VTPM_CHOOSE_ATTESTED_EK | Changes service state to
report the given EK in the service manifest |

The request structure is the send command request structure restricted
to create primary on the endorsement hierarchy. Seems silly, so I
would say no to that.

If we say the attested EK is the "last created", this increases the
obligations on persisted data for the vTPM. Not a big problem, but
just something to be aware of.


--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
