Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051EF3ED5C8;
	Wed,  6 May 2026 18:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091040; cv=none; b=p4qX4HNh9mWYyIfdhtZb5hJYABESje6baLWcjVqw+T4YGXo8rjZnBRRt3xBzlzzcvBqPG7gkKmrAvgAIZ+r8MlRfxAPV+yUkuMPo3XNmoJNIFNDnbt5TlA/qpz6k0zgHdoRGciU608WTfUKLAK3OBV1PyXlx+ybLGU6AkbsGSmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091040; c=relaxed/simple;
	bh=ZciV7bQb75AMsVMTw7H53gtnooErPpYikJFhrZM526A=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcHZMwQ1GLvQD3AsghpTigHeGXi42gm+lIFLzvX9F3OeKzv8XfFy368viRgcBfqmRk52vSI93Ocy7I+RI6mzncbwfJZXJhTELpHi2YQ8M0Cvn8mj+3lvrrctR0dTkuOSxbHbg9DLYjadMnZozylPTTuOEcFZTLLtogUSQdamPkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=zQhh/w/e; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="zQhh/w/e"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 13F1A1C3B6D;
	Wed,  6 May 2026 20:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1778091032;
	bh=ZciV7bQb75AMsVMTw7H53gtnooErPpYikJFhrZM526A=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=zQhh/w/eRnPxDBh1Kfgr/fLbfLewVhmWpcEN0+v2eizULRx03odr5lXtbaPBWM/NU
	 xSWcX3KNBflvhlQHCsGWzjI3MN4x9OeWcXLE1SJkGxFll1YxAHIgMaCtt8kUPyt6zA
	 eFTV6pyEVbtkoFjuoK+1ey2thUUX7dGKeao7FJplkSbBIE96BpGKBeywW4huFq90bw
	 gwLQMb+0Sz+cX+yOhvksjJkCDdg7QvLFxzHTJpAIQZrKsljbEaEtxCyaHbtAn91dsG
	 mN+X7EDBFeIdps/39FVxXStZkEfC4hsp44d6TwTkSB4XOZvN3OBYAj6F07fPZKx+w1
	 2x392pBlVixHw==
Date: Wed, 6 May 2026 20:10:30 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call May 6th, 2026
Message-ID: <wtivhov5xdqrdzyx3puviq4avccr45rahjo4slbii3ul255hwe@33ue2eb3jtlj>
References: <45x7yirnjkd374loz5ymizxdyccuytg7rr46jvgh33gl7c2xwo@vps5xitk2umx>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45x7yirnjkd374loz5ymizxdyccuytg7rr46jvgh33gl7c2xwo@vps5xitk2umx>

Added meeting minutes to the pending PR from last week:

	https://github.com/coconut-svsm/governance/pull/106

-Joerg
