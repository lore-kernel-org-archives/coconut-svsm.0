Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2274E2D4B73;
	Wed,  3 Sep 2025 05:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756875604; cv=none; b=asOEeu/MCWqtHUXit5KDBv/CNlfgopnTJ9VKRvLwHRlMklbEy8EG4uWH5QDQJaLndIYj7Lr9helFcugHn9MAFSQZyZkYkT96HjwpGPtZLupal3Aww4b7mK79POv4TxDE647JjcaHzVfNCobbK4EES+RQD6LKX4X9PKcdqjwzFD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756875604; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ttlqv7dfcM7SdjlFWQiShoYyuIXFpO6Xz2QlJc4b0QJLAAfQ4r8d5Jopmp9cd8Y8gyb68AYURRLRLp4Ela98l4gDK/Sqmb6qlRfYsrP8/QTVYL59pOy2LB3BdOdq53+8A5sc+dI1/cCRoovUUvqgMNAp84Y0oLCskdViNYhqAs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=5Czfmn5K; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="5Czfmn5K"
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AB6424C392;
	Wed,  3 Sep 2025 06:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1756875594;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=5Czfmn5KSpx/ZpJF2+iBbG9PhFiNfNHZ6bMFYDBJdmisxpSMyaNxzDP32LZiR8JXG
	 FRy200wqTvaqaC5BgPcCTdymJbj4WYCayInEk4CG/lq6iUzODa4JZAib8iPxIeap/c
	 ley0jKzNs/HNiZTHQuAXm7PmV6sNPuGEomzIfWyZUUrTdeWD3zUxoBJZD7O8ksWxVv
	 SAfZTdLOHBjTJjXvmlkTlXTGNWm6H2hQKaADiqE2jyDeUJW//FxYVWEVejCXJIKcpJ
	 XCDhVwMQSrjuxVdSr43kIJvuZ34jHik2xIVrknEVjZ0T6aCP+9LBN27BRuOcRv3wa7
	 xWpy+GwLJHEIA==
Date: Wed, 3 Sep 2025 06:59:53 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call September 3rd, 2025
Message-ID: <vvkrixk2d63aenzhhlxemuq3chdk3rbr4jg47g6xki4bbcf7bv@ws454kzw2mxe>
Precedence: bulk
X-Mailing-List: coconut-svsm@lists.linux.dev
List-Id: <coconut-svsm.lists.linux.dev>
List-Subscribe: <mailto:coconut-svsm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:coconut-svsm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Here is the usual call for agenda items for the this weeks SVSM
development call.  Please send me any agenda items you have in mind or
raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
