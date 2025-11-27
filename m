Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058C72D660E;
	Thu, 27 Nov 2025 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232986; cv=none; b=Ho47+DEQn4S/rN4fHG4LSZEt8KKleeX1luobno3dypSOgppp8VV98ldJNmG/Dtix9yzMpI7e55IjBXZN4qKMMk+vYoV+7PcnhtdmDklKWOEYFOimaWLUeIbUC1YLlPr1a6YUFNlSg141qcmXTLUtbZbLBUAcqRkx6m4sT5ViZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232986; c=relaxed/simple;
	bh=UQMPtBxhHNlDLi4WT7gl6simhGs7HQh+s6Bv8eRTYAY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRm/lau+T8O0WY4uQDfe+beMucCEbzWne/Xv9T/Wfoj6XaIMybN/uqo7yWIEadr/6FAuql1PzrBzUUXE8yJNPXT5ql65ZWo8rEaT3ED2Nftq0U0wFp8QsYHa9hKT4WaUJbdJLUmbyF1JsslNHjvuptVtayvDK7Mg6ihZEvxwt/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Qd9IOnDK; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Qd9IOnDK"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 281625C3B2;
	Thu, 27 Nov 2025 09:42:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1764232977;
	bh=UQMPtBxhHNlDLi4WT7gl6simhGs7HQh+s6Bv8eRTYAY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Qd9IOnDKLhcEtYt4/cJHWwkbLUgftCloG7bvPQENAEYsvzb8C9RepRkxO1N3usewF
	 S0E5WeeFewRoxdXf7BYEr5L/VHZkJ1rwA+3sV+PIyFs7bWMBi5MfaOCgYpUv7xhTya
	 kdLEEmCQSXZYiUoi+Zlu75zWVPC26+ArKZAnbmG5O+tyXIl1a4YIIpO3clrPFPupLb
	 9H7tgx1pUdbYQrZLs9Cp07nZ/GK4pTWyq+79hOUa7+8l3HBz7o1pTpGFZlux/zec6F
	 zlvbPfIR4xlQfl6UQmK7VoxcuHp/KHLAL1J2+1jnM/5tLDtBKTkNxhy+55h10Am5yg
	 ozzXb6nhtmIbg==
Date: Thu, 27 Nov 2025 09:42:55 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call November 26th, 2025
Message-ID: <dd3oihug25zw6zdsenimcamvukzn7zz2v7x24k5qikcbh4mlia@eomjrfimgwph>
References: <tqu2fjqbhrwsmritqthp7f3qucqljxc3ivxm2wmtdbgdrpt6hm@7qj7ocuwoksw>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tqu2fjqbhrwsmritqthp7f3qucqljxc3ivxm2wmtdbgdrpt6hm@7qj7ocuwoksw>

Meeting minutes are ready:

	https://github.com/coconut-svsm/governance/pull/88

Regards,

	Joerg
