Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D801AA1F6
	for <coconut-svsm@lists.linux.dev>; Tue, 22 Apr 2025 10:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318720; cv=none; b=jzjxFnU8EHhvV3d9OCQNwRZN3fp3ZWHzXBi133/z/WL0BzfsrVlGaVYVAhbEilzQT3H6wzCtxAee7eqp4etJErA8Ba4wFQ45K0vxh7L77tNJBO5zkausCF5i3ZKsVe042xRn0W3WaXQT9YgpElpZcZp8zipKOJfvHFsY+TyshOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318720; c=relaxed/simple;
	bh=Ng0q1ooF6klO1DvZIjwzfqJzpKxabyFHt58cS/PsBvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=W2yvqznzhX3DayuJDSr1Fd0Vs9SIXZ6hKj7JH0RErYPBXA9N+O0h1sZxJtTfVxlsXKSkhpztkl5F/i2SU1xIgmvgGK8yiLPbgPk+Vo9/VkOwv60ZXsbxXYf8x9dU3ALU9hHQZsGZONZ2ewWH03EQUdCCjhxMvW9wrBjBdvWsaCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JknVuR1e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JknVuR1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745318717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NXC17VXE4L6/yZzcC8NbO7NIggDbC/yzpW5UKVN8QbU=;
	b=JknVuR1ePyKeJDaYrwtzQMrc3d+VLEXBkZHYYTwqNaq2gbyiqscl0MUohntladCD/PCUVX
	ZFbJAPjXxtPl/4W1+ehanXn4vAT3y0EyaGHQVgP+2k68+81xUG4PNrZcikcrS+gBZzLgpL
	mZZ8VtjuttXWBzXlY/ucA1/9D+GQJkY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-ruBADWiFPWqfjabxd8cKqg-1; Tue, 22 Apr 2025 06:45:16 -0400
X-MC-Unique: ruBADWiFPWqfjabxd8cKqg-1
X-Mimecast-MFC-AGG-ID: ruBADWiFPWqfjabxd8cKqg_1745318715
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acbbb000796so80475166b.2
        for <coconut-svsm@lists.linux.dev>; Tue, 22 Apr 2025 03:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745318715; x=1745923515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXC17VXE4L6/yZzcC8NbO7NIggDbC/yzpW5UKVN8QbU=;
        b=Pv2oOLe2nSg92/zJNQlhTQUQmZMwWEKZoKLCfDbxRg+kBw6e7St1At1WN9M44dg455
         Qzk0WMgTsas/zTlEH4HSlw3bc2iqmNmkFXvy2LsUyGGCvyU0FTizJ+HS5vbskUGceVEp
         eIG2654G/WWfZUkxDNoN6ceq35DIePQrTOOBsMnh/IzXlEN2NG6RvLQSjxLk65AX9t83
         xTqrR0vyBoblw5kNdw8ArqiXV9AYealwobtehWprw78BX/UGhX1msXeibCvhabPcXY20
         ktl1YavmSEoB9lNTB8lHE6W19mjJR+ByfLhN8Sm2fEjn8QxJW5j5BCGDaPeH/MEovVZh
         bPoA==
X-Forwarded-Encrypted: i=1; AJvYcCVSIFdc+xpdmkN1wEXJwrSQOCQaHPf3SXLl+qdEOG8uboKWESnwrQClZjJH6jINwh1He+psPqEjyeJ/cVc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTeKsy4JfPhmzvZO2Ymf+lh2s1sADZjfFRi2wmBiFF0O8ImLD2
	D15f6Ys8XYD0COoaifOksNkAY8Qh/9bU2oNIj6CvoPoyBrJWIwOVL2HqybHAnLoheLx1gsDSg0Q
	sKwMhmNWjO+n7zQd2frN5Myo4q8sN3wUdlKGtkrbDb93yG5j6/rjex2hc41PxUA==
X-Gm-Gg: ASbGncvfyXdR54bv9r+ilBi0/p692VJSSM3y6lE1dYelcD1X5933UmRpx16YpQs2IZ7
	sqUfq2S7O0Xr3z4fEgdMjhN7Ce/sPJ39iVBb4HB1qXONRO6aFK6ujT6Mmba9MXH9dfGzEqU3hr5
	14qo7ozbKHatOH90daaep+gOEdJQrk193SsMBoX6OjsVUKfUh+2gd+nHRASVmNY1IJ/pUkBSuFQ
	lwMdq/gyU9Huhu+TKqC+/lrkfIZc/AF8GHvwwpv8pY+mHWHygpvfIRuLcoUvjiV0Z78rcX+Nydb
	65Glh8msEi4EF6Xdkg==
X-Received: by 2002:a17:907:1b22:b0:aca:c6db:2586 with SMTP id a640c23a62f3a-acb74b18d90mr1264323266b.14.1745318715146;
        Tue, 22 Apr 2025 03:45:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQi8mKsM4bEU99oVJy/ByJ7y9N8Zv9Q3YJs0rgC+LxvivNNQ7dAGTCGARlu+2yqPaQ479SHw==
X-Received: by 2002:a17:907:1b22:b0:aca:c6db:2586 with SMTP id a640c23a62f3a-acb74b18d90mr1264321066b.14.1745318714550;
        Tue, 22 Apr 2025 03:45:14 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.201.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4d38csm645644666b.58.2025.04.22.03.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:45:14 -0700 (PDT)
Date: Tue, 22 Apr 2025 12:45:08 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, coconut-svsm@lists.linux.dev, 
	svsm-devel@coconut-svsm.dev
Subject: Re: [svsm-devel] Potential project on implementing AMD SEV emulation
 in QEMU
Message-ID: <5br2jqg6ffpxy3pv5ehvumvrl5ypeybt7uzxgrhai2fey7bc3d@7zuyhz5ztlfc>
References: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
 <aAdKwgeBO3ILBwcJ@redhat.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aAdKwgeBO3ILBwcJ@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lSbp052f102HBDGPKU2Shv_RCAcyS4WNfvVOUvJPsWY_1745318715
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Apr 22, 2025 at 08:52:49AM +0100, Daniel P. Berrangé wrote:
>On Thu, Apr 17, 2025 at 05:26:15PM +0200, Stefano Garzarella wrote:
>> Hi Tom,
>> yesterday in the Coconut-SVSM community call we talked about a
>> potential project with the University of Pisa to emulate AMD
>> SEV/SEV-ES/SEV-SNP support in QEMU.
>>
>> Joerg rightly suggested having a step-by-step approach, supporting SEV
>> initially, as supporting SEV-SNP directly might be too much for a
>> master's thesis (about 6 months of work).
>
>Agreed, from the QEMU maintainer side we'd very likely want to see an
>incremental set of patches rather than a "big bang" attempting todo
>everything in one go. Staging patch submissions for SEV, then ES
>then SNP would make conceptual sense, to enable something useful to
>be delivered at each step.

I see, thanks for confirming!

>
>> We wondered if you knew of any attempts already made in this regard,
>> but especially if you think it's a feasible thing.
>
>I think 6 months is possibly on the optimistic side.
>
>Non-trivial feature proposals have a habit of taking longer than people
>expect upfront. They might get lucky, but I equally it wouldn't surprise
>me to see patches go through 6-9 months of reviews, on top of the initial
>time needed to write a first impl before submission, with multiple
>repostings needed before being merged. IOW it could be 6 months,  it
>could be 12 months.

Yes, I understand what you mean and I will point it out. Anyway, as with 
GSoC as well, IMHO the time of the thesis, it doesn't have to be 
perfectly aligned with the time it takes to merge everything upstream.
Obviously I will make sure that this will be the ultimate goal.

Eventually, if by the university the thesis is ready and the student has 
other priorities, we can help with the process for upstreaming, as we 
have sometimes done for GSoC projects.

>
>I don't mean that to discourage an attempt. Just that non-trivial open
>source contributions with fixed timelines are not a reliable combination.
>IOW, plan for what happens if it takes longer than expected, exceeding
>the 6 month thesis timeframe.

I agree, I will point it out!

Thank you so much for your valuable feedback!
Stefano

