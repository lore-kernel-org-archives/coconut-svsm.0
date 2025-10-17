Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EA223771E
	for <coconut-svsm@lists.linux.dev>; Fri, 17 Oct 2025 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717818; cv=none; b=LuTpCi6lND6jP5jJfeWWn7iwddP2QN/RPf253ETfEKT+9y4sPIgpOXqlC+tFBFWrrOd8tQBueRfyYiQytKAUHwYBy7ed/3yBYMQQuXRBwXO3tc4MoYhH0F+Qn9wQJ/hYUf2xSB/RD6HcVt91TOpTInbriNj2AMThzi2CzYR5wYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717818; c=relaxed/simple;
	bh=9WkNJAkNjn0CGLmZutDfvK880RO/D4lV0qyvxhaQDpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uuN1bck/wLOGP5dWeAxQU5m+4tJy+OfwZJtdwkphRP442aqKd3nLRS0KS4yC19BHaBpJefce6vddTpzNbuZdYxo93F7YOxISKB3hMmJ750IR/j5iYh+zzZJDSbOk1rqC1CdFaTYqbfZJINYKcL4/7CzmDsgD0nmBNL9P91J4hfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LclAVHx5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LclAVHx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760717814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=loHIkfioCXqZe6lzGT+fHRY5M6l71/3JaOsGcbfAUqA=;
	b=LclAVHx5eqaiRlsUMuNlrmBPJ4+dWUpNQ8oY/D7pd/x5J3heKG97QstQJroUjHD3On/Wkd
	xlpc8IMZp2iGpHVfWum/s8JTC+k/cF6B2jtx6YX+jmISNmfx33BBIsb0T/NHKnmgxTSLQG
	70BPHugZgbIPCF4cAxBUxlaUNbUasPA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-nFaVWp63N1GxN07B352Cqg-1; Fri, 17 Oct 2025 12:16:52 -0400
X-MC-Unique: nFaVWp63N1GxN07B352Cqg-1
X-Mimecast-MFC-AGG-ID: nFaVWp63N1GxN07B352Cqg_1760717812
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8910b0fb780so166675285a.3
        for <coconut-svsm@lists.linux.dev>; Fri, 17 Oct 2025 09:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717812; x=1761322612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loHIkfioCXqZe6lzGT+fHRY5M6l71/3JaOsGcbfAUqA=;
        b=bFOJEm6K/EDyveXg6/ZPkpNlpLB+Gavlb7/c+jJesqcAy1LBVcXEZ4aAKI4TN2DM/6
         ELw5UbSs5LhTy+1mxl+K59w1SndVct/enTiTHYYj2fuBhnMCnNHaSvXdjSUeCR6umb+H
         BA+rL6FaE+FknKvoBOC00/3Mh1EJul2FYTSqVvlEcf9mmYZjC5u+ouINinhPFLySOg7r
         Mj779b52bvu+aNcIrpWpMcAsMo1G3zPXEJNfxOkGn3SI0zSPKvjnyGh1VS5Q01lGjGxB
         MnHVozSMzFU3dX/FCxoNqNMCt3l/+WXLlgY7K7lgcdcbbf3QvvyFf0GF9er8Mqigz27h
         cQ7A==
X-Forwarded-Encrypted: i=1; AJvYcCWaMtc0nJN5XSPKzKBC8Qhy7go97swwjjOq8wtbLIxeN+4prdycijassAA4ucSWpiwLIimxnYuPOri1nIs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDvl+CzsEFNFbxBuOypAaOzkzsB8CWnOOVC90XmiquydN3RB4Q
	5VIz9hjP6LWeryj6GpaBen8Ckp6ag9upYebT9IDfsXHEoZ7atZHl/fPXNm6eq0DTbDcXwuOmy3j
	kxAHZa75Z16MDAj7UKNhEKIswbVXlVvzNc7Qpu5OfYmIHYsC4470OYYtGI+KPL9ciBA==
X-Gm-Gg: ASbGncuE8qbyQdg544kwYS2mdXd1f64VvFRKVTUHKuEI+JGtt4w0RplZhXHnY5OVYXy
	GY5QUJ/MoQ459fpQn7mUEuKqK7ApQZwP/vAUIiKhYpjN3TP4BoTLlatdQFnjjyrxKq43RJ+LI+X
	1JNyX7dNRtd63krTAtxACqUtNHhP6mH7vqB0UFpO6sLQcT05D4VIeLe2ZVEdDhXXYDaGCMlD2s+
	0aGGH6KDLPeDh+tdAH7z1Qj/HwNkRKA4ckAA+2IX9BqaPVeYKilqa7RQi2p3kTgTy/Z5fZ1oybl
	zzswG1BQxqLAYa4v24LoJ6T+/q1O0NS2tVhrWSPyvtg+VFlk7yYjXnRJHDC98b5xC/iDoIF2hJd
	99BXw4Q9rByU6M8r6o/O2UQ33e3moCOdKtgN3qU173H33Qag=
X-Received: by 2002:a05:620a:4550:b0:88b:72c0:7a21 with SMTP id af79cd13be357-890715afdedmr556004685a.88.1760717812053;
        Fri, 17 Oct 2025 09:16:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcML73PykNP4J5vPsxpgOOWM+Qo41mFbqelhsjbgi1YnpNrnGwnfYAwLIrEVqfizwmfi3vaQ==
X-Received: by 2002:a05:620a:4550:b0:88b:72c0:7a21 with SMTP id af79cd13be357-890715afdedmr555998085a.88.1760717811482;
        Fri, 17 Oct 2025 09:16:51 -0700 (PDT)
Received: from ?IPV6:2600:4040:7c4e:c200:d6a:7ca8:b526:8eeb? ([2600:4040:7c4e:c200:d6a:7ca8:b526:8eeb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cc8d5edasm1827485a.7.2025.10.17.09.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:16:50 -0700 (PDT)
Message-ID: <8ca5fbdb-457e-4c65-af91-539dc2f850fb@redhat.com>
Date: Fri, 17 Oct 2025 12:16:47 -0400
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DISCUSSION] svsm: attestation: if and how to authenticate the
 provided secret
To: Nicolai Stange <nstange@suse.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Oliver Steffen <osteffen@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, coconut-svsm@lists.linux.dev
References: <a6188e4c2eb11ac6fef4eab605666d15c3f604c4.camel@HansenPartnership.com>
 <fe4fcbfeb22c26c8172960551d5721d2919a7004.camel@HansenPartnership.com>
 <203dfa61-dd55-4fbb-86d2-c0cef55eaf27@redhat.com>
 <91799.125101707314800421@us-mta-315.us.mimecast.lan>
From: Tyler Fanelli <tfanelli@redhat.com>
In-Reply-To: <91799.125101707314800421@us-mta-315.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VLaTCQPSCWQNLPpHzeK88J_cu0en6E4xOS6kB-xFhcY_1760717812
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/17/25 7:31 AM, Nicolai Stange wrote:
> Tyler Fanelli <tfanelli@redhat.com> writes:
> 
>> On 10/14/25 5:40 PM, James Bottomley wrote:
>>> On Tue, 2025-10-14 at 22:56 +0200, Nicolai Stange wrote:
>>>> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
>>>>
>>>>> On Tue, 2025-10-14 at 10:45 +0200, Nicolai Stange wrote:
>>>>>>
>>>>>> as I don't want to hijack Tyler's recent attestation PR, I'd like
>>>>>> to continue a discussion started there and best summarized in the
>>>>>> comment at [1] here.
>>>>>>
>>>>>> The question is whether or not to have the KBS authenticate the
>>>>>> secret returned to the SVSM upon a successful attestation.
>>>>>>
>>>>>> The current state is that authenticated encryption is being used
>>>>>> in the protocol (AES-KW + AES-GCM), but that's only bound to an
>>>>>> ephemeral ECDH key, hence doesn't link to any root of trust.
>>>>>
>>>>> Could we wind back a bit?  This discussion seems to be starting in
>>>>> the middle.  Where does the encrypted state actually come from?
>>>>
>>>> Sorry for being unclear -- this is one of the open questions, see
>>>> below.
>>>>
>>>>
>>>>> The threat being that if an attacker can supply the TPM state to
>>>>> your confidential VM, they know all the TPM parameters, including
>>>>> the private keys, and can fake any attestation.   In the non-CVM
>>>>> world, the state is usually part of the VM image (encrypted), but
>>>>> this happens because the TPM is running outside the VM envelope and
>>>>> suspend or shutdown can pull the encrypted state as part of the
>>>>> device state of the VM image.  In the CVM world the state is stored
>>>>> inside CVM in the SVSM and has to be inaccessible to the guest.  It
>>>>> is possible for the SVSM to encrypt the TPM state and pass it to
>>>>> the guest which then saves it in the VM image.  In that case, proof
>>>>> of correctness can simply be supplying a key capable of decrypting
>>>>> the image.
>>>>
>>>> The current plan is to not involve the guest at all. Instead
>>>> - a (small) block device will get attached to the SVSM, via virtio
>>>>     currently,
>>>> - there will be a filesystem on that block device, which is encrypted
>>>> + authenticated with a (symmetric) "filesystem root key" known only
>>>> to the SVSM and
>>>> - that filesystem root key will get revealed by the KBS to the SVSM
>>>> upon
>>>>     successful attestation.
>>>>
>>>> The TPM state will be stored in a file on that filesystem. UEFI data
>>>> in another and so on.
>>> On this, how does the guest know it's pulled in the correct image?
>>> If
>>> I were a malicious host, I could encrypt my own TPM image, accept your
>>> attestation to a KBS I control and release a key that decrypts my
>>> malicious image.  I think you give the answer below:
>>>
>>
>> We intend for the guest's rootfs to be sealed to the persistent TPM
>> found in encrypted storage. The malicious host could switch the TPM,
>> but that TPM wouldn't be able to unseal the rootfs.
>>
>> This doesn't directly prevent the attack you mention above, but it
>> would be a DoS.
> 
> So if I understand correctly (please correct if I'm wrong), a successful
> unlock of the guest's LUKS-protected rootfs would act as a proxy for
> "the SVSM is using the right/genuine CocoonFs image" in a sense?

That's not necessarily how I see it. Instead, I think it acts as a proxy 
for "this SVSM has proven to be running in an encrypted enclave and is a 
validated version that I trust, I can now continue with the boot process 
and load my guest firmware/OS". We attested the bedrock of our TCB in a 
sense.

> 
> The problem with that, for remote parties, is how would they verify that
> LUKS disk XY had been successfully unlocked (assuming the guest has a
> LUKS protected rootfs in the first place)?
> 
> I mean, take keylime for example. If I'm not mistaken, the verifier
> component has a list of trusted "OEM IAK/IDevID Certificate CAs" ([1])
> configured for its $TPM_CERT_STORE ([2]), with the IAK/IDevID being
> signing keys on the TPM. (*) The TPM's IAK/IDevID being signed by such
> a trusted CA is what establishes trust in the TPM and its measurements
> as far as the remote party is concerned.
> 
> With "trust" meaning trust that
> - the TPM implementation is correct and
> - the IAK/IDevIDs are keys on the TPM and never leave it.
> 
> In our setup, with the SVSM attesting to the KBS, it's ultimately the
> KBS enforcing the first part, by only ever releasing the persistence key
> to well-behaving, i.e. attested SVSMs.

Precisely. The only scenario protected against is one in which the 
persistence key is released to an SVSM that isn't verified to be 
well-behaving or within an encrypted enclave.

> The second part however, is true
> only if the SVSM actually does use the secret key obtained from that
> very KBS for the TPM state persistence.
>

Sure. TEE attestation only verifies an enclave's TCB. It makes no 
assumption of what is done with the secrets once it's attested.

> So if a relying party, perhaps a "OEM IAK/IDevID or EK Certificate CA"
> requested to issue IAK/IDevID certificates for the SVSM's TPM, wants to
> establish this trust, it needs to verify both parts.
> 
> For that, we need confirmation that the key from the KBS is used for the
> persistence.

I've been making the following assumptions:

- The vTPM was provisioned and stored within encrypted storage.
- The key for this storage is stored on a KBS.
- The key will only be released to attested SVSMs.

Therefore, the very fact that you are presented with this vTPM is 
implicitly confirming that the key from the KBS was used for 
persistence, because the vTPM wouldn't be decrypted otherwise.

> Proof of possession of some secret pre-provisioned offline
> into the CocoonFs image, like a LUKS key, might work, but I don't see a
> straightforward way to make that universal and also, it would make the
> initial setup more complicated than need be, IMO.

One note: KBS attestation produces an EAR token:

https://www.ietf.org/archive/id/draft-ietf-rats-ear-01.txt

Once SVSM successfully attests, it will receive this token. It would 
then write the token into encrypted storage as a sort of artifact. If 
the eventual guest would like to then read the token and verify it with 
the attestation server that SVSM used, it's able to do so.

Not exactly "proof of posession" of a key, but proof of attestation that 
the guest can use.

> In particular, access
> to the persistence key is required for that.
>
> If OTOH we were to follow the route to associate the KBS with a ECDSA
> key, and use that for (indirectly) authenticating the received secret,
> then we could make the SVSM present that to the organization's "OEM
> IAK/IDevID or EK Certificate CA", alongside evidence it's a SVSM, and
> the CA would issue a "OEM IAK/IDevID or EK Certificate", because it
> recognizes the KBS ECDSA key and trusts the associated KBS (and trusts
> the SVSM to have verified the ECDSA signature). From then on, relying
> parties like keylime would only have to trust that CA, and workflows
> would be no different from any other TPM. Note that it wouldn't matter
> when and where the initial TPM state is getting manufactured.
> 

It seems that this is attempting to cryptographically prove the 
assumptions about the TPM that I made above. I'm in favor of that, as 
the implicitness of having the TPM proving the guest is attested is 
likely not enough.

> Moreover, any subsequent usage of a certified IAK/IDevID or EK would
> henceforth be an implicit proof that the genuine CocoonFs image is being
> used, which could perhaps be used for establishing trust in the state
> stored by any other subsystem on the SVSM's persistent storage (UEFI
> etc.) -- as per its global authentication: if anything on the filesystem
> is genuine, then everything is.
> 
Sounds reasonable to me.


Tyler

