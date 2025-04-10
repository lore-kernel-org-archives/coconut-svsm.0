Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74745281358
	for <coconut-svsm@lists.linux.dev>; Thu, 10 Apr 2025 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295769; cv=none; b=c5cpg6kZWGzcFSm7dkLQrWBajFXyiGS9XyvqhXcj8UZvSrdWoZGiXBUTkyBYAoQZxRNPapTNnQbeH5S9IGJ6pXbo0FFbG2j1is5uc4T3RudG3wyutZTKYM7NIcdrkpDumrkgws1N53p3QS6IddBCPhIw5yvU+uJ9xD8AKJ72Gt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295769; c=relaxed/simple;
	bh=9g0MyL4Q3C3+gbrzVXvdCEznMFCPavRpL2UXZz/Iw9Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PDtzszuXg+98w0B3CWCwbQFac12WvmaPy8DoCNx+uZeFCq+jOfUX0ZhlA2a5aksQ8Fq4/IhhrX4tWaLLnD96w78DAJ8GMpYY1qHlc2v7sS1/f5btareKcNWmAHiey6xE22e5di/rfvar0UX5Kd713qWDosKzho9rO2pddZn7FOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=GZ+PQdC1; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="GZ+PQdC1"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 22D404799F;
	Thu, 10 Apr 2025 16:36:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744295764;
	bh=9g0MyL4Q3C3+gbrzVXvdCEznMFCPavRpL2UXZz/Iw9Y=;
	h=Date:From:To:Subject:From;
	b=GZ+PQdC132GI4CeszuwQj1sxyyBJqJynoKZvH80vfBltWtwZ8+anozyNG7WLqyM2h
	 WRCMygn4QuVBa3m/Ufyo51624/62fv1Wvmv0koTXBe7aPtghKH9rD9Xr6LTL7A/Qy8
	 yCbKV0Ih9TP0cMhRSHtUWnU0r/g36K6UzKoV7vW2hG55bhKmUhTsr/HSYs9SpOQi55
	 45xRJgwtuGC2UR6uL9T0+NppPRv74IB9ZfrlmARer6q3yU2GCyNv60T9qvmdsuljuK
	 hkCc9PVNGn6vwdVsVwOb+xCq0wqSRvnyjj0IjoQCHEi+AgSS7lPU2Gz0zzOxB8Pxg2
	 vDGM9JVrosJ0A==
Date: Thu, 10 Apr 2025 16:36:03 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, coconut-svsm@lists.linux.dev
Subject: New COCONUT-SVSM development mailing list
Message-ID: <Z_fXU2Wl7xrGWOd8@8bytes.org>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

As announced in yesterdays meeting there is now a new development mailing
list for the COCONUT-SVSM project. The current list runs on mailman on
my private mail infrastructure, which is not really sustainable as I
have not enough time to keep it running properly.

So there is a new list now which is hosted on lists.linux.dev. The lists
address is:

	coconut-svsm@lists.linux.dev

And the archive for future posts will be at

	https://lore.kernel.org/coconut-svsm/

The subscription process is purely email-based on the new list. To
subscribe, send an empty email to

	coconut-svsm+subscribe@lists.linux.dev

You will get an email back which needs to be replied to for confirmation
purposes.

The list is also documented on this overview page now:

	https://subspace.kernel.org/lists.linux.dev.html

With more details on the subscription/unsubscription process.

Let me know if you have any questions and hope to read you all on the
other side.

Cheers,

	Joerg
