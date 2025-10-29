Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C0721A444
	for <coconut-svsm@lists.linux.dev>; Wed, 29 Oct 2025 16:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761754483; cv=none; b=Kq4sGzYz1mylNfhx0OnL7w7ZyXVzkCOIiV0qE1WgQZlW7T52Z4LzfMFW8/eT6j7hSh/xrkiFliK7xLagRlMtGnYu1oJIKsvcvAHwaDjNkJkEZ5frZp4vWMjCUYvGjgAkwMo7IhlNYHquMOX3NaYXDMoTORBfgznfOnPh3dJ9SJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761754483; c=relaxed/simple;
	bh=t+RW6/kun4NlQzP7hIeGZvbc2NecNJpNuVTCXe1wxkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+8qk/Q88dsXepxHvDhO04BC0Uz1cJPUtxFQ4NDdOv2Quv+2IeUyvfQFOZCFNU9zyvyMwX9Iw0Vs8PSNxSwKX+q4v+pyUKvdD6tsdU4w/ILZ9HglDBSgVtb24UJmp6O6dAqx/KFgRaVBngZ98f04URQPgmj2LFm6HVsWZJwuwZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XnHEd1r2; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XnHEd1r2"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b6d4eb89facso951966b.0
        for <coconut-svsm@lists.linux.dev>; Wed, 29 Oct 2025 09:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761754479; x=1762359279; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFP0VYjae0DHdUD/axZJrEvgL8cON4ZqypacFuVy3Fg=;
        b=XnHEd1r2/s6pAqFCHdbEAniaayGL/E/SPYWy8bZgLbsJjFJe66AZl/MTZyvbg0mj2B
         J5HqscwHWXwus+m3dehEl5aS+HiQsSL3cx+BGjlMis55D2yVx6eFny0qhy6a2LgWM4NZ
         +GHrABpmJh6orDJwEPMV8V6rGTRFP1R+Z3N1VHJP/yyDp/65yVtes7lyn78i9ttCrmDp
         66UhI8LI+sQ+3HwbgriDlsb3jPBNuGYYTNE6LG/6mT3owlLZnMNE8Tp4lBBIy3fIiJxw
         dFCzFW9PqxIgs8weyNZgIKFMTdoQAyAdRqWvv0evspQiDbJc7wmYYCMudKGxvWFdeRK1
         OMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761754479; x=1762359279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFP0VYjae0DHdUD/axZJrEvgL8cON4ZqypacFuVy3Fg=;
        b=o33ULvHmV1Rp8kBSAsvFum7M0YBsbaVNdhyvkAR4bQGOgNE2eLhAvRE3JXlp3CHKlM
         N60HKYZyktE0OJCAuaOTCL/3J/dLLxzssmODlHqSbeTSPv/mBeDgkEMBduto2rerZ40C
         IJi/Q6aZNTaME3gpd9/0hPsiwMyBJwyURpXAjqGGuK/voOahJLDJT1I8x69oO0Pa/lS4
         AMrseL/qK2mdWGO5nPwuhqfP7wduss5SIDCf9MO61GD5+3RJJwMaireZCZDJY00frbM+
         lgwRyfvVbUdz2oWmrUsBZ1SO9xzPi6Xt7EuUtMzBzmRjLeT05RobSDvKijGoDsk5HBFM
         OH1g==
X-Gm-Message-State: AOJu0YzPZai3Na7L3n177wDO/twJIUAe9wVZJFZ9YkY5Z9rESJxX1O7S
	8BqgXjhbaSjL226Ep2L72LB3L2RSO3J1t9RFplWsKTZLn9pZt9D5fGcriiTSH0e4d9mfROcWYP+
	DrSA/
X-Gm-Gg: ASbGncst7AKvlLO5S27ATvDYJKegTkSD37FYlyKFyB8Py05+uCcR6ef3bHBg++vz4q3
	7Z123qHx/iVN6azpEtd79peI+gGVXWaZfUIKxhtocxXIrPxEWo/JD/9tdP5Znk6Uw1XIyWAHGp6
	Ye+Qr2Sq7f0FcF8QKRxRgNH4HDCvTz/wYki8v/+FqdQZCFYCbNhVW1c2FiDf+UK5vp+qZVmosmz
	Zf0EBSAfnQEEhHGtJFpO2cgDhbzsM9upGqJr8GkGWWQ59RsMBc9+B32RdHgi5SAGk5yXwPAk5t5
	1PKJy3WLi+Zgb6Dejsz5Tsm4aH/F9owGLNIhSXwGne6TQGoLTu4hb0VHx2UinQAMMeMR314n6IP
	vkha+0XLBZ/rW5G3sS3ieOFs9ssc1HC6uq3Rg2NdrrsJRWrknUfOmihKjMlqHfXo2vVOA1numC2
	IQv5aw7ZvO93EszRAhC+1jHUf3OpvYK2kfzC7Zpnr0lCMreMAxiwvN571fvA==
X-Google-Smtp-Source: AGHT+IHfs9QHQUNO9ic1aRfaPGMrBSkBC2AFxDo6q9MKZQFle9jEJnrkq2trs3L/BOBfrTUE/s5fdA==
X-Received: by 2002:a17:907:3c90:b0:b6d:7632:5f72 with SMTP id a640c23a62f3a-b703d5501e8mr174809766b.8.1761754479487;
        Wed, 29 Oct 2025 09:14:39 -0700 (PDT)
Received: from ?IPV6:2a02:2455:86a0:a300:4b30:1c70:ad86:8e4f? ([2a02:2455:86a0:a300:4b30:1c70:ad86:8e4f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8ceeaffasm1490019966b.45.2025.10.29.09.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 09:14:39 -0700 (PDT)
Message-ID: <6d83541e-7dfd-4387-bddd-71db5b0c1561@suse.com>
Date: Wed, 29 Oct 2025 17:14:38 +0100
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: coconut-QEMU IGVM patch
To: Luigi Leonardi <leonardi@redhat.com>
Cc: coconut-svsm@lists.linux.dev
References: <CANo9s6mCcXce7xhzYvsixURCtWxdwkxzxKrQvNQ78s6hfc_QHA@mail.gmail.com>
Content-Language: en-US
From: Vaishali Thakkar <vaishali.thakkar@suse.com>
In-Reply-To: <CANo9s6mCcXce7xhzYvsixURCtWxdwkxzxKrQvNQ78s6hfc_QHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/25 11:18, Luigi Leonardi wrote:
> Hi Vaishali,
> 
> In coconut's QEMU fork there is this commit [1] that, IIUC, is not
> available in upstream QEMU.
> If so, is there any plan of upstreaming it?
> 

Hi Luigi,

Yes, there is a plan but I think it will need to be upstreamed along 
with the planes patches. It is required because of the direct VMSA code 
we have in our linux[0] and qemu[1] fork. AFAIK, this change[2] has been 
ported to latest planes patches on the linux side but not on the QEMU 
side yet. Likely because the planes code is still evolving significantly.

Thanks!


[0] 
https://github.com/coconut-svsm/linux/commit/e00e081276b2cd9f1400ec5b1a9cd97f8b5c4d58
[1] 
https://github.com/coconut-svsm/qemu/commit/170281076978a318e8d19b332ac5f4e63e0f384b
[2] 
https://github.com/coconut-svsm/linux/commit/0cad62a064d895232f5b0bb8b048918ec1402191


> Thanks,
> Luigi
> 
> [1] https://github.com/coconut-svsm/qemu/commit/d313e671e547927919994a82955a46965d45e72a
> 

