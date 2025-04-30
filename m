Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B7A79FE
	for <coconut-svsm@lists.linux.dev>; Wed, 30 Apr 2025 04:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745988452; cv=none; b=qoAUZnm3YdJrUUP3xfnu1WCEMLnbSjKx8ZcOb6D8CkkFaqJw6dLicpX0FVaQsbn1KoXLzBuWQPcoZ44g5OiluyobiXfrFgIgdhIX0xPFbLEuh0v3HdYnzvCkwBA5XxqlSsxWLIwfnB1i+nk/pPx3QMlcFOzQcOz6q24X51tAwNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745988452; c=relaxed/simple;
	bh=9FfbGsk24rJWbRc0Yf015KtVC+PzMLlir/QcC5+Vp8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhUd1f+5Fs3fde7PALlCdJRtb0XjJ394r+bv3AeM7J2y/s2i8MsRjzQehSL7h5MqLfKq9UqovriHDXbPJglZL/keScMJ8nYjptfyh+SV0PZ7Xzt1yHyIyzu3M9J8GgREOlL3UMPTgOe/Il2bdUThxzyfoQqKX4fit9uJNHY4SPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EXp890dv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EXp890dv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745988449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=84b4sFCza8grOoMBG+HHICfXCatmjOGMOm7BrAybkUw=;
	b=EXp890dviv7M4xt7bPNtd61ZEMvFJdUUN1/jtkHk8cuhIKZmx7NhSI6Kz+ESzbwxzmLoVG
	UGdrYXfmdA2pwCM3tzi7bnuTplDLB6E4K+eO0QAelpXlY0fmVbdwDv57MPNJVsS/kUnEqt
	4AQ9JCzRnbrmoRzRjb4/MRu025HNIb8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-N6DP3YBBNPGiZ1Th3lL_oQ-1; Wed, 30 Apr 2025 00:47:28 -0400
X-MC-Unique: N6DP3YBBNPGiZ1Th3lL_oQ-1
X-Mimecast-MFC-AGG-ID: N6DP3YBBNPGiZ1Th3lL_oQ_1745988447
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476b2179079so124878231cf.1
        for <coconut-svsm@lists.linux.dev>; Tue, 29 Apr 2025 21:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745988447; x=1746593247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84b4sFCza8grOoMBG+HHICfXCatmjOGMOm7BrAybkUw=;
        b=NswbJws5XJ3/R7cq4gARpGA7uFJZaulczWd7K8XFh3Rb4E73WgxditCB13/ncXpzPB
         Sg5czhvAF1KpSMYYds5YAlTTfvhxh55E9DiD+On1z9olwLSc8n0Ts+lHXp1p6q40x2e8
         Lv17nO4xc4FJuycx2MtQ5JIGC54ZKLUOpVouVjUat9Tf1GIJnFqJcPi2kN8PhlXSHOC4
         T3RLQvUDBbY2juBF9ZD6RbNNzlsCVtjw4shx/S/n8cgiLC70JyblGY+xSD+GP3zZuh8W
         H2OK5VMZB/JSNh8CqvthFVBTdKWFK1Y61TTh59r6oMU4+pK4byZ2Orch4+8Bz6Vf9AS3
         K+yA==
X-Gm-Message-State: AOJu0YwTjI7zoVPRRfTzWyzhvQg20EqrFZN1IxtGWiQ9nfU5qMG4yd9T
	Be/9qrKyLMr4UAeYjX0wtRDSwi3HilzUxWZAY9Z9vCN4YSdXcD+cdzhLef2dm77omjQUXCMaLCS
	cuvP0cGPB2g9u+HaUJmNOh7MvsFBH7pfw8BX4l50TZ3yqkMuE8elM/CTWI4RDnA==
X-Gm-Gg: ASbGncvsQyfr653dQUigf1DJ2K8pn4EzP8QVFyO8r1n1lg0Fgsxsb6rPBsHnEcC2t/5
	8p+2/MZZarM3p8tg/uoObhWJW8xH2A3iNx83QFJ/Lv9wcOQuFcAqVR03QozA4ekQ7Mtk7nGx0FP
	wqHpR0vqUza7mJ+ueX0/y3eOP4nV4Ohn5vYyGkhJ/Mn7r9WMGd/dI9icuokVvo4hv0cOf7YTDUJ
	cfizGi7MqtA0uVLyRvIAyZfJDTjblRv3KRIyndOJeU2sHSB9m9xs+PUo0iYoYNXYlZ4srKf+8+R
	Hg4wiKKTVeg7FDPvLR64WuqZiSfAcO6wv5OQepLv9+e4eZsOJnTw/+cC3xg=
X-Received: by 2002:a05:622a:5448:b0:47f:d11:5b4d with SMTP id d75a77b69052e-489e69a58fcmr21192931cf.49.1745988447551;
        Tue, 29 Apr 2025 21:47:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcPxCn5cQEmjt5lJ3I+Dqy22hHCnvd4H39/XtMPtXkrRKy7gT6vGGXSiTU6e73OlM2HEvAjg==
X-Received: by 2002:a05:622a:5448:b0:47f:d11:5b4d with SMTP id d75a77b69052e-489e69a58fcmr21192811cf.49.1745988447274;
        Tue, 29 Apr 2025 21:47:27 -0700 (PDT)
Received: from ?IPV6:2600:4040:7c4e:c200:d6a:7ca8:b526:8eeb? ([2600:4040:7c4e:c200:d6a:7ca8:b526:8eeb])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ea1794482sm88195291cf.56.2025.04.29.21.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 21:47:26 -0700 (PDT)
Message-ID: <e1ade6fd-53f9-43d1-a270-4d233194b4d1@redhat.com>
Date: Wed, 30 Apr 2025 00:47:25 -0400
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ECC keygen for PR #528 ("Attestation driver and proxy")
To: Nicolai Stange <nstange@suse.de>, Stefano Garzarella <sgarzare@redhat.com>
Cc: coconut-svsm@lists.linux.dev
References: <25558.125041610080302253@us-mta-166.us.mimecast.lan>
 <CAGxU2F5aM_GXbcbOocrwpsGS4H+1i7O9xM4MhKrx8ycGOgah=w@mail.gmail.com>
 <96587.125042918523400199@us-mta-360.us.mimecast.lan>
From: Tyler Fanelli <tfanelli@redhat.com>
In-Reply-To: <96587.125042918523400199@us-mta-360.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PlAns_P0j_9q741I8kr_ZoccbKXJtB08JLIM144kurE_1745988447
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicolai,

On 4/29/25 6:46 PM, Nicolai Stange wrote:
> Hi Stefano,
> 
> Stefano Garzarella <sgarzare@redhat.com> writes:
> 
>> On Wed, 16 Apr 2025 at 16:08, Nicolai Stange <nstange@suse.de> wrote:
>>>
>>> I managed to carve out and cleanup the first batch ([1]) from my work on
>>> an encrypted FS by now. The FS cleanup itself is still WIP, but the
>>> crypto parts should be in a usable state.
>>>
>>> As mentioned on last week's svsm-devel call, it might help with
>>> addressing those stack size related issues with ECC keygen in the
>>> context of PR #528 ([2]).
>>>
>>> I prepared some example code for generating an ECC key with NIST P-521,
>>> to be found at [3].
>>>
>>>  From some lax experiments in userspace, peak stack usage is at about 2.3kB.
>>> (Which is still way above what I would have expected, given that no
>>>   buffers are stored on the stack. I'm currently investigating that).
>>>
>>> I'm not sure whether merely generating the key is all you need -- FWIW
>>> there's also support for ecdh, ecdsa and ecschnorr, in case you're
>>> wondering. I'd be happy to come up with some example code for these as
>>> well.
>>>
>>> Please let me know if you have any questions, either here or in today's
>>> call.
>>
>> Cool, thanks for the example code, I guess this can unlock for now
>> Tyler's PR and FS support, but as we discussed yesterday in the
>> community call, the long term plan is to use OpenSSL/BoringSSL. I'll
>> open an issue ASAP to track that work, and I'll start to investigate
>> it.
> 
> I've implemented a BoringSSL FFI backend as a configurable alternative
> to the cocoon-tpm-crypto now (example code is updated accodingly), and
> did a POC integration into SVSM, c.f. [4]. Good news is it still boots :)
> 

Thanks for this. I'm currently updating PR #528 to use cocoon-tpm-crypto 
for generating ECC keys. For now, should I err towards using the 
BoringSSL feature?


Tyler

