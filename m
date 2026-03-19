Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17113D6CA0
	for <coconut-svsm@lists.linux.dev>; Thu, 19 Mar 2026 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938332; cv=none; b=PYzK8bCHbAAgva9BV4Nz8wWA16O6tF7WOmhjPxhJmLXDquRohaDaeA4v5RddR1hanAJ0iWHNpyZYvtX9JliYyYln/i2GcGcKFWuCISffx3jAut6NKoHqczIaHG/9DRbVYy9z/JuxtF5E5RqQPlfFOeMCpK70hjSO/XMxL883VgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938332; c=relaxed/simple;
	bh=T7Qm77ObK1ZS8Nc0Y/AnhyHVyNdqDQ1QQXwsAj8JCCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTPQkNyK6wq8FgsTSx7GOIljGSqGUkzMLfuxOzDHwCuGdlpYG3bO2YWJ+sgcj+LupA1MXlwRUmt7A9+dVUKeXoigWa3rC4sIB8Hiq3QE4gvR/xiR5xHnmDwyBY3YxwfKeg2symJrVhfXrLuT9rgPnhTUkfMlDIz/lpT/bKDcWJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+FAwJCh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f+FAwJCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773938323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YEIP6Juk4COKz1EgfVWIT5Ghlg8+2B6pboQ4sbem0+8=;
	b=f+FAwJChGOa1HjPY2O9fAL2VzgDo85LainhdL7/jy/ID2jkTLpmjQhwFG3w3R9cxZb6xWr
	b09YwHvAI3PQSmfUeQMEgADW+vwFd0ZEyh2Of6uoFW5R3QyjxguMH47B6P9QFTsVoQcCbR
	jrFSxzKpDJVe02aPH7URiwoVgFMY2hI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-4ORqn3_CMzukRNLne50y3g-1; Thu, 19 Mar 2026 12:38:42 -0400
X-MC-Unique: 4ORqn3_CMzukRNLne50y3g-1
X-Mimecast-MFC-AGG-ID: 4ORqn3_CMzukRNLne50y3g_1773938318
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a0684d05dso146163806d6.1
        for <coconut-svsm@lists.linux.dev>; Thu, 19 Mar 2026 09:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938318; x=1774543118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEIP6Juk4COKz1EgfVWIT5Ghlg8+2B6pboQ4sbem0+8=;
        b=nbzq4RuOQ5Q1YhnrSqG2kdAlVB856qcMzoF8RNnPYX64Bv4RaFupjfKdoByFkua/Ts
         PuNhBlS3RrbpM2S7O1BxWimjVeIoJSRknsqGLlJyNDhCdkVaUbLHSm+lkfUuxRkIKPol
         suDoGpRqz+1KaDkgL+JmWhsKQQJLnOT6V5tD/a3re86isyOamV4IB6HVBK2/yDYnanjg
         6SfwQXwHU5Z073tp1XpMUzggCUzedeLSfWxW1jalGzdlQNbw8dp4b/OzigUNSMaJFsH1
         63vJLWEm2iJ8bv8hEFBd4wCw8TeSqJox+i5+nW7GqGGEWq67jNLdeBJCTrTkl8EnXWPO
         n7ew==
X-Forwarded-Encrypted: i=1; AJvYcCUIM9jNTrtNoivxjByJ0KU8YqVXy1IBW+Xp5ptYecHvAbCl4u4YHB4gPI/swMXlz/PnSvCdgP4CWwTrfnY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHnp8kT5nke1ZRl18cCZbNbku0i3WpgcdwqGE29WLfhbj5hEcO
	iS2K9VTldog0aLME2Rp9pvegpEh4rL3O9MVAUpSgb77bwzqQ+IiP+DoA7qQtld9cLUz+3RNqo1Y
	qyGrgQXeq5NMDr51rxxGL7ynbjV0hWi41CSLUGKkTYaGPgnH41OY2O2i0fR1Py/ABfw==
X-Gm-Gg: ATEYQzzOMAPQxtF6q4rpD+JWZHOpHWUkeD02oUWPOvVXrSyvmHSSxgtezAtttEuq7x3
	QTtA0z7jN9Ru5cb2WGMTYwuquaWLRYhj1i+aQTQj3pn9WNkr2tyHOFUlwFc7oeZJasxZ+Zcxaix
	YitGB0yQwTIfwTcPEHJRoOVioLWI6GUR1pvDIUkmG2zYXL5UwGLtHAXFK0mASO3vULtwky6yl/l
	E/YZXNv9yzFlawTe+wR0OMMAqPL7KNjCTWGWNtkLSbM2B0P3QXX6cccdMSa+EPpUZMvPHUDP2Qt
	tXkLO3BvHZtYI8YR0xTXR541hglM33CuE+990UbHSLE46OCWgcgEVBqL5i/HFR670cSOzVi9cND
	lWFCB9cpZmVMva3eTpkDbxsxii5IByveRYNOVVZ3lJBYlRClEsqD5z6WfNIL6sQoVS/dS5w==
X-Received: by 2002:a05:6214:2421:b0:89c:3da4:bcbb with SMTP id 6a1803df08f44-89c7744cecamr64079176d6.19.1773938318429;
        Thu, 19 Mar 2026 09:38:38 -0700 (PDT)
X-Received: by 2002:a05:6214:2421:b0:89c:3da4:bcbb with SMTP id 6a1803df08f44-89c7744cecamr64078746d6.19.1773938317949;
        Thu, 19 Mar 2026 09:38:37 -0700 (PDT)
Received: from ?IPV6:2600:4040:7c4e:c200:d6a:7ca8:b526:8eeb? ([2600:4040:7c4e:c200:d6a:7ca8:b526:8eeb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8534cc4asm351476d6.36.2026.03.19.09.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 09:38:36 -0700 (PDT)
Message-ID: <0dc9e41e-82ff-4198-886d-de1361cbf86b@redhat.com>
Date: Thu, 19 Mar 2026 12:38:35 -0400
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DISCUSSION] svsm: attestation + CocoonFs:
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Arun Menon <armenon@redhat.com>, Nicolai Stange <nstange@suse.de>
Cc: Oliver Steffen <osteffen@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, coconut-svsm@lists.linux.dev
References: <873427gf9x.fsf@> <abvlcdh_zJPWUEwG@fedora>
 <d401924e31cd39fdcb42008f8108c2bc8273efa0.camel@HansenPartnership.com>
From: Tyler Fanelli <tfanelli@redhat.com>
In-Reply-To: <d401924e31cd39fdcb42008f8108c2bc8273efa0.camel@HansenPartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ikVSEe7Jp1ZmDM_1MHKyBtD4TLnZBL-45WenrOe-1kk_1773938318
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/19/26 10:04 AM, James Bottomley wrote:
> On Thu, 2026-03-19 at 17:30 +0530, Arun Menon wrote:
> [...]
>> 1. Provisioning: Generate a TPM state file (NVChip) externally with
>> the EK cert and other metadata. The tool starts TCG TPM simulator and
>> then    writes an EK cert to the state file. [1]
> 
> Just a couple of notes about this: firstly your tool seems to generate
> an ephemeral CA and then sign the EK cert with that.  The problem with
> this is that it's the X.509 chain of trust (to the CA) which gives a
> persistent TPM its proof of trust.  An ephemeral CA basically voids
> that so what's the point of the EK cert?
> 

The tool isn't complete yet. At some point a user will be able (and 
likely required) to give their own CA to sign the EK.

> The next problem is how should we correctly prove trust in the
> persistent TPM?
> 
> Obviously, for an ephemeral TPM the proof of trust is the Launch
> Measurement (verifying the implementation) followed by an attestation
> of the EK by the SVSM obviating the need for an EK cert.
> 
> However, for a persistent TPM, the proof of trust would have to be
> something like the launch measurement (proving correct operation)

The CocoonFS decryption key is stored on an attestation server, with 
release/unwrapping only permitted upon successful attestation (i.e. the 
launch measurement and other parameters). This is how we prove correct 
operation.

> plus
> something tying the current TPM state to the proof of non tampering
> with CocoonFS itself. 
> The EK isn't proof of this because if something> compromises CocoonFS it can leak the EK seed and an attacker can
> replicate the state including a correct EK.
> 

Is that the responsibility of the TPM? If something is within encrypted 
storage, is it really up to that data to ensure that its storage hasn't 
be tampered with?

If it is, perhaps we can embed some extra metadata alongside the TPM for 
some form of integrity validation (a boot counter, perhaps?), yet at the 
moment there is nothing strictly coupling the TPM with the CocoonFS.


Tyler

