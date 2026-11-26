Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696024;
	b=AVpRFjupx3YUan8kPO2ZgAe6f4xLNc9CqFgjwnPNshU63UvJm/D7KD/afUwSODLqAeOx
	 898pT//4U9c8U3SN4nOM68ztt61A+x4UQ09q4hiU7jEQwjNnSVBk2TMKNDWQ/v/YP5TRx
	 RKlLgjlONfS+E+Om5Wi7WuHb4FGUhOkRZFpcmJn8R2bj5z5ahGQlFwEdztOC3W8aA6eSC
	 eDPnn0FqNmghBUna/x2pNp2gcMybXDNt8T75zawkiXa526UF/Rjfks1OLgRT0VW2ogt/k
	 wMOJv9sUlNO8yc/ApqfJqIo0snAOUqkcEd3kbtuZxrLO7IZWDB1WEiBZdJLCYLP8JSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696024;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SxG7jOSmANhAzPJ131uKeZbnITfGrLRSHPAl8PZKjxM=;
	b=5i0wQ4iUzkHyRep49r3b9KKtO2lMfmoC2MQRUhDC3/j1VbuybGuIkg8OzkW/9FfNj+ne
	 KqmL3RNYeWDTQTgZX8G3ODL/BNP0vA+FRjfBUeGzClxK7k7FhSzGOYfbFgusZkDBw46E6
	 9jSbbWvD3++bSEUn+DMC6sqh2Z1DuJmrDqTUN3IZfHQSmwqOxK+8PCVZlFlnjlaMkmrzL
	 1MGp5Q7xOLN/Lv0csOwcCV9+gkHEsnvIuF5dPH/jwzhRoDq+ajLzO8cRgKjyWPua6QY8n
	 72j4KuRgHLJ+R+R7op5zfZPYJ0t2RFXzVthyzSk+KqAMTiMsR1czRPbo2W1EyqFzxfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A22606A31C;
	Thu, 26 Nov 2026 12:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A22606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5A826245135;
	Thu, 26 Nov 2026 13:27:01 +0100 (CET)
Date: Thu, 26 Nov 2026 13:27:00 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: Discussion on policies around minimum rust version for
 coconut-svsm
Message-ID: <awghLkAIUMmX0Ja2@8bytes.org>
References: <d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Post: <mailto:coconut-svsm@lists.linux.dev>
List-Help: <mailto:coconut-svsm+help@lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:coconut-svsm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>

Hi James,

On Wed, Nov 25, 2026 at 12:55:23PM -0500, James Bottomley wrote:
> I think the coconut-svsm policy should be conservative; i.e. we try to
> stay on the lowest possible rust version, starting with where we are
> now (1.85 but shortly to be bumped to 1.90). However, if any forcing
> function comes along that version should be increased. I think the two
> forcing functions are

I agree with the assessment, COCONUT should be conservative about updating the
minimum required Rust compiler version. There are some constraints to think
about, though.

>    1. Language feature we really need to help with or simplify the code
>    2. cargo dependency hygiene (we need a version of our dependencies
>       which is current with fixes and they may require a newer rust
>       version to keep that currency)
> 
> but others may have things to add.
> 
> The other thing that came up is that eventually coconut-svsm will have
> to be shipped by distributions and that means its minimum version must
> overlap the build versions that distributions have chosen, so this
> policy has to also be informed by the policies the distributions (both
> enterprise like RHEL and community like Debian and Fedora) are going to
> adopt ... which at least Red Hat promised to think about.

The distribution policies are the main uncertainty for the project. We fully
control which language features COCONUT-SVSM is using, but not what our
downstream users require to build packages.

This can become problematic once COCONUT maintains stable release branches and
a security issue appears in a dependency, requiring an update which needs a
newer compiler version. We have a similar situation right now with PR #1277.

I am sure COCONUT is not the only Rust project which aims to be packaged by a
Linux distribution. It would be good to learn how the distributors handle these
situations with already packaged software so that we can adapt our policy to
their processes.

-Joerg
