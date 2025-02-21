Return-Path: <James.Bottomley@HansenPartnership.com>
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com
 [IPv6:2604:f440:8:8::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 0D78343007
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Feb 2025 20:04:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1740164656;
 bh=bZ/FUPM6Ejv4ERxxksGjVeyampMa1qJDQgavCOC3luo=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=wtcdYNr700HwQsPwMwVlTmKhAM6NZBALabh+1CgZWxkqL3K96KmEWGB64V/ztM8ie
 5T+oUMB6rwaZ2F0Z4CevY076FjAryYbfztoU/catssXFKrprjY4uaG0bODUj3Q6bLx
 RGI/OR3sJWz9EFMFxOe6exEL5RRT3QTPkje37ZkU=
Message-ID: <635e767a188aa8f83a1c9741821b021b48664ad6.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Fri, 21 Feb 2025 14:04:15 -0500
In-Reply-To: <CAAH4kHZ6SdM4oAj6NbJ=z0eYT2DtvPm7SW=s3H-fA+T4i_426w@mail.gmail.com>
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
 <CAAH4kHay7jEbjpV19BG6Ghsr4fy2Gxce2Ud6Gtc3QPX4aYgTjQ@mail.gmail.com>
 <596e9f2233a8938ec1360159df4f84238db2b20a.camel@HansenPartnership.com>
 <CAAH4kHZ6SdM4oAj6NbJ=z0eYT2DtvPm7SW=s3H-fA+T4i_426w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [svsm-devel] vTPM service attestation format update
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: svsm-devel@coconut-svsm.dev, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Content-Type: text/plain; charset="utf-8"

On Fri, 2025-02-21 at 09:29 -0800, Dionna Amalie Glaze wrote:
> > That's a lot of GUIDs; why not simply define a guid for the
> > additional
> > arguments and then pass them in in TPM form (except probably native
> > endian)?
> > 
> 
> That sure does sound nice, but that will mean either adding a new
> call to the vTPM service so that it changes which EK it reports in
> the service manifest, or to clarify in the service manifest that "the
> endorsement key" refers to the last created primary key on the
> endorsement hierarchy. That could be fine too.
> 
> I will note that in SVSM Revision 1.00 section 8's first table "table
> 14. Attestation Protocol Services" seems like a copy/paste error from
> table 10. It should be "table 14. vTPM protocol services")

Heh, yes, that was pointed out when Tom first produced the current doc
... and several time since.

> > Call ID | First version supported | Name | Function
> >  2 | 2 | SVSM_VTPM_CHOOSE_ATTESTED_EK | Changes service state to
> report the given EK in the service manifest |
> 
> The request structure is the send command request structure
> restricted to create primary on the endorsement hierarchy. Seems
> silly, so I would say no to that.
> 
> If we say the attested EK is the "last created", this increases the
> obligations on persisted data for the vTPM. Not a big problem, but
> just something to be aware of.

Well, you could do that, yes.  However, I was actually thinking of
adding two new attestation guids having a _WITH_ARG suffix that allow
you to pass in an extra pointer and length representing an argument
buffer that the attestation protocol could validate and use.  Thus the
VTPM attestation would choose the current template in the non-_WITH_ARG
case as it does now and validate and perform attestation on the
requested template in the _WITH_ARG case.  For completeness of inputs I
suppose it makes sense that a whole template should actually be passed
in as a TPMT_PUBLIC.

Regards,

James

