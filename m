Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E3334B69C
	for <coconut-svsm@lists.linux.dev>; Wed, 21 Jan 2026 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006529; cv=none; b=YQAugiweCpx5lzqNRaNp/rp2PEIAu+n6XkdxgZFm/bvWxTCXqr3KTmB/dAsgPabQ5D14uYKij/n5sakgH419gmR6JisGxw1EHK83NtkZXp21ww3HMmym8I9oCp2JQJXgXpRz6YynESsfo2xWgyQxeU1aHPq4NJCYVaMVC+0nC3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006529; c=relaxed/simple;
	bh=5rNn358Esj735vKL76es9yODfmIPYzR4nCwbiRxt+NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gkv/Ape34rnP7BwnOQ/cSdgPZJEt9uXOOXus2voag4i82qrs8cuz4fivX3Z7XkgtAOmEv2bcAX/vAfUb6/dPRsGUQh7fqVMbuPps6+XemvP4FVtmhqBszJhnr3p3Q0oOHPMeF3pzrKzFlrod4q5ucwzVQVPqQGybDcjSYWD06tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=4RKS/sNZ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="4RKS/sNZ"
Received: from io.home.8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A9B4A1C036D;
	Wed, 21 Jan 2026 15:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769006524;
	bh=5rNn358Esj735vKL76es9yODfmIPYzR4nCwbiRxt+NQ=;
	h=From:To:Cc:Subject:Date:From;
	b=4RKS/sNZzxvAnYav6hwZAiPP/UtBYsLMFd5Imoe1PkdsSXvyNF0Ho8YFKDupTIg9j
	 o7Pual7itJxho152rVdXerqxyWV5uF8MuatobOHkHgVjMpx+W1SgNshgOuNe5Sc8bL
	 Z9Naj9fyKMXIa9M1sqPzBYi7V8jyLfgUW9HDIXlBGdj1d5OAIeAJtKJWSbSu9eeirI
	 wDBxGPFSGDxi8RVSNCF4RUH2EbBsMnwI+QfxvMrKTPxTE1HFkq+t2qVzp40lzaKWrX
	 CQlFUY4wlXp7uZzGAWW3pUBS8qFP7kKMjFsTY7N5WzWIk5EVeQ4snUjjl9K7UX8etA
	 oTt6tAFxcYHgg==
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Cc: joerg.roedel@amd.com,
	=?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
Subject: COCONUT-SVSM Google Summer of Code Project Proposals
Date: Wed, 21 Jan 2026 15:41:49 +0100
Message-ID: <20260121144151.37812-1-joro@8bytes.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey everyone,

in preparation for the SVSM development call later today here are our
current proposals for GSoC projects. Please have a look and provide
feedback as a reply to this thread or in the meeting today[1].

Thanks,

	Joerg

[1] https://lore.kernel.org/coconut-svsm/4uhsm4wvzsoto4e6koyccvsdqcg2pber4s4oexclhywps7pz5l@tpkfglmsge45/T/#u
