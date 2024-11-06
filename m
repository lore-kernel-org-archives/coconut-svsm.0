Return-Path: <dionnaglaze@google.com>
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 6DA9F2A9A50
 for <svsm-devel@coconut-svsm.dev>; Wed,  6 Nov 2024 16:37:38 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9a68480164so1024530666b.3
 for <svsm-devel@coconut-svsm.dev>; Wed, 06 Nov 2024 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730907458; x=1731512258; darn=coconut-svsm.dev;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lkG/5eSxc4y2RC1ugCAu2baGF/KL8ZKVW9WI2LqNZVE=;
 b=kRSqao7RxQcTmBzOAgMnLN5Nc8FGjrKKu/ozh8yfR3gz39VpPRjF7+bhfz+dcNc1bN
 s4zctrqwSBZ/khiyoaV2YVmnEK8epM9WO71nly/PdCUCb9+R4Z+gjOhnddJZIFZIrqcv
 cJlN8hxuV+B6Uzro/62V9ONRXDzPYojmM/wZxbOE4NqloxZj5KBGrRoRe3bRoQc/09TQ
 FYnJOyuh+qF1Zn/UDHs1KkU3MtyZ8K072JPOocN+8qepQxgg/J8MbSiUH3wPI07ckGYR
 O6d+tUybgMDQo6ihXFRMWeEHnGUlONdsl1BqoiZGh5EKr6UjSM649JzjPAz11nAYF5XF
 oA8Q==
MIME-Version: 1.0
References: <Zynjpg7NdAj8sePr@8bytes.org>
 <6oovlpaoy5pggj3pr4tk5fgj6ao3zjvcj4rqbvknfz4rxif4gd@rkpghtonrgn6>
 <ZypD1pGNxRXFjZxS@suse.de>
 <CAAH4kHbjYOPhUgqHtYUEx-5Z9jfH-Dd_r8xi5EaON2P9+nz6=w@mail.gmail.com>
 <oldkqlccn3psltlxzqyh2kj6gokuif5z5likmnbtzbl7voljzw@3s2dktl3otwk>
In-Reply-To: <oldkqlccn3psltlxzqyh2kj6gokuif5z5likmnbtzbl7voljzw@3s2dktl3otwk>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 6 Nov 2024 07:37:24 -0800
Message-ID: <CAAH4kHZKXh2VJPPZ+DhMU8jRxk6MetSuiEVMo5fcO3ap1_CR-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [svsm-devel] [RFC] COCONUT-SVSM Release Process
List-Id: COCONUT-SVSM development list <svsm-devel.coconut-svsm.dev>
List-Unsubscribe: <https://mail.8bytes.org/cgi-bin/mailman/options/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=unsubscribe>
List-Archive: <http://mail.8bytes.org/pipermail/svsm-devel/>
List-Post: <mailto:svsm-devel@coconut-svsm.dev>
List-Help: <mailto:svsm-devel-request@coconut-svsm.dev?subject=help>
List-Subscribe: <https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel>, 
 <mailto:svsm-devel-request@coconut-svsm.dev?subject=subscribe>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, svsm-devel@coconut-svsm.dev

On Wed, Nov 6, 2024 at 12:30=E2=80=AFAM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Tue, Nov 05, 2024 at 08:20:03AM -0800, Dionna Amalie Glaze wrote:
> >On Tue, Nov 5, 2024 at 8:12=E2=80=AFAM J=C3=B6rg R=C3=B6del <jroedel@sus=
e.de> wrote:
> >>
> >> Hi Stefano,
> >>
> >> On Tue, Nov 05, 2024 at 12:23:42PM +0100, Stefano Garzarella wrote:
> >> > My concern is having two types of release in the same month, e.g.
> >> > R2025.03 and D2025.03.
> >> >
> >> > How do we know which one happened sooner or later?
> >>
> >> Stable releases are branched off at least 4 weeks before they are
> >> tagged, so it is safe to assume that, given a development and stable
> >> release in the same month, the development release will be based on a
> >> more recent code base.
> >>
> >> The stable and development releases also target different groups of
> >> users, so I wonder why it is important to know which release happened
> >> first?
> >>
> >> > Or do we never expect to have a stable release and a development
> >> > release in the same month?
> >>
> >> Stable an development releases in the same month are allowed, I do not
> >> want to forbid that.
> >>
> >> > I'm not sure if using YYYY.NN is better, where NN is a counter share=
d
> >> > among all release types (D or R).
> >>
> >> I'd like to avoid sharing counters between development and stable
> >> releases. This would indicate a relationship between these release typ=
es
> >> that does not exist. Each release type targets a different
> >> audience/use-case.
> >>
> >> > Another option is to increase the counter only for a stable release
> >> > (or use the month in this case), and for development releases, add a
> >> > few digits of the SHA-1 of the commit, something like this:
> >> >
> >> > R2025.03
> >> > D2025.03-g9ec10216
> >> > D2025.03-g5f4987a1
> >> > D2025.03-gbb6e9222
> >> > R2025.04
> >>
> >> This might turn version comparisions for package managers into a real
> >> nightmare. If we include the sha1 of the top-commit, we still need a
> >> growing number to ensure version string ordering.
> >>
> >
> >A scheme we use has been YYYY-MM[-DD][-profile][-rcX]
> >The profile marker is to allow for different build profiles from the sam=
e trunk.
> >I don't think that releases from a SHA1 hash make sense, since I would
> >always presume that cutting a release tag means creating a branch upon
> >which to cherry-pick fixes. Cherry-picking on top of the named SHA1
>
> I proposed the SHA1 just for development release which from the
> description are simply a snapshot of the main branch, so no
> cherry-picking should be done for those releases.
>

This seems like a nightly situation, no?
I don't know how GitHub manages different release streams. We might
want to have an svsm-nightly mirror repo that has its own releases to
not drown out the other releases on the tab.

> >hash changes the head hash and kind of ruins it.
> >If you want D to mean unstable features but are not broken outright,
> >I'd say to call it the unstable profile. That way you make sure to
> >track experimental/unstable additions behind features that you can
> >later promote to stable.
> >
> >I wouldn't worry too much about creating multiple canonical profiles
> >at this point though.
>
> Yep, multiple profiles can work.
>
> Thanks,
> Stefano
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
