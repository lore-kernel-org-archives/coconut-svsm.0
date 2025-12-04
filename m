Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCE2329377;
	Thu,  4 Dec 2025 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764837784; cv=none; b=gdofa1ZFOOeClHxVQmW7CoAO+tuvdUkyjgKsyE9Zq3pbeh837nk6PzlV71CqbTPE+NGuiJLus9TAAluR5WPAODwQ9CaS6nAMc45+AxLNkYkSkJjP23xvi+d8DMXA4lO/zAB8yoRbAkLEIADqJgxUyTI0rta0LIquX7G06lLUeIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764837784; c=relaxed/simple;
	bh=QlD6M2aw/n3mE8M9mDbO1n1UIfYGsMzLLX3pT23jvf4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+PtIY3kdMONMCh/tPZ8NxEyUlOaFzX617NdvnJ84Ni3NJMN0t0jHFDS87a2qaK2x2JujLKMpZYLhox3TxiOP4P5GWAfUUWAZsobZUDA2gZUEhoRLGBKI0xg/+qUAhZbinM6ktoZXzvLnKXe0/0qIzblPoV4tRJOa+3Wc2aL2H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=7fuWXAl7; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="7fuWXAl7"
Received: from 8bytes.org (pd9fe9b10.dip0.t-ipconnect.de [217.254.155.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4EEC15CD41;
	Thu,  4 Dec 2025 09:42:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1764837774;
	bh=QlD6M2aw/n3mE8M9mDbO1n1UIfYGsMzLLX3pT23jvf4=;
	h=Date:From:To:Subject:From;
	b=7fuWXAl7GG6MWSBAUIsuYyQqSxkoe8DKAmuYTOy+ytkPUqtQU0+aPcVAwlafZgdg2
	 b7CbRPASStyEcLSH0allTKCbgdqUx+k5rQnJl4pXWS9NJ9pulToSqO+L0jJrWvqSwi
	 n6jR+KxSIeIkUTvPqB4TKfO3lds7NvP2XYBQjld0GNvIT4Ip2Id6nbQtk6PCQy1klW
	 kNL0JdCVOAbOy9K+rCezrFjDncYnoUG9OQSae3WIZObIdbV2NqoCUm3fENyfpPbi8C
	 wWs+iNcTtyEUx+S7Awpr78UGoBaEH/el3Oop3DnRwzBTpxQOA6okMFWXhOhHxhNjiN
	 wGE984I3FLseQ==
Date: Thu, 4 Dec 2025 09:42:53 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call December 3rd, 2025
Message-ID: <iictbx56hjjtndzjaaca7zortptodwgtxw3wojot3cbm577hsr@vrcdtdwilrku>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I completely forgot to send out a notice for the SVSM call yesterday, sorry for
that. I am all the more pleased about the numerous attendance despite my mistake.

Anyway, the meeting minutes from yesterdays call are now posted in this PR:

	https://github.com/coconut-svsm/governance/pull/89

Please note that next week there will be no meeting due to a lot of people,
including myself, being at LPC. This means that there is one more meeting this
year on December 17th before we start into the holiday break.

Regards,

	Joerg
