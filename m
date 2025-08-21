Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0277828505A;
	Thu, 21 Aug 2025 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787349; cv=none; b=ck8KqKc2bSHYVED3b8QGHx9LDqscDkoMyv7kMFNb6ChEDGA9jwcIvuBYa6fIUYvoEyu3inZKKzyGYQK+iXE7JptkGTbt4zrgwVbZa3JW7zEGbBpMZwHLDJaPhi4+oVO80fPNZpovY9TBAJcpreYMyrU7v5Tae30EMkJEao7f0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787349; c=relaxed/simple;
	bh=B/4tIOjKyq0Bb7ZatdYbcfK1dYUZdTIvYe8ANvAbNQ4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSm8HvvmfLbQOmoS/fCLJEpCC/wiVxCyveCu+mcSPlFTXrGU5/ohhyElTdsC5V4j/7m4MCMoY3QOAdJgGAjsrAVtK2MAchRN2veV3zqvRZIXdXMSePnwV0kOPOuhyJq8YhAyTolbogkaiufGtzhBhM9/IhxCs6LGISRaoxbm8yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=FJLvZfxT; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="FJLvZfxT"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C931553538;
	Thu, 21 Aug 2025 16:42:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1755787339;
	bh=B/4tIOjKyq0Bb7ZatdYbcfK1dYUZdTIvYe8ANvAbNQ4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=FJLvZfxToI/tGAiLoRVhPIC6ENjW4hmktlttrdgdSg3eWi1rZaMsp/404KreBGo+M
	 HYyDrJ7b1BgdJwlSDFDKjEieLxnhK3CKZGcN4dy/5ZAwX2M2tm4EBNffj2+I0YenG3
	 xs2DrO4EoUpG+LsmPAhuXlRwgp/ulTHjPnxfS+tgpcuwkrhKgPatdCVIa7bteWifQs
	 jGxYt4c1kR6GjbOZmxkHuIqPBBwLD1+qryn8k+F6c0/Q6CIfG2bLuEHVTQi9UkgQ4C
	 aokpteMrpDs8TwmuIOmcd9OlaIaaxVAIezi/kzsaInz1ED9MiVb7PuceackoZR5RXo
	 4XWtZeH034nAw==
Date: Thu, 21 Aug 2025 16:42:18 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call August 20th, 2025
Message-ID: <gtyh45cjzvvwn3xg6ch74btd55y2exabgojfod3n4j3cthx2iz@a7o5gsdxfbc6>
References: <jgt3qc2rgjz6e5l5g3taplmvmdrqyr7bwcspbxgwreugj46wqr@p5lizfcaslrp>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jgt3qc2rgjz6e5l5g3taplmvmdrqyr7bwcspbxgwreugj46wqr@p5lizfcaslrp>

Meeting minutes are ready in this PR:

	https://github.com/coconut-svsm/governance/pull/72

Cheers,

	Jörg
