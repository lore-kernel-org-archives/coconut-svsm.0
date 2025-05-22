Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDB628FABE
	for <coconut-svsm@lists.linux.dev>; Thu, 22 May 2025 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927538; cv=none; b=kXJxxIAA0W1otOnaPI71SuUtKE/6aVKbRB9H3pZneRdMeiItyxP4MIUso7tj8lo4bBDKyd469SREUI+DH4j0764MQV53zKSXjAU8VOYxNyg4rqBNc0puyjTbb6rENPQevKW3iELozKpKIeLqf2B0cnoL81KTRgtt50LovJUcaoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927538; c=relaxed/simple;
	bh=555587Z0C8UP4cYYnWSJ12iLppM46lAVnwsKnuNIVYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5cYoQ12+eUfYH08ZPGCGfE1oXEtWMAluq/ER5rU52d8FeeDtyfjYiAQC1V3Kucm/ykcDmyiYo1rSedpY9CtlJBKBn4QD16Tsi/eZZOzwtgBrHbjwzfPQveByM7CsDNHl6XUj3fpR803B7KmEqD5QLRJlNxw/XxvOGLQkdXD7Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=a5HNbfZM; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="a5HNbfZM"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id EF4DA4985C;
	Thu, 22 May 2025 17:25:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1747927535;
	bh=555587Z0C8UP4cYYnWSJ12iLppM46lAVnwsKnuNIVYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5HNbfZM4pMYW0O4986fGzIp8k8g9vXUVsDFUO6msqukGRKnKavZhY7HmA5XUOaWP
	 74aQtrC9DXKOJLQJOTYSBAHtR9NEPSws9RRiBQ/4kZOjoUYz/jk4etmH1nvXQ3md84
	 hPSxXHrk5/EdUqAiibXYQgttms5rWFsGS4GC7BnCSgz0mAI1LEdSq65sTLNe2tVaas
	 XmIkQjeNOqt7hZmlQyTHZqkMYUZFPrxlL6OfxbgNP5nnTACJAihw5J1xJx7H8oPLJv
	 +mGowdK8rKWldRMuwZCDY+qrb3BzkywWHVV6OQHgmf/DFmy7+VH9jj6KN7zkex3N1h
	 QZP4fElsbEJ/Q==
Date: Thu, 22 May 2025 17:25:33 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev
Cc: Jon Lange <jlange@microsoft.com>
Subject: Re: SVSM Development Call Mar 21, 2025
Message-ID: <aC9B7VplzxWv6cNS@8bytes.org>
References: <SA6PR21MB4303E6F5DCCE81434A10304DCA9FA@SA6PR21MB4303.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA6PR21MB4303E6F5DCCE81434A10304DCA9FA@SA6PR21MB4303.namprd21.prod.outlook.com>

I couldn't attend the meeting, but created the minutes from the
transcript. The PR is here:

	https://github.com/coconut-svsm/governance/pull/59

Please review it and update as needed, I am not sure the AI got
everything right.

Thanks,

	Joerg
