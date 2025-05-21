Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B725E80B
	for <coconut-svsm@lists.linux.dev>; Wed, 21 May 2025 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826451; cv=none; b=hRLW7Qc3y5C0EPuq3kohuxTuH8a+3puW25d04EBMnYyE1m06aMjHH5+gHo6hrypJLqoj/cD8jJKxO14Fhz8Qmgs/cuYa3artJyRGOuPfNHGH1LHO/lrvqb4uYFtyBj4c9d2XJpJ+E3mEn9ZVomAk2oLjVkGFLRtwRcqqQZ/qK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826451; c=relaxed/simple;
	bh=W7TpvmK+2HwnDH/AkfjLdJcINyr/tZu/3xjeN2qjT5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=s1cn+nT/lpb74lzzMYrWaGrDBPAYTU6FOJfUR0o6Q+7Rs1FV7K/rt8lX8JK95i1BnEqH6g1+4mCBnrpRCdLAgxZ2hQ4rLmZF3TMDqx2mWCYZnwwUvIlHwHU6o6o5Nax05fQLVrsW++7360QCK9/CWnk7PrkBWF7X/7LrOAKY0H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DUcm0DZQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DUcm0DZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747826448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=229vULuJALbDpLei3s+IiBCr6Oqk48WUwtLhMSTgF9E=;
	b=DUcm0DZQRXfSIyYs7n0ucYCZzoLHw8rEeEGEPIiR5hoVWX9495Dfe5sg83l+guQGkTxhos
	wJbOjD7W6ltMeh0I8byENc46p2+p+1ycTOW+gN50NGlE3W9YZZwkOC3X26ctq/TETN67zZ
	nHgKewsDq+Xr335vVyg4wBM1V7TuXAg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-R7QpCujgMLGccDaKVIQd3w-1; Wed,
 21 May 2025 07:20:44 -0400
X-MC-Unique: R7QpCujgMLGccDaKVIQd3w-1
X-Mimecast-MFC-AGG-ID: R7QpCujgMLGccDaKVIQd3w_1747826443
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A31D180045C;
	Wed, 21 May 2025 11:20:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.155])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F04919560A3;
	Wed, 21 May 2025 11:20:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id D7C0C180039F; Wed, 21 May 2025 13:20:39 +0200 (CEST)
Date: Wed, 21 May 2025 13:20:39 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jon Lange <jlange@microsoft.com>
Cc: Adam Dunlap <acdunlap@google.com>, 
	"coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Subject: Re: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation
Message-ID: <3molncndmeeajso7cuyhx3cmt36wsx3lvsqurch54htvf7ngal@6e67qqyfbtk6>
References: <CAMBK9=YfWzsXqhav8d8-cLtn6RKLBKY4PN2FCHwjCci1Mi-fhQ@mail.gmail.com>
 <ifj4skreud33emq6apcrmp6s4na5nmwsncrxkozaicg4xih6il@5kqf6yjt3tsy>
 <SA6PR21MB430341F8085E6F0B004B865BCA9CA@SA6PR21MB4303.namprd21.prod.outlook.com>
 <nnijlaq5y6a5fvydo4vohgjefci63puwckhcrtgi5yec3tmbql@xjuuvnjyypqi>
 <SA6PR21MB4303A1AE51FDC2CC8A83A779CA9FA@SA6PR21MB4303.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SA6PR21MB4303A1AE51FDC2CC8A83A779CA9FA@SA6PR21MB4303.namprd21.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mGqdu5_eEVdmwMbxA7G3U5YrUXvdYoIteSHyyMrWphI_1747826443
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 20, 2025 at 04:17:26PM +0000, Jon Lange wrote:
> The error you are seeing indicates that the page being read has not
> been PVALIDATEd.  Unfortunately, the #VC exception won't tell you
> which GPA is failing, so you'll have to do some debugging to figure
> out which access is causing a problem.  Because the exception occurs
> on a MOVS instruction, you can't even be sure whether the page
> validation error is occurring on the source address or the destination
> address, though it's rather unlikely that the validation error is
> occurring on a page owned by the SVSM itself.

It's the source address.  Patched in a few dummy mov instructions
before movs to see whenever rdi or rsi access faults.

Address is the CAA page.  Owned by the linux kernel.  svsm maps it at
0xffffff0000002000 aka SVSM_PERCPU_CAA_BASE

> I cannot guess why the GPA is not validated in this case.  The calling
> area address is established by the SVSM when the CPU is created, so
> this specific SVSM call cannot be specifying a bad address (because it
> is not specifying an address at all) - unless this SVSM call is the
> REMAP_CAA call.

Linux remaps the CAA twice via REMAP_CAA, but this 404 fault happens
long after the remap completed.

> I don't know whether it's possible that Linux is issuing a PVALIDATE
> request to the SVSM (remember that all PVALIDATE operations must be
> performed by the SVSM) to revoke page validation on this page.

Linux flips an page range to SHARED state, most likely for IO bounce
buffers.  The CAA page is not included in that page range.

The linux kernel can do svsm protocols just fine, only when uefi runtime
does the same thing with the same physical CAA page things break.

> I also don't know whether it's possible that the specific flow you're
> looking at involves the VMM deciding to remove the physical page
> associated with the CAA's GPA and to replace it later - this would
> result in a non-validated page being present in the address space.

There is no trace of any explicit PVALIDATE calls.  So I'm wondering
what conditions might cause the VMM do actions like that?

One possibly relevant detail is that the linux kernel and the uefi
runtime use different mappings and different virtual addresses to
access the caa page.

thanks & take care,
  Gerd

