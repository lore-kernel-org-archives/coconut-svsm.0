Return-Path: <jroedel@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPS id 76CBD466FF
 for <svsm-devel@coconut-svsm.dev>; Fri, 21 Mar 2025 15:42:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742568142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DG3rDOgk8Vk66ff742R6P0hTeQfAJOpoO3/ei9NBbyE=;
 b=iDsgXA7rnzojjMXLrid0t1qvYCHFDsrPbfg+DOTOYJXgNlnQ/hRz5q0RAf1QQwmhn1aqP5
 WKYyqjtUiTgIgXb4X4BCgJlKQnydgKBBQS5ngjCFswS32ZjG8g26QB0svjBchDjYQS5YrU
 hWMMzJoeAsp6j+fOqBK8+rZtup0eylk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742568142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DG3rDOgk8Vk66ff742R6P0hTeQfAJOpoO3/ei9NBbyE=;
 b=2/sweIg9NHb0PCiJFOtSPRoS3hubuO/QqcRS8hkqhE3D4zzJRIZ/5Q4DmD08vGHLx/25zi
 7BReYxWJFecNrRDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742568142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DG3rDOgk8Vk66ff742R6P0hTeQfAJOpoO3/ei9NBbyE=;
 b=iDsgXA7rnzojjMXLrid0t1qvYCHFDsrPbfg+DOTOYJXgNlnQ/hRz5q0RAf1QQwmhn1aqP5
 WKYyqjtUiTgIgXb4X4BCgJlKQnydgKBBQS5ngjCFswS32ZjG8g26QB0svjBchDjYQS5YrU
 hWMMzJoeAsp6j+fOqBK8+rZtup0eylk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742568142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DG3rDOgk8Vk66ff742R6P0hTeQfAJOpoO3/ei9NBbyE=;
 b=2/sweIg9NHb0PCiJFOtSPRoS3hubuO/QqcRS8hkqhE3D4zzJRIZ/5Q4DmD08vGHLx/25zi
 7BReYxWJFecNrRDA==
Date: Fri, 21 Mar 2025 15:42:21 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Message-ID: <Z916zZPeuK8-Fb7m@suse.de>
References: <CAGxU2F4DOAhiRd02V0U6So0XV528DAahzJGgQTqFFDuF3j1+xw@mail.gmail.com>
 <Z9xK6ACrFT5PTmrJ@8bytes.org> <Z9xOnKUgQlzhLjBu@redhat.com>
 <CAGxU2F4+QSh5afNrywWLQL4hSs7m8Q-FPfsB=wgZ2OrPy7uC_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGxU2F4+QSh5afNrywWLQL4hSs7m8Q-FPfsB=wgZ2OrPy7uC_w@mail.gmail.com>
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="utf-8"

Hi Stefano,

On Fri, Mar 21, 2025 at 10:28:19AM +0100, Stefano Garzarella wrote:
> Another thing I was thinking about is that we should provide an
> environment for students to use to test/develop the feature.
> 
> As long as they can use their laptop, fine, but if special HW is
> required, it might be a problem to give them access.
> 
> Thanks to Gerd's work, IIUC, native platform support in QEMU could
> help us test anything in SVSM that doesn't require interaction with
> guest OS or depend on SEV-SNP/TDX capabilities.

Yes, some projects can be worked on without expensive server hardware,
but others not. The observability project is an example which requires
EPYC hardware.

I can ask for some funding via the CCC for that or maybe one of the
hardware vendors is willing to give us access to a machine. Let me ask
around.

> Yep, I agree. About my previous point, can this project be done
> without SEV-SNP machine?

Yes, I think the CPUID handling can be done with the native platform
support.

> IIUC this requires a SEV-SNP machine, can someone provide access to it
> to a student?

Right, as mentioned above, I will ask around and see if we can get this
funded.

> This should not require SEV-SNP machine, and we also have Oliver PR in
> a good shape to be used as base.
> We also have a PoC working with a very minimal FS+encryption, but at
> least can be used by the student to understand the final scenario.
> In addition, we have OpenVMM to take inspiration from and perhaps
> reuse some code.
> 
> That said, this is in my ToDo list (after the vTPM driver saga...) so
> I don't know whether it makes sense to wait until September to get a
> result from a student or to work on it directly.

This should probably be split up anyways, in a task for the file storage
layer and one for the encryption layer. Since you are planning to work
on these topics in the near future maybe you can scope out some parts as
suitable projects for students?

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany
https://www.suse.com/

Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG Nürnberg)
