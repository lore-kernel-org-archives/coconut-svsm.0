Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3972DFA20
	for <coconut-svsm@lists.linux.dev>; Tue,  8 Jul 2025 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751983992; cv=none; b=tzYgmlEAZu1XOlglrokSoX4zzQ//FHM3g9eKgjoY4GeOFblblIFsCJe2C/Uoh0bAgOitoIuD7U+uk/4hEM90LmGFuH+YDbnJmHttYKt7zqv3S4envwf338pXE4u6Tcs1FRGqD1/7+ejmYC7quEc7M2a3g47Fkq4jQBPnvrAMKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751983992; c=relaxed/simple;
	bh=PUHAvs3+d/CdjxjkZrLMvNNQ22W7u2/D0epAj+/Skj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dqOTKx7WjLSeyXGzmtjRVV075tY7rj2I7sqM9eRGD7B9ao+DZtNyjEFh1F3eNEd1q8L4BIdcoMuNPgX46SGoHt7KpSiFaCIFJxUxFlG+0kfTi12uDTp/KS0kc5zROnNW0eb8yfTfY0rUXIhQNU02EHCYTIwMn84T+qlGDQMD4CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JPc35Q0i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JPc35Q0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751983989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k41ApPrKZ//nlcAgxYcyST4TlD0nHDuA5gXTGpBXAaI=;
	b=JPc35Q0i2LxoZXgRqkfM4O6Qu3NNQ5B8ZKv0BPY9tT9mINpTyH+iuj8El8Gggczk82vP4p
	/gKMso2jyBWXblCJWyiKmT67TPMJ9futvdJcshJNc0Jn6H5DnSZv3j9zOynquUJhuRBU0k
	fKbCL9+uXpIxolUsscW7bQaa2sdmjCM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-124-5NKtugjUMoihwtsNFGvFPg-1; Tue,
 08 Jul 2025 10:13:05 -0400
X-MC-Unique: 5NKtugjUMoihwtsNFGvFPg-1
X-Mimecast-MFC-AGG-ID: 5NKtugjUMoihwtsNFGvFPg_1751983984
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ED131190DE3F;
	Tue,  8 Jul 2025 14:13:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.100])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 070F530001B1;
	Tue,  8 Jul 2025 14:12:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7ECD018000B2; Tue, 08 Jul 2025 16:12:57 +0200 (CEST)
Date: Tue, 8 Jul 2025 16:12:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Relph, Richard" <richard.relph@amd.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, 
	coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call July 2nd, 2025
Message-ID: <cvrqixqf3odaxgpz4uzwtkfkbmgbyrndzgyl7mhlbs6vj6fnpp@5aqnndt7rm6q>
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
 <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
 <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
 <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4b862033-9c53-47ec-8eae-e9c9ce7d7d7d@amd.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2UkS4tjNOt-RyjmbVzQD3sauq_Jv39yuCIuL9Vcp64Q_1751983984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> >> From OVMF perspective I don't see this as a big problem, assuming we are
> >> talking about static allocation.  The memory discovery code is designed
> >> around e820.  Typically OVMF simply loads the e820 table from qemu via
> >> fw_cfg.  But there are multiple ways to get the memory map, when running
> >> on xen or cloud hypervisor things are handled in a different way.
> >> Adding one more option for svsm surely is possible.
> > 
> > The idea is that COCONUT provides an IGVM memory map to OVMF, which takes it as
> > a base for its memory map instead of the E820 from FWCFG.

Should be easy on the edk2 side.  As mentioned the infrastructure to use
different sources for the memory map is already there.  Also OVMF must
do SVSM calls quite early to accept memory, so doing SVSM calls to get
the map is no problem too.

The interface should be usable without allocating memory, for example a
protocol which returns one entry per call so OVMF can loop over the
entries using the stack only should do the trick.

> > Longer term it would be great to fully enable OVMF for IGVM, so that it can
> > also consume some of the ACPI tables from there instead of FWCFG. But that is
> > future stuff, what we need for now is the memory map.

ACPI is a bit more tricky because today the process is that OVMF goes
setup the hardware, then qemu goes generate ACPI tables matching the
setup, finally OVMF loads them from qemu.

But as far I know svsm does not want enter the hardware initialization
business, so fetching the tables in svsm instead is not going to work.

> As I heard it, the concern is that maintaining page state in SVSM (not OVMF)
> will eventually require SVSM to have access to a dynamic amount of memory.
> Right now, AFAIK, SVSM has no way to request memory from either the host or the 
> guest.

I assume you mean dynamic at boot time?  i.e. instead of the fixed, 16M
allocation via RequiredMemory IGVM directive svsm estimates how much
it'll need and takes the required chunk of memory from guest RAM?

Once OVMF gets the memory map from svsm not qemu this should be doable,
svsm can simply mark it's own memory as reserved then.

take care,
  Gerd

