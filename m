Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632934;
	b=rFKnekWPwP+VT0KrIgMeVMRJZTD5lbXlBj+jq/FhEp+V5GoN1rWFyLYzmvt9baSrktSy
	 r54pAmDLsDh8LC5IMA5VLgWFzsA8MC/d3PjoqLOt9p/EhsGzg6gVnzWXmgDPn20KDjhkZ
	 3WmeedQlg0HR9hgeQ5svZ+9BHHa4M5u33XJxE1Unn8QFIcc5FgNlc4mwyHzoauEon0U4h
	 Dk7gZajympzX3mcI6UVWXCbb50JLADistfw2sX6m4gCaFRXXgDjGlZHSB7Sik4UcXhQQS
	 Vz+c1s9wNaA+Xz0eBibZmth2dUVmHM9Kpiatc3prujdeEG5SeE6k/Feufn/2RQLiv1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632934;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=g8JqJd4sn7SXVhHkSO+vSWUJcpX8M5Yc1RkU1hzGEPs=;
	b=g3laqh3oo43D+CeWr8kAjzCysbiazv2yU17VadLGpAKCcwZGDn9pkYGd2KGLv3K/c+Yf
	 mZh1Vr3/iCrnNR+Xw5Ui1yaCeAhc3h7fb6XIzVqgOTa3mVmBwBBdE50tEAbWDaiGo90zK
	 yC5ep7UOYWB7TK1yRiodoePTMxdpY4WzMzFLoLBSyRuWhSAF7sx48vNaSDyti1eyvf4SA
	 8cK9HbpTXWYaiYcZ3qoY+yRro99hE2W2YoQgf3YqAXXFIqZIe4VTlZdqo1Z3/7aWfMn2m
	 4gNYailRLVqDR1DUW8g/+2Avp41FST9qKyZHVVxmH8P8cR/i1ya0bnOzED/kEfU452w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4406A606A31E;
	Wed, 25 Nov 2026 18:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4406A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 49D6724282A;
	Wed, 25 Nov 2026 19:55:26 +0100 (CET)
Date: Wed, 25 Nov 2026 19:55:24 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: Re: SVSM Development Call November 25th, 2026
Message-ID: <awcu4sszhdB7AsfV@8bytes.org>
References: <awXCnJhLBvX_fRyX@8bytes.org>
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
In-Reply-To: <awXCnJhLBvX_fRyX@8bytes.org>

Meeting minutes for the the community calls of last week and today are now
available in this PR:

	https://github.com/coconut-svsm/governance/pull/129

-Joerg
