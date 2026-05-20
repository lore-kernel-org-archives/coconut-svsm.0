Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B236409DFD;
	Wed, 20 May 2026 18:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779302680; cv=none; b=aGDQsADboo9ZHRGAuVaXBkQdfbAYd09LKrXv3uqB5cmuRXAo/ybzGlHEdr57YMa6ny7TUNTdXi9v25bodnzLjkq0IcNlJ6SsBAJZZLfyVhZy/pExkAgz3PX6sviXxXVBLHPvbGhMhjN583pAcCCLv4qYwpOJ88+nCqED0LsaMVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779302680; c=relaxed/simple;
	bh=YcP19AjGFs1lomfN4uGdrKE93pdb8gOwSSIeZni3Spk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWG44WkuTEWOz/giA9Q2aKU1Nfa7gYlA8E9S+vEo7zbgszUBzj4oPSd/1mjwbgFSWb4lbwcTel5b4GZokM0755BrBf5fqb1NN2JSHYcZ2XvqJKQFlMBIjfROlnb6ej/3m6vgFlj/5uYDtC8OEGEOSCOjz3/ETi24TCc8CYRBkWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc5008df6ef379d115b91.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:8df6:ef37:9d11:5b91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D8FD72012D0;
	Wed, 20 May 2026 20:44:31 +0200 (CEST)
Date: Wed, 20 May 2026 20:44:30 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call May 20th, 2026
Message-ID: <ag4A9lUXy6AF1L3z@8bytes.org>
References: <agymbvQiKu17pQnQ@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agymbvQiKu17pQnQ@8bytes.org>

Meeting minutes are now ready:

	https://github.com/coconut-svsm/governance/pull/108

-Joerg
