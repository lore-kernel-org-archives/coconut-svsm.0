Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 0BAE01C0BD3
 for <svsm-devel@coconut-svsm.dev>; Wed, 12 Jun 2024 12:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718186446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41hFLxg01Htpnw796WhT3MUnPbtGNzJbrSe/6sJzzZY=;
 b=dwtdD4AhB/c6fpMHBsn/mRj0aJjXhJoPs86JuQyOFaHiFhwREllbSuyh6tml+Q58HZb8BR
 ZKEWOh4o/gUfUhKQ1ntcVrvfWIrTUP+fivTvO/LrlTJXYzWIKMyqaRvjdzLFyONAcEXNIa
 JF7E/R01+X2+6Ys6M3vcaFA0SkBcef4=
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-62ff8aff966so5451537b3.2
 for <svsm-devel@coconut-svsm.dev>; Wed, 12 Jun 2024 03:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <18df8b3afe39075dd9ab1211d17db83731d39cdf.camel@ibm.com>
In-Reply-To: <18df8b3afe39075dd9ab1211d17db83731d39cdf.camel@ibm.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 12 Jun 2024 12:00:31 +0200
Message-ID: <CAGxU2F43hwr3pJjS-MdOjyVrZ5tQTG3W==vDTJmgd3YhPKr86Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] SVSM Development Call - June 12th, 2024
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>, "James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>

Hi Claudio,

On Tue, Jun 11, 2024 at 10:46=E2=80=AFPM Claudio Siqueira de Carvalho
<cclaudio@ibm.com> wrote:
>
> Hi,
>
> I would like to add two topics to the SVSM meeting agenda:

I won't be able to participate in today's call because I'm on my way
to Brno for DevConf, so I post a few thoughts below.

>
> - What does TPM locality[1] mean for the SVSM vTPM?

Interesting, IIUC an example could be to use different "localities"
for SVSM itself, edk2, kernel, etc.  right ?

> - Is there any SVSM boot event that we want to record in the TPM PCRs/Eve=
nt log?
> E.g. a SVSM configuration, the OVMF hash, etc

Talking with Daniel, it seems that now EDK2 is self-measuring itself
in PCR0, so maybe it would be better to do this in SVSM.
So it would be nice to have SVSM measuring itself in PCR0, SVSM
measuring EDK2 in PCR0, and EDK2 stopping doing it.

Obviously SVSM and EDK2 are already measured by the SNP attestation
report, so it's not a blocking thing for now, since the guest OS can
use that mechanism to measure them.

Thanks for raising these topics!
Stefano

>
> [1]
> https://trustedcomputinggroup.org/wp-content/uploads/PC-Client-Specific-P=
latform-TPM-Profile-for-TPM-2p0-v1p05p_r14_pub.pdf
>
> Thanks,
> Claudio
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
>

