Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116FF257848;
	Thu, 22 Jan 2026 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086558; cv=none; b=idcrbv0E0YoQdytxKpQyIaaf3tT6O8IukeSzNtgrKyEOrN0H79dTN0sOAyZl/qjX+fdG7ZM7KUdnTQdptuFkU3hd/2ld+PEEpm0J17/tsHrXRZYOtHMROyu2MZOlDiaUpxWi0fM6bWvmt65Qh1Fo6Oq3sGB9Bt2UijEgORi6DXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086558; c=relaxed/simple;
	bh=5fp7Q4w83WlXnJQa/r3ZAnYhW8iQEe5ej5Mz74SSNMk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWCp03dBtkOl21qP+24+WEkNLFsWTCa4nK7ZIWtdw91E+Dm0hhVeyweDoEl0arO8mSFJpmP+0y/KcVUJOwjO3QkiLVhds16k7lBZIfjc5cNSZ6cVKZRl0ClJmZYm2cai5NtC6uMSc+J4HKK3R4sIJ28ylk8k/lWLE74KT6raqZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=hYQex6cP; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="hYQex6cP"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9F81D1C0483;
	Thu, 22 Jan 2026 13:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769086554;
	bh=5fp7Q4w83WlXnJQa/r3ZAnYhW8iQEe5ej5Mz74SSNMk=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=hYQex6cPWn68rVtgzyCfMMb8Rwu6Hv03NY//fR6zxwKY5Z2V3FDeKqqIvf57+ABzC
	 xHukZ03Q5gJgmGgZT0kya0pROKIbxJVvthmqjDeUGdgOBGMhkYRUNss2zSPR56hafD
	 qzHBsPp9/MB2O+Hp4+69Pvm/29txW0ogGW53hNKnddzcGI6PrNecPtGGoUl7euiWHo
	 jgF9cAasCitAKz41uXdZWWT1X08dbDaVYg/UoPgFucK2EhoSAzfpNrmtgP669VQLuZ
	 lN1AsWe+aliJ35Gv6hCphTOLTK2Bq62Vd5YN7p8rYcqBtCmVfyyLy3+Ez6KyfISsN6
	 6NXvdEl9LLXTA==
Date: Thu, 22 Jan 2026 13:55:53 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call January 21, 2026
Message-ID: <l2torsojcg75hhwb5mn57sfmwnsbygbacmlu4n35s3hfrqbyr3@z5rhvmdjtypo>
References: <4uhsm4wvzsoto4e6koyccvsdqcg2pber4s4oexclhywps7pz5l@tpkfglmsge45>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4uhsm4wvzsoto4e6koyccvsdqcg2pber4s4oexclhywps7pz5l@tpkfglmsge45>

Meeting minutes are available here:

	https://github.com/coconut-svsm/governance/pull/93

-Joerg
