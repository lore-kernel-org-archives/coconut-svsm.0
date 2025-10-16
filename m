Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6821E3254B0
	for <coconut-svsm@lists.linux.dev>; Thu, 16 Oct 2025 07:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760600011; cv=none; b=Fbv6ndevha9yK6Y0Yp/jFLON42fnz3p40eqbCXLeSBd5o+JPU1Ebe3xhYff8ibe/c0seajeYiHuFjO9acLc2kE53rC/vGOtqi5DpkGyyLLwWiOAUyp0JFiZA9z5Eqwcb/HSA2XdxEYzMdqAoSKuF0a/hkRqoaUFjv9rLlqmR908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760600011; c=relaxed/simple;
	bh=BBPLelYhjpWbyLFzeUNZEDt8AdBmWPq1e+jpgTAuzB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ho27pqxhkC+f5N8Gfb2WCFN6PIo/htkYUwlImYqqa1MEOW9Kaa7NDlD30vH73D0f9Ab6rK8DZIsua2GJuFPkXfe4/QaV+pFlpG71NdaeSrgRSSDu6geZ73lt4xxMxORpiTxBsQt3ZrHTCEpkIUC4+TVcWAKFo9kCSYOR5oIZbBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=jqc13Qjh; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="jqc13Qjh"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1E8125819E;
	Thu, 16 Oct 2025 09:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1760600008;
	bh=BBPLelYhjpWbyLFzeUNZEDt8AdBmWPq1e+jpgTAuzB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqc13Qjh7p02MklKhhZPujNofTFA0+S+2vibxU5dK8HiqvDC7wizms9JbtlGeQdfJ
	 46hEbmofhLZ9NMk4sHtdlMTWrKogEcN30XCrIQpsz6pR+i1ftd7bW3F6Ark5GzEfWO
	 UQA4PgGiCqeQD+UdikIJaKUBdlwQAYz8Mo5HA8lXFEy8l1mviPmIYvTkQ2wcfHLZBn
	 Vi8bBs2rKkrgEQqSAVpZJvmwTh2szMfTiyTTTxsDP8es4PiSsndcETaKMufmgee3w5
	 1+LO3jEIQcOjbGLbhdvW2RvPsDPeO0zdPz1bgWOgJLeSWERts7wkKIZ1dR8wuLoidt
	 zmUIJ3K9Xi/5g==
Date: Thu, 16 Oct 2025 09:33:26 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Luigi Leonardi <leonardi@redhat.com>
Cc: coconut-svsm@lists.linux.dev, qemu-devel@nongnu.org, 
	Stefano Garzarella <sgarzare@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Oliver Steffen <osteffen@redhat.com>
Subject: Re: SVSM device assignment: device tree support
Message-ID: <pvxuvrkfkyyuhj4ck4x2vqs5663v2axtvnblq6r46vsohqmmp7@bym5ooygzdlx>
References: <CANo9s6kqgmSa4w-DkSRDqRw9gw0dBEmaM4yenczA+1uh6ZL9Pw@mail.gmail.com>
 <ybpr7ctlwxzadwzhzmgxkycwcvnisloujq6wuvirdnokfnae2b@2wtitjynh325>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ybpr7ctlwxzadwzhzmgxkycwcvnisloujq6wuvirdnokfnae2b@2wtitjynh325>

Should also add the Github link:

	https://github.com/joergroedel/qemu/tree/planes

On Thu, Oct 16, 2025 at 09:26:47AM +0200, Jörg Rödel wrote:
> Hey Luigi,
> 
> On Thu, Oct 09, 2025 at 03:20:08PM +0200, Luigi Leonardi wrote:
> > -machine [..] svsm-bus=bus1
> > -device virtio-blk-device,drive=svsm_storage,id=dev1
> > -object svsm-devices,id=bus1,devices=dev1,dev2,dev3
> 
> As discussed in the meeting yesterday, here is my current in-progress
> development branch for planes. It contains the Machine and QDEV properties to
> assign planes to devices.
> 
> The commits you likely need:
> 
> 97a524149cc1 qdev: Add plane property
> dc9cfd1e2e81 hw/core/machine: Add device-plane property
> 
> Let me know if those work for you, and feel free to ignore the rest in this
> branch.
> 
> Thanks,
> 
> 	Joerg
