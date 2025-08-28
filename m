Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A9630CD89;
	Thu, 28 Aug 2025 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756365410; cv=none; b=RVlisWPoufokdyJx28mPw1e01i/CFqu6KF55xbKPn3b6ZvzYV8OgeL/fGJEzUTDi3tQb42Z/yi41eGeRvZukhU7Mx+aFKGHvPdHCtUnjTFruQi0lh0oALbBV6wzLX44RqzsrZKaxxCDVOhANNr1zCpx+4e5VRHp8SWpm0BWvwng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756365410; c=relaxed/simple;
	bh=PLzaRGJ6mRKqrv6xyVLGG16+fbDVMjGM7jhnw4KS0Jc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsuUfDQ2iAnQvEI5l+UAc+KqoWpAn7++mgE3R0JyXwjGLL9DxEUhfbWIPFnqwOWLyN/a+Yuy13ova2ICxuONRqVL4nUu6a938hWXktUn2i+y5LSiPs+DBMj3ebqTWyZsTcFRf9ANBW3/qSxwgs8sU9snMFkadOCqD49ST9h9wdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=CZI6sHF+; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="CZI6sHF+"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9378D4F0FB;
	Thu, 28 Aug 2025 09:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1756364982;
	bh=PLzaRGJ6mRKqrv6xyVLGG16+fbDVMjGM7jhnw4KS0Jc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=CZI6sHF+G+o9XQkIOINtDipIHm2UyCkuOGngn9tNDeBiQOahFKNvrWPF06CUrt9Rj
	 lF++w6PV9vCrEnIDT5V6qupWiU1r2t/HoJMLsuWSilR+3NVAQjkGRplwSmBl0MqHAc
	 YMBJwel4KZcK8JPPR3UWqMe5WzFlE3bD7vm6cfT0/kfyZWwnYX4mUYpEWgkNTEX8mi
	 GPE++KaiJ6QacuJ6jlehbQLGXj3sE/hQXIJJM1nDtNCSkevmnrVEia2tQjw8re8MEi
	 7zMrTZA/KgYmPzgA8zKzm6x0gu7+UpV7M7tN4SfLC/dI0UDUZ8ntC/x4fc/euGRr8U
	 MrXdE4JOzhrig==
Date: Thu, 28 Aug 2025 09:09:41 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call August 27th, 2025
Message-ID: <iex63fc35qpfccyd4ih6jorlgdelwey33cbmupfqrthxqis7lo@n623bg532rmh>
References: <aq6ugh7c7nuqefyfxzr6aa7rdctpgoszbnrgcbd6q5w2a2zvd6@ufp2xxxu4ibi>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq6ugh7c7nuqefyfxzr6aa7rdctpgoszbnrgcbd6q5w2a2zvd6@ufp2xxxu4ibi>

Meeting minutes are now posted:

	https://github.com/coconut-svsm/governance/pull/73

Have fun!

-Joerg
