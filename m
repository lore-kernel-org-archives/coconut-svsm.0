Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43D0239E6C
	for <coconut-svsm@lists.linux.dev>; Fri, 23 Jan 2026 22:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769206016; cv=none; b=LO2Vms/NFia8qjMgAs7Zwa4BORuixPsGiVnr8Tkg7dOZP5WRKjQ/CLheCqDdpd/XTjCRrLYa27kqLHIP+juv/Lkp/10QevJVXCitXG5eNaXbjszfxwp2vyYG883LOzt3QhtwHb/kjEZlJVOT9lgcqa/V4Y370xpnnk6dBZVFl7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769206016; c=relaxed/simple;
	bh=sNIc6y0zDE+YZgHIkZDT390zYhm55KRgw1pEF5vYSnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GMo+5DsYi6pLQSMd18m/FRJz4F1hqt7q3BSfINfmTAOnZKFHAcW0kC3xHj1v83fGQlEvfh62BelJPd2ra1mZWXBiPmZjvMhcD5RWs6DvvAuFoGyp7nNklcjIdvUqrWssKGyfwhlE3EJyn1532NYmWTNGamneXGlc5sCMoILYfg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hbAYpAvU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hbAYpAvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769206013;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=xQRks8B2EyEqTavx8X6CQLz+4RfVfxeqHD+qzpXCNmY=;
	b=hbAYpAvURdx+Mv3E98kZyhZMI8moYjYd+EoLKdLJN1aFYWbYDDIkPOdy36xYo4Zwm4W36o
	j9tlHTNVZ3g1V9hVu8obM/z9HQQihdWgvjF61iSLLdJq2OAdfXeGjZmKStXhMTvhMCrLBJ
	GDX7PmJ8af5aTQQyi7RMSPGXj7mjxWA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-MEd664O5NZ2KGSQ7eOubyg-1; Fri,
 23 Jan 2026 17:06:52 -0500
X-MC-Unique: MEd664O5NZ2KGSQ7eOubyg-1
X-Mimecast-MFC-AGG-ID: MEd664O5NZ2KGSQ7eOubyg_1769206011
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0C8631800378;
	Fri, 23 Jan 2026 22:06:51 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.31])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA19F1800665;
	Fri, 23 Jan 2026 22:06:49 +0000 (UTC)
Date: Fri, 23 Jan 2026 22:06:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, coconut-svsm@lists.linux.dev
Subject: Re: TCG TPM license issue
Message-ID: <aXPw9k6pJJwAoSNo@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <CAGxU2F6xrPvgoD1+i-S_7Snj3zfZ0iCLXfc7JBf8mZPZi+GMLQ@mail.gmail.com>
 <6146dc59fed504a84db645cde56c3b85082aff0f.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6146dc59fed504a84db645cde56c3b85082aff0f.camel@HansenPartnership.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _H6igz__ChyTybieJNk6YhsZ59hKSHoOu8KZYmZfe_0_1769206011
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jan 23, 2026 at 02:15:49PM -0500, James Bottomley wrote:
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

That feels too convenient as a rationalization. Why would it not have 
been left as an unmodified BSD-2-Clause license document without this
extra language added ? There's some intent behind including it. It
comes across like a attempt to make a new BSD variant, similar in style
to the BSD-3-Clause-Clear (also forbidden in Fedora).

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

FWIW, that is referred to as the "TCGL" license in Fedora terminology
and that is also denoted as forbidden for further usage. The libtpms
package was accepted into Fedora some 15 years ago, and after the
change in rules, it was decided to grant it an exception to allow it
to remain

  https://gitlab.com/fedora/legal/fedora-license-data/-/blob/main/data/LicenseRef-TCGL.toml

Yes, that is somewhat unfair to other packages that have the same or similar
license, but that's the tradeoff Fedora has chosen to make in this tricky
scenario.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

