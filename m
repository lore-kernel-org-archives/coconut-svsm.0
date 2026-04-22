Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434253BF677
	for <coconut-svsm@lists.linux.dev>; Wed, 22 Apr 2026 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849771; cv=none; b=NqlSO70jtDB+46mNR1AriUwTCR8WMCV76SAFOwqh46PPEbyIXVPuImVVQuNEZpqaWnakXuhmTeyJ3IVtaVORrWOhZyRcq5RLI1ABE870lMKjsq4n9MCRs14yZFxYnHjBUp0lQ6tzHG3Bz2d0hjc3yOc2UysljKC+wSTzXNPSqoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849771; c=relaxed/simple;
	bh=qamFkdDfzA8U3AN0JD/J5ls8XSemnlwAXXZTTaR+9SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cEp2A1m77XdT0sNImpq03/HCHcQaU6vhDVaKyWhXei5vMSElQKHbOYr6T0Qg6gPB0NPG1BTonjOC4CT6oqwqrbtTnxHE1OWGBIvABAj4Q/LXprm3sqUqfOK+teurp1A88FasWNvzrjO1PxaUbNPil7EKx2slBSgMmejmFJfViW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dPl47QI4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPl47QI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776849769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LiSq7acX3OGBKJ2op2y0ybUK4Js4133fL0e7bhu1aMc=;
	b=dPl47QI4uUeA2gJj4PSvgXZSEtDpapJ2ght5vDBKySWrQI7dRu8WvI8eWKIebeGPs1sY3J
	O39th2R1fBzIRGtbpiUYAxXEYtZ9LBAbW3IbDjxMYEU17pPNt21q/YjKZNKbBHZ3eTsWoE
	W2VfNRhtI4FEH7T9pdQzLBJpZpBtN2Q=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-sMG_vezEOrOTGO8lmqzgjA-1; Wed,
 22 Apr 2026 05:22:47 -0400
X-MC-Unique: sMG_vezEOrOTGO8lmqzgjA-1
X-Mimecast-MFC-AGG-ID: sMG_vezEOrOTGO8lmqzgjA_1776849767
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 11B14180057D;
	Wed, 22 Apr 2026 09:22:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.48.53])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9AADF1800660;
	Wed, 22 Apr 2026 09:22:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 5C8681800609; Wed, 22 Apr 2026 11:22:44 +0200 (CEST)
Date: Wed, 22 Apr 2026 11:22:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev
Subject: Re: SVSM Observability and Configuration Protocol draft
Message-ID: <aeiLnWdClMC6YuLi@sirius.home.kraxel.org>
References: <d3v2ljpmhjukdwnavsn436fkgtuuojkptdr3f7bh3fcqr5zayy@d7jhqsyibycw>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d3v2ljpmhjukdwnavsn436fkgtuuojkptdr3f7bh3fcqr5zayy@d7jhqsyibycw>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -chDA-kdiDVbj76ZVCvkrAGiDtdHhMk_9ZBs5HQnq3g_1776849767
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

> ## SVSM_OCP_LIST Call
> 
> The call is used to query a list or sub-list of observability and configuration
> sources of the SVSM.

> ### Source entry layout
> 
> One entry in the array is 128 bytes in size and uses the following layout:
> 
> | Offset | Size (Bytes) | Description                         |
> |-------:|-------------:|-------------------------------------|
> | `0x00` | 4            | Flags                               |
> | `0x04` | 124          | Name of the source encoded as UTF-8 |
> 
> The Flags stored in each entry are a bit field stored in little-endian byte
> order. The defined flags are:
> 
> | Bit(s) | Name           | Description                                    |
> |-------:|----------------|------------------------------------------------|
> | 0      | `WRITEABLE`    | The source supports the `SVSM_OCP_WRITE` call. |
> | 31:1   | Reserved – MBZ | All other bits are reserved and must be zero.  |

The SVSM_OCP_READ call allows for arbitrary data being returned.  So I
think it makes sense to include type information in the returned data
structure, and maybe also usage information.

Things coming to mind:

 * u64_value -- integer value (example: number of free pages).
 * u64_count -- integer counter (example: number of page faults).
 * bool
 * str -- variable length string (example: process name).
 * str_once -- variable length string, data will be returned only once
   (i.e. reading data clears it, example: log buffer).
 * sha256 -- hash value (example: cocoonfs root hash).

We might also add the protocol number, so we can tag vtpm sources with
SVSM_VTPM_PROTOCOL, ...

> ## SVSM_OCP_READ Call
> 
> This call reads data from a single observability or configuration source.

Idea #1: Add support for a SVSM_OCP_READ_REGISTER call.  Supports
fixed-size sources with up to 8 bytes in size.  Returns data in a
cpu register instead of a memory buffer (i.e. svsm can skip the guest
page mapping).

Idea #2: Add support for a SVSM_OCP_READ_BATCH call.  Allows reading
multiple sources with a single call.  Maybe also limit to fixed-size
sources.

take care,
  Gerd

