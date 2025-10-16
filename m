Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FFC2DECDE
	for <coconut-svsm@lists.linux.dev>; Thu, 16 Oct 2025 07:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760599611; cv=none; b=fTrxMb3Q5lyI+tj3ti4nVTJo6EcP7OwIGLJb4S/79o5HSuUaXInl781ke1wpESYO4hUWihPC4SI58g1FC4NHQ8AyDNQunEbc3pftLWmiizMQ9pBZwJj51/dSmjUlgzjRXqnWmEAPDwNQG5V0WR/3sVZdvlIbZmM4ycOHcyjE7x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760599611; c=relaxed/simple;
	bh=oPHASgBJdp2YQpxgFo3iZagWHBBvcIXbuFbVs8R5f3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnCcx37v3xPRrd1zT0bO6ANZVerFpv75OuT0LRJ1yXY09pXtNo0Q4UNsreWI8Hn06gjezMdoxLniitS9not1fPtx/I1vtw7PlaKbPHKVN2NopdFdO1gV7OJ0Ncb98AuuCjDcjc4rRBy2vc3wnuD7y99rh8iO/pwvbAkucSpy+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=qzzCVLi9; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="qzzCVLi9"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BBA7C583C8;
	Thu, 16 Oct 2025 09:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1760599607;
	bh=oPHASgBJdp2YQpxgFo3iZagWHBBvcIXbuFbVs8R5f3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qzzCVLi9hnOj5twx11gfP7Yen2bBmZUxFGO80DGM61vcnIafkyy3f9asAcyRwHSj/
	 OL23uwDoUdtpodzP+YBUfeprxRv0pu8J+8Co3niiRUf8RGGcBRt1K1DMZKmXtTfR4i
	 ZDUj2wSQ3yLYwvzzHCPdPnhEa5sy3RtwqzGBFJ7SOW9o10qCK4Fx0eez9s7PiHmW8k
	 hqTVntkRenO2/JTzytep5QkpIONfwAgQLdJICHpIvqZj2A6W/4MZjPLlbUqLrVAXUQ
	 1/mwY0dXm8b9RKgg/kwvU72nv+DbJuLI2GKVJ5XvoWmbE/6LPSKB2Mdktn5frhP8TY
	 vNlH5UNpbEJlA==
Date: Thu, 16 Oct 2025 09:26:46 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Luigi Leonardi <leonardi@redhat.com>
Cc: coconut-svsm@lists.linux.dev, qemu-devel@nongnu.org, 
	Stefano Garzarella <sgarzare@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Oliver Steffen <osteffen@redhat.com>
Subject: Re: SVSM device assignment: device tree support
Message-ID: <ybpr7ctlwxzadwzhzmgxkycwcvnisloujq6wuvirdnokfnae2b@2wtitjynh325>
References: <CANo9s6kqgmSa4w-DkSRDqRw9gw0dBEmaM4yenczA+1uh6ZL9Pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANo9s6kqgmSa4w-DkSRDqRw9gw0dBEmaM4yenczA+1uh6ZL9Pw@mail.gmail.com>

Hey Luigi,

On Thu, Oct 09, 2025 at 03:20:08PM +0200, Luigi Leonardi wrote:
> -machine [..] svsm-bus=bus1
> -device virtio-blk-device,drive=svsm_storage,id=dev1
> -object svsm-devices,id=bus1,devices=dev1,dev2,dev3

As discussed in the meeting yesterday, here is my current in-progress
development branch for planes. It contains the Machine and QDEV properties to
assign planes to devices.

The commits you likely need:

97a524149cc1 qdev: Add plane property
dc9cfd1e2e81 hw/core/machine: Add device-plane property

Let me know if those work for you, and feel free to ignore the rest in this
branch.

Thanks,

	Joerg
