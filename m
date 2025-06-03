Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1DE1E7C11;
	Tue,  3 Jun 2025 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973598; cv=none; b=C823jWigUWuBNTgPA2PwwyxOjBnmAQZSvs3ZmDoRQEGoke6CXwfUUUeQnhss1NFaz6tiLBtekKyTpnpbKhDB3enzRq3D61BpjibljySb+JcHiotLHQbswH2xSt1dI1LLQHKE1iesotNQBhmuhECD4Rbh6OVI/HvI5ddZxhhpsHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973598; c=relaxed/simple;
	bh=EFRVr7gpbegQaIKBbFs5KTf9HdEpTpah9r8joMRWddU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HaQT7pTeQXMCQ0K86wNkJv3kKIDmnYfiEHmPW+6hJAvrk8dRghy3edhstWQNv2Rlo7Cy8lyeuKNzutGNCJEcjWOb8laWiOicVi/VIN86enKfQ0NXDaxP8AZP6WjT1+TJSKgPQU8Hx+w1TgHbbvp7r2q28VOBmLJc2UixhbbOWIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=XYRGPdzy; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="XYRGPdzy"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C5C714CB36;
	Tue,  3 Jun 2025 19:59:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1748973586;
	bh=EFRVr7gpbegQaIKBbFs5KTf9HdEpTpah9r8joMRWddU=;
	h=Date:From:To:Cc:Subject:From;
	b=XYRGPdzyiVz7rCfIMM+0PmRPlHprUULQXIzOs+OXCEFLzvZbMSIImYSZ7mFZ749R0
	 NRpDq2gK6W5hNPeI+LMo+EAygZ0FLCI51GFalZUngcQwrV0I+BLm2rd4Uu/oeatKWO
	 F18hW6dFvrYSXwn473/ppdjZydISoRz7bu7J5T+LCEb2/iG6It0Zoh3dTUGJavEWP0
	 lEYd3cyyDuzYF1RImjq2K3CAnXi79yhT1p4U2sSQ6ieZDBZMI2Fhv2Ox6Ej19/TYRd
	 fDAvwhE07b1clUBoRHtML5nv7xjOu+y/Y5Je5wRqMPs0xZm50eTuG3mmsdCLZmL/SG
	 9QH3dUCM2xnyw==
Date: Tue, 3 Jun 2025 19:59:45 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: SVSM Development Call June 4th, 2025
Message-ID: <qiyips6sim6wocgiqse7fjzy4xltkfd3raj4xchjqdlzupegsg@xfgj7iwj3a5x>
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

There is one item on the list as a carry over from last week:

	* SVSM TPM protocol changes.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

	https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
