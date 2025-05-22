Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D323C26868C
	for <coconut-svsm@lists.linux.dev>; Thu, 22 May 2025 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903073; cv=none; b=Z+5jhJ9J4/hZx+3e8dKdUwTGTsymoBBbdV79M+1bp2GUZEBkLu8cNfvOMe+FzyjDGMDZeslzuxN/fGMhv9ThcXwhb3FjYmZ18SDbleZvsgvjtpP+cEXhXPHnemNPjv3tjOM635XvasqSYvFuLe3AACHKk6mAf9oYA3yB6/KDcaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903073; c=relaxed/simple;
	bh=GrxwTGf5Ff2ogymtZw3hg/DhpEBTs7nnZQuGRVKKa2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=D6HlZo+BZIbE119LRxWqkOYFqsowIK7itvZq8LR9nCFqv8xVCvxstguD84G9BjhJfVeOVcI9QFVwksGoCh6sOXL4xm65+SwYYBJSDR417pWIS535ueuZNiYpqzgy6rVes0nu2ojr99ydVjnuFrpLq0KOas6e74nlnf+EgwaC5JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HvDLlFfq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HvDLlFfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747903069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tiThNbuqeQSHQcsgG47j8eiJvN6JOdloj18/Oc7UZUI=;
	b=HvDLlFfq7aLcsZdD12I5ylx396X8cqafm46IAhYV8gbncVbQoE9Ex7CimZ5wpMFoc2fa0o
	5DF6NuVZZ5lh8YYCUfbH1P8gknQ5QDT2sohOB3Krk1vQ+jI9eohTW0XikHnseDJGJvhfAp
	uAsIRHxLiQh7jN2+txVAaKR+zjOa+h8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-nnUfr1k7PGK1uzijbR_GkA-1; Thu,
 22 May 2025 04:37:48 -0400
X-MC-Unique: nnUfr1k7PGK1uzijbR_GkA-1
X-Mimecast-MFC-AGG-ID: nnUfr1k7PGK1uzijbR_GkA_1747903067
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56FA21955D9A;
	Thu, 22 May 2025 08:37:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.155])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C5B3830001A1;
	Thu, 22 May 2025 08:37:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 2F68D1800397; Thu, 22 May 2025 10:37:44 +0200 (CEST)
Date: Thu, 22 May 2025 10:37:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Adam Dunlap <acdunlap@google.com>
Cc: Jon Lange <jlange@microsoft.com>, 
	"coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>, "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Subject: Re: [EXTERNAL] Re: [svsm-devel] EDK2 CAA Page Fragmented Allocation
Message-ID: <p6tdclzir4twfjejgso4pbi6fj32p4eokpthwjatdvlv2i4eqt@uzkswusjwbpz>
References: <CAMBK9=YfWzsXqhav8d8-cLtn6RKLBKY4PN2FCHwjCci1Mi-fhQ@mail.gmail.com>
 <ifj4skreud33emq6apcrmp6s4na5nmwsncrxkozaicg4xih6il@5kqf6yjt3tsy>
 <SA6PR21MB430341F8085E6F0B004B865BCA9CA@SA6PR21MB4303.namprd21.prod.outlook.com>
 <nnijlaq5y6a5fvydo4vohgjefci63puwckhcrtgi5yec3tmbql@xjuuvnjyypqi>
 <SA6PR21MB4303A1AE51FDC2CC8A83A779CA9FA@SA6PR21MB4303.namprd21.prod.outlook.com>
 <3molncndmeeajso7cuyhx3cmt36wsx3lvsqurch54htvf7ngal@6e67qqyfbtk6>
 <CAMBK9=YnAv9kGCrF3uZj+u4KdA8yDHs21Oo67sZM=G0KQJ8F-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMBK9=YnAv9kGCrF3uZj+u4KdA8yDHs21Oo67sZM=G0KQJ8F-Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 73VySS7zrb6OiRM7txcqQwjUM4PWaTb3dAFOCqKZPQY_1747903067
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 21, 2025 at 09:16:07AM -0700, Adam Dunlap wrote:
> On Wed, May 21, 2025, 4:20 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > There is no trace of any explicit PVALIDATE calls.  So I'm wondering
> > what conditions might cause the VMM do actions like that?
> >
> > One possibly relevant detail is that the linux kernel and the uefi
> > runtime use different mappings and different virtual addresses to
> > access the caa page.
> 
> If the guest accesses a GPA with the c-bit disabled, then KVM will
> rmpupdate that page to shared. If the guest then accesses the same GPA
> with the c-bit enabled, then KVM will rmpupdate it back to private,
> but it will be unaccepted and thus give the 0x404 error. I've seen
> this happen while investigating several different bugs.

And this is what happened here too.  The kernel mapping had the c-bit,
the uefi mapping not.  With that fixed the kernel continues booting,
then traps into the next problem.  So more debugging ...

thanks & take care,
  Gerd

