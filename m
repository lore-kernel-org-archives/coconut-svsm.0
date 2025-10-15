Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52842270568
	for <coconut-svsm@lists.linux.dev>; Wed, 15 Oct 2025 01:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760492035; cv=none; b=KIuP8+twQLF5ieGEK7gi90jxut/mZbPsx/GoudG8Tal2CtAEl1YYNzn79qFLYe+TkRzEpqmzaddzfndroftVA7jCfEgSQ8k1l5tiS1tj9PJ5trRqfh4yGB9X8A3P96I13jMWAFQn6TJh1RxwRHMQcXxmwWm0NyjsnQomWzC4evQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760492035; c=relaxed/simple;
	bh=q2gWaPm1WSZMNKlvDN5mv6C8fLED8493cVK6bI7uSFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAdY7yIAZwhpTvVoXoYttvVq/6VizRIOnCHdAwUBpqkgBUi3zwOxnsX3pS0FQs6ryTeh7FD6zz2H6kLsr6rGoDAxUYP0Tv3cAFPIJ+U+4uq2+WLt3Cb6p2vnuSP0oFyakkb0zAKAnueQmZACRvEDnbRzyq86CpM4v2EU2eq+LqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GNDrow5f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GNDrow5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760492031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OFuYqZ5TX0ny/U9Gh2bbs5rFmpZsQZUF5fTXAwaxHo=;
	b=GNDrow5f/nsl/KXycOw9lHTntItEXzYXku+51aouFk8kQqJfR53fe9tsqvJxPY9lKkoqmB
	pSNZpDCX1d8+QbSJlKP6tY8Cq34u9FjS+spcl6vACxSQubSxpdsreaT4FWfnauDW4bbu/0
	k/wHHCFjWOKQL3GbccfBEk3XYLoVAL8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-LOHK-dSHMpCaS5llXBCxNw-1; Tue, 14 Oct 2025 21:33:49 -0400
X-MC-Unique: LOHK-dSHMpCaS5llXBCxNw-1
X-Mimecast-MFC-AGG-ID: LOHK-dSHMpCaS5llXBCxNw_1760492029
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-872d1a88c7dso1276536185a.0
        for <coconut-svsm@lists.linux.dev>; Tue, 14 Oct 2025 18:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760492029; x=1761096829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5OFuYqZ5TX0ny/U9Gh2bbs5rFmpZsQZUF5fTXAwaxHo=;
        b=tiz8nsSaXwSzQOwzZ4ET8LEDhWXQSNbNnKVWyAqYGXpop7bgwgU1H9WHD4kCRTSFxv
         AKDLbWmsOjgl3yxApIDoR+UfavfvK6v8SZrbyx+3TWnU17Yz4GhdQVts6rMTvHvPAMoU
         XDN059zQlz5M2MPAJQp8+lR7XrNsPVElablHIpN3sctbJJsSXR+ugWAGOwVHZdguZNZs
         1o6px0Uw9ifVaP2t5mH3BZ84mLfAjdRDYx3SEv9F6RfdR8OHbyIqPPGWiscjCkx6ttuE
         rsy474h5zKTG6ixEAmvm0T0UEz74KWzWrZlDMdM/A7/oL01AdzhYZwPLLy4B957rKrtu
         EXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR8BsvEa7ttguo4nBhYeLdK2jeYt3Y66pBV7TOddKpdv4MkpAlFg84icdhnDyv+bS3Wn/av0eAcOjj3rM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoWqXlsHnweQ1p0vDm0C+q2mhE5kaKXKX2v/DgjLoPfRSqp8S3
	U4b79AeSUEPJzr70FWPEKHorSbu6xfVPF0l91oLqfauv45crwhkmnGoX8mIJG0Je6tiMCYG7wdC
	4c61A+0+CKN6d2gP+7RU90ABN9nEjGNdscyYJEH2mcUrEkb8kIYG/onEJ+gvVH1+/SA==
X-Gm-Gg: ASbGncsDsbnlxBj9wlJ5JudorphMKMkyXplnRLXD1kSpkWU0E+uHRYsD1hzXjVVTHcD
	ffZYwPx/mPRc0NGpx90azmN8/UdS/v54kQwUHNWmSnygCzz2ROOivjgl57IV7ZbdysfQ8WtasbS
	p7e5IVewYyn1NjcoXwKe63rkXH2IXZqoCq/UnnkQySAJE9FBUk5beJfuDlkMfkey/BDuqnIaifa
	wV8Tps5Y1UGeMp5hQkKJ4b9hlRc3sT7RS03kX1Lej1OMZrH4O7aukAxn6ko/TlcuqNZ3oWFqd/4
	ZlD1Q7Qx4etQ/XJMYDSe7MF7QCdl6yhQOuMy6sCWzQDTTTRY1l43eDT307QG86jHQTQdJFVCPZF
	a/DXEZjtbJb9m
X-Received: by 2002:a05:620a:4411:b0:829:217e:eab1 with SMTP id af79cd13be357-883546e258bmr3387543985a.80.1760492029109;
        Tue, 14 Oct 2025 18:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZLvsYG0Dxo0UN3XZWH7rS9nOSVBxpJeAuKkKPPteyexh7e35T4odVmwiC+/gFc61Wp8yDew==
X-Received: by 2002:a05:620a:4411:b0:829:217e:eab1 with SMTP id af79cd13be357-883546e258bmr3387542185a.80.1760492028560;
        Tue, 14 Oct 2025 18:33:48 -0700 (PDT)
Received: from ?IPV6:2600:4040:7c4e:c200:d6a:7ca8:b526:8eeb? ([2600:4040:7c4e:c200:d6a:7ca8:b526:8eeb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca2f1bsm1296189685a.33.2025.10.14.18.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 18:33:47 -0700 (PDT)
Message-ID: <203dfa61-dd55-4fbb-86d2-c0cef55eaf27@redhat.com>
Date: Tue, 14 Oct 2025 21:33:46 -0400
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DISCUSSION] svsm: attestation: if and how to authenticate the
 provided secret
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Nicolai Stange <nstange@suse.de>
Cc: Oliver Steffen <osteffen@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, coconut-svsm@lists.linux.dev
References: <a6188e4c2eb11ac6fef4eab605666d15c3f604c4.camel@HansenPartnership.com>
 <87o6q96w4c.fsf@>
 <fe4fcbfeb22c26c8172960551d5721d2919a7004.camel@HansenPartnership.com>
From: Tyler Fanelli <tfanelli@redhat.com>
In-Reply-To: <fe4fcbfeb22c26c8172960551d5721d2919a7004.camel@HansenPartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IuoCM29EhR8sDD1Hc-ebssweT9ARc8MG0ipMarffaog_1760492029
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/25 5:40 PM, James Bottomley wrote:
> On Tue, 2025-10-14 at 22:56 +0200, Nicolai Stange wrote:
>> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
>>
>>> On Tue, 2025-10-14 at 10:45 +0200, Nicolai Stange wrote:
>>>>
>>>> as I don't want to hijack Tyler's recent attestation PR, I'd like
>>>> to continue a discussion started there and best summarized in the
>>>> comment at [1] here.
>>>>
>>>> The question is whether or not to have the KBS authenticate the
>>>> secret returned to the SVSM upon a successful attestation.
>>>>
>>>> The current state is that authenticated encryption is being used
>>>> in the protocol (AES-KW + AES-GCM), but that's only bound to an
>>>> ephemeral ECDH key, hence doesn't link to any root of trust.
>>>
>>> Could we wind back a bit?  This discussion seems to be starting in
>>> the middle.  Where does the encrypted state actually come from?
>>
>> Sorry for being unclear -- this is one of the open questions, see
>> below.
>>
>>
>>> The threat being that if an attacker can supply the TPM state to
>>> your confidential VM, they know all the TPM parameters, including
>>> the private keys, and can fake any attestation.   In the non-CVM
>>> world, the state is usually part of the VM image (encrypted), but
>>> this happens because the TPM is running outside the VM envelope and
>>> suspend or shutdown can pull the encrypted state as part of the
>>> device state of the VM image.  In the CVM world the state is stored
>>> inside CVM in the SVSM and has to be inaccessible to the guest.  It
>>> is possible for the SVSM to encrypt the TPM state and pass it to
>>> the guest which then saves it in the VM image.  In that case, proof
>>> of correctness can simply be supplying a key capable of decrypting
>>> the image.
>>
>> The current plan is to not involve the guest at all. Instead
>> - a (small) block device will get attached to the SVSM, via virtio
>>    currently,
>> - there will be a filesystem on that block device, which is encrypted
>> + authenticated with a (symmetric) "filesystem root key" known only
>> to the SVSM and
>> - that filesystem root key will get revealed by the KBS to the SVSM
>> upon
>>    successful attestation.
>>
>> The TPM state will be stored in a file on that filesystem. UEFI data
>> in another and so on.
> 
> On this, how does the guest know it's pulled in the correct image?  If
> I were a malicious host, I could encrypt my own TPM image, accept your
> attestation to a KBS I control and release a key that decrypts my
> malicious image.  I think you give the answer below:
> 

We intend for the guest's rootfs to be sealed to the persistent TPM 
found in encrypted storage. The malicious host could switch the TPM, but 
that TPM wouldn't be able to unseal the rootfs.

This doesn't directly prevent the attack you mention above, but it would 
be a DoS.


Tyler

