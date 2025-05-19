Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCA727CCDA
	for <coconut-svsm@lists.linux.dev>; Mon, 19 May 2025 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747668626; cv=none; b=LkuBdGud6Cu5DpCRhGD1uh2hFZ3bx8Od6a2GnRp79wG5q7zVMNQ6Cu33VPdR/Yg9N50xxJeemfzkzQRB7wqEvyQkDrJFhG9zbkJIvUEeVvqpCB4s7fTfR74WYUfkVJHR8lYSY8V+4ExLk7cL3dfbyuArR/r8xp39/v2R6HXPq7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747668626; c=relaxed/simple;
	bh=ecj4jJqJQGI0g5v/u+kcwn+LzN1niUJMVEFI74+Jne4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uErJmQYHR1nTiHP4I81A0qSJrTiQIieSCF/1bTDmHXwqxyHy0EhpHTupbdFw7tHeUuy5o2XSNQidN3HSqcRqGVlenZ6M+k1GXfxMM6fYYPgFza3HVtN29/feUcE5qvs6kge1ZzwFsJgMsLgakEP1yq5/VsUhf6Bvxn32iv6nxUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CS18Gjsa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CS18Gjsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747668622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3j7YyRpV395rAKnjfyZRvN5kIHtSPJ2nVnapDu25f30=;
	b=CS18GjsaisEt+8/rjHrvYiVXSYiAXBrkYRsoHRbWrlrf7y3PR5++d9rIuvtU9hcFTXNOO8
	bFtluAGTgUMdCjPzEQqITANg/+qT+agd1oTocyyedkz+p+BmW6JF18LJNaBN/no1R0pNHz
	LjqB2FjtzhKgyXd4k+5AopXYEr1z3F4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-393-amyvxO56NYGpJgiRC-rv9g-1; Mon,
 19 May 2025 11:30:21 -0400
X-MC-Unique: amyvxO56NYGpJgiRC-rv9g-1
X-Mimecast-MFC-AGG-ID: amyvxO56NYGpJgiRC-rv9g_1747668620
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5CE961956089;
	Mon, 19 May 2025 15:30:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.155])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 048CD1956095;
	Mon, 19 May 2025 15:30:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6B65D1800623; Mon, 19 May 2025 17:30:17 +0200 (CEST)
Date: Mon, 19 May 2025 17:30:17 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Adam Dunlap <acdunlap@google.com>
Cc: coconut-svsm@lists.linux.dev, svsm-devel@coconut-svsm.dev
Subject: Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation
Message-ID: <ifj4skreud33emq6apcrmp6s4na5nmwsncrxkozaicg4xih6il@5kqf6yjt3tsy>
References: <CAMBK9=YfWzsXqhav8d8-cLtn6RKLBKY4PN2FCHwjCci1Mi-fhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMBK9=YfWzsXqhav8d8-cLtn6RKLBKY4PN2FCHwjCci1Mi-fhQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0XxuCpFP9WquBrjQMStiDcKFQ4bfm5j4iQBadk8dHdo_1747668620
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> I've been debugging a boot failure on VMs running under Coconut-SVSM
> with 120 or more vCPUs. The guest kernel (on several distros) is
> hanging while trying to allocate a 256MiB memblock out of "low" memory
> for the SWIOTLB.
> 
> While debugging this, I noticed that the memory map reported by EDK2
> has a ton of entries. There are the expected reserved regions, but
> then there's a section of about 2x #vcpus where there is 1 reserved
> and 1 usable page alternating. It turns out the reserved pages are
> allocated as CAA pages and then usable pages are allocated (and then
> freed) as VMSA pages at this[1] point in EDK2. Note that while these
> pages are allocated many times over the various UEFI phases, it's only
> the CAA pages from the first allocation that are getting leaked.

Doesn't match what I'm seeing here, using latest upstream edk2.

edk2 goes allocate three pages (when running under svsm).  Usually it
will free the first, use the second as vmsa and the third as caa.  In
case the vmsa page happens to be 2M aligned it'll instead use the first
as vmsa, second as caa and free the third to workaround a processor bug.

Due to top-down allocation this packs the pages next to each other, I
see a single reserved memory block with two pages per processor (except
boot processor).

> I had a few questions that I thought someone here might know the answer to:
> 1. Is UEFI supposed to keep these CAA pages allocated? I believe that
> UEFI is supposed to be able to talk to the TPM post-ExitBootServices
> and that would likely require CAA pages, but I might be missing
> something.

Well.  Linux relocates the CAA page, and I don't think there is some way
for UEFI runtime services to use that.  First because UEFI can't figure
the address of the Linux CAA page.  And second because linux wouldn't
map the CAA page into the efi runtime service sandbox anyway.

UEFI runtime services having their own CAA page doesn't work either
because the CAA page address is registered in SVSM, and once the linux
kernel started using its own CAA page the UEFI CAA page stops working.

For the TPM this should not be an issue.  There are no TPM runtime
services, the linux kernel talks to the (v)TPM using it's own driver.

For the UEFI variable service I'm working on this /is/ a problem though.
I simply can't do SVSM protocol calls after ExitBootService.  I guess my
options are:

 (a) Find some other way to call into svsm.
     - Is it possible to emulate MMIO devices by letting page access
       trap into SVSM?
 (b) Write a linux driver for svsm efi variable access.

Hints or opinions anyone?

> 2. How are the other CAA pages being freed? The commit that adds the
> allocation [2] does not add any corresponding frees

No clue.  Apparently the pages are allocated twice, once in PEI phase,
once in DXE phase, and only the PEI phase allocations stick.  I had
expected both stay because they are allocated as Reserved (so they are
not freed automatically at ExitBootService) and -- as you already
figured -- there is no explicit free call.

take care,
  Gerd

