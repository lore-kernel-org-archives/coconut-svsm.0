Return-Path: <sgarzare@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 88BAB46874
 for <svsm-devel@coconut-svsm.dev>; Mon, 24 Mar 2025 12:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742816249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NJ2mH6p6L6BekTmBEutVYxcThvD35vuBq7vDKPRUjU=;
 b=A33dKE6sgJNIdJPSGdS5/LyeFZbkUNCnIfM4KfeClDlAdqvNI8qxxeu6/N2BSZgpY19KW8
 Jv/AvCgtwePRWhi2BTQ5zlf40KU430Y+7jYOyV+XJe3N38pLFvEdKAGhqH+PVu12O4xOB2
 BlpnqipcWLEt+IbL00g/P5QtgPbmM7k=
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6f2c7008c05so55571297b3.0
 for <svsm-devel@coconut-svsm.dev>; Mon, 24 Mar 2025 04:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAGxU2F4DOAhiRd02V0U6So0XV528DAahzJGgQTqFFDuF3j1+xw@mail.gmail.com>
 <Z9xK6ACrFT5PTmrJ@8bytes.org> <Z9xOnKUgQlzhLjBu@redhat.com>
 <CAGxU2F4+QSh5afNrywWLQL4hSs7m8Q-FPfsB=wgZ2OrPy7uC_w@mail.gmail.com>
 <Z916zZPeuK8-Fb7m@suse.de>
In-Reply-To: <Z916zZPeuK8-Fb7m@suse.de>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 24 Mar 2025 12:37:16 +0100
Message-ID: <CAGxU2F4iQYi3zRHJ21yMWQNGpABYdL+6a-Ug1tom8MaUvOMOQQ@mail.gmail.com>
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
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, svsm-devel@coconut-svsm.dev

On Fri, 21 Mar 2025 at 15:42, J=C3=B6rg R=C3=B6del <jroedel@suse.de> wrote:
>
> Hi Stefano,
>
> On Fri, Mar 21, 2025 at 10:28:19AM +0100, Stefano Garzarella wrote:
> > Another thing I was thinking about is that we should provide an
> > environment for students to use to test/develop the feature.
> >
> > As long as they can use their laptop, fine, but if special HW is
> > required, it might be a problem to give them access.
> >
> > Thanks to Gerd's work, IIUC, native platform support in QEMU could
> > help us test anything in SVSM that doesn't require interaction with
> > guest OS or depend on SEV-SNP/TDX capabilities.
>
> Yes, some projects can be worked on without expensive server hardware,
> but others not. The observability project is an example which requires
> EPYC hardware.
>
> I can ask for some funding via the CCC for that or maybe one of the
> hardware vendors is willing to give us access to a machine. Let me ask
> around.

Cool, that would help!

>
> > Yep, I agree. About my previous point, can this project be done
> > without SEV-SNP machine?
>
> Yes, I think the CPUID handling can be done with the native platform
> support.
>
> > IIUC this requires a SEV-SNP machine, can someone provide access to it
> > to a student?
>
> Right, as mentioned above, I will ask around and see if we can get this
> funded.
>
> > This should not require SEV-SNP machine, and we also have Oliver PR in
> > a good shape to be used as base.
> > We also have a PoC working with a very minimal FS+encryption, but at
> > least can be used by the student to understand the final scenario.
> > In addition, we have OpenVMM to take inspiration from and perhaps
> > reuse some code.
> >
> > That said, this is in my ToDo list (after the vTPM driver saga...) so
> > I don't know whether it makes sense to wait until September to get a
> > result from a student or to work on it directly.
>
> This should probably be split up anyways, in a task for the file storage
> layer and one for the encryption layer. Since you are planning to work
> on these topics in the near future maybe you can scope out some parts as
> suitable projects for students?

Yes, perhaps it could be split, although I'm seeing that OpenVMM has
self-contained crates to handle what they called VM Guest State (VMGS)
file: https://github.com/microsoft/openvmm/tree/main/vm/vmgs

It's a custom FS, with a file table, each file has an ID that
identifies its type (e.g. TPM_NVRAM) and on top of that they use AES
256 GCM for encryption. They also provide a tool for
manipulation/inspection:
https://openvmm.dev/guide/dev_guide/dev_tools/vmgstool.html?highlight=3Dvtp=
m#vmgstool

That said, I don't think I'll be able by today to figure out if that's
the right way or better something else :-(
I'd like to reuse something instead of re-inventing the wheel.

Thanks,
Stefano

