Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A19F36D518
	for <coconut-svsm@lists.linux.dev>; Thu, 19 Mar 2026 12:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921663; cv=none; b=gDhjGyip+sryBm+2gpLjHvCpolJsIPD6B//HGtDbWekN4y509s1VUhxAzhQqp5KVkgsZRjxrkqFcXA87NFvV2eCACWUR2cLg0WTU+C0gTmlQuj5kLK8ajepm6XGLqFNH8WBI1bySVgfkiEYVVABNOyjAjqbIlWlSzr0Bb2Rfs2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921663; c=relaxed/simple;
	bh=DTSjfQwm9OihJ8UD/J4c8IFtmhQwRExpz2u8Zq8Kl98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=biof+IxIjH6Emyafy62W0U7Zi5CoQbVc1DhRW4Ld9SlFafmHUBA7ZGih7RdS2/G//T7W1Jyjsyv0mkNV+PfwXSYpijA0Dihm8uf8pZrxIPf/6QTcNQ1QXsAQvPfoFeFa8M0Iw+s0eCPV8ugC1zth7giYvUOEtQVDm7wLRtnmAK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YOL+iT6J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YOL+iT6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773921660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o5gPTFv7uByfyq5CLYU23ZVWH5XdGoltdpdVnn1QRow=;
	b=YOL+iT6Jy4UIYoSgvanga0usoGB89fF51Dj9wi5/0/5scvwqe8bag7VUkTjSwEqpLpNaT/
	K27Fmzbt5iqh81cXg0HcvK6dk2fBLjqweT4tzanRbTk5Nt+TgpFAP4T+RbaBooRal3D3A6
	nuJSZwImFGRsn0Q4+HdMUKGlXhjOHIE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-rb6YWuImPbGGQ4mqsTP2IA-1; Thu, 19 Mar 2026 08:00:58 -0400
X-MC-Unique: rb6YWuImPbGGQ4mqsTP2IA-1
X-Mimecast-MFC-AGG-ID: rb6YWuImPbGGQ4mqsTP2IA_1773921657
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a77f807e4so2636268b3a.3
        for <coconut-svsm@lists.linux.dev>; Thu, 19 Mar 2026 05:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921656; x=1774526456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5gPTFv7uByfyq5CLYU23ZVWH5XdGoltdpdVnn1QRow=;
        b=lA0cIkpdBG8xepI+jU4MvSlAjvZiNMGYoPPJN07mFQBZ4hnYohvj3Ow9e0yWVqVIdy
         vV7WurpEeCaJNaMVYUzE5gTjZZbQb3EDy8tHrIg2jw0ddLbA0akMLIq0KWrASaTcu85O
         3zqTprNQIROi1zrXxNNWzTGOo6xcaDehC4vUUijCb+Z8v34R2YUo7PAxLUwRkEIrgyGq
         652qRQ4pre8gIhysfZJ9sl+b07igtQ934Pp6UfcgE95uNT3fYQJ3w8Mx9Jk5EiVDFscP
         pdh3JrH3ky49FJTyv51zwLaQ1OIJuOYiiFClWgfgZWTV60gLSljzBR06ftCj04zZt7+O
         0Lig==
X-Forwarded-Encrypted: i=1; AJvYcCWOhmcRnqd5YXHX+ADi97/S/8jmAzzkVO0Ulr6ix1oE8lYWkEW9DSR5ThDDPfyNwEoR1Z9DXyl+6+VUaZQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz24gYbXKfaw0NJs14p1CNC2rBTWmg9oBmecZRUny5BxhPPyDap
	WbqLpjO4CMHH1QDRo9zFHTNpnWlfjjtk9GQbVCKcIguaUbBll2fDg/ZAj/Pehw8tL2yWz61i0ep
	N3siLcNl1EIw2RtcwW3aQD5EQjUVEkGqrBF0Tar1x58s8OGBSV/YycrCqIHLEsYr5vE+ZXm8wgQ
	==
X-Gm-Gg: ATEYQzwZmUiR8Aek46NutnkIq0rqIpdbPDSsiqu5pxqC2wID167rGrqIknqkG41INxj
	xq2++Q1KvyzQ8fAatzcZjU7zZapk3yI1+yu93ujGfFiKfpAgNJqB5Zcp2KxppLsvfh7iB03n0LY
	+4CuhzGMdfp0ApL0t4/Wg9cEF4HW85wm/3Y4ooyMwoavJGVTb3JpssKz5n+PPeL2CffGKR3wkcb
	97W3ogOeD+O63RXFuL6l5MKyFXq7M73SMn0mvWnyiAyTAzWy0nWvlEBmWbUBiFAkWCzbg0oWJZp
	CThxTyHgWUQpIHA4p+6q8lH6mxWpHdrPaQNoLBrMefLIYh7rOnXwJFOESft88XhUV+facgCFyC9
	BYLZL1pDIriM=
X-Received: by 2002:a05:6a00:17a9:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-82a6acc07e5mr6781962b3a.25.1773921656277;
        Thu, 19 Mar 2026 05:00:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a9:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-82a6acc07e5mr6781929b3a.25.1773921655685;
        Thu, 19 Mar 2026 05:00:55 -0700 (PDT)
Received: from fedora ([49.36.104.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2f34sm5900878b3a.30.2026.03.19.05.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:00:55 -0700 (PDT)
Date: Thu, 19 Mar 2026 17:30:49 +0530
From: Arun Menon <armenon@redhat.com>
To: Nicolai Stange <nstange@suse.de>
Cc: Tyler Fanelli <tfanelli@redhat.com>,
	Oliver Steffen <osteffen@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	coconut-svsm@lists.linux.dev
Subject: Re: [DISCUSSION] svsm: attestation + CocoonFs:
Message-ID: <abvlcdh_zJPWUEwG@fedora>
References: <873427gf9x.fsf@>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <873427gf9x.fsf@>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ACV38jK9RzCrmc7DP3SM7sOGi_7tzMuAJVFq6Aa2YDA_1773921657
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 11, 2026 at 05:29:30AM +0100, Nicolai Stange wrote:
> Hi Tyler,
> 
> I've been told in one of the svsm devel calls that a capability for
> storing some info in plaintext in CocoonFs would be helpful for your
> attestation efforts.
> 
> Before I go and implement something, let me ask about the nature of that
> data.
> - What exactly are you planning to store there?
> - Presumably the filesystem salt from the image header, supposed to also
>   serve as a filesystem ID ([1]), is not sufficient?
> - Is the data considered immutable over the lifetime of the FS?
> - Is it Ok if that data is not authenticated?
> 
> Thanks!
> 
> Nicolai
> 
> [1] https://coconut-svsm.github.io/cocoon-tpm/cocoonfs/cocoonfs-format.html#image-header

Hi Nicolai,

I’m jumping in here — while I’m not Tyler, I’ve been working under
his guidance on a related provisioning flow and wanted to share my
understanding to see if it aligns with the requirement being discussed.

In my current workflow, we are pre-provisioning a TPM state file
(including the EK cert) on a separate host (not necessarily confidential).
The goal is to have the SVSM-based TPM start with this known state file.

Here is how I envision the flow:
1. Provisioning: Generate a TPM state file (NVChip) externally with the EK
   cert and other metadata. The tool starts TCG TPM simulator and then
   writes an EK cert to the state file. [1]
2. Packaging: Create a CocoonFS image containing this state file, encrypted
   with a key Key1.
3. Key Management: Send Key1 to a Key Broker Service (KBS) and receive a
   wrapped version, Key2.
4. Header Storage: Store the wrapped key Key2 in the CocoonFS image
   header.

At Runtime in the SVSM: SVSM reads the header to retrieve the wrapped
key Key2. SVSM sends Key2 along with the hardware attestation report
to the KBS. The KBS validates the report and returns the unwrapped key
Key1. SVSM uses Key1 to decrypt the CocoonFS image and access the
TPM state.

To address your specific question, in this scenario, the wrapped key
Key2 needs to be accessible before the filesystem is decrypted. If
the image header can store this metadata in a way that SVSM can parse it
without the primary filesystem key, it would solve the bootstrapping
problem of how to get the key from the KBS.

Does this match the type of metadata you were considering, or was it
intended for a different purpose?


[1] https://github.com/armenon-rh/tpm_provisioner


Regards,
Arun Menon

