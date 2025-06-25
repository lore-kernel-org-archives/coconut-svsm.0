Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B3E29E115
	for <coconut-svsm@lists.linux.dev>; Wed, 25 Jun 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866348; cv=none; b=S+uHiXLDtxbCuY/LwgRds4Bq4DWZQUONjTLScMOzbJ81xWztSNXpXOAnPvDsmnmw2P1KpLLbab7Ez+xaLQV2r+dHk73xRRdpr7tW+J6keteKoUf6Jik1m2gvgLhWsuxO5rfF8B6ev+XXBD0zhB3TqPhMVycrBgzS+mgL781SRi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866348; c=relaxed/simple;
	bh=G16zJpx2+4+ckGIyMFuXTVn6xKtqE4gXqUrwqWcxilM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZRsKBmyhA0Dl86qREYtFB+vwldZlNRnwcQSdZYclG+I+A2pGDPqHMKUsky1G4dstv3eIIABzxRYkChXNpKCB0Vq3yxaIJLgrj5Tz2ifL11VdJ6CSso/d7TakRHjAwq5Pn5V+Ko9zuple6P9bCdtlobQhW+TJN1VLBNey9nj8PrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KahebLFW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KahebLFW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso2783405e9.1
        for <coconut-svsm@lists.linux.dev>; Wed, 25 Jun 2025 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750866344; x=1751471144; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OzdyeiNRs5SlJL4/mDsI/yOCB6pV7VqrpxyxESO6O5c=;
        b=KahebLFWZqstAdYVBeLJnQBlAowRBVQWu8A1zKUrm0Mojx6ptOFQ2VqE14dmhBOYOT
         01Y4n/18sOxCRuWbDO8mIqSVDqZgl+S/Q03Tboruy7X0xn3qjPr+ldfnIO4pnlMoZGMi
         pgCn5LvcmaLz54VeXcPGiOmeAjyyjPxI9WFl4NZ5DU1wO30zm6I6W29Ri0Sq5Sj9WTYa
         RXdpyvKvIoyhzFL3dfU9UpNz7X2coCM/hMERDmqSiLXJQrMdzBfyu0dW8NnNYY3hCl4D
         4BNu7KI8h3Jli2f39JDms71NNWattCoFR+DF2k/Q2BpV3SiiS1zLLUzlkta1f0ZXAyHv
         WoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866344; x=1751471144;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzdyeiNRs5SlJL4/mDsI/yOCB6pV7VqrpxyxESO6O5c=;
        b=uOpuZj5NCPN5pWQUien0k0NkS+sLIK2QlENf3rr2111//KqTTKX7L8TS/I6PsZFt7B
         WW3myX+KgVb0x8bwBMcCYRgXBEBooEvz3vpxwk/tB0Uy+S1JmF1cTGzVRS18mfpcdERw
         CS7eJXK+ULHMr2FgZVHZC2GIqR2EYjEVIHBfHmilJll+XtTL5rf3Yo/+/tGjHF/EWNSm
         oauWlN10T7fZ1QilBMcFeYbNLk4C0VjopnPRZAcoYs7ZJvkk6fmvwuF1TcZALM9o2tf8
         TdFrOPaj7WSfIMmoRy9AMmeyrzZ12oBXD4JELu+vI+uz98OAXhfLV3rDeMMwsG//9dM4
         kM4g==
X-Forwarded-Encrypted: i=1; AJvYcCV8dPQMXVXY6ws2PhJ4AC5c+0Tn2+3HwRRAAKoj7cPdC7tDe7Bl1DUtCkEw87VHFxQNX07+O22C8Kt/cHE=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj11BMQmW92/ppJWY4XMVpfCirLWrWBUgdz0rwxjwDKqqTbam0
	vu8sjKrOoRQBT9mARtxEgPDIgMbkiS4sX6dB/rDIeJEWWzzBjNFEtZc8uoHI7TtyK0Kqhoqj7AU
	vCLyl
X-Gm-Gg: ASbGncu4yDJSkSumJAilQZM9vCCGBs/STqh4pHeOEOO09Ahp9xz9jla5aA34gYXY0C6
	LI945yNYwcMwPFUPg0+ef6UNCVNlxGo0UtsizgMMkXUvDLkmgC1fYgUTnEh99EHBVubrAjKSXXP
	0bTvC94u6PZhogxcpn9VpCzmZLmdYNtkh8U6XbyQogQxap+Xolt0YmCdcDh+FWfgV62V+nwrACm
	i/qzS0SAGEqcwJmqM6n2iXH4Snpq3AzNi78Zp/3eOZFAUHljyMnGQ+YYWuLjO40SQ9zSywoMteW
	AG0qnY+5Sit5bgNcLfpIBWfSF7nl4VWzeW1bXfM1JrwTzSNp+bCuUa8eonaJZTeNTCfvKzrckkm
	kztjgiKsRMF91JHRsXuzUdFmflSAre4f9PNNf4IkTXO+a
X-Google-Smtp-Source: AGHT+IEm0pNt8N1cvRS3sw3COdyY68vXL7KkG85G3J41WMroyvT0psuCTxySAGZKiMOI7hV46yazeg==
X-Received: by 2002:a05:600c:1f10:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-45381af7e6fmr14491265e9.9.1750866344296;
        Wed, 25 Jun 2025 08:45:44 -0700 (PDT)
Received: from ?IPV6:2a02:2455:86a0:a300:6570:b777:80f4:22f9? ([2a02:2455:86a0:a300:6570:b777:80f4:22f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c749sm24200335e9.4.2025.06.25.08.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:45:44 -0700 (PDT)
Message-ID: <da387475-ea1d-4636-a524-8c47c6e4c764@suse.com>
Date: Wed, 25 Jun 2025 17:45:43 +0200
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM Development Call June 25th, 2025
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
References: <kf45vknwfpg2ule66cghubbzwdri4frjp3ugmybvfdkdyovqmn@q3hlnl34l5wb>
Content-Language: en-US
From: Vaishali Thakkar <vaishali.thakkar@suse.com>
Autocrypt: addr=vaishali.thakkar@suse.com; keydata=
 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
In-Reply-To: <kf45vknwfpg2ule66cghubbzwdri4frjp3ugmybvfdkdyovqmn@q3hlnl34l5wb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/24/25 8:28 PM, Jörg Rödel wrote:
> Hi,
> 
> Here is the usual call for agenda items for the this weeks SVSM
> development call.  Please send me any agenda items you have in mind or
> raise them in the meeting.
> 

I would like to discuss about rebasing the svsm-igvm branch on top
of QEMU 10.

Thanks.

> We will use the LF Zoom instance. Details of the meeting  can be found in our
> governance repository at:
> 
> 	https://github.com/coconut-svsm/governance
> 
> The link to the COCONUT-SVSM calendar is:
> 
> 	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week
> 
> The meeting will be recorded and the recording eventually published.
> 
> See you all there.
> 
> Regards,
> 
> 	Jörg
> 

