Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2889291C27
	for <coconut-svsm@lists.linux.dev>; Fri, 13 Jun 2025 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807641; cv=none; b=jjT2AxQylWYotv2A1TO1BRNoBd8DsZipIsg/tIWEh9+0u0S+Fix72REYP102Op94Oqawvvf4LybcVp6auoIlDB6QrBz2gIykIcLuoTUgs9btpmjsb/K+u/r/w12ekxWTzBWdclC+NSXuf310dhXsrEdmkNCnlG5mQ0Nnibxy6Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807641; c=relaxed/simple;
	bh=yiBqc+aJA8TIGJFpaHaumzbTHDxqDLbRSRfUEGf91b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=VSP9TCDzh0aByf0jzPkIAUaodXZsFMNePj4xf15OblLe6cHOZQ6E1V3jb9i8ZU11eJiF0trE8cjV/8VYkLIvwliucMkhEq3jpy79yXRP+YvvJF08SHRjk03JqByHKrn+m7OJhV+nzRDscFLENRzh1sze4hjLhOwjHaT5++CULhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJwtt6KR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJwtt6KR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749807638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ttnuEcci6rGQ2PB/iYbIDrCoBPzHAVYf47EC1WZ/BzA=;
	b=VJwtt6KR/d479YKWBDeKxGJR5Our8j/1k40mDOGbj2MqgxqFgXvp0iM6zE1U0Wrcua1Iux
	ayCRHwXZ9qDoNWbgunYwsb1iTu0y4Bv2GCWFGaiye4QNwGfQOEer278I92wRBSDv6jc0Jc
	t6JZHMMWiV4lIC6wV8FXVSZhKJs2zUM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-57criWXTN_OiNjo6HjMA_Q-1; Fri, 13 Jun 2025 05:40:37 -0400
X-MC-Unique: 57criWXTN_OiNjo6HjMA_Q-1
X-Mimecast-MFC-AGG-ID: 57criWXTN_OiNjo6HjMA_Q_1749807636
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6023d9a86ffso1404633a12.3
        for <coconut-svsm@lists.linux.dev>; Fri, 13 Jun 2025 02:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749807635; x=1750412435;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttnuEcci6rGQ2PB/iYbIDrCoBPzHAVYf47EC1WZ/BzA=;
        b=lF9/2nqOskDzjMFkuQSJiiX8O6HNiTeclriKdpbnbdLIL1vyt5Ajg1QNFCQtNgz0Mh
         J9qi45x4/78+IHmjvGr8JGbp+OhqiKMFQ6ctHwzIc/BD9jRAPJI+8v19QRxHFHbHbxRF
         HWzgWsllri/pWdNMV6M2Yl2KSnDRU2+G1O9kg3dhAewVMhNTNvHMQlj+MV6vy8ykBKwS
         JJe+KHIE4V3zPpWLILRtay1OfCRSrW6wyCRgKo59AvzUPXQXSLGAFFkIDxQsufjYfuYx
         ofyfyOCdxc8mb4LCZx5640WqqqguT3uFPrmjNewY8ggOnffuGvImw2QDiia3pDe5bhLv
         1wdA==
X-Gm-Message-State: AOJu0Yz2KlVZzPALYFmy774Uon2ZGgHVTByFqbx5gGGhy3od2PzwFQgh
	y4W2dppVq/FabGm8v7SsYAD41We/y9p7/dA3lL0ReCzqDaGcUzdQ34uyKYesLn1+/fLMDqjHjzU
	ijJYbDLThisvcDHlwNjJu9gkSbqtUsWILJJbfpRLoC2DEtrr0zDZgqjqgLAHVWcMSFzXeTUu13+
	m+
X-Gm-Gg: ASbGnctQvqy/9M3FRt3FsKBC1UNEWblMUEYw9DH/IEDAXGjLipTARWRiRxmESc75YGw
	dAWhsO14Sw29DkqE58SfqN5Fm2FNkQ2lY/OntiGUM2xnuEpqPozQbvMSHfZN837oCv87zAQzD9d
	x6frIgYdbTVYAGSJvqOaCK6v8ZzDASOay7sneM2sgb8FjtP5Rvr8Q21x8A/J/5zHTR42I0qpVvj
	YREqYF20w4xnoBoEQxLZA9ILWenHwZIhP74TaswGSVQIoLTfc5u7tePFfdmurJJtMjkpgCOp5J5
	FSEIGqHgT6TgJ44wW3L7olLSwb0q
X-Received: by 2002:a05:6402:210f:b0:607:2b27:7f41 with SMTP id 4fb4d7f45d1cf-608b48af4c6mr2156451a12.4.1749807635480;
        Fri, 13 Jun 2025 02:40:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6HmKbtYoSP66yEIiV4tDIQ8mRzwviEyxXSCj8Z1GQ12jsDEEEBhghk43qV1a+8K43bSPXhg==
X-Received: by 2002:a05:6402:210f:b0:607:2b27:7f41 with SMTP id 4fb4d7f45d1cf-608b48af4c6mr2156430a12.4.1749807634867;
        Fri, 13 Jun 2025 02:40:34 -0700 (PDT)
Received: from sgarzare-redhat ([2001:67c:1220:8b4:edf4:d580:147e:ea8e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4ae2d1fsm923466a12.74.2025.06.13.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 02:40:34 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:40:29 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev
Subject: Re: Custom CI runners in Kata container
Message-ID: <jh6bri5myhmk6qtom3o3axpqt3gqzvmxkuboznivsszusr77qw@hoqel6ccxhid>
References: <CAGxU2F4Mxc_s8bUejyNLUiGmiJxu-V4LcxZ6jQaELMageucQcQ@mail.gmail.com>
 <hjpfhokxqsog25l7akyqcznv7uv4c3orhq7u63uxh37izluv6h@gw3s3na7dlej>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <hjpfhokxqsog25l7akyqcznv7uv4c3orhq7u63uxh37izluv6h@gw3s3na7dlej>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q7t81Vt0JfjDq3H4B35i7dyUSu2jdcJYKmlxqJx4fAk_1749807636
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jun 13, 2025 at 10:38:38AM +0200, Jörg Rödel wrote:
>Hi Stefano,
>
>On Wed, May 21, 2025 at 03:17:59PM +0200, Stefano Garzarella wrote:
>> as we discussed some weeks ago, I pinged Fabiano Fidencio of the Kata
>> community about their CI.
>>
>> He told me that for now they use runners on machines provided by
>> AMD/Intel to run GitHub jobs and test SEV-SNP/TDX related features.
>
>Thanks for looking into this! However we decide to proceed here, there 
>will be
>some disadvantages.

Cool.
Do you mean that AMD will plan to provide some machines for the project?

As I mentioned I'm in contact with a professor at University of Pisa 
interested on doing some master thesis on SVSM. Do you think we can 
share the access in some way to those machine or they can just use it 
opening PRs and running CI?

>
>> He recommended we take a look at OVHCloud if we have the ability to
>> expense through CCC, because it might be easier to maintain.
>> Particularly if there's downtime, there should be customer service
>> ready to fix them quickly, which we certainly can't require if the HW
>> vendors donate us access to a few machines.
>>
>> If we still want to ask HW vendors, I can ask the Kata community to
>> share some contacts with us to see if we can get machines.
>
>I am a bit hesitant with the expense-way of getting CI hardware, 
>because it
>requires someone to pay the bill in advance before it can be expensed. 
>On the
>other side you are right about the customer service we could rely on.
>
>This is something we could not rely on for gifted resources, of course. 
>But
>still I'd like to pursue this route first, we can still change gears if 
>it
>turns out too unreliable for us.

Yeah, I see, I agree on going on this route first.

Thanks,
Stefano

