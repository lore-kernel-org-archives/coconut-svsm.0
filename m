Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A192580CF;
	Tue, 28 Apr 2026 17:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777397268; cv=none; b=tRMdN2D5z1YBajym/L8+h3sCE59N6C7n5rb1eobUTleB2EjsZr/tSGm9WLaeUqvxFP2TXPfrG+poOKblAUU1diDxQG6HZK+hLmhCkPpDyW61Z/V6cuat8Dd47NQr3EQIwg48zdjLOqrvDiBGyZkz1p7i1JbVQCFyvr0a3sWsydA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777397268; c=relaxed/simple;
	bh=6+ZpI904uEujfBZXjqlIxCJY2yC2ILUb2C9nYCkNRPs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZC5113Awg7FcYbFjtwVddOuLS4WTQ8zctWAszlKw9byyclnvr/z0Kp+kv8+ovHJt5U/8f+wjjSpVv/5+7G/qJkQxWYY0uptbto0Pp+8m1ZPn/mHLqJ3eydW4XmHLlT3O83p8Dh3TdQhV+EItrM08uoDV9+DzgHHP3R55SgBgwsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=loyhw45m; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="loyhw45m"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DA5A6200AE2;
	Tue, 28 Apr 2026 19:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1777397264;
	bh=6+ZpI904uEujfBZXjqlIxCJY2yC2ILUb2C9nYCkNRPs=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=loyhw45m39srACvUC6EuDj76KHAUAqZB80a+NYORRDBsHNQJyl6vX3vUchLk2xMZW
	 LWwkxA11bZqi2kpRlXaPm3xKs5zgq4+l59rMahporj1giJvcE1tq3yaQMndvHxxNOW
	 Bbhn99yd+8hcOhgUZ/XkOo2v2E6V6kJeubAVlkURI1zBF9d1va93ay+DCtuGZLigP3
	 iqdx4v/KNisxZUg1hVjaVEdqL6oU1Ek3f7GZ7DWoyg9jzWiskAJkLmYAzQSm2bnyyF
	 tB6NQAQI/3nGTIrWqfJr9XTcKyVhUC+p2uP8XaG7phNubTCJoTll4PpXwfaBgGErti
	 pJg3Eae27Hygg==
Date: Tue, 28 Apr 2026 19:27:43 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call April 22, 2026
Message-ID: <ovh67l5j6qz5dwrb7pfaa2645sibwsfgz3taeootzz6vnwwqwy@jx5cplbwzbi7>
References: <ymracc35f44xtep4zvexdvqxbh2sfudsnnvz6nrgj56wyxaekv@xrxkyzbpdohk>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ymracc35f44xtep4zvexdvqxbh2sfudsnnvz6nrgj56wyxaekv@xrxkyzbpdohk>

Meeting minutes are now available, please review:

	https://github.com/coconut-svsm/governance/pull/105

-Joerg
