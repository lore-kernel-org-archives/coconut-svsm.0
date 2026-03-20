Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8275629E10B
	for <coconut-svsm@lists.linux.dev>; Fri, 20 Mar 2026 03:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773976949; cv=none; b=Dkzno8b2Vn6AeOVJ2qY0xQjDR12UpuerGX1g699FxyHIMlnXFRthp+w/ub3F8FU+/cN9bPoDF9E5AfkGO7RCMrEzlN0nfroR9jpwTwEoO93dmYrljgJAazqY1NAXKs1WvJVnTqWvDTxLV2a/cfEoB/sF50GfQBGoCANM1/3z/t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773976949; c=relaxed/simple;
	bh=zvvff/lHVl36+BbJKqXCijKIhWm2PSFCEm9S33jlbfk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HOxf7wSt8fI4NUqCXflfqWwFKHg4a98XeRG+HPvimU7d84efAWt5gfh4uw4W61qe6l9dvK1IdiySgjs0Aw47GSpjSzBBp5wiT6LswdKDsSFWfWmqpYrGA8iidGvgRAI/cEo7AlCqVXvJdoMTdDZz9JsYyxPsrYbcC0q6UXVsVlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJwbvFrI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJwbvFrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773976946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzC3VA7wtVX9Miy6huWQgfo5D+y/r+IckgtlWr907WE=;
	b=iJwbvFrIKN9YneYnA7DZ0sUFxgXhTCEmZihpGp1JmbqvNZ/AYyLAntyp12ZSTKEbtaKGx7
	7x4fMOvPCtbMIEK+uRqhKdazrSPxd0KUReNU8ystQs/JQpiy1izQt2w0QVhTBE4nkkwS3X
	j03sBWewfqq3HAIzfSV7INg+aoKqdL4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-CJCkEN31M1ibgRpjF_5LhA-1; Thu, 19 Mar 2026 23:22:25 -0400
X-MC-Unique: CJCkEN31M1ibgRpjF_5LhA-1
X-Mimecast-MFC-AGG-ID: CJCkEN31M1ibgRpjF_5LhA_1773976944
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c53a0264cso21109606d6.0
        for <coconut-svsm@lists.linux.dev>; Thu, 19 Mar 2026 20:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773976944; x=1774581744;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzC3VA7wtVX9Miy6huWQgfo5D+y/r+IckgtlWr907WE=;
        b=N76ldW0UaJLBul1redNLI8IjF6fcLbtP5RrhCReKZrxTg6D4G+iovgGU6kUhAOdaRZ
         VmgIuC2ZtqGMXnS40AaXQ9YVcIYk5Xb0vlsnaovewry6TsIQzWGqUOcxPTsEVgm5c/Ao
         gZhPdJuh5rT4ZSwP6CknzafYJdYB+fPnyZiL9SbUB5ufTNMsbVuWCwPwPOPSOnD9D9y7
         Ot0A2IOTV+trbxBj2+Uri9MgJGsxAxk4Z7HqRufABJCvHoRwnYiptlJr3Ftf2sAGsQKi
         s87GtQF8kcCD6QBeudzP/6DOM964wGMWfDVPzbmwxZbWPdSNFsebTU/bn1OzJlTd/uC1
         HJeg==
X-Forwarded-Encrypted: i=1; AJvYcCV6r6CcuSSOTqTOo6ttDvVnOqBW0CMCfQlqHSLvqh4U9ZCV3lo/ajRG/AnRyasIXuN1qog2iUU+8Zk5YR0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+7sQfa2YDYYS80fhdGimkb0csyg5oLmEXBRkTIK5mLE2AoRvP
	PMZRYhUwaiOWUWzqyAmD5dzO8JNU3dgP2T7+dv7m7BSe0QiKbqWjpRdFfZa4FY7I71kiMqbdgyO
	RsxdBIKjSmPL8Eh3fPXvXne3X0UzWv394IW0VflrcSKt16BofjqEe9SINTReipg2+Ug==
X-Gm-Gg: ATEYQzz7WAyhZ02LyDHS1Glgnzm9yLUoV+RWD21vQqGaTJ8srnyF+g8nWGeNff1bTEJ
	MzjYUrbJV0gMbHyQVQ74czx71y7uXe8n2hITOawWV/0U+CBz+j0mtEJcgVnPLFI5ZVO3kUg/EOm
	En9iB6qFT29b6oniXYlkjhvLXx0gp1na0nMxQjMaefO+FHK/8aAFWVeZspXYPGE0iHO6xO3+xSx
	xp2He6IZXXa8BwRjsfmEbcLNGLXygNwq6ijSnvvj49Dg1Uw4XYQ308qnR0Ft/6GrM/R6Ffci302
	4uq4Q/nTHhaBeyRmlsm5VvEZEBhgqsr9awz5mh8gz4ZWPChgvX+2r83Wlxnh2ol7KYO9HIcimm/
	oaPZf7dgPDxWnATYUk/6Tnc+KNAWjpPLFygSXmOw4e3qSCfi57o8wBJW3bEV3SG7lyHNfvA==
X-Received: by 2002:a05:6214:4e19:b0:89c:4f50:eb91 with SMTP id 6a1803df08f44-89c859be869mr20841716d6.8.1773976944386;
        Thu, 19 Mar 2026 20:22:24 -0700 (PDT)
X-Received: by 2002:a05:6214:4e19:b0:89c:4f50:eb91 with SMTP id 6a1803df08f44-89c859be869mr20841466d6.8.1773976943910;
        Thu, 19 Mar 2026 20:22:23 -0700 (PDT)
Received: from ?IPV6:2600:4040:7c4e:c200:d6a:7ca8:b526:8eeb? ([2600:4040:7c4e:c200:d6a:7ca8:b526:8eeb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85236730sm10825896d6.14.2026.03.19.20.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 20:22:23 -0700 (PDT)
Message-ID: <6ea2ab85-1f84-4d3d-a5f2-ef83ff1252e8@redhat.com>
Date: Thu, 19 Mar 2026 23:22:20 -0400
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tyler Fanelli <tfanelli@redhat.com>
Subject: Re: [DISCUSSION] svsm: attestation + CocoonFs:
To: Nicolai Stange <nstange@suse.de>
Cc: Oliver Steffen <osteffen@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, coconut-svsm@lists.linux.dev
References: <73724.126031100351500114@us-mta-457.us.mimecast.lan>
In-Reply-To: <73724.126031100351500114@us-mta-457.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J4mOlPd4vQr50T3srkC4J0VyaZui0lQOg9anKXxCL-w_1773976944
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicolai,

Apologies for the late response.

On 3/11/26 12:29 AM, Nicolai Stange wrote:
> Hi Tyler,
> 
> I've been told in one of the svsm devel calls that a capability for
> storing some info in plaintext in CocoonFs would be helpful for your
> attestation efforts.
> 

Correct!

> Before I go and implement something, let me ask about the nature of that
> data.
> - What exactly are you planning to store there?

Here's a rough outline of our plans:

The CocoonFS images will be encrypted. Within the CocoonFS headers, we'd 
like to include the *wrapped* key used for decrypting the image.

Once SVSM will attest, it will read the wrapped key from CocoonFS and 
forward it to an attestation server and receive it back unwrapped. Since 
SVSM is now itself measured, we can ensure that it will not do anything 
nefarious with the unwrapped key, which is sensitive data and cannot be 
leaked.

With this, we don't have to worry about storing different keys on 
attestation servers and identifying which key belongs to which CocoonFS 
image. The image will carry its key alongside it, yet it will be 
wrapped, and attestation will be required for any unwrapping.

> - Presumably the filesystem salt from the image header, supposed to also
>    serve as a filesystem ID ([1]), is not sufficient.

Not for this purpose.

> - Is the data considered immutable over the lifetime of the FS?

Yes, the key is immutable.

> - Is it Ok if that data is not authenticated?
> 

I'd say it likely *should* be authenticated to ensure tampering didn't 
take place? I'm open to discussion on this, however.


Tyler

