Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CF038F65F;
	Thu,  2 Apr 2026 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775116455; cv=none; b=KY9slMxMMpVkkO3FzGVVoa86J9vC6Qz+YIy/3j9ItNH8651ZpjdMlfZnRkWorCZVuSekmHYwxPVKGpcSvdv+a2+OgLMfcY9SYfCDsAwozeBZ38OZsPM+EJDwqMbpDNiM4AJle6urBhQsSy1xPcyQm3v+ENbVrksCIp4SPQzfWUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775116455; c=relaxed/simple;
	bh=jbvG1JZSwkf3Hb/0x+HaV4Ab9Vw4WMJqQO6PboG6yQ4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgiZ6HrF/ahv6w7togKNWthh6gNgkWVpN+N/X5cGV8zMkQtPIcGDRndxNIbC6of8A3e88vH4YlOiydeVN6qOB3aoulFPCYvpsY/nJMAKQR7p2Sva43QDRA51BOcsft1jHVtG5gADtwdgI+rQkip8dly234UNxqXak/UJE2qJwGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=l1V+NlwL; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="l1V+NlwL"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 630271A70EB;
	Thu,  2 Apr 2026 09:54:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1775116452;
	bh=jbvG1JZSwkf3Hb/0x+HaV4Ab9Vw4WMJqQO6PboG6yQ4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=l1V+NlwLevKS+TBNX1XiSYtXy+XLOzxiWhpuIdKti10HiX7dxov0Nfb2F4A5lgC2b
	 seh5NkIQIWGL/l1pply4x5dYZR1HAnMlJ6M+zDftNRH3y3lzOub2EdhMwA9q2TWOUx
	 2+yIOnnp3QQvPS1H5+Fux5EvRf+67MGLIYDFApzn7jzscHjZUOHJivigQLKTCaCSn2
	 Q9jbJb17yXjPO9YHuzCvIja21rj4lRufenQ08fC88fq2p62Fz1XAGZ4r1rEmwLEcky
	 m5f2r6vQLiMW/04dI0i7AKlVtMANZQcxN38Sups5X/QztAxjFuNLATEey5265BpIc5
	 849QZ4mwY2l0w==
Date: Thu, 2 Apr 2026 09:54:11 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call April 1st, 2026
Message-ID: <ntxedc4hoxcjfxwlje6ruvilutbyqfoespwert57zrz46s2rhf@anige5szzjsv>
References: <lbjylrvih3qk4irnbboktpadie4ldtqxzwyqarqubyvw6zkouw@j7kjwm2jts33>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lbjylrvih3qk4irnbboktpadie4ldtqxzwyqarqubyvw6zkouw@j7kjwm2jts33>

Meeting minutes are now ready:

	https://github.com/coconut-svsm/governance/pull/102

-Joerg
