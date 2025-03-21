Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 39DE0465B9
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Mar 2025 10:28:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742549313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpEsOaEzJ2ZHVqUsVJ7c30mVsoqZNgQeHSvlwqEeV2k=;
 b=fWErg7LHLhhuDuw4lrn2v3Xt46j49UYZALI8D54WxHSKmbHcMQ1/ofAaSNDnZX/KZPtQui
 hA/d/VXHO360qEzJTtY9p72iEW5UwzLSA9KcvOjXWTn0Mw53GLdYqtLNr+CHxklMeVvm4W
 UK3f5bupdLaV4f7BijsO8lxJbDttTYA=
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6ef85037f3bso35928467b3.1
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Mar 2025 02:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAGxU2F4DOAhiRd02V0U6So0XV528DAahzJGgQTqFFDuF3j1+xw@mail.gmail.com>
 <Z9xK6ACrFT5PTmrJ@8bytes.org> <Z9xOnKUgQlzhLjBu@redhat.com>
In-Reply-To: <Z9xOnKUgQlzhLjBu@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 21 Mar 2025 10:28:19 +0100
Message-ID: <CAGxU2F4+QSh5afNrywWLQL4hSs7m8Q-FPfsB=wgZ2OrPy7uC_w@mail.gmail.com>
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
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, Gerd Hoffmann <kraxel@redhat.com>, Oliver Steffen <osteffen@redhat.com>

On Thu, 20 Mar 2025 at 18:21, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Mar 20, 2025 at 06:05:44PM +0100, J=C3=B6rg R=C3=B6del wrote:
> > Hi Stefano,
> >
> > On Thu, Mar 20, 2025 at 10:25:38AM +0100, Stefano Garzarella wrote:
> > > the QEMU community has kindly offered to use their GSoC as an umbrell=
a
> > > for ideas regarding SVSM as well, since there are many students
> > > interested in programming in Rust.
> >
> > This is a great opportunity for our SVSM project. I have a few ideas fo=
r
> > projects I am happily be the mentor for those:
>

J=C3=B6rg, thanks for your ideas!

> FWIW, based on QEMU's history in GSoC, the ideas that tend to be
> most successful are those where the scope & tasks is pretty well
> defined head of time. It is good to eliminate uncertainty so that
> the student doesn't get stuck/delayed by community debate over
> design questions. It is also ideal if it is an idea that has
> multiple logical delivery points, such that if they run out of
> time, there is still a partial solution that can usefully come
> out of it, even if the original end goal was missed.

Thank you Daniel for the clarification!

Another thing I was thinking about is that we should provide an
environment for students to use to test/develop the feature.

As long as they can use their laptop, fine, but if special HW is
required, it might be a problem to give them access.

Thanks to Gerd's work, IIUC, native platform support in QEMU could
help us test anything in SVSM that doesn't require interaction with
guest OS or depend on SEV-SNP/TDX capabilities.

>
>
> > 1. Implement proper CPUID Feature Handling Framework for COCONUT
> >
> > * Extend x86-cpuid project to generate Rust code usable by SVSM.
> > * Integrate code into the SVSM and convert existing checks.
> > * Re-work checking for required features.
> > * Bring changes upstream to their respective projects (x86-cpuid and
> >   SVSM).
> > * (Not sure if this is big enough for a GSoC project).
>
> Depends on the student, but it sounds like it fits in the
> theme of being well defined, with staged delivery possible,
> so worth persuing.

Yep, I agree. About my previous point, can this project be done
without SEV-SNP machine?

>
> >
> > 2. Observability Device and Linux Support
> >
> > * Design a protocol for SVSM observability.
> > * Implement SVSM and Linux kernel + user-mode side for getting and
> >   presenting the data.
>
> This sounds quite open ended for GSoC, until the general theme of the
> design is well fleshed out ahead of time, to reduce uncertainty for
> the student.

IIUC this requires a SEV-SNP machine, can someone provide access to it
to a student?

>
> > 3. Encryption and simple File-System Layer for Block Storage device
> >
> > * Title says it all
> > * Maybe good for someone else to mentor as well.
>
> Having implemented LUKSv1 for QEMU myself, I would say block storage
> encryption would be a major project just on its own. At least it is
> well defined, because there's a good spec to target if you just pick
> LUKS. LUKSv2 adds alot more functionality over LUKSv1, but it would
> allow for incremental delivery if the student targets v1, and then
> has the option to incrementally try as much of v2 as they find tiem for.
>
> A filesystem layer would be be worthy project just standalone,
> separate from encryption, too. Scope of it would depend whether
> you're just doing a basic FAT driver, or something more complex,
> or a completely custom design.

This should not require SEV-SNP machine, and we also have Oliver PR in
a good shape to be used as base.
We also have a PoC working with a very minimal FS+encryption, but at
least can be used by the student to understand the final scenario.
In addition, we have OpenVMM to take inspiration from and perhaps
reuse some code.

That said, this is in my ToDo list (after the vTPM driver saga...) so
I don't know whether it makes sense to wait until September to get a
result from a student or to work on it directly.

Thanks,
Stefano

