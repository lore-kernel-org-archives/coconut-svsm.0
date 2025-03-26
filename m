Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id E80C5469F5
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Mar 2025 16:39:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743003540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+pnYuXII1IIkCF/cSrhDCeDyeU4hFUGIigC/QN3Iu4=;
 b=QK5TP5bGtQI6OS5niCW5J9t7lDlmKlkUj23CSy3+e5sMskOVrFgdv+f4QccbkfsDTdIk10
 l8C13Qqk5PeXeP8jjNtwjrI4WPN1/XeZ8KiqZGkUNDfxZodQDmqYqR3vYNmNrS1DIqJyf7
 cEZhSoGp0OCHxkFdetoBj8S0ZwOR8Bw=
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-e549b6c54a0so5530276.3
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Mar 2025 08:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAGxU2F4DOAhiRd02V0U6So0XV528DAahzJGgQTqFFDuF3j1+xw@mail.gmail.com>
 <Z9xK6ACrFT5PTmrJ@8bytes.org> <Z9xOnKUgQlzhLjBu@redhat.com>
 <CAGxU2F4+QSh5afNrywWLQL4hSs7m8Q-FPfsB=wgZ2OrPy7uC_w@mail.gmail.com>
 <Z916zZPeuK8-Fb7m@suse.de>
 <CAGxU2F4iQYi3zRHJ21yMWQNGpABYdL+6a-Ug1tom8MaUvOMOQQ@mail.gmail.com>
 <31562.125032611045400525@us-mta-107.us.mimecast.lan>
In-Reply-To: <31562.125032611045400525@us-mta-107.us.mimecast.lan>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 26 Mar 2025 16:38:46 +0100
Message-ID: <CAGxU2F6n-EQBDag33DUoVWptTxOc4MrDp=_QTXhqft0SP7SM1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] Call for mentors/ideas for Google Summer of Code
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Nicolai Stange <nstange@suse.de>
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, svsm-devel@coconut-svsm.dev

Hi Nicolai,

On Wed, 26 Mar 2025 at 16:04, Nicolai Stange <nstange@suse.de> wrote:
>
> Hi all,
>
> Stefano Garzarella <sgarzare@redhat.com> writes:
>
> > On Fri, 21 Mar 2025 at 15:42, J=C3=B6rg R=C3=B6del <jroedel@suse.de> wr=
ote:
> >>
> >> > We also have a PoC working with a very minimal FS+encryption, but at
> >> > least can be used by the student to understand the final scenario.
> >> > In addition, we have OpenVMM to take inspiration from and perhaps
> >> > reuse some code.
> >> >
> >> > That said, this is in my ToDo list (after the vTPM driver saga...) s=
o
> >> > I don't know whether it makes sense to wait until September to get a
> >> > result from a student or to work on it directly.
> >>
> >> This should probably be split up anyways, in a task for the file stora=
ge
> >> layer and one for the encryption layer. Since you are planning to work
> >> on these topics in the near future maybe you can scope out some parts =
as
> >> suitable projects for students?
> >
> > Yes, perhaps it could be split, although I'm seeing that OpenVMM has
> > self-contained crates to handle what they called VM Guest State (VMGS)
> > file: https://github.com/microsoft/openvmm/tree/main/vm/vmgs
> >
> > It's a custom FS, with a file table, each file has an ID that
> > identifies its type (e.g. TPM_NVRAM) and on top of that they use AES
> > 256 GCM for encryption. They also provide a tool for
> > manipulation/inspection:
> > https://openvmm.dev/guide/dev_guide/dev_tools/vmgstool.html?highlight=
=3Dvtpm#vmgstool
> >
>
> I would like to mention at this point that I'm also working on a FS for
> quite some time now. The main motivation for developing one from scratch
> is to have full Merkle-Tree style authentication over the whole FS,

Cool! Thanks for sharing!

> which I think (hope) would be affordable for the expected image sizes in
> the MB range. With that however, a Journal is also desirable, because
> otherwise powercuts/crashes in the middle of a write would render the
> whole image definitely unreadable.

Yes, definitely!

>
> Anyway, I'm in the last steps of having something working, I expect it
> to take ~2-3 more weeks until I can present some code + docs on the
> format for discussion.

Okay, I'll keep playing with VMGS so we can compare when you have
something ready!

Thanks,
Stefano

