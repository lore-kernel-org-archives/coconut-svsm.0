Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1032F0C75
	for <coconut-svsm@lists.linux.dev>; Wed,  2 Jul 2025 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465845; cv=none; b=GpAcDnYi5zmFM28CuiZWaMPLMJjeYWFNqVtUIorhY3mps9ylu4CfiWWUyTaoZLzzvqOH/oqanhZBPK+swrDqBxwcyF2EUJlwhxgGywIh6TdE/TlJxTRGnHJT/xPkBL66ELnYykTEcM0bJHQC06BB6311/ToIeE8c4MQ6rJJaSeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465845; c=relaxed/simple;
	bh=ZzpCH6MkvOw7s+Li99vySNAy8qpOO6Enrg+aJeQ71lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BtuzTnpFyTZzFvYdE8V4wKf0dncuEDlB+zdL0JN0l+JdC9NQFFh7sBCwSiWHmLxbXQTyENhDHnYD+OGH9qKSabxks2upJUFj4ffGyaAVrAWrb5ADcrKG5TfdrDbeDKaxUuJcxkU+Ct+M7jbTYfcapsmg/+NOnudNB+v4e5itl7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XyJ8rvlS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XyJ8rvlS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751465842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n5gfmV9L7nIOaWgbzN2wxIR9XWGckiyCE8Ta3N68MeY=;
	b=XyJ8rvlS8dogGdq3tTv78FUhEQWcAus0KJLPNv+JsUmha6cmclWR5oQQIWoUiFAFoXiW/F
	OoGDyQZ5bXMsRniwG1HiMwAn1+Z3txdk9OiH6eiqK9QWd5RqkvjxXyp12lMHCWzrK/8Sjm
	RmYARPyZAJTmI2wHwEgeiefwVpyrwog=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-57-bOPh8qC7OYeyWD5gR2AJNQ-1; Wed,
 02 Jul 2025 10:17:19 -0400
X-MC-Unique: bOPh8qC7OYeyWD5gR2AJNQ-1
X-Mimecast-MFC-AGG-ID: bOPh8qC7OYeyWD5gR2AJNQ_1751465838
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A6D21956077;
	Wed,  2 Jul 2025 14:17:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.226.82])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E80881956087;
	Wed,  2 Jul 2025 14:17:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 66EBF180039F; Wed, 02 Jul 2025 16:17:15 +0200 (CEST)
Date: Wed, 2 Jul 2025 16:17:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: coconut-svsm@lists.linux.dev, 
	Dionna Amalie Glaze <dionnaglaze@google.com>
Subject: Re: SVSM draft specification
Message-ID: <k655ru3rvcmdlwksb2ggnf44ic6w7gabkymwverlghzi3vyexr@uvpix4t6qnsf>
References: <fe3a4825-d079-0fe8-3fda-ed16044a048a@amd.com>
 <nlnqim7c6kmkwkuiy3ly3ryxooenf3ypu7ffnmn63c5tlkloei@fepl5g5pnjuz>
 <1598174a-b4a0-1f98-6a91-3ef01305ff4b@amd.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1598174a-b4a0-1f98-6a91-3ef01305ff4b@amd.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: njeeIGynkYayRArmnV8D_lnKRx-4XAU6fn5Sd7SoB6g_1751465838
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> >>     - Needs references to the request/response formats
> > 
> > What do you need here?  Links into github.com/tianocore/edk2?
> 
> Just something that someone can go to and see what the request / response
> format is. Is there a more granular link that describes it vs looking at
> the code?

I was thinking about the header files, which have the structs and lots
of comments on the fields.  I'll check if there is some actual
documentation too.  Stay tuned.

take care,
  Gerd

