Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99492C15B4
	for <coconut-svsm@lists.linux.dev>; Thu, 24 Jul 2025 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753371824; cv=none; b=Qj9ewxAEWdXtrlDicegUS7oby3Z0NS2oBCzNhAt0toaAmQF5Kn30MM/QlSc3sLXUtU6yLBk0dEgXCu8J/FrH3IDF+9LZxzIR6AeahGcRQof3Wf71BxVOcFs411y42WUBk98XI3xnpTx7EKirysH9UmuVrGw1dniRBsfeRwvEHFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753371824; c=relaxed/simple;
	bh=wYho1smiS2q5xLDWAhHKByL94ur9f35ooXuBoyePIqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fmqU6rILSQBrOBPI8SAkF0zTHHYgFJjTj+Zdw4wgajNFSHEhcisiGlMRJf0cV8Vh37017uGr029+fBGwejoFFQ+rG0NqpB5AF2SZwyLdY7BiDpIngwMVEKXusM9NOfbGhLIOzbdXazSLZOuByRW9CHnjPTihIQk07F/xkk6zMRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PXQbhqat; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PXQbhqat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753371821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nBbBOD/whiXKhMzFNHyWDwIdfh2jMFikI0v1nHL++gc=;
	b=PXQbhqatSCaHeeSa/PqDX9IZ59aw1qTgk/SBmpX69KNd9GlideIOrRtnvHtRQLiCUR+Y0M
	NlekkfdpdO0SGn55JJNvQFR9HhroSsYnvP60Ha+Xd0Vw5p0ehEmTv4G+P1wpu4e97X12Yd
	XuIhxMgZZ4CDA7ipQCf70oomNx5qtEo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-lO3sYVH0PfGinq3-8u32JQ-1; Thu,
 24 Jul 2025 11:43:39 -0400
X-MC-Unique: lO3sYVH0PfGinq3-8u32JQ-1
X-Mimecast-MFC-AGG-ID: lO3sYVH0PfGinq3-8u32JQ_1753371818
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57FDE1800447;
	Thu, 24 Jul 2025 15:43:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.56])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D442E1956089;
	Thu, 24 Jul 2025 15:43:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 4AFAD1800387; Thu, 24 Jul 2025 17:43:35 +0200 (CEST)
Date: Thu, 24 Jul 2025 17:43:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: coconut-svsm@lists.linux.dev
Subject: Re: SVSM draft specification (v1.01 draft #2)
Message-ID: <wa7eut74dfmqsuyy4qzcqnyob7c4d4dys4hlvygbsnvkmw7asz@73hivb555yh4>
References: <b9f966aa-61fd-8372-784d-a96529faa80b@amd.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b9f966aa-61fd-8372-784d-a96529faa80b@amd.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 559b4z667d5Na0EK1vQbPzMBlNjlLuJdPUJohgvbWVA_1753371818
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

>   - UEFI Management Mode service
>     - Needs references to the request/response formats

Partly covered by UEFI PI spec.  uefivars.md update:

-------------------------- cut here ------------------------
--- a/uefivars.md
+++ b/uefivars.md
@@ -51,7 +51,13 @@ protocol guid or an efi event guid), and therefore also the format of
 the request data following this header.  The `size` field specified
 the size of the request data (excluding the header).
 
-### edk2 references
+### uefi spec references
+
+ * UEFI Platform Initialization Specification, section IV-5.7 "MM
+   Communication Protocol" describes the EFI_MM_COMMUNICATE_HEADER
+   struct.
+
+### edk2 code references
 
  * MdePkg/Include/Protocol/MmCommunication.h
  * MdeModulePkg/Include/Guid/SmmVariableCommon.h
-------------------------- cut here ------------------------

I have not found anything for the two relevant protocols, I think they
are considered an edk2 implementation detail and therefore not part of
the UEFI spec.

take care,
  Gerd

