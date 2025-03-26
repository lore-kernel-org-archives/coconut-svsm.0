Return-Path: <nstange@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 1A61D46D92
 for <svsm-devel@coconut-svsm.dev>; Wed, 26 Mar 2025 15:58:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743001119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVrtowdyE/vUhI8LAedsDNy29EnzwwBu7CYdorYQCnc=;
 b=HQ6xWo/u/h8ocS4ZQY0J/6FYbp3LHTJePB1oc8hbkkIrl6q4saGJuOeC+eNpan6XcTgb9x
 vOBve3Dd5W7LW/QFEOmAij+ejHrynWE1WgJ1hCgZPPxTLwJ2a9+gMvTfens6e5vXe+w/JB
 wkjUN31UVXom38Bc3PRc8bQ1jzznd/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743001119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVrtowdyE/vUhI8LAedsDNy29EnzwwBu7CYdorYQCnc=;
 b=Y6SX468ybnNo0wLkcQpux6sBoAy451mkJ/2FN6rtH8q+edziNmFygzROY4ed/M0gyZZ+5E
 bbVK7G11vwtcqRAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743001119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVrtowdyE/vUhI8LAedsDNy29EnzwwBu7CYdorYQCnc=;
 b=HQ6xWo/u/h8ocS4ZQY0J/6FYbp3LHTJePB1oc8hbkkIrl6q4saGJuOeC+eNpan6XcTgb9x
 vOBve3Dd5W7LW/QFEOmAij+ejHrynWE1WgJ1hCgZPPxTLwJ2a9+gMvTfens6e5vXe+w/JB
 wkjUN31UVXom38Bc3PRc8bQ1jzznd/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743001119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVrtowdyE/vUhI8LAedsDNy29EnzwwBu7CYdorYQCnc=;
 b=Y6SX468ybnNo0wLkcQpux6sBoAy451mkJ/2FN6rtH8q+edziNmFygzROY4ed/M0gyZZ+5E
 bbVK7G11vwtcqRAA==
From: Nicolai Stange <nstange@suse.de>
In-Reply-To: <CAGxU2F4iQYi3zRHJ21yMWQNGpABYdL+6a-Ug1tom8MaUvOMOQQ@mail.gmail.com>
 (Stefano Garzarella's message of "Mon, 24 Mar 2025 12:37:16 +0100")
References: <CAGxU2F4DOAhiRd02V0U6So0XV528DAahzJGgQTqFFDuF3j1+xw@mail.gmail.com>
 <Z9xK6ACrFT5PTmrJ@8bytes.org> <Z9xOnKUgQlzhLjBu@redhat.com>
 <CAGxU2F4+QSh5afNrywWLQL4hSs7m8Q-FPfsB=wgZ2OrPy7uC_w@mail.gmail.com>
 <Z916zZPeuK8-Fb7m@suse.de>
 <CAGxU2F4iQYi3zRHJ21yMWQNGpABYdL+6a-Ug1tom8MaUvOMOQQ@mail.gmail.com>
Date: Wed, 26 Mar 2025 15:58:38 +0100
Message-ID: <87frizon35.fsf@>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, svsm-devel@coconut-svsm.dev

Hi all,

Stefano Garzarella <sgarzare@redhat.com> writes:

> On Fri, 21 Mar 2025 at 15:42, J=C3=B6rg R=C3=B6del <jroedel@suse.de> wrot=
e:
>>
>> > We also have a PoC working with a very minimal FS+encryption, but at
>> > least can be used by the student to understand the final scenario.
>> > In addition, we have OpenVMM to take inspiration from and perhaps
>> > reuse some code.
>> >
>> > That said, this is in my ToDo list (after the vTPM driver saga...) so
>> > I don't know whether it makes sense to wait until September to get a
>> > result from a student or to work on it directly.
>>
>> This should probably be split up anyways, in a task for the file storage
>> layer and one for the encryption layer. Since you are planning to work
>> on these topics in the near future maybe you can scope out some parts as
>> suitable projects for students?
>
> Yes, perhaps it could be split, although I'm seeing that OpenVMM has
> self-contained crates to handle what they called VM Guest State (VMGS)
> file: https://github.com/microsoft/openvmm/tree/main/vm/vmgs
>
> It's a custom FS, with a file table, each file has an ID that
> identifies its type (e.g. TPM_NVRAM) and on top of that they use AES
> 256 GCM for encryption. They also provide a tool for
> manipulation/inspection:
> https://openvmm.dev/guide/dev_guide/dev_tools/vmgstool.html?highlight=3Dv=
tpm#vmgstool
>

I would like to mention at this point that I'm also working on a FS for
quite some time now. The main motivation for developing one from scratch
is to have full Merkle-Tree style authentication over the whole FS,
which I think (hope) would be affordable for the expected image sizes in
the MB range. With that however, a Journal is also desirable, because
otherwise powercuts/crashes in the middle of a write would render the
whole image definitely unreadable.

Anyway, I'm in the last steps of having something working, I expect it
to take ~2-3 more weeks until I can present some code + docs on the
format for discussion.

Thanks!

Nicolai

--=20
SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 N=C3=BC=
rnberg, Germany
GF: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG N=C3=BCrnberg)
