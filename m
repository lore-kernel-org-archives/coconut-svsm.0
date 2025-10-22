Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4100534321A
	for <coconut-svsm@lists.linux.dev>; Wed, 22 Oct 2025 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761136093; cv=none; b=IE2ifQrYiAjjpBrv7P90RwrcRKMeU01l0LH18CMWwI9onB/YGEOIYKan3s2Ua3H/2ELttGhjBHakClZGmyR3C8U4E9QIwgwQsXf/Uq9xhq/j4qDAVPVJSE+7xh9tIchaOPxprYRAOuriUBBvlNKshtlwaQ1DarytYvRPFJmPBKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761136093; c=relaxed/simple;
	bh=CoDb2qyZglEOaFTMZSb1E4Orn0TdufJPnR97WdztvaM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAJG3mEaNxDvXdnFKh4P0X3ZEdMBWjiTXH/HbEcduSW31h/XyMWTAIxyLu82iGeFTsz7FErhJbNHQTtX0JFamoph8LYSYR+u5BmL6Ncjjp6rdcmOsxEV95FFsvh4MyXP0KdHutHBGF77kjNccHdK1KGMxcpEsj0VbgaYZDTZTqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=yeQl9/hk; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="yeQl9/hk"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A79EA592B7
	for <coconut-svsm@lists.linux.dev>; Wed, 22 Oct 2025 14:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1761136089;
	bh=CoDb2qyZglEOaFTMZSb1E4Orn0TdufJPnR97WdztvaM=;
	h=Date:From:To:Subject:From;
	b=yeQl9/hkMaEpkZhjp4NCB6gckhw50Z78SFZqdbV9wB7ejAXgrxGrTnIpiMDAwmdxS
	 FFTAsYUnZ4AQBVwXW6qmLO6/Rv2+QMQXw0fAfJBFWCmKAetvkFI/slo5l6cDDW20RW
	 nE1fXMKjG7FuMl8vBbtJNSQNgtPYy3vXYxhG7yL1Arb/7t5HWBBSpt5ybr9NDD+g0x
	 K2rVsjd9KCeRi6MiXLGMY8nJzrR6yP8zUFeRA/nqXtobj4VAFlT0NPnMThMlgHVfS9
	 oG4qXc3U5m6dYRHPsF5gaPJB0mrtc0+pyia5gcBJnxekdyrx7JSfQtgxvrYjnKsaAQ
	 x2iq7qZ0tnEhA==
Date: Wed, 22 Oct 2025 14:28:08 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Subject: Cmake mow required to build SVSM
Message-ID: <gxjzvvqhnd44hxepyjarwwwum7zvvqfakvsfd5spwol7zcx2q6@dop67hjrxoka>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

A quick heads-up that I merged Stefanos PR[1] changing the libtcgtpm build to
use cmake. This means that from now on cmake is required to build the SVSM with
the TPM. Please all update your build environment when using the latest
upstream SVSM branch.

Regards,

	Joerg

[1] https://github.com/coconut-svsm/svsm/pull/832
