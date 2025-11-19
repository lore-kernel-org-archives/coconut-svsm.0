Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984C5343203
	for <coconut-svsm@lists.linux.dev>; Wed, 19 Nov 2025 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546058; cv=none; b=s7Za+Rej5nu0elLRrklR7X0/KxuC4zYxMFOaKNuSRDx9kJoZZoeokUYzAcTK8KQ7U2hX7OXq9V6G8JaZRUZRtlf4W3RB/bPLPn0vwq+5OtnamODI3pvwO0evj3pJckijikKkzgH7spZz84yr8UN1BubhsCX+Vxn9d6TZIT6Eavg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546058; c=relaxed/simple;
	bh=6qe2vM6w9QWwqZIKObN3ZanS8usBCIOxQA69Tp3z8bc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ldFlNR19ZGuU4dGDyyz62XakQzaq8cIx7Xtgoi2jejMhcSnS5Wo19mM9Bfr+LIsDA7MVSJSV2gOsP389NSCXVden6c+xRK0IPmyumVpqY+wYo/TT8157IshH8J3FGW63mzmJ1hXiMgF0lnyg9MB9vk67JonoD1rcz6kjWWeYUjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cj8ycl4/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cj8ycl4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763546054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=6qe2vM6w9QWwqZIKObN3ZanS8usBCIOxQA69Tp3z8bc=;
	b=cj8ycl4/SNEhWdwf3Rcv/RXHchIV/M98CGkX5SWFMVWUcIz6H0bHIyWuHqAmaN1MCXX9mn
	12o7likpr61g53KD82c3sXfRiD6/gmOCjVCum3oQr+UCZmvlFYuKClfMXjI2DiOU2FqknI
	KGLEvzUTUKguJwQNwvMBqoXj50l+zm8=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-gPTocC_1O1WS9nufrVwgYg-1; Wed, 19 Nov 2025 04:54:12 -0500
X-MC-Unique: gPTocC_1O1WS9nufrVwgYg-1
X-Mimecast-MFC-AGG-ID: gPTocC_1O1WS9nufrVwgYg_1763546052
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bcecfea0e8aso695105a12.0
        for <coconut-svsm@lists.linux.dev>; Wed, 19 Nov 2025 01:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763546051; x=1764150851;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6qe2vM6w9QWwqZIKObN3ZanS8usBCIOxQA69Tp3z8bc=;
        b=peVP6FhLaya2lZ1oZ+f6rqQYloh+PVsVace+TUPjCpZElUEQf+7bml1MQp+JXHYiFi
         DLZVz0+463JLlDz1Y2tygbfEObyfes2z8/uICzNUF//8kMjok2kGbK+3m/QIGG4zWM9X
         ydZP1rIHBnQeEN0pTBltX5h7ZmKQuc/TAUm9k9Kgwr460QabLaVqAidUS5fOCN26j5l3
         mS655whptel3+RHrlnOJp3lpaoBZgb2kxvjx/YWT/wmud+QWDgkzd7eDLCn+4CGOjs1p
         9iYNOJEyvkE/+7BJmirfOvIVjQL4xJXhyylEY1qY098fBb6RsET71F4yCpLPB/zKP3jA
         7kMg==
X-Gm-Message-State: AOJu0YzOokFjeMvDNIj6T5tnad+1TvFdWe/uicRX8uMHJKD62/FXFr0+
	S4uvzAXl9Cvin6vrHuRwOTibwRtnhdspD4hQiO7W4LELjjwh551X3Vfa9ltmfXYu2i2CoJhJFOL
	iO+XJML8xOSa8KAEQHlLFvR6VK5r54JcelNhFI+NZLb3nAlObcUWLVIXVCJLz6VjGrzwyEuwNbD
	Jf8FAtEM2muWSKyZbEQWIl6SyRKvlVPU6G3nPRi4aLVhtgiKwENtw=
X-Gm-Gg: ASbGncvn2VesLZUTjczf0Y7yZan4DfERygEj5VSmA/CdK9KClUPBXW/YE0Tyk2OAP10
	bkTuLHnkyOSMI+brcGnQUs43YESLa/4HekbATSQ/KfhxqNc55gQTdHWVcLyxLDvJV0GScnmihDa
	HG896doo6crJWCEGHi4LbYrkYmNW16705fX2FRBVGloNjUXxrlTTx7SBoS30H8UykQ
X-Received: by 2002:a17:90b:5403:b0:343:78ed:8d19 with SMTP id 98e67ed59e1d1-345bd18ac41mr2230970a91.7.1763546051436;
        Wed, 19 Nov 2025 01:54:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeNM60pElBvjYTLbgbMdqRQ+jrNGtETDCC+Zz2Y4RIHdcDchmNyuC69vtc/OKVW3+wDNaINAwrJONzEK82+n8=
X-Received: by 2002:a17:90b:5403:b0:343:78ed:8d19 with SMTP id
 98e67ed59e1d1-345bd18ac41mr2230954a91.7.1763546050980; Wed, 19 Nov 2025
 01:54:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 19 Nov 2025 10:53:59 +0100
X-Gm-Features: AWmQ_bkBkPj-e-Ff2iIr_EramZxYiyLpLPSUlXp81ozS2AmSdTF1CD-FcEt-yC4
Message-ID: <CAGxU2F4w0HQ=WXoZVKuvLak08gLQJQx7Yn-pwk2z-fnhrd6uJg@mail.gmail.com>
Subject: libtcgtpm cleanup after recent merge
To: coconut-svsm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qaJbrpX9zOBlnB16v8iKoPtSlTjig6MK86c7--Il_Gc_1763546052
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi all,
we just merged https://github.com/coconut-svsm/svsm/pull/853 that
should move all the build objects of libtcgtpm (TPM, openssl, libcrt)
out-of-tree, using properly the Cargo OUT_DIR in the Makefile to put
all generated files under target/

As Jon reported in the PR, there could be some leftover and the build
can fail (see https://github.com/coconut-svsm/svsm/pull/853#issuecomment-3518566049)
so I suggest doing a distclean in libtcgtpm:

make -C libtcgtpm distclean

Or cleaning everything to be sure to have a clean environment doing:

git clean -xfd
git submodule foreach --recursive git clean -xfd

Note: this will remove all untracked files, so be careful if you have
something untracked there.

Thanks,
Stefano

