Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id D5D0441F22
 for <svsm-devel@coconut-svsm.dev>; Thu, 13 Feb 2025 10:12:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739437955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hpd6cn3Os/G9hehs6bXs/er3EDTTNqwu3Jq9nyiomNw=;
 b=YUCorjsvTjh2amAbYkAiKmFm6if1PiQvSJ15Ut5zecAULfBtPY6oAfIO+UoW29dHx1gngj
 m87yylJcTNMJTs41vzY5naI0aQnOycDSCyKn2CkF6CwlMGxYV4Bn+pQHxCmhZf5/YJMBH0
 G0ewE0ezsepgplrykEPQPlT8jwWz/7s=
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6f9770b4fdeso7707807b3.0
 for <svsm-devel@coconut-svsm.dev>; Thu, 13 Feb 2025 01:12:33 -0800 (PST)
MIME-Version: 1.0
References: <Z4k5C2bw8El7Yn9S@suse.de>
In-Reply-To: <Z4k5C2bw8El7Yn9S@suse.de>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 13 Feb 2025 10:12:21 +0100
Message-ID: <CAGxU2F5cU7CggPK0e9bnu1=r4mCaOry3cY4tG2FBdBuQw00uqg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] Confidential Computing MC-like workshop in May?
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, amd-sev-snp@lists.suse.com, mathieu.poirier@linaro.org, Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>, leonardo.garcia@linaro.org, thomas.fossati@linaro.org

Hi J=C3=B6rg,

On Thu, 16 Jan 2025 at 17:51, J=C3=B6rg R=C3=B6del <jroedel@suse.de> wrote:
>
> Hello everyone,
>
> I hope you had a great start into 2025 and return refreshed for more
> exciting confidential computing work :)
>
> Our last get-together as the confidential computing community was in
> September last year and this years LPC is far away in December. So there
> is the idea to have another in-person/hybrid event earlier in May,
> alongside Linaro Connect 2025 (May 14th-16th, 2025) in Lisbon.
>
> Lorenzo (on Cc) reached out to ask if there is interest and enough
> expected attendace at such an event? I personally see quite some value
> in another in-person event before December.
>
> Please let us know what you think and whether you would attend such an
> event, either in-person or remotely.

I'm not sure if I can attend Linaro Connect in person this year, but
for sure I can do remotely.

Another option might be, like 2 years ago, to take advantage of the
KVM Forum where many of us attend.
It was announced a few weeks ago that the next KVM Forum will be in
Milan (Italy) on September 4 and 5 [1], so that could be another
opportunity.

Of course, one does not exclude the other ;-)

Thanks,
Stefano

[1] https://lore.kernel.org/all/ea6e5059-85d1-4503-99d4-635272b9b32b@linux.=
ibm.com/

