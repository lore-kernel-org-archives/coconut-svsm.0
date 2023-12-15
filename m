Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id DE3901A735D
 for <svsm-devel@coconut-svsm.dev>; Fri, 15 Dec 2023 11:59:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702637963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tq6GnmjiA2SVBIMktg/LAulIk0M9fbmCI5Q1H9mK4fM=;
 b=YHZNt4sJqhrgLOFmrCUNU9kHNgT819HQN7rnSAlVuj14/Gc1MQcgwYAdnUFMLjTTmetBer
 +LywYAbVxfZDax0HwClVNrdjhIyHCrdTg7YrvYBXbJy7fUNdrfJqqHC4Q7YiZN3byv2OzW
 GES/MW2vNNp2olNkBjP3bd3JJ8ZIhQk=
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-5e03f0ede64so5524587b3.0
 for <svsm-devel@coconut-svsm.dev>; Fri, 15 Dec 2023 02:59:22 -0800 (PST)
MIME-Version: 1.0
References: <7F00DB2D-7BB2-4E2C-95D7-7C48C622AED4@8bytes.org>
In-Reply-To: <7F00DB2D-7BB2-4E2C-95D7-7C48C622AED4@8bytes.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 15 Dec 2023 11:59:09 +0100
Message-ID: <CAGxU2F6E35cBMSBo81u+qr7WGWGiLmi+3de_w5=zJOA_9cPToA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] CCC TAC acceptance of COCONUT-SVSM
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev

On Thu, Dec 14, 2023 at 8:16=E2=80=AFPM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> Hey,
>
> As mentioned yesterday in our call, I presented the SVSM project submissi=
on today in the TAC meeting and there were no major objections, so the CCC =
drove it to a vote.
>
> I am happy to announce that the TAC uniformly voted to accept the COCONUT=
-SVSM project!

Great news, thanks for the effort!

>
> There are some more steps necessary within the CCC (Legal review and boar=
d vote), but what happened today is already a bit step forward to make the =
COCONUT-SVSM an official CCC project.

If some help is required, just ask ;-)

Stefano

