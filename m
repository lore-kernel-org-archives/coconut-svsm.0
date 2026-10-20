Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519683;
	b=MbsA8hLVKcJdf4xKEhuCeOarLYyobTvEmga1/TuuafjXAoqRKo1lLZK89So+nsswKfHU
	 lf6tieAW5JxNYIsYTxw40Jfy5CMEuAVpmigsZrOaBVUIq9iKzLNAEEM/NIbiyA/en1ix8
	 Dk8Zc7cSTpDlEvCewGaPfJuGrOHwL/6s9eRRp/NEKlz+nKD+UVwrsULF8hcWL16RAWPRk
	 ELSn0ZQInT3ECVzYrzmJ7/FRZJlXCzt260w7WzsGbdhiieGegoxRM6o8OhZmh5MN7N4i+
	 wWG/TmTSzoZFAv5iHxMy/hxTZkyCK/SWxTlmG1HwcinAXVOIYjXPC09esj98KQZyyvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519683;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type;
	bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
	b=fGxsj3L67vqPKsU3yqX1lWjR2KHikZIf5IQKjm3m4q4zDjndYltBy7D6A9lS7P2aYbq3
	 3DQ0e3Ib1oLDVJZSKSogO2kntMZzqvSmQfWRnjyx5bvAAqt0fENPnsHpH8COfCsgkOz+8
	 ksWbjiasOxgjyn6UvxmQXsJtqqmPZiOE3wbQ/DGEOkdcyg8y1ujsorzlL81QbgmCCI2aT
	 qj65GL1aM4rAQfDCIr7bj6hRHI1NlO2xLtXCbyK/ldEU1xjyuzHWWByhJhIXg9MeqpDEX
	 4lTsal0Qg5CI2o504ADcs+i0e0NGx8ZDfCky7ll8NFSeffIqYGqFyAl2TOlcIMDZ+Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jVmYeMyZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3088606A319
	for <coconut-svsm@lists.linux.dev>; Tue, 20 Oct 2026 18:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3088606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jVmYeMyZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792519681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
	b=jVmYeMyZ9bIrOakPejUol+EvA2EJqC71ywVNYrtNGNSRTrGyWR0jO7Qw3NHJr6EPVlUSea
	lyifNXXNXSWtn8HwgBe+rBpbCZ/Wb4Ir6UK8PbcAHSalCy4IXXHlbbbr0g4pUOD8vvfc/Y
	PgHG0QEm/kEYW3yAMRh6bJxnwMDrujM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-8nQvCcyePN6nIQJ5__TlrA-1; Tue, 20 Oct 2026 18:08:00 +0000
X-MC-Unique: 8nQvCcyePN6nIQJ5__TlrA-1
X-Mimecast-MFC-AGG-ID: 8nQvCcyePN6nIQJ5__TlrA_1792519679
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e818ca61bfso30436405ad.2
        for <coconut-svsm@lists.linux.dev>; Tue, 20 Oct 2026 11:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519679; x=1793124479;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
        b=VA6TEZNxgv5K/x2RdFIZIqpnh8dE2xdcVLYLW/Nu9YCzxFowOoWNb/SzL48l5qA5Gz
         u84bik5AT+pwg/GRkKu/lHz4C5NV7cckZSnt7eMbMfvCbKDG9B34UsUtqwCimV9skSsS
         9Q+e0hvTm0HtH6Exxg4UWI4lEBTZgCNvKMiJH2MCUv4E3+x/SMBgcB+UdYIxvQzgIU2q
         2flADe9Mxu10mPrc+0t7nP7fuaJK17qY8PK14NRQPEjdE+FLyyda7lbYBNdWrVQXS+Tj
         +qaXwNekJdHvAw9w1EEoz60K/IMIEQKWmE67RP52I2aMC0HdjVXhsAzBSUZXDlhuZ32Z
         vkvA==
X-Gm-Message-State: AFq9FYJGA0fU9MpQev34sTzKDWrkHSH0LYdXuvibS6Zp5bVelE60kfHV
	S343qBc0xf6GH3B7ZtAdo4NuL3sjsfiiBm8N0rg/+n1vZWxfInn+N38oZ6/5dQW8nNvuukRSynj
	E0dToYS1hoHooOQ/CF1rgnwDKjNvNy/e+4BpVA8Yv+iccTvhpaCUCVsLTWcUpyBcy7K+w71A/AU
	OetSrqYIEseITY8HMpwbcRcw8qlFeqVgxGCDEVSo+rOYbhHYu+
X-Gm-Gg: AYBFou3NZ5k4nRRLabcKejGD5xk5EgSLi2CpW2DCw/guH9/q+CbxM4XsR+iyaV9Rm5g
	ACPzSut6taC/Dki3KcQSMuuvKMwhjvAAZJle4aulep7+MHtCzaygj3b0FS1ggpy2LjCbRe5SEfe
	2GxCr3ZkNHH8iR075xN2risSpB2jekHqSvUMQoH+34UkC5Eqe1PObTu3iu
X-Received: by 2002:a17:902:ce83:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2e9a69f7224mr102884725ad.19.1792519679119;
        Tue, 20 Oct 2026 11:07:59 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:2e9:6352:6c61 with SMTP id
 d9443c01a7336-2e9a69f7224mr102884535ad.19.1792519678550; Tue, 20 Oct 2026
 11:07:58 -0700 (PDT)
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <aqlXypyTlhuLRVmD@8bytes.org> <CAGxU2F4VaSUGe7QkhqCm2=AzcYxzZqgxm+yjk=QTRkUTxq_3Ew@mail.gmail.com>
In-Reply-To: <CAGxU2F4VaSUGe7QkhqCm2=AzcYxzZqgxm+yjk=QTRkUTxq_3Ew@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 20 Oct 2026 20:07:47 +0200
X-Gm-Features: AclHuK8gyhvcHmD5hX_iUDvlrI0WRLZ-WRmf8s24k9YFuz3ZgH6kSPpmE4GTYFc
Message-ID: <CAGxU2F5=Yh_ywLJ0eNAeL_Cqa6LNeThN3r8upRKaXs6ZBed+ug@mail.gmail.com>
Subject: SVSM Development Call October 21st, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KH3mm9DcGkE0fTt63vdvAkwRLKQPiuvZXVyjUXDIsfo_1792519679
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this weeks SVSM development call.  Please
send any agenda items you have in mind as a reply to this email or raise them
in the meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Ciao,
Stefano

