Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696300;
	b=GB037JO+aqEKMIK8m/SPTnNZi1p74Bzc2T6ZqcDm1BEdNpLpi6fezK4enZMXa67VqBB1
	 k/6bjsrjB75Nq95oC0BLSrva/rVWs7z+rcFECLo5xzBedIBLcM2Tf9v9+8CJ5+DOwbYt1
	 742Ej6N9497uhCgppzo/p4Jt9U0mW7BCl6xmWZijbM+XlJmw3E+KQ4PHxxWaulHu2pnqI
	 EHDIzhMbGUoJolzGEiCT1M0ps9JlmJW3ORDsMT4o8fLTKJFXLT7bZbKf6NqcXmoUAgf50
	 AvVTT/wZOEsBdvXQSHsf7aHE0OMk2S9AYj4h4qJFtrgdw6YYMKg2cKUO4qFx+GavLww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696300;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9pjFO9VMweC+Nouob3pkB7E9uxVHQ59talg9fuc5M5E=;
	b=pncj05kw5736umZfazPbAM4lVaVZjpBpySc4wcOiFzNOqzL8rdZ7Y7lVLpH4nLxVmCCY
	 bzFin0DcF9h82gasowH1CSlXL8zdX2MHcTGL3Ge2Iim8JPBdEZDYie/toA7D40qQvrXeU
	 /Z7mnM3zQMei5+vKTmdmEH8+oJ/DK+qeXSiIOQuk4sR5gwhTqw01eQPhPWnYhqoNwHL+K
	 Mj6/2GzF2STXpVpIv/boVrBMj3qCuPA9zzkyn6s0nDRfgX8LfzOqNnFl1aJEdBvqUzRZ/
	 85+gndzZ6IomlsishimoY7dw3wN0nvoh8jsVZ50SIj1JhSU4V2pX5m9YS6jNTxb8lJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C962F606A31C;
	Thu, 26 Nov 2026 12:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C962F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id CF0DD245327;
	Thu, 26 Nov 2026 13:31:38 +0100 (CET)
Date: Thu, 26 Nov 2026 13:31:37 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Mahmoud Nagy Adam <madam@amd.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: Discussion on policies around minimum rust version for
 coconut-svsm
Message-ID: <awglpsRXwJRS7aa5@8bytes.org>
References: <d79ddac2ab65877504ace5a1fa2eab9cab3d5db3.camel@HansenPartnership.com>
 <65vkyfqwo92zb.fsf@amd.com>
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
In-Reply-To: <65vkyfqwo92zb.fsf@amd.com>

Hi Mahmoud,

On Wed, Nov 25, 2026 at 07:32:08PM +0100, Mahmoud Nagy Adam wrote:
> For information, Rust for Linux already has a policy for this: their
> minimum Rust version follows Debian Stable's and is raised some months
> after each Debian stable release, so the kernel can always be built with
> the Rust that Debian ships
> (https://rust-for-linux.com/rust-version-policy).
> 
> We could generally follow this policy, unless a forcing function (a
> needed language feature or a dependency fix) requires a newer version.

The Rust4Linux project is in a different situation. They do not use cargo and
vendor all external dependencies to maintain them within the Linux source tree.
This gives them much more freedom to set the minimum Rust version because
constraint #2 (from James' email) does not apply to them.

Also Debian stable uses Rust 1.85, COCONUT is already on 1.88 with the aim to
go to 1.91.

-Joerg
