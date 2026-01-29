Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED392F4A05;
	Thu, 29 Jan 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679671; cv=none; b=R1lftpaR2mPem2y13l2PHeXlBwdNQ4QN/eIJUZMW4Zp6S6/GHgUkV0DQ6Zk2wa38Zzenvt1zi6rQqxRCf5+U4K9KZH8YFH32qIP1vxsInAOV4mBq1/8cR7p7T9dYIlFyADWfHl8DWSp1m9nyXxXymtSj1Mr0PXnXH4j2V39NSZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679671; c=relaxed/simple;
	bh=0Y3cj/HWhJLzWqu8VUyjnYKi2ChOk3uNA3mLQP+R9LE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJgshAl36fTotw9KwiX+cXMtUCPjJ1rcwqf0pCdhmUfYbaOfqvdCWHMn3O4EwsTj71Zz6NvCBpTmbzrxT/rOUbHRc/pfVF9s0T+Sd3N/XOBrZ7q4S7NxDj4B1czVty7PDtVxEiRu5Frxiwj+0ao39vU2Zr8FqqyiQobYUw738ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=3Q92Nx+V; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="3Q92Nx+V"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B182F5E660;
	Thu, 29 Jan 2026 10:41:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769679661;
	bh=0Y3cj/HWhJLzWqu8VUyjnYKi2ChOk3uNA3mLQP+R9LE=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=3Q92Nx+VGCqTRfhaYQwRrJkQK4pNCIhn9hlYUqB+iQK9idNafeqXsdj0XOn3GUEbj
	 LfVDWQxm1dcep0Bpf4vE9TSI68itgJT5xiv3QQMsgjM9Cz+VA03+dByrr6EzHH90RM
	 ZGU9ybOEpQv5zPaTS8pTbgqqvgh2FQeY5VM4Aja3GEJFQGwyaLIKa1s6kcAgcQ876m
	 zR0JFFuj7SkYPEBztRQFFhZ/6AsSm3R0fV8dmcLsz7gytIBNlQXLDAC2zfbLBqdeyy
	 XeezzMhRhhv9dWMHyd1x5XEeTkfqEHoBLS7wzGu7Z3zsqXGzvX2l/YRZB8Lny/4hT8
	 vdY4u06nyH5Fw==
Date: Thu, 29 Jan 2026 10:40:59 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call January 28, 2026
Message-ID: <henxdjvkflk7ezcoyvayusypsviiiviavo6f4gc7f3jnu6tf7j@nc7sznqc4fdo>
References: <ihxnjxdpnguz4ajm44jgkldpg4oddyd6drrtqloawbuyo5ee65@c5dvv3s2g5fi>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ihxnjxdpnguz4ajm44jgkldpg4oddyd6drrtqloawbuyo5ee65@c5dvv3s2g5fi>

Meeting minutes are in this PR:

	https://github.com/coconut-svsm/governance/pull/94

-Joerg
