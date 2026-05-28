Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BE02F691F;
	Thu, 28 May 2026 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951695; cv=none; b=LKfI8E19yj66KuhIQ2CvTOMzGUDcuFnTRVOyi7ecchShRlYcWYBRvOZkM9kwkJfBVnOjg3JwbrG4+w8L2kZKWl3Q7jUzcicJh3oDQodT2xMKwcPd4h3WWvEv+CHsyr2wVYR1qqHW6gtwwkzcAsZTBnzDBZuWk2yNYurXTT4NvuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951695; c=relaxed/simple;
	bh=vw5yyc4vZtXtgxQ1Eq/V5L/K9HyW0aNRfG8nZMkY6p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIXRJbue3FW8lE4G32293VjfMigBtll5emvVwv7SixVtSI9Y9JhvaT5WANwqohUiKHeqX0rHnmlL7hftqByrWyG+Djsi6VuAeX5JSrg7oSzwCqKW7IqI0I2tenwBIw1ilvRrEkCN4mRS9MHjkpfWdk3CjBgvTXcNRblf6ITWjy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc5001a5b4667a2accba1.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:1a5b:4667:a2ac:cba1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5ADC71C6014;
	Thu, 28 May 2026 08:52:11 +0200 (CEST)
Date: Thu, 28 May 2026 08:52:10 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call May 27th, 2026
Message-ID: <ahflybPgPH1Ab3LP@8bytes.org>
References: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>

Thanks Stefano for running this weeks meeting! Also thanks to Nicola and Tanish
for introducing themselves and their GSoC projects. Welcome to the COCONUT
community :)

The minutes for the meeting are now available for review:

	https://github.com/coconut-svsm/governance/pull/109

-Joerg
