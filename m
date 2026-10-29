Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254875;
	b=OjwUrIUEKZ5dgqo3LnKEcQLHPEUMtz0WzwuL3QGG7+OJ8qoP2zWpxBNFUg78byQ4ZgA4
	 Jfcdub2E8Dz+h+1KZ6AfFpMd2wsd62TOKl6MwUoJGCzjxrQAzE45DSeVXD83wwa6wiEoX
	 BcEUXs2RLs50SwpKIcsMhWSR7A7AaGi1lXIlcD5DJ5l2++wLYYLcn5wV2SbDMjLvT5FD+
	 wqBzXVbKZYQrcfS9mcy+Solp1oDduZv59Qkz2MJteoLL5whqpzg65Lrr07oywXOijZEVH
	 mQ2fj10fP3vRi/Rl87gSUaV1+z1cvw2TpCUTDKDPw23eqfiVaqdXfFyyfwjhTJ4Zq/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254875;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ndJR6vj783EasJlV+DV7uCGhH6MdfElunjn9exABMio=;
	b=vok7M7stEBLj4IiTU/VgBtTWQnFZlpfrgDS3Wf+eoWCckpA4Uy/qDESquegizWb40NxM
	 NFy8UM5XCzOIZp8q7KsQuC6key+JogIftYTcec4puUMI6/YNUJv8bs8A6jmywKPfdm0ke
	 3UetIeVrefnhOPv9AuOGPFOlEUtdT1wMhNE9tSdR9BOssSNmnRMyim1ZLV8VpDtwhUtfn
	 4o2kQtto/Z8EJuNF8F+u6HyAuka56+1ZmblaCR+1BKcR8JLzpAh7N+FShVjyHHyQZ4vf6
	 Qm1zh6JDuXhSUzYe2J/4vmDJxrM+D0y27DphDVzFIwoduV0UNK/9rTCYARTKTwp9xpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB028606A320;
	Thu, 29 Oct 2026 06:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB028606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a00b6caf379a46f4267.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:b6ca:f379:a46f:4267])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5C7BA242BB4;
	Thu, 29 Oct 2026 07:21:07 +0100 (CET)
Date: Thu, 29 Oct 2026 07:21:06 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call October 28th, 2026
Message-ID: <auLlwujgyq4mcR27@8bytes.org>
References: <auDFXgVCzNA-AeRk@8bytes.org>
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
In-Reply-To: <auDFXgVCzNA-AeRk@8bytes.org>

Minutes are ready:

	https://github.com/coconut-svsm/governance/pull/127

-Joerg
