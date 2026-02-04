Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047992DC336;
	Wed,  4 Feb 2026 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770241817; cv=none; b=D61NxR7HXDTF+kuK2p1F3VFA+sfUky5B/j7abyR/H7khq9lSGf36k2zjkx95eVMCsooL6SqDnW4U4vgnx1DLk5UwNhQnzaL+51jgz7AZZCMAloka18t0XTQnkqYDIe9cTecPNE35jpJ8b21S9B5VJrF9r0+IeRt6xxs8JjvxoPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770241817; c=relaxed/simple;
	bh=MySbuisgv+1azkZVoCl/JOmkABe+KIiXhSoQBE5uvCA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeRNlPToy/VUJDZMWrQrTx9S4/0YvFIzu/B26paGdb9QAFfmf3QE0utwoAjGoAHB48XFrjoWpEtTUQIeOas1J2ZA6IhjrBEcAb0DCRsKQVwUMO1Gk33k0NeaQC6V9YaIVKU6epBu7CF0dJXhEM4EUTTJJ/rTzlyob0gUwsSaIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=wrSy8AYN; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="wrSy8AYN"
Received: from 8bytes.org (p200300f6af1d9600486976f8ca026a42.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:4869:76f8:ca02:6a42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 189461C1070;
	Wed,  4 Feb 2026 22:50:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1770241810;
	bh=MySbuisgv+1azkZVoCl/JOmkABe+KIiXhSoQBE5uvCA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=wrSy8AYNl5wJpiV4zNb3BkGVYtmj8RiecD/fPPqjO7ltvvnmMrYXjZECOT3IQIQ37
	 3ek1kUgmQYrWTXZ+RPTn4Yx6vzoV1yGvtfzrkrhjYwK6y4ciqA2kg2A/6YCEj/kLTm
	 WFhNSOsrFG5m8hy7ZKYlpLHRPCYvK7cl2/lA9+gaq5oHf6NhRi86H1PeiYTFCyGkk7
	 ZrbdMzhtWOIn2yTaZ0i/E+EOEBtgBPaOuzG81RDHptgNCSRolD9BYRqjxRsUu+kpoM
	 V5FVv034elyXy4RZsa1yHMMrtXBulOti94/1jZVoTH0Iq4+D//wLXK2PUWZnTqwRfz
	 kZNHvZRg5BHdw==
Date: Wed, 4 Feb 2026 22:50:08 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call February 4, 2026
Message-ID: <ve3efrbi52epkqaumwhmdh7xuyweq7qpgmrycz7fbjyx7j63jc@zy3zoxqofnov>
References: <lcirfa4dfkyv2522vuwr4dth2lbzi2sunhcubojuarg6v2myfx@bf33fftemnmj>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lcirfa4dfkyv2522vuwr4dth2lbzi2sunhcubojuarg6v2myfx@bf33fftemnmj>

Meeting minutes are ready:

	https://github.com/coconut-svsm/governance/pull/95

-Jörg
