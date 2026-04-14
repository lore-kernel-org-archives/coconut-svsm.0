Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8423CD8BB
	for <coconut-svsm@lists.linux.dev>; Tue, 14 Apr 2026 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160784; cv=none; b=CTxdQTdEM7RfZBTXSrzk6nRpNNpCK686ViqUZNR/NxTTPfh1djyB6fZ78noSB+VRQtuJ67YYFgZfzMLgPDlYOszawGHQHWP1ltiZefAaUNMv/cknxEIecLQJvk9mqCLvDtWGRDFR4tzHMeVplq9oL9+H33laBrSYUFNm1BM1aQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160784; c=relaxed/simple;
	bh=f4nLkPCbtHacQ22+IAS+0XjOy+wiK1wC1VzJCsnf8Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhOxfblKx5hEJS5paS36D5jxDbCrOczayJKxSZmz3183iuRMHpQLjUi9bJ56WbFHEY7CbtXbgf6Gq34qHesGnPZy/Tiw2lXchGEGoAqTbHtbpILnMXqyaftJO4TjXuu0Y5jGQ+qmWas6DuEV47N2g47fEr4tPiBneI/5BmcNUuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=iuOju/Gs; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="iuOju/Gs"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3AAEA1C27D9;
	Tue, 14 Apr 2026 11:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1776160781;
	bh=f4nLkPCbtHacQ22+IAS+0XjOy+wiK1wC1VzJCsnf8Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iuOju/GscshZlkeZoG5jYJnokdseEEAkODVBuKll9AXWaxerWYIaxSczm86BVNZ5R
	 OTFQw+hQoiZYGC6syRfE+S3khRA0h4AM11ZduUestdhGCMGJZGxZLHecOqWE0ewLUv
	 cpCJ0uc2A6gCZ+bTI57YB8e8CxFYRNObUESzwwwYTwdEOquUkKDvej4qAcn3jPrv7g
	 RJbNqD81sqqN1iwpAqzLJzsrr2flETFPm++s1tAz6jFbrUjAzp83AVRMd7snBfIuLG
	 k3SK7Z2NVMdEW/nN2m9Og8xHGI4SlgIViQ1XItBv/0yfz/ghSNd2lVV43UQ5Q4IfH0
	 125rRzAe+CrSg==
Date: Tue, 14 Apr 2026 11:59:40 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>
Cc: coconut-svsm@lists.linux.dev, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: SVSM Observability and Configuration Protocol draft
Message-ID: <2qhv4ezvbgww22lowygw647dgcmejfzcjiqhmo2boxh3scybw4@xmzjjbxw3e6p>
References: <d3v2ljpmhjukdwnavsn436fkgtuuojkptdr3f7bh3fcqr5zayy@d7jhqsyibycw>
 <4a0e6fd3-3d71-4e27-8536-dce4e171348b@suse.de>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a0e6fd3-3d71-4e27-8536-dce4e171348b@suse.de>

Hi Carlos,

On Tue, Apr 14, 2026 at 11:38:44AM +0200, Carlos López wrote:

> Maybe we could have a short rationale section with e.g. expected use
> cases for the protocol.

Good idea. The fundamental use-case is to expose the log buffer to the guest
OS. But a lot of others come to mind as well, like memory usage statistics and
more.

> I could see some cases where the guest wants to continuously consume
> data from the SVSM (e.g. event-like information). Would it make sense to
> have another set of calls to set up a shared ring buffer with a
> source-defined entry size? Or 2 separate ring buffers in the case of
> read/write sources. This could avoid a lot of calling and copying
> overhead between the SVSM and the lower VPML guest. If this adds too
> much complexity, it could be gated behind a higher protocol version to
> allow for simpler implementations.

What use-case(s) do you have in mind that would benefit from that? I have a
future extension in mind where the guest OS can register an IRQ which the SVSM
will send when a given source changes. The use-case would be to push a changed
root-hash of the cocoon-fs storage to the guest OS for logging and checking
purposes to make storage-replay attacks harder.

-Joerg
