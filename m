Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B5134678A;
	Tue, 28 Oct 2025 17:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761671411; cv=none; b=IgsCLVCQNDNmOUgBni37ko65wat7lzX2xxxZ461eEYt3mOg4E0O74VVqEUsf2CyF9YVwbAUGOz7FJQ73lcEgudyes+dE0xfLyyPQOufgYq7BaB3IeJl8gzCgLHLMXYUJzLZgRvGzqgL6YbKtInvUA6a1kpZockYt2te2dcG2vpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761671411; c=relaxed/simple;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rDrpH/MrtSALzQ/anqTIH6iQ3Gal5sePUylkdkLebsrRkzQGvkv/DgH45iNlEIhM4+lScFFwdk8jmHoxQbX6GExlnmFBjUruYsiCset4i3QTJs5CQDtEPFk4LTQHzVlF2I9QTueYVUcjTXXE499gePYyMIR2NYf9eP7e+0W8udE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=pjMNFoiA; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="pjMNFoiA"
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 83B1359986;
	Tue, 28 Oct 2025 18:10:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1761671402;
	bh=HvavW8VkofQnxOqfVQEAgSIGxDbgCX+Dce+BFYqWQ+0=;
	h=Date:From:To:Subject:From;
	b=pjMNFoiAU/dnBDyB1ie0AWF/UmN/m9PRMOkMx9tq3VZkNUhpLhQH2s8aPWpF4QLKN
	 O0Kp8MsBvYK+KWIFRkir831rF7cCiuLcv2lzRcNFzqV17nhorbKQr1g0mMDE2zKDPK
	 /prJLPYh2DU8zJWgO5HEavPJPpDpYWHFYzDxxHzLhekdFd+3xkjimGcQ7a9N8UQoij
	 GPaR+LDkz+e6TTVtsmdg58w15sZg8vjIvuSJreT7GJFA3LcMegvidY2A0UP1i0zYSF
	 N3dXOxkRzm7r6rAGTzsRSpa06FTjN2rsHGN0ZC2wjbpPVp9Cw876vyjgS0ZXzXRPSw
	 KBYaR9d/MASCg==
Date: Tue, 28 Oct 2025 18:10:01 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call October 29th, 2025
Message-ID: <sleat6kdqvomm6mu6jxactmod6r56apnv45wgnkzjfr555ydvd@ezj4ihcmwtpj>
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
