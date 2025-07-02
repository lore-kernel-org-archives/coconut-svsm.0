Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518B527AC35
	for <coconut-svsm@lists.linux.dev>; Wed,  2 Jul 2025 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464507; cv=none; b=LHQigNQ1Soblfz3RB9DrxgNl+C0I3UaxbrCRcGrVYLqP0yZ7ujmsmHlHu2r9qwoY14xEYfqanm7OLafdgmpNvkfiFYL5EyopAPKr4flBmCl4rgn51M+IHx7C2XdAj1MjM+8zuh3ppJzB0GzNiEgYWf+DkcheF7didEEEJJh+rQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464507; c=relaxed/simple;
	bh=EVYltX+DtKluWxCD/e2v5/9Wl9Q36vcZzJ8tPd8mi2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SQfBJHapLotSJcJM38c4/TjMcxsBg3mRy1ewzov7899zI1daFEuPIwUzvjktcqtH77NDj5POyXvfA7iFJrBvvJkWZmecT6c3fqsELKhBeg3QqsNgwK8U8FHzV7XZVEt6sYgRufcYJuQwevkmx6yIaZ9ftMN3Ynk93QmSfZ2VM6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hrFVHfNO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hrFVHfNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751464504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Idkbb0+rr2VGDptopXYOLVQ1Qmcf9sXQFbPe2+VHho=;
	b=hrFVHfNOjG4riZrM5xdQ/ev97atYikdW+5PcG3Gqs55M2G1nigDd9RU2M1acziE76+y6Ek
	YjDMg56QeF5vA2zJjOBWbKg5DEwHYEC+RRwxB4WN8MhEh7sfYk+r8o3J5oXThEuqALg2t2
	Yaz3AG7/SO/hUvX8iOmskrzOLgxlnGE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572-2UHGP5RYP7iayM-IcBYa4w-1; Wed,
 02 Jul 2025 09:54:58 -0400
X-MC-Unique: 2UHGP5RYP7iayM-IcBYa4w-1
X-Mimecast-MFC-AGG-ID: 2UHGP5RYP7iayM-IcBYa4w_1751464496
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4A1821828AA8;
	Wed,  2 Jul 2025 13:54:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.226.82])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04B3B180045B;
	Wed,  2 Jul 2025 13:54:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 98959180039F; Wed, 02 Jul 2025 15:54:50 +0200 (CEST)
Date: Wed, 2 Jul 2025 15:54:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: coconut-svsm@lists.linux.dev, 
	Dionna Amalie Glaze <dionnaglaze@google.com>
Subject: Re: SVSM draft specification
Message-ID: <nlnqim7c6kmkwkuiy3ly3ryxooenf3ypu7ffnmn63c5tlkloei@fepl5g5pnjuz>
References: <fe3a4825-d079-0fe8-3fda-ed16044a048a@amd.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <fe3a4825-d079-0fe8-3fda-ed16044a048a@amd.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: epXlkMd2ZEn0OTcQzVO9r78rlXic3GMwDOBQGHpZyRc_1751464496
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 30, 2025 at 11:36:18AM -0500, Tom Lendacky wrote:
> Attached is a draft specification with the following changes:
> 
>   - New single service extended attestation request
>   - vTPM service update for single service extended attestation request
>   - UEFI Management Mode service

SVSM_UEFI_MM_REQUEST description refers to *previously registered*
communication buffer still, which we do not have any more because we
removed the register/unregister calls.

>     - Needs references to the request/response formats

What do you need here?  Links into github.com/tianocore/edk2?

take care,
  Gerd

