Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104D71A294
	for <coconut-svsm@lists.linux.dev>; Mon,  9 Feb 2026 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633150; cv=none; b=Tr5fhh/qUNnC2jvuEcpAdDvUXWr16VQs/oUBBQ184zfgsQbs+lKQukPJ3UX48wMha+WQ3eZkJUf3xCNsupWn6DnIIRvsi3tJ4Jw4LJ5nBShLJ4cUeWdyvorlzN373x6cv1cJ4MwzrbVv6hiAFwhBPokkK9Vh2QJSWNO9HcbWvEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633150; c=relaxed/simple;
	bh=qfDuH/IQSlEZAL16cHWOoxd6wFvVIFelgum6ljCOeP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evAvGDcmKVr65PB6Flagm+LHY2DA0ZuN5WdZ3HDs3Q66GRmplyvMN+eAytJimy/YAXj5KaM/tvgUa18LLgVVE22q6eCuSOL4IMQ5Q//ZMz99WhmDDT2jSyQUy7djq8jD3alKqlOalarQwWwVCjCkaj9ANq9x2joLxkIuZk3onYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DRHzW8iy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DRHzW8iy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770633149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5icZCCs7od5TerYxnPQDm5LEgMvWj+c+TVSeapm0rI=;
	b=DRHzW8iy4KJgl9Eb0xkmf6nPPyidKheQZXpLekzJ4kyCPWOkpp+jOF8RHmL3nNolWxgYMj
	PeERKOoAYaduWlyBlDLLeVUnWlxGWodlpgmHdM8QYhk+vnRooqaPTZam464D3woGCmu2yx
	ra5ZTgPyLQ0tKpSOu0A6QImvVClMfbQ=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-wgIwkg3GO7u15-UHug5jxw-1; Mon, 09 Feb 2026 05:32:25 -0500
X-MC-Unique: wgIwkg3GO7u15-UHug5jxw-1
X-Mimecast-MFC-AGG-ID: wgIwkg3GO7u15-UHug5jxw_1770633145
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-649e57fd648so5310805d50.3
        for <coconut-svsm@lists.linux.dev>; Mon, 09 Feb 2026 02:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633145; x=1771237945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p5icZCCs7od5TerYxnPQDm5LEgMvWj+c+TVSeapm0rI=;
        b=SNFsu45GOvrfamwSkx/zw/MwzDEf4HPbv5b/ZtxvSv+Y/VW5FNn8itig/aHigD1cuI
         0gxjpRL7eSR9kXujh/gDAQXk392LDOakryRS3DLyFT4jrj4dJ9AxVow18Jc09I9eW2ek
         tHyszaGSS6z2txmHPOGw0uZCfGn3CnKQ+cAr9kfZLBLjgrHH//w3I4rP5EIkbHuT+Mh5
         svBHmHv1zudyzl0SkxWSSxGO1O4YEOg1QB6fgubpLwDVlydkJgHMZnccL3Aey/MewaKu
         xCRMIBvtilWzkoLNwMbYgHlNOodhxNj9fGC/YGNJJhyEPVd5l9+/ecTzwQ70Wvo1HwVU
         2MCA==
X-Gm-Message-State: AOJu0YxiY9M68NvEAIFiNluG6pIxf43K990M5nMpg3jY+XZGiipK1H45
	8XBhU9KF7Hb5skkZGL95pUdhF20ryuil9cZu61yXzzyZvAzZ8xlJFfu58rEkymSGAIXLYZ76ZIy
	4Y9H8ZjE0uVJ2VOd3GY53d7OJ5DCcrfn516Yrv7joVa2Pko0vteqbkcv/QVh/ytt/Bew95OXWvi
	UMycR8YuQTHWfS45jcXy/4eaFU8gq0djG/r1N5UG0P
X-Gm-Gg: AZuq6aJs5ZjBmPfvFBXYZr6JuALixpu0/sovuxtfbjk7ctTIPmCRx3ArUxphjO2tRYU
	dI8/ho0dLrqfIddOxsh1mdEjq8Wpj31xF4Mvr131UX/EbSAtTVJyR3NzCkRRhmHJkk724CbTcZL
	vZRHGBgkeO1kqDIxxl93RyeR19N0wkd/0mSgrBzhzhbsSh6g0RPuHbbM37NkYtEKBdutvuBzhFD
	vupJe8HujNRgiptZW4e+tlOCw==
X-Received: by 2002:a05:690c:f14:b0:796:38b2:7430 with SMTP id 00721157ae682-79638b2b6eemr101488777b3.17.1770633144979;
        Mon, 09 Feb 2026 02:32:24 -0800 (PST)
X-Received: by 2002:a05:690c:f14:b0:796:38b2:7430 with SMTP id
 00721157ae682-79638b2b6eemr101488467b3.17.1770633144578; Mon, 09 Feb 2026
 02:32:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+bRGFrHnTCTYAR0UjG2vC+AtrJAU2Uy8G_MzVZfOELh11dxsg@mail.gmail.com>
 <7f1f445f-7171-4375-910a-1ad4eefbcf85@suse.de>
In-Reply-To: <7f1f445f-7171-4375-910a-1ad4eefbcf85@suse.de>
From: Oliver Steffen <osteffen@redhat.com>
Date: Mon, 9 Feb 2026 11:32:13 +0100
X-Gm-Features: AZwV_QgHFGh9ycLJj43CX3doshjmktQynRvN9sBD8TjTDW6CfRNviSSGYYVKEZY
Message-ID: <CA+bRGFrprcZY_0qGjm814NPSc1wSbGdVqSH5K9JZJY6wZeb2nA@mail.gmail.com>
Subject: Re: KVM planes branches
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Cc: coconut-svsm@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Luigi Leonardi <leonardi@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 07VVFGy1lJdlqlJuyNZ9D8dEQErlhoPOLe8jaGgvszo_1770633145
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 12:22=E2=80=AFPM Carlos L=C3=B3pez <clopez@suse.de>=
 wrote:
>
> Hi,
>
> On 1/7/26 3:02 PM, Oliver Steffen wrote:
> > Hi everyone,
> > happy new year!
> >
> > I am curious about the state of the KVM planes effort and want
> > to experiment with it a bit.
> > I tried out the KVM planes branches we have in our GitHub org.
> > I built Qemu and the host kernel from there and I am able to launch
> > the current SVSM with that. QEMU just needed the patch for MADT-via-IGV=
M.
> > But the OVMF does not seem to start. All I see is
> >
> > ...
> > [SVSM] VTPM: TPM 2.0 Reference Implementation initialized
> > [SVSM] [CPU 0] Virtual memory pages used: 0 * 4K, 0 * 2M
> > [SVSM] VMSA PA: 0x8000f49000
> > [SVSM] Launching Firmware
> > [init] COCONUT-SVSM init process starting
> > [SVSM] Terminating task init, exit_code 0
> > [SVSM] Launching request-processing task on CPU 1
> > [SVSM] Launching request-processing task on CPU 2
> > [SVSM] Launching request-processing task on CPU 0
> > [SVSM] Launching request-processing task on CPU 3
> >
> > and then it seems to hang forever.
> > Is that expected? Do I need a specific commit of SVSM or EDK2?
>
> I managed to track down the issue to an infinite loop within KVM. Please
> try the following fix:
>
>     https://github.com/coconut-svsm/linux/pull/19
>
> In my environment this allows edk2 to make progress and reach the grub
> menu. As mentioned in a previous email, you will need to revert
> 539624271cb8 ("sev: require the debug register virtualization feature")
> temporarily in the SVSM.

Finally got around to try your PR. I am able to boot a Fedora 43 guest
through grub
into Linux, but it then hangs early:

[...]
[    0.000000] Linux version 6.17.1-300.fc43.x86_64
(mockbuild@5381c258a4b3436489a448ea66bda8ce) (gcc (GCC) 15.2.1
20250924 (Red Hat 15.2.1-2), GNU ld version 2.45-1.fc43) #1 SMP
PREEMPT_DYNAMIC Mon Oct  6 15:37:21 UTC 2025
[    0.000000] Command line:
BOOT_IMAGE=3D(hd0,gpt3)/vmlinuz-6.17.1-300.fc43.x86_64 no_timer_check
console=3Dtty1 console=3DttyS0,115200n8 systemd.firstboot=3Doff
root=3DUUID=3D55773572-92c8-4d7e-bafd-3f4943a2f380 rootflags=3Dsubvol=3Droo=
t
[...]
[    1.650687] printk: legacy console [tty1] enabled
[1.651019] printk: legacy console [ttyS0] enabled
[    2.039270] ACPI: Core revision 20250404
[    2.079399] clocksource: hpet: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604467 ns
[    2.086852] APIC: Switch to symmetric I/O mode setup
[    2.088986] x2apic enabled
[    2.090394] APIC: Switched APIC routing to: physical x2apic
[    2.111585] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    2.113704] clocksource: tsc-
<hangs>

I added in https://github.com/coconut-svsm/linux/pull/18, same result.
Any ideas on what else to try?

Thanks!
 Oliver
>
> Best,
> Carlos
>

