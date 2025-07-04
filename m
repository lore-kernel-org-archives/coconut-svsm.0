Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17576140E34;
	Fri,  4 Jul 2025 16:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647187; cv=none; b=TTG7bBhkjBnCKqp4leWO+dRSSrQ7sOaxZNp5kuD97svdlWNCdiJUHnI397HPhpbw3oL2CDAy+zMKyweSkToUV3uEb5zjRV0l7UuXGyOaTFJsqNqs1ZdyZqh5uZduCC5Q6k967VPn36hNIsosHVP/40trwjN+PzcUlp/3w5S/WCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647187; c=relaxed/simple;
	bh=m+EpCIwsDUcrPvGhsA1PCIc2POe+vB0ga/ATIX4aNJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHw+t/BnNHHZvQtqk1MSLif7pQuD95qu+3fODX2/lfCNMk7b7lY1f4nEjho2qc5ul80JMmLywPlyP/gaiSy88Sm7gOjxs241y2Lf6CjKZ4tLUoMmk4OocHqUlC7EvvKm175ZUgZ+OTIcrqFT0XicZzSHNUtCDC+cr3KR178s3DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=5U5Tqd8W; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="5U5Tqd8W"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9AF274FC93;
	Fri,  4 Jul 2025 18:39:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751647183;
	bh=m+EpCIwsDUcrPvGhsA1PCIc2POe+vB0ga/ATIX4aNJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=5U5Tqd8WGYaPHWQkaoER0LPvMwwm+J/cKTAdLhFNyM1zCz8uRDMISfGgD8v8C1oY5
	 3EqdnT5KrrptvMe6gV0zqhkmsSdI1pAhZZNKdBK5tVB4b6VX53uA4kdXoK045v/poJ
	 L+Oq4SuGzZC0MXeovI66ZtTDl5u4j5Xw1RGSIGu00PD88uZmNHL6ndHV0tIbLuxMuW
	 jPmEQOyvah7S69f1BKqb+HFI4DRCaYqdubM3836HHcYEffL5yKICnLD68bdghH/sJe
	 OddWnrDN/7qyTOnnXlI5hsaFur81H/wbKqQb8xJwt33Ae2AEBxwSlJfrMESMeV/AHX
	 iGp4MOO/B2jPw==
Date: Fri, 4 Jul 2025 18:39:42 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call July 2nd, 2025
Message-ID: <4qbnbdno6hof3llfemhxc4prm7x2vzpqmvjknykelucpqhyryz@kbgpmaoy7vmz>
References: <sn6mqb3jmijz2mxur2fxow4wp55ljfiwhem5qzsoeavhsutjbv@iaunp2gqfs4g>
 <lirgc4cvbgr7wxuci2paqggsdzw2wcfmn2dtg6urorqmjpjhtk@bof63sgjpihg>
 <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vpwzlcdbpu3kdshsgfshwfldqm5wtcesblwa7gzwyaf3tgtqwp@2vh37q57z2xe>

Hi Gerd,

On Fri, Jul 04, 2025 at 12:36:07PM +0200, Gerd Hoffmann wrote:
> On Fri, Jul 04, 2025 at 10:12:03AM +0200, Jörg Rödel wrote:
> > Meeting minutes are now posted:
> > 
> > 	https://github.com/coconut-svsm/governance/pull/65
> 
> <quote>
>   SVSM deciding its memory needs and informing OVMF. Peter Fang started
>   exploring this, but it's not trivial and will take time to establish a
>   good protocol for memory consumption and handoff. 
> </quote>
> 
> What exactly we are talking about?  In the call alot of the discussion
> centered around tracking the state of pages, and it wasn't totally clear
> whenever that was an independent discussion or not ...
> 
> From OVMF perspective I don't see this as a big problem, assuming we are
> talking about static allocation.  The memory discovery code is designed
> around e820.  Typically OVMF simply loads the e820 table from qemu via
> fw_cfg.  But there are multiple ways to get the memory map, when running
> on xen or cloud hypervisor things are handled in a different way.
> Adding one more option for svsm surely is possible.

The idea is that COCONUT provides an IGVM memory map to OVMF, which takes it as
a base for its memory map instead of the E820 from FWCFG.

Longer term it would be great to fully enable OVMF for IGVM, so that it can
also consume some of the ACPI tables from there instead of FWCFG. But that is
future stuff, what we need for now is the memory map.

Regards,

	Joerg
