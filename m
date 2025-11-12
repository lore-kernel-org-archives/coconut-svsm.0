Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F7A2E8B80;
	Wed, 12 Nov 2025 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762985016; cv=none; b=TlRnpQsbThDnOFnqaUHAUz/MNv38H+Myn3VtyK/ttXVrYfBdmGGteECKUVLtFkXJoHolFLnwJjPr4repljx37EdWawQ8QKHt6JMDJg9/UYqRL/5zeRvh82/fk9d/mhaTswvNrVyexZFw+pSy3jKhN8GCUL+IBKX37bjFEb94lCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762985016; c=relaxed/simple;
	bh=yKV8TJsHnx35D9JEFF1IPTZAHE8WaPXIxtWuhKVspfM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoNVc4FMWM1qaPLBuaa4kK2umGYR70kSMoO0uqle49fqCu0BYUMO7BDXDaJRkD9jGSFvb9kkfRDXyWLJGt7JGqjrE7XNmWpGt5jZMu4aHsGzWar1y57egMoHX/KFD29mqMFTXjjyGfET+EDITfvnaq7ao26EWKHKP3jPhU3z5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=gksBj1uT; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="gksBj1uT"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3059C5B215;
	Wed, 12 Nov 2025 23:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1762985013;
	bh=yKV8TJsHnx35D9JEFF1IPTZAHE8WaPXIxtWuhKVspfM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=gksBj1uTEmLqP52xQEmJuSZMY6J9kGQ109024ik8QX5IB7tu/Qwc6vnmfKHELphF7
	 NKbzTHXRLdDHlVB5nZPpm5tQ63OoxovLJtS4i1d3kf8pm7L/D+sw/8nX1OapuYU4eU
	 L4ATDtN4+BFjAeD1nUF72+gJANE4bG1SgPYwZ8HH9uDu8FT6vpCjPxZtjZU2hZvTcb
	 iJ9OCdoOE3BW8QiSQ9w6W7PbL6HWpFrpQTAPVAe84UCcOrbMG4k/uIfeOzblDLcjRS
	 J3W/3pR6y6kygSdV+KcdgyEuY44XpWSOEXr88NyCz8s7yjQp1je2el5VY8vFJQ87K7
	 ehCBAhUt5v3OA==
Date: Wed, 12 Nov 2025 23:03:32 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call November 12th, 2025
Message-ID: <bu3llkybpmpazfuqh4yniw3lmxn6rrnygr6azihihrmfqx4j4k@ki2edzq25bko>
References: <s5lzpd7oaqibweihjmqidr6etqmw36avgvvz22htqly5jbqiqh@vqzp54r5cxao>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5lzpd7oaqibweihjmqidr6etqmw36avgvvz22htqly5jbqiqh@vqzp54r5cxao>

Meeting minutes are now available here:

	https://github.com/coconut-svsm/governance/pull/85

Cheers,

	Joerg
