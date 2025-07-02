Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E0325A338
	for <coconut-svsm@lists.linux.dev>; Wed,  2 Jul 2025 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464288; cv=none; b=Yq/4xjJqQca6feSeqIpg7rQ46UPipt5ud4FdyEEuiD27K7jkNqCEh71O1gM+y2n2gsmjcxobeavk2r5DKb2T86qLAxfMGyb4+DYDIkIXiSb8L5MzLEClaUGZ57rkfB2XHTbK+RT+ZiU5d9CJPOxC5Y4tcVehgC+/P/JN5YIq/ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464288; c=relaxed/simple;
	bh=rQGYwyAclZypIYvJm3F3FRqquaP1R3sukMoseWTtF7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CJlFGCE3iNbxBuURVKZnAEk327XLp2n1nkJeRVFZ0T3l4Bn44nxp0LGWuNQOGchS3PGepK/Xjb7FWIk3DIq6qzM30aZuvn7NKzeiJrYvjH9/ZWGGsfr/ZIJ9JLsHVz+SiQ9T8pZy4YP8GTmWucZPWTrH8X1zburkvj3qdLQ4cr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B3Ab03AD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B3Ab03AD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751464284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mjePUNwC5IavSQO70wYeqUbip0boZ4DlxzxSdSfkojo=;
	b=B3Ab03ADCN5YP4Brfxx8eOOpFcsYxK9U9CoCiIRA/Z8GLblL8lI5/qVi5qL9zhmo/aIKtM
	U2Xz/CrNDWewieSktsnXDaHDGm679OW+OYtxllJYDbc19WmMBYBHnmzwQZr9YONwLQUHFN
	ImDb2USdgUn22GUGds646Dod5tIromw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-wBoTmMslOla21y_gcd2w8w-1; Wed,
 02 Jul 2025 09:51:20 -0400
X-MC-Unique: wBoTmMslOla21y_gcd2w8w-1
X-Mimecast-MFC-AGG-ID: wBoTmMslOla21y_gcd2w8w_1751464279
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C9D02197906F;
	Wed,  2 Jul 2025 13:51:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.226.82])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 83F8619560B2;
	Wed,  2 Jul 2025 13:51:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id DBEA4180039F; Wed, 02 Jul 2025 15:51:10 +0200 (CEST)
Date: Wed, 2 Jul 2025 15:51:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Geoffrey Ndu <gndu8086@gmail.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, coconut-svsm@lists.linux.dev, 
	Dionna Amalie Glaze <dionnaglaze@google.com>
Subject: Re: SVSM draft specification
Message-ID: <gs37rpeemichi3wsaujsutjclml5vykenia7iytljiujumdfny@zknvphjyax6w>
References: <fe3a4825-d079-0fe8-3fda-ed16044a048a@amd.com>
 <CAH6wD8WM3Zk2uy=nmaPgZ7LKuFSpNfYc7W1tuQJSnWQF=vN0eQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAH6wD8WM3Zk2uy=nmaPgZ7LKuFSpNfYc7W1tuQJSnWQF=vN0eQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EHL51r_JZNSeDAfKzNre7UeLeNTToPlJjP8vsH6qr7Y_1751464279
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 02, 2025 at 12:40:55PM +0100, Geoffrey Ndu wrote:
> Comments and Suggestions:
> 
> * Bit 2 of Flags (Table 23):
> 
> The description for bit 2 is, "Secure boot databases are updatable by
> the guest (db/dbx)."
> 
> Does this also apply to other updatable Secure Boot databases like
> Platform Key (PK), Key Exchange Key (KEK), and Timestamp Signature
> Database (dbt)? If not, perhaps allocating one bit per UEFI database
> could enhance flexibility.

One bit per database is not useful I think.  They all should be treated
the same.

What possibly makes sense is have separate bits for enrollment and
update.  "enrollment" means the guest can set those variables if the
system is in setup mode (i.e. no keys present).  "update" means the
guest can update these variables with proper pkcs7 signatures.  The
later depends on crypto support for the signature verification, the
former does not.

> * Confusing Statement:
> 
> The following statement is unclear:
> 
> "If a database does not contain any data or is not present, the offset
> and size for that database must be 0."

I think this is a leftover from an older version where 'db' + 'dbx'
where added to the manifest, which is not the case any more because the
uefi firmware measures them into tpm pcr registers anyway.

take care,
  Gerd

