Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37F236214C
	for <coconut-svsm@lists.linux.dev>; Tue, 27 Jan 2026 17:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533622; cv=none; b=en/1yaBnNF3Wdw6EUQ9c3IOhJ2Og1FbdTN1mKPCyIRLUx9s5RuGqIokfBDLoBSsm0wxdgb0KFAqwoPwgreD3SM5MX6PhYkkjBrO1AuDa/uj5VyvTJ5c/up8q1Pv2s5N42Tqo6FGfMeoGUZnqGnoJM1HPV7YG7G8r59AiIQgFrLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533622; c=relaxed/simple;
	bh=tlwjHSarT1Mqhef+1BKU4INaA/tED5J7oqYJ1OVsUn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9MG63+2e/4LolQFEMzDrVd3gTo4L3k7XFKObgpokQh2dAaIShyMgGlJqF4WRxrIuavtAEXYwC1k2DHDh7W2Hc5u5fd+FsRkzo5scGjdyLptWANtJYDPGU3+BQbsT0Fnp7MwvdgDGeuDbKe5VIjYsmU+9oo1xHW1UW39of/K33M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K68HgsmC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K68HgsmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769533618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tlwjHSarT1Mqhef+1BKU4INaA/tED5J7oqYJ1OVsUn8=;
	b=K68HgsmCqy1GMsaDW/Ga9+dJuExuYYM6W0EsOBNHgl+JxTIEcSOYH0RZvMBeCPlBGF12l7
	NMFKS8ac8SD4qc0ZbvkNLxWrFhzDmMZkwnpbgGNXw/DFHvw51QolzPsWdv+gsCYfN3RXUI
	EhpGTRAr5wJiL23yeyx9XJN0lfhxLpE=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-brSyowthMvu-HOpB7LOrcw-1; Tue, 27 Jan 2026 12:06:57 -0500
X-MC-Unique: brSyowthMvu-HOpB7LOrcw-1
X-Mimecast-MFC-AGG-ID: brSyowthMvu-HOpB7LOrcw_1769533616
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2381ea85so123484665ad.0
        for <coconut-svsm@lists.linux.dev>; Tue, 27 Jan 2026 09:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769533616; x=1770138416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlwjHSarT1Mqhef+1BKU4INaA/tED5J7oqYJ1OVsUn8=;
        b=EeQAI5r9jw9WZa4mYzfh5uP7hq++uwMMInMX74iGMSycrTAaI8wm+gzNf+5aZCWmuA
         RUbsykrABGwMNv0Hqle7OaSV7bQY5bH7ppD3FHfwADTgHm2O5YFCJaov93MJUu5iVGzR
         LG7/IxQP67m/TcAhx7/GV1mKI22gVUdfXWS+gx9iDdFHrhnchWv2FuoTBdBTUjUiz+cI
         vSGqMrcSKUVaSYPSSfavQcxgVvktXVqrqQxScOKKovdekkGZ2P2AiFGOkpy0Cb2UNlXB
         kUkGUOLGDLw6JCtJrGBxgCsnNAD8sdjNT3WjHFXGMndWd5/U6qg0Do2xGG4oMvnvQQah
         IOfA==
X-Gm-Message-State: AOJu0YzBLp7OxwgqsVnPNWcH+/kPdOHfySOc/QWfCJ1geUTqW28QDceN
	TdijAmLWsd/cRQKfaY9k14zk+/GJSABrHilKpUiZJUMHuKweZU8sgHFryiYz0t5p94GLtbdrZ0T
	8tWVkFGV9sQcutQfVfH6w6T0+uAbZS05lkFOPxiKPU/4wfsXGCxg2xPQawk79mLiis8XKU9CVR6
	lq3ZMmXRg9nV2hJQoUj0ZeR41YeOY7jR4aP8SW7rod
X-Gm-Gg: AZuq6aLQhPnRKgFkQ2Z2S2BB6VUeVqcWeP13r/YwwONwhx4T9rVY2k103RhtoFZY38L
	e4ix5hI0QiomB+Z7plyI0+u+T0M3xlPouBS4JGIY4yGRWm9Sbp3KeO5xawf8LnZGudHzUZDRDhM
	EP4bGhpxNjjfjQKsxnSlzb9NVAybW760DzJnYSZtENeM7ZtDDgVDtQeZt+kYQ1WNC6
X-Received: by 2002:a17:903:2f87:b0:2a7:a6fa:ede4 with SMTP id d9443c01a7336-2a870de244amr22526245ad.48.1769533615898;
        Tue, 27 Jan 2026 09:06:55 -0800 (PST)
X-Received: by 2002:a17:903:2f87:b0:2a7:a6fa:ede4 with SMTP id
 d9443c01a7336-2a870de244amr22526045ad.48.1769533615330; Tue, 27 Jan 2026
 09:06:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F6xrPvgoD1+i-S_7Snj3zfZ0iCLXfc7JBf8mZPZi+GMLQ@mail.gmail.com>
 <6146dc59fed504a84db645cde56c3b85082aff0f.camel@HansenPartnership.com>
In-Reply-To: <6146dc59fed504a84db645cde56c3b85082aff0f.camel@HansenPartnership.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 27 Jan 2026 18:06:44 +0100
X-Gm-Features: AZwV_QhmUwRVPx5eez2ZX691kPEbvUsojgNcxyHvW2y1BNuja0lW_t1cKtm8KP0
Message-ID: <CAGxU2F7244j9n6jBa-34vNjrLJvNhiP81-Wzv9L-C=dGw4bZDA@mail.gmail.com>
Subject: Re: TCG TPM license issue
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: coconut-svsm@lists.linux.dev, Daniel Berrange <berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JzJsR4o1j0wJ6uWqvBu56-IkYuJdF_i7g0_f2no2V24_1769533616
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jan 2026 at 20:15, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Fri, 2026-01-23 at 11:02 +0100, Stefano Garzarella wrote:
> > Hi all,
> > it seems the license of the TCG TPM reference implementation that we
> > are using to emulate the vTPM in SVSM is not exactly BSD but a
> > variant of it.
> >
> > For some distro, like Fedora, this could be an issue. See
> > https://gitlab.com/fedora/legal/fedora-license-data/-/issues/716
>
> The problem clause is a conditional statement about the origin of the
> code and not part of the licence, so I don't believe it modifies the
> BSD-2-Clause nature of the implementation in any way.
>
> Additionally, just in the interest of fair dealing Fedora can't
> disapprove of this this disclaimer in coconut, but perfectly fine with
> it in another project they're already shipping:
>
> https://packages.fedoraproject.org/pkgs/libtpms/libtpms/index.html
>
> which has a slightly different form of the disclaimer (inherited
> directly from the TCG) which seems to be a bit stronger in terms of
> modifying the licence:
>
> https://github.com/stefanberger/libtpms/blob/master/LICENSE
>
> ---
> THE COPYRIGHT LICENSES SET FORTH ABOVE DO NOT REPRESENT ANY FORM OF
> LICENSE OR WAIVER, EXPRESS OR IMPLIED, BY ESTOPPEL OR OTHERWISE, WITH
> RESPECT TO PATENT RIGHTS HELD BY TCG MEMBERS (OR OTHER THIRD PARTIES)
> THAT MAY BE NECESSARY TO IMPLEMENT THIS SPECIFICATION OR
> OTHERWISE. Contact TCG Administration
> (admin@trustedcomputinggroup.org) for information on specification
> licensing rights available through TCG membership agreements.
> ---
>
> However, I did ask and got word that apparently the TCG has already
> modified its copyright IP policy not to require the patent disclaimer
> in the code, so it's going to remove the language from the TPM
> repository anyway.

So basically, the next TCG TPM version should have a LICENSE file with
only BSD-2-Clause, right?

That should solve the problem I guess.

> I'm guessing that would mean the same problematic
> clause can be removed from libtpms but you'll need to take that up with
> upstream.

Yeah, I'll do.

Thanks,
Stefano

