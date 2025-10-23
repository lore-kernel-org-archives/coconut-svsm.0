Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897222F39C9
	for <coconut-svsm@lists.linux.dev>; Thu, 23 Oct 2025 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209030; cv=none; b=Vx81yWStosPGySqpD3LDEMEBTFzgBtdhDS8eWTTs0aYEAkkh21wrSaMdwjwZ3YnVzReBgvIlA0PoTLagMKiLwbAeHsalp0Wm++nT68u4hUsa5CXL57Rp6Ye3+uJyIHn8fRp7BKkvOROKn4O5pPrLfzHKQqp3lXRN7W8Hw3sb2XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209030; c=relaxed/simple;
	bh=JJWhLV3tmgwNMWYlAulpTZrgyQz6exViiK2ON35BCsI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhFbaQ1Lt/8hhg3FGnYEVClUbRY48pv1K65FYci85KlpREi8r7vOzANusAEOJJZZtNg8Yijs84Oyi+WZf61fXcyBzVBfE2++iNV34iyASX7CH/r2E+96fiPFpt1RVbxQa6wZh4+rBrBqwV0jUn9Ds//MM9p6jhSmpAXp+MibMFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=bbv1GClP; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="bbv1GClP"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 08F345557A
	for <coconut-svsm@lists.linux.dev>; Thu, 23 Oct 2025 10:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1761209027;
	bh=JJWhLV3tmgwNMWYlAulpTZrgyQz6exViiK2ON35BCsI=;
	h=Date:From:To:Subject:From;
	b=bbv1GClP/0PSWmvANXcAL3qYe5F57kx1pjajktpxaoUSMaelwidJYHzF/9EBcJEdL
	 GIdVeOcsIqpM/ahR6mPR5Im3kUflCdOebeRpY0WelOd+lb+pahv4EGprgd81/K+E6B
	 C+GmPnEVGyqjh/1YN/5hIpryfmcBhqenD8rq5sZom2tUybo36QFWYhXZ5i857063te
	 wXSuCGt+9EqgOC1v3phrjeZru0M2y7bpXczQiZ8duhd33dGGg5uGjL52K9lL6JBwGQ
	 /4eIDSmumMMkw4JSxH0UM9eqMbfuZ9ddummDcaApFMKAHFgwNYL+uRBi2DwnF18yQY
	 L0nRB9tGBkXaQ==
Date: Thu, 23 Oct 2025 10:43:45 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Subject: Project polcies PR ready
Message-ID: <yfmpm3og3rzbivhdpsubh5xv4zhpato5vanlv35qplxqxvs3c2@yinxdjvjnvvi>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As discussed in the SVSM Development call yesterday, the PR with the proposed
project policies is now posted here:

	https://github.com/coconut-svsm/governance/pull/80

Everyone in the community is encouraged to review the documents and provide
further feedback. The PR will not be merged before November 3rd.

Regards,

	Joerg
