Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463B6202C5C;
	Tue, 16 Dec 2025 17:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765905481; cv=none; b=TWJqAye6ND8T2tkfs0No13kkY9ckXf8L2bqONa4II0wfyfObg1wmcoeuE4jclG6Dv1igI+8OONFdaV/g2EbpopDslIGjNpBBV5xf1xNhpabHvgaqkUtIzdDqLMtkULkvh83J6S++DQsIYJb5OLi/nTmOciSfnq6Vog0JoxALu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765905481; c=relaxed/simple;
	bh=hHuVkAdAn8/iVa3A18lrrqyCSHqAWdZHAP510M4SrlM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pf99WacQ5OI6n+P2LnjK1GLHQyOF8B88Q8nhidhNgcmYCp5e9Xx+F930rrdT2VPHlvPPynBgPBL01dICQlRLl6O88cYFRWbQ18NgmLbYzJP2DobD8ZHOQfOr5tDAOv4+I5aHz303JJhLCj8EYQipaUHsGrI8LpVv69HsWS0PQgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=l0c9VlwB; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="l0c9VlwB"
Received: from 8bytes.org (p4ffe00f4.dip0.t-ipconnect.de [79.254.0.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 721425D675;
	Tue, 16 Dec 2025 18:17:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1765905471;
	bh=hHuVkAdAn8/iVa3A18lrrqyCSHqAWdZHAP510M4SrlM=;
	h=Date:From:To:Subject:From;
	b=l0c9VlwB31n/0JN1g6QnKjBsIWIj4lZ63GSLNmJG3AdDMWtVkW+kBhJr7x25Sk1Km
	 UoFwV2r8f+jTHRImcm8l6WXHbzgmaJV0BMFgXmEW+yr+rotzmoPdMBqrCilPLenz4o
	 0UFGE2Kn2zt7LWPonep/0z6nM4mvvD9nKU4XvapQlcYvkBeU7tfioGmuH3NS7YSxfY
	 cuksdZbAn671eyeKVhGMAynsujx7Ho4kYFJNr5BFsNCtq9buM5Nr/jZ8T+vWk+ZE7I
	 MnmQmcfGNQ2qODd63rhOHYB5sXnoZ6icxLKPenCdJxNcxERDfqDCCZ1mf/AzqBlHmN
	 HCtJxQ8YWD83A==
Date: Tue, 16 Dec 2025 18:17:45 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call December 17th, 2025
Message-ID: <wr5g22qmztj3mqiiwzxvqw22tdypqtu4rd7biwcbrbvv2m52o5@ok3fldp5auo5>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Here is the call for agenda items for the the last SVSM development call this
year.  Yes, time runs fast :) Please send me any agenda items you have in mind
or raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,

	Jörg
