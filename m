Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F7C134AC
	for <coconut-svsm@lists.linux.dev>; Tue, 22 Apr 2025 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317950; cv=none; b=W8TzPwPb8D9L8Y1KsBMLJ7EgNFBfYaMapjKmFmKBIUBQO4NuJiwQ7VJX4jj22KI4DwKk9XFgJ9CNi8toq3pGT7FNRmAxYOt05fURHLm3N731ON3/cCNge1itQ1UzzUkzBm5EIEvAhxZwQs4XcZqmCvc0R6ccoP3LJG70ISeOZuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317950; c=relaxed/simple;
	bh=uXUclXfQ4g/kLy1cYlU72xPA0GoDKa7CpbDUXxz02uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HE9vStv+bAa8Hw19iMwEDUvA0cwD6Obt6WIcJsfcIEPFHt6t54tARJL6JxbDfCk+8ZdOntniC3g6YGT4d26e8Em6IC/w9BwL3/IcmQlleicr8sW/Pjf1SFjP2xjRAU8akb5ffEsWcJ9VyNMv6rgF/h9jPX3zN3MPT9VhZ/1mty4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K6xKSPXh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K6xKSPXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745317948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Krb2pTCNl/PPJ+EaUdBfkkMN15tKixksRBf6pwNTRaM=;
	b=K6xKSPXhlZl7kKeiMmwGhrWx8mwK6sllC9tlB4pVCDSTU9FHY79hPSnOIE4oL2NeWJb143
	qCaqYtT9mvQgtahKe3AsZxp6YHGtjOd2ifJXubxqSl5dNap7tHM2hIeoho+5Rb5yej1qsj
	fy8T+vRNqYFWarasxfBtTHG592VOqX8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-5Jc7Lez8MsSjpW0-jL1Yuw-1; Tue, 22 Apr 2025 06:32:27 -0400
X-MC-Unique: 5Jc7Lez8MsSjpW0-jL1Yuw-1
X-Mimecast-MFC-AGG-ID: 5Jc7Lez8MsSjpW0-jL1Yuw_1745317946
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac6ce5fe9bfso480452966b.1
        for <coconut-svsm@lists.linux.dev>; Tue, 22 Apr 2025 03:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317945; x=1745922745;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Krb2pTCNl/PPJ+EaUdBfkkMN15tKixksRBf6pwNTRaM=;
        b=oRH/hmyc3R3BaijSMfFSfK8y0Rnje1KJZqF/Lx2377SDt4DLb3sFziGj1U7CW01SeN
         y4jnxM3q9+H7n/3uVSRuXlaF/ArO8CHY9EqKn49vlYj6/5dQuEcSpVD7oQL2i+ocb0mw
         ZUdSTVBNx231Soj8Ewwg3QuasFWCdvY+agfQp/HmTwhVEjOBnCI08Yt7D3hgdQkTJzlR
         k3nipVfp/VPKEdUNrsm9YZT5mfwCnLoqfOVs4HHJC7PixWiVahxyYZkc2+i8XMMwNlZO
         kpgrDpS4eKg9W2lOXL5PyHVFIWjmxvTNAfKjp5mKhE6sb06uRD8rYXJEgNaTwmxLLdh0
         J1SA==
X-Forwarded-Encrypted: i=1; AJvYcCXwf0cixZA4ipFSOnBXnPrZFyDTvHCXVOyPd00cMl+Okaq//Dd2v5BG29h5nR1jJNxp1Hbkefu9hTi34gg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpnpUh7OkvzSWgh51kxg72S3bElHSnib/CVdMeRFQlvSJU8LXj
	GcVytnOYwRPh5GrcNVkX32+Y7b4dB5Xd9ffpah5fXTwZb5kymq3hUxGQbw3QLMCa9OnG9I5fhTM
	bshkpUzSakpxulGoogJGuIoG5qQvDU1BveK0+0aorypV0nEvOH7ImCvswILFp4eN+RuT2FA==
X-Gm-Gg: ASbGnct3cJkxoonG03v/eVAK0DeguE0eML69LFXopIhVWXJLR5sZy221JJkvVlragWp
	SELTx+mwXFus4w4SqeQXWPGxha3yW52efKSdra+H2HfB28kwUawaCEL71qyFOl/TigFd3xXyfI2
	VPg4LwnzouDvG+PDgGCuP06eV2NuyO0iKEv4Bx0I2HQ+MTpVuYHDFKoJbsTwm8v7RArbklsgZnq
	ryFeNwybIl/M+HwxVC/+DR/+WtFRTHXbWk4J9Puf8ArtV0cdrULvmvA/gMSKNQhgWxzxQq34LD5
	M5luav5lxAbDTl6D9Q==
X-Received: by 2002:a17:907:86a3:b0:acb:623a:7292 with SMTP id a640c23a62f3a-acb74e14dedmr1278368666b.57.1745317945492;
        Tue, 22 Apr 2025 03:32:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ1Ttts3DH94nv0xmNUWrzIXFzeGTDLNNISQi1oH0rWviP/Th5gIBgRnrhTD32tTw6hf6whQ==
X-Received: by 2002:a17:907:86a3:b0:acb:623a:7292 with SMTP id a640c23a62f3a-acb74e14dedmr1278366166b.57.1745317944859;
        Tue, 22 Apr 2025 03:32:24 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.201.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb8b208af8sm495226966b.118.2025.04.22.03.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:32:24 -0700 (PDT)
Date: Tue, 22 Apr 2025 12:32:18 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, coconut-svsm@lists.linux.dev, 
	svsm-devel@coconut-svsm.dev
Subject: Re: [svsm-devel] Potential project on implementing AMD SEV emulation
 in QEMU
Message-ID: <j7jr7banmp3sosouogorf53brsfyktqugnwgjtl5gfikoinbl2@ckg4rytu75vj>
References: <CAGxU2F4X_yQS9zR7u6cPmXzt8-BkPwWf0NQt2f=GVQBp1BOztw@mail.gmail.com>
 <06e71552-c890-1577-8967-4d44fb8bdf6b@amd.com>
 <CAGxU2F7=TuWMrbUAE0fqwfpb4A82pNqtaf63Fq59P=7h6U8tdQ@mail.gmail.com>
 <aAdLw-1y-Zcz7mme@redhat.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aAdLw-1y-Zcz7mme@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QUSomcRiZj2UdXtlmlthCUEvNrEol5Xg2zraSHo1gUQ_1745317946
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Apr 22, 2025 at 08:56:51AM +0100, Daniel P. Berrangé wrote:
>On Fri, Apr 18, 2025 at 10:31:57AM +0200, Stefano Garzarella wrote:
>> Hi Tom,
>>
>> On Thu, 17 Apr 2025 at 22:14, Tom Lendacky <thomas.lendacky@amd.com> wrote:
>> >
>> > On 4/17/25 10:26, Stefano Garzarella wrote:
>> > > Hi Tom,
>> >
>> > Hi Stefano,
>> >
>> > > yesterday in the Coconut-SVSM community call we talked about a
>> > > potential project with the University of Pisa to emulate AMD
>> > > SEV/SEV-ES/SEV-SNP support in QEMU.
>> > >
>> > > Joerg rightly suggested having a step-by-step approach, supporting SEV
>> > > initially, as supporting SEV-SNP directly might be too much for a
>> > > master's thesis (about 6 months of work).
>> > >
>> > > We wondered if you knew of any attempts already made in this regard,
>> >
>> > Nothing that I'm aware of.
>> >
>> > > but especially if you think it's a feasible thing.
>> >
>> > Anything is possible I guess, but I'm not sure what it would take to
>> > accomplish that. Attestation would tell you if you're on real hardware
>> > vs emulated hardware.
>>
>> As I wrote to Dionna, I did not explain the ultimate goal well:
>> Test/develop SVSM and guest OS interaction without having the hardware in place.
>>
>> So that's why IMO it's perfectly fine for attestation to be
>> unsuccessful, plus I don't think it's even necessary to implement any
>> encryption.
>
>IMHO attestation is required to make this fully usable even for SVSM
>dev. eg consider the work underway for persistent vTPM, which relies
>on attestation during SVSM. It would also be required for any of the
>guest OS / application layer to test/devel SEV(SNP) support fully.
>
>I would consider attestation in scope for any QEMU impl, but I agree
>that encryption of memory is not likely a priority.

Yeah, I agree with that, by “unsuccessful attestation” I meant that it 
is perfectly fine for the attestation process to tell you that you are 
not on a real hw, but emulated.

Anyway, I agree that we should emulate the generation of the attestation 
report, obviously signed with a self-generated certificate (or even 
unsigned, but I don't know if this is expected).

Thanks,
Stefano

